#pragma once

#include<iostream>
#include<vector>
#include<algorithm>

#include"Piece.cpp"

using namespace std;

class Board {
protected:
	const int height=5;
	const int width=4;
	vector<Piece> pieces;
	vector<int> map;
	int empty_space;
	void make_map();
public:
	Board(vector<Piece> p);
	void print();
};

void Board::make_map() {
	for(const auto& piece : pieces)
		for(int h=0;h<piece.height;h++)
			for(int w=0;w<piece.width;w++)
				map[piece.pos+w+width*h]=piece.type;
}

Board::Board(vector<Piece> p) : pieces(p), map(height*width,0) {
	make_map();
	empty_space=count(map.begin(),map.end(),0);
}

void Board::print() {
	 for(int h=0;h<height;h++) {
		for(int w=0;w<width;w++) {
			if(map[w+width*h]==0) cout << "00 ";
			else cout << map[w+width*h] << " ";
		}
		cout << endl;
	}
}
