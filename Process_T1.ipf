#pragma rtGlobals=3		// Use modern global access method and strict wave access.

function ProcessT1(base_wave_str) //loads, names, processes and fits inversion recovery data
	string base_wave_str
		
	string twait_wave_str=base_wave_str+"_twait"
	string r_wave_str=base_wave_str+"_r"
	
	LoadWave/G/D/W/O
	if (V_flag==0) // No waves loaded. Perhaps user canceled.
		return -1
	endif
	
	wave delay_table //should be twait
	wave realW //should be real part
	
	rename delay_table $twait_wave_str
	rename realW $r_wave_str
	
	wave twait = $twait_wave_str
	wave re_part = $r_wave_str
	
	display re_part vs twait
	ModifyGraph log(bottom)=1
	ModifyGraph mode=3,rgb=(0,0,0)
	Label left "Real Echo Integral (arb. units)"
	Label bottom "twait(s)"
	
	//fit
	//Make/D/N=4/O W_coef
	//W_coef[0] = {3e6,.9,35,.8}
	//FuncFit/NTHR=0/TBOX=768 T1_S_1over2_stretched W_coef  re_part /X=twait /D 
end