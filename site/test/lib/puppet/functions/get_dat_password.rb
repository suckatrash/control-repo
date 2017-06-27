Puppet::Functions.create_function(':get_dat_password') do  
  
def call(scope, *args)
    manipulated_args = [scope] + args
    self.class.dispatcher.dispatch(self, scope, manipulated_args)
  end
end
