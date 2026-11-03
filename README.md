# Monty-Python

This repository demonstrates the Monty Hall problem in two ways:

- `main.cpp` is an interactive C++ game show program. It places a car randomly behind one of three doors, lets you choose a door, reveals one goat door, and asks whether you want to stay with your original choice or switch to the remaining door.
- `Statistics.R` runs a simulation of 100,000 Monty Hall trials using the always-stay and always-switch strategies. It prints each strategy's win rate and creates a bar chart comparing the results.
- `Makefile` contains the build and cleanup commands for the C++ program.

## Requirements

- A C++17 compiler, such as `g++`
- `make`
- R with the `ggplot2` and `scales` packages for the simulation and chart

Install the R packages if needed:

```r
install.packages(c("ggplot2", "scales"))
```

## Run the C++ game

Build the program from the repository root:

```bash
make
```

Start the game:

```bash
./main
```

Choose a door by entering `1`, `2`, or `3`. When prompted, enter `stay` to keep your original door or `switch` to choose the remaining door.

Remove the compiled executable and other build artifacts with:

```bash
make clean
```

## Run the R simulation

Run the script from the repository root:

```bash
Rscript Statistics.R
```

The script prints the simulated win rates for staying and switching, then displays a bar chart. The simulation count can be changed by editing the `N` value near the top of `Statistics.R`.