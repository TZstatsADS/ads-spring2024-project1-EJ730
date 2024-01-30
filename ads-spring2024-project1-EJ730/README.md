# Applied Data Science @ Columbia
## Fall 2023
## Project 1: What made you happy today?

![image](figs/title.jpeg)

Term: Fall 2023

+ Projec title: Different People Have Different Sources of Happiness
+ This project is conducted by Peng Jiang

+ Project summary: Different people derive their happiness from different sources. By investigating these sources, we can fundamentally understand the key to enhancing happiness. We are fortunate to have access to the HappyDB database, which contains a wealth of workers' descriptions of their sources of happiness. By examining this dataset and identifying the diverse sources of happiness, we can assist factories in devising targeted incentive plans to boost happiness and, consequently, productivity. In this notebook, we employ R notebook for data mining and ultimately display the various sources of happiness for different people via word clouds.

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

lib:
    wordcloud.R: This file defines two helper functions, namely generate_wordcloud and draw_image. These are used to generate word clouds and load images to display on the screen, respectively.
data: This dir contains the raw datasets. The original data for this file comes from: 
        https://github.com/megagonlabs/HappyDB
doc:
    assignment.rmd: This .rmd file is the core of this data analysis project. All R code and    notebooks are defined within this .rmd file.
    assignment.html: The HTML file is generated from the assignment.rmd file through RStudio's knit function.
figs: This file stores the word cloud in PNG format. Due to version issues with wordcloud2, 
    more than one word cloud widget cannot be rendered in the knit HTML file. Therefore, webshot is used to screenshot it into PNG format first, and then the PNG files are extracted from this folder and rendered on the web page.
output: The output file stores some temporary files in this project, mainly the word cloud's htmlwidget.