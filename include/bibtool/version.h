/******************************************************************************
** $Id: version.h,v 1.3 2007-02-08 05:35:57 gene Exp $
**=============================================================================
** 
** This file is part of BibTool.
** It is distributed under the GNU General Public License.
** See the file COPYING for details.
** 
** (c) 1996-2002 Gerd Neugebauer
** 
** Net: gene@gerd-neugebauer.de
** 
******************************************************************************/

 extern char * bibtool_version;

#ifdef __STDC__
#define _ARG(A) A
#else
#define _ARG(A) ()
#endif
 void show_version _ARG((void));		   /* version.c		     */

/*---------------------------------------------------------------------------*/
