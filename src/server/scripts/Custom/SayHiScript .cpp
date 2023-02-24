#include "ScriptMgr.h"
#include "Creature.h"

class SayHiScript : public CreatureScript
{
public:
    SayHiScript() : CreatureScript("SayHiScript") {}

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        creature->MonsterWhisper("Hello, adventurer!", player);
        player->CLOSE_GOSSIP_MENU();
        return true;
    }
};

void AddSC_SayHiScript()
{
    new SayHiScript();
}
