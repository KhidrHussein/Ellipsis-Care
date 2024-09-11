from typing import Optional
from pydantic import BaseModel
from functions import prompt_setup
from functions import context_document_retreival_similarity, get_conversation_summary
from functions import qa_response
from config.database import collection
from schemas.schema import serializer

from bson import ObjectId

users = [
    {
        "name": "",
        "email_address" : "",
        "full_history": [],
        "buffer_history": []
    }
]

class User(BaseModel):
    name: str
    email_adderess: str
    full_history: list
    buffer_history: list

class UpdateUser(BaseModel):
    name: Optional[str] = None
    email_address: Optional[str] = None
    full_history: Optional[list] = None
    buffer_history: Optional[list] = None

def get_user(user_id: str):
    return serializer(collection.find_one({"_id": ObjectId(user_id)}))

def create_user(user: User):
    # if user_id in users:
    #     return {"Error": "User exists"}
    # users[user_id] = user
    new_user = dict(user)
    collection.insert_one(new_user)
    return serializer(collection.find_one({"email_address": new_user["email_address"]}))


def update_user(user_id: str, user: UpdateUser):
    existing_user = collection.find_one({"_id": ObjectId(user_id)})

    if not existing_user:
        return {"Error": "User does not exist"}
    
    existing_user = serializer(existing_user)
    update_data = {}

    if user.name != None:
        update_data['name'] = user.name
    else:
        update_data['name'] = existing_user['name']

    if user.email_address != None:
        update_data['email_address'] = user.email_address
    else:
        update_data['email_address'] = existing_user['email_address']

    if user.full_history != None:
        update_data['full_history'] = user.full_history
    else:
        update_data['full_history'] = existing_user['full_history']

    if user.buffer_history != None:
        update_data['buffer_history'] = user.buffer_history  
    else:
        update_data['buffer_history'] = existing_user['buffer_history']

    collection.update_one({"_id": ObjectId(user_id)}, {"$set": update_data})

def rag_response(user_id: str, query: str, knowledge_base: str):
    current_user = get_user(user_id)
    # print(current_user)
    full_history = current_user["full_history"]
    buffer_history = current_user["buffer_history"]
    prompt_template = prompt_setup()

    new_question = query
    if len(buffer_history)>0:
        new_question = get_conversation_summary("\n".join(buffer_history), query)

    documents, sources = context_document_retreival_similarity(new_question)
    full_prompt = prompt_template.format(history="\n".join(buffer_history), question=new_question, context=documents)
    # print(full_prompt)
    # print()
    response = qa_response(full_prompt)

    full_history.append(f"Human: {query}")
    full_history.append(f"AI: {response}")
    buffer_history.append(f"Human: {query}")
    buffer_history.append(f"AI: {response}")

    if len(buffer_history)>10:
        buffer_history = buffer_history[2:]

    # user_full_history = full_history
    # user_buffer_history = buffer_history
    updated = UpdateUser()
    updated.full_history = full_history
    updated.buffer_history = buffer_history
    update_user(user_id, updated)

    result = dict()
    result['response'] = response
    result['references'] = sources

    return result