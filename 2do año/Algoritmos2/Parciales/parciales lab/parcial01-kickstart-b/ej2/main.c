#include <stdio.h>
#include "weather_table.h"
#include "queries.h"

int main() {
    WeatherTable a;
    int year;
    int min_threshold, max_threshold;

    table_from_file(a, "../input/weather_cordoba.in");

    printf("Ingrese un año (%d-%d): ", FST_YEAR, LST_YEAR);
    scanf("%d", &year);
    printf("Ingrese el umbral de frío (en décimas de grado): ");
    scanf("%d", &min_threshold);
    printf("Ingrese el umbral de calor (en décimas de grado): ");
    scanf("%d", &max_threshold);

    //
    // COMPLETAR!!
    //

    printf("Año %d:\n", year);
    printf("  Días con temperatura mínima menor a %d: %d\n",
           min_threshold, cold_days);
    printf("  Días con temperatura máxima mayor a %d: %d\n",
           max_threshold, hot_days);

    return 0;
}
