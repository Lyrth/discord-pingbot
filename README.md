# discord-pingbot
A small Discord bot that ~~spams~~sends messages every specified number of seconds. For when you feel very spammy or bored.

## Requirements:
* Lua >= 5.2
* luasocket - [LuaRocks](https://luarocks.org/modules/luarocks/luasocket), [GitHub](https://github.com/diegonehab/luasocket)
* luasec - [LuaRocks](https://luarocks.org/modules/brunoos/luasec), [GitHub](https://github.com/brunoos/luasec)
* dkjson - [LuaRocks](https://luarocks.org/modules/dhkolf/dkjson), [Homepage](http://dkolf.de/src/dkjson-lua.fsl/home)

## Usage:

Place the bot's token in `token.txt` in the same directory as the script.

Edit `pingbot.lua` and change `chid` to the spamchannel's ID, and `msg` if preferred.

Change `slep` if you want the bot to send messages slower, the value is in seconds.

To run, just do:
```bash
lua pingbot.lua
```


If all is well, it should print `200` periodically.

If you are seeing `429`s, better increment `slep` by 0.1 until it's gone.
