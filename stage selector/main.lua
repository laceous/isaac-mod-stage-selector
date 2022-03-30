local mod = RegisterMod('Stage Selector', 1)
local game = Game()

mod.stage11Options = { 'Basement 1', 'Cellar 1', 'Burning Basement 1', 'Downpour 1', 'Dross 1', 'Basement XL', 'Cellar XL', 'Burning Basement XL', 'Downpour XL', 'Dross XL', 'Basement 1 (Ascent)', 'Cellar 1 (Ascent)', 'Burning Basement 1 (Ascent)', 'Downpour 1 (Ascent)', 'Dross 1 (Ascent)' }
mod.stage12Options = { 'Basement 2', 'Cellar 2', 'Burning Basement 2', 'Downpour 2', 'Dross 2', 'Basement 2 (Ascent)', 'Cellar 2 (Ascent)', 'Burning Basement 2 (Ascent)', 'Downpour 2 (Ascent)', 'Dross 2 (Ascent)' }
mod.stage21Options = { 'Caves 1', 'Catacombs 1', 'Flooded Caves 1', 'Mines 1', 'Ashpit 1', 'Caves XL', 'Catacombs XL', 'Flooded Caves XL', 'Mines XL', 'Ashpit XL', 'Caves 1 (Ascent)', 'Catacombs 1 (Ascent)', 'Flooded Caves 1 (Ascent)', 'Mines 1 (Ascent)', 'Ashpit 1 (Ascent)' }
mod.stage22Options = { 'Caves 2', 'Catacombs 2', 'Flooded Caves 2', 'Mines 2', 'Ashpit 2', 'Caves 2 (Ascent)', 'Catacombs 2 (Ascent)', 'Flooded Caves 2 (Ascent)', 'Mines 2 (Ascent)', 'Ashpit 2 (Ascent)' }
mod.stage31Options = { 'Depths 1', 'Necropolis 1', 'Dank Depths 1', 'Mausoleum 1', 'Gehenna 1', 'Depths XL', 'Necropolis XL', 'Dank Depths XL', 'Mausoleum XL', 'Gehenna XL', 'Depths 1 (Ascent)', 'Necropolis 1 (Ascent)', 'Dank Depths 1 (Ascent)', 'Mausoleum 1 (Ascent)', 'Gehenna 1 (Ascent)' }
mod.stage32Options = { 'Depths 2', 'Necropolis 2', 'Dank Depths 2', 'Mausoleum 2', 'Gehenna 2', 'Mausoleum 2 (PreAscent)', 'Gehenna 2 (PreAscent)', 'Depths 2 (Ascent)', 'Necropolis 2 (Ascent)', 'Dank Depths 2 (Ascent)', 'Mausoleum 2 (Ascent)', 'Gehenna 2 (Ascent)' }
mod.stage41Options = { 'Womb 1', 'Utero 1', 'Scarred Womb 1', 'Corpse 1', 'Womb XL', 'Utero XL', 'Scarred Womb XL', 'Corpse XL' }
mod.stage42Options = { 'Womb 2', 'Utero 2', 'Scarred Womb 2', 'Corpse 2' }
mod.stage43Options = { 'Blue Womb' }
mod.stage5Options = { 'Sheol', 'Cathedral' }
mod.stage6Options = { 'Dark Room', 'Chest' }
mod.stage7Options = { 'The Void' }
mod.stage8Options = { 'Home', 'Home (Alt)' }
mod.greedStage1Options = { 'Basement', 'Cellar', 'Burning Basement', 'Downpour', 'Dross' }
mod.greedStage2Options = { 'Caves', 'Catacombs', 'Flooded Caves', 'Mines', 'Asphit' }
mod.greedStage3Options = { 'Depths', 'Necropolis', 'Dank Depths', 'Mausoleum', 'Gehenna' }
mod.greedStage4Options = { 'Womb', 'Utero', 'Scarred Womb', 'Corpse' }
mod.greedStage5Options = { 'Sheol' }
mod.greedStage6Options = { 'The Shop' }
mod.greedStage7Options = { 'Ultra Greed' }
mod.restartGameOptions = { 'Restart', 'Victory Lap' }
mod.restartLevelOptions = { 'Reseed' }
mod.itemOptions = { 'The Polaroid', 'The Negative', 'Key Piece 1', 'Key Piece 2', 'Knife Piece 1', 'Knife Piece 2', 'The Mind', 'Chest' }
mod.debugOptions = { 'Infinite HP', 'High Damage' }

mod.stage11Option = 1
mod.stage12Option = 1
mod.stage21Option = 1
mod.stage22Option = 1
mod.stage31Option = 1
mod.stage32Option = 1
mod.stage41Option = 1
mod.stage42Option = 1
mod.stage43Option = 1
mod.stage5Option = 1
mod.stage6Option = 1
mod.stage7Option = 1
mod.stage8Option = 1
mod.greedStage1Option = 1
mod.greedStage2Option = 1
mod.greedStage3Option = 1
mod.greedStage4Option = 1
mod.greedStage5Option = 1
mod.greedStage6Option = 1
mod.greedStage7Option = 1
mod.restartGameOption = 1
mod.restartLevelOption = 1
mod.itemOption = 1
mod.debugOption = 1

mod.forceXL = nil -- 3 state: true, false, nil
mod.showLevelName = false
mod.toggleText = ''
mod.toggleTextTime = 0

function mod:onGameExit()
  mod.forceXL = nil
  mod.showLevelName = false
  mod.toggleText = ''
  mod.toggleTextTime = 0
end

function mod:onCurseEval(curses)
  if mod.forceXL == true then
    curses = curses | LevelCurse.CURSE_OF_LABYRINTH
  elseif mod.forceXL == false then
    curses = curses & ~LevelCurse.CURSE_OF_LABYRINTH
  end
  
  mod.forceXL = nil
  return curses
end

function mod:onNewLevel()
  if mod.showLevelName then
    local hud = game:GetHUD()
    local level = game:GetLevel()
    local curseName = level:GetCurseName()
    
    if curseName ~= '' then
      hud:ShowItemText(level:GetName(), curseName, true)
    else
      hud:ShowItemText(level:GetName(), nil, false)
    end
    
    mod.showLevelName = false
  end
end

function mod:reseed()
  mod.forceXL = mod:isCurseOfTheLabyrinth()
  mod.showLevelName = true
  Isaac.ExecuteCommand('reseed')
end

function mod:isCurseOfTheLabyrinth()
  local level = game:GetLevel()
  local curses = level:GetCurses()
  local curse = LevelCurse.CURSE_OF_LABYRINTH
  
  return curses & curse == curse
end

function mod:doVictoryLap()
  game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, false)
  game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, false)
  game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
  game:NextVictoryLap()
end

function mod:goToStage(name)
  local stage
  local forceXL = false
  local mausoleumHeartKilled = false
  local backwardsPathInit = false
  local backwardsPath = false
  
  if name == 'Basement 1' then
    stage = '1'
  elseif name == 'Cellar 1' then
    stage = '1a'
  elseif name == 'Burning Basement 1' then
    stage = '1b'
  elseif name == 'Downpour 1' then
    stage = '1c'
  elseif name == 'Dross 1' then
    stage = '1d'
  elseif name == 'Basement XL' then
    stage = '1'
    forceXL = true
  elseif name == 'Cellar XL' then
    stage = '1a'
    forceXL = true
  elseif name == 'Burning Basement XL' then
    stage = '1b'
    forceXL = true
  elseif name == 'Downpour XL' then
    stage = '1c'
    forceXL = true
  elseif name == 'Dross XL' then
    stage = '1d'
    forceXL = true
  elseif name == 'Basement 1 (Ascent)' then
    stage = '1'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Cellar 1 (Ascent)' then
    stage = '1a'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Burning Basement 1 (Ascent)' then
    stage = '1b'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Downpour 1 (Ascent)' then
    stage = '1c'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Dross 1 (Ascent)'then
    stage = '1d'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Basement 2' then
    stage = '2'
  elseif name == 'Cellar 2' then
    stage = '2a'
  elseif name == 'Burning Basement 2' then
    stage = '2b'
  elseif name == 'Downpour 2' then
    stage = '2c'
  elseif name == 'Dross 2' then
    stage = '2d'
  elseif name == 'Basement 2 (Ascent)' then
    stage = '2'
    forceXL = nil
    local backwardsPath = true
  elseif name == 'Cellar 2 (Ascent)' then
    stage = '2a'
    forceXL = nil
    local backwardsPath = true
  elseif name == 'Burning Basement 2 (Ascent)' then
    stage = '2b'
    forceXL = nil
    local backwardsPath = true
  elseif name == 'Downpour 2 (Ascent)' then
    stage = '2c'
    forceXL = nil
    local backwardsPath = true
  elseif name == 'Dross 2 (Ascent)' then
    stage = '2d'
    forceXL = nil
    local backwardsPath = true
  elseif name == 'Caves 1' then
    stage = '3'
  elseif name == 'Catacombs 1' then
    stage = '3a'
  elseif name == 'Flooded Caves 1' then
    stage = '3b'
  elseif name == 'Mines 1' then
    stage = '3c'
  elseif name == 'Ashpit 1' then
    stage = '3d'
  elseif name == 'Caves XL' then
    stage = '3'
    forceXL = true
  elseif name == 'Catacombs XL' then
    stage = '3a'
    forceXL = true
  elseif name == 'Flooded Caves XL' then
    stage = '3b'
    forceXL = true
  elseif name == 'Mines XL' then
    stage = '3c'
    forceXL = true
  elseif name == 'Ashpit XL' then
    stage = '3d'
    forceXL = true
  elseif name == 'Caves 1 (Ascent)' then
    stage = '3'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Catacombs 1 (Ascent)' then
    stage = '3a'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Flooded Caves 1 (Ascent)' then
    stage = '3b'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Mines 1 (Ascent)' then
    stage = '3c'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Ashpit 1 (Ascent)' then
    stage = '3d'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Caves 2' then
    stage = '4'
  elseif name == 'Catacombs 2' then
    stage = '4a'
  elseif name == 'Flooded Caves 2' then
    stage = '4b'
  elseif name == 'Mines 2' then
    stage = '4c'
  elseif name == 'Ashpit 2' then
    stage = '4d'
  elseif name == 'Caves 2 (Ascent)' then
    stage = '4'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Catacombs 2 (Ascent)' then
    stage = '4a'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Flooded Caves 2 (Ascent)' then
    stage = '4b'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Mines 2 (Ascent)' then
    stage = '4c'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Ashpit 2 (Ascent)' then
    stage = '4d'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Depths 1' then
    stage = '5'
  elseif name == 'Necropolis 1' then
    stage = '5a'
  elseif name == 'Dank Depths 1' then
    stage = '5b'
  elseif name == 'Mausoleum 1' then
    stage = '5c'
  elseif name == 'Gehenna 1' then
    stage = '5d'
  elseif name == 'Depths XL' then
    stage = '5'
    forceXL = true
  elseif name == 'Necropolis XL' then
    stage = '5a'
    forceXL = true
  elseif name == 'Dank Depths XL' then
    stage = '5b'
    forceXL = true
  elseif name == 'Mausoleum XL' then
    stage = '5c'
    forceXL = true
  elseif name == 'Gehenna XL' then
    stage = '5d'
    forceXL = true
  elseif name == 'Depths 1 (Ascent)' then
    stage = '5'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Necropolis 1 (Ascent)' then
    stage = '5a'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Dank Depths 1 (Ascent)' then
    stage = '5b'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Mausoleum 1 (Ascent)' then
    stage = '5c'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Gehenna 1 (Ascent)' then
    stage = '5d'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Depths 2' then
    stage = '6'
  elseif name == 'Necropolis 2' then
    stage = '6a'
  elseif name == 'Dank Depths 2' then
    stage = '6b'
  elseif name == 'Mausoleum 2' then
    stage = '6c'
  elseif name == 'Gehenna 2' then
    stage = '6d'
  elseif name == 'Mausoleum 2 (PreAscent)' then
    stage = '6c'
    backwardsPathInit = true
  elseif name == 'Gehenna 2 (PreAscent)' then
    stage = '6d'
    backwardsPathInit = true
  elseif name == 'Depths 2 (Ascent)' then
    stage = '6'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Necropolis 2 (Ascent)' then
    stage = '6a'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Dank Depths 2 (Ascent)' then
    stage = '6b'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Mausoleum 2 (Ascent)' then
    stage = '6c'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Gehenna 2 (Ascent)' then
    stage = '6d'
    forceXL = nil
    backwardsPath = true
  elseif name == 'Womb 1' then
    stage = '7'
  elseif name == 'Utero 1' then
    stage = '7a'
  elseif name == 'Scarred Womb 1' then
    stage = '7b'
  elseif name == 'Corpse 1' then
    stage = '7c'
  elseif name == 'Womb XL' then
    stage = '7'
    forceXL = true
  elseif name == 'Utero XL' then
    stage = '7a'
    forceXL = true
  elseif name == 'Scarred Womb XL' then
    stage = '7b'
    forceXL = true
  elseif name == 'Corpse XL' then
    stage = '7c'
    forceXL = true
  elseif name == 'Womb 2' then
    stage = '8'
  elseif name == 'Utero 2' then
    stage = '8a'
  elseif name == 'Scarred Womb 2' then
    stage = '8b'
  elseif name == 'Corpse 2' then
    stage = '8c'
  elseif name == 'Blue Womb' then
    stage = '9'
  elseif name == 'Sheol' then
    stage = '10'
  elseif name == 'Cathedral' then
    stage = '10a'
  elseif name == 'Dark Room' then
    stage = '11'
  elseif name == 'Chest' then
    stage = '11a'
  elseif name == 'The Void' then
    stage = '12'
  elseif name == 'Home' then
    stage = '13'
    forceXL = nil
  elseif name == 'Home (Alt)' then
    stage = '13a'
    forceXL = nil
  end
  
  if stage then
    mod.forceXL = forceXL
    game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, mausoleumHeartKilled)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, backwardsPathInit)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, backwardsPath)
    
    Isaac.ExecuteCommand('stage ' .. stage)
    mod:reseed()
  end
end

function mod:goToGreedStage(name)
  local stage
  
  if name == 'Basement' then
    stage = '1'
  elseif name == 'Cellar' then
    stage = '1a'
  elseif name == 'Burning Basement' then
    stage = '1b'
  elseif name == 'Downpour' then
    stage = '1c' -- doesn't show in the debug console, but works
  elseif name == 'Dross' then
    stage = '1d' -- doesn't show in the debug console, but works
  elseif name == 'Caves' then
    stage = '2'
  elseif name == 'Catacombs' then
    stage = '2a'
  elseif name == 'Flooded Caves' then
    stage = '2b'
  elseif name == 'Mines' then
    stage = '2c' -- doesn't show in the debug console, but works
  elseif name == 'Asphit' then
    stage = '2d' -- doesn't show in the debug console, but works
  elseif name == 'Depths' then
    stage = '3'
  elseif name == 'Necropolis' then
    stage = '3a'
  elseif name == 'Dank Depths' then
    stage = '3b'
  elseif name == 'Mausoleum' then
    stage = '3c' -- doesn't show in the debug console, but works
  elseif name == 'Gehenna' then
    stage = '3d' -- doesn't show in the debug console, but works
  elseif name == 'Womb' then
    stage = '4'
  elseif name == 'Utero' then
    stage = '4a'
  elseif name == 'Scarred Womb' then
    stage = '4b'
  elseif name == 'Corpse' then
    stage = '4c' -- doesn't show in the debug console, but works
  elseif name == 'Sheol' then
    stage = '5' -- the debug console lists 5a and 5b, but they're also sheol
  elseif name == 'The Shop' then
    stage = '6'
  elseif name == 'Ultra Greed' then
    stage = '7'
  end
  
  if stage then
    Isaac.ExecuteCommand('stage ' .. stage)
    mod:reseed()
  end
end

function mod:giveItem(name)
  local player = game:GetPlayer(0)
  local room = game:GetRoom()
  
  if name == 'The Polaroid' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_POLAROID) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_POLAROID, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'The Negative' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_NEGATIVE) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_NEGATIVE, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'Key Piece 1' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_KEY_PIECE_1) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_KEY_PIECE_1, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'Key Piece 2' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_KEY_PIECE_2) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_KEY_PIECE_2, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'Knife Piece 1' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_KNIFE_PIECE_1) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_KNIFE_PIECE_1, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'Knife Piece 2' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_KNIFE_PIECE_2) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_KNIFE_PIECE_2, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'The Mind' then
    if not mod:hasCollectible(CollectibleType.COLLECTIBLE_MIND) then
      player:AddCollectible(CollectibleType.COLLECTIBLE_MIND, 0, true, ActiveSlot.SLOT_PRIMARY, 0)
    end
  elseif name == 'Chest' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_CHEST, 0, Isaac.GetFreeNearPosition(room:GetCenterPos(), 3), Vector(0,0), nil)
  end
end

function mod:hasCollectible(collectible)
  for i = 0, game:GetNumPlayers() - 1 do
    local player = game:GetPlayer(i)
    
    if player:HasCollectible(collectible, false) then
      return true
    end
  end
  
  return false
end

function mod:toggleDebug(name)
  if name == 'Infinite HP' then
    mod.toggleText = Isaac.ExecuteCommand('debug 3')
    mod.toggleTextTime = game:GetFrameCount()
  elseif name == 'High Damage' then
    mod.toggleText = Isaac.ExecuteCommand('debug 4')
    mod.toggleTextTime = game:GetFrameCount()
  end
end

function mod:setupModConfigMenu()
  for i, v in ipairs({
                       { title = 'Stage 1-1', options = mod.stage11Options, option = mod.stage11Option },
                       { title = 'Stage 1-2', options = mod.stage12Options, option = mod.stage12Option },
                       { title = 'Stage 2-1', options = mod.stage21Options, option = mod.stage21Option },
                       { title = 'Stage 2-2', options = mod.stage22Options, option = mod.stage22Option },
                       { title = 'Stage 3-1', options = mod.stage31Options, option = mod.stage31Option },
                       { title = 'Stage 3-2', options = mod.stage32Options, option = mod.stage32Option },
                       { title = 'Stage 4-1', options = mod.stage41Options, option = mod.stage41Option },
                       { title = 'Stage 4-2', options = mod.stage42Options, option = mod.stage42Option },
                       { title = 'Stage 4-3', options = mod.stage43Options, option = mod.stage43Option },
                       { title = 'Stage 5',   options = mod.stage5Options,  option = mod.stage5Option },
                       { title = 'Stage 6',   options = mod.stage6Options,  option = mod.stage6Option },
                       { title = 'Stage 7',   options = mod.stage7Options,  option = mod.stage7Option },
                       { title = 'Stage 8',   options = mod.stage8Options,  option = mod.stage8Option }
                    })
  do
    if i ~= 1 then
      ModConfigMenu.AddSpace(mod.Name, 'Stages')
    end
    ModConfigMenu.AddTitle(mod.Name, 'Stages', v.title)
    ModConfigMenu.AddSetting(
      mod.Name,
      'Stages',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return v.option
        end,
        Minimum = 1,
        Maximum = #v.options,
        Display = function()
          return '< ' .. v.options[v.option] .. ' >'
        end,
        OnChange = function(n)
          v.option = n
        end,
        Info = { 'Select a stage' }
      }
    )
    ModConfigMenu.AddSetting(
      mod.Name,
      'Stages',
      {
        Type = ModConfigMenu.OptionType.BOOLEAN,
        CurrentSetting = function()
          return false
        end,
        Display = function()
          return game:IsGreedMode() and '(Disabled)' or 'Go!'
        end,
        OnChange = function(b)
          if not game:IsGreedMode() then
            mod:goToStage(v.options[v.option])
            ModConfigMenu.CloseConfigMenu()
          end
        end,
        Info = { 'Go to selected stage' }
      }
    )
  end
  for i, v in ipairs({
                       { title = 'Stage 1', options = mod.greedStage1Options, option = mod.greedStage1Option },
                       { title = 'Stage 2', options = mod.greedStage2Options, option = mod.greedStage2Option },
                       { title = 'Stage 3', options = mod.greedStage3Options, option = mod.greedStage3Option },
                       { title = 'Stage 4', options = mod.greedStage4Options, option = mod.greedStage4Option },
                       { title = 'Stage 5', options = mod.greedStage5Options, option = mod.greedStage5Option },
                       { title = 'Stage 6', options = mod.greedStage6Options, option = mod.greedStage6Option },
                       { title = 'Stage 7', options = mod.greedStage7Options, option = mod.greedStage7Option }
                    })
  do
    if i ~= 1 then
      ModConfigMenu.AddSpace(mod.Name, 'Greed')
    end
    ModConfigMenu.AddTitle(mod.Name, 'Greed', v.title)
    ModConfigMenu.AddSetting(
      mod.Name,
      'Greed',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return v.option
        end,
        Minimum = 1,
        Maximum = #v.options,
        Display = function()
          return '< ' .. v.options[v.option] .. ' >'
        end,
        OnChange = function(n)
          v.option = n
        end,
        Info = { 'Select a stage' }
      }
    )
    ModConfigMenu.AddSetting(
      mod.Name,
      'Greed',
      {
        Type = ModConfigMenu.OptionType.BOOLEAN,
        CurrentSetting = function()
          return false
        end,
        Display = function()
          return game:IsGreedMode() and 'Go!' or '(Disabled)'
        end,
        OnChange = function(b)
          if game:IsGreedMode() then
            mod:goToGreedStage(v.options[v.option])
            ModConfigMenu.CloseConfigMenu()
          end
        end,
        Info = { 'Go to selected stage' }
      }
    )
  end
  ModConfigMenu.AddTitle(mod.Name, 'Restart', 'Game')
  ModConfigMenu.AddSetting(
    mod.Name,
    'Restart',
    {
      Type = ModConfigMenu.OptionType.NUMBER,
      CurrentSetting = function()
        return mod.restartGameOption
      end,
      Minimum = 1,
      Maximum = #mod.restartGameOptions,
      Display = function()
        return '< ' .. mod.restartGameOptions[mod.restartGameOption] .. ' >'
      end,
      OnChange = function(n)
        mod.restartGameOption = n
      end,
      Info = { 'Restart: start a new run', 'Victory Lap: start a new victory lap (disabled', 'in greed mode)' }
    }
  )
  ModConfigMenu.AddSetting(
    mod.Name,
    'Restart',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        return 'Go!'
      end,
      OnChange = function(b)
        if mod.restartGameOptions[mod.restartGameOption] == 'Restart' then
          Isaac.ExecuteCommand('restart')
        elseif mod.restartGameOptions[mod.restartGameOption] == 'Victory Lap' then
          if not game:IsGreedMode() then
            mod:doVictoryLap()
            ModConfigMenu.CloseConfigMenu()
          end
        end
      end,
      Info = { 'Execute your chosen option' }
    }
  )
  ModConfigMenu.AddSpace(mod.Name, 'Restart')
  ModConfigMenu.AddTitle(mod.Name, 'Restart', 'Stage')
  ModConfigMenu.AddSetting(
    mod.Name,
    'Restart',
    {
      Type = ModConfigMenu.OptionType.NUMBER,
      CurrentSetting = function()
        return mod.restartLevelOption
      end,
      Minimum = 1,
      Maximum = #mod.restartLevelOptions,
      Display = function()
        return '< ' .. mod.restartLevelOptions[mod.restartLevelOption] .. ' >'
      end,
      OnChange = function(n)
        mod.restartLevelOption = n
      end,
      Info = { 'Reseed: restart the stage with a new seed' }
    }
  )
  ModConfigMenu.AddSetting(
    mod.Name,
    'Restart',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        return 'Go!'
      end,
      OnChange = function(b)
        if mod.restartLevelOptions[mod.restartLevelOption] == 'Reseed' then
          mod:reseed()
          ModConfigMenu.CloseConfigMenu()
        end
      end,
      Info = { 'Execute your chosen option' }
    }
  )
  ModConfigMenu.AddTitle(mod.Name, 'Misc', 'Items')
  ModConfigMenu.AddSetting(
    mod.Name,
    'Misc',
    {
      Type = ModConfigMenu.OptionType.NUMBER,
      CurrentSetting = function()
        return mod.itemOption
      end,
      Minimum = 1,
      Maximum = #mod.itemOptions,
      Display = function()
        return '< ' .. mod.itemOptions[mod.itemOption] .. ' >'
      end,
      OnChange = function(n)
        mod.itemOption = n
      end,
      Info = { 'Select an item' }
    }
  )
  ModConfigMenu.AddSetting(
    mod.Name,
    'Misc',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        return 'Give!'
      end,
      OnChange = function(b)
        mod:giveItem(mod.itemOptions[mod.itemOption])
      end,
      Info = { 'Give the selected item' }
    }
  )
  ModConfigMenu.AddSpace(mod.Name, 'Misc')
  ModConfigMenu.AddTitle(mod.Name, 'Misc', 'Debug')
  ModConfigMenu.AddSetting(
    mod.Name,
    'Misc',
    {
      Type = ModConfigMenu.OptionType.NUMBER,
      CurrentSetting = function()
        return mod.debugOption
      end,
      Minimum = 1,
      Maximum = #mod.debugOptions,
      Display = function()
        return '< ' .. mod.debugOptions[mod.debugOption] .. ' >'
      end,
      OnChange = function(n)
        mod.debugOption = n
      end,
      Info = { 'Select a debug option' }
    }
  )
  ModConfigMenu.AddSetting(
    mod.Name,
    'Misc',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        return 'Toggle!'
      end,
      OnChange = function(b)
        mod:toggleDebug(mod.debugOptions[mod.debugOption])
      end,
      Info = { 'Toggle the debug option' }
    }
  )
  ModConfigMenu.AddText(mod.Name, 'Misc', function()
    if game:GetFrameCount() >= mod.toggleTextTime + 45 then
      mod.toggleText = ''
    end
    
    return mod.toggleText
  end)
end

mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
mod:AddCallback(ModCallbacks.MC_POST_CURSE_EVAL, mod.onCurseEval)
mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, mod.onNewLevel)

if ModConfigMenu then
  mod:setupModConfigMenu()
end