use strict;
use warnings;
use 5.010;
my $fha;
my $fhb;

open($fha,"<","dictionary.txt");
open($fhb,">","divided\\dict.txt");
while (my $x=<$fha>) {
	chomp($x);
	say $fhb $x;
}

close $fhb;
close $fha;