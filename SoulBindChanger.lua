-- 1 Kyrian
-- 7 = Pelagos
-- 13 = Kleia
-- 18 = Forgelite Prime Mikanikos

-- 2 Venthyr
-- 8 = Nadjia the Mistblade
-- 9 = Theotar the Mad Duke
-- 3 = General Draven


-- 3 NightFae
-- 1 = Niya
-- 2 = Dreamweaver
-- 6 = Korayn

-- 4 Necrolord
-- 4 = Plague Deviser Marileth
-- 5 = Emeni
-- 10 = Bonesmith Heirmir

SLASH_SBC1 = "/sbc"

local pelagos = {
    id =  7,
    name = "Pelagos",
    textureFile = "Interface/Soulbinds/SoulbindsShotsKyrian",
    textureCoord = {0.579102,0.861328,0.000976562,0.545898}
 }

 local kleia = {
    id =  13,
    name = "Kleia",
    textureFile = "Interface/Soulbinds/SoulbindsShotsKyrian",
    textureCoord = {0.000488281,0.294922,0.000976562,0.545898}
 }

 local forgelitePrimeMikanikos = {
    id =  18,
    name = "Forgelite Prime Mikanikos",
    textureFile = "Interface/Soulbinds/SoulbindsShotsKyrian",
    textureCoord = {0.000488281,0.294922,0.000976562,0.545898}
 }

 local nadjiatheMistblade = {
    id =  8,
    name = "Nadjia the Mistblade",
    textureFile = "Interface/Soulbinds/SoulbindsShotsVenthyr",
    textureCoord = {0.000488281,0.307617,0.000976562,0.545898}
 }

 local theotartheMadDuke = {
    id =  9,
    name = "Theotar the Mad Duke",
    textureFile = "Interface/Soulbinds/SoulbindsShotsVenthyr",
    textureCoord = {0.308594,0.605469,0.000976562,0.545898}
 }

 local generalDraven = {
    id =  3,
    name = "General Draven",
    textureFile = "Interface/Soulbinds/SoulbindsShotsVenthyr",
    textureCoord = {0.606445,0.900879,0.000976562,0.545898}
 }

 local niya = {
    id =  1,
    name = "Niya",
    textureFile = "Interface/Soulbinds/SoulbindsShotsFey",
    textureCoord = {0.591309,0.873535,0.000976562,0.545898}
 }

 local dreamweaver = {
    id =  2,
    name = "Dreamweaver",
    textureFile = "Interface/Soulbinds/SoulbindsShotsFey",
    textureCoord = {0.000488281,0.294922,0.000976562,0.545898}
 }

 local korayn = {
    id =  6,
    name = "Korayn",
    textureFile = "Interface/Soulbinds/SoulbindsShotsFey",
    textureCoord = {0.295898,0.295898,0.000976562,0.545898}
 }

 local plagueDeviserMarileth = {
    id =  4,
    name = "Plague Deviser Marileth",
    textureFile = "Interface/Soulbinds/SoulbindsShotsNecrolords",
    textureCoord = {0.588867,0.868164,0.000976562,0.545898}
 }

 local emeni = {
    id =  5,
    name = "Emeni",
    textureFile = "Interface/Soulbinds/SoulbindsShotsNecrolords",
    textureCoord = {0.000488281,0.307617,0.000976562,0.545898}
 }

 local bonesmithHeirmir = {
    id =  10,
    name = "Plague Deviser Marileth",
    textureFile = "Interface/Soulbinds/SoulbindsShotsNecrolords",
    textureCoord = {0.308594,0.587891,0.000976562,0.545898}
 }

local frame = CreateFrame("Frame", "Test", PlayerTalentFrameTalents, "BasicFrameTemplate")

--Frame Setup
frame:Hide()
frame:SetHeight(300)
frame:SetWidth(80)
frame:SetPoint("TOPRIGHT", PlayerTalentFrame, "RIGHT", 81, 233)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")


function Test () 
    
end

local function ShowCovenant(name)
    local text = "You are a, " .. name .. "!"

    message(text)
end

local function GetAvailableSoulBindIds(soulBindIds)
    local availableSoulBindIds = {}
    local soulBindIdsLength = table.getn(soulBindIds)

    for i=1,soulBindIdsLength do
        if (C_Soulbinds.CanActivateSoulbind(soulBindIds[i])) then
            local availableSoulBindIdsLength = table.getn(availableSoulBindIds)
            local newAvailableSoulBindIdsLength = availableSoulBindIdsLength + 1
            availableSoulBindIds[newAvailableSoulBindIdsLength] = soulBindIds[i]
        end
    end
    return availableSoulBindIds
end    

local function GetCovenantSoulBindIds(covenantId)
    if(covenantId == 1) then
        return {7, 13, 18}
    elseif (covenantId == 2) then 
        return {8, 9, 3}
    elseif (covenantId == 3) then
        return {1, 2, 6}
    elseif (covenantId == 4) then 
        return {4, 5, 10}
    else            
        ShowCovenant("You dont have a Covenent")
    end
end


local function GetSoulBindDetails(soulbindId)
    if(soulbindId == 1) then
        return niya
    elseif (soulbindId == 2) then 
        return dreamweaver
    elseif (soulbindId == 2) then 
        return dreamweaver
    elseif (soulbindId == 3) then 
        return generalDraven
    elseif (soulbindId == 4) then 
        return plagueDeviserMarileth
    elseif (soulbindId == 5) then 
        return emeni
    elseif (soulbindId == 6) then 
        return korayn
    elseif (soulbindId == 7) then 
        return pelagos
    elseif (soulbindId == 8) then 
        return nadjiatheMistblade
    elseif (soulbindId == 9) then 
        return theotartheMadDuke
    elseif (soulbindId == 10) then 
        return bonesmithHeirmir
    elseif (soulbindId == 13) then 
        return kleia
    elseif (soulbindId == 18) then 
        return forgelitePrimeMikanikos           
    end
end



local function GenerateButtons(availableSoulBinds)

    local availableSoulBindsLength = table.getn(availableSoulBinds)

    for i=1,availableSoulBindsLength do
        local soulbindDetails = GetSoulBindDetails(availableSoulBinds[i])

        frame["Button" ..i] = CreateFrame('Button', nil, frame, "TranslucentFrameTemplate"); 
        frame["Button" ..i]:SetPoint("CENTER", frame, "TOP", 0, -80 * i)
        frame["Button" ..i]:SetSize(70, 70)
        frame["Button" ..i]:SetScript("OnClick", function (self, button, down)
            C_Soulbinds.ActivateSoulbind(availableSoulBinds[i])
            print(soulbindDetails.name .. " is now aktiv")
        end)
        local t = frame["Button" ..i]:CreateTexture(nil, 'ARTWORK'); 
        t:SetPoint("CENTER", frame["Button" ..i], "CENTER", -10, 5)
        t:SetSize(60, 60)
        t:SetTexture(soulbindDetails.textureFile)
        t:SetTexCoord(soulbindDetails.textureCoord[1], soulbindDetails.textureCoord[2], soulbindDetails.textureCoord[3], soulbindDetails.textureCoord[4])
    end

    frame:SetHeight(100 * availableSoulBindsLength)
end


local function LoadCovernant()
    local covenentId = C_Covenants.GetActiveCovenantID()
    local soulbindIds = GetCovenantSoulBindIds(covenentId)
    local availableSoulBindIds = GetAvailableSoulBindIds(soulbindIds)
    GenerateButtons(availableSoulBindIds)
    print("Soulbind Changer Loaded...")
end



local function SoulBindChangerHandler()

    -- local covenentId = C_Covenants.GetActiveCovenantID()
    -- local soulbindIds = GetCovenantSoulBindIds(covenentId)
    -- GetAvailableSoulBindIds(soulbindIds)
    -- ShowCovenant(soulbindIds[1])
    -- C_Soulbinds.ActivateSoulbind(5)
    
end

frame:SetScript("OnEvent", LoadCovernant) 

PlayerTalentFrameTalents:HookScript("OnShow", function (self, event, ...)
    frame:Show()
end)

PlayerTalentFrameTalents:HookScript("OnHide", function (self, event, ...)
    frame:Hide()
end)

SlashCmdList["SBC"] = SoulBindChangerHandler



