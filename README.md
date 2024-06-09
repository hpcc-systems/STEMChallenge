# The 60-Minute STEM Music Challenge
Welcome to the challenge repo! Your assignment in this challenge is to answer as many questions below about the sample Million Song Dataset that is provided for you.
You will use the Enterprise Control Language (ECL) to answer these questions.

You will be introduced to big data concepts, how to process and analyze data using ECL (Enterprise Control Language). This challenge starts with an overview of ECL language and its syntax. Then students are given a series of problems ranging from easy to mid-level difficulty to solve. 

## Data Sources (Datasets)

The million Song dataset will be used in this challenge.

The Data Dictionary with Field Nemes and their Descriptions can be fould in the *DataDictionary* repo folder.

## Additional Docs and Resources

The slides and information presented in this workshop can be viewed in the *Docs* folder.

A wonderful "Cheat Sheet" is also located in the same *Docs* folder.

...and this link might also be helpful to you: [Learn ECL](https://solutionslab.hpccsystems.com/learn-ecl/introduction/)

## The Questions:

**Category One (MS1):**

(A) Reverse sort your dataset by *year*, and display only the first 50 (HINT: Use **SORT**, **CHOOSEN**, and **OUTPUT**). 

(B) Count the total number of records in the dataset (HINT: Use **COUNT**)  

(C) Count the total number of songs released in *year* '2010' and display the first 50 results

(D) How many songs were produced by 'Prince' in '1982'?

(E) Who sang the song 'Into Temptation'?

(F) Sort songs by Artist (*artist_Name*) and Song Title (*title*), and output the first 100

(G)What are the hottest songs by year in the Million Song Dataset? Exclude songs with no *year* value. 
   HINT: Get the dataset’s maximum *song_hotness* value and use it in your output filter.


**Category Two (MS2):**

(A) Display all songs produced by the artist "Coldplay" that have a "Song Hotness" greater or equal to .75 ( >= .75 )

SORT the output by title.

Also, output the count of the total result

(B) Count all songs whose "Duration" is between 200 AND 250 (inclusive) AND "song_hotness" is not equal to 0 AND "familarity" > .9

(C) Create a new dataset which only has the "Title", "Artist_Name", "Release_Name" and "Year" information.

(D) Calculate Correlation:

Coorelation between "song_hotness" AND "artist_hotness“ and between "barsstartdev" AND "beatsstartdev"


**Category Three (MS3):**
(A) Create a new dataset which only has following conditions:

Column named Song that has Title values (Song := Title)

Column named Artist that has artist_name values (Artist := Artist_Name)

New BOOLEAN Column called isPopular, and it's TRUE is IF song_hotness is greater than .80

New BOOLEAN Column called IsTooLoud which is TRUE IF Loudness > 0

Display the first 100

Result should have 4 columns named Song, Artist, isPopular, and IsTooLoud

(B) Display number of songs per Year and count total songs released per year

Result has 2 fields, Year and TotalSongs, verify count is 89

(C) What Artist had the overall hottest songs between 2006-2007?

Calculate the average (AVE) song_hotness per Artist_name for Year 2006 and 2007

## Submissions and Scoring

For this challenge you have been provided with a computer and a connection to the HPCC Challenge cluster. There is starting code and other resources in this repo's Code folder.
All of the questions listed above are also reproduced oin your starting code file titled **BWR_MSDChallenge.ecl** - Use this file to answer the challenge questions and submit to the cluster with your team name included in the file.
Optionally, you can create a new file with your team name and challemge questions you answer correctly. (Example: Rename your **BWR_MSDChallenge.ecl** to **BWR_TeamECL.ecl**

- One point awarded for every correct answer in Category One.

- Two points awarded for every correct answer in Category Two.

- Three points awarded for every correct answer in Category Three.


The solutions for all of the questions will be posted here after the event.



