#!/bin/perl
#Thomas Miller

print "Boy, Girl or Either?\n";
my $gender = <STDIN>;
chomp $gender;
print "\nHow many name suggestions?\n";
my $amount = <STDIN>;
chomp $amount;

if ( $amount > 200 ) {
	print "Way too many names, choose a number less than 200.\n";
	exit 0;
}
elsif ( $amount <= 0 ) {
	print "You entered a word or a negative number(or 0)!\n";
	exit 0;
}
if ( lc($gender) eq "boy")
	{
		open $FILE, "<", "boynames.txt" 
			or die "Failed to open file: $!\n";
		chomp (my @names = <$FILE>);
		close $FILE; 
		for ( 1 .. $amount ) { #loop to randomly pick a name and print for amount specified
			my $randomname = $names[ rand @names ];
			print "$randomname";
		}
		exit 0;
	}
	elsif (lc($gender) eq "girl")
	{
		open $FILE, "<", "girlnames.txt"
			or die "Failed to open file: $!\n";
		chomp (my @names = <$FILE>);
		close $FILE;
		for ( 1 .. $amount ) { #loop to randomly pick a name and print for amount specified
			my $randomname = $names[ rand @names ];
			print "$randomname";
		}
		exit 0;
	}
	else 
	{
		if ( lc($gender) ne "Either") #handling miscellaneous input
			{
				print "Didn't choose valid option, choosing from either list.\n";
			}
		my @files= qw | boynames.txt girlnames.txt |;
		my @names;
		for my $filename(@files){
			open $FILE, $filename
				or die "Failed to open file $filename\n";
			push @names, <$FILE>;
			close $FILE;
					for ( 1 .. $amount ) { #loop to randomly pick a name and print for amount specified
			my $randomname = $names[ rand @names ];
			print "$randomname";
		}
		exit 0;
	}
}
