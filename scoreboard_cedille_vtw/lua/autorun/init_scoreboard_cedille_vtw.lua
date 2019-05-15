if SERVER then 

	include("scoreboard_cedillefile_vtw/scoreboardcedille_config_vtw/sh_cfscoreboardcedille_vtw.lua")
	include("scoreboard_cedillefile_vtw/scoreboardcedille_server_vtw/sv_scoreboardcedille_vtw.lua")


	AddCSLuaFile("scoreboard_cedillefile_vtw/scoreboardcedille_config_vtw/sh_cfscoreboardcedille_vtw.lua")
	AddCSLuaFile("scoreboard_cedillefile_vtw/scoreboardcedille_server_vtw/sv_scoreboardcedille_vtw.lua")
	AddCSLuaFile("scoreboard_cedillefile_vtw/scoreboardcedille_client_vtw/cl_scoreboardcedille_vtw.lua")

end 




if CLIENT then 

	include("scoreboard_cedillefile_vtw/scoreboardcedille_config_vtw/sh_cfscoreboardcedille_vtw.lua")
	include("scoreboard_cedillefile_vtw/scoreboardcedille_client_vtw/cl_scoreboardcedille_vtw.lua")

end 