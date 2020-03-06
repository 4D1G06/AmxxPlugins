/* Chat logs */
/* https://www.youtube.com/watch?v=2iG54dRVcQo */
/* Written with <3 on JOE (Joe's own editor) */

#include <amxmodx>

new g_MessageCommands[][] = {
	"say",
	"say_team"
};

new szLog[32];

public plugin_init()
{
	register_plugin("Chat logs", "1.0", "thEsp");

	for (new i = 0; i < sizeof(g_MessageCommands); i++)
		register_clcmd(g_MessageCommands[i], "onChat");

	get_time("Chat [%F].log", szLog, charsmax(szLog));
}

public onChat(id)
{
	new szCommand[16], szMessage[32];

	read_argv(0, szCommand, charsmax(szCommand));
	read_args(szMessage, charsmax(szMessage));
	remove_quotes(szMessage);

	log_to_file(szLog, "(^"%s^") %n: %s", szCommand, id, szMessage);				
}