# Workflow - /fridge/management/create/
### Workflow 1: Create a fridge
#### Step 1: POST /fridge/management/create/
To create a fridge, make a **POST-Request** to */fridge/management/create/*, the request requires you to provide a body with information about the fridge.
An URL could look like the following:\
`POST https://fridgapi.donkz.dev//fridge/management/create/`\
The request body has the following structure:
```json
{
	"name": <item name>,
	"description": <description>,
}
```
An example:
```json
{
    "name": "Cool fridge",
	"description": "A cool fridge for me, myself and I",
}
```
The request requires an **Authorization-Header**. The header contains the **API-Token**.

There are multiple cases, which can return different responses:\

**Case 1 - Successfully added:**
* Response Status: 201 Created
* Response Body/Content: Created

**Case 2 - Token is missing:**
* Response Status: 403 Forbidden
* Response Body/Content: Authorization missing
* Reason: Authorization header and thus the token is missing.

**Case 3 - Token is expired:**
* Response Status: 401 Unauthorized
* Response Body/Content: Token expired. Request a new one.
* Reason: Token is no longer valid.

**Case 4 - Missing attributes:**
* Response Status: 400 Bad Request
* Response Body/Content: Missing parameters. Required are name and description
* Reason: Missing request attributes

**Case 5 - Duplicate fridge name**
* Response Status: 409 Conflict
* Response Body/Content: Fridge <\fridgeName\> already exists for user
* Reason: User tries to add a fridge with the same name
