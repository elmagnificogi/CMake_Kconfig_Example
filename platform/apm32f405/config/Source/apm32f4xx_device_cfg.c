/**
 * @file        apm32f4xx_device_cfg.c
 *
 * @brief       This file provides all configuration support for device
 *
 * @version     V1.0.0
 *
 * @date        2023-12-01
 *
 * @attention
 *
 *  Copyright (C) 2023 Geehy Semiconductor
 *
 *  You may not use this file except in compliance with the
 *  GEEHY COPYRIGHT NOTICE (GEEHY SOFTWARE PACKAGE LICENSE).
 *
 *  The program is only for reference, which is distributed in the hope
 *  that it will be useful and instructional for customers to develop
 *  their software. Unless required by applicable law or agreed to in
 *  writing, the program is distributed on an "AS IS" BASIS, WITHOUT
 *  ANY WARRANTY OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the GEEHY SOFTWARE PACKAGE LICENSE for the governing permissions
 *  and limitations under the License.
 */

/* Includes ***************************************************************/
#include "apm32f4xx_device_cfg.h"

/* Private includes *******************************************************/

/* Private macro **********************************************************/

/* Private typedef ********************************************************/

/* Private variables ******************************************************/

/* Private function prototypes ********************************************/

/* External variables *****************************************************/

/* External functions *****************************************************/

/**
 * @brief   Device configuration
 *
 * @param   None
 *
 * @retval  None
 */
void DAL_DeviceConfig(void)
{
    /* Configure DAL library */
    DAL_Init();

    /* Configure system clock */
    DAL_SysClkConfig();

    /* Configure peripheral clock */
    DAL_RCM_PeripheralClkConfig();

    /* Configure GPIO */
    DAL_GPIO_Config();

    /* Configure NVIC */
    DAL_NVIC_Config();
}

/**
 * @brief   System clock configuration
 *
 * @param   None
 *
 * @retval  None
 */
void DAL_SysClkConfig(void)
{
    RCM_ClkInitTypeDef RCM_ClkInitStruct = {0U};
    RCM_OscInitTypeDef RCM_OscInitStruct = {0U};

    /* Enable PMU clock */
    __DAL_RCM_PMU_CLK_ENABLE();

    /* Configure the voltage scaling value */
    __DAL_PMU_VOLTAGESCALING_CONFIG(PMU_REGULATOR_VOLTAGE_SCALE1);

    /* Enable HSE Oscillator and activate PLL with HSE as source */
    RCM_OscInitStruct.OscillatorType    = RCM_OSCILLATORTYPE_HSE;
    RCM_OscInitStruct.HSEState          = RCM_HSE_ON;
    RCM_OscInitStruct.PLL.PLLState      = RCM_PLL_ON;
    RCM_OscInitStruct.PLL.PLLSource     = RCM_PLLSOURCE_HSE;
    RCM_OscInitStruct.PLL.PLLB          = 8U;
    RCM_OscInitStruct.PLL.PLL1A         = 336U;
    RCM_OscInitStruct.PLL.PLL1C         = RCM_PLL1C_DIV2;
    RCM_OscInitStruct.PLL.PLLD          = 7U;
    if(DAL_RCM_OscConfig(&RCM_OscInitStruct) != DAL_OK)
    {
        DAL_ErrorHandler();
    }

    /* Configure clock */
    RCM_ClkInitStruct.ClockType         = (RCM_CLOCKTYPE_SYSCLK | RCM_CLOCKTYPE_HCLK | RCM_CLOCKTYPE_PCLK1 | RCM_CLOCKTYPE_PCLK2);
    RCM_ClkInitStruct.SYSCLKSource      = RCM_SYSCLKSOURCE_PLLCLK;
    RCM_ClkInitStruct.AHBCLKDivider     = RCM_SYSCLK_DIV1;
    RCM_ClkInitStruct.APB1CLKDivider    = RCM_HCLK_DIV4;  
    RCM_ClkInitStruct.APB2CLKDivider    = RCM_HCLK_DIV2;  
    if(DAL_RCM_ClockConfig(&RCM_ClkInitStruct, FLASH_LATENCY_5) != DAL_OK)
    {
        DAL_ErrorHandler();
    }
}

/**
 * @brief     Error handler
 *
 * @param     None
 *
 * @retval    None
 */
void DAL_ErrorHandler(void)
{
    /* When the function is needed, this function 
       could be implemented in the user file
    */
    while(1)
    {
    }
}

#if defined(USE_FULL_ASSERT)
/**
 * @brief   Assert failed handler
 *
 * @param   file :Pointer to the source file name
 *
 * @param   line :Error line source number
 *
 * @retval  None
 */
void AssertFailedHandler(uint8_t *file, uint32_t line)
{ 
    /* When the function is needed, this function 
       could be implemented in the user file
    */
    UNUSED(file);
    UNUSED(line);
    while(1)
    {
    }
}
#endif /* USE_FULL_ASSERT */
