/******************************************************************************/
/* projet testtttt                                                          */
/******************************************************************************/


/*INCLUDES BEGIN*/
#include <xc.h>
#include <p24HJ128GP202.h>
#include <stdlib.h>
#include <p24Hxxxx.h>
#include "config.h"
#include "timer.h"
#include "dma.h"
#include "oc.h"
#include "clkswitch.h"
#include "pconfig.h"
#include "i2c.h"
#include "process_sample.h"

//#include <adcDrv2.h>

/*INCLUDES END*/
/*DEFINES BEGIN*/
//#define NPIXEL 2000                   //DEFINED IN I2C.H
#define _XTAL_FREQ 10000000L
#define T1 5                          //Zyklenzahl für 5000ns   12
#define T2 1                           //Zyklenzahl für 500ns   2   
#define T3 4                           //Zyklenzahl für 1000ns  2


typedef enum {
    IDLE,
    WAIT_FOR_ADDR,
    WAIT_FOR_WRITE,
    SEND_READ_DATA,
    SEND_READ_LAST_DATA
} STATE;

/*DEFINE END*/

/*PRAGMAS BEGIN*/

/*PRAGMAS END*/


/*SETUP BEGIN*/

volatile STATE i2_state = WAIT_FOR_ADDR;
volatile unsigned int idx = -1, count = 0, lastState, currentState, tmp = 0;


//I2C SETUP BEGIN

//I2C SETUP END
//PUBLIC VAR BEGIN
    volatile unsigned int buffer[NPIXEL];    //Array mit Anzahl an Pixel 
   //volatile unsigned char I2CDataBuffer[NPIXEL][2]; //Der Buffer wird über I²C an Raspi gesendet
    volatile unsigned int i=0;               //Bufferindex 
    volatile unsigned int c=0;
    volatile info *sadd;
   //volatile unsigned int *bfrptr;
   
    struct byteinfo uno = {.byte =0 ,.retorno=1};
    
    struct byteinfo *ptr = &uno;
    
    volatile unsigned int (*bfrptr) [NPIXEL] = &buffer;
    
    int counter =0;
   
 //  int BufferA[NPIXEL] __attribute__((space(dma)));
 //  int BufferB[NPIXEL] __attribute__((space(dma)));
//PUBLIC VAR END
//PUBLIC FUNCTIONS BEGIN

//   void processSamples(int * samplebuffer);
//   void transfer_info(int * i2c_buffer);
   
//PUBLIC FUNCTION END

//PRIVATE VAR BEGIN

//PRIVATE VAR END
/*SETUP END*/

/*MAIN BEGIN*/
int main(void) {
    
    
    int start_flag = 1;             //Start flag is set by communicating with RASPI
    
    pconfig();
    
    set_dma(); // DMA Setup
    
    set_timer(); // Timer Setup
   
    set_outcomp();
        
    set_clkswitch();
    
    sadd = i2cinits();
    
    
    
   
        
       
 /*MAIN PROGRAM MAIN
   * after the start signal via I2C the timer for Phi is started    *I2C muss realisiert werden
   * The port is toggled via timer-controlled interrupts    *Timer ist soweit fertig
   *
   * The signals SH & ICG are generated via waiting loops    *fertig
   * after ICG goes HIGH, AD converter and DMA starts
   *
   * The DMA is controlled and written by an interrupt from the AD converter
   * the NPIXEL wide array. Then DMA and ADC are switched off
   *
   * The transmission then takes place via I2C to the Raspi
   */
while(1)
    {
    //Query I2C when to start
   while (start_flag == 0){};          //wait for start signal from Raspi
   
   debug =1;

   af_raspi(); // waits and setups after raspis signal
   
    while(i<= 2547)            //T1 (Wartezeit wenn SH LOW & ICG HIGH)
        {
        Nop();
        }
       i = 0;
    IEC0bits.AD1IE = 0;
//    processSamples(buffer, I2CDataBuffer, NPIXEL);
//    transfer_info();
    }
    
}
/*MAIN END*/
/*ISR Definition*/
void __attribute__((__interrupt__, no_auto_psv)) _T2Interrupt(void)
{
/* Interrupt Service Routine code goes here */
        
    //PORTBbits.RB2 = ~PORTBbits.RB2;     //Pin Toggle Phi(M)-Signal
    IFS0bits.T2IF = 0;                  // Clear Timer1 Interrupt Flag       
    return;
}

/*void __attribute__((__interrupt__, no_auto_psv)) _T2Interrupt(void)
{
    return;
}
 */

void __attribute__((interrupt, no_auto_psv)) _ADC1Interrupt(void)
{
    if(i<=NPIXEL)   {
                    buffer[i]= ADCBUF0;
                    i++;
                    }
    else{
        c = 4723;
        }
    IFS0bits.AD1IF=0;
    return;
}

//void __attribute__((interrupt, no_auto_psv)) _SI2C1Interrupt(void)
//{
//    if (counter<2){
//        counter++;
//    }  
//    else{
//    i2csendread10bit(bfrptr,ptr);
//    }
//    
//    I2C1CONbits.SCLREL = 0; // RELEASE CLOCK;
//    return;
//}

void __attribute__((interrupt, no_auto_psv)) _SI2C1Interrupt(void) {
    IFS1bits.SI2C1IF = 0; // clears the I2C S interrupt flag

    switch (i2_state) {

        case WAIT_FOR_ADDR:
            //TRISBbits.TRISB10 = 0;              //Set tristate to digital out
            //TRISBbits.TRISB11 = 1;              //Set tristate to digital out
            //ClrWdt();
            //if(I2C2STATbits.D_A == 0){
                if (I2C1STATbits.R_W) {

                    idx = -1;
                    tmp = I2C1RCV;
                    while(_RBF);
                    //I2C2TRN = (temp); //get first data byte
                    //I2C2TRN = Get_AD(++idx);
                    I2C1CONbits.SCLREL = 1; //release clock line so MASTER can drive it
                    while(_TBF);

                    i2_state = SEND_READ_DATA; //read transaction
                } else i2_state = WAIT_FOR_WRITE;
            //}
            break;


        case WAIT_FOR_WRITE:

            tmp = I2C1RCV;
            while(_RBF);
            idx = -1;
            //character arrived, place in buffer
            //TRISBbits.TRISB10 = ~TRISBbits.TRISB10; //Set tristate to digital out
            i2_state = WAIT_FOR_ADDR;
            break;

        case SEND_READ_DATA:
            _SWDTEN = 1;
//            TRISBbits.TRISB11 = 0;              //Set tristate to digital out
//            TRISBbits.TRISB10 = 1;              //Set tristate to digital out
            i2csendread10bit(bfrptr,ptr);
            I2C1CONbits.SCLREL = 1; //release clock line so MASTER can drive it
            while(_TBF);
            if(idx == 7){i2_state = WAIT_FOR_ADDR; idx = -1; _SWDTEN = 0;}
            
            break;

        case SEND_READ_LAST_DATA:

            idx = -1;
            i2_state = WAIT_FOR_ADDR;
            break;

        default:
            idx = -1;
            i2_state = WAIT_FOR_ADDR;

    }
  
}


/*void __attribute__((interrupt, no_auto_psv)) _DMA0Interrupt(void)
{
    
    unsigned int *addr_DMA_A = (unsigned int *) &DMA0STA;
    unsigned int *addr_DMA_B = (unsigned int *) &DMA0STB;
    buffer[i] = *addr_DMA_A;
    buffer[i+1] = *addr_DMA_B;
    i=i+2;
    
    IFS0bits.DMA0IF = 0;
    return;
}
*/
/*
void __attribute__((__interrupt__,no_auto_psv)) _OC1Interrupt( void )
{

IFS0bits.OC1IF = 0; // Clear OC1 interrupt flag
return;
}
*/
/*void data_transfer(*buffer)
{
    
    return 1;
}
 */