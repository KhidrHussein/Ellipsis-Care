from typing import Optional
from pydantic import BaseModel
from functions import elementary_db, junior_db, senior_db
from functions import context_document_retreival_similarity, get_conversation_summary
from functions import qa_response
from config.database import client, collection
# from schemas.schema import serializer, get_last_added_item
from bson import ObjectId
