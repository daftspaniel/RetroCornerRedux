#include <cmoc.h>
#include <coco.h>

#define SCREEN_ORIGIN 1024
#define SCREEN_WIDTH 32
#define SCREEN_HEIGHT 16

void cls(unsigned char fill)
{
	char *ptr = (char *)SCREEN_ORIGIN;
	while (ptr < (char *)1536)
	{
		*ptr++ = fill; // Fill memory with value fill.
	}
}

void drawBorder(byte fill)
{
	char *ptr = (char *)SCREEN_ORIGIN;

	for (int x = 0; x < SCREEN_WIDTH; x++)
	{
		*ptr++ = fill;
		*(ptr + 479) = fill;
	}

	ptr = (char *)1056;

	for (int x = 0; x < 15; x++)
	{
		*ptr = fill;
		*(ptr + 31) = fill;
		ptr += SCREEN_WIDTH;
	}
}

void drawRect(byte fill, int x, int y, int w, int h)
{
	char *ptr = (char *)(SCREEN_ORIGIN + x + (y * SCREEN_WIDTH));

	for (int x = 0; x < w; x++)
	{
		*ptr++ = fill;
		*((ptr - 1) + ((h - 1) * SCREEN_WIDTH)) = fill;
	}

	ptr = (char *)(SCREEN_ORIGIN + x + ((y + 1) * SCREEN_WIDTH));

	for (int y = 0; y < (h - 2); y++)
	{
		*ptr = fill;
		*(ptr + (w - 1)) = fill;
		ptr += SCREEN_WIDTH;
	}
}

void drawRectFilled(byte fill, int x, int y, int w, int h)
{
	char *ptr = (char *)(SCREEN_ORIGIN + x + (y * SCREEN_WIDTH));

	for (int j = 0; j < h; j++)
	{
		for (int i = 0; i < w; i++)
		{
			*(ptr + i + (j * SCREEN_WIDTH)) = fill;
		}
	}
}

int stringLength(const char *str)
{
	int length = 0;

	while (str[length] != '\0')
	{
		length++;
	}

	return length;
}

void centerText(int y, const char *str)
{
	int length = stringLength(str);
	int pad = (SCREEN_WIDTH - length) / 2;

	locate(pad, y);
	printf(str);
}

void pressAnyKeyPrompt()
{
	centerText(15, "PRESS ANY KEY TO CONTINUE");
	waitkey(FALSE);
}

void pressAnyKeyPromptInverted()
{
	char prompt[] = "press any key to continue";
	prompt[5] = 128;
	prompt[9] = 128;
	prompt[13] = 128;
	prompt[16] = 128;
	centerText(15, prompt);
	waitkey(FALSE);
}

void showTitleScreen(byte fill,
					 const char *title,
					 const char *author,
					 const char *date,
					 const char *version)
{
	int lengthTitle = stringLength(title);
	int lengthAuthor = stringLength(author);
	int boxWidth = lengthTitle;

	if (lengthAuthor > lengthTitle)
	{
		boxWidth = lengthAuthor;
	}

	drawRect(fill, (32 - (boxWidth + 4)) / 2, 2, boxWidth + 4, 10);
	drawRectFilled(143, (30 - (boxWidth + 2)) / 2 + 1, 3, boxWidth + 2, 8);
	
	int by = 3;
	centerText(by + 1, title);
	centerText(by + 3, author);
	centerText(by + 5, date);
	centerText(by + 7, version);

	pressAnyKeyPromptInverted();
}

void drawHLine(byte fill, int x, int y, int width)
{
	char *ptr = (char *)(SCREEN_ORIGIN + x + (y * SCREEN_WIDTH));
	for (int x = 0; x < width; x++)
	{
		*ptr++ = fill;
	}
}

void drawVLine(byte fill, int x, int y, int height)
{
	char *ptr = (char *)(SCREEN_ORIGIN + x + (y * SCREEN_WIDTH));
	for (int x = 0; x < height; x++)
	{
		*ptr = fill;
		ptr += SCREEN_WIDTH;
	}
}

int main()
{
	initCoCoSupport();

	cls(128);

	showTitleScreen(185,
					"DEMO FOR A CMOC LIB",
					"DAVY MITCHELL",
					"SEPTEMBER 2025",
					"V0.1");

	cls(128);

	centerText(0, "OUTLINE BOX ROUTINE DEMO");
	drawRect('*', 4, 2, 5, 6);
	drawRect('$', 12, 2, 5, 6);
	drawRect('@', 20, 2, 5, 6);

	drawRect(150, 4, 8, 5, 6);
	drawRect(223, 12, 8, 5, 6);
	drawRect(255, 20, 8, 5, 6);

	pressAnyKeyPrompt();

	cls(128);

	centerText(0, "FILLED BOX ROUTINE DEMO");
	drawRectFilled('*', 4, 2, 8, 5);
	drawRectFilled(255, 21, 2, 8, 5);
	drawRectFilled(150, 4, 8, 8, 5);
	drawRectFilled(223, 21, 8, 8, 5);
	pressAnyKeyPrompt();

	cls(128);
	centerText(0, "HORIZONTAL LINE DEMO");

	for (int i = 0; i < 7; i++)
	{
		drawHLine((byte)(255 - (i * 16)), 2, 4 + i, 28 - (i * 2));
	}

	pressAnyKeyPrompt();

	// 	1310 FORD=1TO6
	// 1320 LC$=CHR$(255-D*16):LL=13-D:LX=1+D*2:LY=2:GOSUB 9210
	// 1330 LC$=CHR$(255-D*16):LL=13-D:LX=30-(1+D*2):LY=2:GOSUB 9210

	cls(128);
	centerText(0, "VERTICAL LINE DEMO");

	for (int i = 0; i < 7; i++)
	{
		drawVLine((byte)(255 - (i * 16)), 1 + i * 2, 2, 13 - i);
		drawVLine((byte)(255 - (i * 16)), 30 - (1 + i * 2), 2, 13 - i);
	}

	pressAnyKeyPrompt();

	return 0;
}
