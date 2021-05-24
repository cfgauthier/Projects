/*
 * application.c
 *
 *  Created on: May 22, 2021
 *      Author: Charles-Frederick Gauthier
 */

#ifndef INC_APPLICATION_C_
#define INC_APPLICATION_C_


#define SENSORUPDATE_MS 20

#include <stdint.h>
#include <stdbool.h>

#include "fatfs.h"
#include "i2c.h"

void ApplicationInit();
void ApplicationRun();

#endif /* INC_APPLICATION_H_ */
