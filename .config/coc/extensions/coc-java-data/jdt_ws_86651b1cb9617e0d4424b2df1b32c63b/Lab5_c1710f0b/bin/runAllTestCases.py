#!/usr/bin/python3
import os
import time

def runTestCases():
    global totalTime
    testCases = ["a51.tiny", "a52.tiny", "a53.tiny", "a54.tiny", "a55.tiny", "a56.tiny", "a57.tiny", "a58.tiny", "a59.tiny", "a510.tiny"]
    testCase = ["a58.tiny"]
    outputs = []
    for i in testCases:
        print("\n\nSTARTING TEST CASE %s\n\n" %(i))
        start_time = time.time()
        os.system("javac *.java && java A5 %s" % (i))
        f = open("a5.output", "r")
        output = "Test case " + str(testCases.index(i) + 1) + ": "
        for i in f.read().strip():
            output += i
        elapsedTime = time.time() - start_time
        totalTime += elapsedTime
        output += (", time taken " + str(round(elapsedTime, 3)) + " seconds")
        outputs.append(output)

    return outputs


if __name__ == '__main__':
    totalTime = 0
    result = runTestCases()
    f = open("TestCaseOUT.txt", "w")
    for i in result:
        f.write(str(i) + "\n")

    f.write("Total Time for all cases: " + str(round(totalTime, 3)) + " \n")

