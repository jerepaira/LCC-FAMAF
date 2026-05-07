/*
  @file weather.c
  @brief Implements weather mesuarement structure and methods
*/
#include <stdio.h>
#include <stdlib.h>
#include "weather.h"
#include "assert.h"

Weather weather_from_file(FILE* file)
{
    Weather weather;

    int res = fscanf(file, EXPECTED_WEATHER_FILE_FORMAT, &weather._average_temp, &weather._max_temp, &weather._min_temp, &weather._moisture, &weather._pressure, &weather._rainfall);
    if (res != 6) {
        fprintf(stderr,"la cantidad de variables son incorrectas");
    }
    return weather;
}

void weather_to_file(FILE* file, Weather weather)
{
    fprintf(file, "%d %d %d %u %u %u", weather._average_temp,
            weather._max_temp, weather._min_temp, weather._pressure, weather._moisture, weather._rainfall);
}
