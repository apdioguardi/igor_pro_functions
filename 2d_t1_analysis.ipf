#pragma rtGlobals=1		// Use modern global access method.

Function ButtonProc_initpanel(initpanel_but) : ButtonControl		//create global variables, strings, and waves IF they do not exist (if the exist this button does nothing) (print negative response based only on the existence of variable "ncols")
	String initpanel_but											
	
	NVAR/Z var1 = ncols
	if(!NVAR_Exists(var1))
		Variable/G ncols = 0
		print "The panel is initialized and ready for use."
	else
		print "The panel was previously initialized. Please refrain from smashing this button again and again. It will have no effect."
	endif

	NVAR/Z var2 = nrows
	if(!NVAR_Exists(var2))
		Variable/G nrows = 0
	endif
	
	NVAR/Z var3 = slicenumber
	if(!NVAR_Exists(var3))
		Variable/G slicenumber = 0
	endif
	
	NVAR/Z var4 = startfreq
	if(!NVAR_Exists(var4))
		Variable/G startfreq = 0
	endif
	
	NVAR/Z var5 = endfreq
	if(!NVAR_Exists(var5))
		Variable/G endfreq = 0
	endif
	
	NVAR/Z var6 = freq
	if(!NVAR_Exists(var6))
		Variable/G freq = 0
	endif

	NVAR/Z var7 = smoothingfactor
	if(!NVAR_Exists(var7))
		Variable/G smoothingfactor = 1
	endif

	SVAR/Z svar1 = wave1D_str
	if(!SVAR_Exists(svar1))
		String/G wave1D_str
	endif

	SVAR/Z svar2 = wave2D_str
	if(!SVAR_Exists(svar2))
		String/G wave2D_str
	endif

	SVAR/Z svar3 = xwave_str
	if(!SVAR_Exists(svar3))
		String/G xwave_str
	endif
	
	SVAR/Z svar4 = ChosenFitFunction
	if(!SVAR_Exists(svar4))
		String/G ChosenFitFunction
	endif
	
	SVAR/Z svar5 = m0low
	if(!SVAR_Exists(svar5))
		String/G m0low
	endif
	
	SVAR/Z svar6 = m0high
	if(!SVAR_Exists(svar6))
		String/G m0high
	endif
	
	SVAR/Z svar7 = Flow
	if(!SVAR_Exists(svar7))
		String/G Flow
	endif
	
	SVAR/Z svar8 = Fhigh
	if(!SVAR_Exists(svar8))
		String/G Fhigh
	endif
	
	SVAR/Z svar9 = T1invlow
	if(!SVAR_Exists(svar9))
		String/G T1invlow
	endif
	
	SVAR/Z svar10 = T1invhigh
	if(!SVAR_Exists(svar10))
		String/G T1invhigh
	endif
	
	SVAR/Z svar11 = freqwave_str
	if(!SVAR_Exists(svar11))
		String/G freqwave_str
	endif

	wave/Z wave1 = fitpars2d
	if(!WaveExists(wave1))
		Make/O/D/N=3 fitpars2d 
	endif
	
	wave/Z textwave1 = fitconstr
	if(!WaveExists(textwave1))
		Make/O/T/N=6 fitconstr={"K0>0","K0<1e6","K1>0","K1<1","K2>0.01","K2<1000"}   //Values will need to be modified depending on the sample.
	endif	
End

Function T1_1over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*exp(-1*t*T1inv))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv
	
	return w[0]*(1-2*w[1]*(exp(-1*t*w[2])))
End

Function T1_3over2_1st_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((2/5)*exp(-6*t*T1inv)+(1/2)*exp(-3*t*T1inv)+(1/10)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv
	
	return  w[0]*(1-2*w[1]*((2/5)*exp(-6*t*w[2])+(1/2)*exp(-3*t*w[2])+(1/10)*exp(-1*t*w[2])))
End

Function T1_3over2_central(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((9/10)*exp(-6*t*T1inv)+(1/10)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv
	
	return  w[0]*(1-2*w[1]*((9/10)*exp(-6*t*w[2])+(1/10)*exp(-1*t*w[2])))
End

Function T1_3over2_NQR(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*exp(-3*t*T1inv))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv
	
	return  w[0]*(1-2*w[1]*exp(-3*t*w[2]))
End

Function T1_5over2_2nd_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((1/14)*exp(-15*t*T1inv)+(2/7)*exp(-10*t*T1inv)+(2/5)*exp(-6*t*T1inv)+(3/14)*exp(-3*t*T1inv)+(1/35)*exp(-1*t*T1inv))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv
	
	return  w[0]*(1-2*w[1]*((1/14)*exp(-15*t*w[2])+(2/7)*exp(-10*t*w[2])+(2/5)*exp(-6*t*w[2])+(3/14)*exp(-3*t*w[2])+(1/35)*exp(-1*t*w[2])))
End

Function T1_5over2_1st_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*(   (25/56)*exp(-15*t*T1inv)+ (25/56)*exp(-10*t*T1inv)+ (1/40)*exp(-6*t*T1inv)+(3/56)*exp(-3*t*T1inv)+ (1/35)*exp(-1*t*T1inv)   )    )
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*(   (25/56)*exp(-15*t*w[2])+ (25/56)*exp(-10*t*w[2])+ (1/40)*exp(-6*t*w[2])+(3/56)*exp(-3*t*w[2])+ (1/35)*exp(-1*t*w[2])   )    )
End

Function T1_5over2_central(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((50/63)*exp(-15*t*T1inv)+ (8/45)*exp(-6*t*T1inv)+(1/35)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((50/63)*exp(-15*t*w[2])+ (8/45)*exp(-6*t*w[2])+(1/35)*exp(-1*t*w[2])))
End

Function T1_5over2_NQR_3over2_1over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((25/28)*exp(-10*t*T1inv)+ (3/28)*exp(-3*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((25/28)*exp(-10*t*w[2])+ (3/28)*exp(-3*t*w[2])))
End

Function T1_5over2_NQR_5over2_3over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((4/7)*exp(-10*t*T1inv)+ (3/7)*exp(-3*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((4/7)*exp(-10*t*w[2])+ (3/7)*exp(-3*t*w[2])))
End

Function T1_9over2_central(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((7938/12155)*exp(-45*t*T1inv)+(1568/7293)*exp(-28*t*T1inv)+(6/65)*exp(-15*t*T1inv)+(24/715)*exp(-6*t*T1inv)+(1/165)*exp(-1*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((7938/12155)*exp(-45*t*w[2])+(1568/7293)*exp(-28*t*w[2])+(6/65)*exp(-15*t*w[2])+(24/715)*exp(-6*t*w[2])+(1/165)*exp(-1*t*w[2])))
End

Function T1_9over2_1st_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((2205/4862)*exp(-45*t*T1inv)+ (441/1430)*exp(-36*t*T1inv)+ (49/14586)*exp(-28*t*T1inv)+ (49/330)*exp(-21*t*T1inv)+ (5/312)*exp(-15*t*T1inv)+ (45/1144)*exp(-10*t*T1inv)+(361/17160)*exp(-6*t*T1inv)+ (1/264)*exp(-3*T1inv*t)+ (1/165)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((2205/4862)*exp(-45*t*w[2])+ (441/1430)*exp(-36*t*w[2])+ (49/14586)*exp(-28*t*w[2])+ (49/330)*exp(-21*t*w[2])+ (5/312)*exp(-15*t*w[2])+ (45/1144)*exp(-10*t*w[2])+(361/17160)*exp(-6*t*w[2])+ (1/264)*exp(-3*w[2])+ (1/165)*exp(-1*t*w[2])))
End

Function T1_9over2_2nd_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (360/2431)*exp(-45*t*T1inv) + (288/715)*exp(-36*t*T1inv) + (2048/7293)*exp(-28*t*T1inv) + (2/165)*exp(-21*t*T1inv) + (5/78)*exp(-15*t*T1inv) + (10/143)*exp(-10*t*T1inv)+(2/2145)*exp(-6*t*T1inv) + (1/66)*exp(-3*t*T1inv) + (1/165)*exp(-1*t*T1inv) ))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*( (360/2431)*exp(-45*t*w[2]) + (288/715)*exp(-36*t*w[2]) + (2048/7293)*exp(-28*t*w[2]) + (2/165)*exp(-21*t*w[2]) + (5/78)*exp(-15*t*w[2]) + (10/143)*exp(-10*t*w[2])+(2/2145)*exp(-6*t*w[2]) + (1/66)*exp(-3*t*w[2]) + (1/165)*exp(-1*t*w[2]) ))
End

Function T1_9over2_3rd_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((405/19448)*exp(-45*t*T1inv) + (729/5720)*exp(-36*t*T1inv) + (17689/58344)*exp(-28*t*T1inv) + (147/440)*exp(-21*t*T1inv) + (15/104)*exp(-15*t*T1inv) + (5/1144)*exp(-10*t*T1inv)+(147/5720)*exp(-6*t*T1inv) + (3/88)*exp(-3*t*T1inv) + (1/165)*exp(-1*t*T1inv) ))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*( (405/19448)*exp(-45*t*w[2]) + (729/5720)*exp(-36*t*w[2]) + (17689/58344)*exp(-28*t*w[2]) + (147/440)*exp(-21*t*w[2]) + (15/104)*exp(-15*t*w[2]) + (5/1144)*exp(-10*t*w[2])+(147/5720)*exp(-6*t*w[2]) + (3/88)*exp(-3*t*w[2]) + (1/165)*exp(-1*t*w[2]) ))
End

Function T1_9over2_4th_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (5/4862)*exp(-45*t*T1inv) + (8/715)*exp(-36*t*T1inv)+ (392/7293)*exp(-28*t*T1inv) + (49/330)*exp(-21*t*T1inv) + (10/39)*exp(-15*t*T1inv) + (40/143)*exp(-10*t*T1inv)+(392/2145)*exp(-6*t*T1inv) + (2/33)*exp(-3*t*T1inv) + (1/165)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*( (5/4862)*exp(-45*t*w[2]) + (8/715)*exp(-36*t*w[2])+ (392/7293)*exp(-28*t*w[2]) + (49/330)*exp(-21*t*w[2]) + (10/39)*exp(-15*t*w[2]) + (40/143)*exp(-10*t*w[2])+(392/2145)*exp(-6*t*w[2]) + (2/33)*exp(-3*t*w[2]) + (1/165)*exp(-1*t*w[2])))
End

Function T1_9over2_NQR_3over2_1over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (441/715)*exp(-36*t*T1inv) + (49/165)*exp(-21*t*T1inv) + (45/572)*exp(-10*t*T1inv) + (1/132)*exp(-3*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((441/715)*exp(-36*t*w[2]) + (49/165)*exp(-21*t*w[2]) + (45/572)*exp(-10*t*w[2]) + (1/132)*exp(-3*t*w[2]))) 
End

Function T1_9over2_NQR_5over2_3over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (576/715)*exp(-36*t*T1inv) + (4/165)*exp(-21*t*T1inv) + (20/143)*exp(-10*t*T1inv) + (1/33)*exp(-3*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((576/715)*exp(-36*t*w[2]) + (4/165)*exp(-21*t*w[2]) + (20/143)*exp(-10*t*w[2]) + (1/33)*exp(-3*t*w[2]))) 
End

Function T1_9over2_NQR_7over2_5over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (729/2860)*exp(-36*t*T1inv) + (147/220)*exp(-21*t*T1inv) + (5/572)*exp(-10*t*T1inv) + (3/44)*exp(-3*t*T1inv*t))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((729/2860)*exp(-36*t*w[2]) + (147/220)*exp(-21*t*w[2]) + (5/572)*exp(-10*t*w[2]) + (3/44)*exp(-3*t*w[2]*t))) 
End

Function T1_9over2_NQR_9over2_7over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((16/715)*exp(-36*t*T1inv) + (49/165)*exp(-21*t*T1inv) + (80/143)*exp(-10*t*T1inv) + (4/33)*exp(-3*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((16/715)*exp(-36*t*w[2]) + (49/165)*exp(-21*t*w[2]) + (80/143)*exp(-10*t*w[2]) + (4/33)*exp(-3*t*w[2]))) 
End

Function make2Dwave(but_make2Dwave) : ButtonControl	//need to make x and y waves that are 1 dimension larger if image plot is desired
	String but_make2Dwave
	NVAR nrows		//nrows usually = 1024, the number of digitized points in each 1D piece of the 2D *.tnt file.
	NVAR ncols		//ncols = the number of elements in the 2D delay table (twait for InvRec scans)
	SVAR wave1D_str
	Wave wave1D = $wave1D_str
	Variable i
	String s = NameOfWave(wave1D)+"_2D"
	
	Make/O/N=(nrows,ncols)/D $s

	Wave wave2D = $s
		i = 0
		do
			wave2D[][i] = wave1D[p+i*nrows]	
			i = i + 1		// execute the loop body
		while (i<ncols)		// as long as expression is TRUE
	
	Variable j
	Make/O/N=(nrows) revslice
	Make/O/N=(nrows) sortrevslice
	sortrevslice = p
		j = 0
		do							//Reverse the matrix columns to make the values go from low to high frequency.
			revslice=wave2D[p][j]
			Sort/R sortrevslice revslice
			wave2d[][j]=revslice[p]
			j = j + 1	
		while(j<ncols)
	KillWaves revslice sortrevslice
	
	print "Hazaa! Created 2D Wave:"print s
End

Function smooth2dwave(but_smooth2dwave) : ButtonControl
	String but_smooth2dwave
	Nvar smoothingfactor
	Nvar ncols
	Nvar nrows
	Svar wave1D_str
	string wave2D_temp_str=wave1D_str+"_2D"
	Wave wave2dim = $wave2D_temp_str
	Variable i
	String s=wave2D_temp_str+"_sm"
	
	Make/O/N=(nrows) inter1dwave
	Duplicate/O wave2dim wave2d_smth
	
	i = 0
	do
		inter1dwave = wave2dim[p][i]
		Smooth smoothingfactor, inter1dwave
		wave2d_smth[][i] = inter1dwave[p]
		i = i + 1		// increment the loop body
	while (i<ncols)		// as long as expression is TRUE
	Rename wave2d_smth $s
	Print wave2D_temp_str+" has been smoothed using the binomial algorithm."
End

Function ModifyFreqWave(but_modifyfreq) : ButtonControl
	String but_modifyfreq
	NVAR freq,nrows,ncols			//Pulsing/Acquisition frequency
	SVAR freqwave_str				//Name of the wave to be modified
	Wave freqwave = $freqwave_str
	Variable lastpoint=nrows*ncols
	string s=freqwave_str+"_img"
	
	DeletePoints nrows,lastpoint, freqwave
	freqwave = freqwave/10^6 + freq
	
	duplicate freqwave sortwave
	sortwave = freqwave*0 + p
	Sort/R sortwave freqwave
	KillWaves sortwave
	print NameOfWave(freqwave)+" has been redimensioned, reversed, and now has the correct values in MHz."
	
	duplicate freqwave $s
	InsertPoints 0,1, $s
End

Function image_slice(but_imageslice) : ButtonControl
	String but_imageslice
	NVAR slicenumber,ncols
	SVAR wave2D_str, xwave_str,ChosenFitFunction
	Wave wave2D = $wave2D_str
	Wave fitpars2D
	Wave xwave=$xwave_str
	Variable i
	
	Make/D/O/N=(ncols) slicewave
	
	i=0							//index of twait
	for(i=0;i<ncols;i=i+1)		//cycle through all the twait points
		slicewave[i] = wave2D[slicenumber][i]			//populate the slice wave
	endfor
	
	Display;AppendImage wave2D;DelayUpdate	
	ModifyImage $wave2D_str ctab= {*,*,RedWhiteBlue,0}
	
	Display slicewave vs xwave
	ModifyGraph standoff=0
	ModifyGraph log(bottom)=1
	ModifyGraph mode=3,useMrkStrokeRGB=1
	ModifyGraph marker(slicewave)=19
	FuncFit/NTHR=0/TBOX=768 $ChosenFitFunction fitpars2D  slicewave /X=xwave /D
	
End

Function FitT12D(but_fit2dwave) : ButtonControl
	String but_fit2dwave
	NVAR startfreq, endfreq		// fit wave with T1 data, output fit T1err
	SVAR wave2D_str, xwave_str,ChosenFitFunction,freqwave_str
	Wave wave2D = $wave2D_str
	Wave xwave = $xwave_str
	Wave W_sigma, fitpars2D	// 2D  wave, output
	Variable i, number_twait, number_freqs
	string s=xwave_str+"_img"
	string r=freqwave_str+"_img"
	wave fwave=$freqwave_str
	wave rwave=$r
	Variable starttop=rwave[startfreq-19]
	Variable stoptop=rwave[endfreq+21]
	Variable startbot=fwave[startfreq-20]
	Variable stopbot=fwave[endfreq+20]

	number_twait = DimSize(wave2D,1)
	number_freqs = DimSize(wave2D, 0)

	Make/D/O/N=(number_twait)  fitwave
	Make/D/O/N=(1024)  T1values
	Make/D/O/N=(1024)  T1errvalues
	Make/D/O/N=(1024)  T1chisq
	T1values=0
	T1errvalues=0
	T1chisq=0

	i=0									//index of frequency
	for(i=startfreq;i < endfreq;i=i+1)	//cycle through all the measured frequencies
	
		fitwave = wave2D[i][p]			//choose the row corresponding the the particular frequency
		FuncFit/NTHR=0/TBOX=768 $ChosenFitFunction fitpars2D fitwave /X=xwave /D /C=fitconstr // fit the data 
		T1values[i] = fitpars2D[2]         // update the output wave with the fitted values
		T1errvalues[i] = W_sigma[2]
		T1chisq[i]=V_chisq
	endfor
	
	string T1valsname_str=wave2D_str+"_T1invVals"
	string T1errvalsname_str=wave2D_str+"_T1invErrVals"
	string T1chisqname_str=wave2D_str+"_T1invChiSq"
	
	duplicate/O T1values $T1valsname_str
	duplicate/O T1errvalues $T1errvalsname_str
	duplicate/O T1chisq $T1chisqname_str
	
	duplicate/O xwave $s
	InsertPoints 0,1, $s
	
	appendtotable $T1valsname_str
	
	Variable maxT1inv=WaveMax($T1valsname_str)
	Display;AppendImage/R/T $wave2D_str vs {$r,$s};DelayUpdate		//Create image plot with overlayed T1 fit
	ModifyImage $wave2D_str ctab= {*,*,RedWhiteBlue,0} 
	ModifyGraph log(right)=1
	appendtograph $T1valsname_str vs $freqwave_str
	ModifyGraph mode=3,marker=19,rgb=(1,39321,19939),useMrkStrokeRGB=1
	ErrorBars $T1valsname_str Y,wave=($T1errvalsname_str,$T1errvalsname_str)
	Label bottom "Frequency (MHz)"
	Label left "T\\B1\\M\\S-1\\M (s\\S-1\\M)"
	Label right "twait (s)"
	ModifyGraph tick=2
	SetAxis top starttop,stoptop
	SetAxis bottom startbot,stopbot
	SetAxis left -1,maxT1inv
	ModifyGraph noLabel(top)=2
	ModifyGraph standoff=0
End

Window T1_2D_Analysis_Control() : Panel
	PauseUpdate; Silent 1		// building window...
	NewPanel /W=(389,65,1019,572) as "2D T1 Analysis Control"
	ModifyPanel cbRGB=(0,26112,39168)
	SetDrawLayer UserBack
	SetDrawEnv fillfgc= (65535,65383,56100)
	DrawRRect 414,1,627,111
	SetDrawEnv fillfgc= (65535,60076,49151)
	DrawRRect 1,1,234,111
	SetDrawEnv fillfgc= (49151,65535,49151)
	DrawRRect 163,389,479,504
	SetDrawEnv fillfgc= (62583,53993,63459)
	DrawRRect 56,114,580,386
	SetDrawEnv fillpat= 3,fillfgc= (65280,21760,0)
	DrawRRect 9,6,222,27
	SetDrawEnv linefgc= (65535,65535,65535)
	DrawText 17,24,"Create 2D wave from NTNMR export "
	SetDrawEnv fillpat= 3,fillfgc= (3,52428,1)
	DrawRRect 173,396,466,420
	SetDrawEnv linefgc= (65535,65535,65535)
	DrawText 193,416,"Fit 2D FT+Phase Corrected Inversion Recovery"
	SetDrawEnv fillpat= 3,fillfgc= (26411,1,52428)
	DrawRRect 209,119,415,143
	SetDrawEnv linefgc= (65535,65535,65535)
	DrawText 228,139,"Image + Slice Plot of 2D Wave"
	SetDrawEnv fillpat= 3,fillfgc= (65535,65532,16385)
	DrawRRect 453,7,594,29
	SetDrawEnv linefgc= (65535,65535,65535)
	DrawText 459,25,"Modify Frequency Wave"
	DrawRRect 104,354,528,377
	SetDrawEnv linefgc= (65535,65535,65535)
	DrawText 110,374,"If the fit does not converge, then use curve fitting dialog on slicewave."
	SetDrawEnv fillfgc= (49151,49152,65535)
	DrawRRect 239,38,410,111
	SetDrawEnv fillpat= 3,fillfgc= (16385,16388,65535)
	DrawRRect 244,43,404,64
	SetDrawEnv linefgc= (65535,65535,65535)
	DrawText 250,61,"Create Smoothed 2D Wave"
	Button initpanel_but,pos={268,10},size={110,20},proc=ButtonProc_initpanel,title="Initialize Panel"
	Button initpanel_but,fColor=(39321,1,1)
	SetVariable setvar_wave1D_str,pos={15,32},size={200,15},title="1D Wave (used below)"
	SetVariable setvar_wave1D_str,value= wave1D_str
	SetVariable setvar_nrows,pos={5,49},size={230,15},title="No. 1D Pts.(usually 1024)(used below)"
	SetVariable setvar_nrows,value= nrows
	SetVariable setvar_ncols,pos={15,66},size={200,15},title="No. of twait pts. (used below)"
	SetVariable setvar_ncols,value= ncols
	Button but_make2Dwave,pos={40,85},size={150,20},proc=make2Dwave,title="Make 2D Wave"
	Button but_make2Dwave,fStyle=1,fColor=(65280,21760,0)
	SetVariable setvar_freqwave_str,pos={420,38},size={200,15},title="Freq. wave (used below)"
	SetVariable setvar_freqwave_str,value= freqwave_str
	SetVariable setvar_freq_str,pos={432,62},size={180,15},title="Pulse Frequency(in MHz)"
	SetVariable setvar_freq_str,value= freq
	Button but_ModifyFreqWave,pos={445,86},size={150,20},proc=ModifyFreqWave,title="\\f01Modify Freq. Wave"
	Button but_ModifyFreqWave,fColor=(65535,65532,16385)
	PopupMenu popup_fitfunction,pos={80,149},size={319,20},proc=PopMenuProc_ChooseFitFn,title="Choose Fit Function I=1/2-5/2 (used below)"
	PopupMenu popup_fitfunction,mode=7,popvalue="T1_3over2_NQR",value= #"\"No Value;____Spin 1/2____;T1_1over2;____Spin 3/2____;T1_3over2_1st_sat;T1_3over2_central;T1_3over2_NQR;____Spin5/2____;T1_5over2_2nd_sat;T1_5over2_1st_sat;T1_5over2_central;T1_5over2_NQR_3over2_1over2;T1_5over2_NQR_5over2_3over2\""
	PopupMenu popup_fitfunction1,pos={189,171},size={169,20},proc=PopMenuProc_ChooseFitFn,title="I=7/2 (used below)"
	PopupMenu popup_fitfunction1,mode=1,popvalue="No Value",value= #"\"No Value;____Spin 7/2____\""
	PopupMenu popup_fitfunction2,pos={189,194},size={169,20},proc=PopMenuProc_ChooseFitFn,title="I=9/2 (used below)"
	PopupMenu popup_fitfunction2,mode=1,popvalue="No Value",value= #"\"No Value;____Spin 9/2____;T1_9over2_central;T1_9over2_1st_sat;T1_9over2_2nd_sat;T1_9over2_3rd_sat;T1_9over2_4th_sat;T1_9over2_NQR_3over2_1over2;T1_9over2_NQR_5over2_3over2;T1_9over2_NQR_7over2_5over2;T1_9over2_NQR_9over2_7over2\""
	SetVariable setvar_2Dwavename,pos={67,219},size={250,15},title="2D Wave Name (used below)"
	SetVariable setvar_2Dwavename,value= wave2D_str
	SetVariable setvar_slicenumber,pos={322,219},size={250,15},title="Point at which to make the 1D Slice"
	SetVariable setvar_slicenumber,value= slicenumber
	SetVariable setvar_xwave,pos={171,238},size={300,15},title="twait Wave Name (units=seconds)(used below)"
	SetVariable setvar_xwave,value= xwave_str
	SetVariable setvar_fitpars2d0,pos={75,259},size={250,16},title="Fit Parameter M\\B0\\M (Magnetization @ t=inf)"
	SetVariable setvar_fitpars2d0,value= fitpars2d[0]
	SetVariable setvar_fitpars2d1,pos={74,283},size={250,15},title="Fit Parameter F (F=inversion fraction)"
	SetVariable setvar_fitpars2d1,value= fitpars2d[1]
	SetVariable setvar_fitpars2d2,pos={74,302},size={250,21},title="Fit Parameter T\\B1\\M\\S-1\\M (in s\\S-1\\M)"
	SetVariable setvar_fitpars2d2,value= fitpars2d[2]
	SetVariable setvar_M0low,pos={334,260},size={96,15},proc=SetVarProc_M0low,title=" "
	SetVariable setvar_M0low,value= m0low
	SetVariable setvar_M0high,pos={434,260},size={128,16},proc=SetVarProc_M0high,title="< M\\B0\\M <"
	SetVariable setvar_M0high,value= m0high
	SetVariable setvar_Flow,pos={334,282},size={96,15},proc=SetVarProc_Flow,title=" "
	SetVariable setvar_Flow,value= Flow
	SetVariable setvar_Fhigh,pos={431,282},size={130,15},proc=SetVarProc_Fhigh,title=" < F <"
	SetVariable setvar_Fhigh,value= Fhigh
	SetVariable setvar_T1invlow,pos={322,303},size={108,20},proc=SetVarProc_T1invlow,title="  \\B\\M\\S \\M"
	SetVariable setvar_T1invlow,value= T1invlow
	SetVariable setvar_T1invhigh,pos={434,303},size={127,21},proc=SetVarProc_T1invhigh,title="< T\\B1\\M\\S-1\\M <"
	SetVariable setvar_T1invhigh,value= T1invhigh
	Button but_imageslice,pos={241,329},size={150,20},proc=image_slice,title="\\f01Display/Fit Slice"
	Button but_imageslice,fColor=(26411,1,52428)
	SetVariable setvar_startfreq,pos={194,428},size={250,15},title="Fitting Starting Point Number"
	SetVariable setvar_startfreq,value= startfreq
	SetVariable setvar_endfreq,pos={194,448},size={250,15},title="Fitting End Point Number"
	SetVariable setvar_endfreq,value= endfreq
	Button but_fit2dwave,pos={245,475},size={150,20},proc=FitT12D,title="\\f01Fit 2D Wave"
	Button but_fit2dwave,fColor=(3,52428,1)
	SetVariable setvar_smoothingfactor,pos={245,69},size={165,15},title="Binomial Smoothing Factor"
	SetVariable setvar_smoothingfactor,value= smoothingfactor
	Button but_smooth2dwave,pos={280,86},size={80,20},proc=smooth2dwave,title="Smooth"
	Button but_smooth2dwave,labelBack=(65535,65535,65535),fStyle=1
	Button but_smooth2dwave,fColor=(49151,53155,65535)
EndMacro

Function PopMenuProc_ChooseFitFn(Popup_ChooseFitFn,popNum,popstr_ChooseFitFn) : PopupMenuControl
	String Popup_ChooseFitFn
	Variable popNum
	String popstr_ChooseFitFn
	SVAR ChosenFitFunction
	
	ChosenFitFunction=popstr_ChooseFitFn
End

Function SetVarProc_M0low(setvar_M0low,varNum,M0low,varName) : SetVariableControl
	String setvar_M0low
	Variable varNum
	String M0low
	String varName
	
	wave/T fitconstr
	string s
	s = "K0>"+M0low
	fitconstr[0] = {s}
End

Function SetVarProc_M0high(setvar_M0high,varNum,M0high,varName) : SetVariableControl
	String setvar_M0high
	Variable varNum
	String M0high
	String varName

	wave/T fitconstr
	string s
	s = "K0<"+M0high
	fitconstr[1] = {s}
End

Function SetVarProc_Flow(setvar_Flow,varNum,Flow,varName) : SetVariableControl
	String setvar_Flow
	Variable varNum
	String Flow
	String varName

	wave/T fitconstr
	string s
	s = "K1>"+Flow
	fitconstr[2] = {s}
End

Function SetVarProc_Fhigh(setvar_Fhigh,varNum,Fhigh,varName) : SetVariableControl
	String setvar_Fhigh
	Variable varNum
	String Fhigh
	String varName

	wave/T fitconstr
	string s
	s = "K1<"+Fhigh
	fitconstr[3] = {s}
End

Function SetVarProc_T1invlow(setvar_T1invlow,varNum,T1invlow,varName) : SetVariableControl
	String setvar_T1invlow
	Variable varNum
	String T1invlow
	String varName

	wave/T fitconstr
	string s
	s = "K2>"+T1invlow
	fitconstr[4] = {s}
End

Function SetVarProc_T1invhigh(setvar_T1invhigh,varNum,T1invhigh,varName) : SetVariableControl
	String setvar_T1invhigh
	Variable varNum
	String T1invhigh
	String varName

	wave/T fitconstr
	string s
	s = "K2<"+T1invhigh
	fitconstr[5] = {s}
End