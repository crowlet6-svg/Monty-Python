CXX ?= g++
CXXFLAGS ?= -Wall -Wextra -std=c++17

main: main.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -f main *.o
