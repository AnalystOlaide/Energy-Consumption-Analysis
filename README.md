# Energy Consumption Analysis: Optimizing Power Distribution with SQL

## Project Overview
This project analyzes energy consumption data across various regions to identify trends, optimize energy distribution, and improve efficiency. By leveraging SQL for data extraction and Power BI for visualization, the project provides actionable insights into power usage patterns.

## Problem Statement
Energy consumption management is critical for ensuring efficient power distribution and reducing wastage. However, without proper analysis, energy providers struggle to allocate resources effectively. This project aims to address the following issues:
- Identifying regions with the highest and lowest energy consumption.
- Detecting peak usage hours to optimize power distribution.
- Finding trends in energy consumption over time.
- Comparing energy efficiency across different locations.

## Data Source
The dataset used for this project was synthetically generated using ChatGPT to simulate real-world energy consumption data. The structured dataset includes:
- **Energy Consumption Data**: Records of energy usage per region, timestamped with date and hour.
- **Regional Data**: Metadata about different geographical regions, including population size.
- **Weather Conditions**: Temperature and humidity data for each region to analyze external factors affecting energy use.

## Database Schema & Data Loading
The data is stored in a PostgreSQL database using the following schema:

### Table 1: `regions` (Stores regional information)
```sql
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50),
    population INT
);
```
#### Data Insertion for Regions
```sql
INSERT INTO regions (region_name, population) VALUES
('North', 500000),
('South', 700000),
('East', 600000);
```

### Table 2: `energy_consumption` (Stores energy usage per region, per hour)
```sql
CREATE TABLE energy_consumption (
    consumption_id SERIAL PRIMARY KEY,
    region_id INT REFERENCES regions(region_id),
    date DATE NOT NULL,
    hour_of_day INT CHECK (hour_of_day BETWEEN 0 AND 23),
    energy_consumed_mwh DECIMAL(10,2) NOT NULL
);
```
#### Data Insertion for Energy Consumption
```sql
INSERT INTO energy_consumption (region_id, date, hour_of_day, energy_consumed_mwh) VALUES
(1, '2024-03-01', 0, 150.75),
(1, '2024-03-01', 1, 140.30),
(1, '2024-03-01', 2, 135.25),
(2, '2024-03-01', 0, 175.50),
(2, '2024-03-01', 1, 160.20),
(2, '2024-03-01', 2, 158.75),
(3, '2024-03-01', 0, 130.60),
(3, '2024-03-01', 1, 145.90),
(3, '2024-03-01', 2, 140.10),
(1, '2024-03-02', 0, 155.80),
(1, '2024-03-02', 1, 138.60),
(2, '2024-03-02', 0, 178.40),
(2, '2024-03-02', 1, 162.50),
(3, '2024-03-02', 0, 135.75),
(3, '2024-03-02', 1, 147.20);
```

### Table 3: `weather_conditions` (Stores temperature & humidity data per region)
```sql
CREATE TABLE weather_conditions (
    weather_id SERIAL PRIMARY KEY,
    region_id INT REFERENCES regions(region_id),
    date DATE NOT NULL,
    temperature_celsius DECIMAL(5,2),
    humidity_percent DECIMAL(5,2)
);
```
#### Data Insertion for Weather Conditions
```sql
INSERT INTO weather_conditions (region_id, date, temperature_celsius, humidity_percent) VALUES
(1, '2024-03-01', 25.3, 60.5),
(1, '2024-03-02', 26.1, 58.2),
(2, '2024-03-01', 28.1, 65.2),
(2, '2024-03-02', 27.8, 64.0),
(3, '2024-03-01', 22.8, 55.0),
(3, '2024-03-02', 23.5, 53.5);
```

## Methodology
### Data Collection & Storage
- Data is stored in a SQL database with tables for energy consumption, weather conditions, and regions.
- Data cleaning is performed to handle missing or inconsistent values.

### Data Analysis with SQL
- **Exploratory Data Analysis (EDA)**: Queries to retrieve consumption trends.
- **Aggregations & Filtering**: Total energy consumption per region, per hour, and daily averages.
- **Rankings & Comparisons**: Identifying top energy-consuming regions.
- **Joins & Subqueries**: Combining datasets for richer insights.

## Insights
![image](https://github.com/user-attachments/assets/2b1e8ef8-8b57-4514-ba2c-ec4b551d6c90)
![image](https://github.com/user-attachments/assets/5408411a-a2cb-4f15-a1af-3bbbbab3eed6)
![image](https://github.com/user-attachments/assets/30448e5f-c3e3-41d0-9f42-3b475109777b)
![image](https://github.com/user-attachments/assets/5093d748-8f5c-4ba5-ba58-f6326da5dfc9)
![image](https://github.com/user-attachments/assets/f31e6e80-5243-4d78-9bf5-b1187838fbad)
![image](https://github.com/user-attachments/assets/06ffd559-06da-46f6-ba1f-555bf625c487)
![image](https://github.com/user-attachments/assets/6eb3bb86-6501-4e19-b10c-0bf1df049e74)
![image](https://github.com/user-attachments/assets/6b7fca43-5be7-48e3-994b-82be6f8f3808)
![image](https://github.com/user-attachments/assets/6bf2d7c0-bbda-43f9-9859-37698417654f)
![image](https://github.com/user-attachments/assets/5fd682e6-c9ee-4e9d-be6a-ad4a3ac43ed6)
![image](https://github.com/user-attachments/assets/6b8707ae-3c20-43da-a2c6-a0e0067aa5ed)
![image](https://github.com/user-attachments/assets/c22e5525-6934-4744-8198-ca3f8e6fb453)
![image](https://github.com/user-attachments/assets/fe417f97-e572-438d-b3a9-40fff4f42742)
![image](https://github.com/user-attachments/assets/616f0c1c-7a42-4b7d-8728-55f6ad2ad3bc)
![image](https://github.com/user-attachments/assets/2b1e8ef8-8b57-4514-ba2c-ec4b551d6c90)
![image](https://github.com/user-attachments/assets/5408411a-a2cb-4f15-a1af-3bbbbab3eed6)
![image](https://github.com/user-attachments/assets/30448e5f-c3e3-41d0-9f42-3b475109777b)
![image](https://github.com/user-attachments/assets/5093d748-8f5c-4ba5-ba58-f6326da5dfc9)
![image](https://github.com/user-attachments/assets/f31e6e80-5243-4d78-9bf5-b1187838fbad)
![image](https://github.com/user-attachments/assets/06ffd559-06da-46f6-ba1f-555bf625c487)
![image](https://github.com/user-attachments/assets/6eb3bb86-6501-4e19-b10c-0bf1df049e74)
![image](https://github.com/user-attachments/assets/6b7fca43-5be7-48e3-994b-82be6f8f3808)
![image](https://github.com/user-attachments/assets/6bf2d7c0-bbda-43f9-9859-37698417654f)
![image](https://github.com/user-attachments/assets/5fd682e6-c9ee-4e9d-be6a-ad4a3ac43ed6)
![image](https://github.com/user-attachments/assets/6b8707ae-3c20-43da-a2c6-a0e0067aa5ed)
![image](https://github.com/user-attachments/assets/c22e5525-6934-4744-8198-ca3f8e6fb453)
![image](https://github.com/user-attachments/assets/fe417f97-e572-438d-b3a9-40fff4f42742)
![image](https://github.com/user-attachments/assets/616f0c1c-7a42-4b7d-8728-55f6ad2ad3bc)


## 🔍 **Insights**

### 1. **Top Energy-Consuming Regions**

* **South region** consistently recorded the **highest energy consumption**, followed by **North**, and then **East**.
* Despite having a higher population, **South's per capita energy usage** is significantly higher, indicating **potential inefficiency**.

### 2. **Low Consumption Regions**

* **East region** showed the **lowest total and per capita energy consumption**. However, its energy usage **spikes during certain hours**, indicating **intermittent high demand**.

### 3. **Peak Usage Hours**

* Across all regions, **peak energy consumption occurred between 6 PM and 9 PM**, aligning with post-work residential activities.
* Minimal usage was recorded **between 1 AM and 5 AM**, which could support load-shedding or maintenance windows.

### 4. **Day-to-Day Consumption Trends**

* Slight increases in consumption on the **second day (March 2)** across most regions, despite similar weather conditions—could be due to **weekend activities** or **region-specific events**.

### 5. **Weather & Energy Use Correlation**

* **Higher temperatures and humidity levels in the South** correlated with higher energy usage, possibly due to **increased use of cooling systems**.
* The **East, despite lower temperature and humidity**, had unexpectedly high nighttime usage—may indicate **industrial or commercial activity**.

---

## ✅ **Recommendations**

### 1. **Optimize Energy Allocation**

* **Prioritize energy supply** to the South region during **6–9 PM** due to consistently high demand.
* Consider **increasing baseline supply** in the North during early morning hours to meet gradual rising demand.

### 2. **Implement Energy Efficiency Campaigns**

* **Educate high-use regions (especially South)** on energy-saving habits.
* Encourage the use of **energy-efficient appliances and insulation** to reduce the impact of climate on consumption.

### 3. **Time-Based Energy Pricing**

* Introduce **differential pricing** (time-of-use tariffs) to **incentivize off-peak energy use**, especially for industrial users in East and South regions.

### 4. **Install Smart Grids in Key Areas**

* Deploy **smart meters and IoT-based monitoring** in South and North regions to better track real-time usage and automate load balancing.

### 5. **Forecasting & Demand Planning**

* Use historical consumption patterns and weather data to **predict future energy demand**, especially during hot seasons or events.

### 6. **Energy Source Diversification**

* Given the consistent demand peaks, explore **alternative/renewable energy integration** (e.g., solar storage systems in the South) to reduce pressure on the main grid.








