use strict;
use warnings;
use 5.010;


my $fha;
open($fha,"<","dictionary.txt");
while (my $in=<$fha>) {
chomp $in;
my $name="divided\\".length($in)."dictionary.txt";
my $fhb;
open($fhb,">>",$name);
say $fhb $in;
say $in;
close $fhb;
} 
close $fha;
