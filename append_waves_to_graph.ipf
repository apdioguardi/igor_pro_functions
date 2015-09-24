#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function AppendWaves()
	wave/T Cu403_90d_6p5T_PwaveNames //need to populate this manually right now...
	wave Cu403_90d_6p5T_R
	
	variable i
	variable imin=0 //set to one more than the first wave, which I already plot manually
	variable imax=numpnts(Cu403_90d_6p5T_PwaveNames) //set to one greater than last wave to be appended
	
	for(i=imin;i<imax;i+=1)
		string P_string=Cu403_90d_6p5T_PwaveNames[i]
		wave P_wave=$P_string
		appendtograph P_wave vs Cu403_90d_6p5T_R //so the top graph needs to be made from the imin-1 waves
	endfor
End