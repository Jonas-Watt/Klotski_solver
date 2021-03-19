#pragma once

#include"board.cpp"

class Node : public Board {
public:
	const int parent;
	Node(std::vector<Piece> b, const int p) : Board(b), parent(p) {};
};