# == Class: jenkins::proxy
#
# Setup apache proxy in front of jenkins
#
# === Variables
#
# === Authors
#
# Author Name Maxence Dunnewind (<maxence@dunnewind.net>)
#
# === Copyright
#
# Copyright 2013 Maxence Dunnewind
#
class jenkins::proxy {
    include apache
    apache::vhost::proxy { 'jenkins':
        port       => 80,
        dest       => 'http://127.0.0.1:8080',
        servername => $::fqdn
    }
} # jenkins::proxy
