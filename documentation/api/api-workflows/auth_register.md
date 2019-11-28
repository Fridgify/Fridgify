# Workflow - /auth/register/
### Workflow 1: Register a new Account
#### Step 1: POST /auth/register/
To create a new account, make a **POST-Request** to */auth/register/*. The request body requires the following structure:
```json
{
	"username": <username>,
	"password": <password>,
	"email":<email>,
	"name":<name>,
	"surname":<surname>,
	"birthdate":<YYYY-mm-dd>
}
```
Here is an example:
```json
{
	"username": "muster",
	"password": "supersecretpassword",
	"email":"mustermann@mail.de",
	"name":"Max",
	"surname":"Mustermann",
	"birthdate":"1999-01-15"
}
```
There are multiple cases which can occur and return different responses:\
**Case 1 - Successful Account Creation**
* Response Status: 201 Created
* Response Body/Content: Successfully created

**Case 2 - Username exists already**
* Response Status: 409 Conflict
* Response Body/Content: Username already existing
* Reason: Username is already existing

**Case 3 - E-Mail exists already**
* Response Status: 409 Conflict
* Response Body/Content: E-Mail already existing
* Reason: E-Mail is already existing

**Case 4 - Missing Arguments**
* Response Status: 400 Bad Request
* Response Body/Content: Missing arguments
* Reason: Request is missing required arguments

**Case 5 - Internal Database Error**
* Response Status: 500 Internal Server Error
* Response Body/Content: Database Error. Contact your administrator.
* Reason: Something went wrong adding the user to the database. Probably a "duplicate" entry, which causes an error.