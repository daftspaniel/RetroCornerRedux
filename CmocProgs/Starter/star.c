#include <cmoc.h>
#include <coco.h>

#define SCREEN_ORIGIN 1024
#define SCREEN_WIDTH 32
#define SCREEN_HEIGHT 16
#define WIDTH 32
#define HEIGHT 16

#define BLACK_RECT 128
#define WHITE_RECT 207

void setD(byte fill, int x, int y)
{
	char *ptr = (char *)(SCREEN_ORIGIN + x + (y * SCREEN_WIDTH));
    *ptr = fill;
}

void cls(unsigned char fill)
{
    char *ptr = (char *)SCREEN_ORIGIN;
    while (ptr < (char *)1536)
    {
        *ptr++ = fill; // Fill memory with value fill.
    }
}

#define NUM_STARS 10

int starX[NUM_STARS];
int starY[NUM_STARS];

void initStars()
{
    for (int i = 0; i < NUM_STARS; i++)
    {
        starX[i] = rand() % WIDTH;
        starY[i] = rand() % HEIGHT;
    }
}

void updateStars()
{
    for (int i = 0; i < NUM_STARS; i++)
    {
        setD(BLACK_RECT, starX[i], starY[i]);

        starX[i]++;
        if (starX[i] >= WIDTH)
        {
            starX[i] = 0;
            starY[i] = rand() % HEIGHT;
        }
    }
}

void drawStars()
{
    for (int i = 0; i < NUM_STARS; i++)
    {
        setD(WHITE_RECT, starX[i], starY[i]);
    }
}

int main()
{
    initCoCoSupport();
    initStars();

    updateStars();

    cls(BLACK_RECT);

    while (1)
    {

        drawStars();

        //sleep(1);

        updateStars();
    }

    return 0;
}