# Fridgify

## Authentication System

### Step 1 - Login with Credentials
To login, the client has to post his credentials as **JSON-Request** to the endpoint ***/auth/login/***.
#### Case 1: Valid Credentials + Valid Request
A valid request looks like the following:
```json
{
    "username": "ANY USERNAME",
    "password": "ANY PASSWORD"
}
```
The given credentials *username* and *password* should be valid, meaning the user exists in the database and the password is correct.

Making a **POST-Request** with valid credentials and valid request structure returns a JWT-Token containing a *user* containing the username and a random *secret*.
\
A JWT-Token could look like the following:
```JWT-Token
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZHVtbXlfbmFtZSIsInNlY3JldCI6ImRiZTNmZTU1NTVkNzg5NmYifQ.wJRluUMCQzXaVdwgf8nxvta50
wAoM1C4ujfV-h94f-A
```
Using jwt.io to decode the token you end up with the following JSON
```JSON
Header
{
  "typ": "JWT",
  "alg": "HS256"
}
Payload
{
  "user": "dummy_name",
  "secret": "dbe3fe5555d7896f"
}
Verify Signature
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  256 Bit Secret
) 
```
The **JSON Web Token (JWT)** can be used to request an **API-Token** from the endpoint ***/auth/token/***.
The Login Token is valid for **14 days**. **After 14 days** a new key has to be requested.

#### Case 4: Cached Token
There are cases, in which the client *already* has a **login token** (e.g. *Stay logged in*, etc.). In such cases the **POST-Request** has to be made differently than in *Case 1*.
\
Pass the **login token** inside of the ***Authorization-Header***. In doing so, the backend checks, if the token is valid, the same token is sent back in the response.
\
Example Header:
```
Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiZHVtbXlfbmFtZSIsInNlY3JldCI6ImRiZTNmZTU1NTVkNzg5NmYifQ.wJRluUMCQzXaVdwgf8nxvta50
wAoM1C4ujfV-h94f-A

Content-Type: application/json
...
```
*You do not need to send a body in the request.* The backend ***does not pay attention to the body***, if there is an **Authentication-Header**.

#### Case 3: Invalid Credentials
Invalid Credentials result in a **401: Unauthorized** response.

### Step 2: API-Authentication
In this step, the goal is to receive a client to make actual API calls.
#### Case 1: Valid Login Token
To authenticate a client for the API, send the token received in *Step 1* inside of a **Authorization-Header** to the endpoint ***/auth/token/*** via **POST**.
\
There is no need for a request body.
\
The client will receive a random 32-bit long HEX-encoded (64 chars long) key. A key has a validity of 1 hour (3600 seconds).

#### Case 2: Invalid Login Token
If the sent Login Token is passed the 14 days, is faulty (could not decode the key) or is not existing you will receive a **401: Unauthorized**. If you encounter this case, request a new login token.

### Step 3: Make API-Calls
To make API-Calls you are required to have a **valid API-Token**. The token should not be outdated and should exist inside of the database.
\
To make API-Calls to any endpoint, pass the API-Token inside of the **Authorization-Header**.

If the token exists and is still valid, the client is further checked, and if the checks pass, the client will receive a successful response.

If the token exists and is still valid, the client is further checked, and if the checks do not pass, the client will receive a **401 Unauthorized**.

If the token exists and is outdated, the client will receive a **401 Unauthorized**.

If the token does not exist, the client will receive a **401 Unauthorized**.

## Important Things to Remember
1. Make sure you have a valid login token at all times.
2. Store the Login-Token locally for a longer duration, if the user gives consent, to make requests for API-Tokens even faster.
3. The API-Token should be stored in cache or locally.
4. Make sure the API-Token is valid and not outdated. \
**Remember:** API-Tokens are invalid after **1 hour**.
5. Don't forget to pass tokens in the **Authorization-Header** to a request otherwise the client is not authorized.

## Further Questions
For further questions, please contact either... \
... GitHub User - DonkeyCo (Duc Vo Ngoc) or \
... send an e-mail to <development@fridgify.donkz.dev>