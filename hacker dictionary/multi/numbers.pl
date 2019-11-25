#use strict;
use warnings;
use 5.010;

my $input = <>;
$input=lc($input);
my @words=split(' ',$input);
my $out="";
foreach my $word (@words) {
	my @chars=split('',$word);
	foreach my $char (@chars) {
		my $tempchar=ord($char)-96;
		$out=$out.($tempchar<10?"0":"");
		$out=$out.$tempchar;
		#$out=$out.(((ord($char))-96)<10?"0".ord($char)-96:"".ord($char)-96);
	}
	$out=$out." ";
}
say $out;