# Movie Database Analysis Project 🎬

A comprehensive analysis of movie industry data using MySQL, Python, and data visualization techniques.

## Project Overview

This project analyzes movie industry data to uncover insights about:
- Most profitable movie genres
- Correlation between movie budgets and box office revenues
- Top performing countries in film production
- Analysis of highest-grossing films

## Technology Stack

- **Database:** MySQL 8.0+
- **Programming Language:** Python 3.x
- **Python Libraries:**
  - mysql-connector
  - pandas
  - seaborn
  - matplotlib

## Project Structure

```
├── movie_db_sql.sql           # Database schema and data
├── movie_db_sql_queries.sql   # Analysis queries
└── movie_db_finish.py         # Analysis implementation
```

## Features

- **Genre Analysis:** Identifies the most profitable movie genres for investment recommendations
- **Budget vs Revenue:** Visualizes correlation between movie budgets and box office returns
- **Geographic Analysis:** Shows top 5 countries by average movie revenue
- **Top Performers:** Lists top 10 movies by revenue

## Key Findings

The analysis provides insights into:
- Most profitable genres in the film industry
- Budget-revenue relationship through correlation analysis
- Countries with highest average movie revenues
- Market performance of top films

## Database Schema

The database consists of 5 main tables:
- `movie` - Core movie information including financials
- `director` - Director details
- `genre` - Movie genres
- `country` - Production countries
- `language` - Movie languages

## How to Run

1. Import the database schema:
```sql
mysql -u root -p < movie_db_sql.sql
```

2. Run the analysis script:
```python
python movie_db_finish.py
```

## Visualizations

The project generates:
- Scatter plot of budget vs revenue correlation
- Bar chart of top performing countries
- Statistical summaries of genre performance

## License

This project is available under the MIT License.
