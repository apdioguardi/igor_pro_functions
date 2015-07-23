#pragma rtGlobals=3		// Use modern global access method and strict wave access.

function ProcessFFT(base_wave_str, center_freq)
	string base_wave_str
	variable center_freq
	
	string r_wave_str=base_wave_str+"_r"
	string i_wave_str=base_wave_str+"_i"
	string freq_wave_str=base_wave_str+"_f"
	string m_wave_str=base_wave_str+"_m"
	
	LoadWave/G/D/W/O
	if (V_flag==0) // No waves loaded. Perhaps user canceled.
		return -1
	endif
	
	wave RealW
	wave ImagW
	wave Hz
	
	rename RealW $r_wave_str
	rename ImagW $i_wave_str
	rename Hz $freq_wave_str
	
	wave r_wave=$r_wave_str
	wave i_wave=$i_wave_str
	wave freq_wave=$freq_wave_str
	
	duplicate/O r_wave $m_wave_str
	
	wave m_wave=$m_wave_str
	
	m_wave=sqrt(r_wave^2 + i_wave^2)
	freq_wave=freq_wave*1e-6 + center_freq
	
	display m_wave vs freq_wave
	ModifyGraph rgb=(0,0,65280)
	showinfo
	//edit m_wave freq_wave
	
end