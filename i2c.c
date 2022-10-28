/* 
 * File:   i2c.c
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


void i2cinitm()
{
    //I2C1BRG = I2C_BRG;
    I2C1CON = 0b1000000000000000;
    
}

void i2cinits()
{
    
    // CONTROL REGISTER
    I2C1BRG = I2C_BRG;
    //I2C1CON = 0b1000000000000000;   //enable the i2c and start the register mostly blank
    I2C1CONbits.GCEN = 1;            //Enable interrupt calls for I2C
    I2C1CONbits.STREN = 1;           //Enable software clock strechting
    I2C1CONbits.SCLREL = 1;          //Release i2c clock SHOULD SET AT THE END OF EVERY TRANSMIT
    I2C1CONbits.DISSLW = 1;          //DISABLE SLEW RATE CONTROL, ONLY REQUIRED FOR 400KHZ
    I2CTRN = 0;
    
    
    // STATUS REGISTER   
}

/* void waiteeprom ()    					Unfinished, may be necessary to give other devices 
											time to write from buffer to memory, also have to check I2C1CONbits.PEN
{
	while (I2C1CONbits.ACKSTAT)
	{
		I2C1CONbits.SEN = 1;
	}
}	 */

void i2send10bit (int data)
{    
    while(I2C1CONbits.SEN)
    {
        
    }
    
    I2C1TRN = 0b010100000; // 0baaaacccx aaaa=device number bbb=device given tag on i2c x=0 for write x=1 for read 
  
    while (I2C1STATbits.TRSTAT)
        {
        }
    
    //todo 
    
    I2CCONbits.PEN = 1;
}