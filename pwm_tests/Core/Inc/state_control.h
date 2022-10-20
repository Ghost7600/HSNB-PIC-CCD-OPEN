/*
 * state_control.h
 *
 *  Created on: Dec 7, 2021
 *      Author: maicon
 */

#ifndef INC_STATE_CONTROL_H_
#define INC_STATE_CONTROL_H_

#include "main.h"

typedef bool (*transition_function)(void);

typedef void (*state_function)(void);

typedef state_function state_func_t( void );

typedef enum {
	ST_INITIAL,
	ST_IDLE,
	ST_SPEEDING_UP,
	ST_MOTOR_READY,
	ST_SPEEDING_DOWN,
	ST_ERROR,
	DO_NOTHING,
	TOTAL_STATES
} states_type;

typedef struct {
	uint32_t start_time;
	uint16_t max_delay;
} time_counter;





static transition_function tr_request_start(void);
static transition_function tr_constant_current_reached(void);
static transition_function tr_request_stop(void);
static transition_function tr_motor_is_down(void);
static transition_function tr_isFail(void);
static transition_function tr_ack_error(void);
static transition_function tr_return_true(void);

static state_function st_initial(void);
static state_function st_idle(void);
static state_function st_speeding_up(void);
static state_function st_motor_ready(void);
static state_function st_speeding_down(void);
static state_function st_error(void);

//static void set_newMonitoriongTime(uint16_t time2wait);

static state_function run_state( states_type cur_state);
static states_type lookup_transitions(states_type cur_state);

void run_motor_control_stmachine(void);

#define SYNC_iU 2752
#define SYNC_iV 2744
#define SYNC_iW 2734
#define CURRENT_MARGIN 5
#define DELAY_MOTOR_DOWN 65000


extern states_type cur_state;
extern states_type next_state;

extern bool b_request_start;
extern bool b_request_stop;
extern bool b_request_ack_reset;


#endif /* INC_STATE_CONTROL_H_ */
