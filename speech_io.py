import os
import requests
from dotenv import load_dotenv
load_dotenv()

# Define the endpoint and subscription key
url = f"https://eastus.api.cognitive.microsoft.com/speechtotext/transcriptions:transcribe?api-version=2024-05-15-preview"
subscription_key = os.getenv('SUBSCRIPTION_KEY')
SPEECH_REGION = os.getenv('SPEECH_REGION')
SPEECH_KEY = subscription_key

def transcribe_audio(audio_path):
    # Set up headers with your subscription key
    # subscription_key = 'YourSubscriptionKey'
    headers = {
        'Ocp-Apim-Subscription-Key': subscription_key,
        'Accept': 'application/json'
    }

    # Define the files and data for the request
    files = {
        'audio': open(audio_path, 'rb')  # Replace with your audio file path
    }
    data = {
        'definition': '''
        {
            "locales": ["en-US"],
            "profanityFilterMode": "Masked"
        }
        '''
    }
    # "channels": [0, 1]

    # Make the POST request
    response = requests.post(url, headers=headers, files=files, data=data)

    # Check the response
    if response.status_code == 200:
        # print('Success!')
        # print(response.json())
        # print(response.json()['combinedPhrases'][0]['text'])
        return response.json()['combinedPhrases'][0]['text']
    else:
        # print('Error:', response.status_code)
        # print(response.text)
        error_message = "Error: " + str(response.status_code) + "\n" + response.text
        return error_message


def synthesize_speech(text, file_prefix):
    """
    Synthesizes speech from text using Azure Cognitive Services Text-to-Speech API.

    Args:
    - text (str): The text to be synthesized to speech.
    - file_prefix (str): A unique prefix for the output file name.
    - resource_region (str): The region of the Azure resource (e.g., "eastus").
    - subscription_key (str): The subscription key for the Azure Cognitive Services.

    Returns:
    - None
    """
    # Define the URL and headers
    url = f"https://{SPEECH_REGION}.tts.speech.microsoft.com/cognitiveservices/v1"
    headers = {
        "Ocp-Apim-Subscription-Key": SPEECH_KEY,
        "Content-Type": "application/ssml+xml",
        "X-Microsoft-OutputFormat": "audio-16khz-128kbitrate-mono-mp3",
        "User-Agent": "curl"
    }

    # Define the SSML data with the provided text
    ssml_data = f"""
    <speak version='1.0' xml:lang='en-US'>
        <voice name='en-US-AvaMultilingualNeural'>
            {text}
        </voice>
    </speak>
    """

    # Make the POST request
    response = requests.post(url, headers=headers, data=ssml_data)

    # Save the response content to an MP3 file with a unique prefix
    file_name = f"{file_prefix}_output.mp3"
    with open(file_name, "wb") as audio_file:
        audio_file.write(response.content)

    print(f"Audio saved as {file_name}")

# Example usage
synthesize_speech("I am excited to try text to speech", "example")
