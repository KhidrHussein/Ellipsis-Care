# utils.py
import requests

def transcribe_audio(file_path):
    # Replace with the actual transcription service URL
    transcription_service_url = 'https://transcription-service-url.com/transcribe'
    
    with open(file_path, 'rb') as audio_file:
        response = requests.post(transcription_service_url, files={'file': audio_file})
    
    if response.status_code == 200:
        # Assuming the transcription is returned in JSON format
        return response.json().get('transcription')
    else:
        return "Transcription failed."
