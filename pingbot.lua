#!/usr/bin/lua

--[[
  
  A simple pingbot for Discord.
  (Still needs to identify with a gateway once.)
  
  Starts spamming right away when this script is executed.
  Sends `msg` every `slep` seconds in a specified channel
    while the script is running.
  
]]


----[ Constants ]----
-- Duration (in seconds) between each post
local slep  = 0.8501

-- The message to send
local msg   = "@everyone @here YEET!"

-- ID of the channel to spam.
local chid  = "439756065652080662"


----[ Reqs ]----

local sleep = require("socket").sleep
local https = require("ssl.https")  
local ltn12 = require("ltn12")

local json = require("dkjson")

local _tokf = io.open("token.txt","r")
local tok = _tokf:read("*a")
_tokf:close()
_tokf = nil

local _base = "https://discordapp.com/api"  

local _head = {
  ["Authorization"] = ('Bot '..tok),
  ["User-Agent"] = ("PingBot"..' ('.."pingbot"..', '.."1.0"..') botver/'.."1.0"),
  ["Content-Type"] = 'application/json'
}


local function exec(method, url, header, data)

  if not(method=="POST" or method=="GET") then
    return nil, nil, "Invalid request type" end
  
  local body, headers = {}, {}
  
  for k,v in pairs(header) do headers[k] = v end
  
  if method == "POST" then
    headers["Content-Length"] = tostring(#tostring(data or ""))
  elseif method == "GET" then
    headers["Content-Type"] = nil
  end
  
  local _, rc, head, _ = https.request{
    method = method,
    url = url,
    headers = headers,
    source = ltn12.source.string(data),
    sink = ltn12.sink.table(body)
  }
  
  return table.concat(body), head, rc
end

while true do  

  _, _, rc = exec(
    "POST",
    _base.."/channels/"..chid.."/messages",
    _head,
    json.encode{content = msg}
  )
  
  print(rc)
  sleep(slep)
  
end
