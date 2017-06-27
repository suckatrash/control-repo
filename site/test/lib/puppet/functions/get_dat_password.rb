Puppet::Functions.create_function('get_dat_password') do  
  dispatch :deprecation_gen do
    param 'Any', :scope
    repeated_param 'Any', :args
  end  

  def call(scope, *args)
    manipulated_args = [scope] + args
    self.class.dispatcher.dispatch(self, scope, manipulated_args)
  end
end
