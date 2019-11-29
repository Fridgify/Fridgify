# Workflow - /fridge/management/create/
### Workflow 1: Get fridges
#### Step 1: POST /fridge/
To list all fridges, make a **GET-Request** to */fridge/*.\
An URL could look like the following:\
`POST https://fridgapi.donkz.dev/fridge/`\

The request requires an **Authorization-Header**. The header contains the **API-Token**.

An example response:
```json
{
    "fridges": [
        {
            "id": 2,
            "name": "Cool fridge",
            "description": "A cool fridge for me, myself and I",
            "content": "tbd"
        },
        {
            "id": 200,
            "name": "Another cool fridge",
            "description": "Another cool fridge for me, myself and I",
            "content": "tbd"
        }
    ]
}
```

There are multiple cases, which can return different responses:\

**Case 1 - Successfully added:**
* Response Status: 200 OK
* Response Body/Content: List of fridges (see above)

**Case 2 - Token is missing:**
* Response Status: 403 Forbidden
* Response Body/Content: Authorization missing
* Reason: Authorization header and thus the token is missing.

**Case 3 - Token is expired:**
* Response Status: 401 Unauthorized
* Response Body/Content: Token expired. Request a new one.
* Reason: Token is no longer valid.
