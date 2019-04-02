define test::network::windows_team::interface (
  Array[String]       $ipaddress,
  String[1]           $gw_address,
  String[1]           $interfacealias,
  Enum['IPv4','IPv6'] $addressfamily = 'IPv4',
){

  include test::network::windows_team::install_dsc_modules

  dsc {"$name-ip-address":
    resource_name => 'IPAddress',
    module        => 'NetworkingDsc',
    properties    => {
      ipaddress      => $ipaddress,
      interfacealias => $interfacealias,
      addressfamily  => $addressfamily,
    },
    require       => Class['test::network::windows_team::install_dsc_modules'],
  }

  dsc {"$name-default-gw":
    resource_name => 'DefaultGatewayAddress',
    module        => 'NetworkingDsc',
    properties    => {
      address        => $gw_address,
      interfacealias => $interfacealias,
      addressfamily  => $addressfamily,
    }
  }

}
