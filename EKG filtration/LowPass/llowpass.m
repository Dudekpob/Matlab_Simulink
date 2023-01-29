function y = llowpass(x)

y = lowpass(x,0.05,'Steepness',0.85,'StopbandAttenuation',60);
