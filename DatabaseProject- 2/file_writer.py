import datetime

current = datetime.datetime.now()
time = str(current.time())
date = (str(current.month) + "/" + str(current.day) + '/' + str(current.year)).replace(" ", "")
date += " " + time[0:8]

"""
Following Method used for finding the line count of a file 
"""


def linecount(v):
    num_lines = sum(1 for line in open(v + '.txt'))
    return num_lines


"""
Following Method used for backing up database and transactions created
"""


def backup(x):
    v = "backupfile.txt"
    with open(v, "a") as file:
        file.write('\nBack up date: ' + date + '\n' + str(x))
    file.close()


def trans(x):
    with open('logs.txt', 'a') as file:
        file.write('\nTransaction date: ' + date + '\n' + str(x))
    file.close()


"""
Following Methods used for storing and retrieving single variables  
"""


def varwrite(x):
    with open("vars.txt", "w") as file:
        file.write(str(x))
    file.close()


def varread():
    with open("vars.txt", "r") as file:
        x = file.readline()
    file.close()
    return x


"""
Following Methods used for general file writing and reading, should only be used on creation of a file of reading 
specific file 
"""


# Input: value to write and name of txt file
def fwrite(x, v):
    file = open(v + ".txt", "w")
    file.write(x)
    file.close()


def fread(v):
    data = """"""
    with open(v + ".txt", "r") as file:
        for i in file:
            data += i
    file.close()
    return data


"""
Search Method, can be used for searching a file for a specific word operates in O(n) time, could be longer. 
Will terminate though...
Probably shouldn't use on long files
Unit Test on a file consisting of 6597 lines and search variable on last line took 10.5163s to find the key word
"""


# Input: Name of text, and search variable
def fsearch(q, v):
    file = open(q + '.txt', 'r')
    z = 0
    while True:
        x = file.readline()
        w = x
        z += 1
        x = x.split(' ')
        if v in x:
            print('Found on line: ' + str(z) + '\n' + w + file.readline())
            return 1
            break
        if z > linecount(q):
            return 0
            break
    file.close()


def newbackup():
    create = "Created on: " + str(date)
    fwrite(create, 'backupfile')
    fwrite(create, 'logs')

