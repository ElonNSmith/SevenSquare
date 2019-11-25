use strict;
use warnings;
use 5.010;
my $fha;

my $deny_for_multi_use_symbols=1;
my $deny_for_multi_symbol_letters=1;
sub pattern
{ #array of symbols, alpha
	open($fha,"<","dictionary.txt");
	my @out=undef;
	my @sym=@_;
	pop(@sym);
	my $alpha=$_[-1];
	###############################################
	print "sym : : : :";
	for (my $var = 0; $var < scalar(@sym); $var++) {
		print $sym[$var];
	}
	say   " ";
	say   "alpha : : :".$alpha;
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
	shift @out;
	return @out;
	close $fha;
}#returns solution, dictionary,solution dictionary....
my @pat=(1,2,3,3,4);
my $let="abcdefghijklmnopqrstuvwxyz";
   $let="                          ";
   my @pat2=(1,5,6);
my @a=pattern(@pat,$let);

my @out=pattern(@pat,$let);

say $out[0];
say $a[0];
