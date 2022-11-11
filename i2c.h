/* 
 * File:   clkswitch.h
 * Author: Kenner Marqueti Couto / Felix Hahn
 * Comments: Output compare configuration function
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef I2C_H
#define	I2C_H


// include processor files - each processor file is guarded.

#include <xc.h>   

// TODO Insert appropriate #include <>

// Comment a function and leverage automatic documentation with slash star star

#define NPIXEL 2547

    struct byteinfo{
    int hl; /*!< Indicates if it's going to send 1 high or 0 low part. */
    int byte; /*!< what byte it's going to send */
    int retorno; /*!<Function return, used for keeping track of things. */
    int index; /*!< Pixel index */
    };

typedef struct byteinfo info;

void i2cinitm (void);
info* i2cinits (void);

void i2cwrite (void);
void i2csendread10bit (volatile unsigned int (*inputbuffer)[NPIXEL],info *datas);
void i2csend (char data);





/**
    Setup and configure Direct Memory Access to declutter main
 */


#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    // TODO If C++ is being used, regular C code needs function names to have C 
    // linkage so the functions can be used by the c code. 

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	//I2C_H

