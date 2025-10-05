#include <cmoc.h>
#include <coco.h>

#define SCREEN_ORIGIN 1024
#define SCREEN_WIDTH 32
#define SCREEN_HEIGHT 16
#define WIDTH 32
#define HEIGHT 16

#define BLACK_RECT 128
#define GREEN_RECT 143
#define BLUE_RECT 175
#define RED_RECT 191
#define WHITE_RECT 207
#define UP_ARROW 94

#define TREE 94
#define GROUND 143
#define FIRE 191

//---------------------------------------------------
void setD(byte fill, int x, int y)
{
    char *ptr = (char *)(SCREEN_ORIGIN + x + (y * SCREEN_WIDTH));
    *ptr = fill;
}

void cls(byte fill)
{
    memset(SCREEN_ORIGIN, fill, 512);
}

int RND(int max)
{
    return rand() % (max + 1);
}

//---------------------------------------------------

#define FWIDTH 32
#define FHEIGHT 16

byte F[16][32];
byte N[16][32];
byte GFX[3];

void init()
{
    memset(F, BLUE_RECT, 512);
    memset(N, BLUE_RECT, 512);

    int i = 1;

    for (int j = 1; j < (FWIDTH - 1); j++)
    {
        for (int i = 1; i < (FHEIGHT - 1); i++)
        {
            F[i][j] = GROUND;
            N[i][j] = GROUND;
        }
    }
}

void plotForest()
{
    memcpy(SCREEN_ORIGIN, F, 512);
}

void updateForest()
{
    int v = 0;

    for (int i = 1; i < (FWIDTH - 1); i++)
    {
        for (int j = 1; j < (FHEIGHT - 1); j++)
        {
            v = F[j][i];

            if (v == GROUND && RND(15) == 1)
                N[j][i] = TREE;
            else if (v == FIRE)
                N[j][i] = GROUND;
            else if (v == TREE)
            {
                if (RND(20) == 1 ||
                    (F[j][i + 1] == FIRE) ||
                    (F[j][i - 1] == FIRE) ||
                    (F[j + 1][i] == FIRE) ||
                    (F[j - 1][i] == FIRE))
                    N[j][i] = FIRE;
            }
        }
    }

    memcpy(F, N, 512);
}

//---------------------------------------------------

int main()
{
    initCoCoSupport();
    init();

    cls(BLACK_RECT);

    plotForest();

    while (1)
    {
        updateForest();

        plotForest();

        // sleep(1);
    }

    return 0;
}