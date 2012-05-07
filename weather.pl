#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;
use feature ':5.10';
use Irssi;
use JSON;
use vars qw($VERSION %IRSSI);
use Weather::Underground; # install this from CPAN

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
    my $weather = Weather::Underground->new(
        place => "Montreal, Canada",
        debug => 0,
    )
    || die "Error, could not get weather: $@\n";

    my %gettingweather = $weather->get_weather() || die "Error calling get_weather()";
    return $gettingweather{"temperature_celsius"};
}

sub send_msg {
    my ($server, $target, $text) = ($_[0], $_[1], join(' ', @_[2..$#_]));
    return unless defined $text && $text ne '';
    Irssi::timeout_add_once(50, sub { $server->command("MSG $target $text") }, undef);
}

sub message_public {
    my ($server, $text, $nick, $addr, $target) = @_;
    my @cmd = split /\s+/, $text;
    
    my $send = sub {
    };

    given ($cmd[0]) {
        when ($prefix . 'w') { #sends weather
            send_msg($server, $target, get_weather_data($cmd[1]));
        }
    }
}

Irssi::signal_add('message public', 'message_public');
