import pymysql
import random
import string

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasProgramDB')
    return conn

def generate_adminNo(year, existing_admins):
    """Generate a unique student admin number."""
    while True:
        year_str = str(year)[2:]  # Get the last two digits of the year
        random_digits = ''.join(random.choices(string.digits, k=4))
        random_letter = random.choice(string.ascii_uppercase)
        adminNo = year_str + random_digits + random_letter
        if adminNo not in existing_admins:
            existing_admins.add(adminNo)
            return adminNo

def generate_students(year, current_year, num_students, course_distribution, existing_admins):
    """Generate dummy data for students."""
    students = []
    pemGroup_counter = 1
    pemGroup_max_size = random.randint(18, 24)  # Randomly choose a size for the PEM group
    pemGroup_size_counter = 0
    stage = current_year - year + 1  # Calculate the stage based on the current year

    # Make sure that the sum of all students is as expected
    total_students = sum(course_distribution.values())
    if total_students != num_students:
        raise ValueError(f"Total number of students for year {year} should be {num_students}, but got {total_students}")

    for course, num_students in course_distribution.items():
        for _ in range(num_students):
            if pemGroup_size_counter == pemGroup_max_size:  # If the current PEM group is full
                pemGroup_counter += 1  # Start a new PEM group
                pemGroup_max_size = random.randint(18, 24)  # Choose a new size for the new PEM group
                pemGroup_size_counter = 0
            adminNo = generate_adminNo(year, existing_admins)
            name = 'Student ' + adminNo  # Placeholder student name
            citizenshipStatus = random.choice(['Singapore citizen', 'Permanent resident', 'International Student'])
            pemGroup = f"PEM{str(pemGroup_counter).zfill(3)}"  # Create the PEM group ID
            students.append((adminNo, name, citizenshipStatus, stage, course, pemGroup))
            pemGroup_size_counter += 1
    return students


def insert_into_table(table_name, data, conn):
    """Insert data into a table in the database."""
    with conn.cursor() as cursor:
        for row in data:
            placeholders = ', '.join(['%s'] * len(row))
            query = f"INSERT INTO {table_name} VALUES ({placeholders})"
            cursor.execute(query, row)
    conn.commit()

# Define the current year
current_year = 2023

# Define the course distributions for each year
course_distribution_year1 = {
    'EGDF94': 422,
    'EGDF20': 88,
    'EGDF21': 132,
    'EGDF11': 42,
    'EGDF19': 62,
    'EGDF17': 41,
    'EGDF09': 41,
    'EGDF22': 61,
    'EGDFPA': 39,
    'EGDF12': 40,
    'EGDF13': 38,
}

course_distribution_year2 = {
    'EGDF20': 170,
    'EGDF21': 160,
    'EGDF11': 110,
    'EGDF19': 110,
    'EGDF17': 80,
    'EGDF09': 80,
    'EGDF22': 80,
    'EGDFPA': 80,
    'EGDF12': 60,
    'EGDF13': 70,
}

# Assume the same distribution for year 2 and 3
course_distribution_year3 = course_distribution_year2

# Set to hold existing admin numbers
existing_admins = set()

# Generate the student data
students_year1 = generate_students(2023, current_year, 1006, course_distribution_year1, existing_admins)
students_year2 = generate_students(2022, current_year, 1000, course_distribution_year2, existing_admins)
students_year3 = generate_students(2021, current_year, 1000, course_distribution_year3, existing_admins)

# Insert the student data into the 'students' table
conn = create_conn()
insert_into_table('students', students_year1, conn)
insert_into_table('students', students_year2, conn)
insert_into_table('students', students_year3, conn)
conn.close()  # Don't forget to close the connection
