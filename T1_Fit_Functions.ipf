Function T1_S_1over2(w,t) : FitFunc
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

Function T1_S_3over2_1st_sat(w,t) : FitFunc
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

Function T1_S_3over2_central(w,t) : FitFunc
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

Function T1_S_3over2_NQR(w,t) : FitFunc
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

Function T1_S_5over2_2nd_sat(w,t) : FitFunc
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

Function T1_S_5over2_1st_sat(w,t) : FitFunc
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

Function T1_S_5over2_central(w,t) : FitFunc
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

Function T1_S_5over2_NQR_3over2_1over2(w,t) : FitFunc
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

Function T1_S_5over2_NQR_5over2_3over2(w,t) : FitFunc
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

Function T1_S_7over2_central(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((1225/1716)*exp(-28*t*T1inv)+ (75/364)*exp(-15*t*T1inv)+(3/44)*exp(-6*t*T1inv)+(1/84)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((1225/1716)*exp(-28*t*w[2])+(75/364)*exp(-15*t*w[2])+(3/44)*exp(-6*t*w[2])+(1/84)*exp(-1*t*w[2])))
End

Function T1_S_7over2_1st_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((196/429)*exp(-28*t*T1inv)+ (49/132)*exp(-21*t*T1inv)+ (1/1092)*exp(-15*t*T1inv)+ (9/77)*exp(-10*t*T1inv)+ (1/33)*exp(-6*t*T1inv)+ (1/84)*exp(-3*t*T1inv)+(1/84)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((196/429)*exp(-28*t*w[2])+ (49/132)*exp(-21*t*w[2])+ (1/1092)*exp(-15*t*w[2])+ (9/77)*exp(-10*t*w[2])+ (1/33)*exp(-6*t*w[2])+ (1/84)*exp(-3*t*w[2])+(1/84)*exp(-1*t*w[2])))
End

Function T1_S_7over2_2nd_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((49/429)*exp(-28*t*T1inv)+ (49/132)*exp(-21*t*T1inv)+ (100/273)*exp(-15*t*T1inv)+ (25/308)*exp(-10*t*T1inv)+ (1/132)*exp(-6*t*T1inv)+ (1/21)*exp(-3*t*T1inv)+(1/84)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((49/429)*exp(-28*t*w[2])+ (49/132)*exp(-21*t*w[2])+ (100/273)*exp(-15*t*w[2])+ (25/308)*exp(-10*t*w[2])+ (1/132)*exp(-6*t*w[2])+ (1/21)*exp(-3*t*w[2])+(1/84)*exp(-1*t*w[2])))
End

Function T1_S_7over2_3rd_sat(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*((4/429)*exp(-28*t*T1inv)+ (3/44)*exp(-21*t*T1inv)+ (75/364)*exp(-15*t*T1inv)+ (25/77)*exp(-10*t*T1inv)+ (3/11)*exp(-6*t*T1inv)+ (3/28)*exp(-3*t*T1inv)+(1/84)*exp(-1*t*T1inv)))
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((4/429)*exp(-28*t*w[2])+ (3/44)*exp(-21*t*w[2])+ (75/364)*exp(-15*t*w[2])+ (25/77)*exp(-10*t*w[2])+ (3/11)*exp(-6*t*w[2])+ (3/28)*exp(-3*t*w[2])+(1/84)*exp(-1*t*w[2])))
End

Function T1_S_7over2_NQR_3over2_1over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (49/66)*exp(-21*t*T1inv) + (18/77)*exp(-10*t*T1inv) + (1/42)*exp(-3*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((49/66)*exp(-21*t*w[2]) + (18/77)*exp(-10*t*w[2]) + (1/42)*exp(-3*t*w[2]))) 
End

Function T1_S_7over2_NQR_5over2_3over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (49/66)*exp(-21*t*T1inv) + (25/154)*exp(-10*t*T1inv) + (2/21)*exp(-3*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((49/66)*exp(-21*t*w[2]) + (25/154)*exp(-10*t*w[2]) + (2/21)*exp(-3*t*w[2]))) 
End

Function T1_S_7over2_NQR_7over2_5over2(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ f(t) = M*(1-2*F*( (3/22)*exp(-21*t*T1inv) + (50/77)*exp(-10*t*T1inv) + (3/14)*exp(-3*t*T1inv))) 
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 3
	//CurveFitDialog/ w[0] = M
	//CurveFitDialog/ w[1] = F
	//CurveFitDialog/ w[2] = T1inv

	return w[0]*(1-2*w[1]*((3/22)*exp(-21*t*w[2]) + (50/77)*exp(-10*t*w[2]) + (3/14)*exp(-3*t*w[2]))) 
End

Function T1_S_9over2_central(w,t) : FitFunc
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

Function T1_S_9over2_1st_sat(w,t) : FitFunc
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

Function T1_S_9over2_2nd_sat(w,t) : FitFunc
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

Function T1_S_9over2_3rd_sat(w,t) : FitFunc
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

Function T1_S_9over2_4th_sat(w,t) : FitFunc
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

Function T1_S_9over2_NQR_3over2_1over2(w,t) : FitFunc
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

Function T1_S_9over2_NQR_5over2_3over2(w,t) : FitFunc
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

Function T1_S_9over2_NQR_7over2_5over2(w,t) : FitFunc
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

Function T1_S_9over2_NQR_9over2_7over2(w,t) : FitFunc
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