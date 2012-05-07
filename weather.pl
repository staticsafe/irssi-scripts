#!/usr/bin/env perl

use strict;
use warnings;
use Irssi;
use JSON;
use vars qw($VERSION %IRSSI);

$VERSION = '0.1';
%IRSSI = (
    authors     => 'staticsafe',
    contact	    => 'irc.entropynet.net/lounge',
    name	    => 'weather bot',
    description	=> 'Retrieves the weather for user requested channels and outputs them to channel',
    license	    => 'MIT License',
    url         => 'https://github.com/staticsafe/irssi-scripts',
    changed     => 'Mon May  7 10:54:44 EDT 2012',
);

# Some needed global vars

our $api_key = '';
our $owner = 'staticsafe';
our $prefix = ".";

sub get_weather_data {
}

sub send_msg {
}

sub message_public {
    my ($server, $text, $nick, $addr, $target) = @_;
    my @cmd = split /\s+/, $text;
    
    my $send = sub {
    };

    given ($cmd[0]) {
        when ($prefix . 'version') { #sends version
            send_msg($server, $target, "This is Fear-chan's weather module, version 0.1.")
        }
    }
}

Irssi::signal_add('message public', 'message_public');
