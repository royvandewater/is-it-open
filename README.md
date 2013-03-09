is-it-open
==========


Use it to see if [Gangplank Chandler is
open](http://is-it-open.royvandewater.com)

API
---

To retrieve the current status, send a `GET` request to `/api/v1/gangplank`.

    curl -H "Accept: application/json" http://is-it-open.royvandewater.com/api/v1/gangplank


To update the current status, send a `PUT` request to `/api/v1/gangplank` using and set the `open_until` attribute.

    curl -H "Accept: application/json" \
         -H "Content-Type: application/json" \
         -X PUT \
         -d '{"open_until": "2013-03-06T23:00:00-07:00"}' \
         http://is-it-open.royvandewater.com/api/v1/gangplank

