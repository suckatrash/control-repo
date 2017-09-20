Facter.add('rundir') do
  setcode do
    Puppet.settings['rundir']
  end
end
