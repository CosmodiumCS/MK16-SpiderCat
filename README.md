# SpiderCat
---

```
	            &&&&&&&&&&%0&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
	            &&&&&&&&&%  ;0&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&0&&&&&&&&&&
	            &&&&&&&&&%    *&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&0*; ,0&&&&&&&&&
	            &&&&&&&&&&,    ,*&$00&&&&&&&&&&&&&&&&&&&&&&0=     0&&&&&&&&&
	            &&&&&&&&&&%       =* ;*0&000%&&&&&&&&&$&&&*      ;&&&&&&&&&&
	            &&&&&&&&&&&,               ; *&*;=;*&0*,;;       %&&&&&&&&&&
	            &&&&&&&&&&$*                 _,,                ,&&&&&&&&&&&
	            &&&&&&&&&&&&           ,==="" / \\,             =$&&&&&&&&&&
	            &&&&&&&&&0=;        "##,  //}*""\\_\            =%&&&&&&&&&&
	            &&&&&&&&&$&*        /}"##;// {}    \##           ;*%0&&&&&&&
	            &&&&&&&&&$$%     =##,\ /##  ,;*;, ,##\,##=      =&$$&&&&&&&&
	            &&&&&&&&&$&;      /##}// ##;{%#%};##' ##        =&$$&&&&&&&&
	            &&&&&&&$$$%,     // "##  ,{%%###%%}, ##\_       ,0$$$&&&&&&&
	            &&&&&&&$$&;      \\  \##,{%%#####%%},# //        ;&$$&&&&&&&
	            &&&&&&$$$$=      \\   \ {%%#######%%} //         =0&$&&&&&&&
	            &&&&&&$$$$%       \\  \##"{%%###%%}"##/          =*&$$&&&&&&
	            &&&&&&$$$=,        \\ ## ,#,{%#%},#, '#,         ,&$$$&&&&&&
	            &&&&&&$$$%          ,## \# {\0%0/} #//            *$$$&&&&&&
	            &&&&&&$$&;          , "=;#\ 'v"v'  #/   ,         *$$$$&&&&&
	            &&&&&$$$$;        ,%*    "#\,    ,#/   *%,        %$$$$&&&&&
	            &&&&&&$$$*        ;&, , *,  \\  / ,* , ,&;        *$$$&&&&&&
	            &&&&&&$$%         ;&,   0=   "\/  =0   ,&;         ;0$&&&&&&
	            &&&&&&$$*          %%  =&,        ,&=  %%          %&$&&&&&&
	            &&&&&$&;            %0%&=          =&%0%           =&&&&&&&&
	            &&&&&&&%=            ,;              ;,            ,=%&&&&&&
	            &&&&&&$0=                                          *$$&&&&&&
	            &&&&&&$%,                                          0$&&&&&&&
```
---

## Overview
SpiderCat is an advanced reconnaissance payload that aims to con*cat*anate targets into an [Obsidian](https://obsidian.md) *spider* web framework. It allows security professionals to keep track of their targets and how they are connected. SpiderCat conducts advanced reconnaissance on targets, gathering intel such as the users email, systems information, geolocation and saved Wi-Fi hotspots. Using Obsidian's advanced markdown mapping capabilities, SpiderCat is able to connect **all** of your targets based off of the reconnaissance conducted on them.

![SpiderCat Obsidian Nodes](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/nodes.png)

**Key Features**:
- Build a network of all your compromised targets
- See if two targets have been on the same network before
- Compromise saved network credentials of your targets
- Advanced search and filtering of target data
- See common geolocation related data between targets
- Crucial IP related information

## Resources:
- [YouTube Video](https://youtu.be/qyLlB_oiOXM)
- [YouTube Channel](https://youtube.com/cosmodiumcs)
- [Website](https://cosmodiumcs.com)

## Requirements:
**Attacker PC:**
- Obsidian 
- "Obsidian Webhook" Community Plugin

**Target PC:**
- Windows 10/11

## Installation:
1. clone this repository
```bash
git clone https://github.com/CosmodiumCS/SpiderCat.git
```
2. open repository in Obsidian
3. create an [obsidian webhook](https://github.com/CosmodiumCS/SpiderCat#making-obsidian-webhooks)
4. on line 7 of `spidercat.ps1`, replace `WEBHOOK` with your Obsidian Webhook
5. load the `spidercat.ps1` on to a target and enjoy! :)

## Feature View:
- target profile builds
![target profile builds](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/profile.png)

- ip information

![ip information](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/ip-information.png)

- geolocation

![geolocation](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/geolocation.png)

- wifi nodes

![wifi nodes](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/wifi-nodes.png)

- wifi profiles

![wifi profiles](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/blue-wifi.png)

- target execution

![target execution](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/censored-nodes.png)

## Making Obsidian Webhooks:
1. go to your settings an select the `Webhook Plugin` and select the `Obsidian Webhooks` link
![webhook1](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/webhook1.png)
2. once the link is open, select "Sign in with Google"
![webhook2](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/webhook2.png)
3. once you have logged in, select "Create Obsidian Sign in Token"
![webhook3](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/webhook3.png)
4. copy your token and paste it into the "Webhook login token" section of your Obsidian notebook. then select `Login`
![webhook4](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/webhook4.png)
5. select the "Linux, Unix or Mac style new lines" for the "New Line" section of your Obsidian notebook
![webhook5](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/webhook5.png)
6. Now that you are signed in, copy and paste your webhook into the `spidercat.ps1` script
	- be sure to remove the `?path=test/spotify.md` from the webhook
![webhook6](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/webhook6.png)

## Credits:
- huge shout out to OreoByte for developing the ASCII art for this project, check out his work [here](https://github.com/OreoByte/art-pool-current/blob/master/program_ascii_art/cat_spider_eye_v2_no_legs.txt)
