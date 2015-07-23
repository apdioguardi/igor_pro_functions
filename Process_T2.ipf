#pragma rtGlobals=3		// Use modern global access method and strict wave access.

function ProcessT2(base_wave_str)
	string base_wave_str
		
	string tau_wave_str=base_wave_str+"_tau"
	string m_wave_str=base_wave_str+"_m"
	
	LoadWave/G/D/W/O
	if (V_flag==0) // No waves loaded. Perhaps user canceled.
		return -1
	endif
	
	wave delay_table //should be tau
	wave nmr_response //should be magnitude
	
	rename delay_table $tau_wave_str
	rename nmr_response $m_wave_str
	
	wave tau = $tau_wave_str
	wave mag = $m_wave_str

	display mag vs tau
	ModifyGraph log(bottom)=1
	ModifyGraph mode=3,rgb=(0,0,0)
	
	//fit
	//Make/D/N=3/O W_coef
	//W_coef[0] = {1e6,414,1} //guess
	//FuncFit/NTHR=0/TBOX=768 T2_StrExp_Fit W_coef  mag /X=tau /D
	 
end