## The Cool Company 
## **Fridgify** <br/>Software Requirements Specification <br/> For Fridge Content Tracking <br/> Version 1.1

| **Date** | **Version** | **Description** | **Author** |
| -------- | ----------- | --------------- | ---------- |
| 19.10.19 | 1.0 | Filling all information | Duc Vo Ngoc |
| 20.10.19 | 1.1 | Finalizing and filling in missing information | Duc Vo Ngoc |
| 28.11.19 | 1.2 | Add Use Cases to SRS | Duc Vo Ngoc |
| - | - | - | -|

## Table of Contents

1. [Introduction](#introduction)
    1. [Purpose](#purpose)
        1. [Scope](#scope) 
        2. [Definitions, Acronyms, and Abbreviations](#definitions-acronyms-and-abbreviations)
        3. [References](#references)
        4. [Overview](#overview)
2. [Overall Description](#overall-description)
3. [Specific Requirements](#specific-requirements)
    1. [Functionality](#functionality)
        1. [User Interface](#user-interface)
        2. [Scanning](#scanning)
        3. [REST API](#rest-api)
        4. [Notification Service](#notification-service)
    2. [Usability](#usability)
        1. [Ease of Use](#ease-of-use)
        2. [Fridges](#fridge-management)
    3. [Reliability](#reliability)
        1. [Code Coverage](#code-coverage)
        2. [Server Reliability](#server-reliability)
    4. [Performance](#performance)
        1. [Registering Items](#registering-items)
        2. [Unregistering Items](#unregistering-items)
    5. [Supportability](#supportability)
        1. [Coding Standards](#coding-standards)
        2. [Coding Conventions](#coding-conventions)
    6. [Design Constraints](#design-constraints)
        1. [MVC](#mvc)
        2. [Programming Languages](#programming-languages)
    7. [On-line User Documentation and Help System Requirements](#on-line-user-documentation-and-help-system-requirements)
    8. [Purchased Components](#purchased-components)
    9. [Interfaces](#interfaces)
        1. [User Interfaces](#user-interfaces)
        2. [Hardware Interfaces](#hardware-interfaces)
        3. [Software Interfaces](#software-interfaces)
        4. [Communications Interfaces](#communications-interfaces) 
    10. [Licensing Requirements](#licensing-requirements)
    11. [Legal, Copyright, and Other Notices](#legal-copyright-and-other-notices)
    12. [Applicable Standards](#applicable-standards)
4. [Supporting Information](#supporting-information)

# Software Requirements Specification

## Introduction
### **Purpose**

The **Fridgify SRS** provides a general overview over the project as
well as a detailed description. This document is going to delve into
the general vision, **Fridgify's** purpose and its features. System
specifications, interfaces and constraints of the product will be
illustrated in this **SRS**.

<a href="#scope"></a>
### **Scope**

**Fridgify** is a mobile application, designed to help people keep track
of the contents of their fridges. This is achieved by scanning the
barcode of a product and its due date, which will be kept track in a
database.\
The application should be free to download in **Apple's App Store** as
well as **Google's Play Store**.\
Furthermore, **Fridgify** requires an internet connection to fetch and
display results stored in our database. All information related to the
system, user and contents are maintained in a database, which is located
on a root server. The mobile app is going to interact with a Python
backend, which provides an API interface to retrieve, insert and process
data from the database. By using a centralized backend, the user can
synchronize his fridge on multiple devices alone and with different
users.

### **Definitions, Acronyms, and Abbreviations**

  | **Term** | **Definition** |
  | -------- | -------------- |
  User |               Someone who interacts with the mobile phone application
  Device |             Device, which allows users to keep track of their fridge contents (e.g. mobile phone, Raspberry Pi)
  REST    |            **RE**presentational **S**tate **T**ransfer is an architectural style for distributed hypermedia systems \[1\]
  API       |          Application Programming Interface connects *client* and *server*. \[2\]
  Application Store |  A mobile application store, where users can get the application (e.g. App Store, Play Store)
  OS              |    Operating System
  Android         |    Google's OS for mobile phones \[3\]
  iOS             |    Apple's OS for mobile phones \[4\]

### **References**

\[1\] "What is REST", <https://restfulapi.net/>\
\[2\] Braunstein, Mark L., „Health Informatics on FHIR: How HL7's New
API is Transforming Healthcare". Springer, 2018\
\[3\] "About the platform", <https://developer.android.com/about>\
\[4\] "iOS 13 -- Apple Developer", <https://developer.apple.com/ios/>

Here are documents and links which could be helpful to understand
**Fridgify**:

\[A\] Fridgify Blog: <https://fridgify.donkz.dev/>\
\[B\] Fridgify GitHub: <https://github.com/DonkeyCo/Fridgify>\
\[C\] UML-Diagram: [Google Drive](https://drive.google.com/file/d/1vWaFPm-F_uAU51sVGcWN9OgbxoCAegrX/view) OR [GitHub Blob](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/management/Overall%20Use%20Case%20Diagram.pdf)\
\[D\] Authentication Explanation: [How Fridgify's Authentication works](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/authentication/authentication_system.md)

### **Overview**

The remainder of the document includes three chapters. The second one
provides an overview of the system functionality and system interaction
with other systems.

The third chapter provides the requirement specification in detailed
terms and a description of the different system interfaces.

In chapter four, extra information is provided, such as appendixes, user
stories, etc.

## Overall Description
### **Product Perspective**

This system is going to consist of two parts: one mobile application and
one Web-API. The mobile application is used to keep track of contents
inside the fridge as well as registering and unregistering items. The
Web-API is used to store, retrieve and process data provided by the
backend.

The mobile application needs to communicate with a Web-API. The Web-API,
designed as a REST API, provides necessary data for the client.

Since this is a data centric product, a database is required to store
data. For a client to access data, he has to communicate with the REST
API, which in conclusion works with the database. No direct access to
the database is required. To communicate with the REST API, the client
needs to authenticate himself, otherwise operations for data retrieval
as well as data storing is prohibited.

### **Product Functions**

With the mobile app of Fridgify, the user is able to look into the items
his fridge contains. By registering, via scanning a barcode or manual
input, a user can add items to the tracking system. Via the mobile app a
user is able to unregister an item by removing the specific item from
the list by manual input (in later versions maybe by scanning?)

Scanning a barcode produces an article identifier provided by the code.
This code is used to store the product inside of a database or retrieve
information for the product. When scanning the barcode, the user can
scan the due date as well to keep track of it.

Messages are managed by the backend. By this, a user can be notified if
an item is expired, an item is out of stock or a reminder to buy new
items.

The Web API enables the client application to add and retrieve data via
GET and POST Requests. An OAuth 2.0 Authentication is needed to
communicate with the backend.

### **User Characteristics**

There is one only one user group interacting with the application. Each
user has the ability to manage his or her own fridge, they also have the
opportunity to join groups. Joining groups allows them to keep track and
manage their fridges with multiple users, which is helpful for families
or people sharing an apartment. Every user is able to register,
unregister and list items of a fridge.

### **Constraints**

The mobile application is constrained by the capacity of the database.
Since multiple users can request items, requests could be possibly
queued.

Requests to the backend by the mobile app are constrained by the server
capacities, high traffic could possibly lead to slower times.

An internet connection is recommended, because otherwise synchronization
with the database is not possible. Data is being stored in a local
database, if possible.

### **Assumptions and dependencies**

One assumption about the product is that it will be used on mobile
devices, which have the necessary computing power. If the phone does not
have enough hardware resources available for the application, there may
be scenarios where the application is not working properly.

## Specific Requirements
### **Functionality**
--------------
This section contains all the functional and quality requirements of the
system. It gives a detailed description of the system and all its
features.

#### User Interface

The user interface should be easily accessible. Users can log in and
register on a dedicated view.\
Users can access a list, showing every item registered in the fridge.
Inside that view, users can start a scanning process to register items,
register them manually or unregister them.

#### Scanning

Via the mobile application users should be able to scan barcodes of
items, which in turn registers them in the application. Scanning the
item automatically adds all information to a local or central database
for the user. Item information are stored in the database with the
barcode.\
Users can also scan expiration dates to keep track of their expiry.

#### REST API

The REST API provides information for each user. Via an OAuth 2.0
Authentication model, a mobile application can communicate with the
backend and retrieve data. Calling the API endpoints allows
applications to retrieve raw and processed data as well as adding
data.

#### Notification Service

The backend should send notifications to individual users. The
notification service notifies users when an item is expiring, updating
users of their current fridge status or empty items.

### **Usability**
-----------

#### Ease of use

Users should be able to easily keep track of their fridge.\
Scanning an item should only require the user a maximum of 3 to 4
clicks.\
Unregistering an item should only require the user a maximum of 3 to 4
clicks.\
Looking at the list of items should only require a maximum of 2 to 3
clicks.

#### Fridge Management

Users should be able to change a fridge easily. They should be able to
change registered fridges with a maximum of 3 clicks.

### **Reliability** 
--------------

#### Code Coverage

Via Unit Tests a code coverage of a minimum of 95% should be reached.
Reaching such a code coverage allows a very good reliability of both
the frontend and backend.

#### Server Reliability

The percentage of the backends time availability should be around 94%.
Restart of the backend should be automatically. Maintenance should not
interfere with the backends availability. The backend's maximum downtime
should have a maximum of 5 hours.

### **Performance**
--------------

#### Registering Items

Response time for registering items should have an average processing
time of 3 to 5 seconds and a maximum processing time of 10 seconds.

#### Unregistering Items

Unregistering items should have an average processing time of 3 to 5
seconds and a maximum processing time of 8 to 10 seconds.

### **Supportability**
--------------

#### Coding Standards

The python source code of the application must follow the [PEP 8 Style
Guide](https://www.python.org/dev/peps/pep-0008/) to guarantee readability and one style of code written by
multiple authors.\
The Flutter and Dart source code follows the official [Style Guide for Flutter](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo) as well as the official [Style Guide for Dart](https://dart.dev/guides/language/effective-dart/style) to guarentee readability and one style of code written by multiple authors.

### **Design Constraints**
--------------

#### MVC

Backend as well as frontend are being developed with MVC architecture.

#### Programming Languages

This application uses two different programming languages, Python 3.7
and Dart. A PostgreSQL Database is used to store data.

### **On-line User Documentation and Help System Requirements**
--------------

Documentation for the API will be available soon on a dedicated web
page. To be up to date with the newest development status, you can
follow the [Fridgify Blog](https://fridgify.donkz.dev/).

### **Purchased Components**
--------------

The following components were purchased:\
- Root Server (60GB SSD, 16GB RAM, Intel Xeon Gold 6140 / 6320)
- Domain

### **Interfaces**
--------------

#### User Interfaces

The following user interfaces are available:
* iOS Application
* Android Application

#### **Hardware Interfaces**

Fridgify can be combined with Smart Home Systems, such as Alexa, Google Assistant, Siri.\
The backend shall be used by a Raspberry Pi to register items. 
These hardware interfaces can be implemented in the future.

#### **Software Interfaces**

The application should be accessible from:\
· Android Devices\
· iOS Devices\
· (Raspberry Pi \[Microcontrollers in general\])

#### **Communications Interfaces**

The backend is accessible through HTTPS on port 443. Any unencrypted
connection over HTTP on port 80 are not supported and will be redirected
to HTTPS.

### **Licensing Requirements**
--------------

**Fridgify** is being distributed under the *Creative Commons Attribution-NonCommercial-NoDerivs (CC-BY-NC-ND) License*.\
You find more information [here](http://creativecommons.org/licenses/by-nc-nd/4.0/).

### **Legal, Copyright, and Other Notices**
--------------

This document makes use of the generic he for reasons of readability.
Any terms containing the words \"he\", \"himself\", \"his\", etc. are
meant to include both women and men, unless explicitly stated otherwise.

The Fridgify Team will not take any responsibility for forgotten items,
over purchases, etc.

### **Applicable Standards**
--------------

Additionally, the application must be developed to provide the best
possible security. Released code needs to be checked regarding the
following types of attack:

SQL injections

Cross-site scripting (XSS)

Cross-site request forgery (CSRF)

Manual security tests needs to be performed regulary.

## Supporting Information

[UML Diagram - GitHub](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/management/Overall%20Use%20Case%20Diagram.pdf) - UML Diagram for Fridgify (static version - GitHub)

[UML Diagram - Google Drive](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/management/Overall%20Use%20Case%20Diagram.pdf) - UML Diagram for Fridgify (dynamic version - Google Drive)

[Fridgify - Blog](https://fridgify.donkz.dev/) - The Fridgify Blog with
all news regarding Fridgify.

[Fridgify - GitHub](https://github.com/DonkeyCo/Fridgify) - The
Fridgify GitHub contains the source code.

[Fridgify - Project Management](https://fridgify-tracking.donkz.dev) -
Fridgify uses YouTrack for project management.
