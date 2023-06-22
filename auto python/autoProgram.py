import pymysql
import random
from datetime import date, timedelta

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='overseas_travel_proto')
    return conn

global_date = date(2023, 1, 1)  # This date will be incremented for each program

def random_date(num_days, for_internship=False):
    """Generate a random date within num_days after the global date."""
    global global_date
    random_days = random.randrange(num_days) if not for_internship else random.randrange(num_days*30, (num_days+1)*30)
    result_date = global_date + timedelta(days=random_days)
    global_date = result_date
    return result_date

def generate_programs(num_programs, conn):
    # Fetch country names from the 'countries' table
    with conn.cursor() as cursor:
        cursor.execute("SELECT countryCode FROM countries")
        country_code = [row[0] for row in cursor.fetchall()]
    
    programs = []
    major_program_types = ['Overseas educational trip', 'Overseas internship program', 'Overseas immersion program']
    other_program_types = ['Overseas Competition/Exchange', 'Overseas Leadership Training', 
                     'Overseas Leadership Training with Outward Bound',
                     'Overseas Service Learning-Youth Expedition Programme']
    overseas_partner_types = ['Company', 'Institution', 'Others']
    approval_statuses = ['Approved', 'Rejected', 'Pending']
    
    for i in range(num_programs):
        programID = 'PROG' + str(i+1).zfill(5)
        programName = 'Program ' + programID
        programType = random.choice(major_program_types) if i < num_programs * 0.9 else random.choice(other_program_types)
        if programType == 'Overseas internship program':
            startDate = random_date(90, for_internship=True)  # Start dates are up to 3 months after the global date
            endDate = startDate + timedelta(days=random.randint(90,180))  # End dates are between 3 and 6 months after the start date
        else:
            startDate = random_date(7)  # Start dates are up to a week after the global date
            endDate = startDate + timedelta(days=random.randint(7,14))  # End dates are between 7 and 14 days after the start date
        countryCode = random.choice(country_code)
        city = 'City ' + str(i+1)  # Placeholder city name
        partnerName = 'Partner ' + str(i+1)  # Placeholder partner name
        overseasPartnerType = random.choice(overseas_partner_types)
        tripLeaders = None
        estNumStudents = None
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
programs = generate_programs(200, conn)

# Insert the dummy data into the 'overseasPrograms' table
insert_into_table('overseasPrograms', programs, conn)

conn.close()  # Don't forget to close the connection
