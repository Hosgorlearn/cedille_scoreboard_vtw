scoreboard_cedille_versiontw = scoreboard_cedille_versiontw or {}


--[[ With this variable, you can choose the title of the Scoreboard ]]-- 
scoreboard_cedille_versiontw.TitleCommunity = "Name of your Server"

--[[ With this variable, you can choose the tab language but you have to restart your server to apply changes ]]--
scoreboard_cedille_versiontw.lang        = "english" -- Languages : french, english

--[[ With this variable you can draw or not the Informations of Policeman, Fireman ]]--
scoreboard_cedille_versiontw.OfficeDraw  = false 

--[[ With this variable you can choose if you want to hear the FAdmin sounds - You have to restart your server to apply changes ]]-- 
scoreboard_cedille_versiontw.FadminSound = true

--[[ With this variable you can choose the sound that is going to be played when you click on a player]]--
scoreboard_cedille_versiontw.SoundOnClickPlayer = "buttons/button9.wav" -- You can choose sound in this link : https://maurits.tv/data/garrysmod/wiki/wiki.garrysmod.com/index8f77.html

--[[ You must put the names of the trades you want to display ]]--

scoreboard_cedille_versiontw.TeamFirst  = TEAM_POLICE

scoreboard_cedille_versiontw.TeamSecond = TEAM_GUN

scoreboard_cedille_versiontw.TeamThird  = TEAM_MOB

--[[ With this config table you can hide a player from the scoreboard with his SteamID ]]-- 
scoreboard_cedille_versiontw.Rankshide = 
{

["n/a"] = true

}


--[[ With this config table, you can restrict the access of the FAdmin button ]]-- 
scoreboard_cedille_versiontw.AuthorizedStaff = 
{

    ["superadmin"] = true,
    ["admin"]      = true

}


--[[ With this config table, you can include a rank in the online staff counter ]]--
scoreboard_cedille_versiontw.OnlineStaff = 
{

    ["admin"]      = true,
    ["superadmin"] = true

}


--[[ With this config table, you can add some buttons and configure them ]]-- 
scoreboard_cedille_versiontw.TableBtn = 
{
[1] = {Name = "Forum", site = "https://www.google.fr/"},
[2] = {Name = "Shop ", site = "https://www.youtube.com/watch?v=TVkaJtXReEU&list=RDBtyHYIpykN0&index=9"},
[3] = {Name = "Steam community", site = "https://wiki.garrysmod.com/page/gui/OpenURL"},
[4] = {Name = "Discord", site = "https://www.youtube.com/watch?v=TVkaJtXReEU&list=RDBtyHYIpykN0&index=9"},
[5] = {Name = "Bouton5", site = "https://www.google.fr/search?source=hp&ei=Y6ezOSKG"},
[6] = {Name = "Lemot", site = "https://www.google.fr/search?source=hp&ei=Y6ezOSKG"},
[7] = {Name = "Nouveau", site = "https://www.google.fr/search?source=hp&ei=Y6ezOSKG"},
[8] = {Name = "Sitesss", site = "https://www.google.fr/search?source=hp&ei=Y6ezOSKG"}
}


--[[ Panel configuration]]-- 

----------------------------------[Color of the Main Panel]----------------------------------
scoreboard_cedille_versiontw.MainPanel_Background    = Color(157, 152, 152, 100)

scoreboard_cedille_versiontw.MainPanel_TextnumPlayer = Color( 255, 255, 255, 255 )

----------------------------------[Color of the FAdmin Buttons]-------------------------------
scoreboard_cedille_versiontw.FadminButn_TextColor     = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.FadminButn_Color         = Color(0, 0, 0, 255)

scoreboard_cedille_versiontw.FadminButn_ColorOutlined = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.FadminButn_OnMouse       = Color(255, 0, 0, 255)

----------------------------------[Color of the buttons]-------------------------------
scoreboard_cedille_versiontw.Button_Background    = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.Button_TextColor     = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.Button_Color         = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.Button_ColorOutlined = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.Button_OnMouse       = Color(255, 0, 0, 255)

----------------------------------[Color of the servername panel]-----------------------------
scoreboard_cedille_versiontw.Server1_Background = Color(0, 0, 0, 255)

scoreboard_cedille_versiontw.Server1_ColorTitle = Color(255, 255, 255, 255)

----------------------------------[Color of the server layout]---------------------------------
scoreboard_cedille_versiontw.LayoutServ_Color         = Color(0, 0, 0, 255)

scoreboard_cedille_versiontw.LayoutServ_ColorOutlined = Color(255, 255, 255, 255)

----------------------------------[Color of the right panel]----------------------------------
scoreboard_cedille_versiontw.PanelServ_Background    = Color(76, 76, 76, 255)

scoreboard_cedille_versiontw.PanelServ_ColorOutlined = Color(255, 255, 255, 150) 

----------------------------------[Color of the first panel]--------------------------------------
scoreboard_cedille_versiontw.PanelServ1_ColorText        = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PanelServ1_ColorImage       = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PanelServ1_ServiceColor     = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.PanelServ1_ServiceColorText = Color(255, 255, 255, 255)

----------------------------------[Color of the second panel]-------------------------------------
scoreboard_cedille_versiontw.PanelServ2_Background       = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.PanelServ2_NameTextColor    = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PanelServ2_BackgroundName   = Color(0, 0, 0, 255)

scoreboard_cedille_versiontw.PanelServ2_ProfileBtnColor  = Color(0, 0, 0, 150)

scoreboard_cedille_versiontw.PanelServ2_ProfileTextColor = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PanelServ2_ColorImage       = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PanelServ2_SteamTextColor   = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PanelServ2_ScrollBarColor   = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.PanelServ2_FadminBtnColor   = Color(200, 200, 200, 255)

----------------------------------[Color of the third panel]--------------------------------------
scoreboard_cedille_versiontw.PanelServ3_ColorText = Color(255, 255, 255, 255)

----------------------------------[Color of the player panel]-------------------------
scoreboard_cedille_versiontw.PlayerPanel_background        = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.PlayerPanel_ScrollBar         = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.PlayerPanel_MenuColor         = Color(0, 0, 0, 180)

scoreboard_cedille_versiontw.PlayerPanel_MenuColoOutlined  = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PlayerPanel_NameTextColor     = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PlayerPanel_InfoColor         = Color(0, 0, 0, 255)

scoreboard_cedille_versiontw.PlayerPanel_InfoColorOutlined = Color(255, 255, 255, 255)

scoreboard_cedille_versiontw.PlayerPanel_InfoTextColor     = Color(255, 255, 255, 255)

-------------------------------------------------------------------------------------------


                            --[[ END OF THE CONFIG FILE - DON'T TOUCH BELOW ]]-- 
local result = nil 

if not result then 
    include("scoreboard_cedillefile_vtw/languages/".. scoreboard_cedille_versiontw.lang ..".lua")
    if SERVER then
        AddCSLuaFile("scoreboard_cedillefile_vtw/languages/".. scoreboard_cedille_versiontw.lang ..".lua")
    end
else
    include("scoreboard_cedillefile_vtw/languages/english.lua")
    if SERVER then
        AddCSLuaFile("scoreboard_cedillefile_vtw/languages/english.lua")
    end
end 
