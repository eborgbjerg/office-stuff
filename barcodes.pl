#!/usr/bin/perl
use strict;
use warnings;
use v5.22;
use autodie;

# read all active bar codes
open(my $barcode_file, '<', 'barcodes.csv');
my %barcodes;
while (my $line = <$barcode_file>) {
    chomp $line;
    $barcodes{$line} = "1";
}

# read price file.
# write out those with a barcode in the barcode file.
open(my $price_file, '<', 'prices.csv');
while (my $line = <$price_file>) {
    chomp $line;
    (my $barcode, my $price) = split(/,/, $line);
    if (exists($barcodes{$barcode})) {
        say $barcode . "," . $price;
    }
}

