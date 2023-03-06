# Spider Cat
> Blue Cosmo & I am Jakoby
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
Spider Cat is a payload developed by [Blue Cosmo](https://github.com/PrettyBoyCosmo), in assistance with "[I am Jakoby](https://github.com/I-Am-Jakoby)". It aims to con*cat*anate targets into an [Obsidian](https://obsidian.md) *spider* web framework. It allows security professionals to keep track of their targets and how they are connected. Spider Cat conducts advanced reconnaissance on targets, gathering intel such as the users email, systems information, geolocation and saved Wi-Fi hotspots. Using Obsidian's advanced markdown mapping capabilities, Spider Cat is able to connect **all** of your targets based off of the reconnaissance conducted on them.


![Spider Cat Obsidian Nodes](https://github.com/CosmodiumCS/SpiderCat/blob/main/assets/nodes.png)

**Key Features**:
- Build a network of all your compromised targets
- See if two targets have been on the same network before
- Compromise saved network credentials of your targets
- Search and filter throuth the network of compromised targets for data

## Resources:
- [YouTube Video](https://www.youtube.com/shorts/OW6Z_2jYutk)
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
3. create an obsidian webhook
4. on line 7 of `spidercat.ps1`, replace `WEBHOOK` with your Obsidian Webhook
5. load the `spidercat.ps1` on to a target and enjoy! :)

## Extraneous:
