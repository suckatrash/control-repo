Facter.add("ps_ews_app") do 
  confine :kernel => "Linux" 
    setcode do 
      %x{if [ -d /opt/ewsConfig ]; then ps -ef | grep httpd | grep -v HTTP | awk '{print($12)}' | cut -f4 -d/ | sort | uniq | tr -d '<>|' | sed '/^$/d' | tr "\\n" " "; else echo NA; fi}.chomp 
    end 
  end
