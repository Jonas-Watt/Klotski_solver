#pragma once

struct Piece {
	int height;
	int width;
	int pos;
	int type=10*height+width;
	Piece(int h, int w, int p) : height(h), width(w), pos(p) {}
};