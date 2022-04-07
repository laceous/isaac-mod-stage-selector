local mod = RegisterMod('Stage Selector', 1)
local game = Game()

mod.rng = RNG()

mod.stage11Options = { 'Basement 1', 'Cellar 1', 'Burning Basement 1', 'Basement XL', 'Cellar XL', 'Burning Basement XL', 'Basement 1 (Ascent)', 'Cellar 1 (Ascent)', 'Burning Basement 1 (Ascent)' }
mod.stage11AltOptions = { 'Downpour 1', 'Dross 1', 'Downpour XL', 'Dross XL', 'Downpour 1 (Ascent)', 'Dross 1 (Ascent)' }
mod.stage12Options = { 'Basement 2', 'Cellar 2', 'Burning Basement 2', 'Basement 2 (Ascent)', 'Cellar 2 (Ascent)', 'Burning Basement 2 (Ascent)' }
mod.stage12AltOptions = { 'Downpour 2', 'Dross 2', 'Downpour 2 (Ascent)', 'Dross 2 (Ascent)' }
mod.stage21Options = { 'Caves 1', 'Catacombs 1', 'Flooded Caves 1', 'Caves XL', 'Catacombs XL', 'Flooded Caves XL', 'Caves 1 (Ascent)', 'Catacombs 1 (Ascent)', 'Flooded Caves 1 (Ascent)' }
mod.stage21AltOptions = { 'Mines 1', 'Ashpit 1', 'Mines XL', 'Ashpit XL', 'Mines 1 (Ascent)', 'Ashpit 1 (Ascent)' }
mod.stage22Options = { 'Caves 2', 'Catacombs 2', 'Flooded Caves 2', 'Caves 2 (Ascent)', 'Catacombs 2 (Ascent)', 'Flooded Caves 2 (Ascent)' }
mod.stage22AltOptions = { 'Mines 2', 'Ashpit 2', 'Mines 2 (Ascent)', 'Ashpit 2 (Ascent)' }
mod.stage31Options = { 'Depths 1', 'Necropolis 1', 'Dank Depths 1', 'Depths XL', 'Necropolis XL', 'Dank Depths XL', 'Depths 1 (Ascent)', 'Necropolis 1 (Ascent)', 'Dank Depths 1 (Ascent)' }
mod.stage31AltOptions = { 'Mausoleum 1', 'Gehenna 1', 'Mausoleum XL', 'Gehenna XL', 'Mausoleum 1 (Ascent)', 'Gehenna 1 (Ascent)' }
mod.stage32Options = { 'Depths 2', 'Necropolis 2', 'Dank Depths 2', 'Depths 2 (Ascent)', 'Necropolis 2 (Ascent)', 'Dank Depths 2 (Ascent)' }
mod.stage32AltOptions = { 'Mausoleum 2', 'Gehenna 2', 'Mausoleum 2 (PreAscent)', 'Gehenna 2 (PreAscent)', 'Mausoleum 2 (Ascent)', 'Gehenna 2 (Ascent)' }
mod.stage41Options = { 'Womb 1', 'Utero 1', 'Scarred Womb 1', 'Womb XL', 'Utero XL', 'Scarred Womb XL' }
mod.stage41AltOptions = { 'Corpse 1', 'Corpse XL' }
mod.stage42Options = { 'Womb 2', 'Utero 2', 'Scarred Womb 2' }
mod.stage42AltOptions = { 'Corpse 2' }
mod.stage43Options = { 'Blue Womb' }
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
mod.greedStage5Options = { 'Sheol' }
mod.greedStage6Options = { 'The Shop' }
mod.greedStage7Options = { 'Ultra Greed' }
mod.restartGameOptions = { 'Restart', 'Victory Lap' }
mod.restartLevelOptions = { 'Reseed' }
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
mod.itemOptions = { 'The Polaroid', 'The Negative', 'Key Piece 1', 'Key Piece 2', 'Knife Piece 1', 'Knife Piece 2', '0 - The Fool', 'V - The Hierophant', 'V - The Hierophant?', 'VI - The Lovers', 'VIII - Justice', 'Rune of Ansuz', 'Cracked Key' }
mod.debugOptions = { 'Infinite HP' }

mod.stage11Option = {1}
mod.stage11AltOption = {1}
mod.stage12Option = {1}
mod.stage12AltOption = {1}
mod.stage21Option = {1}
mod.stage21AltOption = {1}
mod.stage22Option = {1}
mod.stage22AltOption = {1}
mod.stage31Option = {1}
mod.stage31AltOption = {1}
mod.stage32Option = {1}
mod.stage32AltOption = {1}
mod.stage41Option = {1}
mod.stage41AltOption = {1}
mod.stage42Option = {1}
mod.stage42AltOption = {1}
mod.stage43Option = {1}
mod.stage5Option = {1}
mod.stage6Option = {1}
mod.stage7Option = {1}
mod.stage8Option = {1}
mod.greedStage1Option = {1}
mod.greedStage1AltOption = {1}
mod.greedStage2Option = {1}
mod.greedStage2AltOption = {1}
mod.greedStage3Option = {1}
mod.greedStage3AltOption = {1}
mod.greedStage4Option = {1}
mod.greedStage4AltOption = {1}
mod.greedStage5Option = {1}
mod.greedStage6Option = {1}
mod.greedStage7Option = {1}
mod.restartGameOption = {1}
mod.restartLevelOption = {1}
mod.basementBossOption = {1}
mod.cellarBossOption = {1}
mod.burningBasementBossOption = {1}
mod.downpourBossOption = {1}
mod.drossBossOption = {1}
mod.cavesBossOption = {1}
mod.catacombsBossOption = {1}
mod.floodedCavesBossOption = {1}
mod.minesBossOption = {1}
mod.ashpitBossOption = {1}
mod.depthsBossOption = {1}
mod.necropolisBossOption = {1}
mod.dankDepthsBossOption = {1}
mod.mausoleumBossOption = {1}
mod.gehennaBossOption = {1}
mod.wombBossOption = {1}
mod.uteroBossOption = {1}
mod.scarredWombBossOption = {1}
mod.corpseBossOption = {1}
mod.speedOption = {11}
mod.tearsOption = {29}
mod.damageOption = {29}
mod.rangeOption = {11}
mod.shotSpeedOption = {11}
mod.luckOption = {29}
mod.itemOption = {1}
mod.debugOption = {1}

mod.forceXL = nil -- 3 state: true, false, nil
mod.showLevelName = false
mod.toggleText = ''
mod.toggleTextTime = 0

function mod:onGameExit()
  mod.speedOption[1] = 11
  mod.tearsOption[1] = 29
  mod.damageOption[1] = 29
  mod.rangeOption[1] = 11
  mod.shotSpeedOption[1] = 11
  mod.luckOption[1] = 29
  
  mod.forceXL = nil
  mod.showLevelName = false
  mod.toggleText = ''
  mod.toggleTextTime = 0
  
  mod:seedRng()
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

function mod:onNewRoom()
  local level = game:GetLevel()
  local room = level:GetCurrentRoom()
  
  if mod:isChallenge() and not game:IsGreedMode() and level:GetStage() == LevelStage.STAGE6 and level:GetCurrentRoomIndex() == level:GetStartingRoomIndex() then
    room:TrySpawnMegaSatanRoomDoor(true)
  end
end

-- thanks to the Stat Change Commands mod for help figuring some of this out
function mod:onCacheEval(player, cacheFlag)
  if cacheFlag & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED then
    local speed = player.MoveSpeed + mod.speedOptions[mod.speedOption[1]]
    if speed > 2.0 then
      speed = 2.0
    elseif speed < 0.1 then
      speed = 0.1
    end
    player.MoveSpeed = speed
  end
  
  if cacheFlag & CacheFlag.CACHE_FIREDELAY == CacheFlag.CACHE_FIREDELAY then
    local tears = (30 / (player.MaxFireDelay + 1)) + mod.tearsOptions[mod.tearsOption[1]]
    if tears > 120.0 then
      tears = 120.0
    elseif tears < 1.0 then -- not a hard limit, but keep this above zero
      tears = 1.0
    end
    player.MaxFireDelay = (30 / tears) - 1
  end
  
  if cacheFlag & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
    local damage = player.Damage + mod.damageOptions[mod.damageOption[1]]
    if damage < 0.5 then
      damage = 0.5
    end
    player.Damage = damage
  end
  
  if cacheFlag & CacheFlag.CACHE_RANGE == CacheFlag.CACHE_RANGE then
    local range = (player.TearRange / 40) + mod.rangeOptions[mod.rangeOption[1]]
    if range < 1.0 then
      range = 1.0
    end
    player.TearRange = range * 40
  end
  
  if cacheFlag & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then
    local shotSpeed = player.ShotSpeed + mod.shotSpeedOptions[mod.shotSpeedOption[1]]
    if shotSpeed < 0.6 then
      shotSpeed = 0.6
    end
    player.ShotSpeed = shotSpeed
  end
  
  if cacheFlag & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
    player.Luck = player.Luck + mod.luckOptions[mod.luckOption[1]]
  end
end

function mod:reseed(showLevelName)
  mod.forceXL = mod:isCurseOfTheLabyrinth()
  mod.showLevelName = showLevelName
  game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
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
    mod:reseed(true)
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
    Isaac.ExecuteCommand('stage ' .. stage) -- better Alt path in Greed Mode support
    mod:reseed(true)
  end
end

function mod:goToBoss(name, stage)
  local bossRooms
  
  if name == 'The Duke of Flies' then
    bossRooms = { '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018' }
  elseif name == 'Famine' then
    bossRooms = { '4010', '4012', '4013', '4014' }
  elseif name == 'Little Horn' then
    bossRooms = { '1088', '1089', '1095', '1096' }
  elseif name == 'Baby Plum' then
    bossRooms = { '5160', '5161', '5162', '5163', '5164', '5165', }
  elseif name == 'Monstro' then
    bossRooms = { '1010', '1011', '1012', '1013', '1014', '1015', '1016', '1017', '1018', '1037', '1038', '1039', '1045', '1123' }
  elseif name == 'Gemini' then
    bossRooms = { '2050', '2051', '2052', '2053' }
  elseif name == 'Steven' then
    bossRooms = { '2070', '2071', '2072', '2073' }
  elseif name == 'Larry Jr.' then
    bossRooms = { '1020', '1021', '1022', '1023', '1024', '1025', '1026', '1027', '1028', '1046', '1047', '1048', '1049', '1124', '1125' }
  elseif name == 'Dingle' then
    bossRooms = { '5020', '5021', '5022', '5023', '5024', '5025' }
  elseif name == 'Dangle' then
    bossRooms = { '1117', '1118', '1119', '1120', '1121' }
  elseif name == 'Gurglings' then
    bossRooms = { '5140', '5141', '5142', '5143', '5144' }
  elseif name == 'Turdlings' then
    bossRooms = { '5146', '5147', '5148', '5149', '5150', '5151' }
  elseif name == 'The Headless Horseman' then
    bossRooms = { '4050', '4051', '4052' }
  elseif name == 'Blighted Ovum' then
    bossRooms = { '3320', '3321', '3322', '3323' }
  elseif name == 'Widow' then
    bossRooms = { '3340', '3341', '3342', '3343', '3344', '3345' }
  elseif name == 'Pin' then
    bossRooms = { '3370', '3371', '3372', '3373', '3374', '3375', '3376', '3377', '3378' }
  elseif name == 'The Haunt' then
    bossRooms = { '5010', '5011', '5012', '5013', '5014' }
  elseif name == 'Rag Man' then
    bossRooms = { '1019', '1029', '1035', '1036', '1128', '1129' }
  elseif name == 'Wormwood' then
    bossRooms = { '5180', '5181', '5182', '5183', '5184' }
  elseif name == 'Lil Blub' then
    bossRooms = { '5170', '5171', '5172', '5173', '5174', '5175' }
  elseif name == 'Rainmaker' then
    bossRooms = { '5230', '5231', '5232' }
  elseif name == 'Min-Min' then
    bossRooms = { '5280', '5281', '5282' }
  elseif name == 'Clog' then
    bossRooms = { '5190', '5191', '5192', '5193', '5194' }
  elseif name == 'Colostomia' then
    bossRooms = { '5330' }
  elseif name == 'Turdlet' then
    bossRooms = { '5320', '5321', '5322' }
  elseif name == 'Peep' then
    bossRooms = { '2020', '2021', '2022', '2023', '2024', '2025' }
  elseif name == 'Gurdy Jr.' then
    bossRooms = { '3280', '3281', '3282', '3283' }
  elseif name == 'Pestilence' then
    bossRooms = { '4020', '4021', '4022' }
  elseif name == 'Rag Mega' then
    bossRooms = { '3398', '3399', '3404', '3405' }
  elseif name == 'Big Horn' then
    bossRooms = { '3394', '3395', '3396', '3397' }
  elseif name == 'Bumbino' then
    bossRooms = { '5270', '5271', '5272', '5273', '5274' }
  elseif name == 'Bumbino' then
    bossRooms = { '5270', '5271', '5272', '5273', '5274' }
  elseif name == 'Chub' then
    bossRooms = { '1030', '1031', '1032', '1033', '1034', '1055', '1056', '1057', '1126', '1127' }
  elseif name == 'C.H.A.D.' then
    bossRooms = { '1100', '1101', '1102', '1103', '1104' }
  elseif name == 'Gurdy' then
    bossRooms = { '1040', '1041', '1042', '1043', '1044', '1058', '1059', '1065', '1066', '1130', '1131' }
  elseif name == 'Fistula' then
    bossRooms = { '2060', '2061', '2062', '2063', '2064' }
  elseif name == 'Mega Maw' then
    bossRooms = { '5030', '5031', '5032', '5033', '5034' }
  elseif name == 'Mega Fatty' then
    bossRooms = { '5050', '5051', '5052', '5054' }
  elseif name == 'The Stain' then
    bossRooms = { '1106', '1107', '1108', '1109', '1115' }
  elseif name == 'Carrion Queen' then
    bossRooms = { '3270', '3271', '3272', '3273' }
  elseif name == 'The Hollow' then
    bossRooms = { '3260', '3261', '3262', '3263', '3264', '3265', '3266' }
  elseif name == 'The Husk' then
    bossRooms = { '3290', '3291', '3292', '3293', '3294', '3295' }
  elseif name == 'The Wretched' then
    bossRooms = { '3360', '3361', '3362', '3363' }
  elseif name == 'Polycephalus' then
    bossRooms = { '5100', '5101', '5102', '5103', '5104', '5106' }
  elseif name == 'Dark One' then
    bossRooms = { '5080', '5081', '5082', '5083', '5084' }
  elseif name == 'The Frail' then
    bossRooms = { '3384', '3385', '3386', '3387', '3388', '3389' }
  elseif name == 'The Forsaken' then
    bossRooms = { '1079', '1085', '1086', '1087' }
  elseif name == 'Great Gideon' then
    bossRooms = { '5210', '5211', '5212', '5213', '5214' }
  elseif name == 'Great Gideon' then
    bossRooms = { '5210', '5211', '5212', '5213', '5214' }
  elseif name == 'Tuff Twins' then
    bossRooms = { '5200', '5201', '5202', '5203', '5204', '5205', '5206', '5207' }
  elseif name == 'Reap Creep' then
    bossRooms = { '5250', '5251', '5252', '5253', '5254', '5256' }
  elseif name == 'Hornfel' then
    bossRooms = { '5220', '5221', '5222', '5224', '5225', '5226', '5228', '5229' }
  elseif name == 'The Shell' then
    bossRooms = { '5310', '5311', '5312', '5313' }
  elseif name == 'The Pile' then
    bossRooms = { '5240', '5241', '5242', '5244' }
  elseif name == 'Singe' then
    bossRooms = { '5260', '5261', '5262', '5263', '5264' }
  elseif name == 'Clutch' then
    bossRooms = { '6020', '6021', '6022' }
  elseif name == 'The Fallen' then
    bossRooms = { '3500', '3501', '3502' }
  elseif name == 'Loki' then
    bossRooms = { '2030', '2031', '2032', '2033' }
  elseif name == 'War' then
    bossRooms = { '4030', '4034', '4035' }
  elseif name == 'Brownie' then
    bossRooms = { '1097', '1098', '1099', '1105', '1116' }
  elseif name == 'Sisters Vis' then
    bossRooms = { '3406', '3407', '3408', '3409' }
  elseif name == 'Monstro II' then
    bossRooms = { '1050', '1051', '1052', '1053', '1054', '1067', '1068', '1069', '1076' }
  elseif name == 'Gish' then
    bossRooms = { '1110', '1111', '1112', '1113', '1114' }
  elseif name == 'The Cage' then
    bossRooms = { '5060', '5061', '5062', '5063', '5064' }
  elseif name == 'The Gate' then
    bossRooms = { '5040', '5041', '5042', '5044', '5045' }
  elseif name == 'The Bloat' then
    bossRooms = { '3300', '3301', '3302', '3303' }
  elseif name == 'Mask of Infamy' then
    bossRooms = { '3350', '3351', '3352', '3353' }
  elseif name == 'The Adversary' then
    bossRooms = { '5090', '5091', '5092', '5093', '5094' }
  elseif name == 'The Siren' then
    bossRooms = { '5370', '5371', '5372' }
  elseif name == 'The Heretic' then
    bossRooms = { '5290', '5291', '5292', '5293' }
  elseif name == 'The Visage' then
    bossRooms = { '5300', '5301' }
  elseif name == 'Horny Boys' then
    bossRooms = { '6010', '6011', '6012' }
  elseif name == 'Lokii' then
    bossRooms = { '3310', '3311', '3312', '3313' }
  elseif name == 'Death' then
    bossRooms = { '4040', '4041', '4042' }
  elseif name == 'Conquest' then
    bossRooms = { '4031', '4032', '4033' }
  elseif name == 'Scolex' then
    bossRooms = { '1070', '1071', '1072', '1073', '1074', '1075' }
  elseif name == 'Blastocyst' then
    bossRooms = { '2040', '2041', '2042', '2043' }
  elseif name == 'Mama Gurdy' then
    bossRooms = { '5070', '5071', '5072' }
  elseif name == 'Mr. Fred' then
    bossRooms = { '5110', '5111', '5113' }
  elseif name == 'Teratoma' then
    bossRooms = { '3330', '3331', '3332', '3333' }
  elseif name == 'Daddy Long Legs' then
    bossRooms = { '3400', '3401', '3402', '3403' }
  elseif name == 'Triachnid' then
    bossRooms = { '3410', '3411', '3412', '3413' }
  elseif name == 'The Matriarch' then
    bossRooms = { '5152', '5153', '5154', '5155' }
  elseif name == 'The Scourge' then
    bossRooms = { '5360', '5361', '5362' }
  elseif name == 'Chimera' then
    bossRooms = { '5350', '5351', '5352' }
  elseif name == 'Rotgut' then
    bossRooms = { '5340' }
  end
  
  if stage and bossRooms then
    local bossRoom = bossRooms[mod.rng:RandomInt(#bossRooms) + 1]
    
    mod.forceXL = false
    game:SetStateFlag(GameStateFlag.STATE_MAUSOLEUM_HEART_KILLED, false)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH_INIT, false)
    game:SetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH, false)
    
    Isaac.ExecuteCommand('stage ' .. stage)
    mod:reseed(false)
    Isaac.ExecuteCommand('goto s.boss.' .. bossRoom)
  end
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
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_FOOL, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
  elseif name == 'VIII - Justice' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_JUSTICE, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
  elseif name == 'V - The Hierophant' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_HIEROPHANT, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
  elseif name == 'V - The Hierophant?' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_REVERSE_HIEROPHANT, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
  elseif name == 'VI - The Lovers' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_LOVERS, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
  elseif name == 'Rune of Ansuz' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.RUNE_ANSUZ, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
  elseif name == 'Cracked Key' then
    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_CRACKED_KEY, Isaac.GetFreeNearPosition(player.Position, 3), Vector(0,0), nil)
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

function mod:seedRng()
  repeat
    local rand = Random()  -- 0 to 2^32
    if rand > 0 then       -- if this is 0, it causes a crash later on
      mod.rng:SetSeed(rand, 1)
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

function mod:setupModConfigMenu()
  for i, v in ipairs({
                       { title = 'Stage 1-1 (Main)', options = mod.stage11Options,    option = mod.stage11Option },
                       { title = 'Stage 1-1 (Alt)',  options = mod.stage11AltOptions, option = mod.stage11AltOption },
                       { title = 'Stage 1-2 (Main)', options = mod.stage12Options,    option = mod.stage12Option },
                       { title = 'Stage 1-2 (Alt)',  options = mod.stage12AltOptions, option = mod.stage12AltOption },
                       { title = 'Stage 2-1 (Main)', options = mod.stage21Options,    option = mod.stage21Option },
                       { title = 'Stage 2-1 (Alt)',  options = mod.stage21AltOptions, option = mod.stage21AltOption },
                       { title = 'Stage 2-2 (Main)', options = mod.stage22Options,    option = mod.stage22Option },
                       { title = 'Stage 2-2 (Alt)',  options = mod.stage22AltOptions, option = mod.stage22AltOption },
                       { title = 'Stage 3-1 (Main)', options = mod.stage31Options,    option = mod.stage31Option },
                       { title = 'Stage 3-1 (Alt)',  options = mod.stage31AltOptions, option = mod.stage31AltOption },
                       { title = 'Stage 3-2 (Main)', options = mod.stage32Options,    option = mod.stage32Option },
                       { title = 'Stage 3-2 (Alt)',  options = mod.stage32AltOptions, option = mod.stage32AltOption },
                       { title = 'Stage 4-1 (Main)', options = mod.stage41Options,    option = mod.stage41Option },
                       { title = 'Stage 4-1 (Alt)',  options = mod.stage41AltOptions, option = mod.stage41AltOption },
                       { title = 'Stage 4-2 (Main)', options = mod.stage42Options,    option = mod.stage42Option },
                       { title = 'Stage 4-2 (Alt)',  options = mod.stage42AltOptions, option = mod.stage42AltOption },
                       { title = 'Stage 4-3',        options = mod.stage43Options,    option = mod.stage43Option },
                       { title = 'Stage 5',          options = mod.stage5Options,     option = mod.stage5Option },
                       { title = 'Stage 6',          options = mod.stage6Options,     option = mod.stage6Option },
                       { title = 'Stage 7',          options = mod.stage7Options,     option = mod.stage7Option },
                       { title = 'Stage 8',          options = mod.stage8Options,     option = mod.stage8Option }
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
          return v.option[1]
        end,
        Minimum = 1,
        Maximum = #v.options,
        Display = function()
          return '< ' .. v.options[v.option[1]] .. ' >'
        end,
        OnChange = function(n)
          v.option[1] = n
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
            mod:goToStage(v.options[v.option[1]])
            ModConfigMenu.CloseConfigMenu()
          end
        end,
        Info = { 'Go to selected stage' }
      }
    )
  end
  for i, v in ipairs({
                       { title = 'Stage 1 (Main)', options = mod.greedStage1Options,    option = mod.greedStage1Option },
                       { title = 'Stage 1 (Alt)',  options = mod.greedStage1AltOptions, option = mod.greedStage1AltOption },
                       { title = 'Stage 2 (Main)', options = mod.greedStage2Options,    option = mod.greedStage2Option },
                       { title = 'Stage 2 (Alt)',  options = mod.greedStage2AltOptions, option = mod.greedStage2AltOption },
                       { title = 'Stage 3 (Main)', options = mod.greedStage3Options,    option = mod.greedStage3Option },
                       { title = 'Stage 3 (Alt)',  options = mod.greedStage3AltOptions, option = mod.greedStage3AltOption },
                       { title = 'Stage 4 (Main)', options = mod.greedStage4Options,    option = mod.greedStage4Option },
                       { title = 'Stage 4 (Alt)',  options = mod.greedStage4AltOptions, option = mod.greedStage4AltOption },
                       { title = 'Stage 5',        options = mod.greedStage5Options,    option = mod.greedStage5Option },
                       { title = 'Stage 6',        options = mod.greedStage6Options,    option = mod.greedStage6Option },
                       { title = 'Stage 7',        options = mod.greedStage7Options,    option = mod.greedStage7Option }
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
          return v.option[1]
        end,
        Minimum = 1,
        Maximum = #v.options,
        Display = function()
          return '< ' .. v.options[v.option[1]] .. ' >'
        end,
        OnChange = function(n)
          v.option[1] = n
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
            mod:goToGreedStage(v.options[v.option[1]])
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
        return mod.restartGameOption[1]
      end,
      Minimum = 1,
      Maximum = #mod.restartGameOptions,
      Display = function()
        return '< ' .. mod.restartGameOptions[mod.restartGameOption[1]] .. ' >'
      end,
      OnChange = function(n)
        mod.restartGameOption[1] = n
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
        if mod.restartGameOptions[mod.restartGameOption[1]] == 'Restart' then
          Isaac.ExecuteCommand('restart')
        elseif mod.restartGameOptions[mod.restartGameOption[1]] == 'Victory Lap' then
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
        return mod.restartLevelOption[1]
      end,
      Minimum = 1,
      Maximum = #mod.restartLevelOptions,
      Display = function()
        return '< ' .. mod.restartLevelOptions[mod.restartLevelOption[1]] .. ' >'
      end,
      OnChange = function(n)
        mod.restartLevelOption[1] = n
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
        if mod.restartLevelOptions[mod.restartLevelOption[1]] == 'Reseed' then
          mod:reseed(true)
          ModConfigMenu.CloseConfigMenu()
        end
      end,
      Info = { 'Execute your chosen option' }
    }
  )
  for i, v in ipairs({
                       { title = 'Basement',         stage = '1',  options = mod.basementBossOptions,        option = mod.basementBossOption },
                       { title = 'Cellar',           stage = '1a', options = mod.cellarBossOptions,          option = mod.cellarBossOption },
                       { title = 'Burning Basement', stage = '1b', options = mod.burningBasementBossOptions, option = mod.burningBasementBossOption },
                       { title = 'Downpour',         stage = '1c', options = mod.downpourBossOptions,        option = mod.downpourBossOption },
                       { title = 'Dross',            stage = '1d', options = mod.drossBossOptions,           option = mod.drossBossOption },
                       { title = 'Caves',            stage = '3',  options = mod.cavesBossOptions,           option = mod.cavesBossOption },
                       { title = 'Catacombs',        stage = '3a', options = mod.catacombsBossOptions,       option = mod.catacombsBossOption },
                       { title = 'Flooded Caves',    stage = '3b', options = mod.floodedCavesBossOptions,    option = mod.floodedCavesBossOption },
                       { title = 'Mines',            stage = '3c', options = mod.minesBossOptions,           option = mod.minesBossOption },
                       { title = 'Ashpit',           stage = '3d', options = mod.ashpitBossOptions,          option = mod.ashpitBossOption },
                       { title = 'Depths',           stage = '5',  options = mod.depthsBossOptions,          option = mod.depthsBossOption },
                       { title = 'Necropolis',       stage = '5a', options = mod.necropolisBossOptions,      option = mod.necropolisBossOption },
                       { title = 'Dank Depths',      stage = '5b', options = mod.dankDepthsBossOptions,      option = mod.dankDepthsBossOption },
                       { title = 'Mausoleum',        stage = '5c', options = mod.mausoleumBossOptions,       option = mod.mausoleumBossOption },
                       { title = 'Gehenna',          stage = '5d', options = mod.gehennaBossOptions,         option = mod.gehennaBossOption },
                       { title = 'Womb',             stage = '7',  options = mod.wombBossOptions,            option = mod.wombBossOption },
                       { title = 'Utero',            stage = '7a', options = mod.uteroBossOptions,           option = mod.uteroBossOption },
                       { title = 'Scarred Womb',     stage = '7b', options = mod.scarredWombBossOptions,     option = mod.scarredWombBossOption },
                       { title = 'Corpse',           stage = '7c', options = mod.corpseBossOptions,          option = mod.corpseBossOption }
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
          return v.option[1]
        end,
        Minimum = 1,
        Maximum = #v.options,
        Display = function()
          return '< ' .. v.options[v.option[1]] .. ' >'
        end,
        OnChange = function(n)
          v.option[1] = n
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
          return not game:IsGreedMode() and 'Go!' or '(Disabled)'
        end,
        OnChange = function(b)
          if not game:IsGreedMode() then
            mod:goToBoss(v.options[v.option[1]], v.stage)
            ModConfigMenu.CloseConfigMenu()
          end
        end,
        Info = { 'Go to selected boss' }
      }
    )
  end
  for _, v in ipairs({
                       { name = 'Speed',      cacheFlag = CacheFlag.CACHE_SPEED,     options = mod.speedOptions,     option = mod.speedOption },
                       { name = 'Tears',      cacheFlag = CacheFlag.CACHE_FIREDELAY, options = mod.tearsOptions,     option = mod.tearsOption },
                       { name = 'Damage',     cacheFlag = CacheFlag.CACHE_DAMAGE,    options = mod.damageOptions,    option = mod.damageOption },
                       { name = 'Range',      cacheFlag = CacheFlag.CACHE_RANGE,     options = mod.rangeOptions,     option = mod.rangeOption },
                       { name = 'Shot Speed', cacheFlag = CacheFlag.CACHE_SHOTSPEED, options = mod.shotSpeedOptions, option = mod.shotSpeedOption },
                       { name = 'Luck',       cacheFlag = CacheFlag.CACHE_LUCK,      options = mod.luckOptions,      option = mod.luckOption }
                    })
  do
    ModConfigMenu.AddSetting(
      mod.Name,
      'Stats',
      {
        Type = ModConfigMenu.OptionType.NUMBER,
        CurrentSetting = function()
          return v.option[1]
        end,
        Minimum = 1,
        Maximum = #v.options,
        Display = function()
          local val = v.options[v.option[1]]
          local sign = val < 0.0 and '' or '+'
          return v.name .. ': ' .. sign .. string.format('%.2f', val)
        end,
        OnChange = function(n)
          v.option[1] = n
          
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
        return mod.itemOption[1]
      end,
      Minimum = 1,
      Maximum = #mod.itemOptions,
      Display = function()
        return '< ' .. mod.itemOptions[mod.itemOption[1]] .. ' >'
      end,
      OnChange = function(n)
        mod.itemOption[1] = n
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
        mod:giveItem(mod.itemOptions[mod.itemOption[1]])
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
        return mod.debugOption[1]
      end,
      Minimum = 1,
      Maximum = #mod.debugOptions,
      Display = function()
        return '< ' .. mod.debugOptions[mod.debugOption[1]] .. ' >'
      end,
      OnChange = function(n)
        mod.debugOption[1] = n
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
        mod:toggleDebug(mod.debugOptions[mod.debugOption[1]])
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

mod:seedRng()
mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, mod.onGameExit)
mod:AddCallback(ModCallbacks.MC_POST_CURSE_EVAL, mod.onCurseEval)
mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, mod.onNewLevel)
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.onNewRoom)
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE , mod.onCacheEval)

if ModConfigMenu then
  mod:setupModConfigMenu()
end