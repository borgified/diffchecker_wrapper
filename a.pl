#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

my $url = "http://www.diffchecker.com/";
$mech->get( $url );

#my @submit = $mech->find_all_submits(
#	name_regex => qr/.*/,
#);

#$mech->dump_forms;

$mech->submit_form(
	form_name => 'diffform',
	fields    => { 
		file1							=> 'pot of gold',
		file2							=> 'pota of gold',
		'storage-options' => 'forever',
	},
);


my $link = $mech->find_link( text_regex => qr/diffchecker\.com/ );

print $link->url;


#my $response = $mech->response();
#print Dumper($response);
#print $r->is_success;
#print $r->content;

