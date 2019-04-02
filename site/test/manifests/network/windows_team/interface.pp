define test::network::windows_team::interface (
  Array[String]       $ipaddress,
  String[1]           $interfacealias,
  Enum['IPv4','IPv6'] $addressfamily = 'IPv4',
){

  include test::network::windows_team::install_dsc_modules

  dsc {"$name":
    resource_name => 'DefaultGatewayAddress',
    module        => 'NetworkingDsc',
    properties    => {
      address        => $ipaddress,
      interfacealias => $intrfacealias,
      addressfamily  => $addressfamily,
    },
    require       => Class['test::network::windows_team::install_dsc_modules'],
  }

}
