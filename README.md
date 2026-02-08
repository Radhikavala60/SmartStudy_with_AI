# 📘 Smart Study With AI

## 📌 Project Overview
**Smart Study With AI** is a Flutter-based mobile application designed to help students manage their study plans efficiently using smart, AI-based suggestions.  
The application uses **local data storage (SQLite)** to store study-related data such as subjects, study hours, and priority levels, and then applies rule-based AI logic to provide smart study recommendations.

This project is developed as part of the **Applied Learning Activity (ALA)** and is completed **individually**.

---

## 🎯 Objectives of the Project
- To develop a Flutter application with local data storage
- To implement CRUD operations (Store, Retrieve, Update)
- To apply basic AI logic for smart decision-making
- To understand SQLite integration in Flutter
- To provide a simple and user-friendly study management system

---

## 🧠 What is “AI” in this Project?
The AI in this project is **rule-based intelligence**, where user input data is analyzed and smart study suggestions are generated based on predefined conditions such as:
- Subject priority
- Study hours

Example:
- If priority is **High** and study hours are **low**, the app suggests giving more focus to that subject.

---

## 🛠️ Technologies Used
- **Flutter** – UI development
- **Dart** – Programming language
- **SQLite (sqflite)** – Local database
- **Android Studio / VS Code** – Development tools
- **GitHub** – Version control

---

## 📱 Application Features
- Add study subjects
- Enter study hours
- Set priority (High / Medium / Low)
- Store data locally using SQLite
- Retrieve stored study data
- Generate AI-based smart study suggestions
- Persistent data storage (data remains after app restart)

---

## 🗂️ Project Structure

---

## 🧾 Database Design (SQLite)
**Table Name:** `study`

| Column Name | Data Type |
|------------|----------|
| id | INTEGER (Primary Key) |
| subject | TEXT |
| hours | INTEGER |
| priority | TEXT |

---

## 🔄 Application Workflow
1. User enters subject name, study hours, and priority
2. Data is stored in SQLite database
3. Application retrieves stored data
4. AI logic analyzes the input
5. Smart study suggestion is displayed to the user

---

## 📸 Screenshots
Screenshots of the application are available in the `screenshots/` folder.

Examples:
- App Launch Screen
- Add Study Data Screen
- AI Suggestion Output
- Stored Data List

---

## ▶️ How to Run the Project
1. Install Flutter SDK
2. Connect an Android device or start an emulator
3. Clone this repository
4. Run the following commands:

```bash
flutter pub get
flutter run

