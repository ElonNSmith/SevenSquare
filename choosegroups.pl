#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
#use Data::Dumper qw(Dumper);
my $helpstring="
#####################################################
Okay so hooolly shit I hava no idea how to document
soo here it goes

give command in form of:
$0 [number_of_groups [sequence|random]]
other forms or the form:
$0 --help 
will display this message

Exluding optional flags will result in behavior of 
$0 4 random

I'm not catching errors so don't fuck this up
please

output will take the form of part of a sed script
for instance
$0 4 random 
could (if you were very lucky)  return

s/[abcdefg]/0/;s/[hijklmn]/1/;s/[opqrst]/2/;s/[uvwxyz]/3/

number_of_groups determines the number of character groups
 0 is an invalid option
 so is 27
 so is fourteen
 Don't get cute asshole

random makes the groups random in nature 
sequence makes the groups be consistant according to a frequemcy distribution in the standard english corpus.  the first group will be the largest.  When using the sequence flag you will always get the same result for the number of groups specified.

good luck and godspeed
##############################################################
";


my $alph="abcdefghijklmnopqrstuvwxyz";
my $sequ="etaoinsrhdlucmfywgpbvkxqjz";
$alph=$sequ;
my $seqdo=0;
my $grp=4;
my $fuck= "don't fuck with me sam";
if(@ARGV > 2){say $helpstring and die $fuck;}
if(@ARGV > 0){
	$grp = int($ARGV[0]);
	if ($grp < 1 || $grp > 26) {say $helpstring and die $fuck;}
	if(@ARGV>1){
		my $string = $ARGV[1];
		if(!($string eq "random"||$string eq "sequence" )){say $helpstring and die $fuck;}
		if($string eq "sequence" ){$seqdo=1;}		
	}
}


my @al=split('',$alph);

my $rem = scalar(@al) % $grp;
my $bas = int(scalar(@al)/$grp);
my $out2="";
for(my $i=0;$i<$grp;$i++){
	my $out="";
	my $j=$bas;
	if($rem>0){
		$rem --;
		$j++;
	}
	for(;$j>0;$j--){
		my $temp = int(rand(scalar(@al)));
		if($seqdo==0){
			$out.=$al[$temp];
			splice(@al,$temp,1);
		}
		elsif($seqdo==1){
			$out.=$al[0];
			splice(@al,0,1);
		}
	}
	#say $out;
	$out2.="s/\[$out\]/$i/;";
	#print Dumper \@al;
}


print $out2;
