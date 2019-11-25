use strict;
use warnings;
use 5.010;

my $in = <>;
my @a= split(" ",$in);

foreach my $x (@a) {
	say $x;
}

say length("0123");