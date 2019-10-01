pat = {
	"^(ping)$",
	}
	run = function(msg,crco)
	if is_sudo(msg.sender_user_id) then
	if crco[1]== 'ping' then
	           return tdbot.sendText(msg.chat_id, msg.id,'PONG', 'md', false, false, false, 0, nil, nil, nil)

	end
	end
	end
	
	return { 
	patterns = pat,
	runing = run 
	}