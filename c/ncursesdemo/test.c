#include <string.h>
#include <ncurses.h>

int main(int argc, char *argv[])
{
	initscr();
	raw();
	noecho();
	curs_set(0);

	char *ptr = "Hello, StephenWen!";

	mvprintw(LINES / 2, (COLS - strlen(ptr)) / 2, ptr);
	refresh();

	getch();
	endwin();

	return 0;
}
