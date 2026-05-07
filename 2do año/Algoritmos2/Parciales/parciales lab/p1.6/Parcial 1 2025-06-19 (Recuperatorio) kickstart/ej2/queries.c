/*
  @file queries.c
  @brief Consultas sobre tablas de datos climáticos.
*/
#include <limits.h>
#include "queries.h"
#include "weather_table.h"

/**
 * @brief Dado un año, calcula para cada mes de ese año la máxima precipitación
 * en un día.
 *
 * @param a Tabla de datos climáticos
 * @param year Año, entre FST_YEAR (1980) y LST_YEAR (2016)
 * @param output Arreglo de salida
 */
void max_daily_rainfall(WeatherTable a, int year, int output[MONTHS]) {

    //
    // COMPLETAR!!
    //
    for (unsigned int i=0;i<MONTHS;i++) {
        int max = INT_MIN;
        for (unsigned int j=0;j<DAYS;j++){
            int rain =a[year-FST_YEAR][i][j]._rainfall;
            if (rain>max) {
                max=rain;
            }
        }
        output[i]=max;
    }

}
