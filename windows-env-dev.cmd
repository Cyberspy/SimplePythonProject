@ECHO OFF
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO Setting up environment

ECHO Setting up for: Development
SET DEBUG_LOG=./debug.log

SET SALESFORCE_REVOKE_URL=https://test.salesforce.com/services/oauth2/revoke
SET SALESFORCE_AUTH_URL=https://test.salesforce.com/services/oauth2/token

SET SALESFORCE_CLIENT_ID=-SF Client Id-
SET SALESFORCE_CLIENT_SECRET=-SF Client Secret-
SET SALESFORCE_USERNAME=-SF Username-
SET SALESFORCE_PASSWORD=-SF Password-
SET SALESFORCE_USER_TOKEN=-SF User Token-

SET INVOICES_FROM_SERVICETRACKER_PATH=./files/invoicesReceived/
SET CLIENTS_FROM_SERVICETRACKER_PATH=./files/clientReceived/
SET INVOICES_TO_SERVICETRACKER_PATH=./files/invoicesToSend/
SET CLIENTS_TO_SERVICETRACKER_PATH=./files/clientToSend/

ECHO Salesforce Username: %SALESFORCE_USERNAME%
ECHO Debug log path: %DEBUG_LOG%
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

