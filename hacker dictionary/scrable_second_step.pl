use strict;
use warnings;
use 5.010;

my $fha;
my $fhb;
open($fha,"<","1.txt");
open($fhb,">","2.txt");
my $out;
my $count=0;
my $done = 1;
while($out=<$fha>)
{
	my $temp_out=$out;
	my $valid=1;
	chomp $out;
	my $output="";
	if(substr($out,-1) eq "s")
	{
		say $fhb $out;
	}
	else
	{
		my @a=split("-",$out);
		say $out;
		foreach my $x (@a) {
			say $x;
		}
		
	}

}
say("\n".$count);
close $fha;
close $fhb;
