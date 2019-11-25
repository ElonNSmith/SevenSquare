use strict;
use warnings;
use 5.010;


for (my $var = 1; $var < 59; $var++) {
my $name="divided\\".$var."dictionary.txt";
my $fhb;
open($fhb,">>",$name);
close $fhb;
}
