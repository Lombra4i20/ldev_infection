Config = {}
Config.msg = "~d~Você entrou na zona morta se permanecer muito tempo ficará doente e ~e~morrer~d~..." -- Displays when Player is in infected area
Config.msg2 = "~d~Você foi ~e~Infectado ~d~ por 2 minutos" -- Displays when Player is in infected area
Config.TimeMax = 7000 -- How much time player can spend in Armadillo before getting hurt DEFAULT: 5m
Config.HurtRefresh = 5000 -- Hurting Rate DEFAULT: 5sec
Config.HurtAmount = 10 -- How much amount should be player damaged by DEFAULT: 3
Config.SafeTime = 90000 -- SafeTime after dead, player can't get hurt before time ends DEFAULT: 1m 30s
Config.PlagueDistance = 100.0 -- Distance of the plague DEFAULT: 65
Config.infected = true
Config.Locations = {
    
    {x = -3667.04, y = -2611.41, z = -14.08},
    {x = -5509.99, y = -2940.62, z = -2.05},
    -- adicione mais localizações aqui
  }