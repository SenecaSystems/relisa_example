# Counter

Counter is an example Phoenix app which uses Relisa for easy deployment.

The app simply displays a running counter incremented every 25ms from Phoenix over Websocket,
as well as the current OTP app version of Counter. You can use things like `mix relisa.deploy` to 
see new versions get deployed with zero downtime (the counter never stops!). Rollbacks work as well,
of course.

For more information on how to use Relisa, see the main repo.
