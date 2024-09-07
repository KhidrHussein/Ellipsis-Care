import os
from pymongo import MongoClient

# Get Configuration Settings
from dotenv import load_dotenv
load_dotenv()

client = MongoClient(os.getenv("MONGODB_CONNECTION_STRING"))

db = client.ellipsis_care_db

collection = db["ellipsis_care_collection"]