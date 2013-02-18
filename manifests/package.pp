class jenkins::package($version = 'installed') {
  package {
    'jenkins' :
      ensure => $version;
  }

  package { 'git':
    ensure => present
  }

  package { 'rpm':
    ensure => present
  }

  if $::operatingsystem == 'Debian' {
      package { 'rubygems':
        ensure => present
      }

      package { 'ruby1.9.1-full':
        ensure => present
      }
  }

  package { 'rake':
    ensure   => present,
    provider => 'gem'
  }

  package { 'bundler':
    ensure   => present,
    provider => 'gem'
  }

  package { 'subversion':
    ensure => present
  }

  file { '/home/jenkins':
    ensure  => directory,
    owner   => 'jenkins',
    mode    => '0750',
    require => Package['jenkins']
  }

  file { '/home/jenkins/.ssh':
    ensure  => directory,
    owner   => 'jenkins',
    mode    => '0700'
  }

  file { '/home/jenkins/.ssh/id_rsa':
    ensure  => file,
    owner   => 'jenkins',
    group   => 'jenkins',
    content => file('/etc/puppet/secrets/e2cbot.priv'),
    mode    => '0600'
  }
}

# Note:  Jenkins should install java, but it doesn't.  You may have to do it on your own.
