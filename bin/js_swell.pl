package MyJsSwell;
use strict;
use warnings;
use base qw(JavaScript::Swell);

sub add_indent {shift->{parser_state}->{indent} += 4}
sub dec_indent {shift->{parser_state}->{indent} -= 4}

1;

package main;
use strict;
use warnings;


my $data;
while (<>) {
    $data .= $_;
}

print MyJsSwell->swell($data);
