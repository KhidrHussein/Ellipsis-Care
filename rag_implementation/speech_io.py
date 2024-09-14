import os
import time
import requests
import azure.cognitiveservices.speech as speechsdk
from dotenv import load_dotenv
load_dotenv()

# Define the endpoint and subscription key
url = f"https://eastus.api.cognitive.microsoft.com/speechtotext/transcriptions:transcribe?api-version=2024-05-15-preview"
subscription_key = os.getenv('SUBSCRIPTION_KEY')


# def transcribe_audio(audio_path):
#     try:
#         headers = {
#             'Ocp-Apim-Subscription-Key': subscription_key,
#             'Accept': 'application/json'
#         }

#         files = {
#             'audio': open(audio_path, 'rb')
#         }

#         json_data = {
#             "locales": ["en-US"],
#             "profanityFilterMode": "Masked"
#         }

#         response = requests.post(url, headers=headers, files=files, json=json_data)

#         if response.status_code == 200:
#             return response.json().get('combinedPhrases', [{}])[0].get('text', 'No transcription available')
#         else:
#             return "There was an issue with the transcription service. Please try again later."
    
#     except Exception as e:
#         return "An error occurred during transcription. Please try again later."



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
    # This example requires environment variables named "SPEECH_KEY" and "SPEECH_REGION"
    speech_config = speechsdk.SpeechConfig(subscription=os.getenv("SPEECH_KEY"), region=os.getenv("SPEECH_REGION"))
    audio_config = speechsdk.audio.AudioOutputConfig(filename=f"{file_prefix}_output.wav")

    # The neural multilingual voice can speak different languages based on the input text.
    speech_config.speech_synthesis_voice_name='en-NG-EzinneNeural'

    speech_synthesizer = speechsdk.SpeechSynthesizer(speech_config=speech_config, audio_config=audio_config)

    speech_synthesis_result = speech_synthesizer.speak_text_async(text).get()

    # if speech_synthesis_result.reason == speechsdk.ResultReason.SynthesizingAudioCompleted:
    #     print("Speech synthesized for text [{}]".format(text))
        
    # elif speech_synthesis_result.reason == speechsdk.ResultReason.Canceled:
    #     cancellation_details = speech_synthesis_result.cancellation_details
    #     print("Speech synthesis canceled: {}".format(cancellation_details.reason))
    #     if cancellation_details.reason == speechsdk.CancellationReason.Error:
    #         if cancellation_details.error_details:
    #             print("Error details: {}".format(cancellation_details.error_details))
    #             print("Did you set the speech resource key and region values?")

    # Read the content of the audio file as binary

    
    with open(f"{file_prefix}_output.wav", 'rb') as audio_file:
        binary_content = audio_file.read()
    
    # Delete the audio file after reading it
    state = True
    while state:
        try:
            os.remove(f"{file_prefix}_output.wav")
            state = False
        except:
            time.sleep(0.5)

    return binary_content

# Example usage
# synthesize_speech("I am excited to try text to speech", "123413")