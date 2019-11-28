# Workflow - /fridge/content/
### Workflow 1: Add an Item to a fridge
#### Step 1: POST /fridge/content/\<fridge-id\>/
To add an item to a fridge, make a **POST-Request** to */fridge/content/\<fridge-id\>*, where *fridge-id* is the id of the fridge in the database.\
An URL could look like the following:\
`POST https://fridgapi.donkz.dev/fridge/content/101/`\
The example URL would add an item to the fridge with ID 101.\
The request body has the following structure:
```json
{
	"name": <item name>,
	"store": <store name>,
	"description": <description>,
	"amount": <numeric amount>,
	"unit": <unit>,
	"buy_date": <YYYY-mm-dd>,
	"expiration_date": <YYYY-mm-dd>
}
```
An example:
```json
{
	"name": "Ja! Milch",
	"store": "Rewe",
	"description": "Milk",
	"amount": 1,
	"unit": "l",
	"buy_date": "2019-09-12",
	"expiration_date": "2019-09-25"
}
```
The request requires an **Authorization-Header**. The header contains the **API-Token**.

There are multiple cases, which can return different responses:\
**Case 1 - Successfully added:**
* Response Status: 201 Created
* Response Body/Content: Item was added

**Case 2 - Already exists:**
* Response Status: 500 Internal Server Error
* Response Body/Content: Something went wrong adding the item. Probably already exists.
* Reason: Item probably already exists, that is why adding the item to the database failed.

**Case 3 - Missing attributes:**
* Response Status: 400 Bad Request
* Response Body/Content: Missing request attributes
* Reason: Missing request attributes

**Case 4 - Missing Token**
* Response Status: 401 Not Authorized
* Response Body/Content: Not Authorized
* Reason: Token missing

**Case 5 - Invalid Token**
* Response Status: 403 Forbidden
* Response Body/Content: Token not valid
* Reason: API-Token is wrong or not valid anymore

**Case 6 - User not authorized to use fridge**
* Response Status: 401 Unauthorized
* Response Body/Content: User not authorized to use fridge
* Reason: Fridge with fridge-id is not accessible for user.

### Workflow 2 - List Fridge Content:
#### Step 1: GET /fridge/content/\<fridge-id\>
To get all items for a fridge with the fridge id, make a **GET-Request** to */fridge/content/\<fridge-id\>*, where fridge-id is the ID of the fridge.\
`GET https://fridgapi.donkz.dev/fridge/content/101/`\
The example URL would list all items for fridge 101.\
The request requires an **Authorization-Header** containing the **API-Token**.

The following cases can occur:\
**Case 1 - Successful**
* Response Status: 200 OK
* Response Body:
```json 
[
    {
        "item__name": "Item A",
        "expiration_date": "2019-10-12",
        "amount": 10,
        "unit": "kg"
    },
    {
        "item__name": "Item B",
        "expiration_date": "2019-10-12",
        "amount": 10,
        "unit": "kg"
    }
]
```

**Case 2 - No Fridge:**
* Response Status: 404 Not Found
* Response Body/Content: Fridge not existing
* Reason: Fridge does not exist in database

**Case 3 - Missing Token**
* Response Status: 401 Not Authorized
* Response Body/Content: User Not Authorized
* Reason: Token missing

**Case 4 - Invalid Token**
* Response Status: 403 Forbidden
* Response Body/Content: Token not valid
* Reason: API-Token is wrong or not valid anymore

**Case 5 - User not authorized to use fridge**
* Response Status: 401 Unauthorized
* Response Body/Content: User not authorized to use fridge
* Reason: Fridge with fridge-id is not accessible for user.

**Case 6 - Internal Error**
* Response Status: 500 Internal Server Error
* Response Body/Content: Error retrieving fridge content.
* Reason: Something with the database went wrong.

### Workflow 3 - Remove an item from the fridge
#### Step 1 - DELETE /fridge/content/\<fridge-id\>/\<item-id\>
To delete an item from a fridge, make a **DELETE-Request** to */fridge/content/\<fridge-id\>/\<item-id\>*, where fridge id is the id of the fridge and item id is the ID of the item to be removed.\
An URL could look like the following:\
`POST https://fridgapi.donkz.dev/fridge/content/101/29`\
The example URL would delete item with ID 29 in fridge 101.\
The request requires an **Authorization-Header** containing the **API-Token**.

The following cases can occur:
**Case 1 - Successfully removed:**
* Response Status: 200 OK
* Response Body/Content: Successfully removed

**Case 2 - Internal Error:**
* Response Status: 500 Internal Server Error
* Response Body/Content: Error removing item
* Reason: Probably a database error

**Case 3 - Item not found:**
* Response Status: 404 Not found
* Response Body/Content: Nothing found
* Reason: Item does not exist in fridge

**Case 4 - Missing Token**
* Response Status: 401 Not Authorized
* Response Body/Content: User not Authorized
* Reason: Token missing

**Case 5 - Invalid Token**
* Response Status: 403 Forbidden
* Response Body/Content: Token not valid
* Reason: API-Token is wrong or not valid anymore