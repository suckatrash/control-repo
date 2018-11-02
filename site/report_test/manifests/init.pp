class report_test (
  Boolean $variable
){

  class {'report_test::subclass':
    variable => $variable,
  }
}
