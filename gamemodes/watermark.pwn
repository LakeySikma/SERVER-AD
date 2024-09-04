forward BotUpdate();
public BotUpdate()
{
    new str[1280];
    format(str, sizeof(str), "Comoter A/D #OnTop | Player Online: %d", Iter_Count(Player));
    DCC_SetBotActivity(str);
}