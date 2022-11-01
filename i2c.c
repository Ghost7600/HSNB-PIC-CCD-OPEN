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
#include "i2c.h"

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

info* i2cinits()
{
    
    // CONTROL REGISTER
    I2C1BRG = I2C_BRG;
    //I2C1CON = 0b1000000000000000;  //enable the i2c and start the register mostly blank
    I2C1CONbits.GCEN = 1;            //Enable interrupt calls for I2C
    IEC1bits.SI2C1IE = 1;            // enable SI2C1IF interrupt SlaveI2CFlag 
    I2C1CONbits.STREN = 1;           //Enable software clock strechting
    I2C1CONbits.SCLREL = 1;          //Release i2c clock SHOULD SET AT THE END OF EVERY TRANSMIT
    I2C1CONbits.DISSLW = 1;          //DISABLE SLEW RATE CONTROL, CONTROL ONLY REQUIRED FOR 400KHZ
    I2CTRN = 0;                      //Clear Transmission Register
    I2C1ADD = 0b01;
    
    info*saddress;
    
    saddress = malloc (sizeof(struct byteinfo));
    
    
    
    return saddress;
    // STATUS REGISTER   
}

int getindex (info *datas)
{
    return datas ->index;

}


void i2csendread10bit (volatile unsigned int *inputbuffer[NPIXEL],info *datas)
{   
    I2C1CONbits.SCLREL = 0; // HOLDS CLOCK LOW FOR SPLITTING BITS
    
    if(datas->hl == 0){
        i2csend(inputbuffer[datas->byte] && 0x00FF);
        datas->hl = 1;
    }
    
    if (datas->hl == 1){
        i2csend((inputbuffer[datas->byte] && 0xFF00)>> 8);  
        datas->hl = 0;
        datas->index = getindex(datas) + 1;
    }
       
//    char lowbyte,highbyte =0x0;
//    lowbyte = (0x00FF && data); //lowbyte extrahieren 
//    highbyte = (0xFF00 && data) >> 8;
    datas->byte++;
     I2C1CONbits.SCLREL = 0; // RELEASE CLOCK
}

void i2csend (char data){

    while (I2C1STATbits.IWCOL == 0 && I2C1STATbits.TBF==0)
    {
       
       //TRISBbits.TRISB11 = 0;              // !!!!! Set tristate to digital out DONT THINK WE SHOULD DO THAT
       //TRISBbits.TRISB10 = 1;              // !!!!! Set tristate to digital out DONT THINK WE SHOULD DO THAT
        
       I2C1TRN = data; // Transfer register, write data here.       
    }
}