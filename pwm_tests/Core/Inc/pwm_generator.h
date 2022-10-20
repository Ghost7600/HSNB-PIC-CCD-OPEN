/*
 * pwm_generator.h
 *
 *  Created on: 18.10.2021
 *      Author: maicon
 */

#ifndef INC_PWM_GENERATOR_H_
#define INC_PWM_GENERATOR_H_


#define LUTLEN 100    // für 200Hz... ITM_FREQ/LUTLEN = Motor Freq -- 20000/100=200Hz




double s_pwm(double x);
double sv_pwm(double x);
double sv_pwm_60(double x);
double sv_pwm_120_hs(double x);
double sv_pwm_120_ls(double x);

int    get_LUT(void);

uint16_t LUT_B1[LUTLEN];
uint16_t LUT_B2[LUTLEN];
uint16_t LUT_B3[LUTLEN];



#endif /* INC_PWM_GENERATOR_H_ */
