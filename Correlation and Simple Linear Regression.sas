%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
         Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;

ods graphics / reset=all imagemap;
proc corr data= stat1.ameshousing3 rank
			plots(only)=scatter(nvar=all ellipse=none);
		var &interval;
		with SalePrice;
		id PID;
		title "correlation and Scatter plot with Salesprice";
run;
title;


ods graphics off;
proc corr data=stat1.ameshousing3
			nosimple
			best=3;
			var &interval;
			title "Correlation and Scatter Plot Matrix of Predictors";
run;
title;




ods graphics;
proc reg data= stat1.ameshousing3;
	model SalePrice=Lot_Area;
	title "Simple Regression with Lot Area as Regressor or Predictors";
run:
quit;
