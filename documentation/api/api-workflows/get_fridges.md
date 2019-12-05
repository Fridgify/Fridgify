# Workflow - /fridge/management/create/
### Workflow 1: Get fridges
#### Step 1: GET /fridge/
To list all fridges, make a **GET-Request** to */fridge/*.\
An URL could look like the following:\
`GET https://fridgapi.donkz.dev/fridge/`\

The request requires an **Authorization-Header**. The header contains the **API-Token**.

An example response:
The conditions for an item to qualify to a certain category are:

- Fresh - The item was bought in the last 5 days
- Due soon - The item's expires in less than 5 days
- Over due - The item is expired
- Total - The sum of fresh, dueSoon, overDue and all items not qualifying for any category

It is therefore completly possible to have a total greater to the sum of fresh, dueSoon and overDue
```json
{
    "fridges": [
        {
            "id": 2,
            "name": "Cool fridge",
            "description": "A cool fridge for me, myself and I",
            "content": {
                "total": 20,
                "fresh": 5,
                "dueSoon": 4,
                "overDue": 1
            }
        },
        {
            "id": 200,
            "name": "Another cool fridge",
            "description": "Another cool fridge for me, myself and I",
            "content": {
                "total": 8,
                "fresh": 5,
                "dueSoon": 2,
                "overDue": 1
            }
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
