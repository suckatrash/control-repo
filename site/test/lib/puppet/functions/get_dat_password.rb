Puppet::Functions.create_function(':get_dat_password') do  
  dispatch :getit do
    param 'String', :username
  end
  
  def getit(username)
    case username
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
