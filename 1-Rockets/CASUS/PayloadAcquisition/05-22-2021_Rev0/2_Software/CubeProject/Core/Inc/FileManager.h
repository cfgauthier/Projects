/*
 * FileManager.h
 *
 *  Created on: May 22, 2021
 *      Author: 15145
 */

#ifndef INC_FILEMANAGER_H_
#define INC_FILEMANAGER_H_

#include "DataTypes.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "fatfs.h"

//Internal functions
float FileManagerReadFloatFromSD(FIL *fp, uint8_t *pu8Key, float fDefaultVal);
float FileManagerReadUInt16FromSD(FIL *fp, uint8_t *pu8Key, uint16_t u16DefaultVal);
bool FileManagerReadBoolFromSD(FIL *fp, uint8_t *pu8Key, bool bDefaultVal);

void FileManagerWriteFloatToSD(FIL *fp, unint8_t *pu8Key, float fDefaultVal);
void FileManagerWriteUInt16ToSD(FIL *fp, uint8_t *pu8Key, unit16_t u16DefaultVal);
void FileManagerWriteBoolToSD(FIL *fp, uint8_t *pu8Key, bool bDefaultVal)
//External functions

void FileManagerReadConfigFileSD(uint8_t *pu8fileName, oConfig_t *pConfig);
void FileManagerOverwriteFileSD(uint8_t *pu8fileName, oConfig_t *pConfig);
void FileManagerWriteKeyValuePairFloatToSD(FIL *fp, uint8_t *pu8Key, float fValue);

#endif /* INC_FILEMANAGER_H_ */
