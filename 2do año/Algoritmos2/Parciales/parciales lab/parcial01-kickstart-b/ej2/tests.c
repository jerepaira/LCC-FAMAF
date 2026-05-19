#include <stdio.h>

#include "weather_table.h"
#include "queries.h"

#define N_TESTCASES 5

struct testcase {
    int year;
    int min_threshold;
    int max_threshold;
    int expected_cold;
    int expected_hot;
};

int main() {
    WeatherTable a;

    // Recordar: las temperaturas se almacenan en décimas de grado.
    // (e.g. 300 representa 30.0 °C, -50 representa -5.0 °C)
    struct testcase tests[N_TESTCASES] = {
        // año, min_threshold, max_threshold, expected_cold, expected_hot
        {1983,   0, 300,  16,  78},
        {1989, -20, 350,   5,  12},
        {1995,  50, 400,  61,   2},
        {1980,  50, 250,  76, 182},
        {1985, -50, 400,   0,   0},
    };

    int result_cold, result_hot;

    table_from_file(a, "../input/weather_cordoba.in");

    printf("TESTING year_extreme_temp_days\n");

    for (int i = 0; i < N_TESTCASES; i++) {
        printf("Test case %i: ", i + 1);

        year_extreme_temp_days(a, tests[i].year,
                               tests[i].min_threshold, tests[i].max_threshold,
                               &result_cold, &result_hot);

        int cold_ok = (result_cold == tests[i].expected_cold);
        int hot_ok  = (result_hot  == tests[i].expected_hot);

        if (cold_ok && hot_ok) {
            printf("OK (year=%d, cold=%d, hot=%d)\n",
                   tests[i].year, result_cold, result_hot);
        } else {
            printf("FAILED: year=%d ", tests[i].year);
            if (!cold_ok) {
                printf("cold expected %d but got %d; ",
                       tests[i].expected_cold, result_cold);
            }
            if (!hot_ok) {
                printf("hot expected %d but got %d; ",
                       tests[i].expected_hot, result_hot);
            }
            printf("\n");
        }
    }

    return 0;
}
