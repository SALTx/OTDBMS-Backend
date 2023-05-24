import pymysql
import random
import string

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasProgramDB')
    return conn

def generate_adminNo(year):
    """Generate a student admin number."""
    year_str = str(year)[2:]  # Get the last two digits of the year
    random_digits = ''.join(random.choices(string.digits, k=4))
    random_letter = random.choice(string.ascii_uppercase)
    return year_str + random_digits + random_letter

def generate_students(num_students, year, stage, course, pemGroup):
    """Generate dummy data for students."""
    students = []
    for _ in range(num_students):
        adminNo = generate_adminNo(year)
        name = 'Student ' + adminNo  # Placeholder student name
        gender = random.choice(['Male', 'Female'])
        citizenshipStatus = random.choice(['Singapore citizen', 'Permanent resident', 'International Student'])
        students.append((adminNo, name, gender, citizenshipStatus, stage, course, pemGroup))
    return students

def insert_into_table(table_name, data, conn):
    """Insert data into a table in the database."""
    with conn.cursor() as cursor:
        for row in data:
            placeholders = ', '.join(['%s'] * len(row))
            query = f"INSERT INTO {table_name} VALUES ({placeholders})"
            cursor.execute(query, row)
    conn.commit()

# Generate dummy data for 100 students who enrolled in 2023
students = generate_students(100, 2023, 1, 'COURSE', 'PEMGRP')

# Insert the dummy data into the 'students' table
conn = create_conn()
insert_into_table('students', students, conn)
conn.close()  # Don't forget to close the connection
