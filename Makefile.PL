
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Serialize RDF graphs as dot graph diagrams',
  'AUTHOR' => 'Jakob Voß <voss@gbv.de>',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'Test::More' => '0',
    'utf8' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'RDF-Trine-Serializer-GraphViz',
  'EXE_FILES' => [
    'bin/rdfdot',
    'bin/rdfdot'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'RDF::Trine::Serializer::GraphViz',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Getopt::Long' => '0',
    'GraphViz' => '0',
    'RDF::Trine' => '0',
    'RDF::Trine::Model' => '0',
    'RDF::Trine::Parser' => '0',
    'RDF::Trine::Serializer' => '0',
    'Scalar::Util' => '0'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



