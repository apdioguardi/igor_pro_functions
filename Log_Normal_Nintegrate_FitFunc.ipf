#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function LNDTHIntegrand(T1inv)
	Variable T1inv
 
	NVAR Sigma, Mu, M, F, tt
 
	return (1/(Sigma*T1inv*sqrt(2*pi)))*exp((-0.5)*((ln(T1inv) - Mu)/Sigma)^2)*M*(1-2*F*(0.9*exp(-6*tt*T1inv) + 0.1*exp(-1*tt*T1inv)))
End

Function LogNormDistThreeHalvesFit(w,t) : FitFunc
	Wave w
	Variable t

	//CurveFitDialog/ These comments were created by the Curve Fitting dialog. Altering them will
	//CurveFitDialog/ make the function less convenient to work with in the Curve Fitting dialog.
	//CurveFitDialog/ Equation:
	//CurveFitDialog/ Variable/G Sigma = Sigma0
	//CurveFitDialog/ Variable/G Mu = Mu0 
	//CurveFitDialog/ Variable/G M = M0
	//CurveFitDialog/ Variable/G F = F0
	//CurveFitDialog/ Variable/G tt = t
	//CurveFitDialog/
	//CurveFitDialog/ f(t) = Integrate1D(LNDTHIntegrand, 1e-6, 1e6,2,0)
	//CurveFitDialog/ End of Equation
	//CurveFitDialog/ Independent Variables 1
	//CurveFitDialog/ t
	//CurveFitDialog/ Coefficients 4
	//CurveFitDialog/ w[0] = Sigma0
	//CurveFitDialog/ w[1] = Mu0
	//CurveFitDialog/ w[2] = M0
	//CurveFitDialog/ w[3] = F0
	
	Variable/G Sigma = w[0]
	Variable/G Mu = w[1]
	Variable/G M = w[2]
	Variable/G F = w[3]
	Variable/G tt = t
	
	return  Integrate1D(LNDTHIntegrand, 1e-6, 1e6,2,0)
End