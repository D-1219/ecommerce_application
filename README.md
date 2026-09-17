# 🛒 E-Commerce Application

A mobile **E-Commerce Application** developed using **Flutter and Dart** in **Visual Studio Code**. The application demonstrates a complete shopping workflow, from user login and product browsing to adding products to a cart and viewing the order summary.

## 📱 Project Overview

The application provides a simple and user-friendly interface for customers to browse products, view product information, manage their shopping cart, and proceed through the basic ordering workflow.

The project focuses on understanding **Flutter UI development, navigation, reusable widgets, user interaction, and application structure**.

## ✨ Features

### 🔐 Login & Registration

* User login interface
* New user registration
* Form input fields
* Basic validation

### 🏠 Home Screen

* Displays available products
* Product categories
* Easy navigation to different sections
* Clean and responsive layout

### 🛍️ Product Listing

* Displays multiple products
* Product image, name, and price
* Product cards for better UI presentation
* Selection of individual products

### 📦 Product Details

* Displays detailed product information
* Product image
* Product name
* Price
* Description
* Add-to-cart option

### 🛒 Shopping Cart

* Add products to the cart
* View selected products
* Display product quantity and price
* Calculate the total amount
* Manage cart items

### 🧾 Order Summary

* Displays selected products
* Shows quantity and price
* Displays total order amount
* Provides a simple checkout workflow

## 🔄 Application Flow

```text
        Login / Register
              ↓
          Home Screen
              ↓
       Product Listing
              ↓
        Product Details
              ↓
         Add to Cart
              ↓
        Shopping Cart
              ↓
        Order Summary
```

## 📂 Project Structure

```text
ecommerce_application/
│
├── lib/
│   ├── main.dart
│   │
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── home_screen.dart
│   │   ├── product_details_screen.dart
│   │   ├── cart_screen.dart
│   │   └── order_summary_screen.dart
│   │
│   ├── widgets/
│   │   ├── product_card.dart
│   │   ├── custom_button.dart
│   │   └── cart_item.dart
│   │
│   └── models/
│       └── product.dart
│
├── assets/
│   └── images/
│
├── pubspec.yaml
├── README.md
└── .gitignore
```

## 🛠️ Technologies Used

| Technology             | Purpose                        |
| ---------------------- | ------------------------------ |
| **Flutter**            | Mobile application development |
| **Dart**               | Application programming        |
| **Visual Studio Code** | Development environment        |
| **Material Design**    | User interface components      |

## 🎯 Flutter Concepts Demonstrated

The project demonstrates several important Flutter concepts:

* `MaterialApp`
* `Scaffold`
* `AppBar`
* `Container`
* `Row`
* `Column`
* `ListView`
* `GridView`
* `Card`
