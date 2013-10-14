/************************************************************************
*									*
*	  Compute 2^31 Using Multiplication (C Program Version)		*
*									*
************************************************************************/

/*  Authors:  Saeid Nooshabadi and John Zaitseff
    Date:     26th March, 2003
    Version:  1.4

    This program calculates the value of 2^31 (two to the power of 31)
    using a "for" loop and multiplication instructions, and returns the
    result.
*/


int _main (void)
{
    unsigned exp = 1;
    unsigned k;

    /* Compute 2 to the power of 31 */
    for (k = 0; k < 31; k++) {
	exp = exp * 2;
    }

    return exp;
}
