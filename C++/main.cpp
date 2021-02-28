#include"Tree.cpp"
#include"Piece.cpp"
#include"Board.cpp"
#include"Node.cpp"

using namespace std;

void print_solution(vector<Node>& sol, int ind) {
	if(sol[ind].parent==0) {
		sol[(sol[ind].parent)].print();
		sol[ind].print();
		return;
	}
	print_solution(sol, sol[ind].parent);
	sol[ind].print();
	return;
}

int main() {
	/*vector<Piece> pieces={Piece(2,1,0),
	                      Piece(2,2,5),
	                      Piece(1,2,1),
	                      Piece(2,1,3),
	                      Piece(2,1,8),
	                      Piece(2,1,11),
	                      Piece(1,1,16),
	                      Piece(1,1,19),};*/
	vector<Piece> pieces={Piece(2,1,0), 
	                      Piece(2,2,1),
	                      Piece(2,1,3),
	                      Piece(2,1,8),
	                      Piece(1,2,9),
	                      Piece(2,1,11),
	                      Piece(1,1,13),
	                      Piece(1,1,14),
	                      Piece(1,1,16),
	                      Piece(1,1,19),};
	Tree tree(pieces, vector<int>{1,13});
	vector<Node>& solution=tree.search();
	print_solution(solution, solution.size()-1);
	return 0;
}

