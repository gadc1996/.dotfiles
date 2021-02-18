# Defined in - @ line 0
function get-ip --description 'alias get_ip ifconfig | grep "inet " | grep -v 127.0.0.1'
	ifconfig | grep "inet " | grep -v 127.0.0.1 $argv;
end
