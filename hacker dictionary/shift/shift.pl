use strict;
use warnings;
use 5.010;

#say ord(chr(65));
sub shaft{
	my $in=$_[0];
	my $shoft=$_[1];
	$in=lc($in);
	$in=ord($in);
	$in=$in+$shoft;
	while($in>122)
	{
		$in=$in-26;
	}
	$in=chr($in);
	return $in;
}

sub shaftword{
	my $out="";
	my @in=split("",$_[0]);
	foreach my $x (@in) {
		$out=$out.shaft($x,$_[1]);
	}
	return $out;
}

sub shaftwhole {
	my @in=split(' ',$_[0]);
	my $out="";
	foreach my $x (@in) {
		$out=$out.shaftword($x,$_[1])." ";
	}

	my @rev=split("",$out);
	$out=$out."  |  ";
	for(my $x=@rev-1;$x>-1;$x=$x-1)
	{
		$out=$out.$rev[$x];
	}
	return $out;
}
say "input (less than 100 characters)";
my $in = <>;
for (my $var = 0; $var < 26; $var++) {
	if ($var<10) {
		say " ".$var.") ".shaftwhole($in,$var);
	}
	else
	{
		say $var.") ".shaftwhole($in,$var);
	}
}