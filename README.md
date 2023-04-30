# redemrp_infection
This resource adds a disease in Armadillo

## 1. Installation
add ```ensure ldev_infection``` to your server.cfg

## 2. Configuration
```
Config = {}
Config.msg = "You are getting sick..." -- Mensagem que aparece para o player
Config.TimeMax = 20000 -- Quanto tempo pode permanecer na area infectada. PADRAO: 5m
Config.HurtRefresh = 5000 -- Taxa de dano PADRAO: 5sec
Config.HurtAmount = 3 -- Dano a cada hit PADRAO: 3
Config.SafeTime = 90000 -- SafeTime depois de morto, o jogador não pode se machucar antes do tempo acabar. PADRAO: 1m 30s
Config.PlagueDistance = 65.0 -- Distância da praga. PADRAO: 65
```

## 3. Credits
[amakuu](https://github.com/amakuu/)

## 4. Modified by LombraDev
[lDev](https://github.com/Lombra4i20)