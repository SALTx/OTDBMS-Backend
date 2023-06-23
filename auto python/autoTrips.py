import pymysql
import random

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='opsystem_test')
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

    for program in programs:
        programID = program[0]  # Get the program ID
        programType = program[2]  # Get the program type

        available_students = []
        
        # Check if the program type is 'Overseas internship program'
        if programType == 'Overseas internship program':
            # If it is, only select from stage 3 students
            available_students = students_by_stage[3]
        else:
            for stage in range(1, 4):
                available_students.extend(students_by_stage[stage])

        # Shuffle the available students to ensure variety
        random.shuffle(available_students)

        # Determine the number of students to assign to the program
        num_students_in_program = min(50, max(5, len(available_students)))
        selected_students = available_students[:num_students_in_program]

        for student in selected_students:
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
                query = f"INSERT INTO {table_name} (`Student Admin`, `Program ID`, Comments) VALUES ({placeholders})"
                cursor.execute(query, row)
            except pymysql.Error as e:
                print(f"Error inserting row {row} into table {table_name}: {e}")
    conn.commit()


conn = create_conn()

# Fetch data from the 'students' and 'overseasPrograms' tables
students = fetch_table_data('students', conn)
programs = fetch_table_data('overseasPrograms', conn)

# Generate dummy data for trips
trips = generate_trips(students, programs, conn)

# Insert the dummy data into the 'trips' table
insert_into_table('trips', trips, conn)

conn.close()  # Don't forget to close the connection
