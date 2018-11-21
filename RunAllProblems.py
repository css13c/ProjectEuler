import os;
import runpy;
import time;

startTime = time.time()
for file in (file for file in os.listdir("C:/Users/csmith/Euler") if file not in {"RunAllProblems.py", "__pycache__"}):
    runpy.run_path(file)
    print()
print("------------------------------------------")
print("Execution of all problems took {:.4f} seconds".format(time.time() - startTime))
