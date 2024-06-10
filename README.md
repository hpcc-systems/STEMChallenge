# The 60-Minute STEM Music Challenge
Welcome to the challenge repo! Your assignment in this challenge is to answer as many questions below about the sample Million Song Dataset that is provided for you.
You will use the Enterprise Control Language (ECL) to answer these questions.

You will be introduced to big data concepts, how to process and analyze data using ECL (Enterprise Control Language). This challenge starts with an overview of ECL language and its syntax. Then students are given a series of problems ranging from easy to mid-level difficulty to solve. 

## Data Sources (Datasets)

The Million Song dataset will be used in this challenge. You will see a list of songs from 1922 - 2011.

The Data Dictionary with Field Names and their Descriptions can be found in the *DataDictionary* repo folder.

## Additional Docs and Resources

The slides and information presented in this workshop can be viewed in the *Docs* folder.

A wonderful "Cheat Sheet" is also located in the same *Docs* folder.

...and this link might also be helpful to you: [Learn ECL](https://solutionslab.hpccsystems.com/learn-ecl/introduction/)

## The Questions:

**Category One (MS1):**

(A) Reverse sort your dataset by *year*, and display only the first 50 (HINT: Use **SORT**, **CHOOSEN**, and **OUTPUT**). 

(B) Count the total number of records in the dataset (HINT: Use **COUNT**)  

(C) Count the total number of songs released in the *year* '2010' and display the first 50 results

(D) How many songs were produced by 'Prince' in '1982'?

(E) Who sang the song 'Into Temptation'?

(F) Sort songs by Artist (*artist_Name*) and Song Title (*title*), and output the first 100

(G)What are the hottest songs by year in the Million Song Dataset? Exclude songs with no *year* value. 
   HINT: Get the dataset’s maximum *song_hotness* value and use it in your output filter.


**Category Two (MS2):**

(A) Display all songs produced by the artist 'Coldplay' that have a Song Hotness (*song_hotness*) greater or equal to .75 ( >= .75 )

**SORT** the output by title.

Also, output the count of the total result.

(B) Count all songs whose *Duration* is between 200 AND 250 (inclusive) AND *song_hotness* is not equal to 0 AND *familiarity* > .9

(C) Create a new dataset which only has the *Title*, *Artist_Name*, *Release_Name* and *Year* information.

(D) Calculate Correlation:

Correlation between *song_hotness* AND *artist_hotness* and between *barsstartdev* AND *beatsstartdev*. 


**Category Three (MS3):**

(A) Create a new dataset which only has following conditions:

A new column (field) named *Song* that uses *Title* values (HINT: Song := Title;)

A new column (field) named *Artist* that uses *artist_name* values (HINT: Artist := Artist_Name;)

A new BOOLEAN Column (field) named *isPopular*, and is TRUE IF *song_hotness* is greater than .80

A new BOOLEAN Column (field) named *IsTooLoud* which is TRUE IF *Loudness* > 0

Display the first 100. Result should have 4 columns named *Song*, *Artist*, *isPopular*, and *IsTooLoud*

(HINT: a **TABLE** or a **PROJECT** will solve this!) 


(B) Display total number (**COUNT**)of songs per Year and count total songs released per year.

Result has 2 fields, *Year* and *TotalSongs*, verify count is 89

(C) Which Artist had the overall hottest songs between 2006-2007?

To solve this, calculate the average (**AVE**) *song_hotness* per Artist_name for Year 2006 and 2007.

## Submissions and Scoring

For this challenge you have been provided with a computer and a connection to the HPCC Challenge cluster. There is starting code and other resources in this repo's Code folder.
All of the questions listed above are also reproduced on your starting code file titled **BWR_MSDChallenge.ecl** - Use this file to answer the challenge questions and submit to the cluster with your team name included in the file.
Optionally, you can create a new file with your team name and challenge questions you answer correctly. (Example: Rename your **BWR_MSDChallenge.ecl** to **BWR_TeamECL.ecl**

- One point awarded for every correct answer in Category One.

- Two points awarded for every correct answer in Category Two.

- Three points awarded for every correct answer in Category Three.


The solutions for all of the questions will be posted here after the event.



