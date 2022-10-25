/* 
 * File:   I2Cdrv.h
 * Author: hahn
 *
 * Created on 16. September 2022, 09:48
 */

#ifndef I2CDRV_H
#define	I2CDRV_H

#ifdef	__cplusplus
extern "C" {
#endif

void I2CInit(char);
void transfer_info (int);

void I2CInit(char adress)
{
    TRISBbits.TRISB8=1; //SCL1 (RB8) als Input
    TRISBbits.TRISB9=1; //SDA (RB9) als input
    I2C1MSK= adress;
    
}

void transfer_info(int *i2c_buffer)
{
    
}

#ifdef	__cplusplus
}
#endif

#endif	/* I2CDRV_H */

