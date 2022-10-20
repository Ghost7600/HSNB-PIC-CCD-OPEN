/*
 * slave_i2c.h
 *
 *  Created on: Dec 7, 2021
 *      Author: maicon
 */

#ifndef INC_SLAVE_I2C_H_
#define INC_SLAVE_I2C_H_


// Motor control - defined execute command
#define READ_STATE 0xa0
#define REQUEST_MOTOR_START 0xa1
#define REQUEST_MOTOR_STOP 0xa2
#define ACK_ERROR_RESET 0xa3
#define READ_ERROR_NR 0xa4


//void intentify_request(uint16_t request);

#endif /* INC_SLAVE_I2C_H_ */
