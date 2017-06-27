module Puppet::Parser::Functions
  newfunction(:get_dat_password, :type => :rvalue) do |arguments|

  case arguments[0]
    when "user1"
      return 'user1pass'
    when "user2"
      return 'user2pass'
    when "user3"
      return 'user3pass'
    when "user4"
      return 'user4pass'
    when "user5"
      return 'user5pass'
    when "user6"
      return 'user6pass'
    else
      return "error"
  end

  end

end

