#!/bin/bash
set -eu                                                 # bail on errors
passenger-install-nginx-module --auto --auto-download   # install without prompting
update-rc.d nginx defaults                              # activate autostart
service nginx restart     
