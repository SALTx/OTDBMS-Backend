import pymysql
import random
from datetime import datetime, timedelta

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseasProto')
    return conn

def random_date(program_type):
    current_year = datetime.now().year
    start_date = datetime(current_year - 1, 1, 1)
    end_date = datetime(current_year + 1, 12, 31)

    if program_type == 'Overseas internship program':
        min_duration = timedelta(days=90)
        max_duration = timedelta(days=180)
    else:
        min_duration = timedelta(days=7)
        max_duration = timedelta(days=14)

    duration = random.randint(min_duration.days, max_duration.days)
    random_days = random.randint(0, (end_date - start_date - timedelta(days=duration)).days)
    result_start_date = start_date + timedelta(days=random_days)
    result_end_date = result_start_date + timedelta(days=duration)

    return result_start_date.date(), result_end_date.date()


def generate_programs(num_programs, conn):
    # Fetch country names from the 'countries' table where 'aciCountry' is A
    with conn.cursor() as cursor:
        cursor.execute("SELECT countryCode FROM countries WHERE aciCountry='A'")
        country_code = [row[0] for row in cursor.fetchall()]
    
    programs = []
    overseas_partner_types = ['Company', 'Institution', 'Others']
    approval_statuses = ['Approved', 'Rejected', 'Pending']
    
    for i in range(num_programs):
        programID = 'PROG' + str(i+1).zfill(5)
        programName = 'Program ' + programID
        programType = 'Overseas internship program'  # Set to 'Overseas internship program' only
        startDate, endDate = random_date(programType)  # Generate random start and end dates based on program type
        countryCode = random.choice(country_code)
        city = 'City ' + str(i+1)  # Placeholder city name
        partnerName = 'Partner ' + str(i+1)  # Placeholder partner name
        overseasPartnerType = random.choice(overseas_partner_types)
        tripLeaders = 'Unassigned '
        estNumStudents = '1'
        if startDate.year < 2024:  # If the start date is before 2024, set it as 'Approved'
            approved = 'Approved'
        else:
            approved = random.choice(approval_statuses)
        date_value = ""
        if approved == 'Approved':
            date_value = f"{startDate.strftime('%d/%m/%Y')} to {endDate.strftime('%d/%m/%Y')}"
        else:
            date_value = startDate.strftime('%B %Y')
        programs.append((programID, programName, programType, date_value, countryCode, city, partnerName, overseasPartnerType, tripLeaders, estNumStudents, approved))
        
    return programs

def insert_into_table(table_name, data, conn):
    with conn.cursor() as cursor:
        for row in data:
            placeholders = ', '.join(['%s'] * len(row))
            query = f"INSERT INTO {table_name} (`Program ID`, `Program Name`, `Program Type`, Date, `Country Code`, City, `Partner Name`, `Overseas Partner Type`, `Trip Leaders`, `Estimated students`, `Approve status`) VALUES ({placeholders})"
            cursor.execute(query, row)
    conn.commit()

conn = create_conn()

# Generate dummy data for 200 overseas programs
programs = generate_programs(500, conn)

# Insert the dummy data into the 'overseasPrograms' table
insert_into_table('overseasPrograms', programs, conn)

conn.close()  # Don't forget to close the connection
