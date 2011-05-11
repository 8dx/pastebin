package pastebin::Model::Paste;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'pastebin::Schema::Paste',
    
    connect_info => {
        dsn => 'dbi:mysql:pastebin',
        user => 'pastebin',
        password => 'user',
        quote_char => q{`},
        name_sep => q{.},
    }
);

=head1 NAME

pastebin::Model::Paste - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<pastebin>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<pastebin::Schema::Paste>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.48

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;