import pymysql
import random
from datetime import date, timedelta

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasDB')
    return conn

global_date = date(2023, 1, 1)  # This date will be incremented for each program

def random_date(num_days):
    """Generate a random date within num_days after the global date."""
    global global_date
    random_days = random.randrange(num_days)
    result_date = global_date + timedelta(days=random_days)
    global_date = result_date
    return result_date

def generate_programs(num_programs, conn):
    # Fetch country names from the 'countries' table
    with conn.cursor() as cursor:
        cursor.execute("SELECT countryCode FROM countries")
        country_code = [row[0] for row in cursor.fetchall()]
    
    programs = []
    program_types = ['Overseas educational trip', 'Overseas internship program', 'Overseas immersion program', 
                     'Overseas Competition/Exchange', 'Overseas Leadership Training', 
                     'Overseas Leadership Training with Outward Bound',
                     'Overseas Service Learning-Youth Expedition Programme']
    overseas_partner_types = ['Company', 'Institution', 'Others']
    
    for i in range(num_programs):
        programID = 'PROG' + str(i+1).zfill(5)
        programName = 'Program ' + programID
        programType = random.choice(program_types)
        startDate = random_date(7)  # Start dates are up to a week after the global date
        endDate = random_date(14)  # End dates are up to two weeks after the global date
        ESTdate = None
        countryCode = random.choice(country_code)
        city = 'City ' + str(i+1)  # Placeholder city name
        partnerName = 'Partner ' + str(i+1)  # Placeholder partner name
        overseasPartnerType = random.choice(overseas_partner_types)
        tripLeaders = None
        EstNumStudents = None
        approved = 'Yes'
        programs.append((programID, programName, programType, startDate, endDate, ESTdate, countryCode, city, partnerName, overseasPartnerType, tripLeaders, EstNumStudents, approved))
    
    return programs

def insert_into_table(table_name, data, conn):
    with conn.cursor() as cursor:
        for row in data:
            placeholders = ', '.join(['%s'] * len(row))
            query = f"INSERT INTO {table_name} (programID, programName, programType, startDate, endDate, ESTdate, countryCode, city, partnerName, overseasPartnerType, tripLeaders, EstNumStudents, approved) VALUES ({placeholders})"
            cursor.execute(query, row)
    conn.commit()

conn = create_conn()

# Generate dummy data for 100 overseas programs
programs = generate_programs(200, conn)

# Insert the dummy data into the 'overseasPrograms' table
insert_into_table('overseasPrograms', programs, conn)

conn.close()  # Don't forget to close the connection
