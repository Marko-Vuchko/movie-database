import mysql.connector
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Konekcija na bazu i kreiranje kursora
mydb = mysql.connector.connect(
    host="localhost",
    user = "root",
    password = input("Unesite lozinku za MySQL root nalog: "),
    database = "movie"
)

if(mydb == None):
    print("Nije uspostavljena konekcija sa bazom!")
else:
    print("Konekcija sa bazom je uspostavljena.")
    
cursor = mydb.cursor()

# Analiza žanrova i preporuke za investicije
query_genres = """
    SELECT g.name AS genre, SUM(m.box_office - m.budget) AS profit
    FROM movie m
    JOIN genre g ON m.genre_id = g.genre_id
    GROUP BY g.name
    ORDER BY profit DESC
    LIMIT 3;
"""

cursor.execute(query_genres)
genres_results = cursor.fetchall()
df_genres = pd.DataFrame(genres_results, columns=["Genre", "Profit"])
print("Most profitable genres:\n", df_genres)

# Veza između budžeta i zarade
query_budget_revenue = """
    SELECT m.budget, m.box_office AS revenue
    FROM movie m
    WHERE m.budget IS NOT NULL AND m.box_office IS NOT NULL;
"""
cursor.execute(query_budget_revenue)
budget_revenue_results = cursor.fetchall()
df_budget_revenue = pd.DataFrame(budget_revenue_results, columns=["Budget", "Revenue"])

plt.figure(figsize=(10, 6))
sns.scatterplot(x=df_budget_revenue["Budget"], y=df_budget_revenue["Revenue"], color="blue")
plt.xlabel("Budget ($)")
plt.ylabel("Revenue ($)")
plt.title("Relationship between Budget and Revenue")
plt.show()

# Izračunavanje Pearson korelacije
correlation = df_budget_revenue.corr().iloc[0, 1]
print(f"Correlation between Budget and Revenue: {correlation:.2f}")

# Analiza zemalja produkcije
query_countries = """
    SELECT c.name AS country, AVG(m.box_office) AS avg_revenue
    FROM movie m
    JOIN country c ON m.country_id = c.country_id
    GROUP BY c.name
    ORDER BY avg_revenue DESC
    LIMIT 5;
"""
cursor.execute(query_countries)
countries_results = cursor.fetchall()
df_countries = pd.DataFrame(countries_results, columns=["Country", "Average Revenue"])

plt.figure(figsize=(10, 6))
sns.barplot(x=df_countries["Country"], y=df_countries["Average Revenue"], palette="viridis")
plt.xlabel("Country")
plt.ylabel("Average Revenue ($)")
plt.title("Top 5 countries with the highest average movie revenue")
plt.xticks(rotation=45)
plt.show()

# Najuspešniji filmovi
query_top_movies = """
    SELECT m.title, m.box_office AS revenue
    FROM movie m
    ORDER BY revenue DESC
    LIMIT 10;
"""
cursor.execute(query_top_movies)
top_movies_results = cursor.fetchall()
df_top_movies = pd.DataFrame(top_movies_results, columns=["Movie", "Revenue"])
print("Top 10 movies by revenue:\n", df_top_movies)

# Zatvaranje kursora i konekcije
cursor.close()
mydb.close()
