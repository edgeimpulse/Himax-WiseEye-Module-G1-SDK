SCENARIO_APP_SUPPORT_LIST := $(APP_TYPE)

######################
## Algorithm Config ##
######################
# TFLITE_ALGO = YOLO_FASTEST
#TFLITE_ALGO = TFLITE_MICRO_GOOGLE_PERSON
# FLASH_AS_SRAM_ENABLE = 1

# ifneq ("$(TFLITE_ALGO)","")
#     APPL_DEFINES += -DTFLITE_ALGO_ENABLED
# endif

# ifeq ($(FLASH_AS_SRAM_ENABLE), 1)
#     APPL_DEFINES += -DFLASH_AS_SRAM
# endif

###################
## Sensor Option ##
###################
#CIS = HM11B1_MONO
#CIS = HM0360_BAYER
# CIS = HM0360_MONO
#CIS = HM2170_BAYER

#APPL_DEFINES += -DAIOT_NB_EXAMPLE_TZ_S_ONLY
#APPL_DEFINES += -DEVT_CM55MMB_NBAPP
#APPL_DEFINES += -DEVT_DATAPATH
#APPL_DEFINES += -DEVT_CM55MTIMER
# APPL_DEFINES += -DDBG_MORE
#APPL_DEFINES += -DCM55M_ENABLE_CM55S
#APPL_DEFINES += -DENABLE_EVENT_IDLE_WFI
#APPL_DEFINES += -DTF_LITE_STATIC_MEMORY
APPL_DEFINES += -DEI_PORTING_HIMAX_WE2
APPL_DEFINES += -DEI_ETHOS
APPL_DEFINES += -DETHOSU_ARCH=u55
APPL_DEFINES += -DETHOSU55
APPL_DEFINES += -DETHOS_U

#For PMU dump register
#APPL_DEFINES += -DLIBPWRMGMT_PMUDUMP
#APPL_DEFINES += -DAPP_PMU_REG_EXP

#EVENTHANDLER_SUPPORT = event_handler
#EVENTHANDLER_SUPPORT_LIST += evt_datapath
#EVENTHANDLER_SUPPORT_LIST += evt_cm55mmb_nbapp
#EVENTHANDLER_SUPPORT_LIST += evt_cm55mtimer
#EVENTHANDLER_SUPPORT_LIST += evt_i2ccomm

USE_APP_MAIN_MK = y

SCENARIO_APP_SUPPORT_LIST +=	ei_standalone_inferencing/ei-model/tflite-model \
								ei_standalone_inferencing/ei-model \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/classifier \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/BasicMathFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/BayesFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/CommonTables \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/ComplexMathFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/ControllerFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/DistanceFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/FastMathFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/FilteringFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/InterpolationFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/MatrixFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/QuaternionMathFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/SVMFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/StatisticsFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/SupportFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/DSP/Source/TransformFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/ActivationFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/BasicMathFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/ConcatenationFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/ConvolutionFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/FullyConnectedFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/NNSupportFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/PoolingFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/ReshapeFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/SVDFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/CMSIS/NN/Source/SoftmaxFunctions \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/porting/ethos-core-driver/include \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/porting/ethos-core-driver/src \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/dsp/kissfft \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/dsp/dct \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/dsp/image \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/porting \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/porting/himax-we2 \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/ \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/c \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/core/api \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/kernels \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/kernels/internal \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/micro \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/micro/kernels \
								ei_standalone_inferencing/ei-model/edge-impulse-sdk/tensorflow/lite/micro/memory_planner

##############################
## Transmit Protocol Option ##
## - UART					##
## - SPI_MASTER				##
## - SPI_SLAVE				##
##############################
TRANSMIT_PROTOCOL = SPI_MASTER
#TRANSMIT_PROTOCOL = SPI_SLAVE
#TRANSMIT_PROTOCOL = UART

################
## Config APP ##
################
APPL_APP_ROOT = $(SCENARIO_APP_ROOT)/$(APP_TYPE)

####################
## C source files ##
####################
APPL_APP_CCSRC_LIST = src/app_main.cpp

#####################
## CC source files ##
#####################
# ifeq ($(TFLITE_ALGO), TFLITE_MICRO_GOOGLE_PERSON)
# APPL_APP_CCSRC_LIST = src/google_person/app_algo.cc \
#                       src/google_person/person_detect_model_data_vela.cc
# else ifeq ($(TFLITE_ALGO), YOLO_FASTEST)
# APPL_APP_CCSRC_LIST = src/yolo_fastest/app_algo.cc \
# 					  src/yolo_fastest/yolo_coco_vela.cc
# endif

##################
## Header files ##
##################
APPL_APP_INCDIR_LIST = include

## append file path
APPL_APP_CSRCS = $(addprefix $(APPL_APP_ROOT)/, $(APPL_APP_CSRC_LIST))
APPL_APP_CCSRCS = $(addprefix $(APPL_APP_ROOT)/, $(APPL_APP_CCSRC_LIST))
APPL_APP_INCDIRS = $(addprefix $(APPL_APP_ROOT)/, $(APPL_APP_INCDIR_LIST))

##
# library support feature
# Add new library here
# The source code should be loacted in ~\library\{lib_name}\
##
#LIB_SEL = hxevent
LIB_SEL = pwrmgmt
LIB_SEL += sensordp
LIB_SEL += spi_ptl
#LIB_SEL += tflm
#LIB_SEL += img_proc
LIB_SEL += i2c_comm
LIB_SEL += audio

# ifneq ("$(TFLITE_ALGO)","")
# LIB_SEL += img_proc
# LIB_SEL += tflmtag2209_u55tag2205
# endif

ifeq ($(FLASH_AS_SRAM_ENABLE), 1)
LIB_SEL += spi_eeprom
endif

##
# middleware support feature
# Add new middleware here
# The source code should be loacted in ~\middleware\{mid_name}\
##
MID_SEL =

override undefine OS_SEL
override TRUSTZONE := y
override TRUSTZONE_TYPE := security
override TRUSTZONE_FW_TYPE := 1

APPL_DEFINES += -DEI_STANDALONE_INFERENCING

ifeq ($(CORE_SETTING), DUAL_CORE)
override EPII_USECASE_SEL := drv_dualcore_cm55m_s_only
APPL_DEFINES += -DWE2_DUAL_CORE
else ifeq ($(CORE_SETTING), SINGLE_CORE)
APPL_DEFINES += -DWE2_SINGLE_CORE
override EPII_USECASE_SEL := drv_singlecore_cm55m_s_only
endif

override CIS_SEL := HM_COMMON

#CIS_SUPPORT_INAPP = cis_sensor
#CIS_SUPPORT_INAPP_MODEL = cis_hm11b1

ifeq ($(strip $(TOOLCHAIN)), arm)
override LINKER_SCRIPT_FILE := $(SCENARIO_APP_ROOT)/$(APP_TYPE)/TrustZone_S_ONLY.sct
else#TOOLChain
override LINKER_SCRIPT_FILE := $(SCENARIO_APP_ROOT)/$(APP_TYPE)/TrustZone_S_ONLY.ld
endif

#ifeq ("$(ALGO_TYPE)","TEST_CV_ALGO")
#LIB_SEL += test_cv_algo
#else #default algo
#endif

##
# Add new external device here
# The source code should be located in ~\external\{device_name}\
##
#EXT_DEV_LIST += 


####################################
## Transmit Protocol APPL_DEFINES ##
####################################
APPL_DEFINES += -DI2C_COMM
ifeq ($(TRANSMIT_PROTOCOL), UART)
	APPL_DEFINES += -DUART_PROTOCOL
else ifeq ($(TRANSMIT_PROTOCOL), SPI_MASTER)
	APPL_DEFINES += -DSPI_MASTER_SEND
else ifeq ($(TRANSMIT_PROTOCOL), SPI_SLAVE)
	APPL_DEFINES += -DSPI_SLAVE_SEND
endif
