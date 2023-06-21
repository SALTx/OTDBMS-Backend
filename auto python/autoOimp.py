import pymysql

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasDB')
    return conn

# establish a connection to your MySQL database
connection = create_conn()

try:
    with connection.cursor() as cursor:
        # Step 1: Extract data from overseasPrograms table where programType = 'Overseas immersion program'
        sql = "SELECT programID FROM overseasPrograms WHERE programType = 'Overseas immersion program'"
        cursor.execute(sql)
        programs = cursor.fetchall()

        for program in programs:
            # Step 2: Find the programID where overseasPrograms.programID = trips.programID
            sql = f"SELECT studAdmin FROM trips WHERE programID = '{program[0]}'"
            cursor.execute(sql)
            trips = cursor.fetchall()

            for trip in trips:
                # Step 3: Use studAdmin to relate to students table to get course
                sql = f"SELECT course FROM students WHERE adminNo = '{trip[0]}'"
                cursor.execute(sql)
                course = cursor.fetchone()

                # Step 4: Insert auto-generated placeholders for gsmCode and gsmName into OIMPdetails
                gsmCode = "your_gsmCode"  # Replace with your actual logic for gsmCode
                gsmName = "your_gsmName"  # Replace with your actual logic for gsmName
                sql = f"INSERT INTO oimpDetails (gsmCode, courseCode, studAdmin, gsmName) VALUES ('{gsmCode}', '{course[0]}', '{trip[0]}', '{gsmName}')"
                cursor.execute(sql)

        # Commit the transaction
        connection.commit()
finally:
    # Close the connection
    connection.close()
