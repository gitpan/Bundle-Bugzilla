package Bundle::Bugzilla;

$VERSION = '0.04';

1;

__END__

=head1 NAME

Bundle::Bugzilla - A bundle of the modules required for Bugzilla.

=head1 SYNOPSIS

C<perl -MCPAN -e 'install Bundle::Bugzilla'>

=head1 CONTENTS

Bundle::Mysql

Data::Dumper

CGI::Carp

Date::Parse

=head1 DESCRIPTION

This bundle installs the prerequisites for Bugzilla.

After installing this bundle, it is recommended that you run the magic 
checksetup.pl script to check that all modules are in place and setup 
the tables in the database. Then, you will need to edit the file called 
'localconfig' with your settings for bugzilla. After this, log in to 
your installation and make yourself an account. Run checksetup.pl again 
and you will become the superuser for your bugzilla installation. Still 
confused? Read the information in the docs/ directory for more
information.

=over 4

=item Bundle::Mysql
This module is used to connect to the database that Bugzilla uses 
to store its information.

=item Data::Dumper
The Data::Dumper module provides data structure persistence for Perl
(similar to Java's serialization).  It comes with later sub-releases of
Perl 5.004, but a re-installation just to be sure it's available won't
hurt anything. Data::Dumper is used by the MySQL related Perl modules.

=item CGI::Carp
Used for CGI error reporting.

=item Date::Parse
Enables SQL-style search query statements for Bugzilla.

=head1 AUTHOR

Zach Lipton, <zach@zachlipton.com>

