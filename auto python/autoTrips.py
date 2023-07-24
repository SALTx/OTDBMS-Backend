import pymysql
import random
from datetime import datetime

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasProto')
    return conn

def fetch_table_data(table_name, conn, columns='*'):
    with conn.cursor() as cursor:
        cursor.execute(f"SELECT {columns} FROM {table_name}")
        table_data = cursor.fetchall()
    return table_data

def generate_trips(students, programs, conn):
    trips = []

    # Group students by stage and enrollment year
    students_by_stage_year = {(1, 23): [], (2, 22): [], (3, 21): []}
    for student in students:
        stage = student[3]
        year = int(student[0][:2])
        students_by_stage_year[(stage, year)].append(student)

    for program in programs:
        programID = program[0]  # Get the program ID
        programType = program[2]  # Get the program type
        programDate = program[3]  # Get the program start date
        approveStatus = program[12]  # Get the program approval status

        available_students = []

        # Check if the program type is 'Overseas internship program'
        if programType == 'Overseas internship program':
            # If it is, only select from stage 3 students enrolled in 2021
            available_students = students_by_stage_year[(3, 21)]
        else:
            for stage, year in students_by_stage_year.keys():
                if year <= int(programDate.strftime('%y')):
                    available_students.extend(students_by_stage_year[(stage, year)])

        # Shuffle the available students to ensure variety
        random.shuffle(available_students)

        # Check if there are available students for assignment
        if available_students:
            # Determine the number of students to assign to the program randomly within the range of 3 to 20
            num_students_in_program = random.randint(1, min(20, len(available_students)))
            # When available students are lesser than min_students will get error message, unable to solve it by
            #coding with my skills. 2 solutions: 1, reload the codes non-stop and by luck it will end up perfect once, or 
            #2. change minimum reqiured amount to 1.

            # Check if the program is approved before assigning students
            if approveStatus == 'Approved':
                selected_students = available_students[:num_students_in_program]

                for student in selected_students:
                    comments = ''  # Modify as needed
                    trips.append((student[0], programID, comments))

                # Remove selected students from the available pool
                for student in selected_students:
                    students_by_stage_year[(student[3], int(student[0][:2]))].remove(student)

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

conn.close() 
