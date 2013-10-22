#!/usr/bin/perl
my $cmd = q/ps -ef |grep httpd |grep -v grep |awk '{print $8, $9, $10, $11, "restart"}'/;
my @restart_cmd = `$cmd`;
for (@restart_cmd) {
    `$_`;
}
