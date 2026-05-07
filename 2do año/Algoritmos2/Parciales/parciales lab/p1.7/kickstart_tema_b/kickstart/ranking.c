/*
  @file ranking.c
  @brief Implements store structure and methods
*/
#include <stdlib.h>
#include "ranking.h"
#include <string.h>

static const int NUMBER_OF_RANKING_VARS = 6;

Ranking ranking_from_file(FILE *file) {

    Ranking ranking;
    unsigned int a;
    int b,c;
    char d[20], e[20];
    float f;

    int res = fscanf(file,EXPECTED_RANKING_FILE_FORMAT,&a,&b,&c,d,e,&f);

    /* COMPLETAR: se leyo correctamente? */
    if (res!=NUMBER_OF_RANKING_VARS) {
        printf("Invalid, no correlation pa\n");
        exit(EXIT_FAILURE);
    }

    strcpy(ranking.name,d);
    strcpy(ranking.team,e);

    /* COMPLETAR: campos de ranking */
    ranking.pos =a;
    ranking.pos_prev=b;
    ranking.diff =c;
    ranking.points =f;

    return ranking;
}

float total_track_points_per_team(RankingTable a, char *team_name) {
    int sum = 0;
    for (unsigned int i=0; i<NO_PLAYERS;i++) {
        if (strcmp(a[i][track].team,team_name) == 0) {
            sum+=a[i][track].points;
        }
    }

    /* COMPLETAR */
    return sum;
}
