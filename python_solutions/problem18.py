"""
"""

# This function assumes `matrix` is a MxN matrix
def matrix_max_path(matrix: list[list[int]]) -> int:
    dynamic = [matrix[0]]
    m = 1
    while m < len(matrix):
        row = matrix[m]
        d_new = [0 for i in row]

        n = 0
        while n < len(row):
            val = row[n]
            if n > 0:
                d_new[n] = max(dynamic[m-1][n] + val, dynamic[m-1][n-1] + val)
            else:
                d_new[n] = dynamic[m-1][n] + val

            n += 1

        dynamic.append(d_new)
        m += 1

    return max(dynamic[len(dynamic) - 1])

def tri_to_matrix(triangle: list[str]) -> list[list[int]]:
    # Get largest row, so we can make a m*n matrix
    max_row_size = 0
    for row in triangle:
        size = len(row.split(" "))
        max_row_size = max(size, max_row_size)

    output = []
    for row in triangle:
        new_row = []
        for val in row.split(" "):
            new_row.append(int(val))
        while len(new_row) < max_row_size:
            new_row.append(0)

        output.append(new_row)

    return output

if __name__ == "__main__":
    val = ["75", "95 64", "17 47 82", "18 35 87 10", "20 04 82 47 65", "19 01 23 75 03 34", "88 02 77 73 07 63 67",
           "99 65 04 28 06 16 70 92", "41 41 26 56 83 40 80 70 33", "41 48 72 33 47 32 37 16 94 29", "53 71 44 65 25 43 91 52 97 51 14",
           "70 11 33 28 77 73 17 78 39 68 17 57", "91 71 52 38 17 14 91 43 58 50 27 29 48", "63 66 04 68 89 53 67 30 73 16 69 87 40 31",
           "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"]
    matrix = tri_to_matrix(val)
    print(f"Problem 18 solution: {matrix_max_path(matrix)}")

### Tests
def test_small_triangle_convert():
    val = ["3", "7 4", "2 4 6", "8 5 9 3"]
    assert tri_to_matrix(val) == [[3, 0, 0, 0], [7, 4, 0, 0], [2, 4, 6, 0], [8, 5, 9, 3]]

def test_small_triangle():
    val = ["3", "7 4", "2 4 6", "8 5 9 3"]
    mat = tri_to_matrix(val)
    assert matrix_max_path(mat) == 23

def test_problem18():
    val = ["75", "95 64", "17 47 82", "18 35 87 10", "20 04 82 47 65", "19 01 23 75 03 34", "88 02 77 73 07 63 67",
           "99 65 04 28 06 16 70 92", "41 41 26 56 83 40 80 70 33", "41 48 72 33 47 32 37 16 94 29", "53 71 44 65 25 43 91 52 97 51 14",
           "70 11 33 28 77 73 17 78 39 68 17 57", "91 71 52 38 17 14 91 43 58 50 27 29 48", "63 66 04 68 89 53 67 30 73 16 69 87 40 31",
           "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"]
    matrix = tri_to_matrix(val)
    assert matrix_max_path(matrix) == 1074