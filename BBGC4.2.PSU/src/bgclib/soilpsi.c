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
double* vwc_out, wstate_struct* ws)
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
	double Alpha, Beta, Theta_r, Theta_s, fc;// van Genuchten parameters

/*	//site 15 - Valley - Ernest
	Alpha = 0.046;
	Beta = 1.28;
	Theta_s = 0.583;
	Theta_r = 0.049;
	fc=0.573;

	//site 51 - Swale - Rushtown
	Alpha = 0.1;
	Beta = 1.37;
	Theta_s = 0.326;
	Theta_r = 0.02;
 	fc=0.276;

	//site 53 - Swale - Berks
	Alpha = 0.068;
	Beta = 1.44;
	Theta_s = 0.293;
	Theta_r = 0.015;
	fc=0.262;
	//site 60 - Planar - Weikert
	Alpha =0.106;
	Beta = 1.38; 
	Theta_s = 0.306;
	Theta_r = 0.014; 
	fc=0.233;
*/
	//site 61 - Valley - Blairton
        Alpha =0.03;
        Beta = 1.35;
        Theta_s = 0.384;
        Theta_r = 0.028;
	fc = 0.370;
/*
	//site 74 - Ridgetop - Weikert/
        Alpha = 0.138;//0.095
        Beta = 1.22;//1.34
        Theta_s = 0.379;//0.239
        Theta_r = 0.1*Theta_s;//0.005
//	fc = 0.156;//Calculated from water potential at -33kPa/
*/

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
	  vwc=Theta_s;
	}
	psi_temp1= pow((vwc-Theta_r)/(Theta_s-Theta_r),(Beta/(1-Beta)))-1;
	psi_temp2= -1/Alpha*pow(psi_temp1,1/Beta);//WARNING: Units in cm
	//convert cm --> m --> m2/s2 (*g) --> Pa (*density of water) --> MPa (/1000000)
	*psi = psi_temp2*0.01*9.8*1000/1000000; //units in MPa
	
	ws->soilw_sat_obs = Theta_s*sitec->soil_depth*1000;
	ws->soilw_fc_obs = fc*sitec->soil_depth*1000;
	//printf("psi_temp1=%f\n",psi_temp1);
	return(!ok);
}

