serpent = require 'serpent'
tdbot_function = require('Bot.tdbot').getCallback()
 tdbot  =  require'U-T.tdbot'
function vardump(w)
   print(serpent.block(w, {comment=false}))
end
bot = {}
plugin = {}
MsgTime_ = os.time() - 5
getINFO = function(IN, WIT)
 bot.id = WIT.id
 bot.name = WIT.first_name
 bot.username = WIT.username or ''
 bot.phone_number = WIT.phone_number

end
TimeNow = os.time()

timenow_ = os.date("%M:%S")
function dl_cb(extra, res)
 -- vardump(res)
 -- vardump(extra)
 if res.message then

 print("\027[" .. color.black[1] .. ";" .. color.red[2] .. "m ==> ERROR "..res.message.." \027[00m")
 end
end
M_T = function(PT,TX)
 if TX then
   local PG_ = { TX:match(PT) }
     if next(PG_) then
       vardump(PG_)
       return PG_

     end
     end
         end
function match_(...)
 val = {}
for no,crco in ipairs({...}) do 
    val[crco] = true 

    end
return val
end

local clock = os.clock
function sleep(n) 
local t0 = clock()
while clock() - t0 <= n do 
end 
end

 local function l_PL(...)
   crco = {...}
   msg = crco[1] 
   plug = crco[2] 
   match = crco[3]
   if plug.runing and match  then
       local result = plug.runing(msg, 
       match
     )
       if result then
      
        tdbot.sendText(msg.chat_id, msg.id,result, 'md', false, false, false, 0, nil, nil, nil)


     end
   end
   end
last = '☤'
Valid_ = function (CR_)
 if tonumber(CR_.date) < tonumber(MsgTime_) then
   print("\027[" .. color.black[1] .. ";" .. color.green[2] .. "m ==> OLD MESSAGE \027[00m")
  return false
 else
   return true
 end
end


run_BOT= function (...)
 arg_ = {...}
 msg = arg_[1] 
 data_ = arg_[2]
 if (data_ or msg) then
   for name, plugint in pairs(plugin) do
     if plugint.run  then
    msg_ = plugint.run(msg,data_)
    if msg_ then
    print("Pre Run =>> ", name)
     end
     
   end
 if msg then

  for p = 1, #plugint.patterns do
      PT_= plugint.patterns[p]
     
       TX_ = msg.on.text or msg.on.caption 
      MT_ = M_T(PT_, TX_)
         if MT_ then 
         print('PAT : ',PT_)
       end  
       l_PL(msg,plugint,MT_)
     
     end
   end
     end
end
----
end
PluginLoad = function()
if not config then 
 return 
end

   for _, files in pairs(config.data.plist) do
       print ("Loaded Plugin : ", files)
   local ok, err =  pcall(function()
   local PL_LOAD = loadfile("./plugins/"..files..'.lua')()
   plugin[files] = PL_LOAD
   end)
   if not ok then
        print('\27[31mError loading plugins '..files..'\27[39m',err)
   end
 end
--
end

PluginLoad()

function tdbot_update_callback (data_)

 tdbot.getMe( getINFO,nil)
 getMainMessage(data_,nil,data_)

 if (data_._ == "updateDeleteMessages")  then
 elseif ( data_._ == "updateNewMessage" or data_._ == "updateNewChannelMessage") then
   if data_ and  Valid_(data_.message) or (data_.message.date and Valid_(data_.message)) then
   
   getMainMessage(data_,data_.message,data_)
   end
 elseif (data_ or data_._== "updateMessageEdited") then
   getMainMessage(data_,data_.message,data_)
 function updateMessageEdited(amir,crco)
   if crco and crco.date and Valid_(crco) then
   getMainMessage(data_,crco,data_)
   end
 end
 tdbot.getMessage(data_.chat_id, data_.message_id, updateMessageEdited, nil)
 end
end
 require('Bot.tdbot').run(tdbot_update_callback)
