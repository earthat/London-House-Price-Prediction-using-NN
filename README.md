# London-House-Price-Prediction-using-NN
This one uses the NARX model to predict the forthcoming house price in months of 2017.

To execute this code run main.m in MATLAB. It will open a GUI and proceed further as desire.

To predict the house price, we need a dataset which can train the neural network. This dataset must be large enough to train the network so that overfitting of results can be avoided. We have used the dataset obtained from London data store. it contains the data form year 1995-2015. This is categorised as
•	ID (Transaction ID)
•	Date (Date processed, Month of transaction, Year of transaction, etc)
•	Transaction Price
•	Property classification (Type, Build, Tenure)
•	Address information (Postcode, Local authority, Full address, Borough, Ward, etc)
These variables are further divided as dependent variables and independent variables for the NN training. Out of these dependent variables will be the input for training and independent variable will act as target. The table of these variables is given as

|Dependent variables	|Independent Variables|
---------------------------------------------
|1. Date of transaction (Month, Year)|Price of property (£)|
|2.Type(Detached/Semidetached/Terrace/Flat)| |
|3. Build (Old/New) | |
|4. Tenure (Leasehold/Freehold)	| |

The data given is not statistical data but for the NN toolbox to feed, we need the data in that form so , we converted data into statistical format. 
•	the month/year of transaction is converted into decimal number series by using a MATLAB function 'datenum' .

example: datenum('01/05/2017')

ans =

      736700
•	property of four types in the data as shown in the table, we assigned decimal values to those as:
	Detached (D)=1
	Semi-detached (S)=2
	Terrace (T) =3
	Flat (F)=4

•	Build
	new (N)=1
	Old (Y) =2

•	Tenure
	Leasehold(L)=1
	FreeHold (F) =2

The dataset is very large and MATLAB can't handle this much dataset, so we used the dataset form only 2013-2015 and predicted the house price for 2016 first and used that to along with rest to predict the 2017 year house price.

The downloaded data is in csv format, so we converted that into .mat format first by importing the data into MATLAB import toolbox and then save as .mat file. We followed this process as importing the data form .csv file will take more time than .mat. 

After data is loaded into script and  assigned into corresponding variables, these values are normalised to reduce the difference in between all input and output values to NN. This way the similarity of data can be increased and accuracy of predicted price. 

