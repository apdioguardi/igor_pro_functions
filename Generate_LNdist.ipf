#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function LNDistGenerator(Base_Wave_String) // e.g. "Cu403_90d_6p5T" 
	string Base_Wave_String
	
	string Sigma_Wave_String = Base_Wave_String + "_Sigma"
	wave Sigma_Wave = $Sigma_Wave_String
	
	string Mu_Wave_String = Base_Wave_String + "_Mu"
	wave Mu_Wave = $Mu_Wave_String
	
	string T2Ginv_Wave_String = Base_Wave_String + "_T2Ginv"
	wave T2Ginv_Wave = $T2Ginv_Wave_String
	
	string R_Wave_String = Base_Wave_String + "_R"
	wave R_Wave = $R_Wave_String
	variable R_Wave_length=numpnts(R_Wave)
	
	string P_Wave_names_string = Base_Wave_String + "_PWaveNames"
	wave/T P_wave_names = $P_wave_names_string
	
	string temp_Wave_String = Base_Wave_String + "_temp"
	wave temp_wave = $temp_wave_string
	
	variable i
	variable imax=numpnts(temp_wave)
	for(i=0;i<imax;i+=1)
		wave P_wave=$P_Wave_names[i]
		P_wave = (1/(Sigma_Wave[i]*R_Wave*sqrt(2*pi)))*exp((-0.5)*((ln(R_Wave) - Mu_Wave[i])/Sigma_Wave[i])^2)
	endfor
End