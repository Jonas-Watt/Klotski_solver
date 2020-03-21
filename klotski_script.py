import numpy as np
import copy

# creating pieces
'''
pieces = np.array([[[0, 3], [0, 4]],
                   [[1, 3], [2, 3], [1, 4], [2, 4]],
                   [[3, 3], [3, 4]],
                   [[0, 1], [0, 2]],
                   [[1, 2], [2, 2]],
                   [[3, 1], [3, 2]],
                   [[1, 1]],
                   [[2, 1]],
                   [[0, 0]],
                   [[3, 0]]])
'''
# creating easy pieces

pieces = np.array([[[0, 3], [0, 4]],
                   [[1, 1], [2, 1], [1, 2], [2, 2]],
                   [[3, 3], [3, 4]],
                   [[0, 1], [0, 2]],
                   [[1, 4], [2, 4]],
                   [[3, 1], [3, 2]],
                   [[1, 3]],
                   [[2, 3]],
                   [[1, 0]],
                   [[2, 0]]])

board = []

history = np.array([copy.deepcopy(pieces)])


def draw_board(piece):
    global board
    board = np.full((5, 4), 10)
    for i in range(10):
        # X-Wert
        for x in range(len(piece[i])):
            board[piece[i][x][1]][piece[i][x][0]] = i
    print(np.flip(np.fliplr(board)))


def move(piece, richtung):
    global pieces
    if richtung == -3:
        for i in range(len(pieces[piece])):
            pieces[piece][i][0] -= 1
    elif richtung == -1:
        for i in range(len(pieces[piece])):
            pieces[piece][i][1] -= 1
    elif richtung == 1:
        for i in range(len(pieces[piece])):
            pieces[piece][i][1] += 1
    elif richtung == 3:
        for i in range(len(pieces[piece])):
            pieces[piece][i][0] += 1


def move_possible(piece, richtung):
    global pieces
    move(piece, richtung)
    # nicht au dem Spielbrett
    for i in range(len(pieces[piece])):
        for j in range(2):
            if pieces[piece][i][j] > 3 + j or pieces[piece][i][j] < 0:
                move(piece, -richtung)
                return False
    # Überlappung mit anderen pieces
    for i in range(10):
        if i == piece:
            pass
        else:
            for j in range(len(pieces[i])):
                for k in range(len(pieces[piece])):
                    if np.array_equal(pieces[piece][k], pieces[i][j]):
                        move(piece, -richtung)
                        return False
    move(piece, -richtung)
    return True


def solve(zähler):
    zähler += 1
    global pieces
    global history
    if zähler < 20:
        if not pieces[1][0] == [1, 0]:
            for i in range(10):
                for j in range(-3, 5, 2):
                    if move_possible(i, j):
                        move(i, j)
                        if not any(np.equal(history, pieces).all(1)):
                            history = np.append(history, [copy.deepcopy(pieces)], axis=0)
                            solve(zähler)
                        move(i, -j)
            return
        print(zähler)
        draw_board(pieces)


solve(0)
