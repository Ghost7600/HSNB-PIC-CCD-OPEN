/*
 * state_control.c
 *
 *  Created on: Dec 7, 2021
 *      Author: maicon
 */

/* Includes ------------------------------------------------------------------*/
#include "state_control.h"


/* Private define ------------------------------------------------------------*/
#define TIME_MOTOR_UP 20000
#define TIME_MOTOR_DOWN 60000

/* Private variables ---------------------------------------------------------*/


//current state machine should start from ST_INITIAL state
states_type cur_state = ST_INITIAL;
states_type next_state = ST_INITIAL;

bool b_request_start = false;
bool b_request_stop = false;
bool b_request_ack_reset = false;

time_counter delay_motor_down;

//transition_type contains what is necessary to describe a transition
struct transition_type {
	states_type cur_state;
	transition_function transition;
    states_type next_state;
};

//this state_table and states_type must be in sync!!!
state_func_t * const state_table[ TOTAL_STATES ] = {
    st_initial,
	st_idle,
	st_speeding_up,
	st_motor_ready,
	st_speeding_down,
	st_error
};

// state_transitions relates state to the possible transitions.
struct transition_type state_transitions[] = {
		{ST_INITIAL, tr_return_true, ST_IDLE}, //goes direct to idle state

		{ST_IDLE, tr_request_start, ST_SPEEDING_UP},//wait a start request from I2C

		{ST_SPEEDING_UP, tr_isFail, ST_ERROR},//check error
		{ST_SPEEDING_UP, tr_request_stop, ST_SPEEDING_DOWN},//check if stop is requested
		{ST_SPEEDING_UP, tr_constant_current_reached, ST_MOTOR_READY},//check if the motor is ready
//		{ST_SPEEDING_UP, return_true, ST_SPEEDING_UP},//this set the cur_state to keep running.

		{ST_MOTOR_READY, tr_isFail, ST_ERROR},//check error
		{ST_MOTOR_READY, tr_request_stop, ST_SPEEDING_DOWN},//check if stop is requested

		{ST_SPEEDING_DOWN, tr_isFail, ST_ERROR},//check error
		{ST_SPEEDING_DOWN, tr_motor_is_down, ST_IDLE},//if motor is down return to idle
		{ST_SPEEDING_DOWN, tr_request_start, ST_SPEEDING_UP},//if motor is speeding down is possible to turn ON

		{ST_ERROR, tr_ack_error, ST_IDLE},//wait acknowledgment command to return to idle
		{ST_ERROR, tr_return_true, ST_ERROR},//keep showing error if nothing else happens

};




/* Private user code ---------------------------------------------------------*/

// run_measurement_stmachine run the actual state and get the new state with available.
void run_motor_control_stmachine(void)
{
	/*
	 * if next_state is DO_NOTHING, means that the current state has already been performed once and
	 * the current state should not run twice. (take a look in lookup_transitions)
	 * so we do not run the function run_state if the next_state is DO_NOTHING
	 */
	if(next_state!=DO_NOTHING)
	{
	  run_state(cur_state);
	}


	//Anyway, and regardless of the next state, it is necessary to check the available transitions
	next_state = lookup_transitions(cur_state);

	/*
	 * if next_state is DO_NOTHING, we do not actualize the cur_state
	 * it means the lookup_transitions has not found any other available state to run
	 */
	if(next_state!=DO_NOTHING)
	{
	  cur_state = next_state;
	}
}

//run_state returns the current state function that must be executed over the states_type id
static state_function run_state( states_type cur_state) {
    return state_table[ cur_state ]();
};

//lookup_transitions execute available transitions in the cur_state and try return a new state
static states_type lookup_transitions(states_type cur_state)
{
	//get state_transitions length
	int8_t len_trans_table = sizeof(state_transitions)/sizeof(state_transitions[0]);

	//initialize next_state with DO_NOTHING
	//it means, if no any available transition return true
	//no state_funtion should be performed in the next cycle
	states_type next_state = DO_NOTHING;

	// Searching state_transitions
	for(int i=0; i<len_trans_table; i++)
	{

		if (state_transitions[i].cur_state == cur_state)
		{
			// if cur_state found in the table, get the available transition
			transition_function transition = state_transitions[i].transition;

			if (transition())
			{
				// if available transition returns true, get available next_state and stop searching
				next_state = state_transitions[i].next_state;
				break;
			}

		}
	}
	return next_state;
}


/*
 * STATE FUNCTIONS
 */


static state_function st_initial(void)
{
	__NOP();
	//state_function st_initial
}

static state_function st_idle(void)
{
	b_request_ack_reset = false;
	b_request_start     = false;
	b_request_stop      = false;
	//state_function st_idle
}

static state_function st_speeding_up(void)
{

	//	Start timer DMA - PWM signals
	Run_Motor();
}

static state_function st_motor_ready(void)
{
	__NOP();
	//state_function st_motor_ready
}

static state_function st_speeding_down(void)
{

//	Stop timer DMA - PWM signals
	Stop_Motor();

//	Enable brake
//	Brake();

//	time couter motor down
	delay_motor_down.max_delay = DELAY_MOTOR_DOWN;
	delay_motor_down.start_time = HAL_GetTick();

}

static state_function st_error(void)
{
	__NOP();
	//state_function st_error

//	Report error number
}




/*
 * TRANSITION FUNCTIONS
 */


static transition_function tr_request_start(void)
{
//	if(..,) return ... else return ...

//	if (GPIO_PIN_SET == HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8))
	if (b_request_start == true)
	{
		b_request_start = false;
		return true;
	}
	else{
		return false;
	}

}

static transition_function tr_constant_current_reached(void)
{

	if(
			(abs(iU - SYNC_iU)<= CURRENT_MARGIN) &&
			(abs(iV - SYNC_iV)<= CURRENT_MARGIN) &&
			(abs(iW - SYNC_iW)<= CURRENT_MARGIN)
			)
	{
		return true;
	}else{
		return false;
	}

}

static transition_function tr_request_stop(void)
{
//	if(..,) return ... else return ...
//	if (GPIO_PIN_RESET == HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_8))
	if (b_request_stop == true)
	{
		b_request_stop = false;
		return true;
	}
	else{
		return false;
	}
}

static transition_function tr_motor_is_down(void)
{

	if(HAL_GetTick() >= (delay_motor_down.max_delay + delay_motor_down.start_time)){
		return true;
	}else{
		return false;
	}

}

static transition_function tr_isFail(void)
{
//	if(..,) return ... else return ...
	return false;
}

static transition_function tr_ack_error(void)
{
//	if(..,) return ... else return ...
	return false;
}

static transition_function tr_return_true(void)
{
	return true;
}


