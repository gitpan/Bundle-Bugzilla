
# The contents of this file are subject to the Mozilla Public
# License Version 1.1 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of
# the License at http://www.mozilla.org/MPL/
# 
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
# 
# The Original Code is Bundle::Bugzila Makefile Creation Script.
# 
# The Initial Developer of the Original Code is Zach
# Lipton.  Portions created by Zach Lipton are
# Copyright (C) 2001, Zach Lipton.  All
# Rights Reserved.
# 
# Contributor(s): Zach Lipton <zach@zachlipton.com>
# 

# Makefile Generation for Bundle::Bugzilla

use ExtUtils::MakeMaker; # Use the MakeMaker module to write the makefile

print "Welcome to Bundle::Bugzilla\n\n";
optionalgraphs();
print "\nThanks. I will now write the makefile.\n\n";
outputbzpm();
writemakefile();

sub optionalgraphs() {
	print "Would you like to install the optional graphing and charting
modules?\n";
	print "Note that you must have libGD installed for this to work.\n";
	print "Install optional modules? (y or n)\n";
	$optionalmodules = <STDIN>;
	chomp($optionalmodules);
	if ($optionalmodules eq 'y') {
		print "\nVery well then, I will install the optional
modules.\n\n";	
	}
	elsif ($optionalmodules eq 'n') {
		print "Very well then, I will not install the optional
modules.\n\n";
	}
	else {
		print "Please enter y or n\n";
		optionalgraphs();
	}
}

sub dochecksetup() # This is never called. It was here so that it can be, but the
# checksetup.pl script will not run until I can understand makemaker.
{
	print "Would you like to have me start the installation process for
bugzilla?\n";
	print "Run checksetup.pl? (y or n)";
	#stdinput();
	#$temp = $checksetup;
	if ($checksetup eq 'y') {
		print "\nVery well then, I will run checksetup.pl\n\n";
		getbzinstall();	
	}
	elsif ($optionalmodules eq 'n') {
		print "\nVery well then, I will not run checksetup.pl\n\n";
	}
	else {
		print "\nPlease enter y or n\n";
		dochecksetup();
	}
}

sub getbzinstall() {

	print "Where is your checksetup.pl script located?\n";
	print "Please give a full patch\n";
	print "checksetup.pl location?";
	#stdinput(); 
	#$temp = $cslocation;

}

sub outputbzpm() {
	if ($optionalmodules eq 'y') {
		open BZPM, '>>Bugzilla.pm';
		print BZPM <<EOF;
package Bundle::Bugzilla;

\$VERSION = '0.01';

1;

__END__

=head1 NAME

Bundle::Bugzilla - A bundle of the modules required for Bugzilla.

=head1 SYNOPSIS

C<perl -MCPAN -e 'install Bundle::Bugzilla'>

=head1 CONTENTS

DBI

Data::Dumper

DBD::mysql

Chart::Base

Date::Parse

=head1 DESCRIPTION

This bundle installs the prerequisites for Bugzilla.

After installing this bundle, it is recommended that you run the magic 
checksetup.pl script to check that all modules are in place and setup 
the tables in the database. Then, you will need to edit the file called 
'localconfig' with your settings for bugzilla. After this, run checksetup.pl
again and log in to your installation and make yourself an account.
Run checksetup.pl again and you will become the superuser for your bugzilla
installation. Still confused? Read the INSTALL and README for more information.

=over 4

=item DBI
This module is used to connect to the database that Bugzilla uses 
to store its information.

=item Data::Dumper
The Data::Dumper module provides data structure persistence for Perl
(similar to Java's serialization).  It comes with later sub-releases of
Perl 5.004, but a re-installation just to be sure it's available won't
hurt anything. Data::Dumper is used by the MySQL related Perl modules.

=item DBD::mysql
This module is used to connect to the mysql database that Bugzilla uses 
to store its information.

=item Chart::Base
Used to create the bug charts in the reporting functions in reports.cgi.

=item Date::Parse
Enables SQL-style search query statements for Bugzilla.

=head1 AUTHOR

Zach Lipton, <zach\@zachlipton.com>
		
EOF
close BZPM;
		}
		
	if ($optionalmodules eq 'n') {
		open BZPM, '>>Bugzilla.pm';
		print BZPM <<EOF;
package Bundle::Bugzilla;

\$VERSION = '0.01';

1;

__END__

=head1 NAME

Bundle::Bugzilla - A bundle of the modules required for Bugzilla.

=head1 SYNOPSIS

C<perl -MCPAN -e 'install Bundle::Bugzilla'>

=head1 CONTENTS

DBI

Data::Dumper

DBD::mysql

Date::Parse

=head1 DESCRIPTION

This bundle installs the prerequisites for Bugzilla.

After installing this bundle, it is recommended that you run the magic 
checksetup.pl script to check that all modules are in place and setup 
the tables in the database. Then, you will need to edit the file called 
'localconfig' with your settings for bugzilla. After this, log in to 
your installation and make yourself an account. Run checksetup.pl again 
and you will become the superuser for your bugzilla installation. Still 
confused? Read the INSTALL and README for more information.

=over 4

=item DBI
This module is used to connect to the database that Bugzilla uses 
to store its information.

=item Data::Dumper
The Data::Dumper module provides data structure persistence for Perl
(similar to Java's serialization).  It comes with later sub-releases of
Perl 5.004, but a re-installation just to be sure it's available won't
hurt anything. Data::Dumper is used by the MySQL related Perl modules.

=item DBD::mysql
This module is used to connect to the mysql database that Bugzilla uses 
to store its information.

=item Date::Parse
Enables SQL-style search query statements for Bugzilla.

=head1 AUTHOR

Zach Lipton, <zach\@zachlipton.com>

EOF

close BZPM;		
		
	}
}

sub writemakefile() {
	WriteMakefile(
    'NAME'      => 'Bundle::Bugzilla',
    'VERSION_FROM' => 'Bugzilla.pm', # finds $VERSION
    'LIBS'      => [''],   # e.g., '-lm' 
        "dist"     => { SUFFIX   => ".gz", DIST_DEFAULT => 'all tardist',
                                COMPRESS => "gzip -9f", ZIP_FLAGS => '-pr9' },
    'DEFINE'    => '',     # e.g., '-DHAVE_SOMETHING' 
    'INC'       => '',     # e.g., '-I/usr/include/other' 
);
}
