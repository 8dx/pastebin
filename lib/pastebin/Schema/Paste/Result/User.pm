package pastebin::Schema::Paste::Result::User;

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

pastebin::Schema::Paste::Result::User

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 name

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 email

  data_type: 'char'
  is_nullable: 1
  size: 64

=head2 password

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 last_paste

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "char", is_nullable => 1, size => 32 },
  "name",
  { data_type => "char", is_nullable => 1, size => 32 },
  "email",
  { data_type => "char", is_nullable => 1, size => 64 },
  "password",
  { data_type => "char", is_nullable => 1, size => 32 },
  "last_paste",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
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
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 last_paste

Type: belongs_to

Related object: L<pastebin::Schema::Paste::Result::Paste>

=cut

__PACKAGE__->belongs_to(
  "last_paste",
  "pastebin::Schema::Paste::Result::Paste",
  { id => "last_paste" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-05-10 16:59:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+JyC21ZG89W+hzMpZc6Aeg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;

    # many_to_many():
    #   args:
    #     1) Name of relationship, DBIC will create accessor with this name
    #     2) Name of has_many() relationship this many_to_many() is shortcut for
    #     3) Name of belongs_to() relationship in model class of has_many() above
    #   You must already have the has_many() defined to use a many_to_many().
    __PACKAGE__->many_to_many(roles => 'user_roles', 'role_id');

1;