use strict;
use warnings;
use 5.010;

my $fha;
my $fhb;
open($fha,"<","dictionary.txt");
open($fhb,">","1.txt");
say "enter leter than number available if limitless enter * instead of number with space";
say "example :  a3 d5 e* f77";
say "as of now * is actually a limit of 200 (cause I'm lazy)";
my $in = <>;
chomp $in;
my @temp = split(" ", $in);
$in="";
foreach(@temp)
{
say $_;
my $l= substr	 ($_,0,1);
my $n= substr($_,1);
if($n eq "*")
	{	
		$n="200";
	}	
$n=int($n) or $n=0;
for(my $count=0; $count < $n ; $count = $count +1)
	{
		$in=$in.$l;
	}
}

my $out;
say length($in);
my $count=0;
while($out=<$fha>)
{
	my $temp_in=$in;
	my $temp_out=$out;
	my $valid=1;
	chomp $out;
	if(length($out) > length($in))
	{
	$valid=0;
	}
	else{
	
    for(my $i=0;$i<length($out);$i=$i+1)
	{
	my $letter=0;
	$letter= index( $temp_in ,substr($temp_out,0,1));
	if($letter== -1)
	{
	$valid=0;
	}
	else
	{
	$temp_in=(substr($temp_in,0,$letter).substr($temp_in,$letter+1));
	$temp_out=substr($temp_out,1);
	}
	}
	
	if($valid ==1)
	{
	say $out;
	$count=$count+1;
	}
	}
}
say("\n".$count);
close $fha;
