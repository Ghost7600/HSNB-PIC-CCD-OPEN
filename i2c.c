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



void i2cinitm(void)
{
    I2C1BRG = I2C_BRG;
    I2CCON = 0b1000000000000000;
    I2CCONbits.I2CEN = 1;
    //I2CCONbits.STREN = 1; // Enable clock stretching
//    TRISBbits.TRISB8 = 1;
//    TRISBbits.TRISB9 = 1;
    //I2C1CONbits.DISSLW = 1;
    
}

void i2cmsend (char sadd, char data)
{

    I2CCONbits.SEN = 1; // send start condition;
    while (I2CCONbits.SEN == 1);
    I2CTRN = sadd; //sending address
    while (I2C1STATbits.TBF);
//    if (I2CSTATbits.ACKSTAT)
//    {
//        I2CCONbits.PEN = 1; //send stop condition
//        while (I2CCONbits.PEN){};
//        return;
//    }
    I2CCONbits.PEN = 1; //send stop condition
    
        
}

byteinfo* i2cinits()
{
   
    // CONTROL REGISTER
    I2C1BRG = I2C_BRG;
    I2CCON = 0b1000000000000000;  //enable the i2c and start the register mostly blank
    I2CCONbits.GCEN = 1;            //Enable interrupt calls for I2C
    I2CCONbits.STREN = 1;           //Enable software clock strechting
    I2CCONbits.SCLREL = 1;          //Release i2c clock SHOULD SET AT THE END OF EVERY TRANSMIT
    I2CCONbits.DISSLW = 1;          //DISABLE SLEW RATE CONTROL, CONTROL ONLY REQUIRED FOR 400KHZ
    I2CTRN = 0;                      //Clear Transmission Register
    I2CADD = 8;
    IEC1bits.SI2CIE = 1;            // enable SI2CIF interrupt SlaveI2CFlag
    IFS1bits.SI2CIF = 0;
    
    byteinfo*saddress;
    
    saddress = malloc (sizeof(struct byteinfo));
    
    
    
    return saddress;
    // STATUS REGISTER   
}

int getindex (byteinfo* datas)
{
    return datas ->index;

}

int getindexlow (byteinfo* datas)
{
    return datas ->index;

}

int getindexhigh (byteinfo* datas)
{
    return datas ->indexh;

}

int mergeindex (byteinfo *datas)
{
    int low = getindexlow(datas);
    int high = getindexhigh(datas);
    datas->index = high << 8 && low;  // there might be a problem in this line, not sure if the arrow operator wil work
    return datas->index;
}

void i2csendread10bit (volatile unsigned int (*inputbuffer)[NPIXEL],byteinfo *datas)
{   
    I2CCONbits.SCLREL = 0; // HOLDS CLOCK LOW FOR SPLITTING BITS
    
    if(datas->hl == 0){
        i2csend(inputbuffer[datas->byte] && 0x00FF);
        datas->hl = 1;
    }
    
    if (datas->hl == 1){
        i2csend((inputbuffer[datas->byte] && 0xFF00)>> 8);  
        datas->hl = 0;
        datas->index = getindex(datas) + 1;
        datas->byte++;
    }
       
//    char lowbyte,highbyte =0x0;
//    lowbyte = (0x00FF && data); //lowbyte extrahieren 
//    highbyte = (0xFF00 && data) >> 8;
      //datas->byte++;

}

void i2csend (char data){

    while (I2CSTATbits.IWCOL == 0 && I2CSTATbits.TBF==0)      //No collision AND Transmit complete
    {
       
       //TRISBbits.TRISB11 = 0;              // !!!!! Set tristate to digital out DONT THINK WE SHOULD DO THAT
       //TRISBbits.TRISB10 = 1;              // !!!!! Set tristate to digital out DONT THINK WE SHOULD DO THAT
        
       I2CTRN = 0b11001010; // Transfer register, write data here.       
    }
}

void treati2c (int *debug, byteinfo *ptr, volatile unsigned int (*bfrptr) [NPIXEL])
{
    int start_flag = I2CRCV; // reads buffer to clear register
    debug++;
    
    i2csendread10bit(bfrptr,ptr);

    return;      
}