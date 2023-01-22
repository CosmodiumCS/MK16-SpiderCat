# Spider Cat
> Blue Cosmo & I am Jakoby
---

```
                 \|     \
               \LLLLLLL |  |                 | 
               L;;;;;; /;;LLLL|              |
          \   L;;;;;;;;;;;;;;LLL | |   UUUUU|
          \\L;;;:::::::::::::::::UUUUU;;;;;:U  ,
           L;;;::::::::::::::::::::::::: :::UU/
           L;;  @::::::        ::::::::::::::::U
        \ L;;   ::::      @   \:::::       \\:::U\             
         L;;::::::             \:::      @   \\:: @)
         T;;::::::             |::           |:/ c
          T;::::::             /::           |::C
         T;;:::::::          //:::          /::C
        T;;:::::::::   |/   /::::::        /:::C '
      sT;;;;p P:::::::;IIIII:::::::::\ || ::::C A a'
     S TS;;pP;;;P||||||I;;;;;i:::::SSS:s:::::A;;;;;A  
   _-S;;;sP;;;;;;P|||||I;;;;;;I::SS;;;;S:::::A a;;;;\A         
    s;;;P;;;;;;;;P||||||I;;;;;;IS;;s;;;;S:|||||A;;;A  \        
  S;;;;;p;;;;;;;;;P||||I;;;;;;S;S|S;;;;;S|||A;;;;;A
  s;;;;;sSp;;;;;;;P_-----I;;;;;;IS|S;;;;S||A;;;;;A\   
 / S:s||||Pp;;;;;;;P:     I;;IS||||S;;;S||A;;;A    -\
          |||\P;;;;;;P      ;Ii      ;sS  A;\\
               Pp;;;;;Pp_                    \
                     \;;p \
```

## Overview
Spider Cat is a payload developed by Blue Cosmo and I am Jakoby. It aims to con*cat*anate targets into an [Obsidian](https://obsidian.md) *spider* web framework. It allows security professionals to keep track of their targets and how they are connected. It conducts advanced reconnaissance on targets, gathering intel such as the users email, systems information, geolocation and saved wifi hotspots. Using Obsidian's advanced markdown mapping capabilites, Spider Cat is able to connect **all** of your targets based off of the reconnaissance conducted on them.


![Spider Cat Obsidian Nodes](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/nodes.png)

**Key Features**:
- Build a network of all your compromised targets
- See if two targets have been on the same network before
- Compromise saved network credentials of your targets
- Search and filter throuth the network of compromised targets for data

## Resources:
- [YouTube Video]()
- [YouTube Channel](https://youtube.com/cosmodiumcs)
- [Website](https://cosmodiumcs.com)

## Requirements:
**Attacker PC:**
- Obsidian 
- Obsidian Webhook

**Target PC:**
- Windows 10/11

## Installation:
1. clone this repository
```bash
git clone https://github.com/CosmodiumCS/SpiderCat.git
```
2. open repository in Obsidian
3. create an obsidian webhook
4. in line # of `spider-cat.ps1`, replace `WEBHOOK` with your Obsidian Webhook
5. load the `spider-cat.ps1` on to a target and enjoy! :)

## Extraneous:
