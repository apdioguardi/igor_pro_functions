#pragma rtGlobals=1		// Use modern global access method.

Function RemoveEvenOddPts(w,evenodd)
	Wave w
	Variable evenodd //=0 to remove even points, =1 to remove odd points
	Variable i
	
	WaveStats/Q w  
	Variable wavedim=V_npnts 	//needed to stop the do/while loop at the appropriate point number, 
								//it turns out that this number just needs to be longer than the total initial wave dimension
	i=evenodd
	do
		DeletePoints/M=0 i, 1, w	//delete the points starting at 
		i=i+1
	while (i<wavedim)
End