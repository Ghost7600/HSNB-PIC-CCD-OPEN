/*
 * pwm_generator.c
 *
 *  Created on: 18.10.2021
 *      Author: maicon
 */


#include <math.h>
#include <stdint.h>
#include "pwm_generator.h"


uint16_t MAX_DUTY = 100;


/**=======================================================================================
 * Sine PWM
 *
 *========================================================================================
 **/
double s_pwm(double x)
{
	const double Pi = acos(-1);
	//Ensure sine angle no bigger then 2PI
	x = fmod(x, 2*Pi);

	//return positive sine
	return ((sin(x)+1)*0.5);
}




/**=======================================================================================
 * Sinus Sulcus - "Sinus-Busen"-Funktion
 * Eigenschaften:  sin(x)      für 0..120°
 *                 sin(x-60°)  für 120°..240°
 *                 0           für 240°..360°
 *
 *========================================================================================
 **/
double sv_pwm_120_ls(double x)
{
	const double Pi = acos(-1);
	double result;
	//Ensure sine angle no bigger then 2PI
	x = fmod(x, 2*Pi);

	//Up to 120°, it is an original sine
	//Between 120° and 240°, an original sine is formed with a 60° shift (delay)
	//From 240° on, it is 0
	if((x>=0)&&(x < (2*Pi/3))) result = sin(x) ;
	else if ((x >= (2*Pi/3))&&(x < (4*Pi/3)))  result = sin(x-(Pi/3));
	else result = 0;
	return result;
}
/**=======================================================================================
 * get_LUT      :  Lookup-Tables mit Werten füllen/initialisieren
 * Eigenschaften:  3 Arrays LUT_B[1..3] mit den Werten füllen
 *
 *
 *
 *========================================================================================
 **/
int get_LUT(void)
{
	const double Pi = acos(-1);

	//Fill each phase array with sine values and 120° shift
	for(int i=0;i<LUTLEN;i++)
	{
		//Phase 1
		// 2*PI* (ACTUAL_INDEX / MAX_INDEX)
		LUT_B1[i] = (uint16_t)(sv_pwm_120_ls(i*2*Pi/LUTLEN)*MAX_DUTY);

		//Phase 2
		// 2*PI* ((ACTUAL_INDEX + 240°) / MAX_INDEX)
		LUT_B2[i] = (uint16_t)(sv_pwm_120_ls((i*2*Pi/LUTLEN) + (4*Pi/3))*MAX_DUTY);

		//Phase 3
		// 2*PI* ((ACTUAL_INDEX + 120°) / MAX_INDEX)
		LUT_B3[i] = (uint16_t)(sv_pwm_120_ls((i*2*Pi/LUTLEN) + (2*Pi/3))*MAX_DUTY);


	}
	return 0;
} /* ENDE get_LUT_B1() */

