package Bundle::Bugzilla;

$VERSION = '0.09';

1;

__END__

=head1 NAME

Bundle::Bugzilla - A bundle of the modules required for Bugzilla.

=head1 SYNOPSIS

C<perl -MCPAN -e 'install Bundle::Bugzilla'>

=head1 CONTENTS

AppConfig 1.52

CGI 2.88

CGI::Carp

Data::Dumper

Bundle::DBD::mysql

File::Spec 0.82

Date::Parse

File::Spec 0.82

File::Temp

Template 2.07

Text::Wrap

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

=item Bundle::DBD::Mysql
This module is used to connect to the database that Bugzilla uses 
to store its information.

=item CGI::Carp
Used for CGI error reporting.

=item Date::Parse
Enables SQL-style search query statements for Bugzilla.

=item AppConfig
Used as part of the Template system

=item Template
For templates in the bugzilla code. 2.07 is now required by Bugzilla.

=item Text::Wrap
Used to wrap text in comment fields

=item CGI
Used to parse CGI params and display HTML

=item Data::Dumped
Used to store data so that other code can use it again later

=item File::Spec
Used to store data about files

=item File::Temp
Used to create and manage temp files

=item Text::Wrap
Used to wrap text in Bugzilla pages

=head1 AUTHOR

Zach Lipton, <zlipton@cpan.org>

