## The Cool Company 
## **Fridgify** <br/>Software Architecture Document <br/>Version 1.1

| **Date** | **Version** | **Description** | **Author** |
| -------- | ----------- | --------------- | ---------- |
| 29.11.19 | 1.0.0 | Finalized Draft | Duc Vo Ngoc |
| - | - | - | -|

## Table of Contents
1. [Introduction](#introduction)
    1. [Purpose](#purpose)
    2. [Scope](#scope)
    3. [Definitions, Acronyms and Abbreviations](#definitions-acronyms-and-abbreviations)
    4. [References](#references)
    5. [Overview](#overview)
2. [Architectural Representation](#architectural-representation)
3. [Architectural Goals and Constraints](#architectural-goals-and-constraints)
4. [Use-Case View](#use-case-view)
    1. [Use-Case Realizations](#use-case-realizations)
5. [Logical View](#logical-view)
    1. [Overview](#overview)
    2. [Architecturally Significant Design Packages](#architecturally-significant-design-packages)
6. [Process View](#process-view)
7. [Deployment View](#deployment-view)
8. [Implementation View](#implementation-view)
    1. [Overview](#overview)
    2. [Layers](#layers)
9. [Data View](#data-view)
10. [Size and Performance](#size-and-performance)
11. [Quality](#quality)

## 1 Introduction
### 1.1 Purpose
This document provides a comprehensive architectural overview of the system, using a number of different architectural views to depict different aspects of the system. It is intended to capture and convey the significant architectural decisions which have been made on the system.

### 1.2 Scope
This document describes the technical architecture of the **Fridgify** project, including the structure of classes, modules, dependencies and server/client.

### 1.3 Definitions, Acronyms and Abbreviations
| **Term** | **Definition** |
| -------- | -------------- |
| Device | Device, which allows users to keep track of their fridge contents (e.g. mobile phone, Raspberry Pi)
| REST | **RE**presentational **S**tate **T**ransfer is an architectural style for distributed hypermedia systems \[1\]
| API | Application Programming Interface connects *client* and *server*. \[2\] |
| Application Store |  A mobile application store, where users can get the application (e.g. App Store, Play Store)
| OS | Operating System
| Android | Google's OS for mobile phones \[3\] |
| iOS | Apple's OS for mobile phones \[4\] |
| UC | Use Case |
| VCS | Version Control System |
| n/a | not applicable |

### 1.4 References
\[1\] "What is REST", <https://restfulapi.net/>\
\[2\] Braunstein, Mark L., „Health Informatics on FHIR: How HL7's New
API is Transforming Healthcare". Springer, 2018\
\[3\] "About the platform", <https://developer.android.com/about>\
\[4\] "iOS 13 -- Apple Developer", <https://developer.apple.com/ios/>

### 1.5 Overview
This document contains the Architectural Representation, Goals and Constraints as well as the Logical, Deployment, Implementation and Data Views.

## 2 Architectural Representation
![Architectural Representation](./architecture.png)

## 3 Architectural Goals and Constraints
In the backend we decided to use Django. Django allows us to utilize MVC in an easy and comprehendible way. Database tables are mapped to models, which are controlled by controllers, called handlers in our case, and are presented as HTTP and JSON responses.\
Our frontend is developed in Flutter, which allows an easy way to distribute our software to different platforms.\
Backend and frontend are being developed seperately, allowing them to live in a *separate eco-system* and being independent from one another.

## 4 Use-Case View
![Overall Use Case Diagram](../management/overall_ucd.png)

### 4.1 Use-Case Realizations
* [Use Case - Register](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/authentication/register.md)
* [Use Case - Login](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/authentication/login.md)
* [Use Case - Get Fridges](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/getFridges/getFridgesUseCase.md)
* [Use Case - Create Fridge](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/createFridge/createFridgeUseCase.md)
* [Use Case - Remove Fridge](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/removeFridge/deleteFridgeUseCase.md)
* [Use Case - Join Fridge](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/joinFridge/joinFridgeUseCase.md)
* [Use Case - Add Fridge Content](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/fridgeContent/addContent/addContentUseCase.md)
* [Use Case - Remove Fridge Content](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/fridgeContent/removeContent/removeContentUseCase.md)
* [Use Case - Get Fridge Content](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/fridgeContent/getContent/getFridgeContentUseCase.md)
* [Use Case - Change Content Volume](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/fridgeContent/changeContentVolume/changeContentVolume.md)

## 5 Logical View
**Frontend Logical View:**
![Frontend Logical View](./frontend_uml_mvc.svg)
**Backend Logical View:**
![Backend Logical View](./backend_uml_mvc.svg)

## 5.2 Architecturally Significant Design Packages
Structuring files is very important to keep a good overview of a projects resources. That is why the backend stores model files in **Fridgify_Backend.model**, controllers and utilities in **Fridgify_Backend.utils**, views are stored in **Fridgify_Backend.views** and url information are stored in **Fridgify_Backend.api_urls**.\
In the frontend views are stored in the **Fridgify.screens**.

## 6 Process View
TBD

## 7 Deployment View
![Deployment View](./deployment.svg)

## 8 Implementation View
n/a

## 9 Data View
![Database Model](../database/generatedClassDiagram.png)

## 10 Size and Performance
n/a

## 11 Quality/Metrics
We are using TeamCity as Continuous Integration tool to ensure a high quality of code and automize the deployment process. Whenever there is a new change in the **develop** branch, tests are automatically run and tested. If the tests run through, they are taken *live* to the development server.\
Whenever there is a new change in the **master** branch, a new docker image is being created on Docker Hub, where tests are also been run. After a successful build, the changes are taken live to the production server.\
Each development or production change should fulfill the following requirements:
* Test Coverage: Fridgify aims for at least **90 percent** code coverage