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

    int res = fscanf(file,"%u %d %d %s %s %f" , &a, &b, &c, d, e, &f);

    /* COMPLETAR: se leyo correctamente? */

    if (res != NUMBER_OF_RANKING_VARS) {
        fprintf(stderr, "invalid ranking data\n");
        exit(EXIT_FAILURE);
    }
    if (a<1 ||  a > NO_PLAYERS) {
        fprintf(stderr, "invalid ranking position\n");
        exit(EXIT_FAILURE);
    }
    strcpy(ranking.name,d);
    strcpy(ranking.team,e);

    /* COMPLETAR: campos de ranking */
    ranking.pos = a;
    ranking.pos_prev = b;
    ranking.diff = c;
    ranking.points = f;

    return ranking;
}

float total_track_points_per_team(RankingTable a, char *team_name) {
    float  sum = 0.0f;
    /* COMPLETAR */
    for (unsigned i = 0; i<NO_PLAYERS; i++) {
        if (a[i][track].team[0] != '\0' && strcmp(a[i][track].team, team_name)==0) {
            sum += a[i][track].points;
        }
    }
    return sum;
}
