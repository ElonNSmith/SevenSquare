use strict;
use warnings;
use 5.010;

say "Pattern match uses 01 through 26 as symbols";
say "ie: a  word with the Pattern of \"hello\" woudld be 0102030304";

my $in = <>;
chomp $in;
my $size=length($in)/2;
my $temp="";
for (my $var = 0; $var < length($in); $var=$var+2) {
	$temp=$temp.substr($in,$var,2)." ";
}	
my @a=split(' ',$temp);
say $temp;
say $size;
foreach my $x (@a) {
	$x=int($x)
}

my $alphabet="abcdefghijklmnopqrstuvwxyz";
   $alphabet="                          ";

my $fha;
open($fha,"<","dictionary.txt");
while (my $out=<$fha>) 
{
	
	chomp $out;
	$alphabet="                          ";
	my $valid=1;
	if (length($out)!=$size)
	{
		$valid=0;
	}
	else{
		for (my $x = 0; $x < $size; $x++)
		{
			#print substr($out,$x,1);
			if(index($alphabet,substr($out,$x,1)) == -1)
			{	
				if(substr($alphabet,$a[$x]-1,1) eq " ")
				{
					substr($alphabet,$a[$x]-1,1)=substr($out,$x,1);
				}
				else
				{
					#say $out."				REJECTED  2 meanings for a symbol";
					#say $alphabet." :  ".substr($out,$x,1)."  :  ".index($alphabet,substr($out,$x,1));
					$valid=0;

				}
			}
			else
			{
				if(!(substr($out,$x,1) eq substr($alphabet,$a[$x]-1,1) ))
				{
					#say $out."				REJECTED  symbols for a meaning";
					#say $alphabet." :  ".substr($out,$x,1)."  :  ".index($alphabet,substr($out,$x,1));
					$valid=0;

				}
			}
		}
	}
	if ($valid == 1) {
		say $out."    --".$alphabet;
	}
}
close $fha;
