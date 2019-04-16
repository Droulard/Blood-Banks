"""
Import SQL and Create a connector
"""
import pymysql
import file_writer as fw

# Create Connection
connection = pymysql.connect(host='localhost', user='root', password='password',
                             db='Database Project')

cur = connection.cursor()
btypes = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-']

''' 
Input: N/A
Output: All data from table relevant to command 
'''


def PrintDonor():
    cur.execute("SHOW COLUMNS FROM `Database Project`.DONOR;")
    res0 = cur.fetchall()
    cur.execute("SELECT * FROM `Database Project`.DONOR;")
    res = cur.fetchall()
    x = """Donors: \n"""
    for i in range(len(res0)):
        if i < len(res0) - 1:
            if i == 3 or i == 4:
                x += (res0[i][0]).ljust(25) + " | "
            else:
                x += (res0[i][0]).ljust(10) + " | "
        else:
            x += res0[i][0] + '\n'
    for i in range(len(res)):
        for j in range(len(res[0])):
            if j == 3 or j == 4:
                x += str(res[i][j]).ljust(25)
            elif j == 7:
                x += str(res[i][j]).ljust(10)
            else:
                x += str(res[i][j]).ljust(15)

        x += '\n'
    return x


def PrintDonation():
    cur.execute("SHOW COLUMNS FROM `Database Project`.DONATION;")
    res0 = cur.fetchall()
    cur.execute("SELECT * FROM `Database Project`.DONATION;")
    res = cur.fetchall()
    x = """Donations: \n"""
    for i in range(len(res0)):
        if i < len(res0) - 1:
            if i == 3 or i == 4:
                x += (res0[i][0]).ljust(25) + " | "
            else:
                x += (res0[i][0]).ljust(10) + " | "
        else:
            x += res0[i][0] + '\n'
    for i in range(len(res)):
        for j in range(len(res[0])):
            if j == 3 or j == 4:
                x += str(res[i][j]).ljust(25)
            elif j == 7:
                x += str(res[i][j]).ljust(10)
            else:
                x += str(res[i][j]).ljust(15)
        x += '\n'
    return x


def PrintRequests():
    cur.execute("SHOW COLUMNS FROM `Database Project`.REQUEST;")
    res0 = cur.fetchall()
    cur.execute("SELECT * FROM `Database Project`.REQUEST ORDER BY date;")
    res = cur.fetchall()
    x = """Requests: \n"""
    for i in range(len(res0)):
        if i < len(res0) - 1:
            x += (res0[i][0]).ljust(10) + " | "
        else:
            x += res0[i][0] + '\n'
    for i in range(len(res)):
        for j in range(len(res[0])):
            x += str(res[i][j]).ljust(15)
        x += '\n'
    return x


def PrintInventory():
    cur.execute("SHOW COLUMNS FROM `Database Project`.INVENTORY;")
    res0 = cur.fetchall()
    cur.execute("SELECT * FROM `Database Project`.INVENTORY;")
    res = cur.fetchall()
    x = """Inventory: \n"""
    for i in range(len(res0)):
        if i < len(res0) - 1:
            x += (res0[i][0]).ljust(7) + " | "
        else:
            x += res0[i][0] + '\n'
    for i in range(len(res)):
        for j in range(len(res[0])):
            x += str(res[i][j]).ljust(10)
        x += '\n'
    return x


def PrintBloodBank():
    cur.execute("SHOW COLUMNS FROM `Database Project`.BLOOD_BANK;")
    res0 = cur.fetchall()
    cur.execute("SELECT * FROM `Database Project`.BLOOD_BANK;")
    res = cur.fetchall()
    x = """Blood Bank: \n"""
    for i in range(len(res0)):
        if i < len(res0) - 1:
            if i == 0 or i == 1:
                x += (res0[i][0]).ljust(7) + " | "
            elif i == 2:
                x += (res0[i][0]).ljust(20) + " | "
            else:
                x += (res0[i][0]).ljust(10) + " | "
        else:
            x += res0[i][0] + '\n'
    for i in range(len(res)):
        for j in range(len(res[0])):
            if j == 0 or j == 4:
                x += str(res[i][j]).ljust(9)
            elif j == 1:
                x += str(res[i][j]).ljust(10)
            elif j == 2:
                x += str(res[i][j]).ljust(25)
            else:
                x += str(res[i][j]).ljust(15)
        x += '\n'
    return x


def PrintHospital():
    cur.execute("SHOW COLUMNS FROM `Database Project`.HOSPITAL;")
    res0 = cur.fetchall()
    cur.execute("SELECT * FROM `Database Project`.HOSPITAL;")
    res = cur.fetchall()
    x = """Hospital: \n"""
    for i in range(len(res0)):
        if i < len(res0) - 1:
            if i == 1:
                x += (res0[i][0]).ljust(2) + " | "
            elif i == 3:
                x += (res0[i][0]).ljust(20) + " | "
            else:
                x += (res0[i][0]).ljust(10) + " | "
        else:
            x += res0[i][0] + '\n'
    for i in range(len(res)):
        for j in range(len(res[0])):
            if j == 1:
                x += str(res[i][j]).ljust(10)
            elif j == 3:
                x += str(res[i][j]).ljust(24)
            elif j == 2:
                x += str(res[i][j]).ljust(15)
            else:
                x += str(res[i][j]).ljust(14)
        x += '\n'
    return x


"""
Allows you to back up the entire database
"""


def BackUpALL():
    tables = [PrintDonor(), PrintDonation(), PrintBloodBank(), PrintInventory(), PrintHospital(), PrintRequests()]
    for i in tables:
        fw.backup(i)


'''
Input: Data to be inserted into relevant table  
Output: None 
'''


def InsertDonation(x):
    sql = "INSERT INTO `DONATION` (`DATE`, `DONOR_ID`, `BANK_ID`, `QUANTITY`) " \
          "VALUES (%s, %s, %s, %s);"
    try:
        cur.execute(sql, x)
        return None
    except (pymysql.Error, pymysql.Warning) as e:
        return 'error'


def InsertReq(x):
    sql = "INSERT INTO `REQUEST` (`REQUEST_ID`,`HOSPITAL_ID`, `BLOOD_TYPE`, `QUANTITY`, `DATE`) " \
          "VALUES (%s, %s, %s, %s, %s);"
    cur.execute(sql, x)


def InsertINV(x):
    sql = "INSERT INTO `INVENTORY` (`INV_ID`, `O+`, `O-`, `A+`, `A-`, `B+`, `B-`, `AB+`, `AB-`) " \
          "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);"
    cur.execute(sql, x)


def InsertBbank(x):
    sql = "INSERT INTO `BLOOD_BANK` (`BANK_ID`, `INV_ID`, `STREET`, `CITY`, `STATE`, `ZIP`, `AREA_CODE`, `PHONE`)" \
          "VALUES (%s, %s, %s, %s, %s, %s, %s, %s);"
    cur.execute(sql, x)


def InsertDonor(x):
    sql = "INSERT INTO `DONOR` (`DONOR_ID`, `FNAME`, `LNAME`, `STREET`, `CITY`, `STATE`, `ZIP`, `AREA_CODE`," \
          " `PHONE`, `BLOOD_TYPE`)" \
          "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
    cur.execute(sql, x)


def InsertHosp(x):
    sql = "INSERT INTO `HOSPITAL` (`HOSPITAL_ID`, `BANK_ID`, `HOSPITAL_NAME`, `STREET`, `CITY`, `STATE`, `ZIP`, " \
          "`AREA_CODE`, `PHONE`)" \
          "VALUES (%s, %s,%s, %s, %s, %s, %s, %s, %s);"
    cur.execute(sql, x)


'''
Get Functions 
Purpose: Help to reduce sql statements by retrieving id's off of certain information
'''


# Input:N/A Output: Next Request Id
def getnextrid():
    cur.execute("SELECT REQUEST_ID FROM REQUEST ORDER BY DATE")
    res = cur.fetchall()
    rid = res[len(res) - 1][0]
    while True:
        sqlck = "SELECT * FROM Request WHERE REQUEST_ID= %s"
        cur.execute(sqlck, rid)
        res = cur.fetchall()
        if len(res) < 1:
            return rid
            break
        else:
            rid = 'R' + str(int(rid[1:]) + 1)


# Input: Hospital Name Output: Hospital Id
def gethosid(hname):
    cur.execute("SELECT HOSPITAL_ID FROM HOSPITAL WHERE HOSPITAL_NAME =%s", hname)
    res = cur.fetchall()
    return res[0][0]


# Input: City Output: Bank Id
def getbid(city):
    cur.execute("SELECT BANK_ID FROM BLOOD_BANK WHERE CITY = %s;", city)
    res = cur.fetchall()
    return res[0][0]


# Input: Last Name Output: Donor Id
def getdid(lname):
    cur.execute("SELECT DONOR_ID FROM DONOR WHERE LNAME = %s;", lname)
    res = cur.fetchall()
    return res[0][0]


# Input: City Output: Inventory Id
def getinvid(city):
    cur.execute("SELECT INV_ID FROM BLOOD_BANK WHERE CITY = %s", city)
    res = cur.fetchall()
    return res[0][0]


'''
Create method's
Purpose: Create a donation or Request
Input: Date, Last Name/ Hospital Name, Quantity, City/Blood Type,
Function Calls: getdid, getbid, gethosid, getnextrid, Insert Request, Insert Donation
'''


def CreateDon(date, lname, quant, city):
    x = (date, getdid(lname), getbid(city), quant)
    z = InsertDonation(x)
    if z == "error":
        return "Duplicate Entry"
    else:
        out = "Donation made from " + lname
        return out


def CreateReq(date, hname, btype, quant):
    print(getnextrid(), gethosid(hname), btype, quant, date)
    x = (getnextrid(), gethosid(hname), btype, quant, date)
    print(x)
    InsertReq(x)
    return x

'''
Input: City of the bank being accessed and the Date
Output: Request id, Blood Type and Quantity
        Also outputs a collected array of blood types the total values of thos blood types
'''


def FindR(city, date):
    val = [0] * 8
    sqlrh = 'SELECT  DATE, BLOOD_TYPE, QUANTITY ' \
            'FROM `Database Project`.REQUEST ' \
            'WHERE HOSPITAL_ID = (SELECT HOSPITAL_ID FROM `Database Project`.HOSPITAL WHERE CITY = %s) AND date <= %s' \
            'ORDER BY date;'
    cur.execute(sqlrh, (city, date))
    res = cur.fetchall()
    outstr = """All Requests for """ + city + ' up to ' + str(date[4:6]) + "/" + str(date[6::]) + "/" + str(
        date[0:4]) + ':\n'
    head = ['Date', 'Blood Type', 'Quantity']
    for r in head:
        outstr += r.ljust(20)
    outstr += '\n'
    for i in range(len(res)):
        outstr += (str(res[i][0]).ljust(20) + res[i][1].ljust(20) + str(res[i][2]) + '\n')
        val[btypes.index(res[i][1])] -= res[i][2]
    return outstr, val


'''
Input: City of the bank being accessed and the Date
Output: Date, Last Name, Blood Type and Quantity
        Also outputs a collected array of blood types the total values of thos blood types
'''


def FindDon(city, date):
    val = [0] * 8
    bid = getbid(city)
    sqldb = "SELECT QUANTITY, DATE, LNAME, BLOOD_TYPE " \
            "FROM (SELECT LNAME, BLOOD_TYPE, dona.DONOR_ID, BANK_ID, QUANTITY, DATE " \
            "FROM DONATION AS dona, DONOR AS don  " \
            "WHERE dona.DONOR_ID = don.DONOR_ID) AS a " \
            "WHERE BANK_ID = %s AND date <= %s" \
            "ORDER BY DATE;"
    cur.execute(sqldb, (bid, date))
    res = cur.fetchall()
    outstr = """All Donations for """ + city + ' up to ' + str(date[4:6]) + "/" + str(date[6::]) + "/" + str(
        date[0:4]) + ':\n'
    sts = ['Date', 'Last Name', 'Blood Type', 'Quantity']
    for r in sts:
        outstr += r.ljust(25)
    outstr += '\n'
    for i in range(len(res)):
        outstr += (str(res[i][1]).ljust(25) + res[i][2].ljust(25) + res[i][3].ljust(25) + str(res[i][0]) + '\n')
        val[btypes.index(res[i][3])] += res[i][0]
    return outstr, val


'''
Input: City of the bank being accessed 
Output: Current Inventory for specific Bank
'''


def checkinv(city):
    val = [0] * 8
    sqlib = "SELECT `O+`, `O-`, `A+`, `A-`, `B+`, `B-`, `AB+`, `AB-` " \
            "FROM INVENTORY " \
            "WHERE INV_ID = (SELECT INV_ID FROM BLOOD_BANK WHERE CITY = %s)"
    cur.execute(sqlib, city)
    res = cur.fetchall()
    outstr = """Inventory for """ + city + ':\n'
    # btypes is a global array containing all of the blood types
    for r in btypes:
        outstr += r.ljust(15)
    outstr += '\n'

    for j in range(0, 8):
        outstr += str(res[0][j]).ljust(15)
        val[j] += res[0][j]
    return outstr, val


'''
Following methods are used for updating the inventory 
'''


# Input: Collected transaction array and the city to update
# Output: N/A
# Function: Update SQL Inventory
def up(addarr, city):
    addarr.append(getinvid(city))
    print(addarr)
    print("Executing SQL")
    sqlup = "UPDATE `INVENTORY`" \
            "SET " \
            "`O+` = `O+` + %s, " \
            "`O-` = `O-` + %s, " \
            "`A+` = `A+` + %s, " \
            "`A-` =`A-` + %s, " \
            "`B+` = `B+` + %s, " \
            "`B-` = `B-` + %s, " \
            "`AB+` = `AB+` + %s, " \
            "`AB-` = `AB-` + %s " \
            "WHERE `INV_ID` = %s; "
    cur.execute(sqlup, addarr)
    print("SQL EXE")


# Input: Location, Date, two Booleans Output:N/A
# Function decide how to adjust the inventory
def updateinv(city, date, trans):
    if trans == 1:
        darr = FindDon(city, date)[1]
        up(darr, city)
    if trans == 2:
        rarr = FindR(city, date)[1]
        up(rarr, city)


'''
City        |   Hos_ID  |   Bank_ID
Pontiac             0           1100
South Lyon          1           1010
Clarkston           2           1000
Troy                3           1001
Waterford           4           1011
'''
