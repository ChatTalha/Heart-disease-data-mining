# Heart Disease Prediction Project ❤️🏥

This project was developed as part of the **YBS461 Data Mining** course at **Bilecik Şeyh Edebali University - Management Information Systems** department.

The primary objective is to analyze a heart disease dataset obtained from Kaggle using the **R programming language** and to predict whether individuals have heart disease using machine learning algorithms.

---

## 📊 Project Summary

In this study, Exploratory Data Analysis (EDA) methods and classification algorithms were used to detect patients at risk of heart disease. Throughout the study, data was visualized, and models were built using decision trees and K-Nearest Neighbors (K-NN) algorithms.

* **Course:** YBS461 - Data Mining
* **Student:** Talha İşliyen
* **Semester:** 2023-2024 Fall

---

## 🛠️ Technologies and Libraries

The project is developed in **R**, and the following key packages were used for analysis:

* **ggplot2:** For data visualization and creating detailed graphics.
* **gridExtra:** To arrange multiple plots in a grid structure.
* **ROCR:** To evaluate model performance and plot ROC (Receiver Operating Characteristic) curves.
* **class / caret:** For K-NN algorithms and confusion matrix calculations.

---

## 📂 Dataset and Preprocessing

The analyzed dataset includes various health attributes of patients such as age, sex, cholesterol level, and blood pressure.

* **Target Variable:**
    * `0`: No Heart Disease.
    * `1`: Heart Disease Present.
* **Preprocessing:** Data was scaled using **Min-Max Scaling** and split into training and testing sets (70% Train - 30% Test) before modeling.

---

## 📈 Analysis and Methods

### 1. Exploratory Data Analysis (EDA)
The distributions of variables (histograms) and their relationships with the target variable were examined. The effects of variables like `age`, `trestbps`, and `chol` on the `target` were visualized.

### 2. K-Nearest Neighbors (K-NN) Classification
The model performance was tested using different `K` values.

* **Results for K=5:**
    * Accuracy: **66.11%**
    * Sensitivity: 76.22%
* **Results for K=10:**
    * Accuracy: **75.08%**
    * Sensitivity: 76.92%
    * Specificity: 73.42%

### 3. Model Optimization
To find the optimal `K` value, values from 1 to 15 were tested, and accuracy rates were compared on a plot. By selecting specific variables (`cp_0`, `sex_0`, `thal_2`, `slope_1`, `ca_2`), the model was optimized, raising accuracy rates up to **82%**.

### 4. Performance Evaluation (ROC Curve)
ROC curves were generated, and AUC (Area Under Curve) values were analyzed to measure the model's success.

---

## 📊 Visualizations
<img width="817" height="414" alt="Ekran görüntüsü 2025-11-22 170423" src="https://github.com/user-attachments/assets/7bcc4904-a6c2-4e06-bad8-fcfd6173aada" />

<img width="689" height="558" alt="Ekran görüntüsü 2025-11-22 170443" src="https://github.com/user-attachments/assets/c2861db9-cc39-467d-abc2-6ebf65e63ecf" />

<img width="539" height="683" alt="Ekran görüntüsü 2025-11-22 170501" src="https://github.com/user-attachments/assets/e5f70bf3-fc05-4053-9134-27afcb0e1dcf" />


---

## 🚀 Installation and Usage

To run this project on your local machine:

1.  Clone the repository:
    ```bash
    git clone [https://github.com/yourusername/project-name.git](https://github.com/yourusername/project-name.git)
    ```
2.  Open the project in RStudio.
3.  Install the required libraries:
    ```r
    install.packages(c("ggplot2", "gridExtra", "ROCR", "caret", "e1071"))
    ```
4.  Run the script file.

---
