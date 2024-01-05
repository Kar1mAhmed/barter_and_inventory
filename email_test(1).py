from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from google_auth_oauthlib.flow import InstalledAppFlow
import base64
import os.path
from googleapiclient.discovery import build

# Set the OAuth 2.0 scope
SCOPES = ['https://www.googleapis.com/auth/gmail.send']

def get_gmail_service():
    creds = None
    token_path = 'token.json'

    # The file token.json stores the user's access and refresh tokens
    if os.path.exists(token_path):
        creds = Credentials.from_authorized_user_file(token_path)

    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                'client_secret_729700853123-1upulkgshbhup41hbo8b833tqdgma27d.apps.googleusercontent.com.json', SCOPES)
            creds = flow.run_local_server(port=0)

        with open(token_path, 'w') as token:
            token.write(creds.to_json())

    return build('gmail', 'v1', credentials=creds)

def send_message(service, sender, to, subject, body):
    message = create_message(sender, to, subject, body)
    send_message_internal(service, 'me', message)

def create_message(sender, to, subject, body):
    message = f"From: {sender}\nTo: {to}\nSubject: {subject}\n\n{body}"
    b64_message = base64.urlsafe_b64encode(message.encode('utf-8')).decode('utf-8')
    return {'raw': b64_message}

def send_message_internal(service, user_id, message):
    try:
        message = service.users().messages().send(userId=user_id, body=message).execute()
        print(f"Message Id: {message['id']}")
        return message
    except Exception as error:
        print(f"An error occurred: {error}")

# Example usage
gmail_service = get_gmail_service()
send_message(gmail_service, 'barteramherst@gmail.com', 'karim77645@gmial.com', 'Hello', 'Test Body')
