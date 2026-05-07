/*
@file array_helpers.c
@brief Array Helpers method implementation
*/
#include <stdio.h>
#include <stdlib.h>

#include "array_helpers.h"
#include "ranking.h"

void array_dump(RankingTable a) {
    for (unsigned int ranking = 0u; ranking < NO_PLAYERS; ranking++) {
        for (unsigned int type = road; type <= track; type++) {
            Ranking aux = a[ranking][type];
            fprintf(stdout, " %u %s %i %i %s %s %f\n",
                    ranking+1, (type==0?"road":"track"), aux.pos_prev, aux.diff, aux.name, aux.team, aux.points
            );
        }
    }
}

void array_from_file(RankingTable array, const char *filepath) {
    FILE *file = NULL;

    file = fopen(filepath, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }

    type_t type;
    int i = 0;
    Ranking ranking_row;
    while (!feof(file)) {

        int res = fscanf(file,EXPECTED_RANKING_FILE_FORMAT, &type,&ranking_row.pos_prev,&ranking_row.diff,ranking_row.name,ranking_row.team,&ranking_row.points );

        if (res != 6) {
            fprintf(stderr, "Invalid ranking type.\n");
            exit(EXIT_FAILURE);
        }

        /* COMPLETAR: Leer Ranking */
        Ranking ranking_row = ranking_row; /* completar... */

        /* COMPLETAR: guardar ranking en array */
        /* completar... */array[i][type] = ranking_row;
        i++;
    }
    fclose(file);
}
