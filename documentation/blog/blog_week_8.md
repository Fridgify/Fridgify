# Week 8 - Class diagram and database structure

As development keeps on we want to show you our current class diagrams and database structure. The latter was already mentioned in a previous blog post but we will be further elaborating on that. Our project is structured in backend and frontend, each with their respective technology stack.

We will start with our backend. We use Python with Django. Each request send to our backend get`s routed to their dedicated controller. These controllers have entrypoints processing requests. Python doesn´t force us to use classes and our backend structure isn´t enforcing it either. We cannot generate a class diagramm because of that. Django however creates a class for each table in our database to access them and gives us the opportunity to create a UML diagram from that. 

We take that opportunity and show you our previously contructed ER diagram, table structure and of course the generated class diagram.  
  
![Generated class diagram](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/database/generatedClassDiagram.png "Generated class diagram")

![ER diagram](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/database/Fridgify-ER.png "ER diagram")

![Table strucure](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/database/generatedClassDiagram.png "Table structure")

The frontend with flutter wasn't such a hassel and a small plugin helped us creating a class diagram. 

![Frontend class diagram](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/frontend/classDiagram.png "Frontend class diagram")

We are thrilled to hear your thoughts about the current state of the **Fridgify** project.
\
\
*Stay cool. Stay organised*
\
-Your **Fridgify Team**
