ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)




open = false
local mainMenu = RageUI.CreateMenu("Coords", "Interaction")
mainMenu.Closed = function() 
    open = false 
end

local function openMenuCoords()
    if open then 
        open = false 
        RageUI.Visible(mainMenu, false)
        return 
    else
        open = true 
        RageUI.Visible(mainMenu, true)
        CreateThread(function()
            while open do 
                local coords = GetEntityCoords(PlayerPedId())                
                RageUI.IsVisible(mainMenu, function()

                    RageUI.Button("vector3("..ixCoords.mainColor.."x~s~, "..ixCoords.mainColor.."y~s~, "..ixCoords.mainColor.."z~s~)", nil, {}, true, {
                        onSelected = function()
                            SendNUIMessage({
                                coords = "vector3("..coords.x..", "..coords.y..", "..coords.z..")"
                            })
                            ESX.ShowAdvancedNotification('Coordonnées', "~g~Succès", "Coordonées copiées !\rContenu de la copie : ~b~vector3("..math.floor(coords.x)..", "..math.floor(coords.y)..", "..math.floor(coords.z)..")~s~", ixCoords.CHAR, 0)
                        end
                    })

        
                    RageUI.Button("{x = "..ixCoords.mainColor.."x~s~, y = "..ixCoords.mainColor.."y~s~, z = "..ixCoords.mainColor.."z~s~}", nil, {}, true, {
                        onSelected = function()
                            SendNUIMessage({
                                coords = "{x = "..coords.x..", y = "..coords.y..", z = "..coords.z.."}"
                            })
                            ESX.ShowAdvancedNotification('Coordonnées', "~g~Succès", "Coordonées copiées !\rContenu de la copie : ~b~{x = "..math.floor(coords.x)..", y = "..math.floor(coords.y)..", z = "..math.floor(coords.z).."}", ixCoords.CHAR, 0)
                        end
                    })

                    RageUI.Button(""..ixCoords.mainColor.."x~s~, "..ixCoords.mainColor.."y~s~, "..ixCoords.mainColor.."z~s~", nil, {}, true, {
                        onSelected = function()
                            SendNUIMessage({
                                coords = ""..coords.x..","..coords.y..","..coords.z..""
                            })
                            ESX.ShowAdvancedNotification('Coordonnées', "~g~Succès", "Coordonées copiées !\rContenu de la copie : ~b~"..math.floor(coords.x)..", "..math.floor(coords.y)..", "..math.floor(coords.z), ixCoords.CHAR, 0)
                        end
                    })

                    RageUI.Button("Angle", nil, {}, true, {
                        onSelected = function()
                            local headingPed = GetEntityHeading(PlayerPedId())
                            SendNUIMessage({
                                coords = headingPed
                            })
                            ESX.ShowAdvancedNotification('Coordonnées', "~g~Succès", "Angle copié !\rContenu de la copie : ~b~"..math.floor(headingPed), ixCoords.CHAR, 0)
                            
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end


Keys.Register(ixCoords.openKeyboard, ixCoords.openKeyboard, "Menu Coords", function()
    openMenuCoords()
end)


