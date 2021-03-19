#pragma once

#include <array>

#include"node.cpp"

class Tree {
	std::vector<Node> queue;
	Node root;
	std::array<int,2> solution;
	int solution_ind=-1;
public:
	void find_solution();
	void print_solution();
	Tree(Node r, std::array<int,2> s) : root(r), solution(s) {
		queue.push_back(root);
	}
};

void Tree::find_solution() {
	int ind {0};
	while(queue.size()!=ind) {
		for(auto& child_pieces : queue[ind].make_children()) {
			queue.push_back(Node(child_pieces, ind));
			if(queue.back().pieces[solution[0]].pos[0]==solution[1]) {
				solution_ind=queue.size()-1;
				return;
			}
		}
		ind++;
	}
	return;
}

void Tree::print_solution() {
	int ind=solution_ind;
	while(ind!=-1) {
		queue[ind].print(queue[ind].map);
		ind=queue[ind].parent;
		std::cout << std::endl;
	}
}


