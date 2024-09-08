from rag_implementation.config.database import collection
def serializer(record):
    return {
        "id": str(record["_id"]),
        "name": record["name"],
        "email_address": record["email_address"],
        "full_history": record["full_history"],
        "buffer_history": record["buffer_history"]
    }