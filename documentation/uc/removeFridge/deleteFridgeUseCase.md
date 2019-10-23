# Fridgify

## Use-Case Specification: Delete Fridge

## 1. Delete Fridge

### 1.1 Brief Description

Fridgify offers the option to manage multiple fridges. Therefore the option to delete fridges from an account has to be offered.

## 2. Flow of Events

### 2.1 Basic Flow

The user needs to log into the app. He can then press and hold on one fridge. A settings popup is displayed after holding for 2 seconds. The settings popup offers the option to share, edit and delete the fridge. The user can only click on delete if he has certain administrative permissions for the fridge. A confirmation popup is displayed should the user press on delete. The user is redirected to the main page and the fridge is deleted should he confirm the deletion.

### 2.1.1 Activity Diagram

![Activity diagram get fridges](https://github.com/DonkeyCo/Fridgify/blob/documentation/documentation/uc/deleteFridge/deleteFridgeActivityDiagram.png)

### 2.1.2 Mock Up

**n/a**

## 3. Special Requirements

### 3.1. Owning an account

In order to delete a fridge the user has to have an account. Only if he has one he will be able to delete a fridge.

## 4. Preconditions

### 4.1 The user downloaded the app 

The user has to have already downloaded the app.

### 4.1 The user already has a fridge connected to his account

The user has to have a connected fridge.

## 5. Postconditions

### 5.1 The deleted fridge is removed

The fridge is deleted in the database and is no longer displayed in the app.

## 6. Extension Points

**n / a**