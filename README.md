# Retail Sales Analysis

## Overview

This project performs a statistical analysis of retail sales data to understand customer purchasing behavior and the impact of various factors on sales performance. The analysis focuses on two primary aspects:

1. The impact of holiday seasons on sales performance.
2. The effectiveness of markdowns in driving customer purchases.

The analysis is conducted using R programming language and utilizes several libraries for data manipulation, visualization, and statistical testing.

## Dataset

The dataset used for this analysis is sourced from Kaggle and consists of three primary files:

- `stores.csv`: Contains information about store characteristics (store ID, type, size).
- `features.csv`: Includes various features affecting sales (temperature, fuel prices, markdowns).
- `sales.csv`: Captures weekly sales data for each store.

## Requirements

To run this project, you need to have R installed along with the required packages listed in the `requirements.txt` file.

## Installation

1. Clone the repository:

git clone https://github.com/harshitajain805/-Statistical-Analysis-on-Retail-Sales-Data.git
cd Statistical-Analysis-on-Retail-Sales-Data

2. Open R or RStudio.

3. Install the required packages:

install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("lubridate")

4. Load the datasets into your working directory.

## Usage

1. Open the main R script (e.g., `stats_analysis.R`) in R or RStudio.
2. Run the script to perform data analysis and generate visualizations.
3. Review the output for insights regarding holiday impacts and markdown effectiveness on sales.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Kaggle for providing the dataset.
- The R community for their extensive library of packages that facilitate data analysis and visualization.
