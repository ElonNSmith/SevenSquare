use strict;
use warnings;
use 5.010;
my $fha;
my $deny_for_multi_use_symbols=1;
my $deny_for_multi_symbol_letters=1;
sub pattern
{ #array of symbols, alpha
	
	my @out=undef;
	my @sym=@_;
	pop(@sym);
	open($fha,"<","divided\\".scalar(@sym)."dictionary.txt");
	my $alpha=$_[-1];
	###############################################
	#print "sym : : : :";
	#for (my $var = 0; $var < scalar(@sym); $var++) {
	#	print $sym[$var];
	#}
	#say   " ";
	#say   "alpha : : :".$alpha;
	##########################################3333333
	while(my $solution=<$fha>)
	{
		chomp $solution;
		my $alpabet=$alpha;
		my $valid=1;
		if (length($solution)!=scalar(@sym))
			{$valid=0;}
		else
		{
			for(my $x=0;$x < length($solution);$x++)
			{
				if (index($alpabet,substr($solution,$x,1))== -1)
				{
					if(substr($alpabet,$sym[$x]-1,1) eq " ")
					{
						substr($alpabet,$sym[$x]-1,1)=substr($solution,$x,1);
					}
					else
					{
						#2 meanings 1 symbol
						$valid=($deny_for_multi_use_symbols==1?0:1);
					}
				}
				else
				{
					if(!(substr($solution,$x,1) eq substr($alpabet,$sym[$x]-1,1) ))
					{
						#2 symbols a meaning
						$valid=($deny_for_multi_symbol_letters==1?0:1);
					}
				}
			}
		}
		if ($valid ==1) {
			push(@out,$solution);
			push(@out,$alpabet);
		}
	}
	shift(@out);
	return @out;
	close $fha;
}#returns solution, dictionary,solution dictionary....

say "Pattern match uses 01 through 26 as symbols";
say "ie: a  word with the Pattern of \"hello\" woudld be 0102030304";



my $in = <>;
chomp $in;
my @todo=split(' ',$in);
$in=$todo[0];
my $size,my $t,my @a;

 $size=length($in)/2;
 $t="";
for (my $var = 0; $var < length($in); $var=$var+2) {
	$t=$t.substr($in,$var,2)." ";
}	
 @a=split(' ',$t);
foreach my $x (@a) {
	$x=int($x)
}

my $alp="abcdefghijklmnopqrstuvwxyz";
   $alp="                          ";
   my @temp=pattern(@a,$alp);
   my @temp2;
   my @final;
say scalar(@todo);
#for (my $var = 0; $var < scalar(@temp); $var+=2) {
#	say $temp[$var];
#}
for (my $var = 1; $var < scalar(@todo); $var++)
{	
	$in=$todo[$var];

 	$size=length($in)/2;
 	$t="";
	for (my $var = 0; $var < length($in); $var=$var+2) {
		$t=$t.substr($in,$var,2)." ";
	}	
	 @a=split(' ',$t);
	foreach my $x (@a) {
		$x=int($x)
	}
	$|=1;
	for (my $var2 = 0; $var2 < scalar(@temp); $var2+=2)
	 {
	 	print $var2."\\".scalar(@temp)."   word ".$var." of ".scalar(@todo).($var2+2==scalar(@temp)?"\n":"\r");
	 	my @app=undef;
	 	   @app=pattern(@a,$temp[$var2+1]);
	 	if (scalar(@app)!=0) {
	 		# body...
	 	
	 	#################

	 	#for (my $vag = 0; $vag < scalar(@app); $vag+=2) {
		#	say $app[$vag];
		#}

		#say $temp[$var2+1];

		##################
	 	for (my $var3 = 0; $var3 < scalar(@app); $var3++) {
	 		if ($var3 % int(2)==0) {
	 			
	 			my $megatemp=$temp[$var2]." ".$app[$var3];
	 			$app[$var3]=$megatemp;
	 		}
	 	}
	 	push(@temp2,@app);
	 }
	}
	$|=0;
	@temp=@temp2;
	undef @temp2;
}

@final=@temp;

for (my $var = 0; $var < scalar(@final); $var+=2) {
	say $final[$var];
}


