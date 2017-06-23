class {'test::windows::acl':

acl { 'c:/windows/system32/xcopy.exe': 
  purge => 'true', 
  permissions => [ 
    { identity => 'S-1-15-2-1', rights => ['full']}, 
  ], 
  inherit_parent_permissions => 'false', 
}

acl { 'c:/windows/system32/wbem/wmic.exe': 
  purge => 'true', 
  permissions => [ 
    { identity => 'APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES', rights => ['full']}, 
  ], 
  inherit_parent_permissions => 'false', 
}

acl { 'c:/windows/system32/wscript.exe': 
  purge => 'true', 
  permissions => [ 
    { identity => 'ALL APPLICATION PACKAGES', rights => ['full']}, 
  ], 
  inherit_parent_permissions => 'false', 
} 

}
