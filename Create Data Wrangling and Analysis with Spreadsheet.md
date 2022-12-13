# Create Data Wrangling and Analysis with Spreadsheet
**I studied the correlation between consumer price index (inflation) vs property sales and prices in Melbourne, Victoria, Australia, for over ten years**

## Data Collection
### Data sources
**The data collected from ...**
##### [Australian Bureau of Statistics](https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/consumer-price-index-australia/sep-quarter-2022#using-price-indexes)
### Platforms and tools
#### As the data is a small dataset, the spreadsheet has been used to
- Extract-Load-Clean-Merge-Transform
- There were too many attributes available, state, cities, areas etc. Only mean, median, and number of sales of houses, units, and apartments have been selected
- The date value was in "mmm-yyyy" format, it was split into 2 different columns via "=LEFT(Date,3)" and "=RIGHT(Date,4)" as year and month.
- The data was available in quarterly format; therefore, the September value of each year has been picked by "advanced filtering".
- The "=QUERY(Data,"SELECT A,AVG(B) GROUP BY A",1)" google spreadsheet formula has been used to get median prices of the each year.

## Data Visualization
### Google Data Studio
As it is well integrated with Google Cloud Bigquery, I visualized with Google Datastudio, or Google data Looker
#### [Live Dashboard](https://datastudio.google.com/reporting/ad368e2c-34ff-436b-a9d1-127288433fda)
## ![](https://github.com/Ahmet-Ozkaya/Data-Analytics/blob/main/victoria_housing_outlook_dashboard.png)
