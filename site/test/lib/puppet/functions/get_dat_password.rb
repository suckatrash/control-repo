module Puppet::Parser::Functions
  newfunction(:get_dat_password, :type => :rvalue) do |args|

    if args.size < 2 or args.size > 3
      raise Puppet::ParseError, "get_dat_password(): Wrong number of arguments (#{args.size}; must be 2 or 3)"
    end

    if args.size == 3
      command.push(args[2])
    end

  case args[1]
    when "user1"
      puts 'user1pass'
    when "user2"
      puts 'user2pass'
    when "user3"
      puts 'user3pass'
    when "user4"
      puts 'user4pass'
    when "user5"
      puts 'user5pass'
    when "user6"
      puts 'user6pass'
    else
      puts "error"
    end

  end
end

