#define FILTERSCRIPT
#include <a_samp>

#define IsPlayerAndroid(%0) !GetPVarInt(%0, "NotAndroid")

native SendClientCheck(playerid, type, arg, offset, size);
forward OnClientCheckResponse(playerid, type, arg, response);

public OnPlayerConnect(playerid)
{
    SendClientCheck(playerid, 0x48, 0, 0, 2);
    return 1;
}

public OnClientCheckResponse(playerid, type, arg, response)
{
    if (type == 0x48)
    {
        if (response == 1)
        {
            SetPVarInt(playerid, "NotAndroid", 0);
        }
        else
        {
            SetPVarInt(playerid, "NotAndroid", 1);
        }
    }
    return 1;
}