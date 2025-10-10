# 🛒 Coles Retail Analytics Platform

A **production-style retail analytics project** inspired by Coles supermarket data.
This project simulates the workflow of a professional Data Science team: from **data engineering & ML modeling** to **API deployment, Dockerization, and Tableau dashboards**.

> 📌 Goal: Build a portfolio-ready end-to-end system using **Python, SQL, FastAPI, SQLite, Docker, Git, Tableau, and LLMs**.

---

## 📂 Project Structure
coles-analytics/

├─ data/                     # datasets (raw & processed)

│  ├─ raw/                   # synthetic/generated data

│  └─ processed/

├─ notebooks/                # analysis notebooks

├─ src/

│  ├─ etl/                   # ingestion, transform, load scripts

│  ├─ api/                   # FastAPI endpoints

│  ├─ models/                # ML models (forecasting, basket analysis, etc.)

│  └─ generate_synthetic.py  # synthetic data generator

├─ docker/                   # Dockerfiles and docker-compose

├─ tests/                    # unit tests

├─ docs/                     # docs
│  ├─ schema.md
├─ requirements.txt          # Python dependencies

└─ README.md                 # this file

---

## 🚀 Features (Planned)
✅ Synthetic data generator (Week 0)
✅ ETL pipeline → SQLite database (Week 1)
⬜ SQL analytics: basket analysis, promotions lift, RFM (Week 2–3)
⬜ ML models: forecasting, price elasticity (Week 3–4)
⬜ FastAPI microservice exposing endpoints (Week 4)
⬜ LLM-generated natural language insights (Week 5)
⬜ Dockerized deployment (Week 6)
⬜ Tableau dashboards (Week 6+)

---

## ⚙️ Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/Manwithtechie/coles-analytics.git
cd coles-analytics
```

### 2. Create virtual environment
```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

## 📅 **Project Progress**

### 🧱 **Week 0 – Setup & Data Generation**
- ✅ Initialized full GitHub project structure with modular folders.  
- ✅ Created `generate_synthetic.py` to produce **Coles-style synthetic retail data** (`transactions.json`, `transactions.csv`).  
- ✅ Established environment files (`.gitignore`, `requirements.txt`, `README.md`).  
- 🧠 *Key Takeaway:* JSON preserves hierarchy, CSV supports analytics — both essential for real ETL pipelines.  

---

### 🐳 **Week 1 – ETL Pipeline + Dockerization**
- ✅ Built ETL scripts (`src/etl/`) to transform raw data into **SQLite database** `analytics.db`.  
- ✅ Defined clean schema for `products`, `transactions`, and `transaction_items`.  
- ✅ Dockerized ETL with `docker/Dockerfile.etl` + `docker-compose.yml` for reproducibility.  
- ✅ Added VS Code extensions: *SQLite Explorer* and *Prettify JSON* for smoother workflow.  
- 🧠 *Key Takeaway:* Docker ensures consistent, portable environments—run anywhere with one command:  
  ```bash
  docker-compose up --build
  ```
 ---

### 📊 **Week 2 – SQL Analytics & Insights**

#### 📈 **Day 1 – SQL Setup & Sanity Checks**
- Verified all tables in `analytics.db` and checked row counts.  
- Created `01_basic_sql_checks.ipynb` and `sql/01_basic_checks.sql`.  
- Ensured schema consistency and data completeness before analysis.  
- 🧠 *Key Takeaway:* Always validate your data pipeline outputs before deriving insights — quality data ensures reliable analytics.  

---

#### 🧩 **Day 2 – Product & Category Performance**
- Built `02_product_performance.ipynb` + `sql/02_product_performance.sql`.  
- Conducted in-depth product and category analysis:  
  - 🔝 Top 10 products by revenue  
  - 💰 Category-level revenue, profit, and contribution percentage  
  - 📦 Average pricing insights per category  
- Visualized category revenue trends using Matplotlib.  
- 🧠 *Key Takeaway:* Retail analytics begins with identifying **hero products** and **high-margin categories** — the core of assortment optimization.  

---

#### 👥 **Day 3 – Customer Behavior Analysis**
- Developed `03_customer_behavior.ipynb` + `sql/03_customer_behavior.sql`.  
- Analyzed customer shopping behavior through:  
  - Total unique customers  
  - Average basket size  
  - Spend and transaction frequency per customer  
  - Recency–Frequency–Monetary (RFM) snapshot for future segmentation  
- Created visualizations for customer purchase frequency distribution.  
- 🧠 *Key Takeaway:* Understanding **customer frequency and spending patterns** is essential for loyalty segmentation and personalized marketing strategies.  

---

## 📚 **Learning Summary So Far**
| Module | Tools & Concepts Mastered | Outcome |
|:-------|:---------------------------|:--------|
| Week 0 | Python, Git, JSON/CSV | Synthetic retail dataset generation |
| Week 1 | SQLite, Docker Compose | Portable ETL pipeline & database |
| Week 2 | SQL, Pandas, Matplotlib | Product & Customer insights |

---

## 🔜 **Next Steps (Coming Week 2 Day 4 → Week 3)**
- Implement full **RFM Segmentation** in SQL + Python to classify customer loyalty.  
- Perform **time-based sales analysis** (by day, hour, week) to find peak periods.  
- Export analytical datasets for **Tableau dashboards** and visual storytelling.  
- Begin **machine learning modules** on demand forecasting and price elasticity modeling.  

## **🧑‍💻 Author**

👋 Built by **[Manvith]**, Data Science enthusiast exploring **retail analytics, ML, and cloud deployment**.

Stay tuned — this repo will evolve week by week into a professional portfolio project.
