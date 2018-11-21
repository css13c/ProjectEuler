import time;

def sum_mult():
    total = 0
    for num in range(3, 1000):
        if num % 3 == 0:
            total += num
        elif num % 5 == 0:
            total += num
    return total

def main():
    print("What is the sum of all multiples of 3 and 5 below 1000? {}".format(sum_mult()))

startTime = time.time()
main()
print("Execution took {:.4f} seconds".format(time.time() - startTime))
