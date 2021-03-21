COMPILER_FLAGS=-Wall -Wextra -pedantic -O3
LIBRARY=-L/usr/local/Cellar/boost/1.75.0_2/include/boost/functional/hash/
VERSION=-std=c++17

solver.exe : main.cpp
	g++ $(VERSION) $(COMPILER_FLAGS) $(LIBRARY) $< -o$@
clean:
	rm −f solver.exe
.PHONY: clean
