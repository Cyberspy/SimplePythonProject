# Imported packages
import os
from datetime import datetime

# Example of loading environment variables
log_file_name = os.getenv('DEBUG_LOG', './debug.log')

sales_force_client_id = os.getenv('SALESFORCE_CLIENT_ID')
sales_force_client_secret = os.getenv('SALESFORCE_CLIENT_SECRET')
sales_force_username = os.getenv('SALESFORCE_USERNAME')
sales_force_password = os.getenv('SALESFORCE_PASSWORD')
sales_force_user_token = os.getenv('SALESFORCE_USER_TOKEN')

#-----------------------------------------------------------------------
# general log function
#-----------------------------------------------------------------------
def log(message):
    dt = datetime.now()
    loginfo = f"{dt}: {message}"
    print(f"{loginfo}")
    with open(log_file_name, "a") as logfile:
        logfile.write(loginfo+"\n")

log ("Log started")