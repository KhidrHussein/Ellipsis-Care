
from rag_implementation.config.database import collection

def get_or_create_mongo_user(postgres_user):
    new_user = {
        'name': postgres_user.username,
        'email_address': postgres_user.email,
        'full_history': [],
        'buffer_history': []
    }

    mongo_user = collection.find_one({"email_address": new_user["email_address"]})
    if not mongo_user:
        result = collection.insert_one(new_user)
        mongo_user = collection.find_one({"_id": result.inserted_id})

    return mongo_user
