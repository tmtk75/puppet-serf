class serf {
  $basename = "0.5.0_linux_386"
  $filename = "${basename}.zip"
  include install
}

class serf::install {
  exec { "curl":
    path    => ["/bin", "/usr/bin", "/usr/local/bin"],
    command => "curl -OL https://dl.bintray.com/mitchellh/serf/${filename}",
    creates => "/tmp/${filename}",
    cwd     => "/tmp"
  }
  ->
  exec { "unzip":
    path    => ["/bin", "/usr/bin", "/usr/local/bin"],
    command => "unzip ${filename}",
    creates => "/tmp/serf",
    cwd     => "/tmp"
  }
  ->
  exec { "mv":
    path    => ["/bin", "/usr/bin", "/usr/local/bin"],
    command => "mv -f /tmp/serf /usr/local/bin",
    creates => "/usr/local/bin/serf",
  }
}

class serf::uninstall {
  exec { "rm":
    path    => ["/bin", "/usr/bin", "/usr/local/bin"],
    command => "rm -f /usr/local/bin/serf",
  }
}

