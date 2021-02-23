#include<iostream>
#include<vector>
#include<array>
#include<utility>
#include<cmath>

#include"Piece.cpp"
#include"Board.cpp"
#include"Node.cpp"

using namespace std;

int main() {
	vector<Piece> pieces={Piece(2,1,0), 
	                      Piece(2,2,6),
	                      Piece(2,1,8)};
	
	Node root(nullptr, pieces);
	root.print();
	cout << endl;
	vector<Node> children;
	vector<vector<Piece>> child_pieces=root.make_children();
	for(const auto& pieces : child_pieces)
		children.push_back(Node(nullptr, pieces));
	for(auto i : children) {i.print(); cout << endl;}
	return 0;
}