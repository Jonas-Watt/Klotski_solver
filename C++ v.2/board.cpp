// 00 01 02 03
// 04 05 06 07
// 08 09 10 11
// 12 13 14 15
// 16 17 18 19

#pragma once

#include <boost/functional/hash.hpp>
#include <iostream>
#include <set>

#include "piece.cpp"

#include <chrono>

class Board {
	static const int height {5};
	static const int width {4};
	static size_t make_hash(std::vector<int>);
	static std::vector<int> make_map(std::vector<Piece>);
	static std::set<size_t> memory;
public:
	std::vector<Piece> pieces;
	std::vector<int> map=std::vector(height*width, 0);
	Board(std::vector<Piece>);
	std::vector<std::vector<Piece>> make_children();
	static void print(std::vector<int>);
};


Board::Board(std::vector<Piece> p) : pieces(p) {
	// make map
	map=make_map(pieces);
	// make hash
	memory.insert(make_hash(map));
}

std::vector<int> Board::make_map(std::vector<Piece> tmp_pieces) {
	std::vector<int> tmp_map(height*width, 0);
	for(Piece& piece : tmp_pieces) {
		for(int pos : piece.pos)
			tmp_map[pos]=piece.type;
	}
	return tmp_map;
}

size_t Board::make_hash(std::vector<int> map) {
	return boost::hash_range(map.begin(), map.end());
}

std::vector<std::vector<Piece>> Board::make_children() {
	std::set<int> empty;
	for(int i=0; i<height*width; i++)
		if(!map[i]) empty.insert(i);
	std::vector<std::vector<Piece>> out;
	for(int i=0; i<pieces.size(); i++) {
		std::set<int> tmp_empty {empty};
		for(const int& pos : pieces[i].pos)
			tmp_empty.insert(pos);
		for(const int& dir : {-1, 1, -4, 4}) {
			if(pieces[i].pos.front()+dir<0) continue;
			if(pieces[i].pos.back()+dir>19) continue;
			if(dir==-1&&(pieces[i].pos.front())%4==0) continue;
			if(dir==1&&(pieces[i].pos.back())%4==3) continue;
			bool con=true;
			for(const int& pos : pieces[i].pos) {
				if(tmp_empty.find(pos+dir)==tmp_empty.end()) {
					con=false;
					break;
				}
			}
			if(con) {
				std::vector<Piece> tmp_pieces=pieces;
				for(int j=0; j<tmp_pieces[i].pos.size(); j++)
					tmp_pieces[i].pos[j]+=dir;
				if(memory.find(make_hash(make_map(tmp_pieces)))==memory.end()) // hash muss nochmal im neuen Board berechnet werden worth??
					out.push_back(tmp_pieces);
			}
		}
	}
	return out;
}

void Board::print(std::vector<int> map) {
	std::cout << std::endl;
	for(int h=0; h<height; h++) {
		for(int w=0; w<width; w++) {
			if(map[w+width*h]==0) std::cout << " _";
			else if(map[w+width*h]==11) std::cout << " +";
			else if(map[w+width*h]==21) std::cout << " O";
			else if(map[w+width*h]==12) std::cout << " =";
			else if(map[w+width*h]==22) std::cout << " #";
		}
		std::cout << std::endl;
	}
}

std::set<size_t> Board::memory;

