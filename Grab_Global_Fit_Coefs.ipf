#pragma rtGlobals=3		// Use modern global access method and strict wave access.

//==============================================================================
// GetGlobalCoeffs():
// 	grabs the global fit coefficients using the wave name list and coef_/sig_ 
// 	waves from global analysis. Note: need to initial waves for each dataset
//==============================================================================

Function GetGlobalCoefs()
	wave/T wave_name_list = Cu403_90d_6p5T_mWaveNames // needs to be changed !!!
	// this text wave is a list of the wave namesthat you want to normalize 
	// populate this manually, unless you can come up with a better idea

	// output combined coeff wave declarations
	wave Sigma_wave = Cu403_90d_6p5T_Sigma 				// needs to be changed !!!
	wave Mu_wave = Cu403_90d_6p5T_Mu					// needs to be changed !!!
	wave Sigma_err_wave = Cu403_90d_6p5T_SigmaErr	// needs to be changed !!!
	wave Mu_err_wave = Cu403_90d_6p5T_MuErr			// needs to be changed !!!
	
	// setup variable i and its length based on the length of the wave namelist 
	variable i
	variable imax=numpnts(wave_name_list)
	
	for(i=0;i<imax;i+=1)
		string Coef_wave_name_string="Coef_" + wave_name_list[i]
		wave coef_wave=$Coef_wave_name_string
		Sigma_wave[i]=coef_wave[0]
		Mu_wave[i]=coef_wave[1]
		string Sig_wave_name_string="Sig_" + wave_name_list[i]
		wave Sig_wave=$Sig_wave_name_string
		Sigma_err_wave[i]=sig_wave[0]
		Mu_err_wave[i]=sig_wave[1]
	endfor
End

//==============================================================================
//==============================================================================
