#!/usr/bin/perl
my $cmd = q!ps -ef |awk '$8 ~ /httpd/ {print $8, $9, $10, $11, "restart"}'!;
my @restart_cmd = `$cmd`;
for (@restart_cmd) {
    `$_`;
}
