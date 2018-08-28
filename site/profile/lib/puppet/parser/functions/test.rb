require 'puppet/type/file'
 
module Puppet::Parser::Functions
  newfunction(:owner_defed_after_require, :type => :rvalue) do |args|
    Puppet.info "owner_defed_after_require: enter"
 
    klass_defined = false
    if Object.const_defined?("Puppet")
      klass = Object.const_get("Puppet")
      if (klass.const_defined?("Type"))
        klass = klass.const_get("Type")
        if (klass.const_defined?("File"))
          klass_defined = klass.const_get("File").const_defined?("Owner")
        end
      end
    end
 
    Puppet.info "owner_defed_after_require: exit (#{klass_defined})"
    klass_defined
  end
end
