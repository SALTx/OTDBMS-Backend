import pymysql

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='opsystem_test')
    return conn

# establish a connection to your MySQL database
connection = create_conn()

try:
    with connection.cursor() as cursor:
        # Step 1: Extract data from overseasPrograms table where programType = 'Overseas immersion program'
        sql = "SELECT `Program ID` FROM overseasPrograms WHERE `Program Type` = 'Overseas immersion program'"
        cursor.execute(sql)
        programs = cursor.fetchall()

        for program in programs:
            # Step 2: Find the programID where overseasPrograms.`Program ID` = trips.`Program ID`
            sql = f"SELECT `Student Admin` FROM trips WHERE `Program ID` = '{program[0]}'"
            cursor.execute(sql)
            trips = cursor.fetchall()

            for trip in trips:
                # Step 3: Use `Student Admin` to relate to students table to get `Course Code`
                sql = f"SELECT `Course Code` FROM students WHERE `Admin Number` = '{trip[0]}'"
                cursor.execute(sql)
                course = cursor.fetchone()

                # Step 4: Insert auto-generated placeholders for gsmCode and gsmName into oimpDetails
                gsmCode = "your_gsmCode"  # Replace with your actual logic for gsmCode
                gsmName = "your_gsmName"  # Replace with your actual logic for gsmName
                sql = f"INSERT INTO oimpDetails (gsmCode, courseCode, studAdmin, gsmName) VALUES ('{gsmCode}', '{course[0]}', '{trip[0]}', '{gsmName}')"
                cursor.execute(sql)

        # Commit the transaction
        connection.commit()
finally:
    # Close the connection
    connection.close()
