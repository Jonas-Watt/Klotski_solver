import operator
import numpy as np

config = [[[0, 3], [0, 4]], 
          [[1, 3], [2, 3], [1, 4], [2, 4]],
          [[3, 3], [3, 4]],
          [[0, 1], [0, 2]],
          [[1, 2], [2, 2]],
          [[3, 1], [3, 2]],
          [[1, 1]],
          [[2, 1]],
          [[0, 0]],
          [[3, 0]]]


class Board:
    def __init__(self, board_state, previous_move):
        self.board_state = list(board_state)
        self.previous_move = previous_move
        self.children = []
        
    def check_solved(self):
        if self.board_state[1] == [[1, 0], [2, 0], [1, 1], [2, 1]]:
            return True
        return False
    
    def move(self, piece, direction):
        return [list(map(operator.add, point, direction)) for point in self.board_state[piece]]
    
    def move_possible(self, piece, direction):
        possible_piece = self.move(piece, direction)
        # außerhalb des Feldes
        if (True in [x_coordinate > 3 or x_coordinate < 0 for 
                     x_coordinate in [point[0] for point in possible_piece]] or 
            True in [y_coordinate > 4 or y_coordinate < 0 for 
                     y_coordinate in [point[1] for point in possible_piece]]):
            return False
        # Überlappung
        for point in possible_piece:
            if point in self.board_state[piece]:
                pass
            elif 1 in [block.count(point) for block in self.board_state]:
                return False
        return True
    
    def add_child(self, obj):
        self.children.append(obj)


def generate_children(board):
    for iter_piece in range(10):
        for direction in [[0, 1], [0, -1], [1, 0], [-1, 0]]:
            if board.move_possible(iter_piece, direction): 
                child_state = list(board.board_state)
                child_state[iter_piece] = board.move(iter_piece, direction)
                new_move = list(board.previous_move)
                new_move.append((iter_piece, direction))
                board.add_child(Board(child_state, new_move))

def get_path(board):
    path = []
    for i in board.previous_move:
        if i[1] == [0, 1]:
            direction = 'up'
        elif i[1] == [0, -1]:
            direction = 'down'
        elif i[1] == [1, 0]:
            direction = 'right'
        elif i[1] == [-1, 0]:
            direction = 'left'
        path.append('piece %d moves %s' % (i[0], direction))
    return path

def build_and_save_tree(root):
    root = [root]
    current_layer = []
    history = []
    depth = 0
    save_layer(depth, root)
    while not any([board.check_solved() for board in root]):
        depth += 1
        for child in root:
            generate_children(child)
        for node in root:
            for child in node.children:
                if not compress(child.board_state) in history:
                    current_layer.append(child)
                    history.append(compress(child.board_state))
        save_layer(depth, current_layer)
        print('depth: %d, boards in layer: %d' % (depth, len(current_layer)))
        root = list(current_layer)
        current_layer = []
    return root

def compress(input_pieces):
    len1 = []
    len2 = []
    len4 = []
    for i in range(len(input_pieces)):
        if len(input_pieces[i]) == 1:
            len1.append((input_pieces[i][0][0], input_pieces[i][0][1]))
            len1.sort(key = operator.itemgetter(0, 1))
        if len(input_pieces[i]) == 2:
            len2.append((input_pieces[i][0][0], input_pieces[i][0][1]))
            len2.sort(key = operator.itemgetter(0, 1))
        if len(input_pieces[i]) == 4:
            len4.append((input_pieces[i][0][0], input_pieces[i][0][1]))
    return [len1, len2, len4]

def save_layer(depth, layer):
    with open('saved_tree/%s.txt' % depth, 'w') as f:
        for node in layer:
            f.write(str(node.board_state) + '\n')

if __name__ == "__main__":
    solutions = []
    for i in build_and_save_tree(Board(config, [])):
        if i.check_solved():
            solutions.append(i)

