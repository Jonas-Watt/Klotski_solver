import numpy as np
import copy
import csv

# creating pieces

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

# creating easy pieces
'''
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
'''
history = np.array([copy.deepcopy(pieces)])
lösungswege = []


def draw_board(piece):
    board = np.full((5, 4), 10)
    for i in range(10):
        # X-Wert
        for x in range(len(piece[i])):
            board[piece[i][x][1]][piece[i][x][0]] = i
    print(np.flip(np.fliplr(board)))


def move(pieces, piece, richtung):
    for i in range(len(pieces[piece])):
        pieces[piece][i] = list(np.add(pieces[piece][i], richtung))
    return pieces[piece]


def move_possible(pieces, piece, richtung):
    move(pieces, piece, richtung)
    # nicht auf dem Spielbrett
    for i in range(len(pieces[piece])):
        for j in range(2):
            if pieces[piece][i][j] > 3 + j or pieces[piece][i][j] < 0:
                move(pieces, piece, np.negative(richtung))
                return False
    # Überlappung mit anderen pieces
    for i in range(10):
        if i == piece:
            pass
        else:
            for j in range(len(pieces[i])):
                for k in range(len(pieces[piece])):
                    if np.array_equal(pieces[piece][k], pieces[i][j]):
                        move(pieces, piece, np.negative(richtung))
                        return False
    move(pieces, piece, np.negative(richtung))
    return True


def solve(pieces_in, zähler, weg):
    zähler += 1
    richtungen = {"[0, 1]" : "hoch", "[0, -1]" : "runter", "[1, 0]" : "rechts", "[-1, 0]" : "links"}
    global history
    global lösungswege
    if not pieces_in[1][0] == [1, 0]:
        for i in range(10):
            for j in [[0, 1], [0, -1], [1, 0], [-1, 0]]:
                if move_possible(pieces_in, i, j):
                    pieces_in[i] = move(pieces_in, i, j)
                    if not any(np.equal(history, pieces_in).all(1)):
                        weg.append('Klotz' + str(i) + richtungen[str(j)])
                        history = np.append(history, [copy.deepcopy(pieces_in)], axis=0)
                        solve(pieces_in, zähler, weg)
                    move(pieces_in, i, np.negative(j))
        return
    print(zähler)


solve(pieces, 0, [])
