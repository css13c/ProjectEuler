include time;

def isPalindrome(num):
    val = str(num)
    x = 0
    y = val.len - 1
    while x < y:
        if val[x++] != val[y--]:
            return False
    return True
