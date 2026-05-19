/*
  @file queries.c
  @brief Consultas sobre tablas de datos climáticos.
*/

#include "queries.h"

/**
 * @brief Cantidad de días con temperaturas extremas en un año dado.
 * @details
 *
 * @pre min_threshold <= max_threshold
 *
 * @param a Tabla de datos climáticos.
 * @param year Año, entre FST_YEAR (1980) y LST_YEAR (2016).
 * @param min_threshold Umbral de frío (en décimas de grado).
 * @param max_threshold Umbral de calor (en décimas de grado).
 * @param cold_days Puntero donde almacenar la cantidad de días con
 *                  _min_temp < min_threshold.
 * @param hot_days  Puntero donde almacenar la cantidad de días con
 *                  _max_temp > max_threshold.
 */
void year_extreme_temp_days(WeatherTable a, int year,
                            int min_threshold, int max_threshold,
                            int *cold_days, int *hot_days) {
    //
    // COMPLETAR!!
    //
}
