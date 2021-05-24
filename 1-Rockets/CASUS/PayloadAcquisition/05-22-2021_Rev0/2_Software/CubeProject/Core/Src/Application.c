/*
 * application.c
 *
 *  Created on: May 22, 2021
 *      Author: 15145
 */

#include <Application.h>

#include "stm32l4xx_hal.h"
#include "sd_hal_mpu6050.h"

#include "usart.h"
bool bSDPresent;

uint32_t u32SensorLastUpdate;
FATFS FatFs;

void ApplicationInit() {
	bSDPresent = false;


	// Mount SD Card
	if(FR_OK == f_mount(&FatFs, "", 1)) {
		bSDPresent = true;
	}

	// Try reading param if sd present else using default params
	ConfigLogManagerReadConfigFileSD("config.txt", &vehiculeConfig);

	// Unmount SD Card
	if(bSDPresent == true) {
		f_mount(NULL, "", 0);
	}

}

void ApplicationRun(){
	//Update sensor data loop
	uint8_t mpu_ok[15] = {"MPU WORK FINE\n"};
	uint8_t mpu_not[17] = {"MPU NOT WORKING\n"};

	  while (1)
	  {
		  result = SD_MPU6050_Init(&hi2c1,&mpu1,SD_MPU6050_Device_0,SD_MPU6050_Accelerometer_2G,SD_MPU6050_Gyroscope_250s );
		  HAL_Delay(500);
	  /* USER CODE END WHILE */
		  if(result == SD_MPU6050_Result_Ok)
		  {
			  SD_UART_Send(&huart1,mpu_ok,(uint16_t)15);
		  }
		  else
		  {
			  SD_UART_Send(&huart1,mpu_not,(uint16_t)17);
		  }
		  mpuResult = SD_MPU6050_ReadAll(&hi2c1, &mpu6050);

		  HAL_Delay(500);
		  SD_MPU6050_ReadTemperature(&hi2c1,&mpu1);
		  oMPU6050Data_t.fTemperature = mpu1.Temperature;
		  SD_MPU6050_ReadGyroscope(&hi2c1,&mpu1);
		  oMPU6050Data_t.g_x = mpu1.Gyroscope_X;
		  oMPU6050Data_t.g_y = mpu1.Gyroscope_Y;
		  oMPU6050Data_t.g_z = mpu1.Gyroscope_Z;
	  /* USER CODE BEGIN 3 */
		  SD_MPU6050_ReadAccelerometer(&hi2c1,&mpu1);
		  oMPU6050Data_t.a_x = mpu1.Accelerometer_X;
		  oMPU6050Data_t.a_y = mpu1.Accelerometer_Y;
		  oMPU6050Data_t.a_z = mpu1.Accelerometer_Z;
	  }
	  /* USER CODE END 3 */

	}
	//Data logging loop

}
