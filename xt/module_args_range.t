use strict;
use Test::More;
use xt::Run;

my $local_lib = "$ENV{PERL_CPANM_HOME}/perl5";

run "-L", $local_lib, 'Try::Tiny~<0.12';
like last_build_log, qr/installed Try-Tiny-0\.11/;

run "-L", $local_lib, 'Try::Tiny'; # pull latest from CPAN

run "-L", $local_lib, '--notest', 'Try::Tiny~<0.08,!=0.07';
like last_build_log, qr/installed Try-Tiny-0.06/;

done_testing;