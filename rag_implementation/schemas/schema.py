from config.database import collection
def serializer(record):
    return {
        "id": str(record["_id"]),
        "name": record["name"],
        "full_history": record["full_history"],
        "buffer_history": record["buffer_history"]
    }

# def get_last_added_item():
#     last_item = collection.find().sort("_id", -1).limit(1)
#     return last_item[0] if last_item.count() > 0 else None