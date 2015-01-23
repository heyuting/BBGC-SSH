/* 
soilpsi.c
soil water potential as a function of volumetric water content and
constants related to texture

*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
Biome-BGC version 4.2 (final release)
See copyright.txt for Copyright information
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
*/

#include "bgc.h"
//change soilw to soilWobs, it will change epv->psi. -- Y.He Oct/29/14
int soilpsi(const siteconst_struct* sitec, double soilWobs, double* psi,
double* vwc_out)
{
	/* given a list of site constants and the soil water mass (kg/m2),
	this function returns the soil water potential (MPa)
	inputs:
	ws.soilw           (kg/m2) water mass per unit area
	ws.soilWobs	   (kg/m2) water mass per unit area from observation 
	sitec.soil_depth   (m)     effective soil depth               
	sitec.soil_b       (DIM)   slope of log(psi) vs log(rwc)
	sitec.vwc_sat      (DIM)   volumetric water content at saturation
	sitec.psi_sat      (MPa)   soil matric potential at saturation
	output:
	psi_s              (MPa)   soil matric potential

	uses the relation:
	psi_s = psi_sat * (vwc/vwc_sat)^b

	For further discussion see:
	Cosby, B.J., G.M. Hornberger, R.B. Clapp, and T.R. Ginn, 1984.  A     
	   statistical exploration of the relationships of soil moisture      
	   characteristics to the physical properties of soils.  Water Res.
	   Res. 20:682-690.
	
	Saxton, K.E., W.J. Rawls, J.S. Romberger, and R.I. Papendick, 1986.
		Estimating generalized soil-water characteristics from texture.
		Soil Sci. Soc. Am. J. 50:1031-1036.
	*/

	int ok=1;
	double vwc,psi_temp1,psi_temp2;
	double Alpha, Beta, Theta_r, Theta_s;// van Genuchten parameters
	Alpha =0.027;//site60=0.027//site51= 0.05;//unit: m-1
	Beta = 1.28;//site60=1.28//site51=1.22; 
	Theta_s =0.279;//site60=0.279//site51=0.278; //unit: m3/m3
	Theta_r = 0.1* Theta_s;

	/* convert kg/m2 --> m3/m2 --> m3/m3 */
	vwc = (soilWobs) / (1000.0 * sitec->soil_depth);//inputs are in %
	//change soilw to soilWobs -- Y. He Oct/29/14
	*vwc_out = vwc;
	
	/* calculate psi */
	//*psi = sitec->psi_sat * pow((vwc/sitec->vwc_sat), sitec->soil_b);
	//printf("soil_psi_obs=%f, %f\n",*psi, sitec->psi_sat);
	//we changed Cosby Equation to van Genuchten Equation.
	if(vwc>Theta_s)
	{
	 // printf("vwc=%f >Theta_s=%f, I am Saturated :D \n",vwc, Theta_s);
	  vwc=Theta_s;
	}
	psi_temp1= pow((vwc-Theta_r)/(Theta_s-Theta_r),(Beta/(1-Beta)))-1;
	psi_temp2= -1*pow(psi_temp1,1/Beta)/Alpha;//WARNING: Units in cm
	//convert cm --> m --> m2/s2 (*g) --> Pa (*density of water) --> MPa (/1000000)
	*psi = psi_temp2*0.01*9.8*1000/1000000; //units in MPa
	
	//printf("psi_temp1=%f\n",psi_temp1);
	return(!ok);
}

