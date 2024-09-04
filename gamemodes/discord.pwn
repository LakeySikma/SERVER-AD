stock SendDiscordMessage(channel, message[]) {
	new DCC_Channel:ChannelId;
	switch(channel)
	{
		//==[ Log Join ]
		case 0:
		{
			ChannelId = DCC_FindChannelById("1226570557143908402");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Leave ]
		case 1:
		{
			ChannelId = DCC_FindChannelById("1226572252158623775");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Kills ]
		case 2:
		{
			ChannelId = DCC_FindChannelById("1276451071824498708");
			//DCC_SendChannelMessage(ChannelId, message);
			//new DCC_Embed:embed;
			//DCC_SendChannelEmbedMessage(ChannelId, embed, message);
			return 1;
		}
        //==[ Log Man Of The Round ]
		case 3:
		{
			ChannelId = DCC_FindChannelById("1224537033070874654");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
        //==[ Log Won & Lose Round ]
		case 4:
		{
			ChannelId = DCC_FindChannelById("1276451953202692106");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Statistic Player ]
		case 5:
		{
			ChannelId = DCC_FindChannelById("1224537033070874654");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log In Game Talk ]
		case 6:
		{
			ChannelId = DCC_FindChannelById("1224537033070874654");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Admin Chat ]
		case 7:
		{
			ChannelId = DCC_FindChannelById("1224537033070874654");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Attacker Chat ]
		case 8:
		{
			ChannelId = DCC_FindChannelById("1276452442061672521");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Defender Chat ]
		case 9:
		{
			ChannelId = DCC_FindChannelById("1276452560299102268");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Referee Chat ]
		case 10:
		{
			ChannelId = DCC_FindChannelById("1276453460493074473");
			DCC_SendChannelMessage(ChannelId, message);
		}
		//==[ Log Base Started ] 
		case 11:
		{
			ChannelId = DCC_FindChannelById("1226453490797248572");
			DCC_SendChannelMessage(ChannelId, message);
		}

	}
	return 1;
}

SendDiscordEmbedMessage(channel, title[] = "", message[], footer[] = "")
{
	new DCC_Channel:ChannelId, DCC_Embed:embed = DCC_CreateEmbed(title);
	switch(channel)
	{ 
		// kill logs embed
		case 0:
		{
			ChannelId = DCC_FindChannelById("1276451071824498708");
			DCC_SetEmbedTitle(embed, title);
			DCC_SetEmbedDescription(embed, message);
			DCC_SetEmbedFooter(embed, footer);
			//DCC_SendChannelEmbedMessage(DCC_Channel:channel, DCC_Embed:embed, const message[] = "", const callback[] = "", const format[] = "", {Float, _}:...)
			DCC_SendChannelEmbedMessage(ChannelId, embed);

		}
		// round logs
		case 1:
		{
			ChannelId = DCC_FindChannelById("1276451953202692106");
			DCC_SetEmbedTitle(embed, title);
			DCC_SetEmbedDescription(embed, message);
			DCC_SetEmbedFooter(embed, footer);
			DCC_SendChannelEmbedMessage(ChannelId, embed);
		}
	}
	return 1;
}

DCMD:tc(user, channel, params[])
{
	new 
		DCC_Channel:attackerchat = DCC_FindChannelById("1276452442061672521"),
		DCC_Channel:defenderchat = DCC_FindChannelById("1276452560299102268"),
		username[DCC_NICKNAME_SIZE],
		dstring[512]
	;

	/*DCC_GetChannelId(channel, attackerchat);
	DCC_GetChannelId(channel, defenderchat);
	if(channel != attackerchat || channel != defenderchat) 
		return DCC_SendChannelMessage(channel, "```\nThis command can only use in channel #attacker-chat-logs/#defender-chat-logs\n```");*/

	DCC_GetUserName(user, username);

	new ChatString[512], ChatColor;
	format(ChatString,sizeof(ChatString),"%s Team Chat | %s | %s", TeamName[ATTACKER], username, params);
	foreach(new i : Player)
	{
		switch(Player[i][Team])
		{
			case REFEREE: 		ChatColor = 0xFFFF90FF;
			case DEFENDER: 		ChatColor = 0x0088FFFF;
			case ATTACKER: 		ChatColor = 0xFF2040FF;
			case ATTACKER_SUB: 	ChatColor = ATTACKER_SUB_COLOR;
			case DEFENDER_SUB: 	ChatColor = DEFENDER_SUB_COLOR;
			case NON:
			{ SendErrorMessage(i,"You must be part of a team."); return 0; }
		}
		/*if(Player[i][Team] != NON)
		{
	        if((Player[i][Team] == DEFENDER || Player[i][Team] == DEFENDER_SUB) && (Player[i][Team] == DEFENDER || Player[i][Team] == DEFENDER_SUB))
			{ SendClientMessage(i, ChatColor, ChatString); PlayerPlaySound(i,1137,0.0,0.0,0.0); }
			if(Player[i][Team] == REFEREE && Player[i][Team] == REFEREE && !Player[i][InDuel])
		   	{ SendClientMessage(i, ChatColor, ChatString); PlayerPlaySound(i,1137,0.0,0.0,0.0); }
		}*/
	}

	if(channel == attackerchat)
	{
		foreach(new z : Player)
		{
			if(Player[z][Team] != NON)
			{
				if((Player[z][Team] == ATTACKER || Player[z][Team] == ATTACKER_SUB))
				{ 
					SendClientMessage(z, ChatColor, ChatString); 
					PlayerPlaySound(z, 1137,0.0,0.0,0.0); 
				}
			}
		}
		format(dstring, sizeof dstring, "```%s Team Chat | %s | %s```",  TeamName[ATTACKER], username, params);

		SendDiscordMessage(8, dstring);
	}
	return 1;
}