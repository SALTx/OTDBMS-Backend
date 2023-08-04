import pymysql
import random
from datetime import date, timedelta

def create_conn():
    conn = pymysql.connect(host='localhost',
                           user='root',
                           password='',
                           database='demo')
    return conn

def get_current_year():
    return date.today().year

def random_date(start_date, end_date):
    """Generate a random date within the given start and end dates."""
    num_days = (end_date - start_date).days
    random_days = random.randrange(num_days)
    result_date = start_date + timedelta(days=random_days)
    return result_date

def generate_programs(num_programs, conn):
    current_year = get_current_year()
    # Fetch country codes and aciCountry values from the 'countries' table
    with conn.cursor() as cursor:
        cursor.execute("SELECT countryCode FROM countries WHERE aciCountry='N'")
    # number of ACI and NON ACI countries hardcoded, change to A and change number of programs to be generated below to acheive wanted results
        country_data = cursor.fetchall()

    country_codes = [row[0] for row in country_data]


    programs = []
    program_types = ['Overseas educational trip', 'Overseas internship program', 'Overseas immersion program',
                     'Overseas Competition/Exchange', 'Overseas Leadership Training',
                     'Overseas Leadership Training with Outward Bound',
                     'Overseas Service Learning-Youth Expedition Programme']
    overseas_partner_types = ['Company', 'Institution', 'Others']

    for i in range(num_programs):
        programID = 'PROG' + str(i + 1).zfill(5)
        programName = 'Program ' + programID
        programType = choose_program_type(program_types)
        start_date, end_date = choose_dates(programType)
        estDate = None  
        countryCode = random.choice(country_codes)
        city = 'City ' + str(i + 1)  # Placeholder city name
        partnerName = 'Partner ' + str(i + 1)  # Placeholder partner name
        overseasPartnerType = random.choice(overseas_partner_types)
        tripLeaders = 'to be appointed'
        estNumStudents = 1  
        # Set Approve status based on program date
        if end_date.year > current_year:
            approve_status = random.choice(['Postponed', 'Planned','Cancelled'])
        else:
            approve_status = 'Approved'
        programs.append(
            (programID, programName, programType, start_date, end_date, estDate, countryCode, city, partnerName,
             overseasPartnerType, tripLeaders, estNumStudents, approve_status))

    return programs

def choose_program_type(program_types):
    """Choose a program type based on the given distribution."""
    main_programs = ['Overseas educational trip', 'Overseas internship program', 'Overseas immersion program']
    main_prob = 0.9
    other_programs = list(set(program_types) - set(main_programs))
    other_prob = (1 - main_prob) / len(other_programs)
    
    probabilities = [main_prob if program_type in main_programs else other_prob for program_type in program_types]
    program_type = random.choices(program_types, probabilities)[0]
    return program_type


def choose_dates(program_type):
    """Choose start and end dates based on the program type's duration requirements."""
    if program_type == 'Overseas internship program':
        min_duration = 90
        max_duration = 180
    else:
        min_duration = 7
        max_duration = 14
    
    current_year = get_current_year()
    start_date = date(current_year - 2, 1, 1)  # Two years before the current year
    end_date = date(current_year + 1, 12, 31)  # One year after the current year
    start_date = random_date(start_date, end_date)
    end_date = start_date + timedelta(days=random.randint(min_duration, max_duration))
    
    return start_date, end_date


def insert_into_table(table_name, data, conn):
    with conn.cursor() as cursor:
        placeholders = ', '.join(['%s'] * len(data[0]))
        query = f"INSERT INTO {table_name} (`Program ID`, `Program Name`, `Program Type`, `Start Date`, `End Date`, `Estimated Date`, `Country Code`, City, `Partner Name`, `Overseas Partner Type`, `Trip Leaders`, `Estimated students`, `Approve status`) VALUES ({placeholders})"
        cursor.executemany(query, data)
    conn.commit()

conn = create_conn()

# Generate dummy data for inserted amount of overseas programs
programs = generate_programs(200, conn)

# Insert the dummy data into the 'overseasPrograms' table
insert_into_table('overseasPrograms', programs, conn)

conn.close() 
