new Text: Watermark[3];

InitServerTextDraw()
{

    Watermark[0] = TextDrawCreate(218.000, 3.000, "COMOTER ATTACK/DEFEND");
    TextDrawLetterSize(Watermark[0], 0.538, 1.500);
    TextDrawAlignment(Watermark[0], 1);
    TextDrawColor(Watermark[0], -1306385665);
    TextDrawSetShadow(Watermark[0], 1);
    TextDrawSetOutline(Watermark[0], 1);
    TextDrawBackgroundColor(Watermark[0], 150);
    TextDrawFont(Watermark[0], 3);
    TextDrawSetProportional(Watermark[0], 1);

    Watermark[1] = TextDrawCreate(179.000, 3.000, "8===D");
    TextDrawLetterSize(Watermark[1], 0.300, 1.500);
    TextDrawAlignment(Watermark[1], 1);
    TextDrawColor(Watermark[1], -9849601);
    TextDrawSetShadow(Watermark[1], 1);
    TextDrawSetOutline(Watermark[1], 1);
    TextDrawBackgroundColor(Watermark[1], 150);
    TextDrawFont(Watermark[1], 1);
    TextDrawSetProportional(Watermark[1], 1);

    Watermark[2] = TextDrawCreate(485.000, 3.000, "8===D");
    TextDrawLetterSize(Watermark[2], -0.309, 1.500);
    TextDrawAlignment(Watermark[2], 1);
    TextDrawColor(Watermark[2], -9849601);
    TextDrawSetShadow(Watermark[2], 1);
    TextDrawSetOutline(Watermark[2], 1);
    TextDrawBackgroundColor(Watermark[2], 150);
    TextDrawFont(Watermark[2], 1);
    TextDrawSetProportional(Watermark[2], 1);
}

ShowServerWatermark(playerid)
{
    for(new i=0; i < 3; i++)
	{
		TextDrawShowForPlayer(playerid, Watermark[i]);
	}
    return 1;
}

forward BotUpdate();
public BotUpdate()
{
    new str[1280];
    format(str, sizeof(str), "%d/20 Player | Comoter A/D ", Iter_Count(Player));
    DCC_SetBotActivity(str);
}