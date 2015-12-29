#!/bin/perl -W
# =============================================================================
#  
#  This file is part of BibTool.
#  It is distributed under the GNU General Public License.
#  See the file COPYING for details.
#  
#  (c) 2015 Gerd Neugebauer
#  
#  Net: gene@gerd-neugebauer.de
#  
#*=============================================================================

=head1 NAME

string.t - Test suite for BibTool string expressions.

=head1 SYNOPSIS

string.t

=head1 DESCRIPTION

This module contains some test cases. Running this module as program
will run all test cases and print a summary for each. Optionally files
*.out and *.err are left if the expected result does not match the
actual result.

=head1 OPTIONS

none

=head1 AUTHOR

Gerd Neugebauer

=cut

use strict;
use BUnit;

#------------------------------------------------------------------------------
BUnit::run(name         => 'string-1',
	   resource	=> <<__EOF__ ,
"";
__EOF__
	   expected_err => '',
	   expected_out => <<__EOF__ );
""
__EOF__

#------------------------------------------------------------------------------
BUnit::run(name         => 'string-2',
	   resource	=> <<__EOF__ ,
"a";
__EOF__
	   expected_err => '',
	   expected_out => <<__EOF__ );
"a"
__EOF__

#------------------------------------------------------------------------------
BUnit::run(name         => 'string-3',
	   resource	=> <<__EOF__ ,
"a\\"b";
__EOF__
	   expected_err => '',
	   expected_out => <<__EOF__ );
"a\\"b"
__EOF__

#------------------------------------------------------------------------------
BUnit::run(name         => 'string-err-1',
	   resource	=> <<__EOF__ ,
"abc
__EOF__
	   expected_err => <<__EOF__ );

*** BibTool ERROR:  (line 1 in _test.rsc): Missing closing delimiter '
__EOF__


#------------------------------------------------------------------------------
BUnit::run(name         => 'string-err-2',
	   resource	=> <<__EOF__ ,
"abc
d
e
f
__EOF__
	   expected_err => <<__EOF__ );

*** BibTool ERROR:  (line 1 in _test.rsc): Missing closing delimiter '
__EOF__




1;
#------------------------------------------------------------------------------
# Local Variables: 
# mode: perl
# End: 
