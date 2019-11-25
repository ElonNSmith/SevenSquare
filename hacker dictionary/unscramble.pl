use strict;
use warnings;
use 5.010;

my $fha;

open($fha,"<","dictionary.txt");
say "enter leters no space";
my $in = <>;
chomp $in;
my $out;
say length($in);
while($out=<$fha>)
{
	my $temp_in=$in;
	my $temp_out=$out;
	my $valid=1;
	chomp $out;
	if(length($out)!= length($in))
	{
	$valid=0;
	}
	else{
	
    for(my $i=0;$i<length($in);$i=$i+1)
	{
	my $letter=0;
	$letter= index( $temp_out ,substr($temp_in,0,1));
	if($letter== -1)
	{
	$valid=0;
	}
	else
	{
	$temp_out=(substr($temp_out,0,$letter).substr($temp_out,$letter+1));
	$temp_in=substr($temp_in,1);
	}
	}
	
	if($valid ==1)
	{
	say $out;
	}
	}
}
close $fha;
