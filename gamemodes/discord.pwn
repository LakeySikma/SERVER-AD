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