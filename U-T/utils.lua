--U-T
utf8 = require "U-T.utf8" 
  client = require("redis")
  socket = require('socket')
    redis = client.connect('127.0.0.1', 6379)
        serpent = require "serpent"
     encode_json = require("dkjson")
   https = require("ssl.https")
  http = require("socket.http")
       ltn12 = require("ltn12")
   ---MULTY, PRE -- 
   CreateFile = function(data, file, uglify)
file = io.open(file, "w+")
local serialized
if not uglify then
 serialized = serpent.block(data, {comment = false,name = "_configEnv"})
else
 serialized = serpent.dump(data)
end
file:write(serialized)
file:close()
end
configEnv = {}
configEnv.data = {
  plist = {
    "test",
    "P-l"
 
  },
}   
getMainMessage=function (...)
 
  arg_  = {...}
    msg = arg_[2] 
      data = arg_[3]
      update = arg_[1]
      if msg  then
     --[[
       TDLIB UPDATE
    
      global msg.content: {
        _: table
        animation: table ,
        caption: table,
        entities: table ,
        game: any,
        member_user_ids: table,
        photo: table ,
        stricker: table,
        text: table,
        video_note: table,
          }

          global msg: {
            add: string,
            chat_id: string,
            content: table,
            date: number,
            id: any,
            on: table,
            reply_markup: any,
            reply_to_message_id: string,
            sender_user_id: string,
            via_bot_user_id: any,
        }
        ]]

    msg.on = {}
if msg.content._ == "messageText" and  msg.content.text.text then
      msg.on.text =  msg.content.text.text
elseif  msg.content._ == "messageText" and  msg.content.caption.text then
      msg.on.caption = msg.content.caption.text
      
  end

end
  run_BOT(msg,update)

end

SelfVersion = '\n*Version* _:_`|BETA => 2.1|`'
dofile_ = function(filename)
if io.open("./U-T/"..filename..'.lua' or '','r') ==nil then
 text =  'No file exists on this path !\n==> CRCO PROJET <=='
 print(text)
 CreateFile(configEnv , "./U-T/"..filename..'.lua')
 print ('Config DEFAULT created !')
end
local __configEnv = dofile ("./U-T/"..filename..'.lua')
return __configEnv
end

config = dofile_( "config" )
function vardump(PRE)
print(serpent.block(PRE, {comment=false}))
end
            function replace(value, del, find)
   del = del:gsub(
        "[%(%)%.%+%-%*%?%[%]%^%$%%]",
               "%%%1"
) 
      find = find:gsub(
          "[%%]", 
              "%%%%"
) 
return string.gsub(
    value,
     del,
      find
)
end
function match(...)
val = {}
for no,crco in ipairs({...}) do 
   val[crco] = true 
end
return val
end

threads = {}
  getSixe = function(b)
    local l = "B"
    if b > 1024 then
    b = b / 1024
    l = "KB"
    if b > 1024 then
    b = b / 1024
    l = "MB"
    if b > 1024 then
    b = b / 1024
    l = "GB"
    end
    end
        end
        return string.format("%7.2f%2s",b,l)
    end
  MainGetMessage =  function (arg,co)
      if co.messages then
      for k ,v in pairs(co.messages) do
        if v.sender_user_id then
       tdbot.deleteChatMessagesFromUser(v.chat_id,v.sender_user_id,nil,nil)
      end
    
    end
      if co.messages and co.messages[1] and co.messages[1].chat_id and co.messages[1].id then
       tdbot.getChatHistory(co.messages[1].chat_id, co.messages[1].id,0 , 100, MainGetMessage, nil)
       end
    
       
       end
      
      end
function getTableSize(t)
  local count = 0
  for _, __ in pairs(t) do
      count = count + 1
  end
  return count
end
 getuserMain = function(user_id)

local username_ = nil
  function getid(b, g)
  if g.username then
username_ = '@'..g.username
  else
  username_ = g.first_name
  end
  end
tdbot.getUser(user_id,getid,nil)
return username_
end
seen = {}

function ec_name(names) 
   name = names
if name then
   if name:match('_') then
       name = name:gsub('_','')
end
        if name:match('*') then
       name = name:gsub('*','')
end
   if name:match(']') then
       name = name:gsub(']','')
end
           if name:match('[[(]]') then
   name = name:gsub('(','')
end
   if name:match('[[)]]') then
       name = name:gsub(')','')
end
   if name:match(']') then
   name = name:gsub(']','')
end
           if name:match('`') then
       name = name:gsub('`','')
end
                return name
end
end
function check_cmd(y,x)
for k,v in pairs(x) do
 if y == k then
   return false
 end
end
return true
end

 function check_save(y,x)
for k,v in pairs(config[data][y]) do
 if x == k then
   return k
 end
end
return false
end
dataB = {}
Get = function(value, main
)
Val_ = nil
if main then
if  config.data[value] and  config.data[value][main] then
       Val_ =   config.data[value][main]
       end
   else
if  config.data[value] then
Val_ =  config.data[value]
   end
   end
   return Val_
end 
save = function(val,name,tas)
  if tas then  
    if not config.data[val] then
      config.data[val] = {}
    end
  config.data[val][name] = tas
else
  config.data[val]  = name
end
  CreateFile(config , "./U-T/config.lua")
end
getUserStatus = function(status)
  if status then
  if status._ == 'userStatusOnline' then
  PreStatus = '|Online|'
  elseif status._ == 'userStatusLastMonth' then
  PreStatus = '|Last Month|'
  elseif status._ == 'userStatusLastWeek' then
  PreStatus = '|Last Week|'
  elseif status._ == 'userStatusRecently' then
  PreStatus = '|Recently|'
  elseif status._ == 'userStatusOffline' then
  PreStatus= '|Offline|'
  elseif status._ == 'userStatusEmpty' then
  PreStatus = '|The user status was never changed|'
  end
else
    PreStatus = '|Error 404|'
end
  return PreStatus
  end
  getUserType = function(type)
    if type then
    if type._ == 'userTypeRegular' then
    PreType = '|userType|'
    elseif type._ == 'userTypeDeleted' then
    PreType = '|userDeleted|'
    elseif type._ == 'userTypeBot' then
    PreType = '|userBot|'
    elseif type._ == 'userTypeUnknown' then
    PreType = '|Unknown|'
    end
  else
      PreType = '|Error 404|'
  end
    return PreType
  end
  
returndata = function(value)
if  value == nil  then
  return '|D|'
elseif value  and type(value) ~= 'string' then
  return '|E|'
elseif value and type(value) == 'string' then
return '|'..value..'|'
end
end

function save_array_test(tab) 
  local table={}
   for k,_ in pairs(tab) do
    --config.data 
    table[#table+1]=k
  end
  end


CHECK = function(VAL,NAME)
  if config.data[VAL] then
  for k,v in pairs(config.data[VAL]) do
 
      if NAME == v then
          return k
      end
  end
end
  return false
end
is_Saved = function(pth,name)

    list = config.data[pth] or {}
 
  
         for v,value in pairs(list) do
      

          if name == value then
      
          var = false
          else 
            var = true
         end
        end

        if #list == 0 then
       
          var = true
        end    
  
      return var
    
end
sadd = function(val,name)
  if not config.data[val] then
    config.data[val] = {}
  end
  if is_Saved(val,name)  then
  table.insert(config.data[val] ,name)
  CreateFile(config , "./U-T/config.lua")
  end
end
sremove = function(val,name)
if CHECK(val,name) then
  table.remove(config.data[val] ,CHECK(val,name))
end
end
searchvl=function(y,x) 
     for _R,v in pairs(config[data][y]) do 
     if v == x then 
return _R
  end 
     end 
     return 
end 
del = function  (value,name)
if name then
     config.data[value][name] = nil
else
  config.data[value] =nil
end
     CreateFile(config , "./U-T/config.lua")
end
is_sudo = function(user_id)
    local var = false
           for v,user in pairs(config.info.sudo_id) do
                if user == user_id then
                    var = true
end
    end
        return var
end
searchDirectory = function(directory)
       i = 0 
           list = {}
               pop = io.popen
            for files in pop('ls -a "'..directory..'"'):lines() do
        i = i + 1;
        list[i] = files
end
    return list
 end

color = {
black = {30, 40},
   red = {31, 41},
        green = {32, 42},
             yellow = {33, 43},
                blue = {34, 44},
                     magenta = {35, 45},
                        cyan = {36, 46},
                         white = {37, 47}
}
ChangeToPersian = function(num)
   local NUM = {
        ["0"] = "۰", ["1"] = "۱", ["2"] = "۲",
           ["3"] = "۳",
               ["4"] = "۴",
                   ["5"] = "۵",
                       ["6"] = "۶",
                           ["7"] = "۷",
                               ["8"] = "۸",
                                       ["9"] = "۹"
}
    return string.gsub (num, "%d",
           function(str) 
               return NUM[str] or str end)    
end  
is_private = function(msg)
  chat_id = tostring(msg.chat_id)
  if chat_id:match('^-') then return false else return true end
  end
  function Download(url, file_name)
    print("url to download: "..url)
    local respbody = {}
    local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
    }
    local response = nil
    if url:match('^https') then
    options.redirect = false
    response = {https.request(options)}
    else
    response = {http.request(options)}
    end
    local code = response[2]
    local headers = response[3]
    local status = response[4]
    if code ~= 200 then return nil end
    file_name = file_name or get_http_file_name(url, headers)
    local file_path = "./CRCO"..file_name
    print("Saved to: "..file_path)
    file = io.open(file_path, "w+")
    file:write(table.concat(respbody))
    file:close()
    return file_path
    end
    is_supergroup = function(msg)
chat_id = tostring(msg.chat_id)
if chat_id:match('^-100') then 
if not msg.is_channel_post then
return true
end
else
return false
end
end
  exists = function(nameFile)
  if type(nameFile)~="string" then return false end
  return os.rename(nameFile,nameFile) and true or false
end
function wait(waitTime)
  timer = os.time()
  repeat until os.time() > timer + waitTime
end
isFile = function(nameFile)
  if type(nameFile)~="string" then return false end
  if not exists(nameFile) then return false end
  local file = io.open(nameFile)
  if file then
      file:close()
      return true
  end
  return false
end

isDir = function(nameFile)
  return (exists(nameFile) and not isFile(nameFile))
end



