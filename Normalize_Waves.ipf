#pragma rtGlobals=3		// Use modern global access method and strict wave access.



// Normalizes waves by dividing each wave by its maximum value
Function NormalizeWaves(wave_name_list)
	wave/T wave_name_list 	// this text wave is a list of the wave names that you want to normalize
							// populate this manually, unless you can come up with a clever function
	variable i
	variable imax=numpnts(wave_name_list)
	
	for(i=0;i<imax;i+=1)
		string wave_name_string=wave_name_list[i]
		wave wave_name=$wave_name_string
		variable maximumValue=wavemax(wave_name)
		wave_name=wave_name/maximumValue
	endfor
End