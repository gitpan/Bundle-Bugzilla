package Bundle::Bugzilla;

$VERSION = '0.06';

1;

__END__

=head1 NAME

Bundle::Bugzilla - A bundle of the modules required for Bugzilla.

=head1 SYNOPSIS

C<perl -MCPAN -e 'install Bundle::Bugzilla'>

=head1 CONTENTS

Bundle::DBD::mysql

CGI::Carp

Date::Parse

AppConfig 1.52

Template 2.06

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

=item Bundle::Mysql
This module is used to connect to the database that Bugzilla uses 
to store its information.

=item CGI::Carp
Used for CGI error reporting.

=item Date::Parse
Enables SQL-style search query statements for Bugzilla.

=item AppConfig
Used as part of the Template system

=item Template
For templates in the bugzilla code

=item Text::Wrap
Used to wrap text in comment fields

=head1 AUTHOR

Zach Lipton, <zach@zachlipton.com>

