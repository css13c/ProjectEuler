def routes_in_grid(grid_width: int, grid_height: int):
    n = grid_width + grid_height - 2
    k = grid_width - 1
    #print(f"N: {n} | K: {k}")
    return int(calculate_binomial_coefficient(n, k))

def calculate_binomial_coefficient(n: int, k: int):
    from math import factorial
    return factorial(n) / (factorial(k) * factorial(n - k))

def routes_in_grid_old(grid_width: int, grid_height: int):
    # Have to add 1, since we are counting routes through
    # the edges of the grid, not the squares themselves.
    # Using a Pascal's Triangle approach, where the number of routes
    # to each cell is the sum of the number of routes to the top and left
    # of them.
    result = [[1 for _ in range(grid_width)]]
    for x in range(1, grid_height):
        new_row = [1]
        for y in range(1, grid_width):
            new_row.append(result[x-1][y] + new_row[y-1])

        result.append(new_row)

    print_2d_array(result)
    return result[grid_height - 1][grid_width - 1]

def print_2d_array(arr_2d):
    from tabulate import tabulate
    print(f"\n2D-Array:")
    print(tabulate(arr_2d))

# Project Euler Problem 15:
# Starting in the top left corner of a 2x2 grid, and only being able to move 
# to the right and down, there are exactly 6 routes to the bottom right corner.
# How many routes are there through a 20x20 grid?
if __name__ == "__main__":
    # Have to add 1 to grid size to account for edges
    route_count = routes_in_grid(20 + 1, 20 + 1)
    print(f"Problem 15 solution: {int(route_count)}")

### Tests
def test_6x6_routes():
    assert routes_in_grid(6, 6) == 252

def test_5x3_routes():
    assert routes_in_grid(3, 5) == 15