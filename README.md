# Concourse CI XMPP Resource

Sends an XMPP message to a multiple recipients. Messages can be sent both to
individual recipients and chatrooms.

## Source Configuration

* `username`: *Required.*

* `password`: *Required.*

* `server`: *Required.*

* `room_nick`: *Optional.*

* `disable_ssl`: *Optional.*

* `skip_ssl_verification`: *Optional.*

* `ca_cert`: *Optional.*

### Recipients

At least one of the following two options must be specified:

* `recipients`: *Optional.*

* `rooms`: *Optional.*

## Behavior

### `check`: no-op.

### `in`: no-op.

### `out`: Send a message to a given recipients.

Description.

#### Parameters

Only one of the following two parameters must be specified:

* `text`: *Optional.*

* `text_file`: *Optional.*

## Example Configuration

### Resource Type
```yaml
- name: xmpp
  type: docker-image
  source:
    repository: vmsh/concourse-xmpp-resource
```

### Resource

```yaml
- name: notification
  type: xmpp
  source:
    recipients: ["alice@example.org", "bob@example.org"]
    rooms: ["project@conference.example.org"]
    room_nick: concourse
    username: ((xmpp_username))
    password: ((xmpp_password))
    server: example.org
```

### Plan

```yaml
- put: notification
  params:
    text: |
      [$BUILD_PIPELINE_NAME] The pipeline has failed on job $BUILD_JOB_NAME #$BUILD_NAME.
      Check it out at: https://ci.example.org/builds/$BUILD_ID
```
