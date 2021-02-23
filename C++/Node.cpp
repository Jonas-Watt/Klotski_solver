#pragma once

#include<cmath>
#include<iostream>
#include<vector>
#include<algorithm>

#include"Piece.cpp"
#include"Board.cpp"

class Node : public Board {
	vector<Node*> children;
	Node* parent;
public:
	Node(Node* p, vector<Piece> pieces) : parent(p), Board(pieces) {}
	vector<vector<Piece>> make_children(); // and add to queue
};

vector<vector<Piece>> Node::make_children() {
	vector<vector<Piece>> out;
	for(int i=0;i<pieces.size();i++) {
		const int top_left=pieces[i].pos;
		const int bottom_right=top_left+(pieces[i].width-1)+4*(pieces[i].height-1);
		vector<int> plausible_dir;
		if((bottom_right+1)%4!=0) plausible_dir.push_back(1);
		if((top_left+3)%4!=3) plausible_dir.push_back(-1);
		if(bottom_right+4<=19) plausible_dir.push_back(4);
		if(top_left-4>=0) plausible_dir.push_back(-4);
		for(const int dir : plausible_dir) {
			vector<Piece> child_pieces;
			vector<int> new_map=map;
			for(int h=0;h<pieces[i].height;h++)
				for(int w=0;w<pieces[i].width;w++)
					new_map[pieces[i].pos+w+width*h]=0;
			for(int h=0;h<pieces[i].height;h++)
				for(int w=0;w<pieces[i].width;w++)
					new_map[pieces[i].pos+w+width*h+dir]=pieces[i].type;
			if(count(new_map.begin(),new_map.end(),0)==empty_space) {
				child_pieces=pieces;
				child_pieces[i]=Piece(pieces[i].height,pieces[i].width,pieces[i].pos+dir);
				out.push_back(child_pieces);
			}
		}
	}
	return out;
}
