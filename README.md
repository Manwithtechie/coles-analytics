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

├─ requirements.txt          # Python dependencies

└─ README.md                 # this file

---

## 🚀 Features (Planned)
✅ Synthetic data generator (Week 0)
⬜ ETL pipeline → SQLite database (Week 1)
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
git clone https://github.com/YOURNAME/coles-analytics.git
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

### 4. Generate synthetic data
```bash
python src/generate_synthetic.py
```

## **🧑‍💻 Author**

👋 Built by **[Manvith]**, Data Science enthusiast exploring **retail analytics, ML, and cloud deployment**.

Stay tuned — this repo will evolve week by week into a professional portfolio project.