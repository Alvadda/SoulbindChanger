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
    name = "Bonesmith Heirmir",
    textureFile = "Interface/Soulbinds/SoulbindsShotsNecrolords",
    textureCoord = {0.308594,0.587891,0.000976562,0.545898}
 }

local buttons = {}
local frame = CreateFrame("Frame", "sbcFrame", UIParent, "BasicFrameTemplate")

--Frame Setup
frame:Hide()
frame:SetHeight(300)
frame:SetWidth(80)
frame:SetPoint("TOPRIGHT", PlayerTalentFrame, "RIGHT", 81, 233)


local function GetAvailableSoulbindIds(soulbindIds)
    local availableSoulbindIds = {}
    local soulbindIdsLength = table.getn(soulbindIds)

    for i=1,soulbindIdsLength do
        if (C_Soulbinds.CanActivateSoulbind(soulbindIds[i])) then
            local availableSoulbindIdsLength = table.getn(availableSoulbindIds)
            local newAvailableSoulbindIdsLength = availableSoulbindIdsLength + 1
            availableSoulbindIds[newAvailableSoulbindIdsLength] = soulbindIds[i]
        end
    end
    return availableSoulbindIds
end    

local function GetCovenantSoulbindIds(covenantId)
    if(covenantId == 1) then
        return {7, 13, 18}
    elseif (covenantId == 2) then 
        return {8, 9, 3}
    elseif (covenantId == 3) then
        return {1, 2, 6}
    elseif (covenantId == 4) then 
        return {4, 5, 10}
    else            
        print("No Covenant found!")
    end
end


local function GetSoulbindDetails(soulbindId)
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

local function GenerateButtons(availableSoulbinds)
    local availableSoulbindsLength = table.getn(availableSoulbinds)

    if availableSoulbindsLength > 1 then
        
        for i=1,availableSoulbindsLength do
            local soulbindDetails = GetSoulbindDetails(availableSoulbinds[i])

            local b = CreateFrame('Button', nil, frame); 
            b:SetPoint("CENTER", frame, "TOP", 0, -80 * i)
            b:SetSize(70, 70)

            b.icon = b:CreateTexture(nil, 'ARTWORK'); 
            b.icon:SetPoint("CENTER", b, "CENTER", -10, 5)
            b.icon:SetSize(60, 60)
            b.icon:SetScale(0.9)
            b.icon:SetTexture(soulbindDetails.textureFile)
            b.icon:SetTexCoord(soulbindDetails.textureCoord[1], soulbindDetails.textureCoord[2], soulbindDetails.textureCoord[3], soulbindDetails.textureCoord[4])

            b.border = b:CreateTexture(nil, 'ARTWORK');
            b.border:SetAllPoints(b); 
            b.border:SetSize(60, 60)
            b.border:SetScale(1.1)
            b.border:SetTexture("Interface/Garrison/OrderHallTalents")
    
            if soulbindDetails.id ==  C_Soulbinds.GetActiveSoulbindID() then
                b.border:SetTexCoord(0.431640625, 0.529296875, 0.4453125, 0.640625)
            else
                b.border:SetTexCoord(0.291015625, 0.388671875, 0.78125, 0.9765625)
            end   
    
            b:SetScript("OnClick", function (self, button, down)
    
                for _,button in ipairs(buttons) do
                    button.border:SetTexCoord(0.291015625, 0.388671875, 0.78125, 0.9765625)
                end
                b.border:SetTexCoord(0.431640625, 0.529296875, 0.4453125, 0.640625)

                C_Soulbinds.ActivateSoulbind(availableSoulbinds[i])
                print(soulbindDetails.name .. " is now aktiv")

            end)  
    
            table.insert(buttons, b)
        end
        frame:Show()
        frame:SetHeight(100 * availableSoulbindsLength)

    end
end


local function LoadCovernant()
    local covenentId = C_Covenants.GetActiveCovenantID()
    local soulbindIds = GetCovenantSoulbindIds(covenentId)
    local availableSoulbindIds = GetAvailableSoulbindIds(soulbindIds)
    GenerateButtons(availableSoulbindIds)
end



local function SoulbindChangerHandler()

    
end


PlayerTalentFrameTalents:HookScript("OnShow", function (self, event, ...)
    LoadCovernant()
end)

PlayerTalentFrameTalents:HookScript("OnHide", function (self, event, ...)
    frame:Hide()
end)

SlashCmdList["SBC"] = SoulbindChangerHandler



