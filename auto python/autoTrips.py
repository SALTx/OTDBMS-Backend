import pymysql
import random

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasProgramDB')
    return conn

def fetch_table_data(table_name, conn, columns='*'):
    with conn.cursor() as cursor:
        cursor.execute(f"SELECT {columns} FROM {table_name}")
        table_data = cursor.fetchall()
    return table_data

def generate_trips(students, programs, conn):
    trips = []

    # Group students by stage
    students_by_stage = {1: [], 2: [], 3: []}
    for student in students:
        students_by_stage[student[3]].append(student)

    # Assign students to programs
    for program in programs:
        programID, startDate, endDate = program  # Unpack the program tuple
        available_students = []
        for stage in range(1, 4):
            available_students.extend(students_by_stage[stage])

        if not available_students:
            break  # No more students available, exit the loop

        # Shuffle the available students to ensure variety
        random.shuffle(available_students)

        # Ensure that each program has at least one student and not more than twenty students
        num_students_in_program = random.randint(1, min(20, len(available_students)))
        selected_students = available_students[:num_students_in_program]

        for student in selected_students:
            tripLeaders = ''  # Modify as needed
            estNumStudents = num_students_in_program
            approved = 'Yes'  # Modify as needed
            comments = ''  # Modify as needed
            trips.append((student[0], programID, comments))

        # Remove selected students from the available pool
        for student in selected_students:
            students_by_stage[student[3]].remove(student)

    return trips


def insert_into_table(table_name, data, conn):
    with conn.cursor() as cursor:
        for row in data:
            try:
                placeholders = ', '.join(['%s'] * len(row))
                query = f"INSERT INTO {table_name} (studAdmin, programID, comments) VALUES ({placeholders})"
                cursor.execute(query, row)
            except pymysql.Error as e:
                print(f"Error inserting row {row} into table {table_name}: {e}")
    conn.commit()


conn = create_conn()

# Fetch data from the 'students' and 'overseasPrograms' tables
students = fetch_table_data('students', conn)
programs = fetch_table_data('overseasPrograms', conn, columns='programID, startDate, endDate')

# Generate dummy data for trips
trips = generate_trips(students, programs, conn)

# Insert the dummy data into the 'trips' table
insert_into_table('trips', trips, conn)

conn.close()  # Don't forget to close the connection
