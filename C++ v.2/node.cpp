#pragma once

#include"board.cpp"

class Node : public Board {
public:
	int parent;
	Node(std::vector<Piece> b, int p) : Board(b), parent(p) {};
};