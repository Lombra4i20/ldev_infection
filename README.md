# ldev_infection

Esta resource adiciona areas infectadas e o npc infecta o player

## 1. Instalação
Adicione ```ensure ldev_infection``` na seu server.cfg ou resources.cfg

## 2. Configuração
```
Config = {}
Config.msg = "~d~Você entrou na zona morta se permanecer muito tempo ficará doente e ~e~morrer~d~..." -- Displays when Player is in infected area
Config.msg2 = "~d~Você foi ~e~Infectado ~d~ por 2 minutos" -- Displays when Player is in infected area
Config.TimeMax = 10000 -- Tempo maximo permitido dentro da area DEFAULT: 5m
Config.HurtRefresh = 600 -- Taxa de dano DEFAULT: 5sec
Config.HurtAmount = 2 -- Quantidade de dano DEFAULT: 3
Config.SafeTime = 30000 -- Tempo de Segurança após a morte, o jogador não pode ser ferido antes que o tempo termine DEFAULT: 1m 30s
Config.PlagueDistance = 150.0 -- Distance of the plague DEFAULT: 65
Config.infected = true -- Sistema de infecção por npc
Config.Locations = {
    
    {x = -3667.04, y = -2611.41, z = -14.08},
    {x = -5509.99, y = -2940.62, z = -2.05},
	  {x = 2937.59, y = 1354.83, z = 44.28},
    -- adicione mais localizações aqui
  }
```

## 3. Credits
[amakuu](https://github.com/amakuu/)

## 4. Modified by LombraDev
[lDev](https://github.com/Lombra4i20)