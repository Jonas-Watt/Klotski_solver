#include<string>

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

#include <sys/time.h>
#include <sys/resource.h>

long getMemoryUsage() {
	struct rusage usage;
	if(0 == getrusage(RUSAGE_SELF, &usage))
		return usage.ru_maxrss; // bytes
	else
		return 0;
}

int main() {
	string n;
	while(n!="q") {
		if(n=="1") {
			vector<Piece> pieces={Piece(1,2,2),
								  Piece(2,2,0),
								  Piece(1,2,6),
								  Piece(1,1,8),
								  Piece(1,1,9),
								  Piece(2,1,12),
								  Piece(2,1,13),
								  Piece(1,2,14),
								  Piece(1,2,18)};
			Tree tree(pieces, vector<int>{1,12});
			vector<Node>& solution=tree.search();
			print_solution(solution, solution.size()-1);
		}
		if(n=="2") {
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
		}
		cin >> n;
	}
	return 0;
}

