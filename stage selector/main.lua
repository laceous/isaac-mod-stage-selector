local mod = RegisterMod('Stage Selector', 1)
local json = require('json')
local game = Game()

mod.rng = RNG()
mod.rngShiftIndex = 35

mod.stage11Options = { 'Basement I', 'Cellar I', 'Burning Basement I', 'Basement XL', 'Cellar XL', 'Burning Basement XL', 'Basement I (Ascent)', 'Cellar I (Ascent)', 'Burning Basement I (Ascent)' }
mod.stage11AltOptions = { 'Downpour I', 'Dross I', 'Downpour XL', 'Dross XL', 'Downpour I (Ascent)', 'Dross I (Ascent)' }
mod.stage12Options = { 'Basement II', 'Cellar II', 'Burning Basement II', 'Basement II (Ascent)', 'Cellar II (Ascent)', 'Burning Basement II (Ascent)' }
mod.stage12AltOptions = { 'Downpour II', 'Dross II', 'Downpour II (Ascent)', 'Dross II (Ascent)' }
mod.stage21Options = { 'Caves I', 'Catacombs I', 'Flooded Caves I', 'Caves XL', 'Catacombs XL', 'Flooded Caves XL', 'Caves I (Ascent)', 'Catacombs I (Ascent)', 'Flooded Caves I (Ascent)' }
mod.stage21AltOptions = { 'Mines I', 'Ashpit I', 'Mines XL', 'Ashpit XL', 'Mines I (Ascent)', 'Ashpit I (Ascent)' }
mod.stage22Options = { 'Caves II', 'Catacombs II', 'Flooded Caves II', 'Caves II (Ascent)', 'Catacombs II (Ascent)', 'Flooded Caves II (Ascent)' }
mod.stage22AltOptions = { 'Mines II', 'Ashpit II', 'Mines II (Ascent)', 'Ashpit II (Ascent)' }
mod.stage31Options = { 'Depths I', 'Necropolis I', 'Dank Depths I', 'Depths XL', 'Necropolis XL', 'Dank Depths XL', 'Depths I (Ascent)', 'Necropolis I (Ascent)', 'Dank Depths I (Ascent)' }
mod.stage31AltOptions = { 'Mausoleum I', 'Gehenna I', 'Mausoleum XL', 'Gehenna XL', 'Mausoleum I (Ascent)', 'Gehenna I (Ascent)' }
mod.stage32Options = { 'Depths II', 'Necropolis II', 'Dank Depths II', 'Depths II (Ascent)', 'Necropolis II (Ascent)', 'Dank Depths II (Ascent)' }
mod.stage32AltOptions = { 'Mausoleum II', 'Gehenna II', 'Mausoleum II (PreAscent)', 'Gehenna II (PreAscent)', 'Mausoleum II (Ascent)', 'Gehenna II (Ascent)' }
mod.stage41Options = { 'Womb I', 'Utero I', 'Scarred Womb I', 'Womb XL', 'Utero XL', 'Scarred Womb XL' }
mod.stage41AltOptions = { 'Corpse I', 'Corpse XL' }
mod.stage42Options = { 'Womb II', 'Utero II', 'Scarred Womb II' }
mod.stage42AltOptions = { 'Corpse II' }
mod.stage43Options = { '???' } -- Blue Womb
mod.stage5Options = { 'Sheol', 'Cathedral' }
mod.stage6Options = { 'Dark Room', 'Chest' }
mod.stage7Options = { 'The Void' }
mod.stage8Options = { 'Home', 'Home (Alt)' }
mod.greedStage1Options = { 'Basement', 'Cellar', 'Burning Basement' }
mod.greedStage1AltOptions = { 'Downpour', 'Dross' }
mod.greedStage2Options = { 'Caves', 'Catacombs', 'Flooded Caves' }
mod.greedStage2AltOptions = { 'Mines', 'Asphit' }
mod.greedStage3Options = { 'Depths', 'Necropolis', 'Dank Depths' }
mod.greedStage3AltOptions = { 'Mausoleum', 'Gehenna' }
mod.greedStage4Options = { 'Womb', 'Utero', 'Scarred Womb' }
mod.greedStage4AltOptions = { 'Corpse' }
mod.greedStage5Options = { 'Sheol', 'Cathedral' }
mod.greedStage6Options = { 'The Shop' }
mod.greedStage7Options = { 'Ultra Greed' }
mod.restartGameOptions = { 'Restart', 'Victory Lap' }
mod.restartLevelOptions = { 'Reseed' }
mod.seedCharOptions = { '0', '1', '2', '3', '4', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z' } -- no 5, I, O, U
mod.mainDimensionOptions = { 'Starting Room', 'Mirror' }
mod.mirrorDimensionOptions = { 'Starting Room', 'Mirror' }
mod.deathCertDimensionOptions = { 'Starting Room' }
mod.basementBossOptions = { 'Baby Plum', 'Dangle', 'Dingle', 'Famine', 'Gemini', 'Gurglings', 'Larry Jr.', 'Little Horn', 'Monstro', 'Steven', 'The Duke of Flies', 'The Headless Horseman', 'Turdlings' }
mod.cellarBossOptions = { 'Baby Plum', 'Blighted Ovum', 'Famine', 'Little Horn', 'Pin', 'Rag Man', 'The Duke of Flies', 'The Haunt', 'The Headless Horseman', 'Widow' }
mod.burningBasementBossOptions = { 'Baby Plum', 'Dangle', 'Dingle', 'Famine', 'Gemini', 'Gurglings', 'Larry Jr.', 'Little Horn', 'Monstro', 'Rag Man', 'Steven', 'The Duke of Flies', 'The Headless Horseman', 'Turdlings' }
mod.downpourBossOptions = { 'Lil Blub', 'Min-Min', 'The Rainmaker', 'Wormwood' }
mod.drossBossOptions = { 'Clog', 'Colostomia', 'Lil Blub', 'Turdlet', 'Wormwood' }
mod.cavesBossOptions = { 'Big Horn', 'Bumbino', 'C.H.A.D.', 'Chub', 'Fistula', 'Gurdy', 'Gurdy Jr.', 'Mega Fatty', 'Mega Maw', 'Peep', 'Pestilence', 'Rag Mega', 'The Fallen', 'The Headless Horseman', 'The Stain' }
mod.catacombsBossOptions = { 'Big Horn', 'Bumbino', 'Carrion Queen', 'Dark One', 'Gurdy Jr.', 'Peep', 'Pestilence', 'Polycephalus', 'Rag Mega', 'The Fallen', 'The Forsaken', 'The Frail', 'The Headless Horseman', 'The Hollow', 'The Husk', 'The Wretched' }
mod.floodedCavesBossOptions = { 'Big Horn', 'Bumbino', 'C.H.A.D.', 'Chub', 'Fistula', 'Gurdy', 'Gurdy Jr.', 'Mega Fatty', 'Mega Maw', 'Peep', 'Pestilence', 'Rag Mega', 'The Fallen', 'The Forsaken', 'The Frail', 'The Headless Horseman', 'The Stain' }
mod.minesBossOptions = { 'Great Gideon', 'Hornfel', 'Reap Creep', 'Tuff Twins' }
mod.ashpitBossOptions = { 'Clutch', 'Great Gideon', 'Singe', 'The Pile', 'The Shell' }
mod.depthsBossOptions = { 'Brownie', 'Gish', 'Loki', 'Monstro II', 'Reap Creep', 'Sisters Vis', 'The Cage', 'The Fallen', 'The Gate', 'The Headless Horseman', 'War' }
mod.necropolisBossOptions = { 'Brownie', 'Loki', 'Mask of Infamy', 'Sisters Vis', 'The Adversary', 'The Bloat', 'The Fallen', 'The Headless Horseman', 'The Pile', 'War' }
mod.dankDepthsBossOptions = { 'Brownie', 'Gish', 'Loki', 'Monstro II', 'Reap Creep', 'Sisters Vis', 'The Cage', 'The Fallen', 'The Gate', 'The Headless Horseman', 'War' }
mod.mausoleumBossOptions = { 'The Heretic', 'The Siren'  }
mod.gehennaBossOptions = { 'Horny Boys', 'The Visage' }
mod.wombBossOptions = { 'Blastocyst', 'Conquest', 'Death', 'Lokii', 'Mama Gurdy', 'Mr. Fred', 'Scolex', 'The Fallen', 'The Headless Horseman', 'The Matriarch' }
mod.uteroBossOptions = { 'Conquest', 'Daddy Long Legs', 'Death', 'Lokii', 'Teratoma', 'The Bloat', 'The Fallen', 'The Headless Horseman', 'Triachnid' }
mod.scarredWombBossOptions = { 'Blastocyst', 'Conquest', 'Death', 'Lokii', 'Mama Gurdy', 'Mr. Fred', 'Scolex', 'The Fallen', 'The Headless Horseman', 'The Matriarch', 'Triachnid' }
mod.corpseBossOptions = { 'Chimera', 'Rotgut', 'The Scourge' }
mod.speedOptions = { -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0 }
mod.tearsOptions = { -50.0, -45.0, -40.0, -35.0, -30.0, -25.0, -20.0, -15.0, -10.0, -9.5, -9.0, -8.5, -8.0, -7.5, -7.0, -6.5, -6.0, -5.5, -5.0, -4.5, -4.0, -3.5, -3.0, -2.5, -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0 }
mod.damageOptions = { -50.0, -45.0, -40.0, -35.0, -30.0, -25.0, -20.0, -15.0, -10.0, -9.5, -9.0, -8.5, -8.0, -7.5, -7.0, -6.5, -6.0, -5.5, -5.0, -4.5, -4.0, -3.5, -3.0, -2.5, -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0 }
mod.rangeOptions = { -5.0, -4.5, -4.0, -3.5, -3.0, -2.5, -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0 }
mod.shotSpeedOptions = { -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0 }
mod.luckOptions = { -50.0, -45.0, -40.0, -35.0, -30.0, -25.0, -20.0, -15.0, -10.0, -9.5, -9.0, -8.5, -8.0, -7.5, -7.0, -6.5, -6.0, -5.5, -5.0, -4.5, -4.0, -3.5, -3.0, -2.5, -2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0 }
mod.itemOptions = { 'The Polaroid', 'The Negative', 'Key Piece 1', 'Key Piece 2', 'Knife Piece 1', 'Knife Piece 2', '0 - The Fool', 'V - The Hierophant', 'V - The Hierophant?', 'VI - The Lovers', 'VIII - Justice', 'Holy Card', 'Rune of Ansuz', 'Cracked Key' }
mod.debugOptions = { 'Infinite HP' }

mod.stage11Option = 1
mod.stage11AltOption = 1
mod.stage12Option = 1
mod.stage12AltOption = 1
mod.stage21Option = 1
mod.stage21AltOption = 1
mod.stage22Option = 1
mod.stage22AltOption = 1
mod.stage31Option = 1
mod.stage31AltOption = 1
mod.stage32Option = 1
mod.stage32AltOption = 1
mod.stage41Option = 1
mod.stage41AltOption = 1
mod.stage42Option = 1
mod.stage42AltOption = 1
mod.stage43Option = 1
mod.stage5Option = 1
mod.stage6Option = 1
mod.stage7Option = 1
mod.stage8Option = 1
mod.greedStage1Option = 1
mod.greedStage1AltOption = 1
mod.greedStage2Option = 1
mod.greedStage2AltOption = 1
mod.greedStage3Option = 1
mod.greedStage3AltOption = 1
mod.greedStage4Option = 1
mod.greedStage4AltOption = 1
mod.greedStage5Option = 1
mod.greedStage6Option = 1
mod.greedStage7Option = 1
mod.restartGameOption = 1
mod.restartLevelOption = 1
mod.seedCharOption = { 1, 1, 1, 1, 1, 1, 1, 1 }
mod.mainDimensionOption = 1
mod.mirrorDimensionOption = 1
mod.deathCertDimensionOption = 1
mod.basementBossOption = 1
mod.cellarBossOption = 1
mod.burningBasementBossOption = 1
mod.downpourBossOption = 1
mod.drossBossOption = 1
mod.cavesBossOption = 1
mod.catacombsBossOption = 1
mod.floodedCavesBossOption = 1
mod.minesBossOption = 1
mod.ashpitBossOption = 1
mod.depthsBossOption = 1
mod.necropolisBossOption = 1
mod.dankDepthsBossOption = 1
mod.mausoleumBossOption = 1
mod.gehennaBossOption = 1
mod.wombBossOption = 1
mod.uteroBossOption = 1
mod.scarredWombBossOption = 1
mod.corpseBossOption = 1
mod.speedOption = 11
mod.tearsOption = 29
mod.damageOption = 29
mod.rangeOption = 11
mod.shotSpeedOption = 11
mod.luckOption = 29
mod.itemOption = 1
mod.debugOption = 1

mod.customStages = {}

mod.forceXL = nil -- 3 state: true, false, nil
mod.showLevelName = false
mod.toggleText = ''
mod.toggleTextTime = 0

mod.state = {}
mod.state.autoReseed = true

function mod:onGameStart()
  mod:setupCustomStages()
  mod:setupModConfigMenu()
  
  if mod:HasData() then
    local _, state = pcall(json.decode, mod:LoadData())
    
    if type(state) == 'table' then
      if type(state.autoReseed) == 'boolean' then
        mod.state.autoReseed = state.autoReseed
      end
    end
  end
  
  local seeds = game:GetSeeds()
  local seed = seeds:GetStartSeedString()
  mod:setSeed(seed)
end

function mod:onGameExit()
  mod.speedOption = 11
  mod.tearsOption = 29
  mod.damageOption = 29
  mod.rangeOption = 11
  mod.shotSpeedOption = 11
  mod.luckOption = 29
  
  mod.forceXL = nil
  mod.showLevelName = false
  mod.toggleText = ''
  mod.toggleTextTime = 0
  
  mod:seedRng()
  mod:save()
end

function mod:save()
  mod:SaveData(json.encode(mod.state))
end

function mod:onCurseEval(curses)
  if mod.forceXL == true then
    mod.forceXL = nil
    return curses | LevelCurse.CURSE_OF_LABYRINTH
  elseif mod.forceXL == false then
    mod.forceXL = nil
    return curses & ~LevelCurse.CURSE_OF_LABYRINTH
  end
  
  return nil -- return nil if no changes are required
end

function mod:onNewLevel()
  if mod.showLevelName then
    local hud = game:GetHUD()
    local level = game:GetLevel()
    local levelName = (StageAPI and StageAPI.Loaded and StageAPI.GetCurrentStageDisplayName()) and StageAPI.GetCurrentStageDisplayName() or level:GetName()
    local curseName = level:GetCurseName()
    
    -- not supported natively by the game
    if game:IsGreedMode() and level:GetStage() == LevelStage.STAGE5_GREED and level:GetStageType() == StageType.STAGETYPE_WOTL then
      levelName = 'Cathedral'
    end
    
    if curseName ~= '' then
      hud:ShowItemText(levelName, curseName, true)
    else
      hud:ShowItemText(levelName, nil, false)
    end
    
    mod.showLevelName = false
  end
end

function mod:onNewRoom()
  local level = game:GetLevel()
  local room = level:GetCurrentRoom()
  
  if mod:isChallenge() and not game:IsGreedMode() and level:GetStage() == LevelStage.STAGE6 and level:GetCurrentRoomIndex() == level:GetStartingRoomIndex() and mod:getCurrentDimension() == 0 then
    room:TrySpawnMegaSatanRoomDoor(true)
  end
end

-- thanks to the Stat Change Commands mod for help figuring some of this out
function mod:onCacheEval(player, cacheFlag)
  if cacheFlag & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED then
    local speedAddition = mod.speedOptions[mod.speedOption]
    if speedAddition ~= 0.0 then
      local speed = player.MoveSpeed + speedAddition
      if speed > 2.0 then
        speed = 2.0
      elseif speed < 0.1 then
        speed = 0.1
      end
      player.MoveSpeed = speed
    end
  end
  
  if cacheFlag & CacheFlag.CACHE_FIREDELAY == CacheFlag.CACHE_FIREDELAY then
    local tearsAddition = mod.tearsOptions[mod.tearsOption]
    if tearsAddition ~= 0.0 then
      local tears = (30 / (player.MaxFireDelay + 1)) + tearsAddition
      if tears > 120.0 then
        tears = 120.0
      elseif tears < 1.0 then -- not a hard limit, but keep this above zero
        tears = 1.0
      end
      player.MaxFireDelay = (30 / tears) - 1
    end
  end
  
  if cacheFlag & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
    local damageAddition = mod.damageOptions[mod.damageOption]
    if damageAddition ~= 0.0 then
      local damage = player.Damage + damageAddition
      if damage < 0.5 then
        damage = 0.5
      end
      player.Damage = damage
    end
  end
  
  if cacheFlag & CacheFlag.CACHE_RANGE == CacheFlag.CACHE_RANGE then
    local rangeAddition = mod.rangeOptions[mod.rangeOption]
    if rangeAddition ~= 0.0 then
      local range = (player.TearRange / 40) + rangeAddition
      if range < 1.0 then
        range = 1.0
      end
      player.TearRange = range * 40
    end
  end
  
  if cacheFlag & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then
    local shotSpeedAddition = mod.shotSpeedOptions[mod.shotSpeedOption]
    if shotSpeedAddition ~= 0.0 then
      local shotSpeed = player.ShotSpeed + shotSpeedAddition
      if shotSpeed < 0.6 then
        shotSpeed = 0.6
      end
      player.ShotSpeed = shotSpeed
    end
  end
  
  if cacheFlag & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
    local luckAddition = mod.luckOptions[mod.luckOption]
    if luckAddition ~= 0.0 then
      player.Luck = player.Luck + luckAddition
    end
  end
end

-- usage: stage-selector basement i
-- usage: stage-selector-boss monstro
-- usage: stage-selector-restart
-- usage: stage-selector-seed dhgr j6pc
-- usage: stage-selector-reseed
-- usage: stage-selector-victory-lap
-- usage: stage-selector-dimension 0
function mod:onExecuteCmd(cmd, parameters)
  cmd = string.lower(cmd)
  
  if cmd == 'stage-selector' then
    local changedStage = false
    
    if game:IsGreedMode() then
      changedStage = mod:goToGreedStage(parameters)
      if not changedStage then
        changedStage = mod:goToModdedStage(parameters, true)
      end
    else
      changedStage = mod:goToStage(parameters)
      if not changedStage then
        changedStage = mod:goToModdedStage(parameters, true)
      end
    end
    
    if changedStage then
      print('Changed stage.') -- normal "stage" response
      return
    end
    
    print('"' .. parameters .. '" is not a valid stage.')
  elseif cmd == 'stage-selector-boss' then
    local changedRoom = false
    
    if game:IsGreedMode() then
      print('Disabled in greed mode.')
      return
    else
      changedRoom = mod:goToBoss(parameters, nil, nil)
    end
    
    if changedRoom then
      print('Changed room.') -- normal "goto" response
      return
    end
    
    print('"' .. parameters .. '" is not a valid boss.')
  elseif cmd == 'stage-selector-restart' then
    mod:restart()
    print('Restarted with random seed.')
  elseif cmd == 'stage-selector-seed' then
    local seed = string.upper(parameters)
    if string.len(seed) == 8 then
      seed = string.sub(seed, 1, 4) .. ' ' .. string.sub(seed, 5, 8) -- insert space
    end
    
    if string.len(seed) == 9 then
      local map = { ['I'] = '1', ['O'] = '0', ['U'] = 'V' }
      local temp = ''
      for i = 1, 9 do
        local c = string.sub(seed, i, i)
        local c2 = map[c]
        if c2 then
          c = c2
        end
        temp = temp .. c
      end
      seed = temp
      
      if Seeds.IsStringValidSeed(seed) then
        mod:seed(seed)
        print('Restarted with seed: ' .. seed)
        return
      end
    end
    
    print('"' .. parameters .. '" is not a valid seed.') -- normal "seed" response is "Invalid seed."
  elseif cmd == 'stage-selector-reseed' then
    mod:reseed(true)
    print('Changed stage.') -- normal "reseed" response
  elseif cmd == 'stage-selector-victory-lap' then
    if game:IsGreedMode() then
      print('Disabled in greed mode.')
    else
      mod:doVictoryLap()
      print('Kicked off victory lap #' .. game:GetVictoryLap())
    end
  elseif cmd == 'stage-selector-dimension' then
    local dimension = tonumber(parameters)
    local mirror = false
    
    if math.type(dimension) ~= 'integer' then
      local level = game:GetLevel()
      local stage = level:GetStage()
      local stageType = level:GetStageType()
      dimension = nil
      
      if StageAPI and StageAPI.CurrentStage and not StageAPI.CurrentStage.NormalStage and StageAPI.CurrentStage.LevelgenStage and not StageAPI.InTestMode then
        stage = StageAPI.CurrentStage.LevelgenStage.Stage
        stageType = StageAPI.CurrentStage.LevelgenStage.StageType
      end
      
      if string.lower(parameters) == 'mirror' and level:GetCurrentRoomIndex() >= 0 and
         (stage == LevelStage.STAGE1_2 or (mod:isCurseOfTheLabyrinth() and stage == LevelStage.STAGE1_1)) and (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B)
      then
        local temp = mod:getCurrentDimension()
        if temp == 0 then
          dimension = 1
        elseif temp == 1 then
          dimension = 0
        end
        mirror = true
      end
    end
    
    if mod:goToDimension(dimension, mirror) then
      print('Changed dimension.')
    else
      print('"' .. parameters .. '" is not valid in the current context.')
    end
  end
end

function mod:getSeedCharIndex(c)
  for i, v in ipairs(mod.seedCharOptions) do
    if c == v then
      return i
    end
  end
  
  return 0
end

function mod:constructSeed()
  local seed = ''
  for i = 1, 8 do
    seed = seed .. mod.seedCharOptions[mod.seedCharOption[i]]
    if i == 4 then
      seed = seed .. ' '
    end
  end
  
  return seed
end

function mod:setSeed(seed)
  if string.len(seed) == 9 and Seeds.IsStringValidSeed(seed) then
    for i = 1, 9 do
      if i ~= 5 then -- space
        local c = string.sub(seed, i, i)
        mod.seedCharOption[i <= 4 and i or i - 1] = mod:getSeedCharIndex(c)
      end
    end
  end
end

function mod:stage(stage, stageType, showLevelName, noAutoReseed)
  if not noAutoReseed and mod.state.autoReseed then
    local seeds = game:GetSeeds()
    if stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
      seeds:ForgetStageSeed(stage + 1)
    else
      seeds:ForgetStageSeed(stage)
    end
  end
  
  local letter = '' -- STAGETYPE_ORIGINAL
  if stageType == StageType.STAGETYPE_WOTL then
    letter = 'a'
  elseif stageType == StageType.STAGETYPE_AFTERBIRTH then
    letter = 'b'
  elseif stageType == StageType.STAGETYPE_REPENTANCE then
    letter = 'c'
  elseif stageType == StageType.STAGETYPE_REPENTANCE_B then
    letter = 'd'
  end
  
  mod.showLevelName = showLevelName
  Isaac.ExecuteCommand('stage ' .. stage .. letter)
end

function mod:reseed(showLevelName)
  mod.forceXL = mod:isCurseOfTheLabyrinth()
  mod.showLevelName = showLevelName
  game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
  
  if StageAPI and StageAPI.Loaded and StageAPI.CurrentStage then
    Isaac.ExecuteCommand('creseed')
  else
    Isaac.ExecuteCommand('reseed')
  end
end

function mod:restart()
  local seeds = game:GetSeeds()
  seeds:ClearStartSeed()
  Isaac.ExecuteCommand('restart')
end

function mod:seed(seed)
  Isaac.ExecuteCommand('seed ' .. seed)
end

function mod:doVictoryLap()
  game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, false)
  game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, false)
  game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
  game:NextVictoryLap()
end

function mod:isCurseOfTheLabyrinth()
  local level = game:GetLevel()
  local curses = level:GetCurses()
  local curse = LevelCurse.CURSE_OF_LABYRINTH
  
  return curses & curse == curse
end

function mod:goToStage(name)
  local stage, stageType
  local forceXL = false
  local mausoleumHeartKilled = false
  local backwardsPathInit = false
  local backwardsPath = false
  name = string.lower(name)
  
  if name == string.lower('Basement I') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Cellar I') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Burning Basement I') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Downpour I') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Dross I') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
  elseif name == string.lower('Basement XL') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = true
  elseif name == string.lower('Cellar XL') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = true
  elseif name == string.lower('Burning Basement XL') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = true
  elseif name == string.lower('Downpour XL') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = true
  elseif name == string.lower('Dross XL') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = true
  elseif name == string.lower('Basement I (Ascent)') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Cellar I (Ascent)') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Burning Basement I (Ascent)') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Downpour I (Ascent)') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Dross I (Ascent)') then
    stage = LevelStage.STAGE1_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Basement II') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Cellar II') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Burning Basement II') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Downpour II') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Dross II') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
  elseif name == string.lower('Basement II (Ascent)') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Cellar II (Ascent)') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Burning Basement II (Ascent)') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Downpour II (Ascent)') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Dross II (Ascent)') then
    stage = LevelStage.STAGE1_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Caves I') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Catacombs I') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Flooded Caves I') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Mines I') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Ashpit I') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
  elseif name == string.lower('Caves XL') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = true
  elseif name == string.lower('Catacombs XL') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = true
  elseif name == string.lower('Flooded Caves XL') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = true
  elseif name == string.lower('Mines XL') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = true
  elseif name == string.lower('Ashpit XL') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = true
  elseif name == string.lower('Caves I (Ascent)') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Catacombs I (Ascent)') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Flooded Caves I (Ascent)') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Mines I (Ascent)') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Ashpit I (Ascent)') then
    stage = LevelStage.STAGE2_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Caves II') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Catacombs II') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Flooded Caves II') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Mines II') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Ashpit II') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
  elseif name == string.lower('Caves II (Ascent)') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Catacombs II (Ascent)') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Flooded Caves II (Ascent)') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Mines II (Ascent)') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Ashpit II (Ascent)') then
    stage = LevelStage.STAGE2_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Depths I') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Necropolis I') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Dank Depths I') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Mausoleum I') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Gehenna I') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
  elseif name == string.lower('Depths XL') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = true
  elseif name == string.lower('Necropolis XL') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = true
  elseif name == string.lower('Dank Depths XL') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = true
  elseif name == string.lower('Mausoleum XL') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = true
  elseif name == string.lower('Gehenna XL') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = true
  elseif name == string.lower('Depths I (Ascent)') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Necropolis I (Ascent)') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Dank Depths I (Ascent)') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Mausoleum I (Ascent)') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Gehenna I (Ascent)') then
    stage = LevelStage.STAGE3_1
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Depths II') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Necropolis II') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Dank Depths II') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Mausoleum II') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Gehenna II') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
  elseif name == string.lower('Mausoleum II (PreAscent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_REPENTANCE
    backwardsPathInit = true
  elseif name == string.lower('Gehenna II (PreAscent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
    backwardsPathInit = true
  elseif name == string.lower('Depths II (Ascent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Necropolis II (Ascent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Dank Depths II (Ascent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Mausoleum II (Ascent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Gehenna II (Ascent)') then
    stage = LevelStage.STAGE3_2
    stageType = StageType.STAGETYPE_REPENTANCE_B
    forceXL = nil
    backwardsPath = true
  elseif name == string.lower('Womb I') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Utero I') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Scarred Womb I') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Corpse I') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('Womb XL') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = true
  elseif name == string.lower('Utero XL') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_WOTL
    forceXL = true
  elseif name == string.lower('Scarred Womb XL') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_AFTERBIRTH
    forceXL = true
  elseif name == string.lower('Corpse XL') then
    stage = LevelStage.STAGE4_1
    stageType = StageType.STAGETYPE_REPENTANCE
    forceXL = true
  elseif name == string.lower('Womb II') then
    stage = LevelStage.STAGE4_2
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Utero II') then
    stage = LevelStage.STAGE4_2
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Scarred Womb II') then
    stage = LevelStage.STAGE4_2
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Corpse II') then
    stage = LevelStage.STAGE4_2
    stageType = StageType.STAGETYPE_REPENTANCE
  elseif name == string.lower('???') then
    stage = LevelStage.STAGE4_3
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Sheol') then
    stage = LevelStage.STAGE5
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Cathedral') then
    stage = LevelStage.STAGE5
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Dark Room') then
    stage = LevelStage.STAGE6
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Chest') then
    stage = LevelStage.STAGE6
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('The Void') then
    stage = LevelStage.STAGE7
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Home') then
    stage = LevelStage.STAGE8
    stageType = StageType.STAGETYPE_ORIGINAL
    forceXL = nil
  elseif name == string.lower('Home (Alt)') then
    stage = LevelStage.STAGE8
    stageType = StageType.STAGETYPE_WOTL
    forceXL = nil
  end
  
  if stage and stageType then
    if backwardsPath then
      -- try and force treasure rooms to show up, you'll still need to have visited the level first
      game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, false)
      mod:stage(LevelStage.STAGE4_1, StageType.STAGETYPE_ORIGINAL, false, true) -- womb
    end
    
    mod.forceXL = forceXL
    game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, mausoleumHeartKilled)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, backwardsPathInit)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, backwardsPath)
    
    mod:stage(stage, stageType, true)
    
    return true
  end
  
  return false
end

function mod:goToGreedStage(name)
  local stage, stageType
  name = string.lower(name)
  
  if name == string.lower('Basement') then
    stage = LevelStage.STAGE1_GREED
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Cellar') then
    stage = LevelStage.STAGE1_GREED
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Burning Basement') then
    stage = LevelStage.STAGE1_GREED
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Downpour') then
    stage = LevelStage.STAGE1_GREED
    stageType = StageType.STAGETYPE_REPENTANCE -- doesn't show in the debug console, but works
  elseif name == string.lower('Dross') then
    stage = LevelStage.STAGE1_GREED
    stageType = StageType.STAGETYPE_REPENTANCE_B -- doesn't show in the debug console, but works
  elseif name == string.lower('Caves') then
    stage = LevelStage.STAGE2_GREED
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Catacombs') then
    stage = LevelStage.STAGE2_GREED
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Flooded Caves') then
    stage = LevelStage.STAGE2_GREED
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Mines') then
    stage = LevelStage.STAGE2_GREED
    stageType = StageType.STAGETYPE_REPENTANCE -- doesn't show in the debug console, but works
  elseif name == string.lower('Asphit') then
    stage = LevelStage.STAGE2_GREED
    stageType = StageType.STAGETYPE_REPENTANCE_B -- doesn't show in the debug console, but works
  elseif name == string.lower('Depths') then
    stage = LevelStage.STAGE3_GREED
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Necropolis') then
    stage = LevelStage.STAGE3_GREED
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Dank Depths') then
    stage = LevelStage.STAGE3_GREED
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Mausoleum') then
    stage = LevelStage.STAGE3_GREED
    stageType = StageType.STAGETYPE_REPENTANCE -- doesn't show in the debug console, but works
  elseif name == string.lower('Gehenna') then
    stage = LevelStage.STAGE3_GREED
    stageType = StageType.STAGETYPE_REPENTANCE_B -- doesn't show in the debug console, but works
  elseif name == string.lower('Womb') then
    stage = LevelStage.STAGE4_GREED
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Utero') then
    stage = LevelStage.STAGE4_GREED
    stageType = StageType.STAGETYPE_WOTL
  elseif name == string.lower('Scarred Womb') then
    stage = LevelStage.STAGE4_GREED
    stageType = StageType.STAGETYPE_AFTERBIRTH
  elseif name == string.lower('Corpse') then
    stage = LevelStage.STAGE4_GREED
    stageType = StageType.STAGETYPE_REPENTANCE -- doesn't show in the debug console, but works
  elseif name == string.lower('Sheol') then
    stage = LevelStage.STAGE5_GREED
    stageType = StageType.STAGETYPE_ORIGINAL -- the debug console lists 5a and 5b, but they're also sheol
  elseif name == string.lower('Cathedral') then
    stage = LevelStage.STAGE5_GREED
    stageType = StageType.STAGETYPE_WOTL -- requires The Cathedral in Greed Mode, otherwise falls back to Sheol
  elseif name == string.lower('The Shop') then
    stage = LevelStage.STAGE6_GREED
    stageType = StageType.STAGETYPE_ORIGINAL
  elseif name == string.lower('Ultra Greed') then
    stage = LevelStage.STAGE7_GREED
    stageType = StageType.STAGETYPE_ORIGINAL
  end
  
  if stage and stageType then
    mod:stage(stage, stageType, false, true)
    mod:stage(stage, stageType, true) -- better Alt path in Greed Mode support
    
    return true
  end
  
  return false
end

function mod:goToModdedStage(nameOrDisplayName, isDisplayName)
  if not StageAPI or not StageAPI.Loaded then
    return false
  end
  
  local name = nil
  local forceXL = false
  nameOrDisplayName = string.lower(nameOrDisplayName)
  
  for _, v in ipairs(mod.customStages) do
    for _, w in ipairs(v.stages) do
      if (not isDisplayName and nameOrDisplayName == string.lower(w.name)) or
         (    isDisplayName and nameOrDisplayName == string.lower(w.displayName))
      then
        name = w.name
        forceXL = w.isXL
        break
      end
    end
    if name then
      break
    end
  end
  
  if name then
    mod.forceXL = forceXL
    game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, false)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, false)
    
    mod.showLevelName = true
    StageAPI.GotoCustomStage(StageAPI.CustomStages[name], false, not mod.state.autoReseed)
    
    return true
  end
  
  return false
end

function mod:setupCustomStages()
  if not StageAPI or not StageAPI.Loaded then
    return
  end
  
  -- stage api currently supports overwriting: catacombs, necropolis, utero
  -- it also sets up some default custom stages that we can ignore
  local ignoreList = {
    'Catacombs' , 'Catacombs 2' , 'Catacombs XL' , 'Catacombs Greed',
    'Necropolis', 'Necropolis 2', 'Necropolis XL', 'Necropolis Greed',
    'Utero'     , 'Utero 2'     , 'Utero XL'     , 'Utero Greed'
  }
  
  local stages = {}
  
  for name, v in pairs(StageAPI.CustomStages) do
    if not mod:tableHasValue(ignoreList, name) and v.Replaces then
      local title = nil
      
      -- v.StageNumber appears to be arbitrary, deals w/ scaling health
      -- the level might be generated with v.LevelgenStage
      -- but the game will report that it's the v.Replaces stage
      local stage = v.Replaces.OverrideStage
      local stageType = v.Replaces.OverrideStageType
      if v.LevelgenStage then
        stage = v.LevelgenStage.Stage
        stageType = v.LevelgenStage.StageType
      end
      
      if game:IsGreedMode() then
        if v.Replaces.GreedMode then
          if stage == LevelStage.STAGE1_GREED then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 1 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 1 (Alt)'
            end
          elseif stage == LevelStage.STAGE2_GREED then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 2 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 2 (Alt)'
            end
          elseif stage == LevelStage.STAGE3_GREED then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 3 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 3 (Alt)'
            end
          elseif stage == LevelStage.STAGE4_GREED then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 4 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 4 (Alt)'
            end
          elseif stage == LevelStage.STAGE5_GREED then
            title = 'Stage 5'
          elseif stage == LevelStage.STAGE6_GREED then
            title = 'Stage 6'
          elseif stage == LevelStage.STAGE7_GREED then
            title = 'Stage 7'
          end
        end
      else
        -- glacier i/ii is mapped to 1-2/2-1 for levelgen
        if not v.Replaces.GreedMode then
          if stage == LevelStage.STAGE1_1 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 1-1 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 1-1 (Alt)'
            end
          elseif stage == LevelStage.STAGE1_2 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 1-2 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 1-2 (Alt)'
            end
          elseif stage == LevelStage.STAGE2_1 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 2-1 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 2-1 (Alt)'
            end
          elseif stage == LevelStage.STAGE2_2 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 2-2 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 2-2 (Alt)'
            end
          elseif stage == LevelStage.STAGE3_1 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 3-1 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 3-1 (Alt)'
            end
          elseif stage == LevelStage.STAGE3_2 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 3-2 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 3-2 (Alt)'
            end
          elseif stage == LevelStage.STAGE4_1 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 4-1 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 4-1 (Alt)'
            end
          elseif stage == LevelStage.STAGE4_2 then
            if stageType == StageType.STAGETYPE_ORIGINAL or stageType == StageType.STAGETYPE_WOTL or stageType == StageType.STAGETYPE_AFTERBIRTH then
              title = 'Stage 4-2 (Main)'
            elseif stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
              title = 'Stage 4-2 (Alt)'
            end
          elseif stage == LevelStage.STAGE4_3 then
            title = 'Stage 4-3'
          elseif stage == LevelStage.STAGE5 then
            title = 'Stage 5'
          elseif stage == LevelStage.STAGE6 then
            title = 'Stage 6'
          elseif stage == LevelStage.STAGE7 then
            title = 'Stage 7'
          elseif stage == LevelStage.STAGE8 then
            title = 'Stage 8'
          end
        end
      end
      
      if title then
        if not stages[title] then
          stages[title] = {}
        end
        if not stages[title][name] then -- v.Name
          stages[title][name] = {}
        end
        stages[title][name].displayName = v.DisplayName or name
        stages[title][name].isXL = stages[title][name].isXL or false
        stages[title][name].supportsXL = stages[title][name].supportsXL or false
        
        if v.XLStage and v.XLStage.Name and not mod:tableHasValue(ignoreList, v.XLStage.Name) then
          if not stages[title][v.XLStage.Name] then
            stages[title][v.XLStage.Name] = {}
          end
          stages[title][v.XLStage.Name].displayName = v.XLStage.DisplayName or v.XLStage.Name
          stages[title][v.XLStage.Name].isXL = true
          stages[title][v.XLStage.Name].supportsXL = stages[title][name].isXL and stages[title][name].supportsXL or not v.IsSecondStage
        end
      end
    end
  end
  
  mod.customStages = mod:sortCustomStages(stages)
end

function mod:sortCustomStages(unsorted)
  local function sortTopLevel(a, b)
    return a.title < b.title
  end
  local function sortStages(a, b)
    -- sort XL to the end
    if a.isXL ~= b.isXL then
      return b.isXL -- not a.isXL
    end
    return a.displayName < b.displayName
  end
  
  local sorted = {}
  
  for title, v in pairs(unsorted) do
    local stages = {}
    for name, w in pairs(v) do
      if not w.isXL or (w.isXL and w.supportsXL) then
        table.insert(stages, { name = name, displayName = w.displayName, isXL = w.isXL })
      end
    end
    if #stages > 0 then
      table.sort(stages, sortStages)
      table.insert(sorted, { title = title, selectedStage = 1, stages = stages })
    end
  end
  
  table.sort(sorted, sortTopLevel)
  return sorted
end

function mod:goToDimension(dimension, mirror)
  local level = game:GetLevel()
  local stage = level:GetStage()
  local stageType = level:GetStageType()
  local isCurse = mod:isCurseOfTheLabyrinth()
  local isBackwardsPath = game:GetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH)
  local currentDimension = mod:getCurrentDimension()
  
  -- StageAPI.GetCurrentStage()
  if StageAPI and StageAPI.CurrentStage and not StageAPI.CurrentStage.NormalStage and StageAPI.CurrentStage.LevelgenStage and not StageAPI.InTestMode then
    stage = StageAPI.CurrentStage.LevelgenStage.Stage
    stageType = StageAPI.CurrentStage.LevelgenStage.StageType
  end
  
  if dimension == 0 then
    if mirror then
      if not game:IsGreedMode() and not isBackwardsPath and level:GetCurrentRoomIndex() >= 0 and (currentDimension == 0 or currentDimension == 1) and
         (stage == LevelStage.STAGE1_2 or (isCurse and stage == LevelStage.STAGE1_1)) and (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B)
      then
        mod:goToRoom(level:GetCurrentRoomIndex(), dimension)
        return true
      end
    else
      if not game:IsGreedMode() and isBackwardsPath and stage >= LevelStage.STAGE1_1 and stage <= LevelStage.STAGE3_2 then
        -- you start in the boss room in the ascent
        local lastBossRoom = level:GetRooms():Get(level:GetLastBossRoomListIndex())
        if lastBossRoom and lastBossRoom.SafeGridIndex >= 0 then
          mod:goToRoom(lastBossRoom.SafeGridIndex, dimension)
          return true
        end
      else
        mod:goToRoom(level:GetStartingRoomIndex(), dimension)
        return true
      end
    end
  elseif dimension == 1 then
    if not game:IsGreedMode() and not isBackwardsPath then
      if (stage == LevelStage.STAGE1_2 or (isCurse and stage == LevelStage.STAGE1_1)) and (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B) then
        if mirror then
          if level:GetCurrentRoomIndex() >= 0 and (currentDimension == 0 or currentDimension == 1) then
            mod:goToRoom(level:GetCurrentRoomIndex(), dimension)
            return true
          end
        else
          mod:goToRoom(level:GetStartingRoomIndex(), dimension)
          return true
        end
      elseif (stage == LevelStage.STAGE2_2 or (isCurse and stage == LevelStage.STAGE2_1)) and (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B) then
        if not mirror then
          -- you can still access the mines escape sequence even if the entrance hasn't spawned
          -- however, if you try to leave the escape sequence via the door, the game will crash
          mod:goToRoom(162, dimension)
          return true
        end
      end
    end
  elseif dimension == 2 then
    if not mirror then
      if currentDimension == dimension then
        mod:goToRoom(80, dimension)
      else
        -- can't go here directly, we need to make sure the game creates this dimension first
        local player = game:GetPlayer(0)
        player:UseActiveItem(CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, false, false, true, false, -1, 0)
      end
      return true
    end
  end
  
  return false
end

-- ChangeRoom is easier to use from here
-- StartRoomTransition would require hooking into onNewRoom, and could trigger a boss cutscene incorrectly
function mod:goToRoom(roomIdx, dimension)
  local level = game:GetLevel()
  local room = level:GetCurrentRoom()
  
  -- sometimes reloading the same room causes the game to crash, check for that case
  if level:GetCurrentRoomIndex() == roomIdx and (dimension == -1 or mod:getCurrentDimension() == dimension) then
    return
  end
  
  level.LeaveDoor = DoorSlot.NO_DOOR_SLOT
  game:ChangeRoom(roomIdx, dimension)
  
  -- when coming from another dimension, setting LeaveDoor doesn't seem to be reliable, so try again
  if level:GetCurrentRoomIndex() ~= roomIdx then
    level.LeaveDoor = DoorSlot.NO_DOOR_SLOT
    game:ChangeRoom(roomIdx, dimension)
  end
  
  -- play boss animation if it's a boss room
  if room:GetType() == RoomType.ROOM_BOSS then
    game:StartRoomTransition(roomIdx, Direction.NO_DIRECTION, RoomTransitionAnim.FADE, nil, dimension)
  end
end

function mod:goToBoss(name, stage, stageType)
  local bossRooms
  name = string.lower(name)
  
  if name == string.lower('The Duke of Flies') then
    bossRooms = { '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018' }
  elseif name == string.lower('Famine') then
    bossRooms = { '4010', '4012', '4013', '4014' }
  elseif name == string.lower('Little Horn') then
    bossRooms = { '1088', '1089', '1095', '1096' }
  elseif name == string.lower('Baby Plum') then
    bossRooms = { '5160', '5161', '5162', '5163', '5164', '5165', }
  elseif name == string.lower('Monstro') then
    bossRooms = { '1010', '1011', '1012', '1013', '1014', '1015', '1016', '1017', '1018', '1037', '1038', '1039', '1045', '1123' }
  elseif name == string.lower('Gemini') then
    bossRooms = { '2050', '2051', '2052', '2053' }
  elseif name == string.lower('Steven') then
    bossRooms = { '2070', '2071', '2072', '2073' }
  elseif name == string.lower('Larry Jr.') then
    bossRooms = { '1020', '1021', '1022', '1023', '1024', '1025', '1026', '1027', '1028', '1046', '1047', '1048', '1049', '1124', '1125' }
  elseif name == string.lower('Dingle') then
    bossRooms = { '5020', '5021', '5022', '5023', '5024', '5025' }
  elseif name == string.lower('Dangle') then
    bossRooms = { '1117', '1118', '1119', '1120', '1121' }
  elseif name == string.lower('Gurglings') then
    bossRooms = { '5140', '5141', '5142', '5143', '5144' }
  elseif name == string.lower('Turdlings') then
    bossRooms = { '5146', '5147', '5148', '5149', '5150', '5151' }
  elseif name == string.lower('The Headless Horseman') then
    bossRooms = { '4050', '4051', '4052' }
  elseif name == string.lower('Blighted Ovum') then
    bossRooms = { '3320', '3321', '3322', '3323' }
  elseif name == string.lower('Widow') then
    bossRooms = { '3340', '3341', '3342', '3343', '3344', '3345' }
  elseif name == string.lower('Pin') then
    bossRooms = { '3370', '3371', '3372', '3373', '3374', '3375', '3376', '3377', '3378' }
  elseif name == string.lower('The Haunt') then
    bossRooms = { '5010', '5011', '5012', '5013', '5014' }
  elseif name == string.lower('Rag Man') then
    bossRooms = { '1019', '1029', '1035', '1036', '1128', '1129' }
  elseif name == string.lower('Wormwood') then
    bossRooms = { '5180', '5181', '5182', '5183', '5184' }
  elseif name == string.lower('Lil Blub') then
    bossRooms = { '5170', '5171', '5172', '5173', '5174', '5175' }
  elseif name == string.lower('The Rainmaker') then
    bossRooms = { '5230', '5231', '5232' }
  elseif name == string.lower('Min-Min') then
    bossRooms = { '5280', '5281', '5282' }
  elseif name == string.lower('Clog)') then
    bossRooms = { '5190', '5191', '5192', '5193', '5194' }
  elseif name == string.lower('Colostomia') then
    bossRooms = { '5330' }
  elseif name == string.lower('Turdlet') then
    bossRooms = { '5320', '5321', '5322' }
  elseif name == string.lower('Peep') then
    bossRooms = { '2020', '2021', '2022', '2023', '2024', '2025' }
  elseif name == string.lower('Gurdy Jr.') then
    bossRooms = { '3280', '3281', '3282', '3283' }
  elseif name == string.lower('Pestilence') then
    bossRooms = { '4020', '4021', '4022' }
  elseif name == string.lower('Rag Mega') then
    bossRooms = { '3398', '3399', '3404', '3405' }
  elseif name == string.lower('Big Horn') then
    bossRooms = { '3394', '3395', '3396', '3397' }
  elseif name == string.lower('Bumbino') then
    bossRooms = { '5270', '5271', '5272', '5273', '5274' }
  elseif name == string.lower('Bumbino') then
    bossRooms = { '5270', '5271', '5272', '5273', '5274' }
  elseif name == string.lower('Chub') then
    bossRooms = { '1030', '1031', '1032', '1033', '1034', '1055', '1056', '1057', '1126', '1127' }
  elseif name == string.lower('C.H.A.D.') then
    bossRooms = { '1100', '1101', '1102', '1103', '1104' }
  elseif name == string.lower('Gurdy') then
    bossRooms = { '1040', '1041', '1042', '1043', '1044', '1058', '1059', '1065', '1066', '1130', '1131' }
  elseif name == string.lower('Fistula') then
    bossRooms = { '2060', '2061', '2062', '2063', '2064' }
  elseif name == string.lower('Mega Maw') then
    bossRooms = { '5030', '5031', '5032', '5033', '5034' }
  elseif name == string.lower('Mega Fatty') then
    bossRooms = { '5050', '5051', '5052', '5054' }
  elseif name == string.lower('The Stain') then
    bossRooms = { '1106', '1107', '1108', '1109', '1115' }
  elseif name == string.lower('Carrion Queen') then
    bossRooms = { '3270', '3271', '3272', '3273' }
  elseif name == string.lower('The Hollow') then
    bossRooms = { '3260', '3261', '3262', '3263', '3264', '3265', '3266' }
  elseif name == string.lower('The Husk') then
    bossRooms = { '3290', '3291', '3292', '3293', '3294', '3295' }
  elseif name == string.lower('The Wretched') then
    bossRooms = { '3360', '3361', '3362', '3363' }
  elseif name == string.lower('Polycephalus') then
    bossRooms = { '5100', '5101', '5102', '5103', '5104', '5106' }
  elseif name == string.lower('Dark One') then
    bossRooms = { '5080', '5081', '5082', '5083', '5084' }
  elseif name == string.lower('The Frail') then
    bossRooms = { '3384', '3385', '3386', '3387', '3388', '3389' }
  elseif name == string.lower('The Forsaken') then
    bossRooms = { '1079', '1085', '1086', '1087' }
  elseif name == string.lower('Great Gideon') then
    bossRooms = { '5210', '5211', '5212', '5213', '5214' }
  elseif name == string.lower('Great Gideon') then
    bossRooms = { '5210', '5211', '5212', '5213', '5214' }
  elseif name == string.lower('Tuff Twins') then
    bossRooms = { '5200', '5201', '5202', '5203', '5204', '5205', '5206', '5207' }
  elseif name == string.lower('Reap Creep') then
    bossRooms = { '5250', '5251', '5252', '5253', '5254', '5256' }
  elseif name == string.lower('Hornfel') then
    bossRooms = { '5220', '5221', '5222', '5224', '5225', '5226', '5228', '5229' }
  elseif name == string.lower('The Shell') then
    bossRooms = { '5310', '5311', '5312', '5313' }
  elseif name == string.lower('The Pile') then
    bossRooms = { '5240', '5241', '5242', '5244' }
  elseif name == string.lower('Singe') then
    bossRooms = { '5260', '5261', '5262', '5263', '5264' }
  elseif name == string.lower('Clutch') then
    bossRooms = { '6020', '6021', '6022' }
  elseif name == string.lower('The Fallen') then
    bossRooms = { '3500', '3501', '3502' }
  elseif name == string.lower('Loki') then
    bossRooms = { '2030', '2031', '2032', '2033' }
  elseif name == string.lower('War') then
    bossRooms = { '4030', '4034', '4035' }
  elseif name == string.lower('Brownie') then
    bossRooms = { '1097', '1098', '1099', '1105', '1116' }
  elseif name == string.lower('Sisters Vis') then
    bossRooms = { '3406', '3407', '3408', '3409' }
  elseif name == string.lower('Monstro II') then
    bossRooms = { '1050', '1051', '1052', '1053', '1054', '1067', '1068', '1069', '1076' }
  elseif name == string.lower('Gish') then
    bossRooms = { '1110', '1111', '1112', '1113', '1114' }
  elseif name == string.lower('The Cage') then
    bossRooms = { '5060', '5061', '5062', '5063', '5064' }
  elseif name == string.lower('The Gate') then
    bossRooms = { '5040', '5041', '5042', '5044', '5045' }
  elseif name == string.lower('The Bloat') then
    bossRooms = { '3300', '3301', '3302', '3303' }
  elseif name == string.lower('Mask of Infamy') then
    bossRooms = { '3350', '3351', '3352', '3353' }
  elseif name == string.lower('The Adversary') then
    bossRooms = { '5090', '5091', '5092', '5093', '5094' }
  elseif name == string.lower('The Siren') then
    bossRooms = { '5370', '5371', '5372' }
  elseif name == string.lower('The Heretic') then
    bossRooms = { '5290', '5291', '5292', '5293' }
  elseif name == string.lower('The Visage') then
    bossRooms = { '5300', '5301' }
  elseif name == string.lower('Horny Boys') then
    bossRooms = { '6010', '6011', '6012' }
  elseif name == string.lower('Lokii') then
    bossRooms = { '3310', '3311', '3312', '3313' }
  elseif name == string.lower('Death') then
    bossRooms = { '4040', '4041', '4042' }
  elseif name == string.lower('Conquest') then
    bossRooms = { '4031', '4032', '4033' }
  elseif name == string.lower('Scolex') then
    bossRooms = { '1070', '1071', '1072', '1073', '1074', '1075' }
  elseif name == string.lower('Blastocyst') then
    bossRooms = { '2040', '2041', '2042', '2043' }
  elseif name == string.lower('Mama Gurdy') then
    bossRooms = { '5070', '5071', '5072' }
  elseif name == string.lower('Mr. Fred') then
    bossRooms = { '5110', '5111', '5113' }
  elseif name == string.lower('Teratoma') then
    bossRooms = { '3330', '3331', '3332', '3333' }
  elseif name == string.lower('Daddy Long Legs') then
    bossRooms = { '3400', '3401', '3402', '3403' }
  elseif name == string.lower('Triachnid') then
    bossRooms = { '3410', '3411', '3412', '3413' }
  elseif name == string.lower('The Matriarch') then
    bossRooms = { '5152', '5153', '5154', '5155' }
  elseif name == string.lower('The Scourge') then
    bossRooms = { '5360', '5361', '5362' }
  elseif name == string.lower('Chimera') then
    bossRooms = { '5350', '5351', '5352' }
  elseif name == string.lower('Rotgut') then
    bossRooms = { '5340' }
  end
  
  if bossRooms then
    if stage and stageType then
      mod.forceXL = false
      game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
      game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, false)
      game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, false)
      
      mod:stage(stage, stageType, false)
    end
    
    local bossRoom = bossRooms[mod.rng:RandomInt(#bossRooms) + 1]
    Isaac.ExecuteCommand('goto s.boss.' .. bossRoom)
    
    return true
  end
  
  return false
end

function mod:giveItem(name)
  local player = game:GetPlayer(0)
  
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
  elseif name == '0 - The Fool' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_FOOL, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'V - The Hierophant' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_HIEROPHANT, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'V - The Hierophant?' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_REVERSE_HIEROPHANT, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'VI - The Lovers' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_LOVERS, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'VIII - Justice' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_JUSTICE, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'Holy Card' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_HOLY, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'Rune of Ansuz' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.RUNE_ANSUZ, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
  elseif name == 'Cracked Key' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_CRACKED_KEY, Isaac.GetFreeNearPosition(player.Position, 3), Vector.Zero, nil)
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
  end
end

function mod:getCurrentDimension()
  local level = game:GetLevel()
  return mod:getDimension(level:GetCurrentRoomDesc())
end

function mod:getDimension(roomDesc)
  local level = game:GetLevel()
  local ptrHash = GetPtrHash(roomDesc)
  
  -- 0: main dimension
  -- 1: secondary dimension, used by downpour mirror dimension and mines escape sequence
  -- 2: death certificate dimension
  for i = 0, 2 do
    if ptrHash == GetPtrHash(level:GetRoomByIdx(roomDesc.SafeGridIndex, i)) then
      return i
    end
  end
  
  return -1
end

function mod:tableHasValue(tbl, val)
  for _, v in ipairs(tbl) do
    if v == val then
      return true
    end
  end
  
  return false
end

function mod:seedRng()
  repeat
    local rand = Random()  -- 0 to 2^32
    if rand > 0 then       -- if this is 0, it causes a crash later on
      mod.rng:SetSeed(rand, mod.rngShiftIndex)
    end
  until(rand > 0)
end

function mod:isChallenge()
  local challenge = Isaac.GetChallenge()
  return challenge == Isaac.GetChallengeIdByName('Stage Selector (Normal)') or
         challenge == Isaac.GetChallengeIdByName('Stage Selector (Hard)') or
         challenge == Isaac.GetChallengeIdByName('Stage Selector (Greed)') or
         challenge == Isaac.GetChallengeIdByName('Stage Selector (Greedier)')
end

-- start ModConfigMenu --
function mod:setupModConfigMenu()
  if ModConfigMenu == nil then
    return
  end
  
  for _, v in ipairs({ 'Stages', 'Mods', 'Restart', 'Seed', 'Dimensions', 'Bosses', 'Stats', 'Misc', 'Settings' }) do
    ModConfigMenu.RemoveSubcategory(mod.Name, v)
  end
  local stages
  if game:IsGreedMode() then
    stages = {
               { title = 'Stage 1 (Main)', options = 'greedStage1Options'   , option = 'greedStage1Option' },
               { title = 'Stage 1 (Alt)' , options = 'greedStage1AltOptions', option = 'greedStage1AltOption' },
               { title = 'Stage 2 (Main)', options = 'greedStage2Options'   , option = 'greedStage2Option' },
               { title = 'Stage 2 (Alt)' , options = 'greedStage2AltOptions', option = 'greedStage2AltOption' },
               { title = 'Stage 3 (Main)', options = 'greedStage3Options'   , option = 'greedStage3Option' },
               { title = 'Stage 3 (Alt)' , options = 'greedStage3AltOptions', option = 'greedStage3AltOption' },
               { title = 'Stage 4 (Main)', options = 'greedStage4Options'   , option = 'greedStage4Option' },
               { title = 'Stage 4 (Alt)' , options = 'greedStage4AltOptions', option = 'greedStage4AltOption' },
               { title = 'Stage 5'       , options = 'greedStage5Options'   , option = 'greedStage5Option' },
               { title = 'Stage 6'       , options = 'greedStage6Options'   , option = 'greedStage6Option' },
               { title = 'Stage 7'       , options = 'greedStage7Options'   , option = 'greedStage7Option' }
             }
  else
    stages = {
               { title = 'Stage 1-1 (Main)', options = 'stage11Options'   , option = 'stage11Option' },
               { title = 'Stage 1-1 (Alt)' , options = 'stage11AltOptions', option = 'stage11AltOption' },
               { title = 'Stage 1-2 (Main)', options = 'stage12Options'   , option = 'stage12Option' },
               { title = 'Stage 1-2 (Alt)' , options = 'stage12AltOptions', option = 'stage12AltOption' },
               { title = 'Stage 2-1 (Main)', options = 'stage21Options'   , option = 'stage21Option' },
               { title = 'Stage 2-1 (Alt)' , options = 'stage21AltOptions', option = 'stage21AltOption' },
               { title = 'Stage 2-2 (Main)', options = 'stage22Options'   , option = 'stage22Option' },
               { title = 'Stage 2-2 (Alt)' , options = 'stage22AltOptions', option = 'stage22AltOption' },
               { title = 'Stage 3-1 (Main)', options = 'stage31Options'   , option = 'stage31Option' },
               { title = 'Stage 3-1 (Alt)' , options = 'stage31AltOptions', option = 'stage31AltOption' },
               { title = 'Stage 3-2 (Main)', options = 'stage32Options'   , option = 'stage32Option' },
               { title = 'Stage 3-2 (Alt)' , options = 'stage32AltOptions', option = 'stage32AltOption' },
               { title = 'Stage 4-1 (Main)', options = 'stage41Options'   , option = 'stage41Option' },
               { title = 'Stage 4-1 (Alt)' , options = 'stage41AltOptions', option = 'stage41AltOption' },
               { title = 'Stage 4-2 (Main)', options = 'stage42Options'   , option = 'stage42Option' },
               { title = 'Stage 4-2 (Alt)' , options = 'stage42AltOptions', option = 'stage42AltOption' },
               { title = 'Stage 4-3'       , options = 'stage43Options'   , option = 'stage43Option' },
               { title = 'Stage 5'         , options = 'stage5Options'    , option = 'stage5Option' },
               { title = 'Stage 6'         , options = 'stage6Options'    , option = 'stage6Option' },
               { title = 'Stage 7'         , options = 'stage7Options'    , option = 'stage7Option' },
               { title = 'Stage 8'         , options = 'stage8Options'    , option = 'stage8Option' }
             }
  end
  for i, v in ipairs(stages) do
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
          return mod[v.option]
        end,
        Minimum = 1,
        Maximum = #mod[v.options],
        Display = function()
          return '< ' .. mod[v.options][mod[v.option]] .. ' >'
        end,
        OnChange = function(n)
          mod[v.option] = n
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
          return 'Go!'
        end,
        OnChange = function(b)
          if game:IsGreedMode() then
            mod:goToGreedStage(mod[v.options][mod[v.option]])
          else
            mod:goToStage(mod[v.options][mod[v.option]])
          end
          ModConfigMenu.CloseConfigMenu()
        end,
        Info = { 'Go to selected stage' }
      }
    )
  end
  for i, v in ipairs(mod.customStages) do
    if i ~= 1 then
      ModConfigMenu.AddSpace(mod.Name, 'Mods')
    end
    ModConfigMenu.AddTitle(mod.Name, 'Mods', v.title)
    ModConfigMenu.AddSetting(
      mod.Name,
      'Mods',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return v.selectedStage
        end,
        Minimum = 1,
        Maximum = #v.stages,
        Display = function()
          return '< ' .. v.stages[v.selectedStage].displayName .. ' >'
        end,
        OnChange = function(n)
          v.selectedStage = n
        end,
        Info = { 'Select a stage' }
      }
    )
    ModConfigMenu.AddSetting(
      mod.Name,
      'Mods',
      {
        Type = ModConfigMenu.OptionType.BOOLEAN,
        CurrentSetting = function()
          return false
        end,
        Display = function()
          return 'Go!'
        end,
        OnChange = function(b)
          mod:goToModdedStage(v.stages[v.selectedStage].name)
          ModConfigMenu.CloseConfigMenu()
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
      Info = { 'Restart: start a new run with a random seed', 'Victory Lap: start a new victory lap (disabled', 'in greed mode)' }
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
          mod:restart()
          ModConfigMenu.CloseConfigMenu()
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
          mod:reseed(true)
          ModConfigMenu.CloseConfigMenu()
        end
      end,
      Info = { 'Execute your chosen option' }
    }
  )
  ModConfigMenu.AddSetting(
    mod.Name,
    'Seed',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return false
      end,
      Display = function()
        local seed = mod:constructSeed()
        return 'Restart with: ' .. seed
      end,
      OnChange = function(b)
        local seed = mod:constructSeed()
        if Seeds.IsStringValidSeed(seed) then
          mod:seed(seed)
          ModConfigMenu.CloseConfigMenu()
        end
      end,
      Info = { 'Restart with the specified seed', '(must be valid)' }
    }
  )
  ModConfigMenu.AddText(mod.Name, 'Seed', function()
    local seed = mod:constructSeed()
    return (Seeds.IsStringValidSeed(seed) and 'Valid' or 'Invalid') .. ' seed'
  end)
  for i = 1, 8 do
    ModConfigMenu.AddSetting(
      mod.Name,
      'Seed',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return mod.seedCharOption[i]
        end,
        Minimum = 1,
        Maximum = #mod.seedCharOptions,
        Display = function()
          return '< ' .. mod.seedCharOptions[mod.seedCharOption[i]] .. ' >'
        end,
        OnChange = function(n)
          mod.seedCharOption[i] = n
        end,
        Info = { 'Enter a start seed' }
      }
    )
  end
  for i, v in ipairs({
                       { title = 'Main Dimension'               , dimension = 0, options = 'mainDimensionOptions'     , option = 'mainDimensionOption' },
                       { title = 'Mirror/Mines Escape Dimension', dimension = 1, options = 'mirrorDimensionOptions'   , option = 'mirrorDimensionOption' },
                       { title = 'Death Certificate Dimension'  , dimension = 2, options = 'deathCertDimensionOptions', option = 'deathCertDimensionOption' }
                    })
  do
    if i ~= 1 then
      ModConfigMenu.AddSpace(mod.Name, 'Dimensions')
    end
    ModConfigMenu.AddTitle(mod.Name, 'Dimensions', v.title)
    ModConfigMenu.AddSetting(
      mod.Name,
      'Dimensions',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return mod[v.option]
        end,
        Minimum = 1,
        Maximum = #mod[v.options],
        Display = function()
          return '< ' .. mod[v.options][mod[v.option]] .. ' >'
        end,
        OnChange = function(n)
          mod[v.option] = n
        end,
        Info = { 'Mirror: only available in Downpour/Dross II', 'Mines escape: only available in Mines/Ashpit II' }
      }
    )
    ModConfigMenu.AddSetting(
      mod.Name,
      'Dimensions',
      {
        Type = ModConfigMenu.OptionType.BOOLEAN,
        CurrentSetting = function()
          return false
        end,
        Display = function()
          return 'Go!'
        end,
        OnChange = function(b)
          if mod:goToDimension(v.dimension, mod[v.options][mod[v.option]] == 'Mirror') then
            ModConfigMenu.CloseConfigMenu()
          end
        end,
        Info = { 'Go to dimension ' .. v.dimension }
      }
    )
  end
  if not game:IsGreedMode() then
    for i, v in ipairs({
                         { title = 'Basement I'        , stage = LevelStage.STAGE1_1, stageType = StageType.STAGETYPE_ORIGINAL    , options = 'basementBossOptions'       , option = 'basementBossOption' },
                         { title = 'Cellar I'          , stage = LevelStage.STAGE1_1, stageType = StageType.STAGETYPE_WOTL        , options = 'cellarBossOptions'         , option = 'cellarBossOption' },
                         { title = 'Burning Basement I', stage = LevelStage.STAGE1_1, stageType = StageType.STAGETYPE_AFTERBIRTH  , options = 'burningBasementBossOptions', option = 'burningBasementBossOption' },
                         { title = 'Downpour I'        , stage = LevelStage.STAGE1_1, stageType = StageType.STAGETYPE_REPENTANCE  , options = 'downpourBossOptions'       , option = 'downpourBossOption' },
                         { title = 'Dross I'           , stage = LevelStage.STAGE1_1, stageType = StageType.STAGETYPE_REPENTANCE_B, options = 'drossBossOptions'          , option = 'drossBossOption' },
                         { title = 'Caves I'           , stage = LevelStage.STAGE2_1, stageType = StageType.STAGETYPE_ORIGINAL    , options = 'cavesBossOptions'          , option = 'cavesBossOption' },
                         { title = 'Catacombs I'       , stage = LevelStage.STAGE2_1, stageType = StageType.STAGETYPE_WOTL        , options = 'catacombsBossOptions'      , option = 'catacombsBossOption' },
                         { title = 'Flooded Caves I'   , stage = LevelStage.STAGE2_1, stageType = StageType.STAGETYPE_AFTERBIRTH  , options = 'floodedCavesBossOptions'   , option = 'floodedCavesBossOption' },
                         { title = 'Mines I'           , stage = LevelStage.STAGE2_1, stageType = StageType.STAGETYPE_REPENTANCE  , options = 'minesBossOptions'          , option = 'minesBossOption' },
                         { title = 'Ashpit I'          , stage = LevelStage.STAGE2_1, stageType = StageType.STAGETYPE_REPENTANCE_B, options = 'ashpitBossOptions'         , option = 'ashpitBossOption' },
                         { title = 'Depths I'          , stage = LevelStage.STAGE3_1, stageType = StageType.STAGETYPE_ORIGINAL    , options = 'depthsBossOptions'         , option = 'depthsBossOption' },
                         { title = 'Necropolis I'      , stage = LevelStage.STAGE3_1, stageType = StageType.STAGETYPE_WOTL        , options = 'necropolisBossOptions'     , option = 'necropolisBossOption' },
                         { title = 'Dank Depths I'     , stage = LevelStage.STAGE3_1, stageType = StageType.STAGETYPE_AFTERBIRTH  , options = 'dankDepthsBossOptions'     , option = 'dankDepthsBossOption' },
                         { title = 'Mausoleum I'       , stage = LevelStage.STAGE3_1, stageType = StageType.STAGETYPE_REPENTANCE  , options = 'mausoleumBossOptions'      , option = 'mausoleumBossOption' },
                         { title = 'Gehenna I'         , stage = LevelStage.STAGE3_1, stageType = StageType.STAGETYPE_REPENTANCE_B, options = 'gehennaBossOptions'        , option = 'gehennaBossOption' },
                         { title = 'Womb I'            , stage = LevelStage.STAGE4_1, stageType = StageType.STAGETYPE_ORIGINAL    , options = 'wombBossOptions'           , option = 'wombBossOption' },
                         { title = 'Utero I'           , stage = LevelStage.STAGE4_1, stageType = StageType.STAGETYPE_WOTL        , options = 'uteroBossOptions'          , option = 'uteroBossOption' },
                         { title = 'Scarred Womb I'    , stage = LevelStage.STAGE4_1, stageType = StageType.STAGETYPE_AFTERBIRTH  , options = 'scarredWombBossOptions'    , option = 'scarredWombBossOption' },
                         { title = 'Corpse I'          , stage = LevelStage.STAGE4_1, stageType = StageType.STAGETYPE_REPENTANCE  , options = 'corpseBossOptions'         , option = 'corpseBossOption' }
                      })
    do
      if i ~= 1 then
        ModConfigMenu.AddSpace(mod.Name, 'Bosses')
      end
      ModConfigMenu.AddTitle(mod.Name, 'Bosses', v.title)
      ModConfigMenu.AddSetting(
        mod.Name,
        'Bosses',
        {
          Type = ModConfigMenu.OptionType.NUMBER,
          CurrentSetting = function()
            return mod[v.option]
          end,
          Minimum = 1,
          Maximum = #mod[v.options],
          Display = function()
            return '< ' .. mod[v.options][mod[v.option]] .. ' >'
          end,
          OnChange = function(n)
            mod[v.option] = n
          end,
          Info = { 'Select a boss' }
        }
      )
      ModConfigMenu.AddSetting(
        mod.Name,
        'Bosses',
        {
          Type = ModConfigMenu.OptionType.BOOLEAN,
          CurrentSetting = function()
            return false
          end,
          Display = function()
            return 'Go!'
          end,
          OnChange = function(b)
            mod:goToBoss(mod[v.options][mod[v.option]], v.stage, v.stageType)
            ModConfigMenu.CloseConfigMenu()
          end,
          Info = { 'Go to selected boss' }
        }
      )
    end
  end
  for _, v in ipairs({
                       { name = 'Speed'     , cacheFlag = CacheFlag.CACHE_SPEED    , options = 'speedOptions'    , option = 'speedOption' },
                       { name = 'Tears'     , cacheFlag = CacheFlag.CACHE_FIREDELAY, options = 'tearsOptions'    , option = 'tearsOption' },
                       { name = 'Damage'    , cacheFlag = CacheFlag.CACHE_DAMAGE   , options = 'damageOptions'   , option = 'damageOption' },
                       { name = 'Range'     , cacheFlag = CacheFlag.CACHE_RANGE    , options = 'rangeOptions'    , option = 'rangeOption' },
                       { name = 'Shot Speed', cacheFlag = CacheFlag.CACHE_SHOTSPEED, options = 'shotSpeedOptions', option = 'shotSpeedOption' },
                       { name = 'Luck'      , cacheFlag = CacheFlag.CACHE_LUCK     , options = 'luckOptions'     , option = 'luckOption' }
                    })
  do
    ModConfigMenu.AddSetting(
      mod.Name,
      'Stats',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return mod[v.option]
        end,
        Minimum = 1,
        Maximum = #mod[v.options],
        Display = function()
          local val = mod[v.options][mod[v.option]]
          local sign = val < 0.0 and '' or '+'
          return v.name .. ': ' .. sign .. string.format('%.2f', val)
        end,
        OnChange = function(n)
          mod[v.option] = n
          
          for i = 0, game:GetNumPlayers() - 1 do
            local player = game:GetPlayer(i)
            
            player:AddCacheFlags(v.cacheFlag)
            player:EvaluateItems()
          end
        end,
        Info = { 'Handicap the selected stat' }
      }
    )
  end
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
      mod.toggleTextTime = 0
    end
    
    return mod.toggleText
  end)
  ModConfigMenu.AddSetting(
    mod.Name,
    'Settings',
    {
      Type = ModConfigMenu.OptionType.BOOLEAN,
      CurrentSetting = function()
        return mod.state.autoReseed
      end,
      Display = function()
        return (mod.state.autoReseed and 'Automatically' or 'Do not automatically') .. ' reseed'
      end,
      OnChange = function(b)
        mod.state.autoReseed = b
        mod:save()
      end,
      Info = { 'Automatically reseed when switching stages?', 'Reseeding allows equivalent floors', 'to have different layouts' }
    }
  )
end
-- end ModConfigMenu --

mod:seedRng()
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.onGameStart)
mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
mod:AddCallback(ModCallbacks.MC_POST_CURSE_EVAL, mod.onCurseEval)
mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, mod.onNewLevel)
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.onNewRoom)
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.onCacheEval)
mod:AddCallback(ModCallbacks.MC_EXECUTE_CMD, mod.onExecuteCmd)

mod:setupModConfigMenu()