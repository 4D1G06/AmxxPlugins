#include <amxmodx>
#include <fakemeta>

#define ROCKET_TRAIL TE_BEAMFOLLOW
#define RANDOM_COLOR random(255)

public plugin_init()
{
    register_plugin("Colored Rocket Trail", "1.0", "thEsp");
    register_message(SVC_TEMPENTITY, "msgTempEntity");
}

public msgTempEntity()
{
    if (get_msg_arg_int(1) != ROCKET_TRAIL)
        return;
    
    new iEntity = get_msg_arg_int(2), szClassname[32];
    pev(iEntity, pev_classname, szClassname, charsmax(szClassname));

    if (!equal(szClassname, "rpg_rocket"))
        return;

    set_msg_arg_int(6, 0, RANDOM_COLOR);
    set_msg_arg_int(7, 0, RANDOM_COLOR);
    set_msg_arg_int(8, 0, RANDOM_COLOR);
}
