#pragma semicolon 1 // Force strict semicolon mode.

#include <sourcemod>
#define REQUIRE_EXTENSIONS
#include <connect>

public bool:OnClientPreConnectEx(const String:name[], String:password[255], const String:ip[], const String:steamID[], String:rejectReason[255])
{
	char steamID3[64];
	Connect_GetAuthId(AuthId_Steam3, steamID3, sizeof(steamID3));
	PrintToServer("----------------\nName: %s\nPassword: %s\nIP: %s\nSteamID2: %s\nSteamID3: %s\n----------------", name, password, ip, steamID, steamID3);

	new AdminId:admin = FindAdminByIdentity(AUTHMETHOD_STEAM, steamID);

	if (admin == INVALID_ADMIN_ID)
	{
		return true;
	}

	if (GetAdminFlag(admin, Admin_Root))
	{
		GetConVarString(FindConVar("sv_password"), password, 255);
	}

	return true;
}