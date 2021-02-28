#include"Piece.cpp"
#include"Board.cpp"
#include"Node.cpp"

struct Tree {
	vector<Node> queue;
	vector<int> solution; // Index in pieces, Position
	Tree(vector<Piece> p, vector<int> s) : solution(s) {
		queue.push_back(Node(p,0));
	}
	vector<Node>& search();
};

vector<Node>& Tree::search() {
	int ind=0;
	do {
		for(const auto& board : queue[ind].make_children()) {
			queue.push_back(Node(board,ind));
			queue[ind].children.push_back(queue.size()-1);
			if(queue.back().pieces[solution[0]].pos==solution[1]) {
				cout << endl;
				return queue;
			}
		}
		cout << "\r" << ind;
		ind++;
	}
	while(queue.size()!=ind);
	cout << endl;
	return queue;
}