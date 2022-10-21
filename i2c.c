/* 
 * File:   oc.c
 * Author: Kenner Marqueti Couto / Felix Hahn
 * Comments: I2C for PIC 24HJ128GP
 * Revision history: 
 */

#include <xc.h>
#include <p24HJ128GP202.h>
#include <stdlib.h>
#include <stdint.h>
#include <p24Hxxxx.h>

#define FOSC 8000000 //cystal oscilator frequency
#define FCYY FOSC /2
#define I2C_BRG 0x9

#define I2C_READ 1
#define I2C_FALSE 0

#define TRUE 1
#define FALSE 0


void i2cinit()
{
    I2C1BRG = I2C_BRG;
    I2C1CON = 0b1000000000000000;
}

void i2cwrite (uint8_t highByte, uint8_t lowByte, uint8_t data)
{
    I2CCONbits.SEN = 1;
    
    while(I2C1CONbits.SEN)
    {
        
    }
    
    I2CCONbits.PEN = 1;
}