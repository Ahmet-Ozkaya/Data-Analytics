# Create Data Wrangling and Analysis with SQL
**I studied the correlation between consumer price index (inflation) vs property sales and prices in Melbourne, Victoria, Australia, for over ten years**

## Data Collection
### Data sources
**The data collected from ...**
##### [Australian Bureau of Statistics](https://www.abs.gov.au/statistics/economy/price-indexes-and-inflation/consumer-price-index-australia/sep-quarter-2022#using-price-indexes)
### Platforms and tools
#### The data has uploaded to Google Bigquery
- Extract-Load-Clean-Merge-Transform
- There were too many attributes available, state, cities, areas etc. Only mean, median, and number of sales of houses, units, and apartments have been selected
- The date value was in "mmm-yyyy" format, it was split into 2 different columns via "SELECT Right(bldg_approval_vic.Period,4) AS [Year], Left([bldg_approval_vic].[Period],3) AS [Month], bldg_approval_vic.Number FROM bldg_approval_vic" as year and month.
- The query "SELECT Right(bldg_approval_vic.Period,4) AS [Year], Round(Avg([bldg_approval_vic].[permit_number]),0) AS permit_number_avg FROM bldg_approval_vic GROUP BY Right(bldg_approval_vic.Period,4);
## Data Visualization
### Google Data Studio
As it is well integrated with Google Cloud Bigquery, I visualized with Google Datastudio, or Google data Looker
#### [Live Dashboard](https://datastudio.google.com/reporting/ad368e2c-34ff-436b-a9d1-127288433fda)
## ![](https://github.com/Ahmet-Ozkaya/Data-Analytics/blob/main/victoria_housing_outlook_dashboard.png)
