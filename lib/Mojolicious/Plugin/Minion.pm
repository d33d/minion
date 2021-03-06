package Mojolicious::Plugin::Minion;
use Mojo::Base 'Mojolicious::Plugin';

use Minion;
use Scalar::Util 'weaken';

sub register {
  my ($self, $app, $conf) = @_;

  push @{$app->commands->namespaces}, 'Minion::Command';

  my $minion = Minion->new;
  $minion->mango->from_string($conf->{uri}) if $conf->{uri};
  weaken $minion->app($app)->{app};
  $app->helper(minion => sub {$minion});
}

1;

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Minion - Minion job queue plugin

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin(Minion => {uri => 'mongodb://127.0.0.1:27017'});

  # Mojolicious::Lite
  plugin Minion => {uri => 'mongodb://127.0.0.1:27017'};

=head1 DESCRIPTION

L<Mojolicious::Plugin::Minion> is a L<Mojolicious> plugin for the L<Minion>
job queue.

=head1 OPTIONS

L<Mojolicious::Plugin::Minion> supports the following options.

=head2 uri

  # Mojolicious::Lite
  plugin Minion => {uri => 'mongodb://127.0.0.1:27017'};

L<Mango> connection string.

=head1 HELPERS

L<Mojolicious::Plugin::Minion> implements the following helpers.

=head2 minion

  my $minion = $app->minion;
  my $minion = $c->minion;

Get L<Minion> object for application.

  # Add job to the queue
  $c->minion->enqueue(foo => ['bar', 'baz']);

  # Perform queued jobs right away for testing
  my $worker = $app->minion->worker;
  $worker->all_jobs;

=head1 METHODS

L<Mojolicious::Plugin::Minion> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new, {uri => 'mongodb://127.0.0.1:27017'});

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Minion>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
