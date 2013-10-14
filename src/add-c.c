/************************************************************************
*									*
*                   Add Two Numbers (C Language Code)                   *
*									*
************************************************************************/

/*  Authors:  Saeid Nooshabadi and John Zaitseff
    Date:     8th March, 2003
    Version:  1.4

    This simple program adds two integers together.  It is meant to show
    you how the GNU C Compiler translates this code into ARM assembly
    language.
*/


/*  ---------------------------------------------------------------------
    Function:	main		- Main program entry point
    Parameters: (none)		- No parameters are passed
    Returns:	int		- Returns the result of an addition

    This function performs the main work of the program, adding two
    integers "a" and "b" together and returning the value in the third
    integer "c".
*/

int _main (void)
{
    int a = 10;		/* First variable */
    int b = 11;		/* Second variable */
    int c;		/* Result */


    c = a + b;		/* The simplest of programs? */

    return c;		/* main() is called by the operating system */
}
