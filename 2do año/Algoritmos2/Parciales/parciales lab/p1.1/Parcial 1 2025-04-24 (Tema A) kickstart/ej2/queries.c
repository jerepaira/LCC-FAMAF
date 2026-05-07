/*
  @file queries.c
  @brief Consultas sobre tablas de datos climáticos.
*/

#include "queries.h"
#include "weather_table.h"

/**
 * @brief Total de lluvias de un año dado.
 *
 * @param a Tabla de datos climáticos.
 * @param year Año, entre FST_YEAR (1980) y LST_YEAR (2016).
 */
int year_rainfall(WeatherTable a, int year) {
    // COMPLETAR
    unsigned int total = 0u;
    for (unsigned int i = 0; i<MONTHS;i++) {
        for (unsigned int j = 0; j<DAYS;j++) {
            total = total + a[year-FST_YEAR][i][j]._rainfall;
        }
    }


    return total;
}
