import os
from dotenv import load_dotenv

load_dotenv()

# print the loaded variables

for key in os.environ:
    print(key, os.getenv(key))
