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
        students_by_stage[student[4]].append(student)

    # Group programs by date (assume programs are sorted by startDate)
    programs_by_date = {}
    for program in programs:
        programID, startDate = program  # Unpack the program tuple
        if startDate not in programs_by_date:
            programs_by_date[startDate] = []
        programs_by_date[startDate].append(programID)

    # Assign students to programs
    for date, programIDs in programs_by_date.items():
        # Shuffle the programIDs to ensure variety
        random.shuffle(programIDs)
        for programID in programIDs:
            # Check if there are students available for assignment
            available_students = [student for students in students_by_stage.values() for student in students]
            if not available_students:
                break  # No more students available, exit the loop

            # Ensure that each program has at least one student and not more than twenty students
            num_students_in_program = random.randint(1, min(20, len(available_students)))
            for _ in range(num_students_in_program):
                for stage, students_in_stage in students_by_stage.items():
                    if students_in_stage:  # If there are students in this stage
                        student = random.choice(students_in_stage)  # Pick a random student
                        comment = 'Comment for ' + student[0] + ' in ' + programID  # Placeholder comment
                        trips.append((student[0], programID, comment))  # Append to the trips list
                        students_in_stage.remove(student)  # Remove the student from the list
                        break  # Break the inner loop as we've found a student for this trip
            # Once a student is assigned to a program, remove him/her from the pool for the same day
            students_by_stage = {k: [s for s in v if s[0] not in [t[0] for t in trips if t[1] == programID]] for k, v in students_by_stage.items()}
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
programs = fetch_table_data('overseasPrograms', conn, columns='programID, startDate')



# Generate dummy data for trips
trips = generate_trips(students, programs, conn)

# Insert the dummy data into the 'trips' table
insert_into_table('trips', trips, conn)

conn.close()  # Don't forget to close the connection
