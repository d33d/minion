use 5.010001;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Minion',
  VERSION_FROM => 'lib/Minion.pm',
  ABSTRACT     => 'Job Queue',
  AUTHOR       => 'Sebastian Riedel <sri@cpan.org>',
  LICENSE      => 'artistic_2',
  META_MERGE   => {
    requires  => {perl => '5.010001'},
    resources => {
      homepage    => 'http://mojolicio.us',
      license     => 'http://www.opensource.org/licenses/artistic-license-2.0',
      MailingList => 'http://groups.google.com/group/mojolicious',
      repository  => 'http://github.com/kraih/minion',
      bugtracker  => 'http://github.com/kraih/minion/issues'
    },
    no_index => {directory => ['t']}
  },
  PREREQ_PM => {Mojolicious => '4.90', Mango => '0.24'},
  test      => {TESTS       => 't/*.t t/*/*.t'}
);
