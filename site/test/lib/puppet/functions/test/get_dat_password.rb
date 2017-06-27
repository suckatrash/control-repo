Puppet::Functions.create_function('test:get_dat_password') do  
  def get_dat_password(user, nothing)

  case user
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

