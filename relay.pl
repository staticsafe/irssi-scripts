#!/usr/bin/env perl

use strict;
use warnings;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = '1.01';
%IRSSI = (
    authors     => 'R1cochet',
    contact	    => '#fux0r',
    name	    => 'realy_bot',
    description	=> 'sends messages from one channel to another channel on a different network',
    modules     => 'use Storable',
    license	    => 'GNU General Public License v3.0',
    changed     => 'Tue Oct 25 21:43:23 PDT 2011',
);

sub message_public {                                         # parse the message
    my ($server, $msg, $nick, $nick_addr, $target) = @_;

    my $listen_to_channel = "Ginpachi-Sensei";
    my $listen_to_channel2 = "anime-sharing";
    my $listen_to_channel3 = "doki";
    my $send_to_server = "EntropyNet";
    my $send_to_channel = "#anime";
    #my $listen_to_nick = "Sadaharu";

    if ($target  =~ m/#(?:$listen_to_channel)/) {
        if ($nick =~ /Sadaharu|Cerebrate/) {
            my $server2 = Irssi::server_find_tag($send_to_server);
            $server2->command ("msg $send_to_channel $msg");
        }
    }
    elsif ($target =~ m/#(?:$listen_to_channel2)/) {
        if ($nick =~ /AS\|Sena|AS\|Hinata|AS\|Sana/) {
            my $server2 = Irssi::server_find_tag($send_to_server);
            $server2->command ("msg $send_to_channel $msg");
        }
    }
    elsif ($target =~ m/#(?:$listen_to_channel3)/) {
        if ($nick =~ /A\|FanserviceBot|Cerebrate/) {
            my $server2 = Irssi::server_find_tag($send_to_server);
            $server2->command ("msg $send_to_channel $msg");
        }
    }
}

Irssi::signal_add('message public', 'message_public');

