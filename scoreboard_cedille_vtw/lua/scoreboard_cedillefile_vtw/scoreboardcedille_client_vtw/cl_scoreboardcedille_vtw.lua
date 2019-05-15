surface.CreateFont( "scoreboard_cedille2_Title", { font = "Francois One", extended = false, size = 45, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false,shadow = false,additive = false,outline = false, })
surface.CreateFont( "scoreboard_cedille2_Scorefont1", { font = "Francois One", extended = false, size = 37, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false,shadow = false,additive = false,outline = false, })
surface.CreateFont( "scoreboard_cedille2_Scorefont2", { font = "Francois One", extended = false, size = 30, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false,shadow = false,additive = false,outline = false, })
surface.CreateFont( "scoreboard_cedille2_ClosButton", { font = "Arial", extended = false, size = 10, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false,shadow = false,additive = false,outline = false, })
surface.CreateFont( "scoreboard_cedille2_Number", { font = "Francois One", extended = false, size = 40, weight = 500, blursize = 0, scanlines = 0, antialias = true, underline = false, italic = false, strikeout = false, symbol = false, rotary = false,shadow = false,additive = false,outline = false, })

local PanelInfo = {}


local cedi_scoreboard_Layoutinfo = 
{
[1] = {Name = scorebaord_cedille_language["NameLayout_info1"]},
[2] = {Name = scorebaord_cedille_language["NameLayout_info2"]},
[3] = {Name = scorebaord_cedille_language["NameLayout_info3"]}
}


local function ParamDhorizontal(self)
    local w, h = self:GetSize()
    local x = 0
    self.pnlCanvas:SetTall(h)

    for _, v in pairs(self.Panels) do

        if (!IsValid( v )) then continue end
        if (!v:IsVisible()) then continue end

        v:SetPos(x, 0)
        v:SetTall(h)
        v:ApplySchemeSettings()
        x = x + v:GetWide() - self.m_iOverlap
    end

    self.pnlCanvas:SetWide(x + self.m_iOverlap)

    if (w < self.pnlCanvas:GetWide()) then
        self.OffsetX = math.Clamp(self.OffsetX, 0, self.pnlCanvas:GetWide() - self:GetWide())
    else
        self.OffsetX = 0
    end
    self.pnlCanvas.x = self.OffsetX * -1
end 


local function Actionsonplayer_Fadmin(vi, MainPanel_Backgroundserver, PanelInfo)
    if not FAdmin then return end 
    
    local Actionsonplayer_Fadmin = vgui.Create("DPanel", MainPanel_Backgroundserver)
    Actionsonplayer_Fadmin:SetSize(PanelInfo[2]:GetWide(), PanelInfo[2]:GetTall())
    Actionsonplayer_Fadmin:SetPos(0, 315)
    Actionsonplayer_Fadmin.Paint = function(self, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_Background)
        surface.DrawRect(0, 0, w, h)
    end

    Actionsonplayer_Fadmin.DLabel = vgui.Create("DLabel", Actionsonplayer_Fadmin)
    Actionsonplayer_Fadmin.DLabel:SetPos(75, 2)
    Actionsonplayer_Fadmin.DLabel:SetText(vi:getDarkRPVar("rpname") or vi:Nick())
    Actionsonplayer_Fadmin.DLabel:SetFont("scoreboard_cedille2_Scorefont1")
    Actionsonplayer_Fadmin.DLabel:SetTextColor(scoreboard_cedille_versiontw.PanelServ2_NameTextColor)
    Actionsonplayer_Fadmin.DLabel:SizeToContents()
    Actionsonplayer_Fadmin.DLabel.Paint = function(self, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_BackgroundName)
        surface.DrawRect(0, 0, w, h)
    end 

    if scoreboard_cedille_versiontw.AuthorizedStaff[LocalPlayer():GetUserGroup()] then 
        Actionsonplayer_Fadmin.icon = vgui.Create("DModelPanel", Actionsonplayer_Fadmin)
        Actionsonplayer_Fadmin.icon:SetSize(150, 150)
        Actionsonplayer_Fadmin.icon:SetPos(20, 25)
        Actionsonplayer_Fadmin.icon:SetModel(vi:GetModel())
        Actionsonplayer_Fadmin.icon.LayoutEntity = function() return end
    end 

    Actionsonplayer_Fadmin_ProfilButn = vgui.Create("DButton", Actionsonplayer_Fadmin)                    
    Actionsonplayer_Fadmin_ProfilButn:SetSize(50, 30)
    Actionsonplayer_Fadmin_ProfilButn:SetPos(3, 142)                     
    Actionsonplayer_Fadmin_ProfilButn:SetText(scorebaord_cedille_language["Name_SteamBtn"])
    Actionsonplayer_Fadmin_ProfilButn:SetTextColor(scoreboard_cedille_versiontw.PanelServ2_ProfileTextColor)
    Actionsonplayer_Fadmin_ProfilButn.DoClick = function() 
        if not IsValid(vi) then return end                
        vi:ShowProfile()
    end
    Actionsonplayer_Fadmin_ProfilButn.Paint = function(self, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_ProfileBtnColor)
        surface.DrawRect(0, 0, w, h)
    end 

    Actionsonplayer_Fadmin.DermaImageButton = vgui.Create("DImageButton", Actionsonplayer_Fadmin)
    Actionsonplayer_Fadmin.DermaImageButton:SetSize(35, 35)
    Actionsonplayer_Fadmin.DermaImageButton:SetPos(30, 10)                            
    Actionsonplayer_Fadmin.DermaImageButton:SetImage("scoreboard_cedille_v1.2/checklist.png")
    Actionsonplayer_Fadmin.DermaImageButton:SetColor(scoreboard_cedille_versiontw.PanelServ2_ColorImage)
    Actionsonplayer_Fadmin.DermaImageButton.DoClick = function(self)
        if not IsValid(vi) then return end
        SetClipboardText(vi:SteamID())
        chat.AddText(scoreboard_cedille_versiontw.PanelServ2_SteamTextColor, scorebaord_cedille_language["sentence_OfSteamID"])
    end

    Actionsonplayer_Fadmin.Dscrollpanel_Player = vgui.Create("DScrollPanel", Actionsonplayer_Fadmin)
    Actionsonplayer_Fadmin.Dscrollpanel_Player:SetSize(450, Actionsonplayer_Fadmin:GetTall())
    Actionsonplayer_Fadmin.Dscrollpanel_Player:SetPos(50, 3)

    Actionsonplayer_Fadmin.sbar = Actionsonplayer_Fadmin.Dscrollpanel_Player:GetVBar()

    Actionsonplayer_Fadmin.sbar.Paint = function(self, w, h)  
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_ScrollBarColor)
        surface.DrawRect(0, 0, w, h)
    end
    Actionsonplayer_Fadmin.sbar.btnUp.Paint = function(self, w, h) 
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_ScrollBarColor)
        surface.DrawRect(0, 0, w, h)
    end
    Actionsonplayer_Fadmin.sbar.btnDown.Paint = function(self, w, h) 
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_ScrollBarColor)
        surface.DrawRect(0, 0, w, h)
    end
    Actionsonplayer_Fadmin.sbar.btnGrip.Paint = function(self, w, h) 
        surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ2_ScrollBarColor)
        surface.DrawRect(0, 0, w, h)
    end

    Actionsonplayer_Fadmin.Listo_Fadmin = vgui.Create("DListLayout", Actionsonplayer_Fadmin.Dscrollpanel_Player)
    Actionsonplayer_Fadmin.Listo_Fadmin:SetSize(265, 100)
    Actionsonplayer_Fadmin.Listo_Fadmin:SetPos(220, 0)

    local ply = vi or FAdmin.ScoreBoard.Player.Player
    FAdmin.ScoreBoard.Player.Player = vi

    if not IsValid(ply) or not IsValid(FAdmin.ScoreBoard.Player.Player) then FAdmin.ScoreBoard.ChangeView("Main") return end
                
    for _, v in ipairs(FAdmin.ScoreBoard.Player.ActionButtons) do
        if v.Visible == true or (type(v.Visible) == "function" and v.Visible(FAdmin.ScoreBoard.Player.Player) == true) then

            local Actionbutton_Onplayer = vgui.Create("FAdminActionButton", Actionsonplayer_Fadmin.Listo_Fadmin)
            if type(v.Image) == "string" then
                Actionbutton_Onplayer:SetImage(v.Image or "icon16/exclamation")
            elseif type(v.Image) == "table" then
                Actionbutton_Onplayer:SetImage(v.Image[1])
                if v.Image[2] then Actionbutton_Onplayer:SetImage2(v.Image[2]) end
            elseif type(v.Image) == "function" then
                local img1, img2 = v.Image(ply)
                Actionbutton_Onplayer:SetImage(img1)
                if img2 then Actionbutton_Onplayer:SetImage2(img2) end
            else
                Actionbutton_Onplayer:SetImage("icon16/exclamation")
            end

            local name = v.Name
            if type(name) == "function" then name = name(FAdmin.ScoreBoard.Player.Player) end
            Actionbutton_Onplayer:SetText(DarkRP.deLocalise(name))
            Actionbutton_Onplayer:SetBorderColor(scoreboard_cedille_versiontw.PanelServ2_FadminBtnColor)
            Actionbutton_Onplayer.DoClick = function(self)
                if not IsValid(vi) then return end
                return v.Action(vi, self)
            end
            if v.OnButtonCreated then
                v.OnButtonCreated(FAdmin.ScoreBoard.Player.Player, Actionbutton_Onplayer)
            end
        end
    end
    return Actionsonplayer_Fadmin
end


local function OpenFadminMenu_cedille()
    if not FAdmin then return end 
    if not scoreboard_cedille_versiontw.AuthorizedStaff[LocalPlayer():GetUserGroup()] then return end 

    local _, YPos, Width = 20, FAdmin.ScoreBoard.Y + 120 + FAdmin.ScoreBoard.Height / 5 + 20, (FAdmin.ScoreBoard.Width - 40) / 3
    local icon = "icon16/cross.png"

    local MainFrame = vgui.Create("DFrame")
    MainFrame:SetSize(600, 500)
    MainFrame:Center()
    MainFrame:SetTitle("")
    MainFrame:MakePopup()
    MainFrame:SetDraggable(false)
    MainFrame:ShowCloseButton(false)
    MainFrame.Paint = function(self, w, h)
        Derma_DrawBackgroundBlur(self)
    end

    MainFrame_ClosButton = vgui.Create("DButton", MainFrame)
    MainFrame_ClosButton:SetSize(50, 15)
    MainFrame_ClosButton:SetPos(550, 5)
    MainFrame_ClosButton:SetText("X")
    MainFrame_ClosButton:SetFont("scoreboard_cedille2_ClosButton")
    MainFrame_ClosButton:SetColor(Color(255, 255, 255, 255))
    MainFrame_ClosButton.DoClick = function(self, w, h)
        if IsValid(MainFrame) then 
            MainFrame:Close()
        end 
    end 
    MainFrame_ClosButton.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 0, w, h, Color(255, 0, 0, 255))
    end 

    MainFrame_TitleFrame = vgui.Create("DLabel", MainFrame)
    MainFrame_TitleFrame:SetPos(180, -5)
    MainFrame_TitleFrame:SetText(scorebaord_cedille_language["sentence_OfFadminServ"])
    MainFrame_TitleFrame:SetFont("scoreboard_cedille2_Scorefont2")
    MainFrame_TitleFrame:SizeToContents()
    MainFrame_TitleFrame:SetTextColor(Color(255, 255, 255, 255))

    MainFrame_DScrollPanel_P = vgui.Create("DScrollPanel", MainFrame)
    MainFrame_DScrollPanel_P:SetSize(MainFrame:GetWide(), MainFrame:GetTall() - 25)
    MainFrame_DScrollPanel_P:SetPos(0, 25)

    local sbar = MainFrame_DScrollPanel_P:GetVBar()

    sbar.Paint = function(self, w, h)  
        surface.SetDrawColor(216, 215, 215, 50)
        surface.DrawRect(0, 0, w, h)
    end
    sbar.btnUp.Paint = function(self, w, h) 
        surface.SetDrawColor(45, 41, 41, 255)
        surface.DrawRect(0, 0, w, h)
    end
    sbar.btnDown.Paint = function(self, w, h) 
        surface.SetDrawColor(45, 41, 41, 255)
        surface.DrawRect(0, 0, w, h)
    end
    sbar.btnGrip.Paint = function(self, w, h) 
        surface.SetDrawColor(45, 41, 41, 255)
        surface.DrawRect(0, 0, w, h)
    end

    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat = vgui.Create("FAdminPlayerCatagory", MainFrame_DScrollPanel_P)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetLabel(scorebaord_cedille_language["sentence_FadminServer1"])
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat.CatagoryColor = Color(155, 0, 0, 255)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetSize(MainFrame_DScrollPanel_P:GetWide(), 100)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetPos(0, 0)
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetVisible(true)

    FAdmin.ScoreBoard.Server.Controls.ServerActions = vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.ServerActionsCat:SetContents(FAdmin.ScoreBoard.Server.Controls.ServerActions)
    FAdmin.ScoreBoard.Server.Controls.ServerActions:SetTall(FAdmin.ScoreBoard.Height - 20 - YPos)
    for k, v in pairs(FAdmin.ScoreBoard.Server.Controls.ServerActions:GetChildren()) do
        if k == 1 then continue end
        v:Remove()
    end

    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat = vgui.Create("FAdminPlayerCatagory", MainFrame_DScrollPanel_P)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetLabel(scorebaord_cedille_language["sentence_FadminServer2"])
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat.CatagoryColor = Color(0, 155, 0, 255)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetSize(MainFrame_DScrollPanel_P:GetWide(), 100)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetPos(0, 275)
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetVisible(true)

    FAdmin.ScoreBoard.Server.Controls.PlayerActions = vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.PlayerActionsCat:SetContents(FAdmin.ScoreBoard.Server.Controls.PlayerActions)
    FAdmin.ScoreBoard.Server.Controls.PlayerActions:SetTall(FAdmin.ScoreBoard.Height - 20 - YPos)
    for k, v in pairs(FAdmin.ScoreBoard.Server.Controls.PlayerActions:GetChildren()) do
        if k == 1 then continue end
        v:Remove()
    end

    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat = vgui.Create("FAdminPlayerCatagory", MainFrame_DScrollPanel_P)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetLabel(scorebaord_cedille_language["sentence_FadminServer3"])
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat.CatagoryColor = Color(0, 0, 155, 255)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetSize(MainFrame_DScrollPanel_P:GetWide(), 100)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetPos(0, 505)
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetVisible(true)

    FAdmin.ScoreBoard.Server.Controls.ServerSettings = vgui.Create("FAdminPanelList")
    FAdmin.ScoreBoard.Server.Controls.ServerSettingsCat:SetContents(FAdmin.ScoreBoard.Server.Controls.ServerSettings)
    FAdmin.ScoreBoard.Server.Controls.ServerSettings:SetTall(0)
    for k, v in pairs(FAdmin.ScoreBoard.Server.Controls.ServerSettings:GetChildren()) do
        if k == 1 then continue end
        v:Remove()
    end

    for k, v in pairs(FAdmin.ScoreBoard.Server.ActionButtons) do

        local FadminActions = vgui.Create("FAdminActionButton")

        if type(v.Image) == "string" then
            FadminActions:SetImage(v.Image or icon)
        elseif type(v.Image) == "table" then 
            FadminActions:SetImage(v.Image[1])
            if v.Image[2] then FadminActions:SetImage2(v.Image[2]) end 
        elseif type(v.Image) == "function" then 
            local active, disable = v.Image()
            FadminActions:SetImage(active)
            if disable then FadminActions:SetImage2(disable) end 
        else 
            FadminActions:SetImage(icon)
        end

        local Names = v.Name
        if type(Names) == "function" then Names = Names() end 

        FadminActions:SetText(Names)
        FadminActions:SetBorderColor(v.color)
        FadminActions:Dock(TOP)

        FadminActions.DoClick = function(self)
           return v.Action(self)
        end
        FAdmin.ScoreBoard.Server.Controls[v.TYPE]:Add(FadminActions)
    end 
end


local function scoreboardshow()
    
    local Cedi_ply            = LocalPlayer()
    local Cedi_Playeronline   = player.GetCount()
    local Cedi_Maxgameplayers = game.MaxPlayers()
    local Cedi_Numberstaff    = 0
    local Cedi_TotalMoney     = 0 

    MainPanel = vgui.Create("DPanel")
    MainPanel:SetSize(1000, 850)
    MainPanel:Center()
    MainPanel:MakePopup()
    MainPanel:SlideDown(.6)
    MainPanel.Paint = function(self, w , h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.MainPanel_Background)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(Cedi_Playeronline .."/".. Cedi_Maxgameplayers.. scorebaord_cedille_language["sentence_OnlinePlayer"], "scoreboard_cedille2_Title", 435, 805, scoreboard_cedille_versiontw.MainPanel_TextnumPlayer, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    end  

    if scoreboard_cedille_versiontw.AuthorizedStaff[Cedi_ply:GetUserGroup()] then 

        local MainPanel_Fadminbutton = vgui.Create("DButton", MainPanel)
        MainPanel_Fadminbutton:SetSize(110, 30)
        MainPanel_Fadminbutton:SetPos(880, 815)
        MainPanel_Fadminbutton:SetColor(scoreboard_cedille_versiontw.FadminButn_TextColor)
        MainPanel_Fadminbutton:SetFont("scoreboard_cedille2_Scorefont2")
        MainPanel_Fadminbutton:SetText(scorebaord_cedille_language["Name_FadmnButn"])
        MainPanel_Fadminbutton.OnCursorEntered = function(self) self.mouse = true end 
        MainPanel_Fadminbutton.OnCursorExited = function(self) self.mouse = false end
        MainPanel_Fadminbutton.DoClick = function()
            OpenFadminMenu_cedille()
            MainPanel:Remove()
        end
        MainPanel_Fadminbutton.Paint = function(self, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.FadminButn_Color)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.FadminButn_ColorOutlined)
            surface.DrawOutlinedRect( 0, 0, w, h)
            if self.mouse then 
                surface.SetDrawColor(scoreboard_cedille_versiontw.FadminButn_OnMouse)
                surface.DrawRect(2, 2, 106, 26)   
            end    
        end 
    end 
    
    local MainPanel_Backgroundbutn = vgui.Create("DPanel", MainPanel)
    MainPanel_Backgroundbutn:SetSize(MainPanel:GetWide(), 80) 
    MainPanel_Backgroundbutn:SetPos(0, 40) 
    MainPanel_Backgroundbutn.Paint = function(self, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.Button_Background)
        surface.DrawRect(0, 0, w, h)
    end
    
    local MainPanel_Scrollerbutn = vgui.Create("DHorizontalScroller", MainPanel_Backgroundbutn)
    MainPanel_Scrollerbutn:SetSize(MainPanel_Backgroundbutn:GetWide() - 40, 60)
    MainPanel_Scrollerbutn:SetPos(30, 10)
    MainPanel_Scrollerbutn:SetOverlap(-45)
    MainPanel_Scrollerbutn.btnLeft:Remove()
    MainPanel_Scrollerbutn.btnRight:Remove()
    MainPanel_Scrollerbutn.Think = function() end 
    MainPanel_Scrollerbutn.PerformLayout = ParamDhorizontal

    for _, v1 in ipairs(scoreboard_cedille_versiontw.TableBtn) do 

        local MainPanel_InfoButn = vgui.Create("DButton", MainPanel_Scrollerbutn)
        MainPanel_InfoButn:SetText(v1.Name)
        MainPanel_InfoButn:SetSize(150, 0)
        MainPanel_InfoButn:SetTextColor(scoreboard_cedille_versiontw.Button_TextColor)
        MainPanel_InfoButn:SetFont("scoreboard_cedille2_Scorefont2")
        MainPanel_InfoButn:SetContentAlignment(5)
        MainPanel_InfoButn.OnCursorEntered = function(self) self.mouse = true end 
        MainPanel_InfoButn.OnCursorExited = function(self) self.mouse = false end
        MainPanel_InfoButn.DoClick = function()
            gui.OpenURL(v1.site)
            if IsValid(MainPanel) then 
                MainPanel:Remove()
            end 
        end 
        MainPanel_InfoButn.Paint = function(self,w , h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.Button_Color)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.Button_ColorOutlined)
            surface.DrawOutlinedRect( 0, 0, w, h )
            if self.mouse then 
                surface.SetDrawColor(scoreboard_cedille_versiontw.Button_OnMouse)
                surface.DrawRect(2, 2, 146, 56) 
            end 
        end 
        MainPanel_Scrollerbutn:AddPanel(MainPanel_InfoButn)
    end
     
    local MainPanel_Backgroundserver = vgui.Create("DPanel", MainPanel)
    MainPanel_Backgroundserver:SetSize(500, 680) 
    MainPanel_Backgroundserver:SetPos(505, 130)
    MainPanel_Backgroundserver.Paint = function()
    end 

    local MainPanel_Backgroundservtitle = vgui.Create("DPanel", MainPanel_Backgroundserver)
    MainPanel_Backgroundservtitle:SetSize(MainPanel_Backgroundserver:GetWide(), 100)
    MainPanel_Backgroundservtitle:SetPos(0, 0)
    MainPanel_Backgroundservtitle:SetBackgroundColor(scoreboard_cedille_versiontw.Server1_Background)

    local MainPanel_Servernick = vgui.Create("DLabel", MainPanel_Backgroundservtitle)
    MainPanel_Servernick:SetWide(MainPanel_Backgroundservtitle:GetWide())
    MainPanel_Servernick:SetTall(MainPanel_Backgroundservtitle:GetTall())
    MainPanel_Servernick:SetPos(5, -5)
    MainPanel_Servernick:SetText(scoreboard_cedille_versiontw.TitleCommunity)
    MainPanel_Servernick:SetFont("scoreboard_cedille2_Title")
    MainPanel_Servernick:SetTextColor(scoreboard_cedille_versiontw.Server1_ColorTitle)
    MainPanel_Servernick:SetContentAlignment(5)

    local Mainpanel_Servlayout = vgui.Create("DListLayout", MainPanel_Backgroundserver)
    Mainpanel_Servlayout:SetSize(MainPanel_Backgroundserver:GetWide(), 100)
    Mainpanel_Servlayout:SetPos(0, 100)
    Mainpanel_Servlayout:SetPaintBackground(true)
    Mainpanel_Servlayout:SetFontInternal("scoreboard_cedille2_Scorefont1")
    Mainpanel_Servlayout.Paint = function(self, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.LayoutServ_Color)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.LayoutServ_ColorOutlined)
        surface.DrawOutlinedRect( 0, 0.5, w, h)
    end 

    for _,v2 in pairs (player.GetAll()) do
        local Cedi_value = v2:getDarkRPVar("money")
        Cedi_TotalMoney = Cedi_TotalMoney + Cedi_value
    end

    local cedi_scoreboard_Serverinfo = 
    {
    [1] = { posx = 40, posy = 15, posxT = 25, posyT = 20,picture = "scoreboard_cedille_v1.2/bank.png" , info = Cedi_TotalMoney},
    [2] = { posx = 200, posy = 15, posxT = 50, posyT = 20, picture = "scoreboard_cedille_v1.2/funds.png" ,info = LocalPlayer():getDarkRPVar("money") }
    } 

    local cedi_scoreboard_Service = 
    {
        [1] = {Name = scorebaord_cedille_language["NameOffice_service1"], posx = -25, posy = -15, NumberJob = team.NumPlayers(scoreboard_cedille_versiontw.TeamFirst), posxT = 50 , posyT = 20, Font = "scoreboard_cedille2_Number"},
        [2] = {Name = scorebaord_cedille_language["NameOffice_service2"], posx = -25, posy = 40, NumberJob = team.NumPlayers(scoreboard_cedille_versiontw.TeamSecond), posxT = 50, posyT = 70,  Font = "scoreboard_cedille2_Number" },
        [3] = {Name = scorebaord_cedille_language["NameOffice_service3"], posx = -25, posy = 90, NumberJob = team.NumPlayers(scoreboard_cedille_versiontw.TeamThird), posxT = 50 , posyT = 125,  Font = "scoreboard_cedille2_Number"}
    }

    for k3, v3 in pairs(cedi_scoreboard_Layoutinfo) do

        Mainpanel_Servlayout:Add(Label(v3.Name))
     
        PanelInfo[k3] = vgui.Create("DPanel", Mainpanel_Servlayout)
        PanelInfo[k3]:SetSize(MainPanel_Backgroundserver:GetWide() -25, 175)
        PanelInfo[k3]:SetPos(0, 90)
        PanelInfo[k3].Paint = function(self, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ_Background)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.PanelServ_ColorOutlined)
            surface.DrawOutlinedRect(0, 0.5, w, h)
        end 

        if k3 == 1 then 

            for _, v4 in pairs(cedi_scoreboard_Serverinfo) do

                local Server1_Background = vgui.Create("DPanel",PanelInfo[k3])
                Server1_Background:SetSize(120, 150)
                Server1_Background:SetPos(v4.posx, v4.posy)
                Server1_Background.Paint = function(self, w, h) 
                end 

                local Server1_Info = vgui.Create("DLabel", Server1_Background)
                Server1_Info:SetText(v4.info)
                Server1_Info:SetFont("scoreboard_cedille2_Number")
                Server1_Info:SetTextColor(scoreboard_cedille_versiontw.PanelServ1_ColorText)
                Server1_Info:SizeToContents()
                Server1_Info:SetPos(25, 105)

                local Server1_Image = vgui.Create("DImage", Server1_Background)
                Server1_Image:SetSize(60, 60)
                Server1_Image:SetPos(30, 5)
                Server1_Image:SetImage(v4.picture)
                Server1_Image:SetImageColor(scoreboard_cedille_versiontw.PanelServ1_ColorImage)
            end

            if scoreboard_cedille_versiontw.OfficeDraw then 

                local Server1_Backgroundservice = vgui.Create("DPanel",PanelInfo[k3])
                    Server1_Backgroundservice:SetSize(120, 165)
                    Server1_Backgroundservice:SetPos(330, 5)
                    Server1_Backgroundservice.Paint = function(self, w, h)
                        draw.RoundedBox(10 , 0, 0, w, h, scoreboard_cedille_versiontw.PanelServ1_ServiceColor)
                    end 

                for _, v5 in pairs(cedi_scoreboard_Service) do

                    local Server1_ServiceName = vgui.Create("DLabel", Server1_Backgroundservice)
                    Server1_ServiceName:SetWide(165)
                    Server1_ServiceName:SetTall(50)
                    Server1_ServiceName:SetPos(v5.posx, v5.posy)
                    Server1_ServiceName:SetText(v5.Name)
                    Server1_ServiceName:SetTextColor(scoreboard_cedille_versiontw.PanelServ1_ServiceColorText)
                    Server1_ServiceName:SetFont("scoreboard_cedille2_Scorefont2")
                    Server1_ServiceName:SetContentAlignment(5)

                    local Server1_Servicenumber= vgui.Create("DLabel", Server1_Backgroundservice)
                    Server1_Servicenumber:SetPos(v5.posxT, v5.posyT)
                    Server1_Servicenumber:SetText(v5.NumberJob)
                    Server1_Servicenumber:SetTextColor(scoreboard_cedille_versiontw.PanelServ1_ServiceColorText)
                    Server1_Servicenumber:SetFont("scoreboard_cedille2_Scorefont1")
                    Server1_Servicenumber:SizeToContents()
                end 
            end 
        end 

        if k3 == 3 then 

            local Server3_Dhorizscrolpanelstaff = vgui.Create("DHorizontalScroller", PanelInfo[k3])
            Server3_Dhorizscrolpanelstaff:SetSize(PanelInfo[k3]:GetWide(), 90)
            Server3_Dhorizscrolpanelstaff:SetPos(5, 45)
            Server3_Dhorizscrolpanelstaff:SetUseLiveDrag( false)
            Server3_Dhorizscrolpanelstaff:SetOverlap( -4 )
            Server3_Dhorizscrolpanelstaff.btnLeft:Remove()
            Server3_Dhorizscrolpanelstaff.btnRight:Remove()
            Server3_Dhorizscrolpanelstaff.Think = function() end 
            Server3_Dhorizscrolpanelstaff.PerformLayout = ParamDhorizontal
 
            for _, v6 in pairs(player.GetAll()) do

                if scoreboard_cedille_versiontw.OnlineStaff[v6:GetUserGroup()] then 
                    Cedi_Numberstaff = Cedi_Numberstaff + 1 

                    Server3_Dhorizscrolpanelstaff_Server3_BackAvatar = vgui.Create("DPanel")
                    Server3_Dhorizscrolpanelstaff_Server3_BackAvatar:SetSize(90, 90)
                    Server3_Dhorizscrolpanelstaff_Server3_BackAvatar:SetPos(5, 0)
                    Server3_Dhorizscrolpanelstaff_Server3_BackAvatar.Paint = function(self, w, h)
                    end 

                    local Server3_AvatarSteam = vgui.Create("AvatarImage", Server3_Dhorizscrolpanelstaff_Server3_BackAvatar)
                    Server3_AvatarSteam:SetSize(Server3_Dhorizscrolpanelstaff_Server3_BackAvatar:GetWide(), Server3_Dhorizscrolpanelstaff_Server3_BackAvatar:GetTall())
                    Server3_AvatarSteam:SetPos(0, 0)
                    Server3_AvatarSteam:SetPlayer(v6 , 64)
                    Server3_Dhorizscrolpanelstaff:AddPanel(Server3_Dhorizscrolpanelstaff_Server3_BackAvatar)
                end 
                if scoreboard_cedille_versiontw.Rankshide[v6:SteamID()] then 
                    Server3_Dhorizscrolpanelstaff_Server3_BackAvatar:Remove()
                    Cedi_Numberstaff = Cedi_Numberstaff - 1
                    if Cedi_Numberstaff < 0 then 
                        Cedi_Numberstaff = 0
                    end 
                end 
            end 

            local Server3_Text = vgui.Create("DLabel", PanelInfo[k3])
            Server3_Text:SetPos( 70, 0 )
            Server3_Text:SetText(scorebaord_cedille_language["sentence_StaffOnline1"].. Cedi_Numberstaff .. scorebaord_cedille_language["sentence_StaffOnline2"])
            Server3_Text:SetTextColor(scoreboard_cedille_versiontw.PanelServ3_ColorText)
            Server3_Text:SetFont("scoreboard_cedille2_Scorefont1")
            Server3_Text:SizeToContents()
        end 
    end 

    local PlayerPanel_Background = vgui.Create("DPanel", MainPanel)
    PlayerPanel_Background:SetSize(500, 680) 
    PlayerPanel_Background:SetPos(0, 130)
    PlayerPanel_Background.Paint = function(self, w, h)
        surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_background)
        surface.DrawRect(0, 0, w, h)
    end 

    local PlayerPanel_DScrollPanel = vgui.Create("DScrollPanel", PlayerPanel_Background)
    PlayerPanel_DScrollPanel:SetSize(PlayerPanel_Background:GetWide(), PlayerPanel_Background:GetTall() - 30)

    local sbar = PlayerPanel_DScrollPanel:GetVBar()

    sbar.Paint = function(self, w, h)  
        surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_ScrollBar)
        surface.DrawRect(0, 0, w, h)
    end
    sbar.btnUp.Paint = function(self, w, h) 
        surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_ScrollBar)
        surface.DrawRect(0, 0, w, h)
    end
    sbar.btnDown.Paint = function(self, w, h) 
        surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_ScrollBar)
        surface.DrawRect(0, 0, w, h)
    end
    sbar.btnGrip.Paint = function(self, w, h) 
        surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_ScrollBar)
        surface.DrawRect(0, 0, w, h)
    end

    local PlayerPanel_Dlist = vgui.Create("DListLayout", PlayerPanel_DScrollPanel)
    PlayerPanel_Dlist:SetSize(PlayerPanel_DScrollPanel:GetWide(), PlayerPanel_DScrollPanel:GetTall())
    PlayerPanel_Dlist:SetPos(0, 0)

    for _, v7 in pairs (player.GetAll()) do

        local PlayerPanel_Mainmenu = vgui.Create("DPanel", PlayerPanel_Dlist)
        PlayerPanel_Mainmenu:SetSize(PlayerPanel_Dlist:GetWide(), 200)
        PlayerPanel_Mainmenu:SetPos(0, 0)
        PlayerPanel_Mainmenu.Paint = function(self, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_MenuColor)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_MenuColoOutlined)
            surface.DrawOutlinedRect( 0, 0.5, w, h)
            draw.SimpleText(v7:getDarkRPVar("rpname") or v7:Nick(),"scoreboard_cedille2_Scorefont1", 250, 0,scoreboard_cedille_versiontw.PlayerPanel_NameTextColor, TEXT_ALIGN_CENTER)
        end

        if scoreboard_cedille_versiontw.Rankshide[v7:SteamID()] then 
            PlayerPanel_Mainmenu:Remove()
            Cedi_Playeronline = Cedi_Playeronline - 1
        end
        
        local cedi_scoreboard_Playertable = 
        {
        [1] = { posx = 40, posy = 50 , Img = "scoreboard_cedille_v1.2/staff.png", value = v7:GetUserGroup() , font = "scoreboard_cedille2_Scorefont1" , posxT = 40, posyT = -5,},
        [2] = { posx = 40, posy = 100 , Img = "scoreboard_cedille_v1.2/deaths.png", value = v7:Deaths(), font = "scoreboard_cedille2_Scorefont1" , posxT = 30, posyT = -3, },
        [3] = { posx = 40, posy = 150, Img = "scoreboard_cedille_v1.2/wifi.png", value = v7:Ping(), font = "scoreboard_cedille2_Scorefont1" , posxT = 30, posyT = -3,},
        [4] = { posx = 290, posy = 50 , Img = "scoreboard_cedille_v1.2/user.png", value = team.GetName(v7:Team()), font = "scoreboard_cedille2_Scorefont1" , posxT = 40, posyT = -3,},
        [5] = { posx = 290, posy = 100, Img = "scoreboard_cedille_v1.2/kills.png", value = v7:Frags() , font = "scoreboard_cedille2_Scorefont1" , posxT = 30, posyT = -3,},
        [6] = { posx = 290, posy = 150, Img = "scoreboard_cedille_v1.2/givemoney.png", value = v7:getDarkRPVar("salary") , font = "scoreboard_cedille2_Scorefont1" , posxT = 30, posyT = -3,}
        }

        for _, v8 in pairs (cedi_scoreboard_Playertable) do

            local PlayerPanel_Info = vgui.Create("DPanel", PlayerPanel_Mainmenu)
            PlayerPanel_Info:SetSize(170, 40)
            PlayerPanel_Info:SetPos(v8.posx, v8.posy)
            PlayerPanel_Info.Paint = function(self, w, h)
                surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_InfoColor)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(scoreboard_cedille_versiontw.PlayerPanel_InfoColorOutlined)
                surface.DrawOutlinedRect(0, 0, w, h)
            end
        
            if v8.value == nil then v8.value = "0" end
 
            local PlayerPanel_Textinfo = vgui.Create("DLabel", PlayerPanel_Info)
            PlayerPanel_Textinfo:SetWide(120)
            PlayerPanel_Textinfo:SetTall(PlayerPanel_Info:GetTall())
            PlayerPanel_Textinfo:SetPos(v8.posxT, v8.posyT)
            PlayerPanel_Textinfo:SetText(v8.value)
            PlayerPanel_Textinfo:SetFont(v8.font)
            PlayerPanel_Textinfo:SetColor(scoreboard_cedille_versiontw.PlayerPanel_InfoTextColor)
            PlayerPanel_Textinfo:SetContentAlignment(5)

            local PlayerPanel__Image = vgui.Create("DImage", PlayerPanel_Info)	
            PlayerPanel__Image:SetPos(5, 5)	
            PlayerPanel__Image:SetSize(30, 30)	
            PlayerPanel__Image:SetImage(v8.Img)          
    
            local PlayerPanel_About = vgui.Create("DLabel", PlayerPanel_Mainmenu)
            PlayerPanel_About:SetSize(PlayerPanel_Mainmenu:GetWide(), PlayerPanel_Mainmenu:GetTall())
            PlayerPanel_About:SetPos(0, 0)
            PlayerPanel_About:SetText("")
            PlayerPanel_About:SetMouseInputEnabled(true)
            PlayerPanel_About:SetVisible(true)
            PlayerPanel_About.Paint = function(self, w ,h) end
            PlayerPanel_About.DoClick = function(self)
                surface.PlaySound(scoreboard_cedille_versiontw.SoundOnClickPlayer)
                if IsValid(Cedi_ply.ScoreBoard_PanelInfosPlayer) then
                    Cedi_ply.ScoreBoard_PanelInfosPlayer:Remove()
                end
                Cedi_ply.ScoreBoard_PanelInfosPlayer = Actionsonplayer_Fadmin(v7, MainPanel_Backgroundserver, PanelInfo)
            end 
        end
    end 
end


local function scoreboardhide()
    if IsValid(MainPanel) then 
        MainPanel:Hide()
    end
end


hook.Add("ScoreboardShow","Showscore2_cedille", function()
	scoreboardshow()
	return true
end)


hook.Add("ScoreboardHide", "Hidescore2_cedille", function()
    scoreboardhide()
    return true
end)
