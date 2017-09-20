Facter.add('rundir') do
  setcode do
    Facter::Core::Execution.exec('puppet agent --configprint rundir')
  end
end
