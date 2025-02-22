/**
 * @file        apm32f4xx_gpio_cfg.c
 *
 * @brief       This file provides configuration support for GPIO
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
#include "apm32f4xx_gpio_cfg.h"

/* Private includes *******************************************************/

/* Private macro **********************************************************/

/* Private typedef ********************************************************/

/* Private variables ******************************************************/

/* Private function prototypes ********************************************/

/* External variables *****************************************************/

/* External functions *****************************************************/

/**
 * @brief   GPIO configuration
 *
 * @param   None
 *
 * @retval  None
 */
void DAL_GPIO_Config(void)
{
    GPIO_InitTypeDef  GPIO_InitStruct = {0U};

    /* Configure the LED pin */
    GPIO_InitStruct.Pin     = GPIO_PIN_5 | GPIO_PIN_6;
    GPIO_InitStruct.Mode    = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull    = GPIO_PULLUP;
    GPIO_InitStruct.Speed   = GPIO_SPEED_FAST;

    DAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

    DAL_GPIO_WritePin(GPIOE, GPIO_PIN_6, GPIO_PIN_SET);
    DAL_GPIO_WritePin(GPIOE, GPIO_PIN_5, GPIO_PIN_SET);
}
