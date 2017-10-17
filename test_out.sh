#!/bin/sh

echo '
{
  "source": {
    "recipients": ["alice@example.org"],
    "username": "user",
    "password": "pass",
    "server": "example.org",
    "disable_ssl": true,
    "skip_ssl_verification": false,
    "debug": true
  },
  "params": {
    "text": "one recipient, $PWD"
  }
}
' | ./out

echo; echo; echo

echo '
{
  "source": {
    "rooms": ["room1@conference.example.org", "room2@conference.example.org"],
    "room_nick": "concourse-xmpp-resource",
    "username": "user",
    "password": "pass",
    "server": "example.org",
    "disable_ssl": false,
    "skip_ssl_verification": true,
    "debug": "true"
  },
  "params": {
    "text": "two rooms, $PWD"
  }
}
' | ./out

echo; echo; echo

echo '
{
  "source": {
    "recipients": ["alice@example.org", "bob@example.org"],
    "rooms": ["room1@conference.example.org", "room2@conference.example.org"],
    "room_nick": "concourse-xmpp-resource",
    "username": "user",
    "password": "pass",
    "server": "example.org",
    "disable_ssl": false,
    "skip_ssl_verification": false,
    "ca_cert": "-----BEGIN CERTIFICATE----------END CERTIFICATE-----",
    "debug": "true"
  },
  "params": {
    "text_file": "/etc/hostname"
  }
}
' | ./out

echo; echo; echo

echo '
{
  "source": {
    "recepients": "alice@example.org",
    "room_jids": "room1@conference.example.org",
    "room_nick": "concourse-xmpp-resource",
    "debug": "true"
  },
  "params": {
    "wtf": "error"
  }
}
' | ./out
