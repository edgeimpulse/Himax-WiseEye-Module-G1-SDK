#include "WE2_debug.h"
#include <stdint.h>
#include "hx_drv_scu.h"
#include "hx_drv_scu_export.h"
#include "edge-impulse-sdk/porting/ei_classifier_porting.h"
// #include "edge-impulse-sdk/classifier/ei_run_classifier.h"

extern "C" {
	#include "hx_drv_pmu.h"
	#include "timer_interface.h"
};

#ifdef FLASH_AS_SRAM
static void priv_init_xip()
{
    uint8_t flash_info[3] = {0};
    int32_t ret = 0;

    dbg_printf(DBG_LESS_INFO, "priv_init_xip...\n");
    ret = hx_lib_spi_eeprom_open(USE_DW_SPI_MST_Q);
    if (ret != 0) {
        dbg_printf(DBG_LESS_INFO, "hx_lib_spi_eeprom_open failed!\n");
    } else {
        dbg_printf(DBG_LESS_INFO, "hx_lib_spi_eeprom_open OK.\n");
    }
    hx_lib_spi_eeprom_read_ID(USE_DW_SPI_MST_Q, flash_info);
    ret = hx_lib_spi_eeprom_enable_XIP(USE_DW_SPI_MST_Q, true, FLASH_DUAL, true);
    if (ret != 0) {
       dbg_printf(DBG_LESS_INFO, "hx_lib_spi_eeprom_enable_XIP failed!\n");
    } else {
        dbg_printf(DBG_LESS_INFO, "hx_lib_spi_eeprom_enable_XIP OK.\n");
    }
    dbg_printf(DBG_LESS_INFO, "priv_init_xip done.\n");
}
#endif

void app_init()
{
    /* PINMUX. */
    // app_board_pinmux_settings();
}

extern "C" void app_main()
{
	uint32_t wakeup_event;
	uint32_t wakeup_event1;

	dbg_printf(DBG_LESS_INFO, "Hello Edge Impulse\n");

	hx_drv_pmu_get_ctrl(PMU_pmu_wakeup_EVT, &wakeup_event);
	hx_drv_pmu_get_ctrl(PMU_pmu_wakeup_EVT1, &wakeup_event1);
    dbg_printf(DBG_LESS_INFO, "wakeup_event=0x%x,WakeupEvt1=0x%x\n", wakeup_event, wakeup_event1);

#ifdef WE2_DUAL_CORE
    dbg_printf(DBG_LESS_INFO, "CM55M_ENABLE_CM55S \n\n\n");
    hx_drv_scu_set_cm55s_state(SCU_CM55S_STATE_RESET);
    hx_drv_scu_set_cm55s_state(SCU_CM55S_STATE_NORMAL);
    hx_drv_scu_set_CM55S_CPUWAIT(SCU_CM55_CPU_RUN);

    dbg_printf(DBG_LESS_INFO, "app_main start(dual core).\n");
#endif

    app_init();

    /* Set DP settings */
    // app_dp_get_def_cap_settings(&app_dp_cap_set);

    while(1)
    {
        dbg_printf(DBG_LESS_INFO, "Edge Impulse!!!\n");
        printf("Hello world\n");
        ei_printf("Hello Wrold2\n");
        hx_drv_timer_cm55x_delay_ms(500, TIMER_STATE_DC);
    }
}
