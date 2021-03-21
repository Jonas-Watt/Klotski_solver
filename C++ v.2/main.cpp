// 00 01 02 03
// 04 05 06 07
// 08 09 10 11
// 12 13 14 15
// 16 17 18 19

#include<iostream>

#include"tree.cpp"

int main() {
	auto start = std::chrono::high_resolution_clock::now();
	
	std::vector<Piece> pieces={Piece(0,2,2),
	                           Piece(2,1,2),
	                           Piece(6,1,2),
	                           Piece(8,1,1),
	                           Piece(9,1,1),
	                           Piece(12,2,1),
	                           Piece(13,2,1),
	                           Piece(14,1,2),
	                           Piece(18,1,2)};
	Tree tree(Node(pieces, -1), {0,12});
	/*
	std::vector<Piece> pieces={Piece(0,2,1),
	                           Piece(1,2,2),
	                           Piece(3,2,1),
	                           Piece(8,2,1),
	                           Piece(9,1,2),
	                           Piece(11,2,1),
	                           Piece(13,1,1),
	                           Piece(14,1,1),
	                           Piece(16,1,1),
	                           Piece(19,1,1)};
	
	Tree tree(Node(pieces, -1), {1,13});
	*/
	tree.find_solution();
	tree.print_solution();
	auto stop = std::chrono::high_resolution_clock::now();
	std::chrono::duration<double> duration = stop-start;
	std::cout << "Gesamtzeit: " << duration.count() << std::endl;
	return 0;
}

