# 🎬 Netflix SQL Project for Beginners

Welcome to the **Netflix SQL Analysis Project** — a beginner-friendly SQL project where we explore and analyze Netflix's content dataset using MySQL. This project is designed to help you practice and improve your SQL skills with real-world data.

---

## 📌 Project Overview

In this project, we:
- Create and structure a MySQL database from a CSV file.
- Write SQL queries to analyze Netflix shows and movies.
- Learn how to filter, group, and sort data using SQL commands.

This project is great for:
- Students and beginners learning SQL
- Anyone preparing for SQL interviews
- Data enthusiasts exploring real datasets

---

## 📂 Dataset

- **Source:** [Netflix Titles Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **File:** `netflix_titles.csv`
- Contains TV Shows and Movies available on Netflix as of 2021.
- Includes columns like: `title`, `director`, `cast`, `country`, `release_year`, `rating`, `duration`, and more.

---

## 🛠️ Tools Used

- **MySQL Server** (any version)
- **MySQL Workbench** (or any SQL client)
- **CSV File** (Netflix dataset)

---

## 🧩 Key Concepts Practiced

- `CREATE DATABASE` and `CREATE TABLE`
- Importing CSV using `LOAD DATA INFILE`
- Using `SELECT`, `GROUP BY`, `ORDER BY`, and `WHERE`
- Data Aggregation with `COUNT()`
- Sorting and filtering data
- Using `SUBSTRING_INDEX` and `CAST` for text manipulation

---

## 📊 SQL Queries Included

Some of the questions we answer in this project:

- How many **Movies** vs **TV Shows** are on Netflix?
- What is the **most common rating**?
- Which **countries** have the most content?
- Who are the most frequent **directors**?
- Which **year** had the most releases?
- What is the **longest duration** for a movie or show?
- What are the top **5 genres**?

---

## 🚀 How to Use

1. Clone this repo or download the `.sql` and `.csv` files.
2. Open MySQL Workbench (or any SQL IDE).
3. Run the `netflix_analysis.sql` file.
4. Make sure to update the file path in the `LOAD DATA` query:
   ```sql
   LOAD DATA LOCAL INFILE 'your/path/netflix_titles.csv' ...
