package pastebin::Schema::Paste::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

pastebin::Schema::Paste::Result::Role

=cut

__PACKAGE__->table("roles");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'roles_id_seq'

=head2 role

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "roles_id_seq",
  },
  "role",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user_roles

Type: has_many

Related object: L<pastebin::Schema::Paste::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "pastebin::Schema::Paste::Result::UserRole",
  { "foreign.role_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-05-24 18:13:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bSZPQHbQJS3Yyf1oW8hqQA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->has_many(map_user_role => 'pastebin::Schema::Paste::Result::UserRole', 'role_id');
__PACKAGE__->meta->make_immutable;
1;
