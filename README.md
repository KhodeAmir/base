# **CRCO 2019** #
<div align="center"><a href="https://t.me/CRCO-PROJECT"><img src="http://s8.picofile.com/file/8312881426/photo_2017_09_19_11_51_39.jpg" width="300"></a></div>


# installing

Install luarocks and : `luasocket` , `redis-lua` , `lua5.2` ,  `serpent`



See example plugin below.


```lua
pat = {
    "^(ping)$"
}
     main = function (msg,crco)
  if crco[1] == 'ping' then
  tdbot.sendText(msg.chat_id, msg.id,'`PONG`', 'md', false, false, false, 0, nil, nil, nil)
end
         end
         return { 
	patterns = pat,
	runing = main 
	}
```




# [Telegram Group](https://t.me/crco_chat)
## CRCO - Amir Bagheri
