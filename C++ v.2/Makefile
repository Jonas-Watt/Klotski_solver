COMPILER_FLAGS=-Wall -Wextra -pedantic -O3
LIBRARY=-I/usr/local/
VERSION=-std=c++17

solver.out : main.cpp
	g++ $(VERSION) $(COMPILER_FLAGS) $(LIBRARY) $< -o$@
clean:
	rm −f solver.exe
.PHONY: clean
