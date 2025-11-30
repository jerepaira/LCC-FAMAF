#include <stdlib.h>  /* exit() y EXIT_FAILURE */
#include <stdio.h>   /* printf(), scanf()     */
#include <stdbool.h> /* Tipo bool             */

#include <assert.h>  /* assert() */

#define N 3

#define CELL_MAX (N * N - 1)

void print_sep(int length) {
    printf("\t ");
    for (int i=0; i < length;i++) printf("................");
    printf("\n");

}

void print_board(char board[N][N])
{
    int cell = 0;

    print_sep(3);
    for (int row = 0; row < N; ++row) {
        for (int column = 0; column < N; ++column) {
            printf("\t | %d: %c ", cell, board[row][column]);
            ++cell;
        }
        printf("\t | \n");
        print_sep(3);
    }
}

bool has_free_cell(char board[N][N])
{
    bool free_cell=false;

        for (int i = 0; i < N && !free_cell; i++)
        {
          for (int j = 0; j < N && !free_cell; j++)
          {
            if (board[i][j] == '-')
            {
                free_cell = true;
            }
            
          }

        }

    return free_cell;
}

char get_winner(char board[N][N])
{
    char winner = '-';
    // verifico las columnas
    for (int  j = 0; j < N; j++)
    {
        if (board[0][j] != '-' && board[0][j]== board[1][j] && board[1][j] == board[2][j])
        {
            return board[0][j];
        }
        
    }
    


     // verifico las filas
    for (int  i = 0; i < N; i++)
    {
        if (board[i][0] != '-' && board[i][0]== board[i][1] && board[i][1] == board[i][2])
        {
            return board[i][0];
        }
        
    }
    

        // verifico la diagonal (\)
    for (int  i = 0; i < N; i++)
    {
        if (board[0][0] != '-' && board[0][0]== board[1][1] && board[2][2])
        {
            return board[0][0];
        }
        
    }
    
            // verifico la diagonal /
    for (int  i = 0; i < N; i++)
    {
        if (board[0][2] != '-' && board[0][2]== board[1][1] && board[1][1] == board[2][0])
        {
            return board[0][2];
        }
        
    }

    return winner;
}

int main(void)
{
    printf("TicTacToe [InCoMpLeTo :'(]\n");

    char board[N][N] = {
        { '-', '-', '-' },
        { '-', '-', '-' },
        { '-', '-', '-' }
    };

    char turn = 'X';
    char winner = '-';
    int cell = 0;
    while (winner == '-' && has_free_cell(board)) {
        print_board(board);
        printf("\nTurno %c - Elija posición (número del 0 al %d): ", turn, CELL_MAX);
        int scanf_result = scanf("%d", &cell);
        if (scanf_result <= 0) {
            printf("Error al leer un número desde teclado\n");
            exit(EXIT_FAILURE);
        }
        if (cell >= 0 && cell <= CELL_MAX) {
            int row = cell / N;
            int column = cell % N;
            if (board[row][column] == '-') {
                board[row][column] = turn;
                turn = turn == 'X' ? 'O' : 'X';
                winner = get_winner(board);
            } else {
                printf("\nCelda ocupada!\n");
            }
        } else {
            printf("\nCelda inválida!\n");
        }
    }
    print_board(board);
    if (winner == '-') {
        printf("Empate!\n");
    } else {
        printf("Ganó %c\n", winner);
    }
    return 0;
}
