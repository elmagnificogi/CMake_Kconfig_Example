/**
 * @file        apm32f4xx_device_cfg.h
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

/* Define to prevent recursive inclusion */
#ifndef APM32F4XX_DEVICE_CFG_H
#define APM32F4XX_DEVICE_CFG_H

#ifdef __cplusplus
  extern "C" {
#endif

/* Includes ***************************************************************/
#include "apm32f4xx_dal.h"
#include "apm32f4xx_rcm_cfg.h"
#include "apm32f4xx_gpio_cfg.h"
#include "apm32f4xx_nvic_cfg.h"

/* Exported macro *********************************************************/

/* Exported typedef *******************************************************/

/* Exported function prototypes *******************************************/
void DAL_DeviceConfig(void);
void DAL_SysClkConfig(void);

#ifdef __cplusplus
}
#endif

#endif /* APM32F4XX_DEVICE_CFG_H */
