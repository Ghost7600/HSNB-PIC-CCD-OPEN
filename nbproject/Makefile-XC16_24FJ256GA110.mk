#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-XC16_24FJ256GA110.mk)" "nbproject/Makefile-local-XC16_24FJ256GA110.mk"
include nbproject/Makefile-local-XC16_24FJ256GA110.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC16_24FJ256GA110
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=configuration_bits.c interrupts.c main.c system.c traps.c user.c timer.c dma.c pconfig.c oc.c clkswitch.c i2c.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/configuration_bits.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/dma.o ${OBJECTDIR}/pconfig.o ${OBJECTDIR}/oc.o ${OBJECTDIR}/clkswitch.o ${OBJECTDIR}/i2c.o
POSSIBLE_DEPFILES=${OBJECTDIR}/configuration_bits.o.d ${OBJECTDIR}/interrupts.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/traps.o.d ${OBJECTDIR}/user.o.d ${OBJECTDIR}/timer.o.d ${OBJECTDIR}/dma.o.d ${OBJECTDIR}/pconfig.o.d ${OBJECTDIR}/oc.o.d ${OBJECTDIR}/clkswitch.o.d ${OBJECTDIR}/i2c.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/configuration_bits.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/dma.o ${OBJECTDIR}/pconfig.o ${OBJECTDIR}/oc.o ${OBJECTDIR}/clkswitch.o ${OBJECTDIR}/i2c.o

# Source Files
SOURCEFILES=configuration_bits.c interrupts.c main.c system.c traps.c user.c timer.c dma.c pconfig.c oc.c clkswitch.c i2c.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-XC16_24FJ256GA110.mk ${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24HJ128GP202
MP_LINKER_FILE_OPTION=,--script=p24HJ128GP202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/configuration_bits.o: configuration_bits.c  .generated_files/flags/XC16_24FJ256GA110/3f26c0c2a5d27a9879173f18e8fe07b4531fe14d .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/configuration_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  configuration_bits.c  -o ${OBJECTDIR}/configuration_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/configuration_bits.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24FJ256GA110/f01da0db930bb0a097590c9b648b76cc87838824 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24FJ256GA110/37f2187d9a3dbf527f47da4c17ac8f4c240aec46 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24FJ256GA110/6e964a346057f3f0e99225bce37644bd99cabec4 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24FJ256GA110/39dda298170c0bf1c556ff135d82dd020d9a1867 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24FJ256GA110/5be409ceb85823fa84a528fff7aa1961bf43b95e .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/timer.o: timer.c  .generated_files/flags/XC16_24FJ256GA110/60936a056f2ff1669c241d1c2841d9df92d18259 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  timer.c  -o ${OBJECTDIR}/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/timer.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/dma.o: dma.c  .generated_files/flags/XC16_24FJ256GA110/8f0aabcaf3417e9666bbc5a252a4fe28f8e7b916 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dma.o.d 
	@${RM} ${OBJECTDIR}/dma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  dma.c  -o ${OBJECTDIR}/dma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dma.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pconfig.o: pconfig.c  .generated_files/flags/XC16_24FJ256GA110/da833f85567f806aa352dc13b0e531bd67333e3d .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pconfig.o.d 
	@${RM} ${OBJECTDIR}/pconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pconfig.c  -o ${OBJECTDIR}/pconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pconfig.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oc.o: oc.c  .generated_files/flags/XC16_24FJ256GA110/99cdb7bb24c3bf9c5917f5245a81e06463f04d3d .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oc.o.d 
	@${RM} ${OBJECTDIR}/oc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oc.c  -o ${OBJECTDIR}/oc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oc.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/clkswitch.o: clkswitch.c  .generated_files/flags/XC16_24FJ256GA110/ceae887aeb5e08615a670451684222da46a07ad2 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clkswitch.o.d 
	@${RM} ${OBJECTDIR}/clkswitch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  clkswitch.c  -o ${OBJECTDIR}/clkswitch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/clkswitch.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/flags/XC16_24FJ256GA110/552c618a4bb1bebe1e2df271416258cf734a37a2 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/configuration_bits.o: configuration_bits.c  .generated_files/flags/XC16_24FJ256GA110/833ccb1a7944f2a0d8196fa81bbe888f0e0e7ee9 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/configuration_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  configuration_bits.c  -o ${OBJECTDIR}/configuration_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/configuration_bits.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24FJ256GA110/a43cbfc6a5487eeb19060adb3975ca0a64e26232 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24FJ256GA110/b79a3c7a3c55e1cc44505dcac6f2cafcc7c114b8 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24FJ256GA110/1ff7e64a842e799d9b6102d622ba7e493872775d .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24FJ256GA110/fd0d9113cabcf2c18ebf370662d08117eac40102 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24FJ256GA110/1b825e66e4d74314f7b6d86357b3145275c20780 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/timer.o: timer.c  .generated_files/flags/XC16_24FJ256GA110/99fbc82147a5247529c41369548dbd7828c9ee08 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  timer.c  -o ${OBJECTDIR}/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/timer.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/dma.o: dma.c  .generated_files/flags/XC16_24FJ256GA110/422cdd31634c72b1fe03bb5eae166c5d07659fc0 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dma.o.d 
	@${RM} ${OBJECTDIR}/dma.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  dma.c  -o ${OBJECTDIR}/dma.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/dma.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/pconfig.o: pconfig.c  .generated_files/flags/XC16_24FJ256GA110/47f1fb0136ffd9aa72c124138392dccf5069a71b .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pconfig.o.d 
	@${RM} ${OBJECTDIR}/pconfig.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  pconfig.c  -o ${OBJECTDIR}/pconfig.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pconfig.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oc.o: oc.c  .generated_files/flags/XC16_24FJ256GA110/3ae22de2d736d3e221d1ef8b4fbc001b17b6a3da .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/oc.o.d 
	@${RM} ${OBJECTDIR}/oc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oc.c  -o ${OBJECTDIR}/oc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oc.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/clkswitch.o: clkswitch.c  .generated_files/flags/XC16_24FJ256GA110/541bba08ed48e68edff1573bd4b7042c4bfa5015 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/clkswitch.o.d 
	@${RM} ${OBJECTDIR}/clkswitch.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  clkswitch.c  -o ${OBJECTDIR}/clkswitch.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/clkswitch.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/flags/XC16_24FJ256GA110/c8f36cc768b5d21c5ffa2fb3048efd444633a616 .generated_files/flags/XC16_24FJ256GA110/74d464f3899599845d713a1d015fd0bf2695bd19
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/testtttt.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
