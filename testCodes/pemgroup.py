import pymysql

def create_conn():
    conn = pymysql.connect(host='localhost', user='root', password='', database='overseas_travel_proto')
    return conn

def insert_into_table(table_name, data, conn):
    with conn.cursor() as cursor:
        for row in data:
            try:
                placeholders = ', '.join(['%s'] * len(row))
                query = f"INSERT INTO {table_name} VALUES ({placeholders})"
                cursor.execute(query, row)
            except pymysql.Error as e:
                print(f"Error inserting row {row} into table {table_name}: {e}")
    conn.commit()

def generate_pemgroup_data(num_groups):
    pem_groups = []
    placeholder_name = 'Placeholder'

    for i in range(num_groups):
        pem_group_id = f"PEM{i+1:03}"
        pem_group_name = f"{placeholder_name} {i+1}"
        pem_groups.append((pem_group_id, pem_group_name))

    return pem_groups

conn = create_conn()

# Generate dummy data for pemGroup table
pem_groups = generate_pemgroup_data(50)  # Generate 50 pem groups

# Insert the dummy data into the 'pemGroup' table
insert_into_table('pemGroup', pem_groups, conn)

conn.close()  # Don't forget to close the connection
