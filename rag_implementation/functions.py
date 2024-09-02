import os

# Add OpenAI library
import openai

# Get Configuration Settings
from dotenv import load_dotenv
load_dotenv()

# Configure OpenAI API using Azure OpenAI
openai.api_key = os.getenv("API_KEY")
openai.api_base = os.getenv("ENDPOINT")
openai.api_type = "azure"  # Necessary for using the OpenAI library with Azure OpenAI
openai.api_version = os.getenv("OPENAI_API_VERSION")  # Latest / target version of the API

from langchain.embeddings import OpenAIEmbeddings

# OpenAI Settings
model_deployment = "text-embedding-ada-002"
# SDK calls this "engine", but naming it "deployment_name" for clarity

model_name = "text-embedding-ada-002"

# Embeddings
openai_embeddings: OpenAIEmbeddings = OpenAIEmbeddings(
    openai_api_version = os.getenv("OPENAI_API_VERSION"), openai_api_key = os.getenv("API_KEY"),
    openai_api_base = os.getenv("ENDPOINT"), openai_api_type = "azure"
)

# RAG Setup
from langchain.chat_models import ChatOpenAI

# LLM
llm = ChatOpenAI(temperature = 0.6, openai_api_key = os.getenv("API_KEY"), openai_api_base = os.getenv("ENDPOINT"), model_name="gpt-35-turbo", engine="Voicetask")

# Handling vector database
from langchain_chroma import Chroma
from langchain import PromptTemplate


vector_store_ellipsis = Chroma(
    collection_name="Ellipsis-Care-Docs",
    embedding_function=openai_embeddings,
    persist_directory="./Ellipsis-Care-Chroma-Vector-DB",  # Where to save data locally, remove if not neccesary
)

# Senior
# formerly called senior_db
def prompt_setup():
    template_s = """
    Use the following context (delimited by <ctx></ctx>) and the chat history (delimited by <hs></hs>) to answer the user's question. 
    If you don't know the answer, just say that you don't know, don't try to make up an answer.
    ------
    <ctx>
    {context}
    </ctx>
    ------
    <hs>
    {history}
    </hs>
    ------
    {question}
    Answer:
    """

    prompt = PromptTemplate(
        input_variables=["history", "context", "question"],
        template=template_s,
    )

    return prompt

# Verbosity
import langchain
langchain.verbose = False

def context_document_retreival_similarity(question_summary):
    results = vector_store_ellipsis.similarity_search(question_summary, k=5)
    context = ""
    check_sources = set()
    sources = []
    for result in results:
        cur_source = dict()
        cur_source["page_number"] = []
        context += result.page_content + "\n"
        new_source = result.metadata['source'].split("/")[-1]
        if new_source not in check_sources:
            cur_source["source"] = new_source
            cur_source["page_number"].append(result.metadata['page'])
            check_sources.add(new_source)
            sources.append(cur_source)
        else:
            for source in sources:
                if source["source"] == new_source:
                    source["page_number"].append(result.metadata['page'])

    return context, sources

def conversation_history_prompt(history, question):
    # Define the template string for summarizing conversation history
    template_summary = """
    "Given a chat history (delimited by <hs></hs>) and the latest user question \
    which might reference context in the chat history, formulate a standalone question \
    which can be understood without the chat history. Do NOT answer the question, \
    just reformulate it if needed and otherwise return it as is.
    ------
    <hs>
    {history}
    </hs>
    ------
    Question: {question}
    Summary:
    """

    # Create a PromptTemplate object
    prompt = PromptTemplate(
        input_variables=["history", "question"],
        template=template_summary,
    )

    return prompt.format(history=history, question=question)

def get_conversation_summary(history, question):
    # Get the conversation summary prompt
    formatted_prompt = conversation_history_prompt(history, question)

    # Query the Azure OpenAI LLM with the formatted prompt
    response = openai.ChatCompletion.create(
        engine="Voicetask",  # Replace with your Azure OpenAI deployment name
        # prompt=formatted_prompt,
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": formatted_prompt}
        ],
        # max_tokens=50,
        temperature=0.5
    )
    
    # Extract and return the summary from the response
    return response.choices[0].message['content']

def qa_response(prompt):

    # Query the Azure OpenAI LLM with the formatted prompt
    response = openai.ChatCompletion.create(
        engine="Voicetask",  # Replace with your Azure OpenAI deployment name
        # prompt=formatted_prompt,
        messages=[
            # {"role": "system", "content": "You are a helpful assistant vast in the Bible and its Doctrines."},
            {"role": "user", "content": prompt}
        ],
        # max_tokens=50,
        temperature=0.5
    )
    
    # Extract and return the summary from the response
    return response.choices[0].message['content']