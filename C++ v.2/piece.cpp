#pragma once

#include<vector>

class Piece {
	const int ul_pos; // position of upper left square
	const int height;
	const int width;
public:
	const int type {10*height+width};
	std::vector<int> pos;
	Piece(int, int, int);
};

Piece::Piece(int ulp, int h, int w) : ul_pos(ulp), height(h), width(w) {
		for(int h=0; h<height; h++)
			for(int w=0; w<width; w++)
				pos.push_back(ul_pos+w+4*h);
}

