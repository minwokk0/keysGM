local IN=Instance.new local U2=UDim2.new local UD=UDim.new local CR=Color3.fromRGB local TX=Enum.TextXAlignment local ES=Enum.EasingStyle local ED=Enum.EasingDirection local EF=Enum.Font local XU=Enum.UserInputType local XK=Enum.KeyCode local XR=Enum.SortOrder local XA=Enum.AutomaticSize local XC=Enum.CoreGuiType local TY=Enum.TextYAlignment local TT=Enum.TextTruncate local TSV=game:GetService('TweenService') local TSC=function(a,b,c) return TSV:Create(a,b,c) end local UO=UDim2.fromOffset local US=UDim2.fromScale local VX=Vector2.new local MFL=math.floor local SFM=string.format local TDL=task.delay local SSB=string.sub local QQ=pcall local TSP=task.spawn local NSK=NumberSequenceKeypoint.new local CSN=ColorSequence.new local NSN=NumberSequence.new local SGM=string.match local SLW=string.lower local GGS=function(s) return game:GetService(s) end local TBI=table.insert local TCN=table.concat local SRP=string.rep local SUP=string.upper local SFD=string.find local IUC=function() return Instance.new('UICorner') end local INF=function() return Instance.new('Frame') end local ITL=function() return Instance.new('TextLabel') end local ITB=function() return Instance.new('TextButton') end local IUS=function() return Instance.new('UIStroke') end local IUP=function() return Instance.new('UIPadding') end local IUL=function() return Instance.new('UIListLayout') end local IIL=function() return Instance.new('ImageLabel') end local ISG=function() return Instance.new('ScreenGui') end local ITX=function() return Instance.new('TextBox') end local OCL=os.clock local EM=Enum.Material local CFN=CFrame.new local IP=ipairs local PR=pairs local TS=tostring local TN=tonumber local UIS=game:GetService('UserInputService') local HST=Enum.HumanoidStateType local TW=task.wait local OD=os.date local MN=math.min local MX=math.max local SG=string.gsub local WF=writefile local EFB=Enum.Font.GothamBold local EFM=Enum.Font.GothamMedium local EFG=Enum.Font.Gotham local GC=function(o) return o:GetChildren() end local GD=function(o) return o:GetDescendants() end local FFC=function(o,c) return o:FindFirstChildOfClass(c) end local FF=function(o,...) return o:FindFirstChild(...) end local WFC=function(o,...) return o:WaitForChild(...) end local CN=function(s,f) return s:Connect(f) end local GPS=function(o,p) return o:GetPropertyChangedSignal(p) end local LWR=function(s) return s:lower() end local UPR=function(s) return s:upper() end local IUG=function() return Instance.new('UIGradient') end local IWC=function() return Instance.new('WeldConstraint') end local GCA=getcustomasset local ISF=isfile local SCT=Enum.ScaleType local EFZ=Enum.Font.GrenzeGotisch local AC1=CR(167,108,255) local AC2=CR(255,255,255) local AC3=CR(22,14,36) local AC4=CR(120,70,200) local AC5=CR(216,208,235) local TWI=function(...) return TweenInfo.new(...) end local TXL=Enum.TextXAlignment.Left local TYC=Enum.TextYAlignment.Center local TYT=Enum.TextYAlignment.Top local ESQ=ES.Quart local ESB=ES.Back
local GM_ENV=(type(getgenv)=="function") and getgenv() or _G
print("[GM] build 2026-10-10-B")
if GM_ENV.__GHOST_METHOD_ACTIVE or GM_ENV.GHOST_METHOD_LOADED then
if GM_ENV.GM_FORCE then
GM_ENV.GM_FORCE=nil
GM_ENV.__GHOST_METHOD_ACTIVE=nil
GM_ENV.GHOST_METHOD_LOADED=nil
print("[Ghost Method] GM_FORCE detected - guard cleared, re-executing.")
else
warn("[Ghost Method] Double execution detected - already running. Second execution ignored.")
warn("[Ghost Method] Si el menu no responde: ejecuta getgenv().GM_FORCE = true y re-ejecuta.")
return
end
end
GM_ENV.__GHOST_METHOD_ACTIVE=true
GM_ENV.GHOST_METHOD_LOADED=true
local zzV1={}
zzV1.language="en"
local function gmT(es,en)
if zzV1.language=="en" then
return en or es
end
return es
end
zzV1.soundsOn=true
local SND_POOL={}
local SND_KINDS={
click={id="rbxasset://sounds/electronicpingshort.wav",speed=0.72,vol=0.16},
toggleOn={id="rbxasset://sounds/electronicpingshort.wav",speed=0.95,vol=0.20},
toggleOff={id="rbxasset://sounds/electronicpingshort.wav",speed=0.62,vol=0.18},
slider={id="rbxasset://sounds/electronicpingshort.wav",speed=1.15,vol=0.05},
hover={id="rbxasset://sounds/electronicpingshort.wav",speed=1.4,vol=0.03},
pop={id="rbxasset://sounds/electronicpingshort.wav",speed=0.85,vol=0.14},
open={id="rbxasset://sounds/swoosh.wav",speed=0.78,vol=0.14},
close={id="rbxasset://sounds/swoosh.wav",speed=1.05,vol=0.14},
}
zzV1.uiSound=function(kind)
if not zzV1.soundsOn then
return
end
local def=SND_KINDS[kind]
if not def then
return
end
local s=SND_POOL[kind]
if s==nil then
local created
QQ(function()
created=IN("Sound")
created.SoundId=def.id
created.Parent=GGS("SoundService")
end)
if created then
SND_POOL[kind]=created
s=created
else
SND_POOL[kind]=false
return
end
elseif s==false then
return
end
QQ(function()
s:Stop()
s.PlaybackSpeed=def.speed
s.Volume=def.vol
s:Play()
end)
end
zzV1.uiSoundSetEnabled=function(on)
zzV1.soundsOn=on and true or false
if not on then
for _,s in PR(SND_POOL) do
if s then
QQ(function()
s:Stop()
end)
end
end
end
end
local zI1="https://raw.githubusercontent.com/minwokk0/keysGM/main/images/"
local zI2={
"GM_logo.png",
"GM_Calabaza.png",
"GM_rank_wraith.png",
"GM_rank_esmerald.png",
"GM_rank_sapphire.png",
"GM_rank_eclipse.png",
"GM_icon_hud.png",
"GM_icon_move.png",
"GM_icon_eye.png",
"GM_icon_sparkle.png",
"GM_icon_sliders.png",
"GM_icon_gear.png",
}
zzV1.zI3=function()
if not(isfile and writefile) then
return
end
local zI4=0
for _,fname in IP(zI2) do
if not ISF(fname) then
QQ(function()
local body=game:HttpGet(zI1..fname)
if type(body)=="string" and #body>100 then
WF(fname,body)
zI4=zI4+1
end
end)
end
end
if zI4>0 then
print("[Ghost Method] "..zI4.." imagenes descargadas automaticamente")
end
end
zzV1.zI3()
zzV1.accessData=nil
zzV1.accessToken=nil
local function zzV5(a,b,c)
local t=bit32.band(TN(a) or 0,0xffffffff)
local ub=#TS(b)
local uc=#TS(c)
t=bit32.bxor(t,bit32.lshift(ub,11))
t=bit32.bxor(t,bit32.lshift(uc,5))
t=bit32.band(t+0x9e3779b9,0xffffffff)
t=bit32.bxor(t,bit32.rshift(t,7))
t=bit32.band(t*17+uc,0xffffffff)
t=bit32.bxor(t,bit32.lshift(bit32.band(ub,0xff),13))
return bit32.band(t,0xffffffff)
end
zzV1.accessOk=function()
local tok=zzV1.accessToken
local dat=zzV1.accessData
if type(tok)~="number" or type(dat)~="table" then
return false
end
local exp=TN(dat.expires)
if not exp or os.time()>exp then
return false
end
return tok==zzV5(dat.expires,dat.user,dat.key)
end
local GuiParent
local LocalPlayer
local SplashRef
local LAST_STEP="script start"
local function markStep(yL)
LAST_STEP=yL
print("[GM] "..yL)
end
local function bootCrash(report)
local reportText=TS(report)
local message=reportText
local trace="(no traceback available from this executor)"
local nl=SFD(reportText,"\n",1,true)
if nl then
message=SSB(reportText,1,nl - 1)
trace=SSB(reportText,nl+1)
end
print("=================================================================")
print("[Ghost Method] BOOT CRASH after step: "..LAST_STEP)
print("[Ghost Method] Error: "..message)
print(trace)
print("=================================================================")
QQ(function()
local lines={
"Ghost Method boot crash:",
"failed after step: "..LAST_STEP,
"",
"error:",
message,
"",
"traceback:",
trace,
}
WF("GM_bootlog.txt",TCN(lines,"\n"))
end)
local shown=false
if zzV1 and type(zzV1.toast)=="function" then
shown=QQ(function()
zzV1.toast(
"Ghost Method - boot error",
"Failed after ["
..LAST_STEP
.."]  |  "
..SSB(message,1,260),
5
)
end)
end
if not shown then
QQ(function()
local parent
if LocalPlayer then
parent=FFC(LocalPlayer, "PlayerGui")
end
if not parent then
parent=GuiParent or GGS("CoreGui")
end
local banner=ISG()
banner.Name="GM_BootCrash"
banner.ResetOnSpawn=false
banner.DisplayOrder=2147483647
banner.Parent=parent
local frame=INF()
frame.AnchorPoint=VX(0.5,0.5)
frame.Position=U2(0.5,0,0.5,0)
frame.Size=U2(0,520,0,120)
frame.BackgroundColor3=CR(16,10,26)
frame.BackgroundTransparency=0.05
frame.BorderSizePixel=0
frame.Parent=banner
IN("UICorner",frame).CornerRadius=UD(0,12)
local y8=IUS()
y8.Color=CR(255,80,80)
y8.Thickness=2
y8.Parent=frame
local title=ITL()
title.BackgroundTransparency=1
title.Position=U2(0,14,0,8)
title.Size=U2(1,-28,0,22)
title.Font=EFB
title.Text="GHOST METHOD | BOOT ERROR"
title.TextColor3=CR(255,120,120)
title.TextSize=17
title.TextXAlignment=TXL
title.Parent=frame
local body=ITL()
body.BackgroundTransparency=1
body.Position=U2(0,14,0,34)
body.Size=U2(1,-28,1,-44)
body.Font=EF.Code
body.Text="["..LAST_STEP.."]  "..message
body.TextColor3=CR(238,234,248)
body.TextSize=14
body.TextWrapped=true
body.TextXAlignment=TXL
body.TextYAlignment=TYT
body.Parent=frame
TDL(15,function()
banner:Destroy()
end)
end)
end
if SplashRef then
QQ(function()
SplashRef:Destroy()
end)
SplashRef=nil
end
QQ(function()
local splashBlur=GGS("Lighting"):FindFirstChild("GM_SplashBlur")
if splashBlur then
splashBlur:Destroy()
end
end)
GM_ENV.__GHOST_METHOD_ACTIVE=nil
GM_ENV.GHOST_METHOD_LOADED=nil
end
local function buildGhostUI(ctx)
local TweenService=ctx.TweenService
local UserInputService=ctx.UserInputService
local LocalPlayer=ctx.LocalPlayer
local Workspace=GGS("Workspace")
local C_WINDOW=CR(10,8,15)
local C_SIDEBAR=CR(14,11,20)
local C_CARD=CR(18,16,26)
local C_PILL=CR(26,22,38)
local C_HOVER=CR(34,28,46)
local C_PROFILE=CR(22,18,32)
local C_POPUP=CR(32,26,44)
local C_POPUP_HOVER=CR(46,38,62)
local C_TRACK_OFF=CR(40,36,54)
local C_KNOB_OFF=CR(210,206,220)
local C_TRACK_ON=AC2
local C_KNOB_ON=CR(20,16,28)
local C_TEXT=CR(232,228,240)
local C_DIM=CR(154,144,168)
local C_OFF=CR(160,152,176)
local C_ACCENT=AC1
local C_RED=CR(239,68,68)
local C_DANGER_BG=CR(46,22,24)
local C_DANGER_HOVER=CR(64,30,32)
local WIN_W,WIN_H=590,410
local WIN_FONT=EFG
local WIN_FONT_MED=EFM
local WIN_FONT_BOLD=EFB
local WIN_FONT_GOTHIC=EFZ
local TOUCH=UIS.TouchEnabled and not UIS.KeyboardEnabled
local SIDEBAR_W=TOUCH and 172 or 158
local TOGGLE_ROW_H=TOUCH and 40 or 28
local SWITCH_W=TOUCH and 48 or 42
local SWITCH_H=TOUCH and 26 or 22
local KNOB_D=TOUCH and 18 or 16
local CTRL_ROW_H=TOUCH and 44 or 30
local PILL_H=TOUCH and 34 or 28
local BTN_H=TOUCH and 42 or 32
local BTN_FULL_H=TOUCH and 46 or 36
local GRID_PAD_Y=TOUCH and 12 or 8
local CARD_GAP=TOUCH and 10 or 8
local POPUP_OPT_H=TOUCH and 34 or 24
local POPUP_OPT_GAP=TOUCH and 4 or 2
local TRACK_H=TOUCH and 14 or 10
local TRACK_KNOB_D=TOUCH and 28 or 22
local uiConns={}
local function bindConn(conn)
uiConns[#uiConns+1]=conn
return conn
end
local root=ISG()
root.Name="GM_UI"
root.ResetOnSpawn=false
root.IgnoreGuiInset=true
root.DisplayOrder=500
root.Parent=ctx.GuiParent
CN(root.Destroying, function()
for _,c in IP(uiConns) do
QQ(function()
c:Disconnect()
end)
end
end)
local uiScale=IN("UIScale")
uiScale.Parent=root
local zzS=1
local function zzT()
local cam=Workspace.CurrentCamera
if not cam then
return
end
local vp=cam.ViewportSize
local s=MN((vp.X - 30)/WIN_W,(vp.Y - 30)/WIN_H,1)
if s<0.55 then
s=0.55
end
zzS=s
uiScale.Scale=s
end
zzT()
bindConn(GPS(Workspace, "CurrentCamera"):Connect(function()
zzT()
local cam=Workspace.CurrentCamera
if cam then
bindConn(GPS(cam, "ViewportSize"):Connect(zzT))
end
end))
local shadows={}
do
local defs={{8,0.84},{18,0.92},{30,0.955}}
for i,def in IP(defs) do
local sh=INF()
sh.Name="Shadow"..i
sh.AnchorPoint=VX(0.5,0.5)
sh.Position=U2(0.5,0,0.5,0)
sh.Size=UO(WIN_W+def[1]*2,WIN_H+def[1]*2)
sh.BackgroundColor3=Color3.new(0,0,0)
sh.BackgroundTransparency=def[2]
sh.BorderSizePixel=0
sh.ZIndex=1
local sc=IUC()
sc.CornerRadius=UD(0,14+def[1])
sc.Parent=sh
sh.Parent=root
shadows[i]=sh
end
end
local main=INF()
main.Name="Main"
main.AnchorPoint=VX(0.5,0.5)
main.Position=U2(0.5,0,0.5,0)
main.Size=UO(WIN_W,WIN_H)
main.BackgroundColor3=C_WINDOW
main.BackgroundTransparency=0.05
main.BorderSizePixel=0
main.ClipsDescendants=true
main.ZIndex=2
local mainCorner=IUC()
mainCorner.CornerRadius=UD(0,18)
mainCorner.Parent=main
local mainStroke=IUS()
mainStroke.Name="MainStroke"
mainStroke.Color=C_ACCENT
mainStroke.Thickness=1
mainStroke.Transparency=0.75
mainStroke.Parent=main
local strokeGrad=IUG()
strokeGrad.Rotation=90
strokeGrad.Color=CSN(
AC4,
CR(80,50,160)
)
strokeGrad.Transparency=NSN({
NSK(0,0.6),
NSK(0.5,0.75),
NSK(1,0.6),
})
strokeGrad.Parent=mainStroke
main.Parent=root
local zzA=INF()
zzA.Name="GM_SnakeBorder"
zzA.AnchorPoint=VX(0,0)
zzA.BackgroundTransparency=1
zzA.BorderSizePixel=0
zzA.ZIndex=3
local snakeBC=IUC()
snakeBC.CornerRadius=UD(0,20)
snakeBC.Parent=zzA
local snakeFrame=IUS()
snakeFrame.Color=CR(108,72,168)
snakeFrame.Thickness=1.6
snakeFrame.Transparency=0.42
snakeFrame.Parent=zzA
zzA.Parent=root
local zzB=INF()
zzB.Name="SnakeHead"
zzB.AnchorPoint=VX(0.5,0.5)
zzB.BackgroundColor3=CR(214,176,255)
zzB.BackgroundTransparency=0.05
zzB.BorderSizePixel=0
zzB.ZIndex=4
local shC=IUC()
shC.CornerRadius=UD(1,0)
shC.Parent=zzB
local shGlow=IUS()
shGlow.Color=AC1
shGlow.Thickness=7
shGlow.Transparency=0.42
shGlow.Parent=zzB
zzB.Parent=zzA
local zzC=INF()
zzC.Name="SnakeTail"
zzC.AnchorPoint=VX(0.5,0.5)
zzC.BackgroundColor3=CR(160,105,235)
zzC.BackgroundTransparency=0.3
zzC.BorderSizePixel=0
zzC.ZIndex=4
local stC=IUC()
stC.CornerRadius=UD(1,0)
stC.Parent=zzC
local stGlow=IUS()
stGlow.Color=CR(150,95,230)
stGlow.Thickness=4
stGlow.Transparency=0.6
stGlow.Parent=zzC
zzC.Parent=zzA
local zzD=zzB:Clone()
zzD.Name="SnakeHead2"
zzD.BackgroundColor3=CR(172,124,240)
zzD.BackgroundTransparency=0.22
local s2hg=FFC(zzD, "UIStroke")
if s2hg then
s2hg.Transparency=0.56
s2hg.Thickness=5
end
zzD.Parent=zzA
local zzE=zzC:Clone()
zzE.Name="SnakeTail2"
zzE.BackgroundTransparency=0.5
zzE.BackgroundColor3=CR(140,92,215)
zzE.Parent=zzA
do
local zzK=0
local zzJ=0
local zzI=main.Visible
local zzP=1/7.5
local zzQ=8
local zzR=74
local function zzG(d,W,H)
local P=2*(W+H)
d=((d%P)+P)%P
if d<W then
return d,0,true
elseif d<W+H then
return W,d - W,false
elseif d<2*W+H then
return W -(d - W - H),H,true
else
return 0,H -(d - 2*W - H),false
end
end
local function zzH(d,W,H)
local P=2*(W+H)
d=((d%P)+P)%P
if d<W then
return d,W
elseif d<W+H then
return d - W,H
elseif d<2*W+H then
return d - W - H,W
else
return d - 2*W - H,H
end
end
local function zzF(headObj,tailObj,headD,W,H,tailMax)
local hx,hy=zzG(headD,W,H)
headObj.Position=UO(hx,hy)
headObj.Size=UO(zzQ,zzQ)
local s=zzH(headD,W,H)
local tailLen=MX(6,MN(tailMax,s))
local cD=headD - tailLen/2
local cx,cy,horiz=zzG(cD,W,H)
tailObj.Position=UO(cx,cy)
if horiz then
tailObj.Size=UO(tailLen,3)
else
tailObj.Size=UO(3,tailLen)
end
end
bindConn(GGS("RunService").RenderStepped:Connect(function(dt)
local open=main.Visible and main.Parent~=nil and main.AbsoluteSize.X>10
if open~=zzI then
zzI=open
if open then
zzJ=0
end
end
zzA.Visible=open
if not open then
return
end
local S=uiScale.Scale
if S<=0.01 then
S=1
end
local mp=main.AbsolutePosition - root.AbsolutePosition
local ms=main.AbsoluteSize
local wx=(mp.X/S) - 3
local wy=(mp.Y/S) - 3
local ww=(ms.X/S)+6
local wh=(ms.Y/S)+6
zzA.Position=UO(wx,wy)
zzA.Size=UO(ww,wh)
zzJ+=dt
local speed=zzP*(1+3.6*math.exp(-1.9*zzJ))
zzK=(zzK+speed*dt)%1
local W=ww
local H=wh
local P=2*(W+H)
local headD=zzK*P
zzF(zzB,zzC,headD,W,H,zzR)
zzF(zzD,zzE,headD+P/2,W,H,zzR - 16)
end))
end
do
local zzL=INF()
zzL.Name="GM_Meteors"
zzL.BackgroundTransparency=1
zzL.Size=US(1,1)
zzL.ZIndex=2
zzL.Parent=main
local MDEFS={
{22,40,1.4,0.62,42,70},
{44,66,2.0,0.48,80,125},
{70,108,2.6,0.36,145,205},
}
local MTIERS={1,1,1,1,2,2,2,3,3}
local zzO=Random.new()
local zzM={}
local function zzN(m,W)
local def=MDEFS[m.tier]
m.len=zzO:NextNumber(def[1],def[2])
m.frame.Size=UO(m.len,def[3])
m.frame.Rotation=m.rot
m.frame.BackgroundTransparency=def[4]+zzO:NextNumber(-0.07,0.07)
local sp=zzO:NextNumber(def[5],def[6])
local a=math.rad(m.rot)
m.vx=math.cos(a)*sp
m.vy=math.sin(a)*sp
if zzO:NextNumber()<0.6 then
m.x=zzO:NextNumber(-10,W)
m.y=-m.len - zzO:NextNumber(8,40)
else
m.x=-m.len - zzO:NextNumber(8,40)
m.y=zzO:NextNumber(-10,260)
end
m.frame.Position=UO(m.x,m.y)
end
for i=1,#MTIERS do
local tier=MTIERS[i]
local f=INF()
f.Name="Meteor"..i
f.AnchorPoint=VX(0.5,0.5)
f.BackgroundColor3=CR(208,178,255)
f.BorderSizePixel=0
f.ZIndex=2
f.Visible=false
local mc=IUC()
mc.CornerRadius=UD(1,0)
mc.Parent=f
local ms=IUS()
ms.Color=AC1
ms.Thickness=2
ms.Transparency=0.66
ms.Parent=f
local mg=IUG()
mg.Color=CSN(CR(110,72,185),CR(224,198,255))
mg.Transparency=NSN(1,0.3)
mg.Parent=f
f.Parent=zzL
local m={
frame=f,
tier=tier,
rot=zzO:NextNumber(18,40),
x=0,
y=0,
vx=0,
vy=0,
len=30,
}
zzM[i]=m
zzN(m,WIN_W)
local t0=zzO:NextNumber(0.5,7)
m.x+=m.vx*t0
m.y+=m.vy*t0
if m.x - m.len>WIN_W or m.y - m.len>WIN_H then
zzN(m,WIN_W)
else
f.Visible=true
f.Position=UO(m.x,m.y)
end
end
bindConn(GGS("RunService").RenderStepped:Connect(function(dt)
if dt>0.05 then
dt=0.05
end
local W=main.Size.X.Offset
local H=main.Size.Y.Offset
if not main.Visible or H<90 then
zzL.Visible=false
return
end
zzL.Visible=true
for i=1,#zzM do
local m=zzM[i]
m.x+=m.vx*dt
m.y+=m.vy*dt
if m.x - m.len>W or m.y - m.len>H then
zzN(m,W)
else
m.frame.Position=UO(m.x,m.y)
end
end
end))
end
do
local zc1=nil
QQ(function()
if isfile and readfile and ISF("GM_Calabaza.png") then
local data=readfile("GM_Calabaza.png")
if #data>100 then
local fn="GM_p_"..TS(MFL(OCL()*1000))..".png"
WF(fn,data)
zc1=GCA(fn)
end
end
end)
if zc1 then
local glow=INF()
glow.Name="GM_PumpkinGlow"
glow.AnchorPoint=VX(0.5,0.5)
glow.BackgroundColor3=CR(255,138,40)
glow.BackgroundTransparency=0.62
glow.BorderSizePixel=0
glow.ZIndex=1
local gc=IUC()
gc.CornerRadius=UD(1,0)
gc.Parent=glow
local gg=IUG()
gg.Color=CSN(CR(255,170,60),CR(210,80,20))
gg.Parent=glow
glow.Visible=false
glow.Parent=root
local zc2=IIL()
zc2.Name="GM_Pumpkin"
zc2.AnchorPoint=VX(0.5,0.5)
zc2.BackgroundTransparency=1
zc2.Size=UO(70,70)
zc2.ScaleType=SCT.Fit
zc2.Image=zc1
zc2.ZIndex=5
zc2.Visible=false
zc2.Parent=root
local zc4=OCL()
bindConn(GGS("RunService").RenderStepped:Connect(function(dt)
local open=main.Visible and main.Parent~=nil
glow.Visible=open
zc2.Visible=open
if not open then
return
end
local S=uiScale.Scale
if S<=0.01 then
S=1
end
local mp=(main.AbsolutePosition - root.AbsolutePosition)/S
local ms=main.AbsoluteSize/S
local cx=mp.X+ms.X/2
local topY=mp.Y
zc4+=dt
local zc5=math.noise(zc4*1.7,0,0)
local zc6=math.noise(0,zc4*0.9,7.3)*9
local zc7=math.noise(zc4*5.2,9.1,0)
local zc8=0.5+0.5*zc5+0.22*zc7
zc2.Position=UO(cx,topY - 14)
local zc3=108+22*zc8
glow.Size=UO(zc3,zc3)
glow.Position=UO(cx+zc6,topY+2)
glow.BackgroundTransparency=0.78 - 0.3*math.clamp(zc8,0,1)
gg.Rotation=(gg.Rotation+dt*(26+60*math.clamp(zc7,0,1)))%360
end))
end
end
local popLayer=INF()
popLayer.Name="PopLayer"
popLayer.BackgroundTransparency=1
popLayer.Size=US(1,1)
popLayer.Visible=true
popLayer.ZIndex=40
popLayer.Parent=main
local popups={}
local function closeAllPopups()
for _,p in IP(popups) do
p.close()
end
end
local content=INF()
content.Name="Content"
content.BackgroundTransparency=1
content.Position=UO(SIDEBAR_W,0)
content.Size=U2(1,-SIDEBAR_W,1,0)
content.ZIndex=3
content.Parent=main
local pages={}
local pageOrder=0
local function mkPage()
pageOrder+=1
local y6=IN("ScrollingFrame")
y6.Name="Page"..pageOrder
y6.Visible=false
y6.BackgroundTransparency=1
y6.BorderSizePixel=0
y6.Size=US(1,1)
y6.CanvasSize=U2(0,0,0,0)
y6.AutomaticCanvasSize=XA.Y
y6.ScrollBarThickness=5
y6.ScrollBarImageColor3=CR(170,170,170)
y6.ScrollBarImageTransparency=0.5
y6.ScrollingDirection=Enum.ScrollingDirection.Y
y6.ElasticBehavior=Enum.ElasticBehavior.WhenScrollable
y6.Active=true
y6.ZIndex=3
local pad=IUP()
pad.PaddingTop=UD(0,12)
pad.PaddingBottom=UD(0,14)
pad.PaddingLeft=UD(0,14)
pad.PaddingRight=UD(0,10)
pad.Parent=y6
local lay=IUL()
lay.Padding=UD(0,12)
lay.SortOrder=XR.LayoutOrder
lay.Parent=y6
y6.Parent=content
pages[pageOrder]=y6
return y6
end
local function mkIcon(parent,kind,tint)
local y4=INF()
y4.Name="Icon_"..kind
y4.BackgroundTransparency=1
y4.Size=UO(16,16)
local pieces={}
local function bar(x,y,w,h,rot,filled,round)
local g=INF()
g.BorderSizePixel=0
g.Position=UO(x - 1,y - 1)
g.Size=UO(w+2,h+2)
g.Rotation=rot or 0
g.Parent=y4
if filled then
g.BackgroundColor3=tint
g.BackgroundTransparency=0.84
if round then
local gc=IUC()
gc.CornerRadius=UD(1,0)
gc.Parent=g
end
else
g.BackgroundTransparency=1
local gs=IUS()
gs.Thickness=2.5
gs.Color=tint
gs.Transparency=0.86
gs.Parent=g
if round then
local gc=IUC()
gc.CornerRadius=UD(1,0)
gc.Parent=g
end
end
local f=INF()
f.BorderSizePixel=0
f.Position=UO(x,y)
f.Size=UO(w,h)
f.Rotation=rot or 0
if filled then
f.BackgroundColor3=tint
pieces[#pieces+1]={frame=f}
else
f.BackgroundTransparency=1
local st=IUS()
st.Thickness=1.5
st.Color=tint
st.Parent=f
pieces[#pieces+1]={frame=f,y8=st}
end
if round then
local cr=IUC()
cr.CornerRadius=UD(1,0)
cr.Parent=f
end
f.Parent=y4
end
if kind=="hud" then
bar(2,2,12,12,45,false,true)
bar(6,6,4,4,0,true,true)
elseif kind=="move" then
bar(7,2,2,11,0,true,true)
bar(3.5,4.5,7,2,45,true,true)
bar(5.5,4.5,7,2,-45,true,true)
elseif kind=="eye" then
bar(1,3,14,10,0,false,true)
bar(6,6,4,4,0,true,true)
bar(-1.5,6.5,4,3,45,true,true)
bar(13.5,6.5,4,3,-45,true,true)
elseif kind=="sparkle" then
bar(3.5,3.5,9,9,45,false)
bar(12,1.5,3,3,0,true,true)
bar(0.5,11,2,2,0,true,true)
bar(12.5,12,1.5,1.5,0,true,true)
elseif kind=="sliders" then
bar(1,3,14,1.5,0,true)
bar(10,1.5,4,4,0,true,true)
bar(1,7.25,14,1.5,0,true)
bar(4,5.75,4,4,0,true,true)
bar(1,11.5,14,1.5,0,true)
bar(8,10.25,4,4,0,true,true)
elseif kind=="music" then
bar(4,4,2,8,0,true,true)
bar(10,4,2,8,0,true,true)
bar(3,2,10,2.5,0,true)
bar(1.5,10,5.5,4.5,0,true,true)
bar(8.5,10,5.5,4.5,0,true,true)
elseif kind=="gear" then
bar(3,3,10,10,45,false,true)
bar(6.5,6.5,3,3,0,true,true)
bar(7,0.5,2,4,0,true,true)
bar(7,11.5,2,4,0,true,true)
bar(0.5,7,4,2,0,true,true)
bar(11.5,7,4,2,0,true,true)
bar(1.5,1.5,3,3,45,true,true)
bar(11.5,1.5,3,3,-45,true,true)
bar(1.5,11.5,3,3,-45,true,true)
bar(11.5,11.5,3,3,45,true,true)
end
y4.Parent=parent
local api={frame=y4}
function api.tint(color)
for _,p in IP(pieces) do
if p.y8 then
p.y8.Color=color
else
p.frame.BackgroundColor3=color
end
end
for _,d in IP(GC(y4)) do
if d:IsA("Frame") and d~=api.frame then
local gs=FFC(d, "UIStroke")
if gs then
gs.Color=color
elseif d.BackgroundTransparency>0.5 then
d.BackgroundColor3=color
end
end
end
end
return api
end
local sidebar=INF()
sidebar.Name="Sidebar"
sidebar.Size=U2(0,SIDEBAR_W,1,0)
sidebar.BackgroundColor3=C_SIDEBAR
sidebar.BorderSizePixel=0
sidebar.ZIndex=3
local sbCorner=IUC()
sbCorner.CornerRadius=UD(0,14)
sbCorner.Parent=sidebar
sidebar.Parent=main
local logoImg=nil
local rankImg=nil
local function gmLoadRankAsset(rank)
if not(isfile and readfile) then
return nil
end
local tryFiles={}
if type(rank)=="string" and #rank>0 then
tryFiles[#tryFiles+1]="GM_rank_"..rank..".png"
end
tryFiles[#tryFiles+1]="GM_rank_eclipse.png"
for _,fn in IP(tryFiles) do
if ISF(fn) then
local okData,data2=QQ(readfile,fn)
if okData and type(data2)=="string" and #data2>100 then
local fname2="GM_r_"..TS(MFL(OCL()*1000))..".png"
if QQ(writefile,fname2,data2) then
return GCA(fname2)
end
end
end
end
return nil
end
QQ(function()
if isfile and readfile and ISF("GM_logo.png") then
local data=readfile("GM_logo.png")
if #data>100 then
local fname="GM_l_"..TS(MFL(OCL()*1000))..".png"
WF(fname,data)
logoImg=GCA(fname)
end
end
rankImg=gmLoadRankAsset(zzV1.keyRank)
end)
local rankDef={x=54,y=-19,s=88,r=0}
local logoDef={x=-16,y=3,s=44}
local rankPos=type(ctx.getRankPos)=="function" and ctx.getRankPos() or nil
if type(rankPos)~="table" then
rankPos=rankDef
end
local logoPos=type(ctx.getLogoPos)=="function" and ctx.getLogoPos() or nil
if type(logoPos)~="table" then
logoPos=logoDef
end
local logo=IIL()
logo.Name="Logo"
logo.BackgroundTransparency=1
logo.Position=UO(logoPos.x,logoPos.y)
logo.Size=UO(SIDEBAR_W - 62,logoPos.s)
logo.ScaleType=SCT.Fit
logo.Image=logoImg or ""
logo.ZIndex=4
logo.Parent=sidebar
if not logoImg then
logo:Destroy()
local logoText=ITL()
logoText.Name="Logo"
logoText.BackgroundTransparency=1
logoText.Position=UO(logoPos.x,logoPos.y)
logoText.Size=UO(SIDEBAR_W - 70,logoPos.s)
logoText.Font=WIN_FONT_GOTHIC
logoText.TextSize=24
logoText.RichText=true
logoText.TextXAlignment=TXL
logoText.TextYAlignment=TYC
logoText.TextColor3=C_TEXT
logoText.Text='Ghost <font color="#A76CFF">Method</font>'
logoText.ZIndex=4
logoText.Parent=sidebar
zzV1.transformLogo=logoText
else
zzV1.transformLogo=logo
end
local rankBtn=IIL()
rankBtn.Name="RankBadge"
rankBtn.BackgroundTransparency=1
rankBtn.Position=UO(rankPos.x,rankPos.y)
rankBtn.Size=UO(rankPos.s,rankPos.s)
rankBtn.ScaleType=SCT.Fit
rankBtn.Image=rankImg or ""
rankBtn.Rotation=rankPos.r or 0
rankBtn.ZIndex=5
rankBtn.Parent=sidebar
zzV1.transformRank=rankBtn
zzV1.setRankBadge=function(rank)
if type(rank)~="string" or #rank==0 then
return
end
QQ(function()
local img=gmLoadRankAsset(rank)
if img then
rankBtn.Image=img
end
end)
end
local setVisible
local winBtns=INF()
winBtns.Name="WindowButtons"
winBtns.AnchorPoint=VX(1,0)
winBtns.Position=U2(1,-10,0,8)
winBtns.Size=UO(76,32)
winBtns.BackgroundTransparency=1
winBtns.ZIndex=20
winBtns.Parent=main
local wbLay=IUL()
wbLay.FillDirection=Enum.FillDirection.Horizontal
wbLay.Padding=UD(0,6)
wbLay.HorizontalAlignment=Enum.HorizontalAlignment.Right
wbLay.Parent=winBtns
local function winBtn(txt,color,hover,y2)
local b=ITB()
b.Size=UO(32,32)
b.BackgroundColor3=color
b.BackgroundTransparency=0.25
b.BorderSizePixel=0
b.Font=WIN_FONT_BOLD
b.TextSize=14
b.TextColor3=C_TEXT
b.Text=txt
b.AutoButtonColor=false
b.ZIndex=21
local bc=IUC()
bc.CornerRadius=UD(1,0)
bc.Parent=b
local bs=IUS()
bs.Color=C_ACCENT
bs.Thickness=1
bs.Transparency=0.6
bs.Parent=b
CN(b.MouseEnter, function()
TSC(b,TWI(0.15,ESQ,ED.Out),{BackgroundTransparency=0,BackgroundColor3=hover,Size=UO(34,34)}):Play()
TSC(bs,TWI(0.15),{Transparency=0.2}):Play()
zzV1.uiSound("hover")
end)
CN(b.MouseLeave, function()
TSC(b,TWI(0.15,ESQ,ED.Out),{BackgroundTransparency=0.25,BackgroundColor3=color,Size=UO(32,32)}):Play()
TSC(bs,TWI(0.15),{Transparency=0.6}):Play()
end)
CN(b.Activated, function()
zzV1.uiSound("click")
y2()
end)
b.Parent=winBtns
return b
end
local minimized=false
winBtn("~",CR(38,28,58),CR(58,42,88),function()
minimized=not minimized
local nav=FF(sidebar, "Nav")
local prof=FF(sidebar, "Profile")
local divider=nav and FF(nav, "NavDivider")
if minimized then
TSC(main,TWI(0.35,ESB,ED.In),{Size=UO(WIN_W,46)}):Play()
content.Visible=false
if nav then nav.Visible=false end
if prof then prof.Visible=false end
for _,sh in IP(shadows) do
TSC(sh,TWI(0.3),{Size=UO(WIN_W+18,46+18)}):Play()
end
else
TSC(main,TWI(0.35,ESB,ED.Out),{Size=UO(WIN_W,WIN_H)}):Play()
TW(0.25)
content.Visible=true
if nav then nav.Visible=true end
if prof then prof.Visible=true end
for _,sh in IP(shadows) do
TSC(sh,TWI(0.3),{Size=UO(WIN_W+18,WIN_H+18)}):Play()
end
end
end)
winBtn("X",CR(46,22,24),CR(64,30,32),function()
setVisible(false,true)
end)
local navHolder=IN("ScrollingFrame")
navHolder.Name="Nav"
navHolder.BackgroundTransparency=1
navHolder.Position=UO(12,58)
navHolder.Size=U2(1,-24,1,-58 - 74)
navHolder.ZIndex=4
navHolder.BorderSizePixel=0
navHolder.ScrollBarThickness=3
navHolder.ScrollBarImageColor3=C_ACCENT
navHolder.ScrollBarImageTransparency=0.7
navHolder.ScrollingDirection=Enum.ScrollingDirection.Y
navHolder.CanvasSize=U2(0,0,0,0)
navHolder.AutomaticCanvasSize=XA.Y
navHolder.ElasticBehavior=Enum.ElasticBehavior.WhenScrollable
navHolder.ClipsDescendants=true
navHolder.Parent=sidebar
local navFade=INF()
navFade.Name="NavFade"
navFade.AnchorPoint=VX(0,1)
navFade.Position=U2(0,0,1,-58)
navFade.Size=U2(1,0,0,24)
navFade.BackgroundTransparency=1
navFade.ZIndex=6
navFade.Parent=sidebar
local fadeGrad=IUG()
fadeGrad.Rotation=90
fadeGrad.Color=CSN(C_SIDEBAR)
fadeGrad.Transparency=NSN({
NSK(0,1),
NSK(1,0),
})
fadeGrad.Parent=navFade
local navLayout=IUL()
navLayout.Padding=UD(0,6)
navLayout.SortOrder=XR.LayoutOrder
navLayout.Parent=navHolder
local profile=INF()
profile.Name="Profile"
profile.AnchorPoint=VX(0,1)
profile.Position=U2(0,12,1,-12)
profile.Size=U2(1,-24,0,58)
profile.BackgroundColor3=C_PROFILE
profile.BorderSizePixel=0
profile.ZIndex=3
local pfCorner=IUC()
pfCorner.CornerRadius=UD(0,10)
pfCorner.Parent=profile
profile.Parent=sidebar
local y7=INF()
y7.Name="Avatar"
y7.Position=UO(12,14)
y7.Size=UO(30,30)
y7.BackgroundColor3=C_PILL
y7.BorderSizePixel=0
y7.ZIndex=4
local avCorner=IUC()
avCorner.CornerRadius=UD(1,0)
avCorner.Parent=y7
local avRing=IUS()
avRing.Color=C_ACCENT
avRing.Thickness=1.5
avRing.Transparency=0.35
avRing.Parent=y7
y7.Parent=profile
local initial=ITL()
initial.BackgroundTransparency=1
initial.Size=US(1,1)
initial.Font=WIN_FONT_BOLD
initial.TextSize=13
initial.TextColor3=C_DIM
initial.Text=SSB(LocalPlayer.DisplayName,1,1)
initial.ZIndex=4
initial.Parent=y7
local thumb=IIL()
thumb.Name="Thumb"
thumb.BackgroundTransparency=1
thumb.Size=US(1,1)
thumb.Image="rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=48&h=48"
thumb.ZIndex=5
local thCorner=IUC()
thCorner.CornerRadius=UD(1,0)
thCorner.Parent=thumb
thumb.Parent=y7
QQ(function()
local AVATAR_DEFAULT="rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=48&h=48"
local photoActive=false
local function setPhotoImage(url)
if url then
thumb.Image=url
initial.Visible=false
else
thumb.Image=AVATAR_DEFAULT
initial.Visible=true
end
end
local photoState=ctx.getProfilePhoto()
if photoState.mode=="asset" and photoState.assetId and photoState.assetId>0 then
setPhotoImage("rbxassetid://"..TS(photoState.assetId))
photoActive=true
elseif photoState.mode=="file" then
local status,url=ctx.photoFileStatus()
if status=="ok" and url then
setPhotoImage(url)
photoActive=true
else
setPhotoImage(nil)
if zzV1.toast then
zzV1.toast("Ghost Method","La foto (GM_foto.png/jpg) no esta en el workspace - y7 normal.",6)
end
end
else
setPhotoImage(nil)
end
local avDim=INF()
avDim.Name="Dim"
avDim.Size=US(1,1)
avDim.BackgroundColor3=Color3.new(0,0,0)
avDim.BackgroundTransparency=0.45
avDim.BorderSizePixel=0
avDim.Visible=false
avDim.ZIndex=6
local dimCorner=IUC()
dimCorner.CornerRadius=UD(1,0)
dimCorner.Parent=avDim
avDim.Parent=y7
local pencil=INF()
pencil.Name="Pencil"
pencil.BackgroundTransparency=1
pencil.AnchorPoint=VX(0.5,0.5)
pencil.Position=US(0.5,0.5)
pencil.Size=US(1,1)
pencil.Visible=false
pencil.ZIndex=7
pencil.Parent=y7
local pShaft=INF()
pShaft.AnchorPoint=VX(0.5,0.5)
pShaft.Position=U2(0.54,1,0.46,-1)
pShaft.Size=UO(9,2.4)
pShaft.Rotation=45
pShaft.BackgroundColor3=C_TEXT
pShaft.BorderSizePixel=0
local shaftCorner=IUC()
shaftCorner.CornerRadius=UD(1,0)
shaftCorner.Parent=pShaft
pShaft.Parent=pencil
local pTip=INF()
pTip.AnchorPoint=VX(0.5,0.5)
pTip.Position=U2(0.2,0,0.8,0)
pTip.Size=UO(3.6,3.2)
pTip.Rotation=45
pTip.BackgroundColor3=C_TEXT
pTip.BorderSizePixel=0
local tipCorner=IUC()
tipCorner.CornerRadius=UD(1,0)
tipCorner.Parent=pTip
pTip.Parent=pencil
local dotsBtn=ITB()
dotsBtn.Name="Dots"
dotsBtn.Text=""
dotsBtn.AutoButtonColor=false
dotsBtn.BackgroundTransparency=1
dotsBtn.Position=UO(44,18)
dotsBtn.Size=UO(12,22)
dotsBtn.Visible=false
dotsBtn.ZIndex=9
dotsBtn.Parent=profile
for i=0,2 do
local d=INF()
d.AnchorPoint=VX(0.5,0)
d.Position=U2(0.5,0,0,i*8)
d.Size=UO(3.5,3.5)
d.BackgroundColor3=C_TEXT
d.BackgroundTransparency=0.15
d.BorderSizePixel=0
local dCorner=IUC()
dCorner.CornerRadius=UD(1,0)
dCorner.Parent=d
d.Parent=dotsBtn
end
local hoverBtn=ITB()
hoverBtn.Name="Hover"
hoverBtn.Text=""
hoverBtn.AutoButtonColor=false
hoverBtn.BackgroundTransparency=1
hoverBtn.Size=US(1,1)
hoverBtn.ZIndex=8
hoverBtn.Parent=y7
local photoMenu=INF()
photoMenu.Name="PhotoMenu"
photoMenu.Visible=false
photoMenu.BackgroundColor3=C_POPUP
photoMenu.BackgroundTransparency=0.04
photoMenu.BorderSizePixel=0
photoMenu.Size=UO(96,60)
photoMenu.ZIndex=40
local pmCorner=IUC()
pmCorner.CornerRadius=UD(0,10)
pmCorner.Parent=photoMenu
local pmPad=IUP()
pmPad.PaddingTop=UD(0,4)
pmPad.PaddingBottom=UD(0,4)
pmPad.PaddingLeft=UD(0,4)
pmPad.PaddingRight=UD(0,4)
pmPad.Parent=photoMenu
local pmLay=IUL()
pmLay.Padding=UD(0,2)
pmLay.SortOrder=XR.LayoutOrder
pmLay.Parent=photoMenu
photoMenu.Parent=popLayer
local menuEntry={}
local menuOpen=false
function menuEntry.close()
if not menuOpen then
return
end
menuOpen=false
photoMenu.Visible=false
end
popups[#popups+1]=menuEntry
local y9=INF()
y9.Name="PhotoDialog"
y9.Visible=false
y9.BackgroundColor3=C_POPUP
y9.BackgroundTransparency=0.04
y9.BorderSizePixel=0
y9.Size=UO(300,200)
y9.ZIndex=40
local pdCorner=IUC()
pdCorner.CornerRadius=UD(0,12)
pdCorner.Parent=y9
y9.Parent=popLayer
local dlgEntry={}
local dlgOpen=false
function dlgEntry.close()
if not dlgOpen then
return
end
dlgOpen=false
y9.Visible=false
end
popups[#popups+1]=dlgEntry
local pdTitle=ITL()
pdTitle.BackgroundTransparency=1
pdTitle.Position=UO(14,10)
pdTitle.Size=U2(1,-28,0,20)
pdTitle.Font=WIN_FONT_MED
pdTitle.TextSize=16
pdTitle.TextXAlignment=TXL
pdTitle.TextColor3=C_TEXT
pdTitle.Text="Foto de perfil"
pdTitle.ZIndex=41
pdTitle.Parent=y9
local pdUrlLabel=ITL()
pdUrlLabel.BackgroundTransparency=1
pdUrlLabel.Position=UO(14,34)
pdUrlLabel.Size=U2(1,-28,0,12)
pdUrlLabel.Font=WIN_FONT_MED
pdUrlLabel.TextSize=11
pdUrlLabel.TextXAlignment=TXL
pdUrlLabel.TextColor3=C_TEXT
pdUrlLabel.Text="Pega el link de tu imagen:"
pdUrlLabel.ZIndex=41
pdUrlLabel.Parent=y9
local pdUrlBox=ITX()
pdUrlBox.Name="UrlBox"
pdUrlBox.PlaceholderText="https://... (imgur, CDN, etc)"
pdUrlBox.Text=""
pdUrlBox.Font=WIN_FONT_MED
pdUrlBox.TextSize=10
pdUrlBox.TextColor3=C_TEXT
pdUrlBox.PlaceholderColor3=C_DIM
pdUrlBox.BackgroundColor3=C_PILL
pdUrlBox.BorderSizePixel=0
pdUrlBox.Position=UO(14,50)
pdUrlBox.Size=UO(212,26)
pdUrlBox.ZIndex=41
pdUrlBox.ClearTextOnFocus=false
local puCorner=IUC()
puCorner.CornerRadius=UD(0,8)
puCorner.Parent=pdUrlBox
local puPad=IUP()
puPad.PaddingLeft=UD(0,8)
puPad.PaddingRight=UD(0,8)
puPad.Parent=pdUrlBox
pdUrlBox.Parent=y9
local pdLoad=ITB()
pdLoad.Name="LoadUrl"
pdLoad.AutoButtonColor=false
pdLoad.BackgroundColor3=C_ACCENT
pdLoad.BackgroundTransparency=0.25
pdLoad.Position=UO(232,50)
pdLoad.Size=UO(54,26)
pdLoad.Font=WIN_FONT_MED
pdLoad.TextSize=11
pdLoad.TextColor3=C_TEXT
pdLoad.Text="Cargar"
pdLoad.ZIndex=41
local plCorner=IUC()
plCorner.CornerRadius=UD(0,8)
plCorner.Parent=pdLoad
pdLoad.Parent=y9
local pdStatus=ITL()
pdStatus.BackgroundTransparency=1
pdStatus.Position=UO(14,80)
pdStatus.Size=U2(1,-28,0,14)
pdStatus.Font=WIN_FONT_MED
pdStatus.TextSize=10
pdStatus.TextXAlignment=TXL
pdStatus.TextColor3=C_ACCENT
pdStatus.Text=""
pdStatus.ZIndex=41
pdStatus.Parent=y9
local pdHint=ITL()
pdHint.BackgroundTransparency=1
pdHint.Position=UO(14,96)
pdHint.Size=U2(1,-28,0,12)
pdHint.Font=WIN_FONT
pdHint.TextSize=9
pdHint.TextXAlignment=TXL
pdHint.TextColor3=C_DIM
pdHint.Text=gmT("Recomendado: imagen cuadrada, ej 500x500px. Se ajusta al icono sola.","Recommended: square image, e.g. 500x500px. It auto-fits the icon.")
pdHint.ZIndex=41
pdHint.Parent=y9
local pdIdLabel=ITL()
pdIdLabel.BackgroundTransparency=1
pdIdLabel.Position=UO(14,116)
pdIdLabel.Size=U2(1,-28,0,12)
pdIdLabel.Font=WIN_FONT_MED
pdIdLabel.TextSize=11
pdIdLabel.TextXAlignment=TXL
pdIdLabel.TextColor3=C_TEXT
pdIdLabel.Text="o un Asset ID de Roblox:"
pdIdLabel.ZIndex=41
pdIdLabel.Parent=y9
local pdBox=ITX()
pdBox.PlaceholderText="Asset ID (numeros)"
pdBox.Text=""
pdBox.Font=WIN_FONT_MED
pdBox.TextSize=11
pdBox.TextColor3=C_TEXT
pdBox.PlaceholderColor3=C_DIM
pdBox.BackgroundColor3=C_PILL
pdBox.BorderSizePixel=0
pdBox.Position=UO(14,132)
pdBox.Size=UO(160,26)
pdBox.ZIndex=41
pdBox.ClearTextOnFocus=false
local pbCorner=IUC()
pbCorner.CornerRadius=UD(0,8)
pbCorner.Parent=pdBox
local pbPad=IUP()
pbPad.PaddingLeft=UD(0,8)
pbPad.PaddingRight=UD(0,8)
pbPad.Parent=pdBox
pdBox.Parent=y9
local pdApply=ITB()
pdApply.Name="ApplyId"
pdApply.AutoButtonColor=false
pdApply.BackgroundColor3=C_PILL
pdApply.Position=UO(180,132)
pdApply.Size=UO(62,26)
pdApply.Font=WIN_FONT_MED
pdApply.TextSize=11
pdApply.TextColor3=C_TEXT
pdApply.Text="Aplicar ID"
pdApply.ZIndex=41
local paCorner=IUC()
paCorner.CornerRadius=UD(0,8)
paCorner.Parent=pdApply
pdApply.Parent=y9
local pdFileNote=ITL()
pdFileNote.BackgroundTransparency=1
pdFileNote.Position=UO(14,164)
pdFileNote.Size=U2(1,-28,0,12)
pdFileNote.Font=WIN_FONT
pdFileNote.TextSize=9
pdFileNote.TextXAlignment=TXL
pdFileNote.TextColor3=C_DIM
pdFileNote.Text="Extra: GM_foto.png/jpg en el workspace se detecta solo."
pdFileNote.ZIndex=41
pdFileNote.Parent=y9
local pdClose=ITB()
pdClose.Name="Close"
pdClose.AutoButtonColor=false
pdClose.BackgroundColor3=C_PILL
pdClose.Position=U2(1,-76,1,-34)
pdClose.Size=UO(62,24)
pdClose.Font=WIN_FONT_MED
pdClose.TextSize=11
pdClose.TextColor3=C_DIM
pdClose.Text="Cerrar"
pdClose.ZIndex=41
local pcCorner=IUC()
pcCorner.CornerRadius=UD(0,8)
pcCorner.Parent=pdClose
pdClose.Parent=y9
local pollToken=0
local function startPolling()
pollToken=pollToken+1
local myToken=pollToken
TSP(function()
while dlgOpen and myToken==pollToken do
local status,url=ctx.photoFileStatus()
if status=="ok" and url then
photoActive=true
setPhotoImage(url)
ctx.savePhotoMode("file",0)
dlgEntry.close()
if zzV1.toast then
zzV1.toast("Ghost Method",gmT("Foto aplicada desde GM_foto.png.","Photo applied from GM_foto.png."),5)
end
return
elseif status=="nofunc" then
pdStatus.Text="Este executor no lee archivos - usa link o Asset ID."
elseif status=="badfile" then
pdStatus.Text="GM_foto.png/jpg esta corrupto o no es una imagen."
else
pdStatus.Text=gmT("Auto-detectando GM_foto en el workspace...","Auto-detecting GM_foto in the workspace...")
end
TW(1)
end
end)
end
local openPhotoDialog
openPhotoDialog=function()
closeAllPopups()
pdStatus.Text=""
pdUrlBox.Text=""
pdBox.Text=""
dlgOpen=true
local mSize=main.AbsoluteSize
local dSize=y9.AbsoluteSize
y9.Position=UO(10,mSize.Y - dSize.Y - 80)
y9.Visible=true
local baseStatus=ctx.photoFileStatus()
if baseStatus=="ok" then
pdStatus.Text=gmT("Foto actual detectada. Cambiala con un link o Asset ID.","Current photo detected. Change it with a link or Asset ID.")
else
startPolling()
end
end
CN(pdLoad.Activated, function()
local url=pdUrlBox.Text
if type(url)~="string" or #url<8 then
pdStatus.Text="Pega primero el link de tu imagen."
return
end
pdStatus.Text="Downloading image..."
TSP(function()
local res=ctx.downloadPhoto(url)
if res=="ok" then
local status,curl=ctx.photoFileStatus()
if status=="ok" and curl then
photoActive=true
setPhotoImage(curl)
ctx.savePhotoMode("file",0)
dlgEntry.close()
if zzV1.toast then
zzV1.toast("Ghost Method",gmT("Foto aplicada desde el link.","Photo applied from the link."),4)
end
else
pdStatus.Text="Downloaded but could not display - try another one."
end
elseif res=="notimg" then
pdStatus.Text="That is a webpage, not an image: copy the image DIRECT link."
elseif res=="badwrite" then
pdStatus.Text="Could not save the file."
else
pdStatus.Text="Could not download - check the link."
end
end)
end)
CN(pdApply.Activated, function()
local id=TN(pdBox.Text)
if id and id>0 then
photoActive=true
setPhotoImage("rbxassetid://"..TS(id))
ctx.savePhotoMode("asset",MFL(id))
dlgEntry.close()
if zzV1.toast then
zzV1.toast("Ghost Method",gmT("Foto aplicada desde Asset ID.","Photo applied from Asset ID."),4)
end
else
pdStatus.Text="Ese Asset ID no es valido (solo numeros)."
end
end)
CN(pdClose.Activated, function()
dlgEntry.close()
end)
local hideToken=0
local function hideOverlays()
hideToken=hideToken+1
local myToken=hideToken
TDL(0.25,function()
if hideToken==myToken then
avDim.Visible=false
pencil.Visible=false
dotsBtn.Visible=false
end
end)
end
CN(hoverBtn.MouseEnter, function()
hideToken=hideToken+1
if photoActive then
dotsBtn.Visible=true
else
avDim.Visible=true
pencil.Visible=true
end
end)
CN(hoverBtn.MouseLeave, hideOverlays)
CN(dotsBtn.MouseEnter, function()
hideToken=hideToken+1
end)
CN(dotsBtn.MouseLeave, hideOverlays)
local function toggleMenu()
if menuOpen then
menuEntry.close()
else
closeAllPopups()
menuOpen=true
local mPos=main.AbsolutePosition
local dPos=dotsBtn.AbsolutePosition
local dSize=dotsBtn.AbsoluteSize
local mmSize=photoMenu.AbsoluteSize
local x=dPos.X - mPos.X+dSize.X - mmSize.X+6
local y=dPos.Y - mPos.Y - mmSize.Y - 6
if x<6 then
x=6
end
if y<6 then
y=6
end
photoMenu.Position=UO(x,y)
photoMenu.Visible=true
end
end
CN(hoverBtn.Activated, function()
if not photoActive then
openPhotoDialog()
else
toggleMenu()
end
end)
CN(dotsBtn.Activated, function()
toggleMenu()
end)
local function menuOption(text,y2,danger)
local ob=ITB()
ob.Text=""
ob.AutoButtonColor=false
ob.BackgroundColor3=C_POPUP
ob.BackgroundTransparency=1
ob.Size=U2(1,0,0,26)
ob.ZIndex=41
local oc=IUC()
oc.CornerRadius=UD(0,6)
oc.Parent=ob
local ol=ITL()
ol.BackgroundTransparency=1
ol.Size=US(1,1)
ol.Font=WIN_FONT_MED
ol.TextSize=11
ol.TextColor3=danger and C_RED or C_TEXT
ol.Text=text
ol.ZIndex=42
ol.Parent=ob
CN(ob.MouseEnter, function()
ob.BackgroundColor3=C_POPUP_HOVER
ob.BackgroundTransparency=0
end)
CN(ob.MouseLeave, function()
ob.BackgroundTransparency=1
end)
CN(ob.Activated, function()
menuEntry.close()
y2()
end)
ob.Parent=photoMenu
end
menuOption("Quitar",function()
photoActive=false
setPhotoImage(nil)
ctx.savePhotoMode("none",0)
ctx.deletePhotoFiles()
if zzV1.toast then
zzV1.toast("Ghost Method",gmT("Foto quitada - y7 normal.","Photo removed - default y7."),4)
end
end,true)
menuOption("Editar",function()
openPhotoDialog()
end,false)
end)
local profName=ITL()
profName.BackgroundTransparency=1
profName.Position=UO(50,14)
profName.Size=U2(1,-58,0,14)
profName.Font=WIN_FONT_MED
profName.TextSize=12
profName.TextXAlignment=TXL
profName.TextTruncate=TT.AtEnd
profName.TextColor3=C_TEXT
profName.Text=LocalPlayer.DisplayName
profName.ZIndex=4
profName.Parent=profile
local profHandle=ITL()
profHandle.BackgroundTransparency=1
profHandle.Position=UO(50,30)
profHandle.Size=U2(1,-58,0,12)
profHandle.Font=WIN_FONT
profHandle.TextSize=10
profHandle.TextXAlignment=TXL
profHandle.TextTruncate=TT.AtEnd
profHandle.TextColor3=C_DIM
profHandle.Text="@"..LocalPlayer.Name
profHandle.ZIndex=4
profHandle.Parent=profile
local navBtns={}
local selectPage
local iconCache={}
local function loadIcon(name)
if iconCache[name]~=nil then
return iconCache[name]
end
local url=nil
QQ(function()
if isfile and readfile then
local fn="GM_icon_"..name..".png"
if ISF(fn) then
local data=readfile(fn)
if #data>50 then
local cached="GM_icon_"..name.."_"..TS(MFL(OCL()*1000))..".png"
WF(cached,data)
url=GCA(cached)
end
end
end
end)
iconCache[name]=url or false
return url
end
local function mkNavButton(y4,idx,def)
local btn=ITB()
btn.Name="Nav_"..def.name
btn.AutoButtonColor=false
btn.Text=""
btn.Size=U2(1,0,0,TOUCH and 48 or 42)
btn.LayoutOrder=idx
btn.BackgroundColor3=C_CARD
btn.BackgroundTransparency=0.25
btn.BorderSizePixel=0
btn.ZIndex=4
local nc=IUC()
nc.CornerRadius=UD(0,12)
nc.Parent=btn
local nStroke=IUS()
nStroke.Name="BtnStroke"
nStroke.Color=C_PILL
nStroke.Thickness=1
nStroke.Transparency=0.5
nStroke.Parent=btn
local iconUrl=loadIcon(def.icon)
local iconWidget
if iconUrl then
local img=IIL()
img.Name="Icon"
img.BackgroundTransparency=1
img.Position=U2(0,8,0.5,-14)
img.Size=UO(28,28)
img.ScaleType=SCT.Fit
img.Image=iconUrl
img.ZIndex=5
img.Parent=btn
iconWidget={tint=function(c) img.ImageColor3=c end}
zzV1.navIcons=zzV1.navIcons or {}
zzV1.navIcons[def.icon]=img
else
local ic=mkIcon(btn,def.icon,C_DIM)
ic.frame.Position=UO(14,12)
iconWidget=ic
end
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Position=UO(38,0)
lbl.Size=U2(1,-46,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=TOUCH and 13 or 12
lbl.TextXAlignment=TXL
lbl.TextColor3=C_DIM
lbl.Text=gmT(def.nameEs or def.name,def.name)
lbl.ZIndex=4
lbl.Parent=btn
local state={active=false,hover=false}
local indicator=INF()
indicator.Name="Indicator"
indicator.AnchorPoint=VX(0,0.5)
indicator.Position=U2(0,2,0.5,0)
indicator.Size=UO(3,TOUCH and 28 or 24)
indicator.BackgroundColor3=AC2
indicator.BorderSizePixel=0
indicator.ZIndex=6
indicator.Visible=false
local indCorner=IUC()
indCorner.CornerRadius=UD(1,0)
indCorner.Parent=indicator
indicator.Parent=btn
local nInfo=TWI(0.2,ESQ,ED.Out)
local function paint()
if state.active then
TSC(btn,nInfo,{BackgroundTransparency=0.02,BackgroundColor3=CR(55,35,92)}):Play()
TSC(nStroke,nInfo,{Color=C_ACCENT,Transparency=0.08,Thickness=1.5}):Play()
TSC(lbl,nInfo,{TextColor3=C_TEXT}):Play()
iconWidget.tint(AC2)
indicator.Visible=true
elseif state.hover then
TSC(btn,nInfo,{BackgroundTransparency=0.08,BackgroundColor3=C_HOVER}):Play()
TSC(nStroke,nInfo,{Color=C_ACCENT,Transparency=0.3,Thickness=1}):Play()
TSC(lbl,nInfo,{TextColor3=C_OFF}):Play()
iconWidget.tint(C_OFF)
indicator.Visible=false
else
TSC(btn,nInfo,{BackgroundTransparency=0.25,BackgroundColor3=C_CARD}):Play()
TSC(nStroke,nInfo,{Color=C_PILL,Transparency=0.5,Thickness=1}):Play()
TSC(lbl,nInfo,{TextColor3=C_DIM}):Play()
iconWidget.tint(C_DIM)
indicator.Visible=false
end
end
CN(btn.MouseEnter, function()
state.hover=true
paint()
zzV1.uiSound("hover")
end)
CN(btn.MouseLeave, function()
state.hover=false
paint()
end)
CN(btn.Activated, function()
if not state.active then
zzV1.uiSound("pop")
end
selectPage(idx)
end)
btn.Parent=y4
if def.hidden then
btn.Visible=false
end
local api={state=state,paint=paint}
navBtns[idx]=api
return api
end
selectPage=function(idx)
for i,b in IP(navBtns) do
b.state.active=(i==idx)
b.paint()
if pages[i] then
pages[i].Visible=(i==idx)
end
end
local pg=pages[idx]
if pg then
local psc=FF(pg, "GM_PagePop")
if not psc then
psc=IN("UIScale")
psc.Name="GM_PagePop"
psc.Parent=pg
end
psc.Scale=0.97
TSC(
psc,
TWI(0.22,ESB,ED.Out),
{Scale=1}
):Play()
end
end
local rowOrder=0
local function nextRow()
rowOrder+=1
return rowOrder
end
local function mkCard(page,title)
local card=INF()
card.Name="Card_"..title
card.BackgroundColor3=C_CARD
card.BackgroundTransparency=0.04
card.BorderSizePixel=0
card.Size=U2(1,0,0,0)
card.AutomaticSize=XA.Y
card.LayoutOrder=nextRow()
card.ZIndex=3
local cc=IUC()
cc.CornerRadius=UD(0,12)
cc.Parent=card
local pad=IUP()
pad.PaddingLeft=UD(0,16)
pad.PaddingRight=UD(0,16)
pad.PaddingTop=UD(0,14)
pad.PaddingBottom=UD(0,14)
pad.Parent=card
local lay=IUL()
lay.Padding=UD(0,CARD_GAP)
lay.SortOrder=XR.LayoutOrder
lay.Parent=card
local head=INF()
head.BackgroundTransparency=1
head.Size=U2(1,0,0,20)
head.LayoutOrder=nextRow()
head.ZIndex=3
head.Parent=card
local marker=INF()
marker.Size=UO(7,7)
marker.Position=U2(0,1,0,6)
marker.Rotation=45
marker.BackgroundColor3=C_ACCENT
marker.BorderSizePixel=0
marker.ZIndex=3
local mkCorner2=IUC()
mkCorner2.CornerRadius=UD(0,2)
mkCorner2.Parent=marker
marker.Parent=head
local ttl=ITL()
ttl.BackgroundTransparency=1
ttl.Position=UO(14,0)
ttl.Size=U2(1,-14,1,0)
ttl.Font=WIN_FONT_MED
ttl.TextSize=17
ttl.TextXAlignment=TXL
ttl.TextYAlignment=TYC
ttl.TextColor3=C_DIM
ttl.Text=title
ttl.ZIndex=3
ttl.Parent=head
card.Parent=page
return card
end
local function mkGrid(card)
local grid=INF()
grid.Name="Grid"
grid.BackgroundTransparency=1
grid.Size=U2(1,0,0,0)
grid.AutomaticSize=XA.Y
grid.LayoutOrder=nextRow()
grid.ZIndex=3
local gl=IN("UIGridLayout")
gl.CellSize=U2(0.5,-12,0,TOGGLE_ROW_H)
gl.CellPadding=U2(0,24,0,GRID_PAD_Y)
gl.SortOrder=XR.LayoutOrder
gl.Parent=grid
grid.Parent=card
return grid
end
local function mkToggle(parent,cfg)
local row=ITB()
row.Name="Toggle_"..cfg.yL
row.AutoButtonColor=false
row.Text=""
row.BackgroundTransparency=1
row.Size=U2(1,0,0,TOGGLE_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local track=INF()
track.Name="Track"
track.Position=U2(0,0,0.5,-(SWITCH_H/2))
track.Size=UO(SWITCH_W,SWITCH_H)
track.BackgroundColor3=C_TRACK_OFF
track.BorderSizePixel=0
track.ZIndex=4
local tc=IUC()
tc.CornerRadius=UD(1,0)
tc.Parent=track
local tglow=IUS()
tglow.Name="Glow"
tglow.Color=C_ACCENT
tglow.Thickness=2
tglow.Transparency=1
tglow.Parent=track
track.Parent=row
local knob=INF()
knob.Name="Knob"
knob.Position=UO(3,(SWITCH_H - KNOB_D)/2)
knob.Size=UO(KNOB_D,KNOB_D)
knob.BackgroundColor3=C_KNOB_OFF
knob.BorderSizePixel=0
knob.ZIndex=5
local kc=IUC()
kc.CornerRadius=UD(1,0)
kc.Parent=knob
local kglow=IUS()
kglow.Name="KnobGlow"
kglow.Color=C_ACCENT
kglow.Thickness=1.5
kglow.Transparency=1
kglow.Parent=knob
knob.Parent=track
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Position=UO(SWITCH_W+8,0)
lbl.Size=U2(1,-48,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TXL
lbl.TextYAlignment=TYC
lbl.TextTruncate=TT.AtEnd
lbl.TextColor3=C_OFF
lbl.Text=cfg.yL
lbl.ZIndex=4
lbl.Parent=row
local on=cfg.init==true
local infoC=TWI(0.18,ESQ,ED.Out)
local infoK=TWI(0.28,ESB,ED.Out)
local function paint(animate)
local trackC=on and C_TRACK_ON or C_TRACK_OFF
local knobC=on and C_KNOB_ON or C_KNOB_OFF
local lblC=on and C_TEXT or C_OFF
local knobP=on and UO(SWITCH_W - KNOB_D - 3,(SWITCH_H - KNOB_D)/2)
or UO(3,(SWITCH_H - KNOB_D)/2)
if animate then
TSC(track,infoC,{BackgroundColor3=trackC}):Play()
TSC(knob,infoK,{BackgroundColor3=knobC,Position=knobP}):Play()
TSC(lbl,infoC,{TextColor3=lblC}):Play()
TSC(tglow,TWI(0.3,ESQ,ED.Out),{Transparency=on and 0.25 or 1}):Play()
TSC(kglow,TWI(0.3,ESQ,ED.Out),{Transparency=on and 0.15 or 1}):Play()
else
track.BackgroundColor3=trackC
knob.BackgroundColor3=knobC
knob.Position=knobP
lbl.TextColor3=lblC
tglow.Transparency=on and 0.25 or 1
kglow.Transparency=on and 0.15 or 1
end
end
paint(false)
CN(row.Activated, function()
on=not on
paint(true)
zzV1.uiSound(on and "toggleOn" or "toggleOff")
if cfg.y1 then
cfg.y1(on)
end
end)
row.Parent=parent
return row
end
local function zMS(parent,cfg)
local row=INF()
row.Name="Slider_"..cfg.yL
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TXL
lbl.TextYAlignment=TYC
lbl.TextTruncate=TT.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.yL
lbl.ZIndex=4
lbl.Parent=row
local track=INF()
track.Name="Track"
track.Position=U2(0,168,0.5,-(TRACK_H/2))
track.Size=UO(150,TRACK_H)
track.BackgroundColor3=C_TRACK_OFF
track.BorderSizePixel=0
track.ZIndex=4
local tc=IUC()
tc.CornerRadius=UD(1,0)
tc.Parent=track
track.Parent=row
local fill=INF()
fill.Name="Fill"
fill.Size=U2(0,0,1,0)
fill.BackgroundColor3=C_TEXT
fill.BorderSizePixel=0
fill.ZIndex=5
local fc=IUC()
fc.CornerRadius=UD(1,0)
fc.Parent=fill
local fgrad=IUG()
fgrad.Name="EatGradient"
fgrad.Rotation=0
fgrad.Transparency=NSN({
NSK(0,0),
NSK(0.75,0),
NSK(0.88,0.5),
NSK(0.95,0.85),
NSK(1,1),
})
fgrad.Color=CSN(C_ACCENT,C_ACCENT)
fgrad.Parent=fill
fill.Parent=track
local knob=INF()
knob.Name="Knob"
knob.AnchorPoint=VX(0.5,0.5)
knob.Position=U2(0,0,0.5,0)
knob.Size=UO(TRACK_KNOB_D+8,TRACK_KNOB_D)
knob.BackgroundColor3=AC2
knob.BorderSizePixel=0
knob.ZIndex=6
local kc=IUC()
kc.CornerRadius=UD(0,6)
kc.Parent=knob
local kglow=IUS()
kglow.Name="KnobGlow"
kglow.Color=C_ACCENT
kglow.Thickness=1.5
kglow.Transparency=0.2
kglow.Parent=knob
knob.Parent=track
local value=ITL()
value.BackgroundTransparency=1
value.Position=UO(324,0)
value.Size=UO(54,CTRL_ROW_H)
value.Font=WIN_FONT
value.TextSize=12
value.TextXAlignment=TX.Right
value.TextYAlignment=TYC
value.TextColor3=C_TEXT
value.ZIndex=4
value.Parent=row
local current=cfg.init
local dragging=false
local function fmt(v)
local txt
if cfg.decimals then
txt=SFM("%."..TS(cfg.decimals).."f",v)
else
txt=SFM("%d",MFL(v+0.5))
end
if cfg.suffix then
txt=txt..cfg.suffix
end
return txt
end
local function render()
local span=cfg.max - cfg.min
local pct=0
if span>0 then
pct=(current - cfg.min)/span
end
if pct<0 then
pct=0
end
if pct>1 then
pct=1
end
local targetFill=U2(pct,0,1,0)
local targetKnob=U2(pct,0,0.5,0)
if dragging then
fill.Size=targetFill
knob.Position=targetKnob
else
local infoS=TWI(0.16,ESQ,ED.Out)
TSC(fill,infoS,{Size=targetFill}):Play()
TSC(knob,infoS,{Position=targetKnob}):Play()
end
value.Text=fmt(current)
end
local lastTick=0
local function setValue(v,fire)
if v<cfg.min then
v=cfg.min
end
if v>cfg.max then
v=cfg.max
end
local changed=v~=current
current=v
render()
if fire then
if changed then
local now=OCL()
if now - lastTick>0.045 then
lastTick=now
zzV1.uiSound("slider")
end
end
if cfg.y1 then
cfg.y1(v)
end
end
end
local function fromAbsX(absX)
local rel=absX - track.AbsolutePosition.X
local w=track.AbsoluteSize.X
if w<=0 then
return
end
local pct=rel/w
if pct<0 then
pct=0
end
if pct>1 then
pct=1
end
local raw=cfg.min+pct*(cfg.max - cfg.min)
local snapped=MFL(raw/cfg.step+0.5)*cfg.step
local clean=MFL(snapped*100+0.5)/100
setValue(clean,true)
end
local hit=INF()
hit.Name="HitZone"
hit.Position=U2(0,160,0,0)
hit.Size=U2(0,220,1,0)
hit.BackgroundTransparency=1
hit.Active=true
hit.ZIndex=7
hit.Parent=row
local function beginDrag(input)
if input.UserInputType==XU.MouseButton1
or input.UserInputType==XU.Touch then
dragging=true
fromAbsX(input.Position.X)
end
end
CN(hit.InputBegan, beginDrag)
bindConn(CN(UIS.InputChanged, function(input)
if not dragging then
return
end
if not main.Visible or root.Parent==nil then
dragging=false
return
end
if input.UserInputType==XU.MouseMovement
or input.UserInputType==XU.Touch then
fromAbsX(input.Position.X)
end
end))
bindConn(CN(UIS.InputEnded, function(input)
if input.UserInputType==XU.MouseButton1
or input.UserInputType==XU.Touch then
dragging=false
end
end))
render()
row.Parent=parent
return row
end
local function mkDropdown(parent,cfg)
local row=INF()
row.Name="Dropdown_"..cfg.yL
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TXL
lbl.TextYAlignment=TYC
lbl.TextTruncate=TT.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.yL
lbl.ZIndex=4
lbl.Parent=row
local pillW=132
local pill=ITB()
pill.Name="Pill"
pill.AutoButtonColor=false
pill.AnchorPoint=VX(0,0.5)
pill.Position=U2(0,168,0.5,0)
pill.Size=UO(pillW,PILL_H)
pill.BackgroundColor3=C_PILL
pill.BorderSizePixel=0
pill.Font=WIN_FONT_MED
pill.TextSize=11
pill.TextColor3=C_TEXT
pill.TextXAlignment=TXL
pill.Text=cfg.init
pill.ZIndex=4
local pc=IUC()
pc.CornerRadius=UD(1,0)
pc.Parent=pill
local pPad=IUP()
pPad.PaddingLeft=UD(0,14)
pPad.PaddingRight=UD(0,24)
pPad.Parent=pill
pill.Parent=row
local chev=INF()
chev.Name="Chevron"
chev.AnchorPoint=VX(1,0.5)
chev.Position=U2(1,-9,0.5,0)
chev.Size=UO(8,8)
chev.BackgroundTransparency=1
chev.ZIndex=5
chev.Parent=pill
local c1=INF()
c1.Position=UO(0,3)
c1.Size=UO(5,1.5)
c1.Rotation=45
c1.BackgroundColor3=C_DIM
c1.BorderSizePixel=0
c1.Parent=chev
local c2=INF()
c2.Position=UO(3,3)
c2.Size=UO(5,1.5)
c2.Rotation=-45
c2.BackgroundColor3=C_DIM
c2.BorderSizePixel=0
c2.Parent=chev
local popup=INF()
popup.Name="Popup"
popup.Visible=false
popup.BackgroundColor3=C_POPUP
popup.BackgroundTransparency=0.04
popup.BorderSizePixel=0
popup.Size=UO(pillW+48,#cfg.options*(POPUP_OPT_H+POPUP_OPT_GAP)+8)
popup.ZIndex=60
local gc=IUC()
gc.CornerRadius=UD(0,10)
gc.Parent=popup
local gPad=IUP()
gPad.PaddingTop=UD(0,4)
gPad.PaddingBottom=UD(0,4)
gPad.PaddingLeft=UD(0,4)
gPad.PaddingRight=UD(0,4)
gPad.Parent=popup
local gLay=IUL()
gLay.Padding=UD(0,POPUP_OPT_GAP)
gLay.SortOrder=XR.LayoutOrder
gLay.Parent=popup
popup.Parent=popLayer
local catcher=ITB()
catcher.Name="Catcher"
catcher.Text=""
catcher.AutoButtonColor=false
catcher.BackgroundTransparency=1
catcher.Size=US(1,1)
catcher.Visible=false
catcher.ZIndex=50
catcher.Parent=popLayer
local current=cfg.init
local open=false
local optionLbls={}
local entry={}
function entry.close()
if not open then
return
end
open=false
popup.Visible=false
catcher.Visible=false
end
popups[#popups+1]=entry
local function refreshLabels()
for opt,l in PR(optionLbls) do
l.TextColor3=(opt==current) and C_TEXT or C_OFF
end
end
local function openPopup()
closeAllPopups()
open=true
local mPos=main.AbsolutePosition
local mSize=main.AbsoluteSize
local pPos=pill.AbsolutePosition
local pSize=pill.AbsoluteSize
local gSize=popup.AbsoluteSize
local x=pPos.X - mPos.X+pSize.X - gSize.X
local y=pPos.Y - mPos.Y+pSize.Y+6
if y+gSize.Y>mSize.Y - 6 then
y=pPos.Y - mPos.Y - gSize.Y - 6
end
if x<6 then
x=6
end
local maxX=mSize.X - gSize.X - 6
if x>maxX then
x=maxX
end
if y<6 then
y=6
end
popup.Position=UO(x,y)
popup.Visible=true
catcher.Visible=true
local psc=FF(popup, "GM_Pop")
if not psc then
psc=IN("UIScale")
psc.Name="GM_Pop"
psc.Parent=popup
end
psc.Scale=0.86
TSC(
psc,
TWI(0.2,ESB,ED.Out),
{Scale=1}
):Play()
end
CN(pill.Activated, function()
if open then
zzV1.uiSound("toggleOff")
entry.close()
else
zzV1.uiSound("pop")
openPopup()
end
end)
CN(catcher.Activated, function()
entry.close()
end)
for i,option in IP(cfg.options) do
local ob=ITB()
ob.Name="Opt_"..option
ob.AutoButtonColor=false
ob.Text=""
ob.BackgroundColor3=C_POPUP
ob.BackgroundTransparency=1
ob.Size=U2(1,0,0,POPUP_OPT_H)
ob.LayoutOrder=i
ob.ZIndex=61
local oc=IUC()
oc.CornerRadius=UD(0,6)
oc.Parent=ob
local ol=ITL()
ol.BackgroundTransparency=1
ol.Position=UO(10,0)
ol.Size=U2(1,-14,1,0)
ol.Font=WIN_FONT_MED
ol.TextSize=TOUCH and 12 or 11
ol.TextXAlignment=TXL
ol.TextYAlignment=TYC
ol.TextTruncate=TT.AtEnd
ol.TextColor3=(option==current) and C_TEXT or C_OFF
ol.Text=option
ol.ZIndex=62
ol.Parent=ob
optionLbls[option]=ol
CN(ob.MouseEnter, function()
ob.BackgroundTransparency=0
ob.BackgroundColor3=C_POPUP_HOVER
end)
CN(ob.MouseLeave, function()
ob.BackgroundTransparency=1
end)
CN(ob.Activated, function()
zzV1.uiSound("click")
current=option
pill.Text=option
refreshLabels()
entry.close()
if cfg.y1 then
cfg.y1(option)
end
end)
ob.Parent=popup
end
row.Parent=parent
return row
end
local capturing=false
local function mkKeybind(parent,cfg)
local row=INF()
row.Name="Keybind_"..cfg.yL
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TXL
lbl.TextYAlignment=TYC
lbl.TextTruncate=TT.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.yL
lbl.ZIndex=4
lbl.Parent=row
local pill=ITB()
pill.Name="Pill"
pill.AutoButtonColor=false
pill.AnchorPoint=VX(0,0.5)
pill.Position=U2(0,168,0.5,0)
pill.Size=UO(110,PILL_H)
pill.BackgroundColor3=C_PILL
pill.BorderSizePixel=0
pill.Font=WIN_FONT_MED
pill.TextSize=11
pill.TextColor3=C_TEXT
pill.TextXAlignment=TXL
pill.Text=cfg.init
pill.ZIndex=4
local pc=IUC()
pc.CornerRadius=UD(1,0)
pc.Parent=pill
local pPad=IUP()
pPad.PaddingLeft=UD(0,14)
pPad.PaddingRight=UD(0,14)
pPad.Parent=pill
pill.Parent=row
local element={CurrentKeybind=cfg.init}
local listenConn=nil
local function displayName(name)
local short=SG(name,"^MouseButton","MB")
return short
end
pill.TextTruncate=TT.AtEnd
pill.Text=displayName(element.CurrentKeybind)
CN(pill.Activated, function()
if capturing or listenConn then
return
end
capturing=true
pill.Text="..."
pill.TextColor3=C_DIM
local pollConn=nil
listenConn=CN(UIS.InputBegan, function(input)
local name=nil
if input.UserInputType==XU.Keyboard then
if input.KeyCode~=XK.Unknown and input.KeyCode~=XK.Escape then
name=input.KeyCode.Name
end
elseif input.UserInputType==XU.MouseButton1
or input.UserInputType==XU.MouseButton2
or input.UserInputType==XU.MouseButton3
or input.UserInputType==XU.MouseButton4
or input.UserInputType==XU.MouseButton5 then
name=input.UserInputType.Name
end
if name==nil then
if input.KeyCode==XK.Escape then
capturing=false
if listenConn then
listenConn:Disconnect()
listenConn=nil
end
pill.Text=displayName(element.CurrentKeybind)
pill.TextColor3=C_TEXT
end
return
end
capturing=false
if listenConn then
listenConn:Disconnect()
listenConn=nil
end
element.CurrentKeybind=name
pill.Text=displayName(name)
pill.TextColor3=C_TEXT
if cfg.onSet then
cfg.onSet(element.CurrentKeybind)
end
end)
bindConn(listenConn)
end)
if cfg.onBind then
cfg.onBind(element)
end
row.Parent=parent
return element
end
local function zMB(parent,cfg)
local btn=ITB()
btn.Name="Button_"..cfg.yL
btn.AutoButtonColor=false
btn.Size=U2(1,0,0,cfg.full and BTN_FULL_H or BTN_H)
btn.LayoutOrder=nextRow()
btn.BackgroundColor3=cfg.danger and C_DANGER_BG or C_PILL
btn.BorderSizePixel=0
btn.Font=WIN_FONT_MED
btn.TextSize=12
btn.TextColor3=cfg.danger and C_RED or C_TEXT
btn.TextTruncate=TT.AtEnd
btn.Text=cfg.yL
btn.ZIndex=3
local bc=IUC()
bc.CornerRadius=UD(1,0)
bc.Parent=btn
local bPad=IUP()
bPad.PaddingLeft=UD(0,14)
bPad.PaddingRight=UD(0,14)
bPad.Parent=btn
local hoverBg=cfg.danger and C_DANGER_HOVER or C_POPUP_HOVER
local baseBg=cfg.danger and C_DANGER_BG or C_PILL
local hInfo=TWI(0.15,ESQ,ED.Out)
CN(btn.MouseEnter, function()
zzV1.uiSound("hover")
TSC(btn,hInfo,{BackgroundColor3=hoverBg}):Play()
end)
CN(btn.MouseLeave, function()
TSC(btn,hInfo,{BackgroundColor3=baseBg}):Play()
end)
CN(btn.Activated, function()
zzV1.uiSound("click")
local sc=IN("UIScale")
sc.Parent=btn
sc.Scale=1
TSC(
sc,
TWI(0.07,ES.Quad,ED.Out),
{Scale=0.94}
):Play()
TDL(0.08,function()
if sc.Parent then
TSC(
sc,
TWI(0.24,ESB,ED.Out),
{Scale=1}
):Play()
end
end)
TDL(0.36,function()
if sc.Parent then
sc:Destroy()
end
end)
if cfg.y2 then
cfg.y2()
end
end)
btn.Parent=parent
return btn
end
local function mkInput(parent,ph)
local box=ITX()
box.Name="Input_"..TS(ph)
box.Size=U2(1,0,0,TOUCH and 38 or 28)
box.LayoutOrder=nextRow()
box.BackgroundColor3=C_PILL
box.BorderSizePixel=0
box.Font=WIN_FONT_MED
box.TextSize=12
box.TextColor3=C_TEXT
box.PlaceholderText=ph or ""
box.PlaceholderColor3=C_DIM
box.Text=""
box.ClearTextOnFocus=false
box.TextXAlignment=TXL
box.ZIndex=3
local bc=IUC()
bc.CornerRadius=UD(1,0)
bc.Parent=box
local bPad=IUP()
bPad.PaddingLeft=UD(0,14)
bPad.PaddingRight=UD(0,14)
bPad.Parent=box
box.Parent=parent
return box
end
local function mkHint(parent,text)
local h=ITL()
h.BackgroundTransparency=1
h.Size=U2(1,0,0,0)
h.AutomaticSize=XA.Y
h.LayoutOrder=nextRow()
h.Font=WIN_FONT
h.TextSize=10
h.TextXAlignment=TXL
h.TextYAlignment=TYT
h.TextWrapped=true
h.TextColor3=C_DIM
h.TextTransparency=0.3
h.Text=text
h.ZIndex=3
h.Parent=parent
return h
end
local function mkListHolder(parent)
local y4=INF()
y4.Name="ListHolder"
y4.BackgroundTransparency=1
y4.Size=U2(1,0,0,0)
y4.AutomaticSize=XA.Y
y4.LayoutOrder=nextRow()
y4.ZIndex=3
local lay=IUL()
lay.Padding=UD(0,4)
lay.SortOrder=XR.LayoutOrder
lay.Parent=y4
y4.Parent=parent
return y4
end
local function clearList(y4)
for _,ch in IP(GC(y4)) do
if ch:IsA("GuiButton") then
ch:Destroy()
end
end
end
local function mkTrackRow(parent,text,y2)
local b=ITB()
b.Name="TrackRow"
b.AutoButtonColor=false
b.Size=U2(1,0,0,TOUCH and 30 or 22)
b.BackgroundColor3=C_PILL
b.BackgroundTransparency=1
b.Font=WIN_FONT_MED
b.TextSize=TOUCH and 12 or 11
b.TextColor3=C_TEXT
b.TextXAlignment=TXL
b.TextTruncate=TT.AtEnd
b.Text=text
b.ZIndex=3
local bc=IUC()
bc.CornerRadius=UD(1,0)
bc.Parent=b
local bPad=IUP()
bPad.PaddingLeft=UD(0,10)
bPad.PaddingRight=UD(0,10)
bPad.Parent=b
CN(b.MouseEnter, function()
b.BackgroundTransparency=0
b.BackgroundColor3=C_HOVER
zzV1.uiSound("hover")
end)
CN(b.MouseLeave, function()
b.BackgroundTransparency=1
end)
CN(b.Activated, function()
zzV1.uiSound("click")
y2()
end)
b.Parent=parent
return b
end
local NAV_DEFS={
{name="HUD",nameEs="HUD",icon="hud"},
{name="Movement",nameEs="Movimiento",icon="move"},
{name="Visuals",nameEs="Visuals",icon="eye"},
{name="Avatar",nameEs="Avatar",icon="sparkle"},
{name="Atmosphere",nameEs="Atmosfera",icon="sliders"},
{name="Spotify",nameEs="Spotify",icon="music",hidden=true},
{name="Settings",nameEs="Ajustes",icon="gear"},
}
for i,def in IP(NAV_DEFS) do
if i==#NAV_DEFS then
local spacer=INF()
spacer.Name="NavDivider"
spacer.Size=U2(1,-28,0,14)
spacer.BackgroundTransparency=1
spacer.LayoutOrder=i - 0.5
spacer.ZIndex=4
spacer.Parent=navHolder
local dvLabel=ITL()
dvLabel.BackgroundTransparency=1
dvLabel.Size=U2(1,0,0,9)
dvLabel.Font=WIN_FONT
dvLabel.TextSize=8
dvLabel.TextXAlignment=TXL
dvLabel.TextColor3=C_ACCENT
dvLabel.TextTransparency=0.5
dvLabel.Text=gmT("  -  AJUSTES  -","  -  SETTINGS  -")
dvLabel.ZIndex=4
dvLabel.Parent=spacer
local line=INF()
line.Size=U2(1,0,0,1)
line.Position=U2(0,0,0,11)
line.BackgroundColor3=C_ACCENT
line.BackgroundTransparency=0.5
line.BorderSizePixel=0
line.ZIndex=4
local ls=IUS()
ls.Color=C_ACCENT
ls.Thickness=1
ls.Transparency=0.7
ls.Parent=line
line.Parent=spacer
end
mkNavButton(navHolder,i,def)
mkPage()
end
local uiDx,uiDy=0,0
do
local saved=ctx.getUiPos()
if type(saved)=="table" and #saved==2 then
uiDx=TN(saved[1]) or 0
uiDy=TN(saved[2]) or 0
end
end
local function applyUiPos()
main.Position=U2(0.5,uiDx,0.5,uiDy)
for _,sh in IP(shadows) do
sh.Position=U2(0.5,uiDx,0.5,uiDy)
end
end
applyUiPos()
local uiDragging=false
local uiDragStart=nil
local uiStartDx,uiStartDy=0,0
local function uiHandleDown(input)
if input.UserInputType==XU.MouseButton1
or input.UserInputType==XU.Touch
then
uiDragging=true
uiDragStart=input.Position
uiStartDx=uiDx
uiStartDy=uiDy
end
end
local function uiHandleUp(input)
if input.UserInputType==XU.MouseButton1
or input.UserInputType==XU.Touch
then
if uiDragging then
uiDragging=false
ctx.setUiPos(uiDx,uiDy)
end
end
end
bindConn(CN(sidebar.InputBegan, uiHandleDown))
bindConn(CN(sidebar.InputEnded, uiHandleUp))
bindConn(CN(logo.InputBegan, uiHandleDown))
bindConn(CN(logo.InputEnded, uiHandleUp))
bindConn(CN(UIS.InputChanged, function(input)
if not uiDragging then
return
end
if input.UserInputType==XU.MouseMovement
or input.UserInputType==XU.Touch
then
local delta=input.Position - uiDragStart
local cam=Workspace.CurrentCamera
local vp=cam and cam.ViewportSize or VX(1280,720)
local nx=uiStartDx+delta.X
local ny=uiStartDy+delta.Y
local maxX=vp.X/2 - 80
local maxY=vp.Y/2 - 50
if nx>maxX then
nx=maxX
elseif nx<-maxX then
nx=-maxX
end
if ny>maxY then
ny=maxY
elseif ny<-maxY then
ny=-maxY
end
uiDx=nx
uiDy=ny
applyUiPos()
end
end))
selectPage(1)
local function safeBuild(kind,fn)
local ok,err=QQ(fn)
if not ok then
warn("[GM] UI page rejected ("..kind.."): "..TS(err))
end
return ok
end
safeBuild("HUD",function()
local page=pages[1]
local function zu5(parent,cfg)
local row=INF()
row.Name="Swatch_"..cfg.yL
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TXL
lbl.TextYAlignment=TYC
lbl.TextTruncate=TT.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.yL
lbl.ZIndex=4
lbl.Parent=row
local pill=ITB()
pill.Name="Pill"
pill.AutoButtonColor=false
pill.AnchorPoint=VX(0,0.5)
pill.Position=U2(0,168,0.5,0)
pill.Size=UO(44,PILL_H)
pill.BackgroundColor3=cfg.color
pill.Text=""
pill.BorderSizePixel=0
pill.ZIndex=4
local pc=IUC()
pc.CornerRadius=UD(1,0)
pc.Parent=pill
local ps=IUS()
ps.Color=C_DIM
ps.Thickness=1
ps.Transparency=0.5
ps.Parent=pill
pill.Parent=row
local popup=INF()
popup.Name="Popup"
popup.Visible=false
popup.BackgroundColor3=C_POPUP
popup.BackgroundTransparency=0.04
popup.BorderSizePixel=0
popup.Size=UO(6*24+5*4+8,4*24+3*4+8)
popup.ZIndex=60
local gc=IUC()
gc.CornerRadius=UD(0,10)
gc.Parent=popup
local gPad=IUP()
gPad.PaddingTop=UD(0,4)
gPad.PaddingBottom=UD(0,4)
gPad.PaddingLeft=UD(0,4)
gPad.PaddingRight=UD(0,4)
gPad.Parent=popup
local gLay=IN("UIGridLayout")
gLay.CellSize=UO(24,24)
gLay.CellPadding=UO(4,4)
gLay.SortOrder=XR.LayoutOrder
gLay.Parent=popup
popup.Parent=popLayer
local entry={}
local open=false
function entry.close()
if not open then
return
end
open=false
popup.Visible=false
end
popups[#popups+1]=entry
local SWATCHES={
AC3,AC2,
AC1,AC4,
CR(255,94,162),CR(190,90,255),
CR(154,230,180),CR(94,231,133),
CR(72,209,204),CR(80,160,255),
CR(255,170,60),CR(255,120,60),
CR(255,80,80),CR(200,60,60),
CR(90,90,120),CR(50,50,70),
CR(238,235,246),AC5,
CR(30,30,40),CR(15,15,25),
CR(40,90,60),CR(140,200,255),
}
local order=0
for _,c in IP(SWATCHES) do
order=order+1
local ob=ITB()
ob.Text=""
ob.AutoButtonColor=false
ob.BackgroundColor3=c
ob.BorderSizePixel=0
ob.LayoutOrder=order
ob.ZIndex=61
local oc=IUC()
oc.CornerRadius=UD(0,6)
oc.Parent=ob
CN(ob.MouseEnter, function()
ob.BackgroundTransparency=0.15
end)
CN(ob.MouseLeave, function()
ob.BackgroundTransparency=0
end)
CN(ob.Activated, function()
entry.close()
pill.BackgroundColor3=c
cfg.y1(c)
end)
ob.Parent=popup
end
CN(pill.Activated, function()
if open then
entry.close()
else
closeAllPopups()
open=true
local mPos=main.AbsolutePosition
local mSize=main.AbsoluteSize
local pPos=pill.AbsolutePosition
local pSize=pill.AbsoluteSize
local gSize=popup.AbsoluteSize
local x=pPos.X - mPos.X+pSize.X - gSize.X
local y=pPos.Y - mPos.Y+pSize.Y+6
if y+gSize.Y>mSize.Y - 6 then
y=pPos.Y - mPos.Y - gSize.Y - 6
end
if x<6 then
x=6
end
local maxX=mSize.X - gSize.X - 6
if x>maxX then
x=maxX
end
if y<6 then
y=6
end
popup.Position=UO(x,y)
popup.Visible=true
end
end)
row.Parent=parent
return row
end
local card2=mkCard(page,"Dynamic Island")
local grid2=mkGrid(card2)
mkToggle(grid2,{
yL=gmT("Mostrar Dynamic Island","Show Dynamic Island"),
init=ctx.getIslandOn(),
y1=ctx.setIsland,
})
mkDropdown(card2,{
yL=gmT("Mostrar en la island","Show on the island"),
options={"Hora","FPS","Ambos"},
init=ctx.getIslandMode(),
y1=ctx.setIslandMode,
})
end)
safeBuild("Movement",function()
local page=pages[2]
local cardH=mkCard(page,gmT("HUD celular","Mobile HUD"))
local gridH=mkGrid(cardH)
mkToggle(gridH,{
yL=gmT("Desbloquear posiciones","Unlock positions"),
init=ctx.getHudUnlocked(),
y1=ctx.setHudUnlocked,
})
zMS(cardH,{
yL=gmT("Tamano botones","Button size"),
min=60,
max=140,
step=4,
suffix="px",
init=ctx.getHudSize(),
y1=ctx.setHudSize,
})
zMS(cardH,{
yL=gmT("Opacidad botones","Button opacity"),
min=20,
max=100,
step=5,
suffix="%",
init=ctx.getHudOpacity(),
y1=ctx.setHudOpacity,
})
local card=mkCard(page,"Auto BHOP - once per landing")
local grid=mkGrid(card)
mkToggle(grid,{
yL="Enabled",
init=ctx.getBhopOn(),
y1=ctx.setBhop,
})
mkKeybind(card,{
yL="Jump key (hold)",
init=ctx.getBhopKey(),
onBind=ctx.setBhopKeybind,
onSet=ctx.onBhopKeySet,
})
zMS(card,{
yL="Jump delay",
min=0,
max=200,
step=5,
suffix="ms",
init=ctx.getBhopDelay(),
y1=ctx.setBhopDelay,
})
mkToggle(grid,{
yL=gmT("Boton de Celular","Mobile button"),
init=ctx.getHudBhopOn(),
y1=ctx.setHudBhopOn,
})
mkDropdown(card,{
yL=gmT("Modo del boton","Button mode"),
options={"Hold","Toggle"},
init=ctx.getHudBhopMode(),
y1=ctx.setHudBhopMode,
})
local card2=mkCard(page,"Crunch spam")
local grid2=mkGrid(card2)
mkToggle(grid2,{
yL="Enabled",
init=ctx.getCrunchOn(),
y1=ctx.setCrunch,
})
mkKeybind(card2,{
yL="Crunch key (hold)",
init=ctx.getCrunchKey(),
onBind=ctx.setCrunchKeybind,
onSet=ctx.onCrunchKeySet,
})
zMS(card2,{
yL="Hold & gap",
min=10,
max=150,
step=5,
suffix="ms",
init=ctx.getCrunchSpeed(),
y1=ctx.setCrunchSpeed,
})
mkToggle(grid2,{
yL=gmT("Boton de Celular","Mobile button"),
init=ctx.getHudCrunchOn(),
y1=ctx.setHudCrunchOn,
})
mkDropdown(card2,{
yL=gmT("Modo del boton","Button mode"),
options={"Hold","Toggle"},
init=ctx.getHudCrunchMode(),
y1=ctx.setHudCrunchMode,
})
end)
safeBuild("Visuals",function()
local page=pages[3]
local card=mkCard(page,gmT("Modo foto","Screenshot mode"))
zMB(card,{
yL=gmT("Ocultar toda la UI","Hide all UI"),
full=true,
y2=ctx.toggleScreenshot,
})
local shotHint=ITL()
shotHint.BackgroundTransparency=1
shotHint.Size=U2(1,0,0,0)
shotHint.AutomaticSize=XA.Y
shotHint.LayoutOrder=nextRow()
shotHint.Font=WIN_FONT
shotHint.TextSize=10
shotHint.TextXAlignment=TXL
shotHint.TextYAlignment=TYT
shotHint.TextWrapped=true
shotHint.TextColor3=C_DIM
shotHint.TextTransparency=0.3
shotHint.Text=gmT(
"Oculta la UI de Evade y Roblox para capturas limpias. Toca el boton de nuevo para restaurar todo.",
"Hides Evade + Roblox UI for clean screenshots. Press the button again to restore everything."
)
shotHint.ZIndex=3
shotHint.Parent=card
local cardCh=mkCard(page,gmT("Crosshair","Crosshair"))
mkToggle(cardCh,{
yL=gmT("Activar crosshair","Enable crosshair"),
init=ctx.getCrosshairOn(),
y1=ctx.setCrosshairOn,
})
mkDropdown(cardCh,{
yL=gmT("Estilo","Style"),
options={"Dot","Cross","Circle","Cross + Dot"},
init=ctx.getCrosshairStyle(),
y1=ctx.setCrosshairStyle,
})
zMS(cardCh,{
yL=gmT("Tamano","Size"),
min=2,
max=40,
step=1,
suffix="px",
init=ctx.getCrosshairNum("size"),
y1=function(v)
ctx.setCrosshairNum("size",v)
end,
})
zMS(cardCh,{
yL=gmT("Separacion","Gap"),
min=0,
max=24,
step=1,
suffix="px",
init=ctx.getCrosshairNum("gap"),
y1=function(v)
ctx.setCrosshairNum("gap",v)
end,
})
zMS(cardCh,{
yL=gmT("Grosor","Thickness"),
min=1,
max=10,
step=1,
suffix="px",
init=ctx.getCrosshairNum("thick"),
y1=function(v)
ctx.setCrosshairNum("thick",v)
end,
})
zMS(cardCh,{
yL=gmT("Opacidad","Opacity"),
min=10,
max=100,
step=5,
suffix="%",
init=ctx.getCrosshairNum("opacity"),
y1=function(v)
ctx.setCrosshairNum("opacity",v)
end,
})
zMS(cardCh,{
yL=gmT("Posicion X","Position X"),
min=-400,
max=400,
step=2,
suffix="px",
init=ctx.getCrosshairNum("offx"),
y1=function(v)
ctx.setCrosshairNum("offx",v)
end,
})
zMS(cardCh,{
yL=gmT("Posicion Y","Position Y"),
min=-400,
max=400,
step=2,
suffix="px",
init=ctx.getCrosshairNum("offy"),
y1=function(v)
ctx.setCrosshairNum("offy",v)
end,
})
local chPosGrid=mkGrid(cardCh)
zMB(chPosGrid,{
yL=gmT("Centrar","Center"),
y2=ctx.centerCrosshair,
})
local chHint=ITL()
chHint.BackgroundTransparency=1
chHint.Size=U2(1,0,0,0)
chHint.AutomaticSize=XA.Y
chHint.LayoutOrder=nextRow()
chHint.Font=WIN_FONT
chHint.TextSize=10
chHint.TextXAlignment=TXL
chHint.TextYAlignment=TYT
chHint.TextWrapped=true
chHint.TextColor3=C_DIM
chHint.TextTransparency=0.3
chHint.Text=gmT(
"Mueve Posicion X/Y para alinearlo con el punto de mira de Evade. 'Centrar' lo devuelve al medio exacto.",
"Move Position X/Y to align it with Evade's crosshair. 'Center' puts it back at the exact middle."
)
chHint.ZIndex=3
chHint.Parent=cardCh
local chColors={
{gmT("Morado","Purple"),167,108,255},
{gmT("Blanco","White"),255,255,255},
{gmT("Rojo","Red"),255,66,66},
{gmT("Verde","Green"),80,255,120},
{gmT("Cian","Cyan"),80,220,255},
{gmT("Rosa","Pink"),255,105,180},
}
local chGrid=mkGrid(cardCh)
for _,cdef in IP(chColors) do
zMB(chGrid,{
yL=cdef[1],
y2=function()
ctx.setCrosshairColor(cdef[2],cdef[3],cdef[4])
end,
})
end
local cc=ctx.getCrosshairColor() or {167,108,255}
zMS(cardCh,{
yL=gmT("Color R","Color R"),
min=0,
max=255,
step=5,
init=cc[1] or 167,
y1=function(v)
ctx.setCrosshairColorPart("r",v)
end,
})
zMS(cardCh,{
yL=gmT("Color G","Color G"),
min=0,
max=255,
step=5,
init=cc[2] or 108,
y1=function(v)
ctx.setCrosshairColorPart("g",v)
end,
})
zMS(cardCh,{
yL=gmT("Color B","Color B"),
min=0,
max=255,
step=5,
init=cc[3] or 255,
y1=function(v)
ctx.setCrosshairColorPart("b",v)
end,
})
local cardF=mkCard(page,gmT("Fuente de Evade","Evade font"))
mkToggle(cardF,{
yL=gmT("Cambiar fuente del juego","Change game font"),
init=ctx.getEvadeFontOn(),
y1=ctx.setEvadeFontOn,
})
mkDropdown(cardF,{
yL=gmT("Fuente","Font"),
options={"Gotham","Gotham Bold","Montserrat","Minecraft","Sci-Fi","Arcade","Fantasy","Code","Highway","Cartoon","Antique"},
init=ctx.getEvadeFontLabel(),
y1=ctx.setEvadeFontLabel,
})
local fontHint=ITL()
fontHint.BackgroundTransparency=1
fontHint.Size=U2(1,0,0,0)
fontHint.AutomaticSize=XA.Y
fontHint.LayoutOrder=nextRow()
fontHint.Font=WIN_FONT
fontHint.TextSize=10
fontHint.TextXAlignment=TXL
fontHint.TextYAlignment=TYT
fontHint.TextWrapped=true
fontHint.TextColor3=C_DIM
fontHint.TextTransparency=0.3
fontHint.Text=gmT(
"Cambia la fuente de TODA la UI de Evade: menu, velocidad, tablas. Al desactivar se restaura cada fuente original.",
"Changes the font of ALL of Evade's UI: menu, speedometer, boards. Turning it off restores every original font."
)
fontHint.ZIndex=3
fontHint.Parent=cardF
end)
safeBuild("Avatar",function()
local page=pages[4]
local cardH=mkCard(page,"Headless - local only")
mkToggle(cardH,{
yL="Headless head (local)",
init=ctx.getHeadlessHead(),
y1=ctx.setHeadlessHead,
})
mkToggle(cardH,{
yL="Clear head accessories (local)",
init=ctx.getHeadlessAccs(),
y1=ctx.setHeadlessAccs,
})
local cardK=mkCard(page,"Korblox - local only")
local gridK=mkGrid(cardK)
mkToggle(gridK,{
yL="Korblox legs (local)",
init=ctx.getKorbloxOn(),
y1=ctx.setKorblox,
})
mkDropdown(cardK,{
yL="Which leg",
options={"Left leg","Right leg","Both legs"},
init=ctx.getKorbloxLegLabel(),
y1=ctx.setKorbloxLeg,
})
local card=mkCard(page,"Emote replacer - stackable")
local grid=mkGrid(card)
zMB(grid,{
yL="Open emote replacer",
y2=ctx.openEmotePicker,
})
zMB(grid,{
yL="Remove ALL emote mappings",
danger=true,
y2=ctx.removeAllMappings,
})
local card2=mkCard(page,"Unusuals")
zMB(card2,{
yL="Open unusuals picker",
full=true,
y2=ctx.zu8,
})
mkDropdown(card2,{
yL=gmT("Color del unusual","Unusual color"),
options={"Original","Red","Orange","Gold","Green","Cyan","Blue","Purple","Pink"},
init=ctx.zu6(),
y1=ctx.zu7,
})
local cardSkin=mkCard(page,gmT("Skin changer","Skin changer"))
local skinBox=mkInput(cardSkin,gmT("Username de Roblox...","Roblox username..."))
local skinStatus
local skinGrid=mkGrid(cardSkin)
zMB(skinGrid,{
yL=gmT("Aplicar skin","Apply skin"),
y2=function()
if #skinBox.Text==0 then
return
end
skinStatus.Text=gmT("Cargando y7...","Loading y7...")
local name=skinBox.Text
ctx.skinApply(name,function(ok,msg)
skinStatus.Text=TS(msg)
end)
end,
})
zMB(skinGrid,{
yL=gmT("Restaurar mio","Restore mine"),
y2=function()
ctx.skinRestore(function(ok,msg)
skinStatus.Text=TS(msg)
end)
end,
})
skinStatus=mkHint(cardSkin," ")
mkHint(cardSkin,gmT(
"Escribe el username de cualquier persona y tu y7 toma su skin (cuerpo, ropa y cabeza incluidos). Si esta en tu server, tu copia se actualiza sola cuando el cambia su y7. 100% local.",
"Type anyone's username and your y7 takes their skin (body, clothes and head included). If they're in your server, your copy updates itself when they change their y7. 100% local."
))
end)
safeBuild("Atmosphere",function()
local page=pages[5]
local card=mkCard(page,"DLSS / Enhancer")
mkToggle(card,{
yL="DLSS cinematico",
init=ctx.getGfxOn(),
y1=ctx.setGfx,
})
mkDropdown(card,{
yL="Preset",
options={"Realista","Cinematic","Balanced"},
init=ctx.getGfxPresetLabel(),
y1=ctx.setGfxPreset,
})
mkToggle(card,{
yL="Cielo realista HD",
init=ctx.getSkyOn(),
y1=ctx.setSky,
})
zMS(card,{
yL="Reflejos en materiales",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getShiny(),
y1=ctx.setShiny,
})
zMS(card,{
yL="Intensidad de Bloom",
min=0,
max=200,
step=10,
suffix="%",
init=ctx.getBloom(),
y1=ctx.setBloom,
})
zMS(card,{
yL=gmT("Oscuridad de sombras","Shadow darkness"),
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getShadowDark(),
y1=ctx.setShadowDark,
})
local card2=mkCard(page,"Color filters")
mkDropdown(card2,{
yL="Filter preset",
options={"Off","Natural","Vivid","Cinematic","Nocturne","Sombrio"},
init=ctx.getFilterPreset(),
y1=ctx.setFilterPreset,
})
zMS(card2,{
yL="Brightness",
min=-50,
max=50,
step=5,
suffix="%",
init=ctx.getFilterBrightness(),
y1=function(v)
ctx.setColorValue("brightness",v/100)
end,
})
zMS(card2,{
yL="Contrast",
min=-50,
max=50,
step=5,
suffix="%",
init=ctx.getFilterContrast(),
y1=function(v)
ctx.setColorValue("contrast",v/100)
end,
})
zMS(card2,{
yL="Saturation",
min=-100,
max=100,
step=5,
suffix="%",
init=ctx.getFilterSaturation(),
y1=function(v)
ctx.setColorValue("saturation",v/100)
end,
})
local card3=mkCard(page,"Time & atmosphere")
mkToggle(card3,{
yL="Enable time/atmosphere control",
init=ctx.getTimeOn(),
y1=ctx.setTime,
})
zMS(card3,{
yL="Time of day",
min=0,
max=24,
step=0.5,
suffix="h",
decimals=1,
init=ctx.getClock(),
y1=ctx.setClock,
})
zMS(card3,{
yL="Atmosphere density",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getDensity(),
y1=function(v)
ctx.setDensity(v/100)
end,
})
zMS(card3,{
yL="Atmosphere haze",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getHaze(),
y1=function(v)
ctx.setHaze(v/100)
end,
})
local card4=mkCard(page,"by Minwo")
zMB(card4,{
yL="Run self-test report",
full=true,
y2=ctx.runSelfTest,
})
zMB(card4,{
yL="Unload Ghost Method",
full=true,
danger=true,
y2=ctx.unload,
})
end)
safeBuild("Spotify",function()
local page=pages[6]
local function renderTrackList(y4,tracks,playFn)
clearList(y4)
for i,tr in IP(tracks) do
local yL=TS(i)..". "..tr.title.." - "..tr.artist
if not tr.url then
yL=yL..gmT(" (sin preview)"," (no preview)")
end
mkTrackRow(y4,yL,function()
playFn(i)
end)
end
end
local queueHolder
local queueStatus
local recentsHolder
local recentStatus
local playlistsHolder
local playlistListStatus
local doRecent
local doMyPlaylists
local cardA=mkCard(page,gmT("Tu cuenta","Your account"))
local logged,accName=ctx.spGetAccount()
local accLabel=mkHint(cardA,logged
and(gmT("Conectado como: ","Connected as: ")..TS(accName))
or gmT("Sesion no iniciada","Not logged in"))
local dcBox=mkInput(cardA,"sp_dc ...")
local accGrid=mkGrid(cardA)
zMB(accGrid,{
yL=gmT("Iniciar sesion","Log in"),
y2=function()
if #dcBox.Text<20 then
accLabel.Text=gmT("Pega el valor sp_dc primero","Paste the sp_dc value first")
return
end
accLabel.Text=gmT("Conectando...","Connecting...")
local dc=dcBox.Text
ctx.spLogin(dc,function(ok,msg)
if ok then
accLabel.Text=gmT("Conectado como: ","Connected as: ")..TS(msg)
if doRecent then
doRecent()
end
if doMyPlaylists then
doMyPlaylists()
end
else
accLabel.Text=TS(msg)
end
end)
end,
})
zMB(accGrid,{
yL=gmT("Cerrar sesion","Log out"),
y2=function()
ctx.spLogout(function(ok,msg)
accLabel.Text=gmT("Sesion cerrada.","Logged out.")
clearList(recentsHolder or nil)
clearList(playlistsHolder or nil)
end)
end,
})
mkHint(cardA,gmT(
"Como obtener sp_dc: entra a open.spotify.com con TU cuenta en el navegador, abre F12 (inspeccionar) > Application > Cookies > https://open.spotify.com y copia el valor de sp_dc. Se guarda SOLO en tu PC.",
"How to get sp_dc: log into open.spotify.com in your browser, open F12 (inspect) > Application > Cookies > https://open.spotify.com and copy the sp_dc value. It is stored ONLY on your PC."
))
local cardP=mkCard(page,gmT("Reproductor","Player"))
local nowLabel=mkHint(cardP,gmT("Nada suena todavia","Nothing playing yet"))
local playerGrid=mkGrid(cardP)
zMB(playerGrid,{
yL=gmT("Pausa / Seguir","Pause / Resume"),
y2=ctx.spPauseResume,
})
zMB(playerGrid,{
yL=gmT("Parar","Stop"),
y2=ctx.spStop,
})
zMS(cardP,{
yL=gmT("Volumen","Volume"),
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getMusicVolume(),
y1=ctx.spSetVolume,
})
ctx.spSetStateHandler(function(state)
if state and state.playing then
nowLabel.Text="~ "..TS(state.title).." - "..TS(state.artist)
elseif state and state.title~="" then
nowLabel.Text=gmT("Pausado: ","Paused: ")..TS(state.title)
else
nowLabel.Text=gmT("Nada suena todavia","Nothing playing yet")
end
end)
local cardS=mkCard(page,gmT("Buscar en Spotify","Spotify search"))
local searchBox=mkInput(cardS,gmT("Cancion o artista...","Song or artist..."))
local searchStatus
local resultsHolder
zMB(cardS,{
yL=gmT("Buscar canciones","Search songs"),
full=true,
y2=function()
if #searchBox.Text==0 then
return
end
searchStatus.Text=gmT("Buscando...","Searching...")
local q=searchBox.Text
ctx.spSearch(q,function(err,tracks)
if err then
searchStatus.Text=gmT("Fallo la busqueda - revisa GM_spotify_debug.txt","Search failed - check GM_spotify_debug.txt")
return
end
searchStatus.Text=TS(#tracks)
..gmT(" resultados - toca una cancion"," results - tap a song")
clearList(resultsHolder)
for i,tr in IP(tracks) do
local yL=TS(i)..". "..tr.title.." - "..tr.artist
if not tr.url then
yL=yL..gmT(" (sin preview)"," (no preview)")
end
mkTrackRow(resultsHolder,yL,function()
ctx.spPlayResult(i)
end)
end
end)
end,
})
searchStatus=mkHint(cardS," ")
resultsHolder=mkListHolder(cardS)
local cardR=mkCard(page,gmT("Tus recientes","Your recently played"))
zMB(cardR,{
yL=gmT("Cargar recientes","Load recently played"),
full=true,
y2=function()
if doRecent then
doRecent()
end
end,
})
recentStatus=mkHint(cardR,gmT("Inicia sesion y carga lo ultimo que escuchaste.","Log in and load what you last heard."))
recentsHolder=mkListHolder(cardR)
doRecent=function()
recentStatus.Text=gmT("Cargando...","Loading...")
ctx.spRecent(function(err,tracks)
if err then
recentStatus.Text=gmT("Necesitas iniciar sesion.","You need to log in first.")
return
end
recentStatus.Text=TS(#tracks)..gmT(" canciones - toca para escuchar"," songs - tap to hear")
renderTrackList(recentsHolder,tracks,function(i)
ctx.spPlayResult(i)
end)
end)
end
local cardMy=mkCard(page,gmT("Mis playlists","My playlists"))
zMB(cardMy,{
yL=gmT("Cargar mis playlists","Load my playlists"),
full=true,
y2=function()
if doMyPlaylists then
doMyPlaylists()
end
end,
})
playlistListStatus=mkHint(cardMy,gmT("Tus playlists aparecen aqui; toca una y se carga abajo.","Your playlists show up here; tap one to load it below."))
playlistsHolder=mkListHolder(cardMy)
doMyPlaylists=function()
playlistListStatus.Text=gmT("Cargando...","Loading...")
ctx.spMyPlaylists(function(err,lists)
if err then
playlistListStatus.Text=gmT("Necesitas iniciar sesion.","You need to log in first.")
return
end
playlistListStatus.Text=TS(#lists)..gmT(" playlists - toca una para cargarla"," playlists - tap one to load it")
clearList(playlistsHolder)
for _,pl in IP(lists) do
local pid=pl.id
mkTrackRow(playlistsHolder,pl.name,function()
if queueStatus then
queueStatus.Text=gmT("Cargando playlist...","Loading playlist...")
end
ctx.spPlaylist(pid,function(err2,tracks)
if err2 or not queueStatus then
return
end
queueStatus.Text=TS(#tracks)
..gmT(" canciones - toca una y sigue sola"," songs - tap one and it keeps going")
if queueHolder then
renderTrackList(queueHolder,tracks,function(i)
ctx.spPlayQueue(i)
end)
end
end)
end)
end
end)
end
local cardL=mkCard(page,gmT("Playlist por link","Playlist by link"))
local plBox=mkInput(cardL,gmT("Pega el link de tu playlist...","Paste your playlist link..."))
zMB(cardL,{
yL=gmT("Cargar playlist","Load playlist"),
full=true,
y2=function()
if #plBox.Text==0 then
return
end
queueStatus.Text=gmT("Cargando...","Loading...")
local link=plBox.Text
ctx.spPlaylist(link,function(err,tracks)
if err then
queueStatus.Text=gmT("No se pudo cargar - revisa GM_spotify_debug.txt","Could not load - check GM_spotify_debug.txt")
return
end
queueStatus.Text=TS(#tracks)
..gmT(" canciones - toca una y sigue en orden sola"," tracks - tap one and it keeps going")
renderTrackList(queueHolder,tracks,function(i)
ctx.spPlayQueue(i)
end)
end)
end,
})
queueStatus=mkHint(cardL," ")
queueHolder=mkListHolder(cardL)
local cardH=mkCard(page,"Spotify")
mkHint(cardH,gmT(
"Busca canciones reales de Spotify y escucha el preview (30s). Pega el link de tu playlist publica y se reproduce en orden. Si algo falla, GM_spotify_debug.txt dice que paso.",
"Search real Spotify songs and hear the 30s preview. Paste your public playlist link and it plays in order. If anything fails, GM_spotify_debug.txt says what happened."
))
end)
safeBuild("Settings",function()
local page=pages[7]
local cardL=mkCard(page,gmT("Idioma","Language"))
mkDropdown(cardL,{
yL=gmT("Idioma del script","Script language"),
options={"English","Espanol"},
init=ctx.getLanguageLabel(),
y1=ctx.setLanguage,
})
local langHint=ITL()
langHint.BackgroundTransparency=1
langHint.Size=U2(1,0,0,0)
langHint.AutomaticSize=XA.Y
langHint.LayoutOrder=nextRow()
langHint.Font=WIN_FONT
langHint.TextSize=10
langHint.TextXAlignment=TXL
langHint.TextYAlignment=TYT
langHint.TextWrapped=true
langHint.TextColor3=C_DIM
langHint.TextTransparency=0.3
langHint.Text=gmT(
"Cambia el idioma de toda la interfaz al instante.",
"Switch the whole interface language instantly."
)
langHint.ZIndex=3
langHint.Parent=cardL
local cardS=mkCard(page,gmT("Sonidos de la interfaz","Interface sounds"))
mkToggle(cardS,{
yL=gmT("Sonidos UI","UI sounds"),
init=ctx.getSoundsOn(),
y1=ctx.setSoundsOn,
})
local sndHint=ITL()
sndHint.BackgroundTransparency=1
sndHint.Size=U2(1,0,0,0)
sndHint.AutomaticSize=XA.Y
sndHint.LayoutOrder=nextRow()
sndHint.Font=WIN_FONT
sndHint.TextSize=10
sndHint.TextXAlignment=TXL
sndHint.TextYAlignment=TYT
sndHint.TextWrapped=true
sndHint.TextColor3=C_DIM
sndHint.TextTransparency=0.3
sndHint.Text=gmT(
"Feedback sonoro cremoso en toda la interfaz: toggles, botones, sliders y menus.",
"Creamy sound feedback across the whole interface: toggles, buttons, sliders and menus."
)
sndHint.ZIndex=3
sndHint.Parent=cardS
local cardP=mkCard(page,gmT("Presets de configuracion","Configuration presets"))
local gridP=mkGrid(cardP)
zMB(gridP,{
yL=gmT("Cargar Preset A","Load Preset A"),
y2=function()
ctx.applyPreset("A")
end,
})
zMB(gridP,{
yL=gmT("Guardar en A","Save into A"),
y2=function()
ctx.savePreset("A")
end,
})
zMB(gridP,{
yL=gmT("Cargar Preset B","Load Preset B"),
y2=function()
ctx.applyPreset("B")
end,
})
zMB(gridP,{
yL=gmT("Guardar en B","Save into B"),
y2=function()
ctx.savePreset("B")
end,
})
local presHint=ITL()
presHint.BackgroundTransparency=1
presHint.Size=U2(1,0,0,0)
presHint.AutomaticSize=XA.Y
presHint.LayoutOrder=nextRow()
presHint.Font=WIN_FONT
presHint.TextSize=10
presHint.TextXAlignment=TXL
presHint.TextYAlignment=TYT
presHint.TextWrapped=true
presHint.TextColor3=C_DIM
presHint.TextTransparency=0.3
presHint.Text=gmT(
"Un preset guarda TODO: visual, movimiento, graficos, emotes y unusual. Compartelo con tu clan o cambia de estilo en un clic.",
"A preset saves EVERYTHING: visuals, movement, graphics, emotes and unusual. Share it with your clan or switch styles in one click."
)
presHint.ZIndex=3
presHint.Parent=cardP
local cardM=mkCard(page,gmT("Mantenimiento","Maintenance"))
zMB(cardM,{
yL=gmT("Guardar todo ahora","Save everything now"),
full=true,
y2=ctx.saveAllNow,
})
zMB(cardM,{
yL=gmT("Restaurar valores de fabrica","Factory reset"),
full=true,
danger=true,
y2=ctx.factoryReset,
})
end)
local menuOpen=true
local applyPillPos=nil
setVisible=function(state,animate)
if animate then
zzV1.uiSound(state and "open" or "close")
end
menuOpen=state
main.Visible=state
for _,sh in IP(shadows) do
sh.Visible=state
end
if not state then
closeAllPopups()
elseif animate then
uiScale.Scale=zzS*0.88
TSC(
uiScale,
TWI(0.26,ESB,ED.Out),
{Scale=zzS}
):Play()
end
if applyPillPos then
applyPillPos(animate==true)
end
end
if UIS.TouchEnabled and not UIS.KeyboardEnabled then
local openPill=ITB()
openPill.Name="OpenPill"
openPill.AutoButtonColor=false
openPill.AnchorPoint=VX(0.5,0)
openPill.Position=U2(0.5,0,0,2)
openPill.Size=UO(54,54)
openPill.BackgroundColor3=C_CARD
openPill.BackgroundTransparency=0.15
openPill.BorderSizePixel=0
openPill.Font=WIN_FONT_GOTHIC
openPill.TextSize=18
openPill.TextColor3=C_TEXT
openPill.Text="GM"
openPill.ZIndex=2
local opCorner=IUC()
opCorner.CornerRadius=UD(1,0)
opCorner.Parent=openPill
local opStroke=IUS()
opStroke.Color=C_ACCENT
opStroke.Thickness=1.5
opStroke.Transparency=0.45
opStroke.Parent=openPill
openPill.Parent=root
CN(openPill.Activated, function()
setVisible(not menuOpen,true)
end)
local islandActive=false
local pillInfo=TWI(0.3,ESB,ED.Out)
applyPillPos=function(animate)
local target
if menuOpen then
target=U2(1,-44,0,2)
elseif islandActive then
target=U2(0.5,124,0,2)
else
target=U2(0.5,0,0,2)
end
if animate then
TSC(openPill,pillInfo,{Position=target}):Play()
else
openPill.Position=target
end
end
zzV1.zSIA=function(active)
islandActive=active==true
applyPillPos(true)
end
applyPillPos(false)
end
zzV1.root=root
zzV1.setVisible=setVisible
return root
end
local function buildMobileHUD(env)
local TweenService=GGS("TweenService")
local UserInputService=GGS("UserInputService")
local HUD
local gui=nil
local btns={}
local drags={}
local virtual={bhop=false,crunch=false}
local touchesDown=0
local DEFS={
{key="bhop",yL="BHOP"},
{key="crunch",yL="CRUNCH"},
}
local DEFAULT_POS={
bhop=U2(0.85,0,0.78,0),
crunch=U2(0.85,0,0.93,0),
}
local function paintBtn(key,active)
local btn=btns[key]
if not btn then
return
end
QQ(function()
TSC(
btn,
TWI(0.12,ES.Quad,ED.Out),
{
BackgroundColor3=active
and AC1
or AC3,
TextColor3=active
and AC2
or AC5,
}
):Play()
end)
end
local function ensureGui()
if gui and gui.Parent then
return true
end
local root=env.getRoot and env.getRoot() or nil
if not root then
return false
end
gui=INF()
gui.Name="GM_MobileHUD"
gui.BackgroundTransparency=1
gui.Size=US(1,1)
gui.Visible=false
gui.ZIndex=2
gui.Parent=root
HUD.Scope:Track(gui)
for _,def in IP(DEFS) do
local btn=ITB()
btn.Name="GM_HUD_"..def.yL
btn.Text=def.yL
btn.AutoButtonColor=false
btn.AnchorPoint=VX(0.5,0.5)
btn.BackgroundColor3=AC3
btn.BackgroundTransparency=0.15
btn.BorderSizePixel=0
btn.Font=EFB
btn.TextSize=14
btn.TextColor3=AC5
btn.Active=true
btn.ZIndex=2
local bc=IUC()
bc.CornerRadius=UD(0,14)
bc.Parent=btn
local bs=IUS()
bs.Name="Stroke"
bs.Color=CR(120,80,190)
bs.Thickness=1.5
bs.Transparency=0.4
bs.Parent=btn
btn.Parent=gui
btns[def.key]=btn
CN(btn.InputBegan, function(input)
if input.UserInputType~=XU.MouseButton1
and input.UserInputType~=XU.Touch then
return
end
local cfg=env.getHudCfg()
if cfg.unlocked then
drags[def.key]={
start=input.Position,
startPos=btn.Position,
}
return
end
if cfg[def.key.."Mode"]=="Toggle" then
virtual[def.key]=not virtual[def.key]
env.setVirtual(def.key,virtual[def.key])
paintBtn(def.key,virtual[def.key])
else
virtual[def.key]=true
env.setVirtual(def.key,true)
paintBtn(def.key,true)
end
end)
CN(btn.InputEnded, function(input)
if input.UserInputType~=XU.MouseButton1
and input.UserInputType~=XU.Touch then
return
end
if drags[def.key] then
drags[def.key]=nil
env.setBtnPos(def.key,btn.Position)
return
end
local cfg=env.getHudCfg()
if cfg[def.key.."Mode"]~="Toggle" then
virtual[def.key]=false
env.setVirtual(def.key,false)
paintBtn(def.key,false)
end
end)
end
HUD.Scope:Bind(UIS.InputChanged,function(input)
if input.UserInputType~=XU.MouseMovement
and input.UserInputType~=XU.Touch then
return
end
for _,def in IP(DEFS) do
local st=drags[def.key]
local btn=btns[def.key]
if st and btn then
local delta=input.Position - st.start
btn.Position=U2(
st.startPos.X.Scale,st.startPos.X.Offset+delta.X,
st.startPos.Y.Scale,st.startPos.Y.Offset+delta.Y
)
end
end
end)
HUD.Scope:Bind(UIS.InputBegan,function(input)
if input.UserInputType==XU.Touch then
touchesDown+=1
end
end)
HUD.Scope:Bind(UIS.InputEnded,function(input)
if input.UserInputType~=XU.Touch then
return
end
touchesDown=MX(0,touchesDown - 1)
if touchesDown==0 then
local cfg=env.getHudCfg()
for _,def in IP(DEFS) do
if virtual[def.key] and cfg[def.key.."Mode"]~="Toggle" then
virtual[def.key]=false
env.setVirtual(def.key,false)
paintBtn(def.key,false)
end
end
end
end)
return true
end
local function apply()
local cfg=env.getHudCfg()
local dbg={
OD("%H:%M:%S ").."apply: bhopOn="..TS(cfg.bhopOn)
.." crunchOn="..TS(cfg.crunchOn)
.." size="..TS(cfg.size)
.." opacity="..TS(cfg.opacity),
}
if not(cfg.bhopOn or cfg.crunchOn) then
if gui then
gui.Visible=false
end
dbg[#dbg+1]="sin botones: gui "..(gui and "oculto" or "no creado")
QQ(function()
WF("GM_hud_debug.txt",TCN(dbg,"\n"))
end)
return
end
if not ensureGui() then
dbg[#dbg+1]="ensureGui FALLO"
QQ(function()
WF("GM_hud_debug.txt",TCN(dbg,"\n"))
end)
return
end
gui.Visible=true
dbg[#dbg+1]="gui: "..TS(gui:GetFullName()).." visible="..TS(gui.Visible)
for _,def in IP(DEFS) do
local btn=btns[def.key]
local on=cfg[def.key.."On"]==true
btn.Visible=on
if not on and virtual[def.key] then
virtual[def.key]=false
env.setVirtual(def.key,false)
paintBtn(def.key,false)
end
if on then
local size=cfg.size
btn.Size=UO(size,size)
btn.TextSize=MX(11,MFL(size/6))
local op=cfg.opacity/100
btn.BackgroundTransparency=1 -(0.85*op)
btn.TextTransparency=1 -(0.9*op)
local y8=FF(btn, "Stroke")
if y8 then
y8.Transparency=1 -(0.6*op)
y8.Color=cfg.unlocked
and AC1
or CR(120,80,190)
y8.Thickness=cfg.unlocked and 2.5 or 1.5
end
local pos=cfg.pos[def.key]
if type(pos)=="table" and #pos==4 then
btn.Position=U2(pos[1],pos[2],pos[3],pos[4])
else
btn.Position=DEFAULT_POS[def.key]
end
task.defer(function()
QQ(function()
dbg[#dbg+1]=def.yL..": visible="..TS(btn.Visible)
.." pos="..TS(btn.Position)
.." abs="..TS(btn.AbsolutePosition)
.." size="..TS(btn.AbsoluteSize)
.." bgT="..TS(btn.BackgroundTransparency)
end)
QQ(function()
WF("GM_hud_debug.txt",TCN(dbg,"\n"))
end)
end)
end
end
end
HUD=env.zr1({
Name="Mobile HUD",
enable=function(opts)
if HUD.enabled then
return
end
local okApply,errApply=QQ(function()
HUD.enabled=true
apply()
end)
if not okApply then
HUD.enabled=false
QQ(function()
WF("GM_hud_debug.txt",OD("%H:%M:%S ")
.."ENABLE ERROR: "..TS(errApply))
end)
if env.zNT then
env.zNT("Ghost Method","HUD celular error: "..TS(errApply),8)
end
end
end,
zDS=function()
if not HUD.enabled then
return
end
HUD.enabled=false
if gui then
gui.Visible=false
end
for _,def in IP(DEFS) do
if virtual[def.key] then
virtual[def.key]=false
env.setVirtual(def.key,false)
end
end
drags={}
end,
verify=function()
local cfg=env.getHudCfg()
if not(cfg.bhopOn or cfg.crunchOn) then
return true
end
if not(gui and gui.Parent) then
return false,"gui not built while enabled"
end
return true
end,
zVC=function()
if gui and gui.Visible then
return false,"gui still visible after zDS()"
end
return true
end,
applyNow=apply,
})
return HUD
end
local function buildCrosshair(env)
local Crosshair
local chGui=nil
local function chDestroy()
if chGui then
QQ(function()
chGui:Destroy()
end)
chGui=nil
end
end
local function chDraw()
chDestroy()
local root=env.getRoot()
if not root then
return
end
local cfg=env.getCfg()
local raw=cfg.color or {167,108,255}
local color=CR(
math.clamp(MFL(raw[1] or 167),0,255),
math.clamp(MFL(raw[2] or 108),0,255),
math.clamp(MFL(raw[3] or 255),0,255)
)
local alpha=1 - math.clamp(cfg.opacity or 100,5,100)/100
local size=math.clamp(cfg.size or 12,2,40)
local gap=math.clamp(cfg.gap or 4,0,24)
local thick=math.clamp(cfg.thickness or 2,1,10)
local style=cfg.style or "Cross"
chGui=ISG()
chGui.Name="GM_Crosshair"
chGui.ResetOnSpawn=false
chGui.IgnoreGuiInset=false
chGui.DisplayOrder=40
chGui.Parent=root
local y4=INF()
y4.Name="Holder"
y4.AnchorPoint=VX(0.5,0.5)
y4.Position=U2(0.5,math.clamp(cfg.offX or 0,-600,600),0.5,math.clamp(cfg.offY or 0,-600,600))
y4.Size=UO((gap+size)*2+8,(gap+size)*2+8)
y4.BackgroundTransparency=1
y4.Parent=chGui
local function mkShape(px,py,w,h)
local f=INF()
f.AnchorPoint=VX(0.5,0.5)
f.Position=UO(px,py)
f.Size=UO(w,h)
f.BackgroundColor3=color
f.BackgroundTransparency=alpha
f.BorderSizePixel=0
f.Parent=y4
return f
end
local function mkDot(d)
local f=mkShape(0,0,d,d)
local c=IUC()
c.CornerRadius=UD(1,0)
c.Parent=f
return f
end
local function mkRing(d)
local f=mkShape(0,0,d,d)
f.BackgroundTransparency=1
local st=IUS()
st.Color=color
st.Transparency=alpha
st.Thickness=thick
st.Parent=f
return f
end
local function mkArms()
local cy=gap+size/2
local cx=gap+size/2
mkShape(0,-cy,thick,size)
mkShape(0,cy,thick,size)
mkShape(-cx,0,size,thick)
mkShape(cx,0,size,thick)
end
if style=="Dot" then
mkDot(size)
elseif style=="Circle" then
mkRing(size)
elseif style=="Cross + Dot" then
mkArms()
mkDot(MX(2,MFL(thick*1.5)))
else
mkArms()
end
end
Crosshair=env.zr1({
Name="Crosshair",
enable=function()
if Crosshair.enabled then
return
end
Crosshair.enabled=true
chDraw()
if not chGui then
Crosshair.enabled=false
env.zNT("Ghost Method",gmT("Crosshair: no se pudo crear el overlay","Crosshair: could not create the overlay"),4)
end
end,
zDS=function()
if not Crosshair.enabled then
return
end
Crosshair.enabled=false
chDestroy()
end,
applyNow=function()
if Crosshair.enabled then
chDraw()
end
end,
verify=function()
return chGui~=nil
end,
zVC=function()
if chGui then
return false,"gui still alive"
end
return true
end,
})
return Crosshair
end
local function buildEvadeFont(env)
local EvadeFont
local snaps=setmetatable({},{__mode="k"})
local targetClasses={TextLabel=true,TextButton=true,TextBox=true}
local function isOurs(inst)
local gui=inst:FindFirstAncestorOfClass("ScreenGui")
if not gui then
return true
end
local n=gui.Name
return SSB(n,1,3)=="GM_"
or n=="GM_UI"
or n=="GM_Toasts"
or n=="GM_Crosshair"
end
local function fontFromLabel(yL)
local map={
["Gotham"]=EFG,
["Gotham Bold"]=EFB,
["Montserrat"]=EF.Montserrat,
["Sci-Fi"]=EF.SciFi,
["Arcade"]=EF.Arcade,
["Fantasy"]=EF.Fantasy,
["Code"]=EF.Code,
["Highway"]=EF.Highway,
["Cartoon"]=EF.Cartoon,
["Antique"]=EF.Antique,
["Minecraft"]=EF.Arcade,
}
return map[yL] or EFG
end
local function applyOne(inst,font)
if not targetClasses[inst.ClassName] then
return
end
if isOurs(inst) then
return
end
QQ(function()
if snaps[inst]==nil then
snaps[inst]=inst.Font
end
inst.Font=font
end)
end
local function scanAll(font)
local lp=env.getLocalPlayer()
if not lp then
return
end
local pg=FF(lp, "PlayerGui")
if not pg then
return
end
for _,inst in IP(GD(pg)) do
applyOne(inst,font)
end
end
EvadeFont=env.zr1({
Name="EvadeFont",
enable=function()
if EvadeFont.enabled then
return
end
local lp=env.getLocalPlayer()
if not lp or not FF(lp, "PlayerGui") then
env.zNT("Ghost Method",gmT("No se encontro la UI de Evade todavia.","Evade's UI not found yet."),4)
return
end
EvadeFont.enabled=true
local font=fontFromLabel(env.getCfg().font)
scanAll(font)
local pg=FF(lp, "PlayerGui")
EvadeFont.Scope:Bind(pg.DescendantAdded,function(inst)
task.defer(function()
if EvadeFont.enabled and inst and inst.Parent then
applyOne(inst,fontFromLabel(env.getCfg().font))
end
end)
end)
end,
zDS=function()
if not EvadeFont.enabled then
return
end
EvadeFont.enabled=false
EvadeFont.Scope:Wipe()
for inst,orig in PR(snaps) do
QQ(function()
if inst and inst.Parent then
inst.Font=orig
end
end)
end
end,
applyNow=function()
if EvadeFont.enabled then
scanAll(fontFromLabel(env.getCfg().font))
end
end,
verify=function()
return true
end,
zVC=function()
if EvadeFont.enabled then
return false,"still enabled"
end
return true
end,
})
return EvadeFont
end
local function buildSpotify(env)
local Spotify
local SPX={}
SPX.token=nil
SPX.tokenExp=0
SPX.results={}
SPX.queue={}
SPX.queuePos=0
SPX.sound=nil
SPX.current=nil
SPX.playing=false
SPX.onState=nil
local function pushState()
if SPX.onState then
QQ(function()
SPX.onState({
playing=SPX.playing,
title=SPX.current and SPX.current.title or "",
artist=SPX.current and SPX.current.artist or "",
})
end)
end
end
local function spDebug(tag,text)
QQ(function()
WF("GM_spotify_debug.txt",OD("%H:%M:%S")
.." ["..tag.."] "
..TS(text))
end)
end
local function rawRequest(url,headers)
local fn=nil
if type(request)=="function" then
fn=request
elseif type(http_request)=="function" then
fn=http_request
elseif syn and type(syn.request)=="function" then
fn=syn.request
end
if fn then
local ok,res=QQ(function()
return fn({Url=url,Method="GET",Headers=headers or {}})
end)
if ok and type(res)=="table" then
return(res.Body or res.body or ""),true
end
spDebug("request-fn","fallo: "..TS(res))
return nil,true
end
local ok2,body=QQ(function()
return game:HttpGet(url)
end)
if ok2 then
return body,false
end
spDebug("httpget","fallo: "..TS(body))
return nil,false
end
local HttpService=GGS("HttpService")
local function spToken(force)
local now=os.time()*1000
if not force and SPX.token and now<(SPX.tokenExp or 0) - 60000 then
return SPX.token
end
local dc=env.getDc and env.getDc() or ""
if type(dc)=="string" and #dc>10 then
local body=rawRequest(
"https://open.spotify.com/get_access_token?reason=transport&productType=web_player",
{Cookie="sp_dc="..dc}
)
if body and #body>0 then
local ok,data=QQ(function()
return HttpService:JSONDecode(body)
end)
if ok
and type(data)=="table"
and type(data.accessToken)=="string"
and data.isAnonymous==false
then
SPX.token=data.accessToken
SPX.tokenExp=TN(data.accessTokenExpirationTimestampMs) or 0
SPX.isAnonymous=false
spDebug("token","token de USUARIO ok (expira "..TS(SPX.tokenExp)..")")
return SPX.token
end
spDebug("token-user","cookie sp_dc invalida o anonima: "
..TS(SSB(TS(body),1,160)))
else
spDebug("token-user","get_access_token sin respuesta (cookie)")
end
end
local body=rawRequest("https://open.spotify.com/api/token",nil)
if not body or #body==0 then
spDebug("token","respuesta vacia / request fallo")
return nil
end
local ok,data=QQ(function()
return HttpService:JSONDecode(body)
end)
if not ok or type(data)~="table" then
spDebug("token","no JSON: "..TS(SSB(body,1,200)))
return nil
end
local tok=data.accessToken
if type(tok)~="string" then
spDebug("token","accessToken no string: "..TS(tok))
return nil
end
SPX.token=tok
SPX.isAnonymous=true
SPX.tokenExp=TN(data.accessTokenExpirationTimestampMs) or(os.time()*1000+1800000)
spDebug("token","token ANONIMO ok")
return tok
end
local function spApi(url)
local tok=spToken(false)
if not tok then
return nil,"no-token"
end
local body=rawRequest(url,{Authorization="Bearer "..tok})
if not body or #body==0 then
return nil,"empty"
end
local ok,data=QQ(function()
return HttpService:JSONDecode(body)
end)
if not ok or type(data)~="table" then
spDebug("api","no JSON: "..TS(SSB(TS(body),1,200)))
return nil,"bad-json"
end
if data.error then
spDebug("api","spotify error: "..TS(data.error.message))
return nil,"spotify: "..TS(data.error.message)
end
return data,nil
end
local function trackOf(t)
if type(t)~="table" then
return nil
end
local artist=""
if type(t.artists)=="table" and t.artists[1] and t.artists[1].name then
artist=TS(t.artists[1].name)
end
return {
title=TS(t.name or "?"),
artist=artist,
url=t.preview_url,
ms=TN(t.duration_ms) or 0,
}
end
local function spStop()
if SPX.sound then
QQ(function()
SPX.sound:Destroy()
end)
SPX.sound=nil
end
SPX.playing=false
SPX.current=nil
pushState()
end
local function spPlay(track)
if not track then
return
end
if not track.url or track.url=="" then
env.zNT("Spotify",gmT("Esa cancion no tiene preview disponible.","That song has no preview available."),4)
return
end
if SPX.sound then
QQ(function()
SPX.sound:Destroy()
end)
end
local s=IN("Sound")
s.SoundId=track.url
s.Volume=(env.getVolume() or 50)/100
s.Parent=GGS("SoundService")
SPX.sound=s
SPX.current=track
SPX.playing=true
Spotify.enabled=true
CN(s.Ended, function()
if SPX.playing and #SPX.queue>0 and SPX.queuePos<#SPX.queue then
SPX.queuePos+=1
spPlay(SPX.queue[SPX.queuePos])
else
SPX.playing=false
pushState()
end
end)
QQ(function()
s:Play()
end)
pushState()
end
Spotify=env.zr1({
Name="Spotify",
enable=function()
if Spotify.enabled then
return
end
Spotify.enabled=true
end,
zDS=function()
if not Spotify.enabled then
return
end
Spotify.enabled=false
spStop()
end,
verify=function()
return true
end,
zVC=function()
if SPX.sound then
return false,"sound still alive"
end
return true
end,
})
SPX.search=function(query,cb)
TSP(function()
if type(query)~="string" or #query==0 then
return
end
local data,err=spApi("https://api.spotify.com/v1/search?q="
..GGS("HttpService"):UrlEncode(query)
.."&type=track&limit=8")
local out={}
if data and data.tracks and type(data.tracks.items)=="table" then
for _,t in IP(data.tracks.items) do
local tr=trackOf(t)
if tr then
out[#out+1]=tr
end
end
end
SPX.results=out
QQ(function()
cb(err,out)
end)
end)
end
SPX.loadPlaylist=function(link,cb)
TSP(function()
local id=TS(link or "")
local m=SGM(id,"playlist/([%w]+)")
if m then
id=m
end
if #id<10 then
QQ(function()
cb("bad-id",{})
end)
return
end
local data,err=spApi("https://api.spotify.com/v1/playlists/"
..id.."/tracks?limit=30")
local out={}
if data and type(data.items)=="table" then
for _,it in IP(data.items) do
local tr=trackOf(it and it.track)
if tr then
out[#out+1]=tr
end
end
end
SPX.queue=out
SPX.queuePos=0
QQ(function()
cb(err,out)
end)
end)
end
SPX.login=function(dc,cb)
TSP(function()
if type(dc)~="string" or #dc<20 then
QQ(function()
cb(false,gmT("Pega el valor de sp_dc (es largo).","Paste the sp_dc value (it's long)."))
end)
return
end
env.setDc(dc)
SPX.token=nil
local data,err=spApi("https://api.spotify.com/v1/me")
if data and data.id then
SPX.userName=TS(data.display_name or data.id)
SPX.isAnonymous=false
env.setUserName(SPX.userName)
spDebug("login","OK como "..SPX.userName)
QQ(function()
cb(true,SPX.userName)
end)
else
env.setDc("")
SPX.token=nil
spDebug("login","fallo: "..TS(err))
QQ(function()
cb(false,gmT("Sesion invalida - copia sp_dc de nuevo","Invalid session - copy sp_dc again"))
end)
end
end)
end
SPX.logout=function(cb)
TSP(function()
env.setDc("")
env.setUserName("")
SPX.token=nil
SPX.userName=nil
SPX.isAnonymous=nil
QQ(function()
cb(true,gmT("Sesion cerrada.","Logged out."))
end)
end)
end
SPX.recent=function(cb)
TSP(function()
local data,err=spApi("https://api.spotify.com/v1/me/player/recently-played?limit=10")
local out={}
if data and type(data.items)=="table" then
for _,it in IP(data.items) do
local tr=trackOf(it and it.track)
if tr then
out[#out+1]=tr
end
end
end
SPX.results=out
QQ(function()
cb(err,out)
end)
end)
end
SPX.myPlaylists=function(cb)
TSP(function()
local data,err=spApi("https://api.spotify.com/v1/me/playlists?limit=10")
local out={}
if data and type(data.items)=="table" then
for _,it in IP(data.items) do
if type(it)=="table" and it.id then
out[#out+1]={name=TS(it.name or "?"),id=TS(it.id)}
end
end
end
QQ(function()
cb(err,out)
end)
end)
end
SPX.myTracks=function(cb)
TSP(function()
local data,err=spApi("https://api.spotify.com/v1/me/tracks?limit=30")
local out={}
if data and type(data.items)=="table" then
for _,it in IP(data.items) do
local tr=trackOf(it and it.track)
if tr then
out[#out+1]=tr
end
end
end
QQ(function()
cb(err,out)
end)
end)
end
SPX.playResult=function(i)
spPlay(SPX.results[i])
end
SPX.playQueue=function(i)
SPX.queuePos=i or 1
spPlay(SPX.queue[SPX.queuePos])
end
SPX.pauseResume=function()
if not SPX.sound then
return
end
QQ(function()
if SPX.playing then
SPX.sound:Pause()
SPX.playing=false
else
SPX.sound:Resume()
SPX.playing=true
end
end)
pushState()
end
SPX.stop=spStop
SPX.setVolume=function(v)
if SPX.sound then
QQ(function()
SPX.sound.Volume=v/100
end)
end
end
SPX.setStateHandler=function(fn)
SPX.onState=fn
end
return SPX
end
local function buildSkinChanger(env)
local SKX={}
SKX.appliedName=nil
SKX.enabled=false
local Workspace=GGS("Workspace")
local Players=GGS("Players")
local RunService=GGS("RunService")
local HttpService=GGS("HttpService")
local ContentProvider=GGS("ContentProvider")
if _G.GM_SKIN_STOP then
QQ(_G.GM_SKIN_STOP)
end
local alive=true
_G.GM_SKIN_STOP=function()
alive=false
end
local function rigOf(name)
local lp=env.getLocalPlayer()
if not name then
if not lp then return nil end
name=lp.Name
end
local rigs=FF(Workspace, "Rigs")
if not rigs then return nil end
return FF(rigs, name)
end
local function cmKey(c)
return "CM:"..TS(c.BodyPart)..":"..TS(c.MeshId)
end
local function headChildKey(ch)
if ch:IsA("Mesh") then
return "Mesh:"..TS(ch.MeshId)..":"..TS(ch.TextureId)
elseif ch:IsA("SpecialMesh") then
return "SM:"..TS(ch.MeshType)..":"..TS(ch.MeshId)..":"..TS(ch.Scale)
elseif ch:IsA("FaceControls") then
return "FC"
elseif ch:IsA("Decal") then
return "decal:"..ch.Name..":"..TS(ch.Texture)
end
return nil
end
local function captureHeadState(rig)
local head=FF(rig, "Head")
if not head then return nil end
local h={keys={},props={}}
for _,ch in IP(GC(head)) do
local k=headChildKey(ch)
if k then h.keys[k]=ch:Clone() end
end
QQ(function()
h.props.Color=head.Color
h.props.Transparency=head.Transparency
h.props.Material=head.Material
end)
return h
end
local function parentAcc(rig,tpl)
local acc=tpl:Clone()
local head=FF(rig, "Head")
QQ(function()
for _,d in IP(GD(acc)) do
if d:IsA("BasePart") then
d.CanCollide=false
d.CanQuery=false
d.CanTouch=false
d.Massless=true
d.Anchored=false
if head then d.CFrame=head.CFrame end
elseif d:IsA("JointInstance") or d:IsA("WeldConstraint") then
local function inside(x)
return x~=nil and x:IsDescendantOf(acc)
end
if not(inside(d.Part0) and inside(d.Part1)) then d:Destroy() end
elseif d:IsA("Constraint") then
local function ins(a)
return a~=nil and a:IsDescendantOf(acc)
end
if not(ins(d.Attachment0) and ins(d.Attachment1)) then d:Destroy() end
end
end
end)
acc.Parent=rig
return acc
end
local fpNow=false
local function cameraInFirstPerson()
local cam=Workspace.CurrentCamera
if not cam then return false end
local ok,dist=QQ(function()
return(cam.CFrame.Position - cam.Focus.Position).Magnitude
end)
if not ok then return false end
return dist<2
end
local function applyFP(rig,inFirst)
QQ(function()
local want=inFirst and 1 or 0
local head=FF(rig, "Head")
if head and head:IsA("BasePart") and head.LocalTransparencyModifier~=want then
head.LocalTransparencyModifier=want
end
for _,acc in IP(GC(rig)) do
if acc:IsA("Accessory") then
local handle=FF(acc, "Handle")
if handle and handle:IsA("BasePart") then
local handleAtt=FFC(handle, "Attachment")
if handleAtt and head and FF(head, handleAtt.Name) then
for _,d in IP(GD(acc)) do
if d:IsA("BasePart") and d.LocalTransparencyModifier~=want then
d.LocalTransparencyModifier=want
end
end
end
end
end
end
end)
end
local SEED_BODY={
[86499666]={p="Torso",m=82987757},
[86499716]={p="LeftArm",m=83001137},
[86499698]={p="RightArm",m=83001181},
[86499753]={p="LeftLeg",m=746825633},
[86499793]={p="RightLeg",m=83001181},
[2807146071]={p="RightLeg",m=2794659901,ot=2530631626},
[48474356]={p="Torso",m=48112070},
[27493604]={p="Torso",m=27493004},
[32357619]={p="LeftArm",m=32331863},
[32357584]={p="RightArm",m=32331968},
[27493718]={p="RightLeg",m=27493073,ot=27493193},
[27493683]={p="LeftLeg",m=27493033},
[139607718]={p="RightLeg",m=101851696,ot=101851254},
}
local SEED_HEAD={
[72451007866240]={m="rbxassetid://126348698950620",t="FileMesh"},
[94191288988769]={m="rbxassetid://113369083099847",t="FileMesh"},
[14819526414]={m="rbxassetid://14801511097",t="FileMesh"},
[14488197116]={m="rbxassetid://14478743918",t="FileMesh"},
[0]={t="Head",s={1.25,1.25,1.25}},
}
local cacheBody={}
local cacheHead={}
local function loadCache()
if not(isfile and readfile) then return end
QQ(function()
if not ISF("GM_bodylib.json") then return end
local data=HttpService:JSONDecode(readfile("GM_bodylib.json"))
if type(data)=="table" then
if type(data.body)=="table" then
for k,v in PR(data.body) do
cacheBody[TN(k) or k]=v
end
end
if type(data.head)=="table" then
for k,v in PR(data.head) do
cacheHead[TN(k) or k]=v
end
end
end
end)
end
local function saveCache()
if not writefile then return end
QQ(function()
WF("GM_bodylib.json",HttpService:JSONEncode({body=cacheBody,head=cacheHead}))
end)
end
local function knownBody(asset)
return SEED_BODY[asset] or cacheBody[asset]
end
local function knownHead(asset)
return SEED_HEAD[asset] or cacheHead[asset]
end
local function loadBodyPairViaGetObjects(assetId,partName)
if type(game.GetObjects)~="function" then return nil end
local ok,loaded=QQ(function()
return game:GetObjects("rbxassetid://"..TS(assetId))
end)
if not ok or type(loaded)~="table" or #loaded==0 then
return nil
end
local found=nil
for _,obj in IP(loaded) do
local pool={}
if obj:IsA("CharacterMesh") then
pool[#pool+1]=obj
end
for _,d in IP(GD(obj)) do
if d:IsA("CharacterMesh") then
pool[#pool+1]=d
end
end
for _,cm in IP(pool) do
local pn=TS(cm.BodyPart):match("%.(%w+)$")
if pn==partName then
found={p=partName,m=cm.MeshId,bt=cm.BaseTextureId or 0,ot=cm.OverlayTextureId or 0}
end
end
QQ(function() obj:Destroy() end)
if found then break end
end
return found
end
local function loadHeadPairViaGetObjects(headAsset)
if type(game.GetObjects)~="function" then return nil end
local ok,loaded=QQ(function()
return game:GetObjects("rbxassetid://"..TS(headAsset))
end)
if not ok or type(loaded)~="table" or #loaded==0 then
return nil
end
local found=nil
for _,obj in IP(loaded) do
local pool={}
if obj:IsA("BasePart") then
pool[#pool+1]=obj
end
for _,d in IP(GD(obj)) do
if d:IsA("BasePart") then
pool[#pool+1]=d
end
end
for _,part in IP(pool) do
local meshId=nil
QQ(function()
if part:IsA("MeshPart") then
meshId=part.MeshId
else
local sm=FFC(part, "SpecialMesh") or FFC(part, "Mesh")
if sm then
meshId=sm.MeshId
end
end
end)
if meshId and meshId~="" and meshId~=0 then
found={m=TS(meshId),t="FileMesh",s={1,1,1}}
end
end
QQ(function() obj:Destroy() end)
if found then break end
end
return found
end
local function meshFromPair(pair)
local cm=IN("CharacterMesh")
QQ(function()
cm.BodyPart=Enum.BodyPart[pair.p]
cm.MeshId=pair.m
cm.BaseTextureId=pair.bt or 0
cm.OverlayTextureId=pair.ot or 0
end)
return cm
end
local function headFromPair(pair,desc)
local h={keys={},props={}}
local sm=IN("SpecialMesh")
QQ(function()
if pair.t=="Head" then
sm.MeshType=Enum.MeshType.Head
else
sm.MeshType=Enum.MeshType.FileMesh
sm.MeshId=pair.m
end
local s=pair.s
if type(s)=="table" and #s>=3 then
sm.Scale=Vector3.new(TN(s[1]) or 1,TN(s[2]) or 1,TN(s[3]) or 1)
end
end)
h.keys[headChildKey(sm)]=sm
QQ(function()
if desc and desc.Face and desc.Face~=0 then
local fd=IN("Decal")
fd.Name="face"
fd.Texture="rbxassetid://"..desc.Face
h.keys[headChildKey(fd)]=fd
end
end)
return h
end
local lastScan=0
local function scanPlayer(p)
local learned=0
local r=rigOf(p.Name)
if not r then return 0 end
local hasCM=false
for _,c in IP(GC(r)) do
if c:IsA("CharacterMesh") then
hasCM=true
break
end
end
local headMesh=nil
local head=FF(r, "Head")
if head then
for _,ch in IP(GC(head)) do
local cls,mtype,mid
QQ(function()
if ch:IsA("SpecialMesh") or ch:IsA("Mesh") then
cls=ch.ClassName
mtype=ch.MeshType
mid=ch.MeshId
end
end)
if cls then
local custom=(mtype~=Enum.MeshType.Head) and(mid~=nil and mid~="" and mid~=0)
if custom then
headMesh=ch
break
elseif mtype==Enum.MeshType.Head and not knownHead(0) then
headMesh=ch
break
end
end
end
end
if not hasCM and not headMesh then return 0 end
local d=nil
QQ(function() d=Players:GetHumanoidDescriptionFromUserId(p.UserId) end)
if not d then return 0 end
QQ(function()
local assets={
Head=d.Head,Torso=d.Torso,LeftArm=d.LeftArm,
RightArm=d.RightArm,LeftLeg=d.LeftLeg,RightLeg=d.RightLeg,
}
if hasCM then
for _,c in IP(GC(r)) do
if c:IsA("CharacterMesh") then
local partName=TS(c.BodyPart):match("%.(%w+)$")
local asset=assets[partName]
if asset and asset~=0 and not knownBody(asset) then
cacheBody[asset]={p=partName,m=c.MeshId,bt=c.BaseTextureId or 0,ot=c.OverlayTextureId or 0}
learned+=1
end
end
end
end
if headMesh then
local ha=assets.Head
if ha and ha~=0 then
if not knownHead(ha) then
local sc=headMesh.Scale
cacheHead[ha]={m=TS(headMesh.MeshId),t="FileMesh",s={sc.X,sc.Y,sc.Z}}
learned+=1
end
elseif not knownHead(0) then
local sc=headMesh.Scale
cacheHead[0]={t="Head",s={sc.X,sc.Y,sc.Z}}
learned+=1
end
end
end)
return learned
end
local function scanLobby()
local learned=0
for _,p in IP(Players:GetPlayers()) do
if alive then
learned+=scanPlayer(p)
end
end
lastScan=OCL()
if learned>0 then
saveCache()
warn("[GM] Skin: libreria de cuerpos +"..TS(learned).." pares nuevos")
end
return learned
end
local function sameTemplate(a,b)
local na=TS(a):match("%d+$")
local nb=TS(b):match("%d+$")
return na~=nil and nb~=nil and na==nb
end
local function templateLoads(cls,y3)
local ok=false
QQ(function()
local inst=IN(cls)
if cls=="Shirt" then inst.ShirtTemplate=y3
elseif cls=="Pants" then inst.PantsTemplate=y3
elseif cls=="ShirtGraphic" then inst.GraphicTemplate=y3 end
ContentProvider:PreloadAsync({inst},function(id,status)
if TS(status):find("Success") then ok=true end
end)
inst:Destroy()
end)
return ok
end
local function httpGet(url)
local ok,body=QQ(function() return game:HttpGet(url) end)
if ok and type(body)=="string" and #body>0 then
return body
end
local fn
if type(http_request)=="function" then
fn=http_request
elseif type(syn)=="table" and type(syn.request)=="function" then
fn=syn.request
end
if fn then
local ok2,res=QQ(function() return fn({Url=url,Method="GET"}) end)
if ok2 and type(res)=="table" and type(res.Body)=="string" then
return res.Body
end
end
return nil
end
local function fixClothes(state,uid)
local defs={
{key="shirtTemplate",cls="Shirt",ak="shirtAsset",vk="shirtVersion"},
{key="pantsTemplate",cls="Pants",ak="pantsAsset",vk="pantsVersion"},
}
local fallbacks={}
for _,def in IP(defs) do
local tpl=state[def.key]
if tpl and not templateLoads(def.cls,tpl) then
fallbacks[#fallbacks+1]=def
end
end
if #fallbacks==0 then return end
local api={}
local raw=httpGet("https://y7.roblox.com/v1/users/"..TS(uid).."/y7")
if raw then
QQ(function()
local data=HttpService:JSONDecode(raw)
for _,a in IP(data.assets or {}) do
local t=a.assetType and a.assetType.name
if t=="Shirt" then api.shirtAsset=a.id; api.shirtVersion=a.currentVersionId end
if t=="Pants" then api.pantsAsset=a.id; api.pantsVersion=a.currentVersionId end
end
end)
end
for _,def in IP(fallbacks) do
state[def.key]=nil
local cands={}
if api[def.vk] then cands[#cands+1]="rbxassetid://"..api[def.vk] end
if api[def.ak] then cands[#cands+1]="rbxassetid://"..api[def.ak] end
for _,c in IP(cands) do
if templateLoads(def.cls,c) then
state[def.key]=c
break
end
end
end
end
local function buildState(rig,desc)
local state={
cmKeys={},
head=nil,
accByName={},
shirtTemplate=nil,
pantsTemplate=nil,
graphicTemplate=nil,
colors=nil,
desc=desc,
}
if desc then
QQ(function()
if desc.Shirt and desc.Shirt~=0 then
state.shirtTemplate="rbxassetid://"..desc.Shirt
end
if desc.Pants and desc.Pants~=0 then
state.pantsTemplate="rbxassetid://"..desc.Pants
end
if desc.GraphicTShirt and desc.GraphicTShirt~=0 then
state.graphicTemplate="rbxassetid://"..desc.GraphicTShirt
end
end)
QQ(function()
state.colors={
head=desc.HeadColor,
torso=desc.TorsoColor,
la=desc.LeftArmColor,
ra=desc.RightArmColor,
ll=desc.LeftLegColor,
rl=desc.RightLegColor,
}
end)
end
if not rig then return state end
for _,c in IP(GC(rig)) do
if c:IsA("CharacterMesh") then
state.cmKeys[cmKey(c)]=c:Clone()
end
end
state.head=captureHeadState(rig)
for _,c in IP(GC(rig)) do
if c:IsA("Accessory") then
state.accByName[c.Name]=c:Clone()
end
end
local sh=FFC(rig, "Shirt")
if sh then state.shirtTemplate=sh.ShirtTemplate end
local pa=FFC(rig, "Pants")
if pa then state.pantsTemplate=pa.PantsTemplate end
QQ(function()
local gr=FFC(rig, "ShirtGraphic")
if gr then state.graphicTemplate=gr.GraphicTemplate end
end)
local bc=FFC(rig, "BodyColors")
if bc then
QQ(function()
state.colors={
head=bc.HeadColor3,torso=bc.TorsoColor3,
la=bc.LeftArmColor3,ra=bc.RightArmColor3,
ll=bc.LeftLegColor3,rl=bc.RightLegColor3,
}
end)
end
return state
end
local function stateFromPairs(desc)
local state=buildState(nil,desc)
local missing={}
local defs={"Torso","LeftArm","RightArm","LeftLeg","RightLeg"}
for _,partName in IP(defs) do
local asset=nil
QQ(function() asset=desc[partName] end)
if asset and asset~=0 then
local pair=knownBody(asset)
if not pair then
pair=loadBodyPairViaGetObjects(asset,partName)
if pair then
cacheBody[asset]=pair
saveCache()
end
end
if not pair and OCL() - lastScan>30 then
scanLobby()
pair=knownBody(asset)
end
if pair then
local cm=meshFromPair(pair)
state.cmKeys[cmKey(cm)]=cm
else
missing[#missing+1]=partName
end
end
end
local headAsset=nil
QQ(function() headAsset=desc.Head end)
if headAsset and headAsset~=0 then
local hp=knownHead(headAsset)
if not hp then
hp=loadHeadPairViaGetObjects(headAsset)
if hp then
cacheHead[headAsset]=hp
saveCache()
end
end
if not hp and OCL() - lastScan>30 then
scanLobby()
hp=knownHead(headAsset)
end
if hp then
state.head=headFromPair(hp,desc)
else
missing[#missing+1]="head"
end
else
local dh=knownHead(0)
if dh then
state.head=headFromPair(dh,desc)
end
end
return state,missing
end
local function enforce(rig,state)
local present={}
for i=#GC(rig),1,-1 do
local c=GC(rig)[i]
if c:IsA("CharacterMesh") then
local k=cmKey(c)
if state.cmKeys[k] then
present[k]=c
else
c:Destroy()
end
end
end
for k,tpl in PR(state.cmKeys) do
if not present[k] then
local n=tpl:Clone()
n.Name="GM_Skin"
n.Parent=rig
end
end
local head=FF(rig, "Head")
if head and state.head then
local presentH={}
for i=#GC(head),1,-1 do
local ch=GC(head)[i]
local k=headChildKey(ch)
if k then
if state.head.keys[k] then
presentH[k]=ch
else
ch:Destroy()
end
end
end
for k,tpl in PR(state.head.keys) do
if not presentH[k] then
tpl:Clone().Parent=head
end
end
QQ(function()
local pr=state.head.props
if pr.Color and head.Color~=pr.Color then head.Color=pr.Color end
if pr.Transparency and head.Transparency~=pr.Transparency then head.Transparency=pr.Transparency end
if pr.Material and head.Material~=pr.Material then head.Material=pr.Material end
end)
end
local presentA={}
for i=#GC(rig),1,-1 do
local c=GC(rig)[i]
if c:IsA("Accessory") then
if state.accByName[c.Name] then
presentA[c.Name]=c
else
c:Destroy()
end
end
end
for name,tpl in PR(state.accByName) do
if not presentA[name] then
parentAcc(rig,tpl)
end
end
if state.shirtTemplate then
local sh=FFC(rig, "Shirt")
if not sh then sh=IN("Shirt") sh.Parent=rig end
if not sameTemplate(sh.ShirtTemplate,state.shirtTemplate) then sh.ShirtTemplate=state.shirtTemplate end
else
local sh=FFC(rig, "Shirt")
if sh then sh:Destroy() end
end
if state.pantsTemplate then
local pa=FFC(rig, "Pants")
if not pa then pa=IN("Pants") pa.Parent=rig end
if not sameTemplate(pa.PantsTemplate,state.pantsTemplate) then pa.PantsTemplate=state.pantsTemplate end
else
local pa=FFC(rig, "Pants")
if pa then pa:Destroy() end
end
QQ(function()
if state.graphicTemplate then
local gr=FFC(rig, "ShirtGraphic")
if not gr then gr=IN("ShirtGraphic") gr.Parent=rig end
if not sameTemplate(gr.GraphicTemplate,state.graphicTemplate) then gr.GraphicTemplate=state.graphicTemplate end
else
local gr=FFC(rig, "ShirtGraphic")
if gr then gr:Destroy() end
end
end)
if state.colors then
QQ(function()
local bc=FFC(rig, "BodyColors")
if not bc then bc=IN("BodyColors") bc.Parent=rig end
if bc.HeadColor3~=state.colors.head then bc.HeadColor3=state.colors.head end
if bc.TorsoColor3~=state.colors.torso then bc.TorsoColor3=state.colors.torso end
if bc.LeftArmColor3~=state.colors.la then bc.LeftArmColor3=state.colors.la end
if bc.RightArmColor3~=state.colors.ra then bc.RightArmColor3=state.colors.ra end
if bc.LeftLegColor3~=state.colors.ll then bc.LeftLegColor3=state.colors.ll end
if bc.RightLegColor3~=state.colors.rl then bc.RightLegColor3=state.colors.rl end
end)
end
end
local skin=nil
local savedMyState=nil
local function stopSkin()
if skin and skin.conn then skin.conn:Disconnect() end
skin=nil
end
local function stateSig(s)
local parts={}
for k in PR(s.cmKeys) do parts[#parts+1]="cm"..k end
for n in PR(s.accByName) do parts[#parts+1]="ac"..n end
if s.head then
for k in PR(s.head.keys) do parts[#parts+1]="hd"..k end
end
parts[#parts+1]="sh"..TS(s.shirtTemplate)
parts[#parts+1]="pa"..TS(s.pantsTemplate)
parts[#parts+1]="gr"..TS(s.graphicTemplate)
if s.colors then
parts[#parts+1]="co"..TS(s.colors.head)..TS(s.colors.torso)
..TS(s.colors.la)..TS(s.colors.ra)..TS(s.colors.ll)..TS(s.colors.rl)
end
table.sort(parts)
return TCN(parts,"|")
end
local function startEnforce(state,watchUid)
local rig=rigOf()
if not rig then return false end
for i=#GC(rig),1,-1 do
local c=GC(rig)[i]
if c:IsA("Accessory") or c:IsA("Shirt") or c:IsA("Pants")
or c:IsA("ShirtGraphic") or c:IsA("BodyColors")
or c:IsA("CharacterMesh") then
c:Destroy()
end
end
for _,p in IP(GD(rig)) do
if p:IsA("Decal") and p.Name=="face" then p:Destroy() end
end
local rhum=FFC(rig, "Humanoid")
if rhum and state.desc then
QQ(function() rhum:ApplyDescription(state.desc) end)
QQ(function()
rhum.BodyWidthScale=state.desc.WidthScale or 1
rhum.BodyHeightScale=state.desc.HeightScale or 1
rhum.BodyDepthScale=state.desc.DepthScale or 1
rhum.HeadScale=state.desc.HeadScale or 1
end)
QQ(function()
for _,c in IP(GC(rig)) do
if c:IsA("Accessory") and not state.accByName[c.Name] then
state.accByName[c.Name]=c:Clone()
end
end
end)
if not state.shirtTemplate then
local sh2=FFC(rig, "Shirt")
if sh2 then state.shirtTemplate=sh2.ShirtTemplate end
end
if not state.pantsTemplate then
local pa2=FFC(rig, "Pants")
if pa2 then state.pantsTemplate=pa2.PantsTemplate end
end
end
QQ(enforce,rig,state)
local conn
conn=CN(RunService.RenderStepped, function()
if not alive or not skin then conn:Disconnect() return end
local st=skin.state
if not st then return end
local r=rigOf()
if not r then return end
QQ(enforce,r,st)
if fpNow then
applyFP(r,true)
end
end)
skin={conn=conn,state=state,token={}}
if watchUid then
local token=skin.token
local desc=state.desc
local sig=stateSig(state)
TSP(function()
while alive and skin and skin.token==token do
TW(2)
if not(alive and skin and skin.token==token) then break end
local targetPlayer=nil
for _,p in IP(Players:GetPlayers()) do
if p.UserId==watchUid then
targetPlayer=p
break
end
end
if targetPlayer then
local tr=rigOf(targetPlayer.Name)
if tr then
local fresh=buildState(tr,desc)
if stateSig(fresh)~=sig then
sig=stateSig(fresh)
fixClothes(fresh,watchUid)
skin.state=fresh
QQ(function()
env.zNT(
gmT("Skin actualizada","Skin updated"),
gmT("El target cambio su y7 ? tu copia se actualizo.","The target changed their y7 ? your copy updated."),
3
)
end)
end
end
end
end
end)
end
return true
end
SKX.apply=function(username,cb)
TSP(function()
stopSkin()
local lp=env.getLocalPlayer()
if not lp then
QQ(function()
cb(false,gmT("No hay jugador local.","No local player."))
end)
return
end
if not savedMyState then
local myDesc=nil
QQ(function() myDesc=Players:GetHumanoidDescriptionFromUserId(lp.UserId) end)
savedMyState=buildState(rigOf(),myDesc)
end
local uid=nil
QQ(function() uid=Players:GetUserIdFromNameAsync(username) end)
if not uid then
QQ(function()
cb(false,gmT("No encontre ese username.","Username not found."))
end)
return
end
local desc=nil
QQ(function() desc=Players:GetHumanoidDescriptionFromUserId(uid) end)
if not desc then
QQ(function()
cb(false,gmT("No pude cargar el y7.","Could not load the y7."))
end)
return
end
local targetRig=nil
local targetPlayer=nil
for _,p in IP(Players:GetPlayers()) do
if p.UserId==uid then
targetPlayer=p
break
end
end
if targetPlayer then
targetRig=rigOf(targetPlayer.Name)
end
local state,missing
if targetRig then
state=buildState(targetRig,desc)
missing=nil
else
state,missing=stateFromPairs(desc)
end
fixClothes(state,uid)
local okStart=startEnforce(state,targetPlayer and uid or nil)
if not okStart then
QQ(function()
cb(false,gmT("Tu rig no esta listo, reintenta.","Your rig is not ready, retry."))
end)
return
end
SKX.appliedName=username
SKX.enabled=true
local extra=""
if targetRig then
extra=gmT(" (copiado en vivo de su rig)"," (copied live from their rig)")
elseif missing and #missing>0 then
extra=gmT(" (reconstruido, sin: "," (rebuilt, missing: ")..TCN(missing,", ")..")"
else
extra=gmT(" (reconstruido 100%)"," (100% rebuilt)")
end
QQ(function()
cb(true,gmT("Skin de @"..username.." aplicada","Skin from @"..username.." applied")..extra)
end)
end)
end
SKX.restore=function(cb)
TSP(function()
if not skin then
QQ(function()
cb(false,gmT("No habia skin cambiada.","No changed skin to restore."))
end)
return
end
if skin.state==savedMyState then
QQ(function()
cb(false,gmT("Restore ya en progreso.","Restore already running."))
end)
return
end
if not savedMyState then
QQ(function()
cb(false,gmT("No hay estado guardado.","No saved state."))
end)
return
end
stopSkin()
startEnforce(savedMyState,nil)
TDL(3,function()
if alive and skin and skin.state==savedMyState then
stopSkin()
end
end)
SKX.appliedName=nil
QQ(function()
cb(true,gmT("Tu y7 original esta de vuelta.","Your original y7 is back."))
end)
end)
end
loadCache()
TDL(10,function()
if alive then
scanLobby()
end
end)
CN(Players.PlayerAdded, function(p)
TDL(12,function()
if alive and scanPlayer(p)>0 then
saveCache()
end
end)
end)
TSP(function()
local lastManaging=false
while alive do
TW(0.1)
fpNow=cameraInFirstPerson()
local managing=(skin~=nil) or fpNow
local rig=rigOf()
if managing and rig then
applyFP(rig,fpNow)
elseif lastManaging and rig and not managing then
applyFP(rig,false)
end
lastManaging=managing
end
end)
return SKX
end
local function body()
local UserInputService=GGS("UserInputService")
local TweenService=GGS("TweenService")
local Players=GGS("Players")
LocalPlayer=Players.LocalPlayer
local function executorName()
if type(identifyexecutor)=="function" then
local ok,name=QQ(identifyexecutor)
if ok and type(name)=="string" and #name>0 then
return name
end
end
return "unknown"
end
local function resolveGuiParent()
local okHui,hui=QQ(function()
return(type(gethui)=="function") and gethui() or nil
end)
if okHui and hui then
return hui
end
local okCore,core=QQ(function()
return GGS("CoreGui")
end)
if okCore and core then
return core
end
return WFC(LocalPlayer, "PlayerGui")
end
GuiParent=resolveGuiParent()
markStep("helpers ok")
local fadeSplash
do
local splashLighting=GGS("Lighting")
local function zzV6(msg)
local K={
0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,
0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,
0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,
0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,
0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,
0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,
0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,
0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,
0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2,
}
local h={
0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,
0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19,
}
local len=#msg
local bitLen=len*8
local tail=string.char(0x80)..SRP("\0",((55 - len)%64))
tail=tail..SRP("\0",4)..string.char(
MFL(bitLen/0x1000000)%0x100,
MFL(bitLen/0x10000)%0x100,
MFL(bitLen/0x100)%0x100,
bitLen%0x100
)
local data=msg..tail
local w={}
local rrot=bit32.rrotate
for block=0,#data - 1,64 do
for i=0,15 do
local o=block+i*4+1
w[i+1]=bit32.bor(
bit32.lshift(string.byte(data,o),24),
bit32.lshift(string.byte(data,o+1),16),
bit32.lshift(string.byte(data,o+2),8),
string.byte(data,o+3)
)
end
for i=17,64 do
local s0=bit32.bxor(rrot(w[i - 15],7),rrot(w[i - 15],18),bit32.rshift(w[i - 15],3))
local s1=bit32.bxor(rrot(w[i - 2],17),rrot(w[i - 2],19),bit32.rshift(w[i - 2],10))
w[i]=bit32.band(w[i - 16]+s0+w[i - 7]+s1,0xffffffff)
end
local a,b,c,d,e,f,g,hh=h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]
for i=1,64 do
local S1=bit32.bxor(rrot(e,6),rrot(e,11),rrot(e,25))
local ch=bit32.bxor(bit32.band(e,f),bit32.band(bit32.bnot(e),g))
local t1=(hh+S1+ch+K[i]+w[i])%0x100000000
local S0=bit32.bxor(rrot(a,2),rrot(a,13),rrot(a,22))
local mj=bit32.bxor(bit32.band(a,b),bit32.band(a,c),bit32.band(b,c))
local t2=(S0+mj)%0x100000000
hh,g,f,e,d,c,b,a=
g,f,e,(d+t1)%0x100000000,c,b,a,(t1+t2)%0x100000000
end
h[1]=(h[1]+a)%0x100000000
h[2]=(h[2]+b)%0x100000000
h[3]=(h[3]+c)%0x100000000
h[4]=(h[4]+d)%0x100000000
h[5]=(h[5]+e)%0x100000000
h[6]=(h[6]+f)%0x100000000
h[7]=(h[7]+g)%0x100000000
h[8]=(h[8]+hh)%0x100000000
end
local out={}
for i=1,8 do
out[i]=SFM("%08x",h[i])
end
return TCN(out)
end
local zzV7=""
local zzV4="https://raw.githubusercontent.com/minwokk0/keysGM/main/keys.json"
local zzV3={Minwo=true,Misshannixa=true}
local zzV2
zzV2=function()
if zzV3[LocalPlayer.Name] then
zzV1.accessData={expires=os.time()+604800,user=LocalPlayer.Name,key="owner"}
zzV1.accessToken=zzV5(zzV1.accessData.expires,zzV1.accessData.user,zzV1.accessData.key)
zzV1.keyRank="eclipse"
return true,"owner"
end
local genv=(type(getgenv)=="function") and getgenv() or _G
local supplied=genv.GM_KEY
if(type(supplied)~="string" or #supplied==0) and isfile and readfile then
QQ(function()
if ISF("GM_key.txt") then
supplied=readfile("GM_key.txt")
end
end)
end
if type(supplied)~="string" or #supplied==0 then
return false,"no key entered"
end
supplied=SUP(SG(supplied,"%s",""))
local body=nil
QQ(function()
body=game:HttpGet(zzV4.."?cb="..TS(MFL(os.time()/30)))
end)
if type(body)~="string" or #body==0 then
return false,"could not download keys.json"
end
if #(SG(body,"%s",""))==0 then
return false,"keys.json empty - use the generator"
end
local ok,data=QQ(function()
return GGS("HttpService"):JSONDecode(body)
end)
if not ok or type(data)~="table" then
return false,"keys.json corrupt"
end
local list=data.keys
if type(list)~="table" then
list=data
end
local suppliedHash=zzV6(supplied)
for _,entry in IP(list) do
if type(entry)=="table" and type(entry.hash)=="string" then
local eh=SLW(entry.hash)
if eh==suppliedHash then
if entry.active==false then
return false,"key disabled"
end
if entry.paused==true then
return false,"key paused - contact support"
end
local hardExp=TN(entry.expires)
if not hardExp or hardExp<=0 then
return false,"key without expiry"
end
if os.time()>hardExp then
return false,"key expired"
end
local bound=entry.user
if type(bound)=="string" and #bound>0 and bound~=LocalPlayer.Name then
return false,"key is not for this account"
end
local exp=hardExp
local dur=TN(entry.duration)
if dur and dur>0 then
local hprefix=SSB(eh,1,12)
local actA=nil
if zzV1.actGet then
actA=TN(zzV1.actGet(hprefix))
end
local actB=nil
QQ(function()
local fn="GM_"..hprefix..".dat"
if isfile and readfile and ISF(fn) then
actB=TN(SGM(readfile(fn),"^%d+"))
end
end)
local act=actA or actB
if actA and actB and actB<actA then
act=actB
end
if not act then
act=os.time()
QQ(function()
if writefile then
WF("GM_"..hprefix..".dat",
TS(act).."|"..TS(zzV5(act,dur,hprefix)))
end
end)
if zzV1.actSave then
zzV1.actSave(hprefix,act)
end
QQ(function()
if #zzV7>0 and type(request)=="function" then
request({
Url=zzV7,
Method="POST",
Headers={["Content-Type"]="application/json"},
Body=GGS("HttpService"):JSONEncode({
content="Key "..hprefix.." ("..TS(bound)
..") activated <t:"..TS(act)..":R>",
}),
})
end
end)
end
local realExp=act+dur
if os.time()>realExp then
return false,"key expired"
end
exp=realExp
end
local left=exp - os.time()
if left>0 then
local ld=MFL(left/86400)
local lh=MFL((left%86400)/3600)
local lm=MFL((left%3600)/60)
zzV1.keyLeftStr=TS(ld).."d "
..SFM("%02d",lh).."h "
..SFM("%02d",lm).."m"
end
local gmRank=entry.rank
if type(gmRank)~="string" or #gmRank==0 then
local gmDays=(TN(entry.duration) or 0)/86400
if gmDays>=3600 then
gmRank="eclipse"
elseif gmDays>=25 then
gmRank="sapphire"
elseif gmDays>=5 then
gmRank="esmerald"
elseif gmDays>0 then
gmRank="wraith"
else
gmRank="eclipse"
end
else
gmRank=SLW(gmRank)
end
zzV1.keyRank=gmRank
if zzV1.setRankBadge then
QQ(zzV1.setRankBadge,gmRank)
end
zzV1.accessData={expires=exp,user=bound,key=supplied}
zzV1.accessToken=zzV5(exp,bound,supplied)
return true,"ok"
end
end
end
return false,"invalid key"
end
local sp=ISG()
sp.Name="GM_Splash"
sp.ResetOnSpawn=false
sp.IgnoreGuiInset=true
sp.DisplayOrder=2147483646
sp.Parent=GuiParent
SplashRef=sp
local dim=INF()
dim.Size=US(1,1)
dim.BackgroundColor3=CR(8,5,14)
dim.BackgroundTransparency=0.45
dim.BorderSizePixel=0
dim.Parent=sp
local blur=IN("BlurEffect")
blur.Name="GM_SplashBlur"
blur.Size=0
blur.Parent=splashLighting
TSC(
blur,
TWI(0.6,ES.Quad,ED.Out),
{Size=22}
):Play()
local box=INF()
box.AnchorPoint=VX(0.5,0.5)
box.Position=U2(0.5,0,0.5,0)
box.Size=UO(470,0)
box.BackgroundColor3=CR(16,10,26)
box.BackgroundTransparency=0.22
box.BorderSizePixel=0
box.Parent=sp
local boxCorner=IUC()
boxCorner.CornerRadius=UD(0,24)
boxCorner.Parent=box
local boxGrad=IUG()
boxGrad.Rotation=115
boxGrad.Color=CSN(CR(30,20,48),CR(12,8,20))
boxGrad.Parent=box
local boxStroke=IUS()
boxStroke.Color=CR(88,48,150)
boxStroke.Thickness=1.5
boxStroke.Transparency=0.35
boxStroke.Parent=box
TSC(
box,
TWI(0.5,ESB,ED.Out),
{Size=UO(470,300)}
):Play()
local title=ITL()
title.BackgroundTransparency=1
title.AnchorPoint=VX(0.5,0)
title.Position=U2(0.5,0,0,24)
title.Size=UO(430,40)
title.Font=EFZ
title.Text="GHOST METHOD"
title.TextSize=34
title.TextColor3=CR(198,150,255)
title.TextTransparency=1
title.Parent=box
local titleStroke=IUS()
titleStroke.Color=AC1
titleStroke.Thickness=1
titleStroke.Transparency=1
titleStroke.Parent=title
local credit=ITL()
credit.BackgroundTransparency=1
credit.AnchorPoint=VX(0.5,0)
credit.Position=U2(0.5,0,0,66)
credit.Size=UO(300,18)
credit.Font=EFM
credit.Text="by Minwo"
credit.TextSize=14
credit.TextColor3=CR(150,130,180)
credit.TextTransparency=1
credit.Parent=box
local statusDefs={"Verifying","Loading","Updating","Ready"}
local statusLabels={}
for i,name in IP(statusDefs) do
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.AnchorPoint=VX(0.5,0)
lbl.Position=U2(0.5,0,0,104+(i - 1)*32)
lbl.Size=UO(340,24)
lbl.Font=EFM
lbl.TextSize=15
lbl.TextColor3=CR(200,190,220)
lbl.Text=""
lbl.TextTransparency=1
lbl.Parent=box
statusLabels[i]=lbl
end
local splashDone=false
local splashFailed=false
local GREEN=CR(120,220,140)
local RED=CR(255,105,105)
TSP(function()
TSC(title,TWI(0.9,ES.Sine,ED.Out),{
TextTransparency=0.45,
}):Play()
TSC(titleStroke,TWI(0.9,ES.Sine,ED.Out),{
Transparency=0.45,
}):Play()
TW(0.4)
TSC(credit,TWI(0.5),{TextTransparency=0.35}):Play()
TW(0.25)
for i,name in IP(statusDefs) do
local lbl=statusLabels[i]
lbl.Text=name
TSC(lbl,TWI(0.25),{TextTransparency=0}):Play()
for dots=1,3 do
TW(0.18)
lbl.Text=name..SRP(".",dots)
end
if name=="Verifying" then
local okK,whyK=zzV2()
zzV1.keyChecked=okK
if not okK then
lbl.Text=name.."...  error: "..TS(whyK)
lbl.TextColor3=RED
splashFailed=true
splashDone=true
zzV1.keyFailed=true
local exitBtn=ITB()
exitBtn.Name="SplashExit"
exitBtn.AnchorPoint=VX(0.5,0)
exitBtn.Position=U2(0.5,0,0,236)
exitBtn.Size=UO(120,34)
exitBtn.BackgroundColor3=AC4
exitBtn.BackgroundTransparency=0.15
exitBtn.BorderSizePixel=0
exitBtn.Font=EFB
exitBtn.TextSize=15
exitBtn.TextColor3=AC2
exitBtn.Text=gmT("SALIR","EXIT")
exitBtn.ZIndex=3
exitBtn.AutoButtonColor=false
local exitCorner=IUC()
exitCorner.CornerRadius=UD(0,10)
exitCorner.Parent=exitBtn
exitBtn.Parent=box
CN(exitBtn.Activated, function()
QQ(function()
blur:Destroy()
end)
QQ(function()
sp:Destroy()
end)
end)
return
end
end
lbl.Text="*  "..name
lbl.TextColor3=GREEN
TW(0.12)
end
splashDone=true
if not splashFailed and zzV1.finalApply then
QQ(zzV1.finalApply)
end
end)
fadeSplash=function()
if sp.Parent==nil then
return
end
TSP(function()
local waited=0
while not splashDone and waited<6 do
TW(0.05)
waited+=0.05
end
if splashFailed then
return
end
QQ(function()
local dur=0.5
TSC(blur,TWI(dur),{Size=0}):Play()
TSC(dim,TWI(dur),{BackgroundTransparency=1}):Play()
TSC(box,TWI(dur),{BackgroundTransparency=1}):Play()
TSC(boxStroke,TWI(dur),{Transparency=1}):Play()
for _,d in IP(GD(box)) do
if d:IsA("TextLabel") then
TSC(d,TWI(dur),{TextTransparency=1}):Play()
elseif d:IsA("UIStroke") then
TSC(d,TWI(dur),{Transparency=1}):Play()
end
end
end)
TW(0.6)
QQ(function()
blur:Destroy()
end)
QQ(function()
sp:Destroy()
end)
end)
end
end
do
local gateClock=OCL()+60
while zzV1.keyChecked==nil and OCL()<gateClock do
TW(0.05)
end
if zzV1.keyChecked~=true then
return
end
end
local Palette={
Accent=AC1,
AccentBright=CR(198,150,255),
AccentDeep=AC4,
Chip=AC3,
KeyStroke=CR(120,80,190),
Panel=CR(16,10,26),
PanelStroke=CR(88,48,150),
TextDim=AC5,
TextBright=AC2,
}
local Scope={}
Scope.__index=Scope
function Scope.new(name)
local self=setmetatable({},Scope)
self.Name=name or "scope"
self.Connections={}
self.Instances={}
self.Cleanups={}
return self
end
function Scope:Bind(signal,fn)
local conn=CN(signal, fn)
TBI(self.Connections,conn)
return conn
end
function Scope:Track(instance)
TBI(self.Instances,instance)
return instance
end
function Scope:AddCleanup(fn)
TBI(self.Cleanups,fn)
return fn
end
function Scope:Count()
return #self.Connections+#self.Instances+#self.Cleanups
end
function Scope:IsClean()
for _,conn in IP(self.Connections) do
if typeof(conn)=="RBXScriptConnection" and conn.Connected then
return false
end
end
return true
end
function Scope:Wipe()
for _,conn in IP(self.Connections) do
QQ(function()
if typeof(conn)=="RBXScriptConnection" and conn.Connected then
conn:Disconnect()
end
end)
end
for _,inst in IP(self.Instances) do
QQ(function()
if inst and inst.Parent~=nil then
inst:Destroy()
end
end)
end
for _,fn in IP(self.Cleanups) do
QQ(fn)
end
self.Connections={}
self.Instances={}
self.Cleanups={}
end
local Modules={}
local function zr1(def)
def.Scope=Scope.new(def.Name)
def.enabled=false
def.lastTestOk=nil
def.lastTestReason=nil
local rawEnable=def.enable
if type(rawEnable)=="function" then
def.enable=function(...)
if not zzV1.accessOk() then
return
end
return rawEnable(...)
end
end
TBI(Modules,def)
return def
end
local Workspace=GGS("Workspace")
local RunService=GGS("RunService")
local toastGui,toastList=nil,nil
local function toastEnsure()
if toastGui and toastGui.Parent then
return
end
toastGui=ISG()
toastGui.Name="GM_Toasts"
toastGui.ResetOnSpawn=false
toastGui.IgnoreGuiInset=true
toastGui.DisplayOrder=1500
toastGui.Parent=GuiParent
zzV1.toasts=toastGui
toastList=INF()
toastList.AnchorPoint=VX(1,0)
toastList.Position=U2(1,-14,0,14)
toastList.Size=UO(290,0)
toastList.BackgroundTransparency=1
toastList.Parent=toastGui
local tLayout=IUL()
tLayout.Padding=UD(0,8)
tLayout.SortOrder=XR.LayoutOrder
tLayout.Parent=toastList
end
local function zNT(title,content,duration)
QQ(function()
toastEnsure()
local card=INF()
card.Name="Toast"
card.BackgroundColor3=CR(24,24,24)
card.BackgroundTransparency=0.5
card.BorderSizePixel=0
card.Size=UO(290,0)
card.AutomaticSize=XA.Y
card.Parent=toastList
local cardCorner=IUC()
cardCorner.CornerRadius=UD(0,12)
cardCorner.Parent=card
local cardPad=IUP()
cardPad.PaddingLeft=UD(0,12)
cardPad.PaddingRight=UD(0,12)
cardPad.PaddingTop=UD(0,10)
cardPad.PaddingBottom=UD(0,12)
cardPad.Parent=card
local cardLay=IUL()
cardLay.Padding=UD(0,2)
cardLay.SortOrder=XR.LayoutOrder
cardLay.Parent=card
local ttl=ITL()
ttl.BackgroundTransparency=1
ttl.Size=U2(1,0,0,16)
ttl.Font=EFM
ttl.TextSize=14
ttl.TextXAlignment=TXL
ttl.TextColor3=CR(245,245,245)
ttl.TextTransparency=0.5
ttl.TextTruncate=TT.AtEnd
ttl.Text=title
ttl.Parent=card
local body=ITL()
body.BackgroundTransparency=1
body.Size=U2(1,0,0,0)
body.AutomaticSize=XA.Y
body.Font=EFG
body.TextSize=12
body.TextXAlignment=TXL
body.TextYAlignment=TYT
body.TextWrapped=true
body.TextColor3=CR(185,185,185)
body.TextTransparency=0.5
body.Text=content
body.Parent=card
local pop=IN("UIScale")
pop.Scale=0.92
pop.Parent=card
TSC(pop,TWI(0.22,ESB,ED.Out),{Scale=1}):Play()
TSC(card,TWI(0.22),{BackgroundTransparency=0.06}):Play()
TSC(ttl,TWI(0.22),{TextTransparency=0}):Play()
TSC(body,TWI(0.22),{TextTransparency=0}):Play()
TDL(duration or 6,function()
if not card.Parent then
return
end
local dur=0.35
QQ(function()
TSC(card,TWI(dur),{BackgroundTransparency=1}):Play()
TSC(pop,TWI(dur),{Scale=0.94}):Play()
TSC(ttl,TWI(dur),{TextTransparency=1}):Play()
TSC(body,TWI(dur),{TextTransparency=1}):Play()
end)
TDL(dur+0.05,function()
QQ(function()
card:Destroy()
end)
end)
end)
end)
end
zzV1.toast=zNT
local runSelfTest
local unloadGhost
local onOverlayMoved=nil
local KeysAPI
if KeysAPI==nil then
KeysAPI=setmetatable({},{
__index=function()
return function() end
end,
})
end
markStep("keystrokes defined")
local MOVE={}
local Bhop
local BhopKeybindElement=nil
local function keyNameToEnum(value)
if typeof(value)=="EnumItem" then
return value
end
local ok,enumItem=QQ(function()
return Enum.KeyCode[TS(value)]
end)
if ok and enumItem then
return enumItem
end
return nil
end
local function bindMatches(input,gameProcessed)
local name=BhopKeybindElement and BhopKeybindElement.CurrentKeybind
if not name then
return false
end
if SGM(name,"^MouseButton%d$") then
if gameProcessed then
return false
end
local ok,mouseType=QQ(function()
return Enum.UserInputType[name]
end)
return ok and input.UserInputType==mouseType or false
end
return input.KeyCode==keyNameToEnum(name)
end
local keyHeld=false
local function initialPush()
local char=LocalPlayer.Character
local hum=char and FFC(char, "Humanoid")
if hum
and Bhop.enabled
and hum.FloorMaterial~=EM.Air
and hum:GetState()~=HST.Jumping
then
hum:ChangeState(HST.Jumping)
end
end
Bhop=zr1({
Name="Auto BHOP",
enable=function()
if Bhop.enabled then
return
end
Bhop.enabled=true
keyHeld=false
local function hookCharacter(character)
local humanoid=WFC(character, "Humanoid",10)
if not humanoid then
return
end
if not Bhop.enabled then
return
end
Bhop.Scope:Bind(humanoid.StateChanged,function(_,newState)
if newState~=HST.Landed then
return
end
if not Bhop.enabled or(not keyHeld and not MOVE.bhopVirtual) then
return
end
local delaySec=(MOVE.bhopDelayMs or 0)/1000
if delaySec<=0 then
humanoid:ChangeState(HST.Jumping)
humanoid.Jump=true
return
end
TDL(delaySec,function()
if not Bhop.enabled or(not keyHeld and not MOVE.bhopVirtual) then
return
end
if humanoid.Parent==nil then
return
end
if humanoid.FloorMaterial==EM.Air then
return
end
humanoid:ChangeState(HST.Jumping)
humanoid.Jump=true
end)
end)
end
local character=LocalPlayer.Character
if character then
TSP(hookCharacter,character)
end
Bhop.Scope:Bind(LocalPlayer.CharacterAdded,function(newCharacter)
TSP(hookCharacter,newCharacter)
end)
Bhop.Scope:Bind(UIS.InputBegan,function(input,gameProcessed)
if not bindMatches(input,gameProcessed) then
return
end
keyHeld=true
initialPush()
end)
Bhop.Scope:Bind(UIS.InputEnded,function(input)
if not bindMatches(input,false) then
return
end
keyHeld=false
end)
end,
zDS=function()
if not Bhop.enabled then
return
end
Bhop.enabled=false
keyHeld=false
Bhop.Scope:Wipe()
end,
verify=function()
if not Bhop.enabled then
return false,"enabled flag not set"
end
if Bhop.Scope:Count()<1 then
return false,"no character/respawn connections bound"
end
return true
end,
zVC=function()
if Bhop.enabled then
return false,"enabled flag still set after zDS()"
end
if not Bhop.Scope:IsClean() then
return false,"humanoid connections still live after zDS()"
end
return true
end,
})
markStep("bhop defined")
do
MOVE.bhopDelayMs=0
MOVE.setBhopDelay=function(ms)
MOVE.bhopDelayMs=ms
end
local VirtualInputManager=nil
local function ensureVIM()
if VirtualInputManager then
return true
end
local ok,vim=QQ(function()
return GGS("VirtualInputManager")
end)
if ok and vim then
VirtualInputManager=vim
return true
end
return false
end
local function vimKey(down,keyCode)
if not VirtualInputManager then
return false
end
return QQ(function()
VirtualInputManager:SendKeyEvent(down,keyCode,false,game)
end)
end
local A_KEY=XK.A
local D_KEY=XK.D
local Crunch
local crunchKeyHeld=false
local crunchHoldMs=50
local crunchGapMs=60
local CrunchKeybindElement={CurrentKeybind="LeftShift"}
local function crunchInputMatches(input,gameProcessed)
local name=CrunchKeybindElement and CrunchKeybindElement.CurrentKeybind
if not name then
return false
end
if SGM(name,"^MouseButton%d$") then
if gameProcessed then
return false
end
local ok,mouseType=QQ(function()
return Enum.UserInputType[name]
end)
return ok and input.UserInputType==mouseType or false
end
local ok2,enumItem=QQ(function()
return Enum.KeyCode[TS(name)]
end)
return ok2 and input.KeyCode==enumItem or false
end
Crunch=zr1({
Name="Crunch spam",
enable=function()
if Crunch.enabled then
return
end
if not ensureVIM() then
zNT("Ghost Method",gmT("Crunch spam: tu executor no soporta VirtualInputManager.","Crunch spam: your executor does not support VirtualInputManager."),6)
return
end
Crunch.enabled=true
crunchKeyHeld=false
Crunch.Scope:Bind(UIS.InputBegan,function(input,gameProcessed)
if UserInputService:GetFocusedTextBox()~=nil then
return
end
if crunchInputMatches(input,gameProcessed) then
crunchKeyHeld=true
end
end)
Crunch.Scope:Bind(UIS.InputEnded,function(input)
if crunchInputMatches(input,false) then
crunchKeyHeld=false
end
end)
TSP(function()
while Crunch.enabled do
if crunchKeyHeld or MOVE.crunchVirtual then
if not vimKey(true,XK.LeftControl) then
break
end
TW(crunchHoldMs/1000)
if not vimKey(false,XK.LeftControl) then
break
end
TW(crunchGapMs/1000)
else
TW(0.06)
end
end
vimKey(false,XK.LeftControl)
end)
end,
zDS=function()
if not Crunch.enabled then
return
end
Crunch.enabled=false
crunchKeyHeld=false
vimKey(false,XK.LeftControl)
Crunch.Scope:Wipe()
end,
verify=function()
if not Crunch.enabled then
return false,"enabled flag not set"
end
if Crunch.Scope:Count()<1 then
return false,"no input connections bound"
end
return true
end,
zVC=function()
if Crunch.enabled then
return false,"enabled flag still set after zDS()"
end
if not Crunch.Scope:IsClean() then
return false,"connections still live after zDS()"
end
return true
end,
})
MOVE.setCrunch=function(on)
if on then
Crunch.enable()
else
Crunch.zDS()
end
end
MOVE.setCrunchKeybind=function(element)
CrunchKeybindElement=element
end
MOVE.setCrunchSpeed=function(ms)
crunchHoldMs=ms
crunchGapMs=ms
end
local Straffer
if type(Straffer)~="table" or not Straffer.Scope then
Straffer={enabled=false,enable=function() end,zDS=function() end}
end
MOVE.setStraffer=function(on)
if on then
Straffer.enable()
else
Straffer.zDS()
end
end
MOVE.setStrafferInvert=function(on)
strafeInvert=on==true
end
MOVE.setStrafferDeadzone=function(px)
strafeDeadzone=px
end
MOVE.bhopVirtual=false
MOVE.crunchVirtual=false
MOVE.setBhopVirtual=function(on)
MOVE.bhopVirtual=on==true
if on and Bhop.enabled then
initialPush()
end
end
MOVE.setCrunchVirtual=function(on)
MOVE.crunchVirtual=on==true
end
if MOVE.zSf==nil then
MOVE.zSf=function() end
end
if MOVE.zLg==nil then
MOVE.zLg=function() end
MOVE.zLD=function() end
MOVE.zLK=function() end
end
end
local function getRig()
local ok,rig=QQ(function()
local rigs=FF(Workspace, "Rigs")
if not rigs then
return nil
end
return FF(rigs, LocalPlayer.Name)
end)
if ok then
return rig
end
return nil
end
local Headless
local headSnaps={}
local accSnaps={}
local headActive=false
local accsActive=false
local HeadlessReassertConn=nil
local HeadlessReassertClock=0
local function hidePart(part,store)
if store[part] then
return
end
store[part]={
Transparency=part.Transparency,
CastShadow=part.CastShadow,
}
part.Transparency=1
part.CastShadow=false
end
local function applyHeadless(rig)
local head=FF(rig, "Head")
if not head or not head:IsA("BasePart") then
return
end
hidePart(head,headSnaps)
for _,child in IP(GC(head)) do
if child:IsA("Decal") or child:IsA("Texture") then
if not headSnaps[child] then
headSnaps[child]={Transparency=child.Transparency}
end
child.Transparency=1
end
end
end
local function restoreHeadless()
for node,snap in PR(headSnaps) do
QQ(function()
node.Transparency=snap.Transparency
if snap.CastShadow~=nil then
node.CastShadow=snap.CastShadow
end
end)
end
headSnaps={}
end
local function applyClearAccs(rig)
local head=FF(rig, "Head")
if not head or not head:IsA("BasePart") then
return
end
for _,acc in IP(GC(rig)) do
if acc:IsA("Accessory") then
local handle=FF(acc, "Handle")
if handle and handle:IsA("BasePart") and not accSnaps[handle] then
local handleAtt=FFC(handle, "Attachment")
if handleAtt and FF(head, handleAtt.Name) then
accSnaps[handle]={Transparency=handle.Transparency}
handle.Transparency=1
end
end
end
end
end
local function restoreAccs()
for handle,snap in PR(accSnaps) do
QQ(function()
handle.Transparency=snap.Transparency
end)
end
accSnaps={}
end
local function startHeadlessReassert()
if HeadlessReassertConn then
return
end
HeadlessReassertClock=0
HeadlessReassertConn=Headless.Scope:Bind(RunService.Heartbeat,function()
HeadlessReassertClock=HeadlessReassertClock+1
if HeadlessReassertClock<30 then
return
end
HeadlessReassertClock=0
local rig=getRig()
if not rig then
return
end
QQ(function()
if headActive then
applyHeadless(rig)
end
if accsActive then
applyClearAccs(rig)
end
end)
end)
end
local function stopHeadlessReassert()
if HeadlessReassertConn then
QQ(function()
HeadlessReassertConn:Disconnect()
end)
HeadlessReassertConn=nil
end
end
Headless=zr1({
Name="Headless",
enable=function(opts)
local wantHead=true
local wantAccs=true
if type(opts)=="table" and not opts.hidden then
wantHead=opts.head==true
wantAccs=opts.accs==true
end
local rig=getRig()
if rig then
if wantHead then
QQ(applyHeadless,rig)
end
if wantAccs then
QQ(applyClearAccs,rig)
end
end
if wantHead then
headActive=true
end
if wantAccs then
accsActive=true
end
Headless.enabled=headActive or accsActive
startHeadlessReassert()
end,
zDS=function(opts)
local wantHead=true
local wantAccs=true
if type(opts)=="table" and not opts.hidden then
wantHead=opts.head==true
wantAccs=opts.accs==true
end
if wantHead then
headActive=false
QQ(restoreHeadless)
end
if wantAccs then
accsActive=false
QQ(restoreAccs)
end
Headless.enabled=headActive or accsActive
if not Headless.enabled then
stopHeadlessReassert()
end
end,
verify=function()
if headActive or accsActive then
if not HeadlessReassertConn then
return false,"re-assert loop not running while active"
end
end
if headActive and next(headSnaps)==nil then
local rig=getRig()
if rig and FF(rig, "Head") then
return false,"head snapshot missing while headless active"
end
end
return true
end,
zVC=function()
if headActive or accsActive then
return false,"feature flags still active after zDS()"
end
if next(headSnaps)~=nil or next(accSnaps)~=nil then
return false,"snapshots not restored after zDS()"
end
if HeadlessReassertConn then
return false,"re-assert loop still connected after zDS()"
end
return true
end,
})
markStep("headless defined")
local Korblox
local KORBLOX_LEG_CHOICE="Right"
local korbloxApplied=false
local rightMeshSnap=nil
local zRMI=nil
local rightMeshApplied=false
local leftPartSnap=nil
local leftApplied=false
local leftCreated={}
local KorbloxReassertConn=nil
local KorbloxReassertClock=0
local function destroyLeftCreated()
for _,inst in IP(leftCreated) do
QQ(function()
if inst and inst.Parent~=nil then
inst:Destroy()
end
end)
end
leftCreated={}
end
local function applyRightLeg(rig)
local rightLeg=FF(rig, "Right Leg")
if not rightLeg or not rightLeg:IsA("BasePart") then
return
end
for _,child in IP(GC(rig)) do
if child:IsA("CharacterMesh") and child.BodyPart==Enum.BodyPart.RightLeg then
if not rightMeshSnap then
rightMeshSnap={
MeshId=child.MeshId,
OverlayTextureId=child.OverlayTextureId,
BaseTextureId=child.BaseTextureId,
}
end
child:Destroy()
end
end
local mesh=IN("CharacterMesh")
mesh.BodyPart=Enum.BodyPart.RightLeg
mesh.MeshId=101851696
mesh.OverlayTextureId=101851254
mesh.BaseTextureId=0
mesh.Parent=rig
zRMI=mesh
rightMeshApplied=true
end
local function restoreRightLeg(rig)
if zRMI then
QQ(function()
if zRMI.Parent~=nil then
zRMI:Destroy()
end
end)
end
zRMI=nil
rightMeshApplied=false
if rightMeshSnap then
if rig then
QQ(function()
local original=IN("CharacterMesh")
original.BodyPart=Enum.BodyPart.RightLeg
original.MeshId=rightMeshSnap.MeshId
original.OverlayTextureId=rightMeshSnap.OverlayTextureId
original.BaseTextureId=rightMeshSnap.BaseTextureId
original.Parent=rig
end)
end
rightMeshSnap=nil
end
end
local function applyLeftLeg(rig)
local leftLeg=FF(rig, "Left Leg")
if not leftLeg or not leftLeg:IsA("BasePart") then
return
end
if leftPartSnap==nil then
leftPartSnap=leftLeg.Transparency
end
leftLeg.Transparency=1
local okLoaded,loaded=QQ(function()
return game:GetObjects("rbxassetid://139607673")
end)
if not okLoaded or type(loaded)~="table" or #loaded==0 then
warn("[GM] Korblox: could not load rbxassetid://139607673")
return
end
local upper,lower
for _,obj in IP(loaded) do
local pool={}
if obj:IsA("MeshPart") then
TBI(pool,obj)
end
for _,desc in IP(GD(obj)) do
if desc:IsA("MeshPart") then
TBI(pool,desc)
end
end
for _,node in IP(pool) do
if node.Name=="LeftUpperLeg" and not upper then
upper=node:Clone()
elseif node.Name=="LeftLowerLeg" and not lower then
lower=node:Clone()
end
end
end
if not upper or not lower then
warn("[GM] Korblox: LeftUpperLeg/LeftLowerLeg MeshParts not found in 139607673")
return
end
upper.Name="GM_KorbloxLeftUpperLeg"
lower.Name="GM_KorbloxLeftLowerLeg"
QQ(function()
upper.Anchored=false
upper.CanCollide=false
upper.Massless=true
lower.Anchored=false
lower.CanCollide=false
lower.Massless=true
end)
TBI(leftCreated,upper)
TBI(leftCreated,lower)
local upperKnee=FF(upper, "LeftKneeRigAttachment")
local lowerKnee=FF(lower, "LeftKneeRigAttachment")
local kneeWeld=IN("Weld")
kneeWeld.Name="GM_KorbloxKneeWeld"
kneeWeld.Part0=upper
kneeWeld.Part1=lower
if upperKnee and lowerKnee then
kneeWeld.C0=upperKnee.CFrame
kneeWeld.C1=lowerKnee.CFrame
else
kneeWeld.C0=CFN(0,-(upper.Size.Y/2),0)
kneeWeld.C1=CFN(0,(lower.Size.Y/2),0)
end
kneeWeld.Parent=upper
TBI(leftCreated,kneeWeld)
local hipWeld=IN("Weld")
hipWeld.Name="GM_KorbloxHipWeld"
hipWeld.Part0=leftLeg
hipWeld.Part1=upper
local hipAtt=FF(upper, "LeftHipRigAttachment")
if hipAtt then
hipWeld.C0=CFN(0,0.8,0)*hipAtt.CFrame:Inverse()
else
hipWeld.C0=CFN(0,0.8,0)
end
hipWeld.C1=CFN()
hipWeld.Parent=upper
TBI(leftCreated,hipWeld)
upper.Parent=rig
lower.Parent=rig
leftApplied=true
end
local function restoreLeftLeg(rig)
destroyLeftCreated()
leftApplied=false
if leftPartSnap~=nil then
local leftLeg=rig and FF(rig, "Left Leg")
if leftLeg then
QQ(function()
leftLeg.Transparency=leftPartSnap
end)
end
leftPartSnap=nil
end
end
local function applyKorblox(rig)
if KORBLOX_LEG_CHOICE=="Right" or KORBLOX_LEG_CHOICE=="Both" then
QQ(applyRightLeg,rig)
end
if KORBLOX_LEG_CHOICE=="Left" or KORBLOX_LEG_CHOICE=="Both" then
QQ(applyLeftLeg,rig)
end
end
local function restoreKorblox(rig)
QQ(function()
restoreRightLeg(rig)
end)
QQ(function()
restoreLeftLeg(rig)
end)
end
local function setKorbloxChoice(choice)
if choice~="Left" and choice~="Right" and choice~="Both" then
return
end
KORBLOX_LEG_CHOICE=choice
if korbloxApplied then
local rig=getRig()
restoreKorblox(rig)
if rig then
applyKorblox(rig)
end
end
end
local function optionToChoice(option)
local yL=option
if type(option)=="table" then
yL=option[1]
end
yL=TS(yL or "")
if SFD(yL,"Both",1,true) then
return "Both"
end
if SFD(yL,"Left",1,true) then
return "Left"
end
if SFD(yL,"Right",1,true) then
return "Right"
end
return nil
end
local function startKorbloxReassert()
if KorbloxReassertConn then
return
end
KorbloxReassertClock=0
KorbloxReassertConn=Korblox.Scope:Bind(RunService.Heartbeat,function()
KorbloxReassertClock=KorbloxReassertClock+1
if KorbloxReassertClock<30 then
return
end
KorbloxReassertClock=0
local rig=getRig()
if not rig then
return
end
if zRMI and zRMI.Parent==nil then
zRMI=nil
rightMeshApplied=false
rightMeshSnap=nil
leftApplied=false
leftPartSnap=nil
end
if not rightMeshApplied and(KORBLOX_LEG_CHOICE=="Right" or KORBLOX_LEG_CHOICE=="Both") then
QQ(applyRightLeg,rig)
end
if not leftApplied and(KORBLOX_LEG_CHOICE=="Left" or KORBLOX_LEG_CHOICE=="Both") then
QQ(applyLeftLeg,rig)
end
end)
end
local function stopKorbloxReassert()
if KorbloxReassertConn then
QQ(function()
KorbloxReassertConn:Disconnect()
end)
KorbloxReassertConn=nil
end
end
Korblox=zr1({
Name="Korblox",
enable=function()
if Korblox.enabled then
return
end
Korblox.enabled=true
korbloxApplied=true
local rig=getRig()
if rig then
applyKorblox(rig)
end
startKorbloxReassert()
end,
zDS=function()
korbloxApplied=false
Korblox.enabled=false
stopKorbloxReassert()
local rig=getRig()
restoreKorblox(rig)
end,
verify=function()
if not korbloxApplied or not Korblox.enabled then
return false,"enabled/applied flag not set"
end
if not KorbloxReassertConn then
return false,"re-assert loop not running"
end
return true
end,
zVC=function()
if korbloxApplied or Korblox.enabled then
return false,"enabled/applied flag still set after zDS()"
end
if KorbloxReassertConn then
return false,"re-assert loop still connected after zDS()"
end
if next(leftCreated)~=nil then
return false,"created leg instances still tracked after zDS()"
end
if zRMI~=nil then
return false,"our CharacterMesh still tracked after zDS()"
end
return true
end,
})
markStep("korblox defined")
local ReplicatedStorage=GGS("ReplicatedStorage")
local zeC={emotes={},ze1={},unusuals={},ze2={}}
zeC.uri=function(entry)
if type(entry)=="table" and entry.id then
if entry.ver then
return "http://www.roblox.com/asset/?id="..TS(entry.id)
.."&version="..TS(entry.ver)
end
return "rbxassetid://"..TS(entry.id)
end
return "rbxassetid://"..TS(entry)
end
local zGC
local zeF=false
local zeD=nil
local function zea(uri)
if type(uri)~="string" then
return nil
end
local id=SGM(uri,"%d+")
return id and TN(id) or nil
end
local function ze4(folder)
local anims=FF(folder, "Animations")
if anims then
local r6=FF(anims, "R6")
if r6 then
local a=FF(r6, "Animation")
if a and a:IsA("Animation") and a.AnimationId~="" then
return a
end
end
local r15=FF(anims, "R15")
if r15 then
local a=FF(r15, "Animation")
if a and a:IsA("Animation") and a.AnimationId~="" then
return a
end
end
end
for _,n in IP({
"AnimationClassic",
"AnimationR6",
"Animation",
"AnimationLEGACY",
"AnimationClassic_Walkable",
"Animation_Walkable",
}) do
local a=FF(folder, n)
if a and a:IsA("Animation") and a.AnimationId~="" then
return a
end
end
for _,c in IP(GC(folder)) do
if c:IsA("Animation") and c.AnimationId~="" then
return c
end
end
local best,bestScore=nil,-999
for _,d in IP(GD(folder)) do
if d:IsA("Animation") and d.AnimationId~="" then
local path=SLW(d:GetFullName())
local score=0
if SFD(path,"animationclassic",1,true) or SFD(path,".r6.",1,true) then
score=score+10
end
if d.Name=="Animation" then
score=score+5
end
if SFD(path,"intro",1,true) then
score=score - 100
end
if SFD(path,"walkable",1,true) then
score=score+1
end
if score>bestScore then
best,bestScore=d,score
end
end
end
return best
end
local function ze5()
if OCL() -(zeC.lastScan or 0)<20 then
return
end
zeC.lastScan=OCL()
local items=FF(ReplicatedStorage, "Items")
if not items then
return
end
local all=GD(items)
for _,d in IP(all) do
if SFD(LWR(d.Name),"emote",1,true) then
for _,f in IP(GC(d)) do
if not zeC.ze1[f.Name] then
local anim=ze4(f)
local id=anim and zea(anim.AnimationId)
if id then
local e={name=f.Name,id=id,y3=f}
TBI(zeC.emotes,e)
zeC.ze1[e.name]=e
end
end
local zrd={}
for _,ch in IP(GC(f)) do
local n1=SGM(ch.Name,"^Selection%.?(%d+)$")
if n1 then
zrd[n1]=ch
elseif SGM(LWR(ch.Name),"^selections?$") then
for _,num in IP(GC(ch)) do
local n2=SGM(num.Name,"^%d+$")
or SGM(num.Name,"^Selection%.?(%d+)$")
if n2 and not zrd[n2] then
zrd[n2]=num
end
end
end
end
local zp4=zeC.ze1[f.Name] and zeC.ze1[f.Name].id
for selNum,sel in PR(zrd) do
local zp5=f.Name.." ("..selNum..")"
if not zeC.ze1[zp5] then
local selAnim=ze4(sel)
local selId=selAnim and zea(selAnim.AnimationId)
if selId and selId~=zp4 then
local se={name=zp5,id=selId,y3=sel}
TBI(zeC.emotes,se)
zeC.ze1[zp5]=se
end
end
end
end
elseif LWR(d.Name):find("unusual") and #GC(d)>0 then
for _,tpl in IP(GC(d)) do
if not zeC.ze2[tpl.Name] then
local cc=FF(tpl, "CharacterClassic")
or FF(tpl, "Character")
or FF(tpl, "CharacterOLD")
if cc then
local u={name=tpl.Name,y3=tpl}
TBI(zeC.unusuals,u)
zeC.ze2[u.name]=u
end
end
end
end
end
for _,d in IP(all) do
if d.Name=="CharacterClassic" or d.Name=="Character" or d.Name=="CharacterOLD" then
local tpl=d.Parent
if tpl and not zeC.ze2[tpl.Name] then
for _,fx in IP(GD(d)) do
if fx:IsA("ParticleEmitter") or fx:IsA("Beam") or fx:IsA("Trail") then
local u={name=tpl.Name,y3=tpl}
TBI(zeC.unusuals,u)
zeC.ze2[u.name]=u
break
end
end
end
end
end
print("[GM] catalogs: "..#zeC.emotes.." emotes, "..#zeC.unusuals.." unusuals")
end
ze5()
do
local MANUAL_EMOTES={
}
for _,me in IP(MANUAL_EMOTES) do
if me.id and not zeC.ze1[me.name] then
local e={name=me.name,id=me.id,y3=nil,manual=true}
TBI(zeC.emotes,e)
zeC.ze1[e.name]=e
end
end
local EMOTE_RENAMES={
["ZombieStride (3)"]="ZombieStride 2024",
}
for oldName,newName in PR(EMOTE_RENAMES) do
local entry=zeC.ze1[oldName]
if entry then
zeC.ze1[oldName]=nil
entry.name=newName
zeC.ze1[newName]=entry
end
end
end
TDL(25,function()
QQ(ze5)
end)
TDL(70,function()
QQ(ze5)
end)
markStep("phase 3 catalogs")
local zr2
local swaps={}
local ze7={}
local ze3={}
local zr3={}
local zr4=nil
local zr9=nil
local function ze6(animInst)
local node=animInst
while node and node.Parent do
if SFD(LWR(node.Parent.Name),"emote",1,true) then
return node
end
node=node.Parent
end
return nil
end
local function ze8(folder,newUri)
local n=0
for _,d in IP(GD(folder)) do
if d:IsA("Animation") and d.AnimationId~="" and swaps[d]==nil then
swaps[d]=d.AnimationId
d.AnimationId=newUri
n=n+1
end
end
return n
end
local function ze9(folder)
for _,d in IP(GD(folder)) do
if d:IsA("Animation") and swaps[d]~=nil then
QQ(function()
d.AnimationId=swaps[d]
end)
swaps[d]=nil
end
end
end
local function zeG()
for inst,oldId in PR(swaps) do
QQ(function()
inst.AnimationId=oldId
end)
end
swaps={}
end
local function zeH()
for _,inst in IP(zr3) do
QQ(function()
inst:Destroy()
end)
end
zr3={}
zr4=nil
end
local function zeI(toEntry)
if not toEntry then
return
end
if not toEntry.y3 then
return
end
if zr4==toEntry.name and #zr3>0 then
return
end
zeH()
local rig=getRig()
if not rig then
return
end
local classic=FF(toEntry.y3, "CharacterClassic")
or FF(toEntry.y3, "Character")
if not classic then
for _,d in IP(GD(toEntry.y3)) do
if d.Name=="CharacterClassic" then
classic=d
break
end
end
if not classic then
for _,d in IP(GD(toEntry.y3)) do
if d.Name=="Character" then
classic=d
break
end
end
end
end
if not classic then
print("[GM] element: '"..toEntry.name.."' has no Character/CharacterClassic model")
zNT("Ghost Method","Element '"..toEntry.name.."': no character model in y3",6)
return
end
local em=FF(classic, "EmoteModel")
if not em then
for _,c in IP(GC(classic)) do
if c:IsA("Model") then
em=c
print("[GM] element: using model '"..c.Name.."' (no EmoteModel in y3)")
break
end
end
end
if not em then
print("[GM] element: '"..toEntry.name.."' has no prop model")
zNT("Ghost Method","Element '"..toEntry.name.."': no prop model in y3",6)
return
end
local part0Names={}
for _,d in IP(GD(em)) do
if(d:IsA("Motor6D") or d:IsA("Weld")) and d.Part0 then
part0Names[d.Name]=d.Part0.Name
end
end
local clone=em:Clone()
for _,d in IP(GD(clone)) do
if d:IsA("BasePart") then
d.Anchored=false
d.CanCollide=false
d.CanTouch=false
d.CanQuery=false
d.Massless=true
end
end
local puppet=LocalPlayer.Character
local puppetPrimary=puppet and puppet.PrimaryPart or nil
local joined=0
for _,d in IP(GC(clone)) do
if(d:IsA("Motor6D") or d:IsA("Weld")) and d.Part0 and d.Part0.Parent==classic then
if d.Part0.Name=="HumanoidRootPart" then
if puppetPrimary then
d.Part0=puppetPrimary
joined=joined+1
else
d:Destroy()
end
else
local host=FF(rig, d.Part0.Name)
if host and host:IsA("BasePart") then
d.Part0=host
joined=joined+1
else
d:Destroy()
end
end
end
end
if joined==0 then
print("[GM] element: no Motor6D joints found in prop - fallback (pivot + torso weld)")
QQ(function()
clone:PivotTo(rig:GetPivot())
end)
local biggest=nil
for _,d in IP(GD(clone)) do
if d:IsA("BasePart") and(not biggest or d.Size.Magnitude>biggest.Size.Magnitude) then
biggest=d
end
end
local torso=FF(rig, "Torso")
if biggest and torso then
local wc=IWC()
wc.Part0=torso
wc.Part1=biggest
wc.Parent=biggest
end
end
local anims={}
for _,d in IP(GD(clone)) do
if d:IsA("Animation") and d.AnimationId~="" then
TBI(anims,d)
end
end
if #anims>0 then
local ac=FFC(clone, "AnimationController")
if not ac then
ac=IN("AnimationController")
ac.Parent=clone
end
for _,a in IP(anims) do
QQ(function()
local t=ac:LoadAnimation(a)
t.Looped=true
t:Play()
end)
end
end
clone.Parent=rig
TBI(zr3,clone)
zr4=toEntry.name
print("[GM] element '"..toEntry.name.."' attached ("..joined.." joints)")
local fxCount=0
for _,part in IP(GC(classic)) do
if part:IsA("BasePart") then
local zTP=FF(rig, part.Name)
if zTP then
for _,child in IP(GC(part)) do
if child~=em and(child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart")) then
local hasEffect=false
for _,fx in IP(GD(child)) do
if fx:IsA("ParticleEmitter") or fx:IsA("Beam") or fx:IsA("Trail") then
hasEffect=true
break
end
end
if hasEffect then
local fxClone=child:Clone()
fxClone.Parent=zTP
if fxClone:IsA("BasePart") then
fxClone.CanCollide=false
fxClone.Massless=true
local w=IWC()
w.Part0=zTP
w.Part1=fxClone
w.Parent=fxClone
end
TBI(zr3,fxClone)
fxCount=fxCount+1
end
end
end
end
end
end
if fxCount>0 then
print("[GM] element effects: "..fxCount.." anchors cloned")
end
QQ(function()
local lines={OD("%H:%M:%S").." prop '"..toEntry.name.."' diagnostics:"}
TBI(lines,"  em = "..em:GetFullName())
for name,host in PR(part0Names) do
TBI(lines,"  part0Names['"..name.."'] = "..TS(host))
end
for _,d in IP(GD(em)) do
if d:IsA("Motor6D") or d:IsA("Weld") then
TBI(lines,SFM("  TPL  joint '%s' [%s] Part0=%s Part1=%s",
d.Name,d.ClassName,
d.Part0 and d.Part0.Name or "nil",
d.Part1 and d.Part1.Name or "nil"))
end
end
for _,d in IP(GD(clone)) do
if d:IsA("Motor6D") or d:IsA("Weld") then
TBI(lines,SFM("  CLONE joint '%s' [%s] Part0=%s Part1=%s",
d.Name,d.ClassName,
d.Part0 and d.Part0.Name or "nil",
d.Part1 and d.Part1.Name or "nil"))
end
end
TBI(lines,"  joined="..joined)
WF("GM_prop_joints.txt",TCN(lines,"\n"))
end)
end
local zeE=0
local function zr8(model)
for _,d in IP(GD(model)) do
if d:IsA("BasePart") then
d.Transparency=1
d.CastShadow=false
elseif d:IsA("ParticleEmitter") or d:IsA("Beam") or d:IsA("Trail") then
d.Enabled=false
elseif d:IsA("Decal") or d:IsA("Texture") then
d.Transparency=1
elseif d:IsA("Sound") then
d:Stop()
end
end
end
local function zr7(m)
local c=FF(m.from.y3, "CharacterClassic")
or FF(m.from.y3, "Character")
if not c then
for _,d in IP(GD(m.from.y3)) do
if d.Name=="CharacterClassic" or d.Name=="Character" then
c=d
break
end
end
end
if not c then
return nil
end
local em=FF(c, "EmoteModel")
if not em then
for _,ch in IP(GC(c)) do
if ch:IsA("Model") then
em=ch
break
end
end
end
return em and em.Name or nil
end
local function isOurProp(inst)
for _,p in IP(zr3) do
if p==inst then
return true
end
end
return false
end
local function zr5(m)
local rig=getRig()
if not rig then
return
end
local srcName=zr7(m)
if not srcName then
return
end
zeE=zeE+1
local token=zeE
for _,ch in IP(GC(rig)) do
if ch.Name==srcName and not isOurProp(ch) then
zr8(ch)
end
end
local conn
conn=CN(rig.ChildAdded, function(child)
if zeE~=token then
conn:Disconnect()
return
end
if child.Name==srcName and not isOurProp(child) then
zr8(child)
end
end)
TDL(3,function()
if conn then
QQ(function()
conn:Disconnect()
end)
end
end)
end
local function zr6(m)
local targetSound=nil
local targetLooped=nil
QQ(function()
local cfg=require(m.to.y3)
local info=cfg and cfg.EmoteInfo
if info then
local s=info.Sound
if type(s)=="number" then
targetSound=s
elseif type(s)=="table" and #s>0 then
targetSound=s[math.random(1,#s)]
end
local len=info.Length
targetLooped=not(type(len)=="number" and len>0)
end
end)
local dbg={}
local fixedSet={}
local fixedCount=0
local function collectSoundPos()
local res={}
local function addFrom(y4,yL)
QQ(function()
if y4 and y4.PrimaryPart then
local sp=FF(y4.PrimaryPart, "SoundPos")
if sp then
res[#res+1]=sp
dbg[#dbg+1]="soundPos "..yL..": "..sp:GetFullName()
end
end
end)
end
addFrom(LocalPlayer.Character,"puppet")
addFrom(getRig(),"rig")
return res
end
local function fixSound(snd)
QQ(function()
if targetSound then
snd:Stop()
snd.SoundId="rbxassetid://"..TS(targetSound)
if targetLooped~=nil then
snd.Looped=targetLooped
end
snd:Play()
dbg[#dbg+1]="FIXED -> id "..TS(targetSound)
else
snd.Volume=0
dbg[#dbg+1]="MUTED (target sin musica)"
end
end)
end
local function tryFixAll()
for _,sp in IP(collectSoundPos()) do
local snd=FF(sp, "EmoteSound")
if snd and snd:IsA("Sound") and not fixedSet[snd] then
fixedSet[snd]=true
local desired="rbxassetid://"..TS(targetSound)
if(targetSound and snd.SoundId==desired)
or(targetSound==nil and snd.Volume==0) then
dbg[#dbg+1]="SKIP (ya correcto)"
else
fixedCount=fixedCount+1
fixSound(snd)
end
end
end
end
dbg[#dbg+1]=OD("%H:%M:%S").." zr6 '"..m.to.name
.."' targetSound="..TS(targetSound)
.." targetLooped="..TS(targetLooped)
tryFixAll()
local myToken=zeE
local t0=tick()
while tick() - t0<3 and zeE==myToken do
tryFixAll()
TW(0.1)
end
dbg[#dbg+1]="fixed instances: "..fixedCount
..(zeE~=myToken and " (cancelado por un emote mas nuevo)" or "")
QQ(function()
WF("GM_sound_log.txt",TCN(dbg,"\n"))
end)
end
local function anyEmoteTrackPlaying()
local rig=getRig()
local hum=rig and FFC(rig, "Humanoid")
local an=hum and FFC(hum, "Animator")
if not an then
return false
end
for _,t in IP(an:GetPlayingAnimationTracks()) do
if t.Animation and ze6(t.Animation) then
return true
end
end
return false
end
local function hookEmoteAnimator()
local rig=getRig()
if not rig then
return
end
local hum=FFC(rig, "Humanoid")
local animator=hum and FFC(hum, "Animator")
if not animator then
return
end
if zr9 then
zr9:Disconnect()
end
zr9=CN(animator.AnimationPlayed, function(track)
if not zr2.enabled or #ze7==0 then
return
end
local anim=track.Animation
if not anim then
return
end
local folder=ze6(anim)
if not folder then
return
end
local m=ze3[folder.Name]
if not m then
return
end
local id=zea(anim.AnimationId)
if id==m.to.id then
zeE=zeE+1
local ok,err=QQ(zeI,m.to)
QQ(function()
WF("GM_prop_log.txt",OD("%H:%M:%S")
.." prop call for '"..m.to.name.."' ok="..TS(ok)
..(ok and "" or(" err="..TS(err)))
.." | zr3="..#zr3
.." | zr4="..TS(zr4))
end)
if not ok then
zNT("Ghost Method","Element error ("..m.to.name.."): "..TS(err),8)
end
QQ(zr5,m)
QQ(zr6,m)
end
end)
end
local function p3SetMapping(fromE,toE)
if not fromE or not toE or fromE.name==toE.name then
return false
end
if not fromE.y3 then
zNT("Ghost Method",gmT("Solo se puede reemplazar un emote del juego con uno externo.","You can only replace a game emote with an external one."),5)
return false
end
local existing=ze3[fromE.name]
if existing then
QQ(function()
ze9(fromE.y3)
end)
existing.to=toE
else
local m={from=fromE,to=toE}
TBI(ze7,m)
ze3[fromE.name]=m
end
if zr2.enabled then
QQ(function()
ze8(fromE.y3,zeC.uri(toE))
end)
end
if zGC then
zGC()
end
print("[GM] mapping: "..fromE.name.." -> "..toE.name)
return true
end
local function p3RemoveMapping(fromName)
local m=ze3[fromName]
if not m then
return false
end
QQ(function()
ze9(m.from.y3)
end)
ze3[fromName]=nil
for i,mm in IP(ze7) do
if mm==m then
table.remove(ze7,i)
break
end
end
if zr4==m.to.name then
zeH()
end
if zGC then
zGC()
end
print("[GM] mapping removed: "..fromName)
return true
end
local function p3RemoveAllMappings()
local names={}
for name in PR(ze3) do
TBI(names,name)
end
for _,name in IP(names) do
p3RemoveMapping(name)
end
end
zr2=zr1({
Name="Emote Replacer",
enable=function()
if zr2.enabled then
return
end
zr2.enabled=true
for _,m in IP(ze7) do
QQ(function()
ze8(m.from.y3,zeC.uri(m.to))
end)
end
hookEmoteAnimator()
zr2.Scope:Bind(RunService.Heartbeat,function()
if not zr9 or not zr9.Connected then
hookEmoteAnimator()
end
if #zr3>0 and not zeF and not anyEmoteTrackPlaying() then
zeH()
end
end)
end,
zDS=function()
if not zr2.enabled then
return
end
zr2.enabled=false
zeG()
zeH()
if zr9 then
zr9:Disconnect()
zr9=nil
end
zr2.Scope:Wipe()
end,
verify=function()
if #ze7==0 then
return true
end
if not zr2.enabled then
return false,"mappings exist but module disabled"
end
if next(swaps)==nil then
return false,"mappings exist but no y3 swaps applied"
end
return true
end,
zVC=function()
if next(swaps)~=nil then
return false,"y3 swaps not restored after zDS()"
end
if #zr3>0 then
return false,"element instances still alive after zDS()"
end
if zr9 then
return false,"emote hook still connected after zDS()"
end
return true
end,
})
local Unusuals
local zu1={}
local zu2=nil
local function zu4()
for _,inst in IP(zu1) do
QQ(function()
inst:Destroy()
end)
end
zu1={}
end
local function zu3(name)
local rig=getRig()
local u=zeC.ze2[name]
if not rig or not u then
return false
end
zu4()
local cc=FF(u.y3, "CharacterClassic")
or FF(u.y3, "Character")
or FF(u.y3, "CharacterOLD")
if not cc then
return false
end
local n=0
for _,part in IP(GC(cc)) do
if part:IsA("BasePart") then
local zTP=FF(rig, part.Name)
if zTP then
for _,child in IP(GC(part)) do
if child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart") then
local clone=child:Clone()
clone.Parent=zTP
if clone:IsA("BasePart") then
clone.CanCollide=false
clone.Massless=true
local w=IWC()
w.Part0=zTP
w.Part1=clone
w.Parent=clone
end
TBI(zu1,clone)
n=n+1
end
end
end
end
end
local zcn=zzV1.unusualColor
local hue=nil
if zcn=="Red" then hue=0
elseif zcn=="Orange" then hue=0.07
elseif zcn=="Gold" then hue=0.13
elseif zcn=="Green" then hue=0.33
elseif zcn=="Cyan" then hue=0.5
elseif zcn=="Blue" then hue=0.65
elseif zcn=="Purple" then hue=0.78
elseif zcn=="Pink" then hue=0.92
end		local dbg={"tint "..TS(zcn).." hue="..TS(hue)
.." anchors="..#zu1.." name="..TS(name)}
local zSt=0
local zCt=0
if hue then
local function shift(c)
local h,s,v=Color3.toHSV(c)
if s<0.05 then
return c
end
return Color3.fromHSV(hue,s,v)
end
for _,inst in IP(zu1) do
local ok,err=QQ(function()
local all={inst}
for _,d in IP(GD(inst)) do
all[#all+1]=d
end
for _,d in IP(all) do
if d:IsA("ParticleEmitter") or d:IsA("Beam") or d:IsA("Trail") then
local kps={}
for _,kp in IP(d.Color.Keypoints) do
kps[#kps+1]=ColorSequenceKeypoint.new(kp.Time,shift(kp.Value))
end
if #kps>=2 then
d.Color=CSN(kps)
zSt=zSt+1
elseif #kps==1 then
d.Color=CSN(kps[1].Value)
zSt=zSt+1
end
elseif d:IsA("PointLight") or d:IsA("SpotLight") or d:IsA("SurfaceLight")
or d:IsA("BasePart") or d:IsA("Decal") or d:IsA("Texture") then
d.Color=shift(d.Color)
zCt=zCt+1
end
end
end)
if not ok then
dbg[#dbg+1]="ERROR "..TS(inst.ClassName).." '"..TS(inst.Name)
.."': "..TS(err)
else
dbg[#dbg+1]="ok "..TS(inst.ClassName).." '"..TS(inst.Name).."'"
end
end
dbg[#dbg+1]="total: "..zSt.." secuencias, "..zCt.." colores"
else
dbg[#dbg+1]="sin tint (Original)"
end
QQ(function()
WF("GM_unusual_debug.txt",TCN(dbg,"\n"))
end)
zu2=name
print("[GM] unusual '"..name.."' applied: "..n.." anchors, tint="
..TS(zcn).." (seq "..zSt..", col "..zCt..")")
if zGC and n>0 then
zGC()
end
return n>0
end
Unusuals=zr1({
Name="Unusuals",
enable=function()
if Unusuals.enabled then
return
end
Unusuals.enabled=true
if zu2 then
zu3(zu2)
end
Unusuals.Scope:Bind(RunService.Heartbeat,function()
if zu2 and #zu1==0 then
zu3(zu2)
end
end)
end,
zDS=function()
if not Unusuals.enabled then
return
end
Unusuals.enabled=false
zu4()
Unusuals.Scope:Wipe()
end,
verify=function()
if not zu2 then
return true
end
if not Unusuals.enabled then
return false,"unusual selected but module disabled"
end
return true
end,
zVC=function()
if #zu1>0 then
return false,"unusual instances still alive after zDS()"
end
return true
end,
})
markStep("phase 3 defined")
local function p3DestroyGui(name)
local old=FF(GuiParent, name)
if old then
QQ(function()
old:Destroy()
end)
end
end
local TOUCH=UIS.TouchEnabled and not UIS.KeyboardEnabled
local zp3=TOUCH and 38 or 28
local P3_SEARCH_H=TOUCH and 36 or 28
local P3_CLOSE_D=TOUCH and 40 or 30
local function zp2(guiName,title,width,height)
p3DestroyGui(guiName)
local gui=ISG()
gui.Name=guiName
gui.ResetOnSpawn=false
gui.DisplayOrder=600
gui.Parent=GuiParent
local panel=INF()
panel.Name="Panel"
panel.AnchorPoint=VX(0.5,0.5)
panel.Position=U2(0.5,0,0.5,0)
panel.Size=UO(width,height)
panel.BackgroundColor3=Palette.Panel
panel.BackgroundTransparency=0.06
panel.BorderSizePixel=0
panel.Parent=gui
local corner=IUC()
corner.CornerRadius=UD(0,18)
corner.Parent=panel
local grad=IUG()
grad.Rotation=115
grad.Color=CSN(CR(30,20,48),CR(12,8,20))
grad.Parent=panel
local y8=IUS()
y8.Color=Palette.PanelStroke
y8.Thickness=1.5
y8.Transparency=0.15
y8.Parent=panel
local header=ITL()
header.BackgroundTransparency=1
header.Size=U2(1,-100,0,44)
header.Position=U2(0,22,0,8)
header.Font=EFB
header.Text=title
header.TextSize=22
header.TextXAlignment=TXL
header.TextColor3=Palette.AccentBright
header.Parent=panel
local divider=INF()
divider.Size=U2(1,-44,0,1)
divider.Position=U2(0,22,0,54)
divider.BackgroundColor3=Palette.PanelStroke
divider.BackgroundTransparency=0.55
divider.BorderSizePixel=0
divider.Parent=panel
local closeBtn=ITB()
closeBtn.Size=UO(P3_CLOSE_D,P3_CLOSE_D)
closeBtn.Position=U2(1,-(P3_CLOSE_D+10),0,TOUCH and 8 or 12)
closeBtn.BackgroundColor3=Palette.AccentDeep
closeBtn.BackgroundTransparency=0.25
closeBtn.Font=EFB
closeBtn.Text="X"
closeBtn.TextSize=TOUCH and 16 or 14
closeBtn.TextColor3=Palette.TextBright
local cCorner=IUC()
cCorner.CornerRadius=UD(1,0)
cCorner.Parent=closeBtn
closeBtn.Parent=panel
CN(closeBtn.Activated, function()
gui:Destroy()
end)
local uiScale=IN("UIScale")
local fitConn=nil
local function fit()
local cam=Workspace.CurrentCamera
if not cam then
return
end
local vp=cam.ViewportSize
local s=MN((vp.X - 24)/width,(vp.Y - 24)/height,1)
if s<0.42 then
s=0.42
end
uiScale.Scale=s
end
fit()
uiScale.Parent=panel
local cam=Workspace.CurrentCamera
if cam then
fitConn=GPS(cam, "ViewportSize"):Connect(fit)
end
CN(gui.Destroying, function()
if fitConn then
fitConn:Disconnect()
end
end)
return {gui=gui,panel=panel}
end
local function p3MakeSearch(parent,posX,posY,width)
local box=ITX()
box.Size=UO(width,P3_SEARCH_H)
box.Position=UO(posX,posY)
box.BackgroundColor3=Palette.AccentDeep
box.BackgroundTransparency=0.75
box.Font=EFG
box.PlaceholderText="Search..."
box.Text=""
box.TextSize=TOUCH and 14 or 13
box.TextColor3=Palette.TextBright
box.ClearTextOnFocus=false
local corner=IUC()
corner.CornerRadius=UD(0,10)
corner.Parent=box
local y8=IUS()
y8.Color=Palette.PanelStroke
y8.Transparency=0.5
y8.Parent=box
box.Parent=parent
return box
end
local function p3MakeList(parent,posX,posY,width,height,columns)
local y4=INF()
y4.Size=UO(width,height)
y4.Position=UO(posX,posY)
y4.BackgroundColor3=Palette.Chip
y4.BackgroundTransparency=0.35
y4.BorderSizePixel=0
local corner=IUC()
corner.CornerRadius=UD(0,12)
corner.Parent=y4
local y8=IUS()
y8.Color=Palette.PanelStroke
y8.Transparency=0.55
y8.Parent=y4
y4.Parent=parent
local y6=IN("ScrollingFrame")
y6.Size=U2(1,-12,1,-12)
y6.Position=UO(6,6)
y6.BackgroundTransparency=1
y6.BorderSizePixel=0
y6.ScrollBarThickness=TOUCH and 6 or 4
y6.ScrollBarImageColor3=Palette.Accent
y6.AutomaticCanvasSize=XA.Y
y6.CanvasSize=U2()
y6.Parent=y4
if columns==2 then
local grid=IN("UIGridLayout")
grid.CellSize=U2(0.5,-5,0,zp3)
grid.CellPadding=U2(0,10,0,8)
grid.SortOrder=XR.LayoutOrder
grid.Parent=y6
else
local list=IUL()
list.Padding=UD(0,6)
list.SortOrder=XR.LayoutOrder
list.Parent=y6
end
return y6
end
local function zp1(y6,text,y2,dimmed)
local btn=ITB()
btn.Size=U2(1,-6,0,zp3)
btn.BackgroundColor3=Palette.Chip
btn.BackgroundTransparency=dimmed and 0.7 or 0.2
btn.Font=EFG
btn.Text=text
btn.TextSize=TOUCH and 14 or 13
btn.TextXAlignment=TXL
btn.TextTruncate=TT.AtEnd
btn.TextColor3=dimmed and Palette.TextDim or Palette.TextBright
btn.AutoButtonColor=not dimmed
local pad=IUP()
pad.PaddingLeft=UD(0,10)
pad.Parent=btn
local corner=IUC()
corner.CornerRadius=UD(0,9)
corner.Parent=btn
local y8=IUS()
y8.Color=Palette.PanelStroke
y8.Transparency=0.6
y8.Parent=btn
btn.Parent=y6
if y2 then
CN(btn.Activated, y2)
end
return btn
end
local function p3MarkRow(row,on)
if not row then
return
end
QQ(function()
local y8=FFC(row, "UIStroke")
if y8 then
y8.Color=on and Palette.Accent or Palette.PanelStroke
y8.Thickness=on and 2 or 1
y8.Transparency=on and 0.05 or 0.6
end
row.BackgroundColor3=on and Palette.AccentDeep or Palette.Chip
row.AutoButtonColor=not on
end)
end
local function p3ClearRows(y6)
for _,c in IP(GC(y6)) do
if c:IsA("TextButton") then
c:Destroy()
end
end
end
local function p3MakeLabel(parent,posX,posY,width,text)
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Size=UO(width,18)
lbl.Position=UO(posX,posY)
lbl.Font=EFB
lbl.TextSize=TOUCH and 14 or 12
lbl.TextXAlignment=TXL
lbl.TextColor3=Palette.AccentBright
lbl.Text=text
lbl.Parent=parent
return lbl
end
local previewPickerGui=nil
local pvBox=nil
local zrb=nil
local pvWorld=nil
local pvCam=nil
local zrc=nil
local y5=nil
local zra=nil
local pvPropInsts={}
local pvFitToken=0
local function pvDestroyProp()
for _,inst in IP(pvPropInsts) do
QQ(function()
inst:Destroy()
end)
end
pvPropInsts={}
end
local function p4StopPreview()
if zeD then
QQ(function()
zeD:Stop(0)
end)
zeD=nil
end
pvDestroyProp()
zeF=false
if pvBox and pvBox.Parent then
pvBox.Visible=false
end
end
local function pvEnsureBox()
if pvBox and pvBox.Parent then
return true
end
if not previewPickerGui or previewPickerGui.Parent==nil then
return false
end
if zra then
QQ(function()
zra:Destroy()
end)
zra=nil
end
pvBox=INF()
pvBox.Name="PreviewBox"
pvBox.AnchorPoint=VX(0.5,0.5)
pvBox.Position=U2(0.5,0,0.5,-14)
pvBox.Size=UO(252,336)
pvBox.BackgroundColor3=Palette.Panel
pvBox.BackgroundTransparency=0.06
pvBox.BorderSizePixel=0
pvBox.ZIndex=50
pvBox.Visible=false
local pvCorner=IUC()
pvCorner.CornerRadius=UD(0,16)
pvCorner.Parent=pvBox
local pvGrad=IUG()
pvGrad.Rotation=115
pvGrad.Color=CSN(CR(30,20,48),CR(12,8,20))
pvGrad.Parent=pvBox
local pvStroke=IUS()
pvStroke.Color=Palette.PanelStroke
pvStroke.Thickness=1.5
pvStroke.Transparency=0.15
pvStroke.Parent=pvBox
pvBox.Parent=previewPickerGui
local pvTitle=ITL()
pvTitle.BackgroundTransparency=1
pvTitle.Position=UO(16,10)
pvTitle.Size=U2(1,-60,0,20)
pvTitle.Font=EFM
pvTitle.TextSize=15
pvTitle.TextXAlignment=TXL
pvTitle.TextColor3=Palette.AccentBright
pvTitle.Text="Preview"
pvTitle.ZIndex=51
pvTitle.Parent=pvBox
zrc=ITL()
zrc.BackgroundTransparency=1
zrc.Position=UO(16,30)
zrc.Size=U2(1,-60,0,14)
zrc.Font=EFM
zrc.TextSize=11
zrc.TextXAlignment=TXL
zrc.TextTruncate=TT.AtEnd
zrc.TextColor3=Palette.TextDim
zrc.Text=""
zrc.ZIndex=51
zrc.Parent=pvBox
local pvClose=ITB()
pvClose.AnchorPoint=VX(1,0)
pvClose.Position=U2(1,-8,0,8)
pvClose.Size=UO(22,22)
pvClose.BackgroundColor3=Palette.AccentDeep
pvClose.BackgroundTransparency=0.25
pvClose.Font=EFB
pvClose.Text="X"
pvClose.TextSize=12
pvClose.TextColor3=Palette.TextBright
pvClose.ZIndex=51
local pvcCorner=IUC()
pvcCorner.CornerRadius=UD(1,0)
pvcCorner.Parent=pvClose
pvClose.Parent=pvBox
CN(pvClose.Activated, function()
p4StopPreview()
end)
zrb=IN("ViewportFrame")
zrb.Name="Viewport"
zrb.Position=UO(16,50)
zrb.Size=U2(1,-32,1,-96)
zrb.BackgroundColor3=CR(10,7,16)
zrb.BackgroundTransparency=0.12
zrb.BorderSizePixel=0
zrb.Ambient=CR(120,100,160)
zrb.LightColor=CR(255,240,220)
zrb.LightDirection=Vector3.new(-1,-1,-1)
zrb.ZIndex=51
local vpvCorner=IUC()
vpvCorner.CornerRadius=UD(0,12)
vpvCorner.Parent=zrb
zrb.Parent=pvBox
y5=IIL()
y5.Name="Icon"
y5.Position=UO(16,50)
y5.Size=U2(1,-32,1,-96)
y5.BackgroundColor3=CR(10,7,16)
y5.BackgroundTransparency=0.12
y5.BorderSizePixel=0
y5.ScaleType=SCT.Fit
y5.Image=""
y5.Visible=false
y5.ZIndex=52
local pvImgCorner=IUC()
pvImgCorner.CornerRadius=UD(0,12)
pvImgCorner.Parent=y5
y5.Parent=pvBox
pvWorld=IN("WorldModel")
pvWorld.Name="World"
pvWorld.Parent=zrb
pvCam=IN("Camera")
pvCam.FieldOfView=30
pvCam.Parent=pvWorld
zrb.CurrentCamera=pvCam
local pvHint=ITL()
pvHint.BackgroundTransparency=1
pvHint.AnchorPoint=VX(0.5,1)
pvHint.Position=U2(0.5,0,1,-8)
pvHint.Size=U2(1,-20,0,12)
pvHint.Font=EFG
pvHint.TextSize=9
pvHint.TextColor3=Palette.TextDim
pvHint.TextTransparency=0.35
pvHint.Text="Usa Prev en otro item para cambiar al instante"
pvHint.ZIndex=51
pvHint.Parent=pvBox
return true
end
local function pvRootOf(model)
local hrp=FF(model, "HumanoidRootPart")
if hrp and hrp:IsA("BasePart") then
return hrp
end
local hum=FFC(model, "Humanoid")
if hum then
local rp=hum.RootPart
if rp then
return rp
end
end
local torso=FF(model, "Torso")
if torso and torso:IsA("BasePart") then
return torso
end
local biggest=nil
for _,d in IP(GD(model)) do
if d:IsA("BasePart") and(not biggest or d.Size.Magnitude>biggest.Size.Magnitude) then
biggest=d
end
end
return biggest
end
local function pvEnsureRig()
if zra and zra.Parent then
return zra
end
local y3=FF(ReplicatedStorage, "Assets")
and FF(ReplicatedStorage.Assets, "Items")
and FF(ReplicatedStorage.Assets.Items, "VisualRigClassic")
if not y3 or not y3:IsA("Model") then
return nil
end
local clone=y3:Clone()
clone.Name="GM_PreviewRig"
clone:PivotTo(CFN(0,3,0))
local root=pvRootOf(clone)
if root then
root.Anchored=true
end
local rig=getRig()
if rig then
for _,src in IP(GC(rig)) do
if src:IsA("BasePart") then
local dst=FF(clone, src.Name)
if dst and dst:IsA("BasePart") then
dst.Color=src.Color
end
end
end
local srcHead=FF(rig, "Head")
local dstHead=FF(clone, "Head")
if srcHead and srcHead:IsA("BasePart") and dstHead and dstHead:IsA("BasePart") then
if srcHead.Transparency>0.5 then
dstHead.Transparency=1
local face=FF(dstHead, "face")
if face then
face.Transparency=1
end
end
end
end
clone.Parent=pvWorld
zra=clone
return clone
end
local function pvAttachElement(entry)
if not entry or not entry.y3 then
return
end
local classic=FF(entry.y3, "CharacterClassic")
or FF(entry.y3, "Character")
if not classic then
for _,d in IP(GD(entry.y3)) do
if d.Name=="CharacterClassic" or d.Name=="Character" then
classic=d
break
end
end
end
if not classic or not zra then
return
end
local em=FF(classic, "EmoteModel")
if not em then
for _,ch in IP(GC(classic)) do
if ch:IsA("Model") then
em=ch
break
end
end
end
if not em then
return
end
local clone=em:Clone()
for _,d in IP(GD(clone)) do
if d:IsA("BasePart") then
d.Anchored=false
d.CanCollide=false
d.CanTouch=false
d.CanQuery=false
d.Massless=true
end
end
for _,d in IP(GC(clone)) do
if(d:IsA("Motor6D") or d:IsA("Weld")) and d.Part0 and d.Part0.Parent==classic then
if d.Part0.Name=="HumanoidRootPart" then
local root=pvRootOf(zra)
if root then
d.Part0=root
else
d:Destroy()
end
else
local host=FF(zra, d.Part0.Name)
if host and host:IsA("BasePart") then
d.Part0=host
else
d:Destroy()
end
end
end
end
clone.Parent=zra
TBI(pvPropInsts,clone)
for _,part in IP(GC(classic)) do
if part:IsA("BasePart") then
local zTP=FF(zra, part.Name)
if zTP then
for _,child in IP(GC(part)) do
if child~=em and(child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart")) then
local hasEffect=false
for _,fx in IP(GD(child)) do
if fx:IsA("ParticleEmitter") or fx:IsA("Beam") or fx:IsA("Trail") then
hasEffect=true
break
end
end
if hasEffect then
local fxClone=child:Clone()
fxClone.Parent=zTP
if fxClone:IsA("BasePart") then
fxClone.CanCollide=false
fxClone.Massless=true
local w=IWC()
w.Part0=zTP
w.Part1=fxClone
w.Parent=fxClone
end
TBI(pvPropInsts,fxClone)
end
end
end
end
end
end
end
local function pvFitCamera()
if not zra or not pvCam then
return
end
QQ(function()
local pivot=zra:GetPivot()
local size=zra:GetExtentsSize()
local maxDim=MX(size.X,size.Y,size.Z)
local k=1.15*MX(1,maxDim/5.2)
if k>3.3 then
k=3.3
end
pvCam.CFrame=CFN(0,0.34*k,0)
*CFN((pivot*CFN(4.25*k,1.7*k,-8.5*k)).p,pivot.p)
end)
end
local function pvSetMode(isIcon)
if pvBox and pvBox.Parent then
if isIcon then
zrb.Visible=false
pvBox.Size=UO(252,306)
if y5 then
y5.Position=UO(16,50)
y5.Size=UO(218,218)
y5.Visible=true
end
else
if y5 then
y5.Visible=false
end
zrb.Visible=true
pvBox.Size=UO(252,336)
end
end
end
local function p4PreviewEmote(entry)
if not entry then
return false
end
if pvBox and pvBox.Parent and pvBox.Visible
and zrc and zrc.Text==entry.name then
p4StopPreview()
return true
end
if not pvEnsureBox() then
zNT("Ghost Method","Preview: abre el picker primero.",5)
return false
end
local clone=pvEnsureRig()
if not clone then
zNT("Ghost Method","Preview: VisualRigClassic no encontrado.",5)
return false
end
local hum=FFC(clone, "Humanoid")
or FFC(clone, "AnimationController")
if not hum then
zNT("Ghost Method","Preview failed (rig sin animator).",5)
return false
end
if zeD then
QQ(function()
zeD:Stop(0)
end)
zeD=nil
end
pvDestroyProp()
local anim=IN("Animation")
anim.Name="GM_Preview"
anim.AnimationId=zeC.uri(entry)
local ok,track=QQ(function()
return hum:LoadAnimation(anim)
end)
if not ok or not track then
zNT("Ghost Method","Preview failed to load the animation.",5)
return false
end
zeF=true
zeD=track
track.Priority=Enum.AnimationPriority.Action
QQ(function()
track.Looped=true
end)
track:Play(0.1)
pvAttachElement(entry)
pvSetMode(false)
zrb.CurrentCamera=nil
zrb.CurrentCamera=pvCam
pvFitCamera()
pvFitToken=pvFitToken+1
local myFit=pvFitToken
for _,delay in IP({0.2,0.45,0.9,1.6}) do
TDL(delay,function()
if pvFitToken==myFit and pvBox and pvBox.Visible then
pvFitCamera()
end
end)
end
zrc.Text=entry.name
..(entry.id and("  ["..TS(entry.id)
..(entry.ver and(" v"..TS(entry.ver)) or "").."]") or "")
pvBox.Visible=true
QQ(function()
local lines={"GM preview debug @ "..OD("%Y-%m-%d %H:%M:%S")}
lines[#lines+1]="entry: "..TS(entry.name).." id="..TS(entry.id)
lines[#lines+1]="rig fuente: "..TS(getRig() and getRig():GetFullName() or "NIL")
lines[#lines+1]="clone: "..TS(zra and zra:GetFullName() or "NIL")
if zra then
local parts=0
local visibleParts=0
for _,d in IP(GD(zra)) do
if d:IsA("BasePart") then
parts=parts+1
if d.Transparency<1 then
visibleParts=visibleParts+1
end
end
end
lines[#lines+1]="clone parts: "..parts.." (visibles: "..visibleParts..")"
local croot=pvRootOf(zra)
lines[#lines+1]="clone root: "..TS(croot and croot.Name or "NIL")
.." pos="..TS(croot and croot.Position or "nil")
.." anchored="..TS(croot and croot.Anchored or "nil")
lines[#lines+1]="clone pivot: "..TS(zra:GetPivot().Position)
local hum=FFC(zra, "Humanoid")
lines[#lines+1]="clone humanoid: "..TS(hum and hum:GetFullName() or "NIL")
.." health="..TS(hum and hum.Health or "nil")
end
lines[#lines+1]="world: "..TS(pvWorld and pvWorld:GetFullName() or "NIL")
.." hijos="..TS(pvWorld and #GC(pvWorld) or 0)
lines[#lines+1]="viewport: "..TS(zrb and zrb:GetFullName() or "NIL")
.." cam="..TS(zrb and zrb.CurrentCamera~=nil)
lines[#lines+1]="camera pos: "..TS(pvCam and pvCam.CFrame.Position or "NIL")
.." fov="..TS(pvCam and pvCam.FieldOfView or "?")
lines[#lines+1]="box visible: "..TS(pvBox and pvBox.Visible)
lines[#lines+1]="prop insts: "..#pvPropInsts
WF("GM_preview_debug.txt",TCN(lines,"\n"))
end)
return true
end
local function zuA(entry)
if not entry then
return false
end
if pvBox and pvBox.Parent and pvBox.Visible
and zrc and zrc.Text==entry.name then
p4StopPreview()
return true
end
if not pvEnsureBox() then
zNT("Ghost Method","Preview: abre el picker primero.",5)
return false
end
local clone=pvEnsureRig()
if not clone then
zNT("Ghost Method","Preview: VisualRigClassic no encontrado.",5)
return false
end
if zeD then
QQ(function()
zeD:Stop(0)
end)
zeD=nil
end
pvDestroyProp()
local cc=FF(entry.y3, "CharacterClassic")
or FF(entry.y3, "Character")
or FF(entry.y3, "CharacterOLD")
local n=0
local nAttach,nMesh,nEmitter=0,0,0
if cc then
for _,part in IP(GC(cc)) do
if part:IsA("BasePart") then
local zTP=FF(clone, part.Name)
if zTP and zTP:IsA("BasePart") then
for _,child in IP(GC(part)) do
if child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart") then
local fxClone=child:Clone()
fxClone.Parent=zTP
if fxClone:IsA("BasePart") then
fxClone.CanCollide=false
fxClone.Massless=true
local tplWeld=nil
for _,sib in IP(GC(part)) do
if sib:IsA("Weld") and sib.Part1==child then
tplWeld=sib
break
end
end
if tplWeld then
QQ(function()
fxClone.CFrame=zTP.CFrame*tplWeld.C0*tplWeld.C1:Inverse()
end)
nMesh=nMesh+1
end
local w=IWC()
w.Part0=zTP
w.Part1=fxClone
w.Parent=fxClone
elseif fxClone:IsA("Attachment") then
nAttach=nAttach+1
for _,d in IP(GD(fxClone)) do
if d:IsA("ParticleEmitter") or d:IsA("Beam") or d:IsA("Trail") then
nEmitter=nEmitter+1
break
end
end
end
TBI(pvPropInsts,fxClone)
n=n+1
end
end
end
end
end
end
if n==0 then
zNT("Ghost Method","Ese unusual no tiene efectos visibles en el y3.",5)
end
zeF=true
local iconId=nil
if nMesh==0 and nEmitter>0 then
QQ(function()
local cfg=require(entry.y3)
local info=cfg and cfg.AppearanceInfo
if info then
iconId=TN(info.Icon)
end
end)
end
if y5 then
if iconId and iconId>0 then
y5.Image="rbxassetid://"..TS(iconId)
else
iconId=nil
end
end
if iconId then
pvSetMode(true)
else
pvSetMode(false)
end
QQ(function()
WF("GM_unusual_preview.txt",OD("%H:%M:%S").." '"..entry.name
.."': anchors="..nAttach
.." meshes="..nMesh
.." emitters="..nEmitter
.." total="..n
.." iconMode="..TS(iconId~=nil))
end)
zrb.CurrentCamera=nil
zrb.CurrentCamera=pvCam
pvFitCamera()
zrc.Text=entry.name
..(entry.id and("  ["..TS(entry.id)
..(entry.ver and(" v"..TS(entry.ver)) or "").."]") or "")
pvBox.Visible=true
return true
end
local function openEmoteReplacerPicker()
ze5()
local pk=zp2("GM_P3_EmoteReplacer","Ghost Method - Emotes",760,470)
previewPickerGui=pk.gui
CN(pk.gui.Destroying, function()
zeF=false
zeD=nil
pvBox=nil
zrb=nil
pvWorld=nil
pvCam=nil
zrc=nil
y5=nil
zra=nil
pvPropInsts={}
end)
p3MakeLabel(pk.panel,22,64,330,"Emote I want to replace")
p3MakeLabel(pk.panel,408,64,330,"Emote to replace with")
local searchL=p3MakeSearch(pk.panel,22,84,330)
local searchR=p3MakeSearch(pk.panel,408,84,330)
local listL=p3MakeList(pk.panel,22,124,330,254)
local listR=p3MakeList(pk.panel,408,124,330,254)
local activeLabel=p3MakeLabel(pk.panel,22,388,716,"")
p3MakeLabel(pk.panel,22,408,716,"Mappings stack - one per source emote. Elements (guitars etc.) follow automatically.")
local selFrom,selTo=nil,nil
local selFromRow,selToRow=nil,nil
local applyBtn=ITB()
applyBtn.Size=UO(92,TOUCH and 42 or 30)
applyBtn.Position=U2(0.5,-100,0,TOUCH and 80 or 84)
applyBtn.BackgroundColor3=Palette.Accent
applyBtn.Font=EFB
applyBtn.Text="Apply"
applyBtn.TextSize=13
applyBtn.TextColor3=Palette.TextBright
local aCorner=IUC()
aCorner.CornerRadius=UD(0,10)
aCorner.Parent=applyBtn
applyBtn.Parent=pk.panel
local zp6=ITB()
zp6.Size=UO(92,TOUCH and 42 or 30)
zp6.Position=U2(0.5,8,0,TOUCH and 80 or 84)
zp6.BackgroundColor3=CR(90,40,70)
zp6.Font=EFB
zp6.Text="Remove"
zp6.TextSize=13
zp6.TextColor3=Palette.TextBright
local rCorner=IUC()
rCorner.CornerRadius=UD(0,10)
rCorner.Parent=zp6
zp6.Parent=pk.panel
local previewBtn=ITB()
previewBtn.Size=UO(92,TOUCH and 42 or 30)
previewBtn.Position=U2(0.5,-46,0,8)
previewBtn.BackgroundColor3=Palette.AccentDeep
previewBtn.Font=EFB
previewBtn.Text="Preview"
previewBtn.TextSize=13
previewBtn.TextColor3=Palette.TextBright
local pvCorner=IUC()
pvCorner.CornerRadius=UD(0,10)
pvCorner.Parent=previewBtn
previewBtn.Parent=pk.panel
local function refreshActive()
local parts={}
for _,m in IP(ze7) do
TBI(parts,m.from.name.." -> "..m.to.name)
end
table.sort(parts)
activeLabel.Text=#parts==0 and "Active mappings: none" or("Active: "..TCN(parts,"  -  "))
end
local function refreshLeft()
p3ClearRows(listL)
local filter=SLW(searchL.Text or "")
local shown=0
for _,e in IP(zeC.emotes) do
if filter=="" or SFD(SLW(e.name),filter,1,true) then
shown=shown+1
if shown>250 then
break
end
local row=zp1(listL,e.name,function()
p3MarkRow(selFromRow,false)
selFrom=e
selFromRow=row
p3MarkRow(row,true)
end,false)
if ze3[e.name] then
row.TextColor3=Palette.Accent
end
end
end
if shown==0 then
zp1(listL,"No emotes match",nil,true)
end
end
local function refreshRight()
p3ClearRows(listR)
local filter=SLW(searchR.Text or "")
local shown=0
for _,e in IP(zeC.emotes) do
if filter=="" or SFD(SLW(e.name),filter,1,true) then
shown=shown+1
if shown>250 then
break
end
local row=zp1(listR,e.name,function()
p3MarkRow(selToRow,false)
selTo=e
selToRow=row
p3MarkRow(row,true)
end,false)
end
end
if shown==0 then
zp1(listR,"No emotes match",nil,true)
end
end
GPS(searchL, "Text"):Connect(refreshLeft)
GPS(searchR, "Text"):Connect(refreshRight)
CN(applyBtn.Activated, function()
if selFrom and selTo then
if p3SetMapping(selFrom,selTo) then
if not zr2.enabled then
zr2.enable()
end
refreshActive()
refreshLeft()
zNT("Ghost Method","Replaced \""..selFrom.name.."\" with \""..selTo.name.."\".",4)
end
else
zNT("Ghost Method","Select an emote on BOTH sides first.",4)
end
end)
CN(zp6.Activated, function()
if selFrom then
if p3RemoveMapping(selFrom.name) then
refreshActive()
refreshLeft()
else
zNT("Ghost Method","No mapping for "..selFrom.name..".",4)
end
else
zNT("Ghost Method","Select the SOURCE emote (left) to remove its mapping.",4)
end
end)
CN(previewBtn.Activated, function()
if selTo then
p4PreviewEmote(selTo)
else
zNT("Ghost Method","Selecciona un emote en el lado DERECHO para previsualizar.",5)
end
end)
refreshLeft()
refreshRight()
refreshActive()
end
local function zu8()
ze5()
local pk=zp2("GM_P3_Unusuals","Ghost Method - Unusuals",640,470)
previewPickerGui=pk.gui
CN(pk.gui.Destroying, function()
zeF=false
zeD=nil
pvBox=nil
zrb=nil
pvWorld=nil
pvCam=nil
zrc=nil
y5=nil
zra=nil
pvPropInsts={}
end)
local search=p3MakeSearch(pk.panel,22,64,460)
local zp6=ITB()
zp6.Size=UO(110,TOUCH and 36 or 28)
zp6.Position=U2(1,-132,0,64)
zp6.BackgroundColor3=CR(90,40,70)
zp6.Font=EFB
zp6.Text="Remove applied"
zp6.TextSize=11
zp6.TextColor3=Palette.TextBright
local rCorner=IUC()
rCorner.CornerRadius=UD(0,10)
rCorner.Parent=zp6
zp6.Parent=pk.panel
local list=p3MakeList(pk.panel,22,108,596,326,2)
local function refresh()
local zu9=nil
p3ClearRows(list)
local filter=SLW(search.Text or "")
local shown=0
for _,u in IP(zeC.unusuals) do
if filter=="" or SFD(SLW(u.name),filter,1,true) then
shown=shown+1
local row=zp1(list,u.name,function()
if not Unusuals.enabled then
Unusuals.enable()
end
zu3(u.name)
p3MarkRow(zu9,false)
zu9=row
p3MarkRow(row,true)
end,false)
local pvBtn=ITB()
pvBtn.Name="PvBtn"
pvBtn.AnchorPoint=VX(1,0.5)
pvBtn.Position=U2(1,-8,0.5,0)
pvBtn.Size=UO(TOUCH and 56 or 48,zp3 - 8)
pvBtn.BackgroundColor3=Palette.AccentDeep
pvBtn.BackgroundTransparency=0.35
pvBtn.Font=EFB
pvBtn.TextSize=TOUCH and 12 or 11
pvBtn.TextColor3=Palette.TextBright
pvBtn.Text="Prev"
pvBtn.ZIndex=2
pvBtn.AutoButtonColor=true
local pvC=IUC()
pvC.CornerRadius=UD(0,7)
pvC.Parent=pvBtn
pvBtn.Parent=row
CN(pvBtn.Activated, function()
zuA(u)
end)
end
end
if shown==0 then
zp1(list,"No unusuals match",nil,true)
end
end
GPS(search, "Text"):Connect(refresh)
CN(zp6.Activated, function()
zu4()
zu2=nil
Unusuals.zDS()
if zGC then
zGC()
end
zNT("Ghost Method","Unusual removed.",4)
end)
refresh()
end
local Lighting=GGS("Lighting")
local Graphics
local zGS={}
local gfxPreset="Realista"
local gfxClock=0
local gfxLightShadows={}
local GFX_PRESETS={
Realista={
quality=21,softness=0.1,exposure=0.1,
clockTime=14,
atmoDensity=0.3,atmoHaze=0.8,atmoGlare=0.25,
atmoApply=true,
dofFar=0.06,dofNear=0,dofRadius=20,dofFocus=120,
ccBrightness=0.03,ccContrast=0.09,ccSaturation=1.15,
ccTint=CR(255,248,242),
bloomIntensity=0.5,bloomSize=34,bloomThreshold=0.82,
sparkleIntensity=0.25,sparkleSize=12,sparkleThreshold=0.92,
sunRaysIntensity=0.12,sunRaysSpread=0.7,
ambient=CR(45,47,56),
outdoorAmbient=CR(88,88,96),
shadowColor=CR(58,58,72),
envDiffuse=0.85,
},
Cinematic={
quality=21,softness=0.15,exposure=0.2,
clockTime=17.1,
atmoDensity=0.32,atmoHaze=1.2,atmoGlare=0.45,
atmoApply=true,
dofFar=0.14,dofNear=0,dofRadius=30,dofFocus=45,
ccBrightness=0.04,ccContrast=0.1,ccSaturation=1.18,
ccTint=CR(255,240,220),
bloomIntensity=0.55,bloomSize=36,bloomThreshold=0.82,
sunRaysIntensity=0.3,sunRaysSpread=0.8,
ambient=CR(56,47,36),
outdoorAmbient=CR(104,91,70),
shadowColor=CR(64,60,84),
envDiffuse=0.8,
},
Balanced={
quality=15,softness=0.25,exposure=0.08,
clockTime=14,
atmoApply=false,
dofApply=false,
ccBrightness=0.02,ccContrast=0.05,ccSaturation=1.08,
ccTint=CR(255,252,248),
bloomIntensity=0.3,bloomSize=24,bloomThreshold=0.88,
sunRaysIntensity=0.08,sunRaysSpread=0.6,
ambient=CR(45,47,56),
outdoorAmbient=CR(88,88,96),
shadowColor=CR(58,58,72),
envDiffuse=0.9,
},
}
local REAL_SKY={
SkyboxBk="rbxassetid://92464172",
SkyboxDn="rbxassetid://92464250",
SkyboxFt="rbxassetid://92464217",
SkyboxLf="rbxassetid://92464234",
SkyboxRt="rbxassetid://92464189",
SkyboxUp="rbxassetid://92464157",
}
local skySwapOn=false
local skySnap=nil
local skyReassertConn=nil
local function p4GetSky()
return FFC(Lighting, "Sky")
end
local function p4SetSky(on)
if on then
local sky=p4GetSky()
if not sky then
sky=IN("Sky")
sky.Name="GM_SkyHD"
sky.Parent=Lighting
sky.SunAngularSize=21
sky.MoonAngularSize=14
sky.StarCount=5000
end
if not skySnap then
skySnap={}
for k in PR(REAL_SKY) do
skySnap[k]=sky[k]
end
end
for k,v in PR(REAL_SKY) do
QQ(function()
sky[k]=v
end)
end
skySwapOn=true
if not skyReassertConn then
local acc=0
skyReassertConn=CN(RunService.Heartbeat, function(dt)
acc+=dt
if acc<3 then
return
end
acc=0
if skySwapOn then
local s=p4GetSky()
if s then
for k,v in PR(REAL_SKY) do
QQ(function()
s[k]=v
end)
end
end
end
end)
end
else
skySwapOn=false
if skyReassertConn then
skyReassertConn:Disconnect()
skyReassertConn=nil
end
local s=p4GetSky()
if s then
QQ(function()
s:Destroy()
end)
end
skySnap=nil
end
end
local function gfxApplyLightShadows()
for _,d in IP(GD(Workspace)) do
if d:IsA("PointLight") or d:IsA("SpotLight") or d:IsA("SurfaceLight") then
if gfxLightShadows[d]==nil then
gfxLightShadows[d]=d.Shadows
end
QQ(function()
d.Shadows=true
end)
end
end
end
local function gfxRestoreLightShadows()
for light,was in PR(gfxLightShadows) do
QQ(function()
if light.Parent then
light.Shadows=was
end
end)
end
table.clear(gfxLightShadows)
end
local gfxShinySnap={}
local gfxShinyLevel=0.15
local gfxBloomLevel=0.7
local SMOOTH_MATERIALS={
[EM.SmoothPlastic]=true,
[EM.Plastic]=true,
[EM.Metal]=true,
[EM.Marble]=true,
[EM.Granite]=true,
[EM.Slate]=true,
[EM.Concrete]=true,
[EM.Pavement]=true,
[EM.Asphalt]=true,
[EM.DiamondPlate]=true,
[EM.Glass]=true,
[EM.Ice]=true,
}
local DLSSX={}
DLSSX.doF=nil
DLSSX.atmoCreated=false
DLSSX.sunRaysCreated=false
DLSSX.sparkle=nil
DLSSX.shadowDark=0
DLSSX.shadowApply=function(p)
local dark=DLSSX.shadowDark or 0
local f=1 - dark*0.85
local envF=1 - dark*0.75
QQ(function()
Lighting.Ambient=p.ambient*f
Lighting.OutdoorAmbient=p.outdoorAmbient*f
Lighting.ShadowColor=p.shadowColor*f
Lighting.EnvironmentDiffuseScale=(p.envDiffuse or 1)*envF
end)
end
DLSSX.MAT_SHINE={
[EM.Metal]=1.5,
[EM.DiamondPlate]=1.2,
[EM.Glass]=1.8,
[EM.Ice]=1.5,
[EM.SmoothPlastic]=0.5,
[EM.Plastic]=0.35,
[EM.Marble]=0.4,
[EM.Granite]=0.3,
[EM.Slate]=0.3,
[EM.Concrete]=0.15,
[EM.Pavement]=0.15,
[EM.Asphalt]=0.1,
}
local function gfxApplyShiny()
if gfxShinyLevel<=0 then
return
end
local rigs=FF(Workspace, "Rigs")
local playersF=FF(Workspace, "Players")
local scanned=0
local smoothMatches=0
local changed=0
local matCount={}
for _,p in IP(GD(Workspace)) do
if p:IsA("BasePart") and p.Transparency<0.5 then
scanned+=1
local mk=TS(p.Material)
matCount[mk]=(matCount[mk] or 0)+1
if SMOOTH_MATERIALS[p.Material] then
if not(rigs and p:IsDescendantOf(rigs)) and not(playersF and p:IsDescendantOf(playersF)) then
smoothMatches+=1
if gfxShinySnap[p]==nil then
gfxShinySnap[p]=p.Reflectance
end
local shine=DLSSX.MAT_SHINE[p.Material] or 1
local target=MN(1,MX(gfxShinySnap[p] or 0,gfxShinyLevel*shine))
if p.Reflectance~=target then
QQ(function()
p.Reflectance=target
end)
changed+=1
end
end
end
end
end
QQ(function()
local mats={}
for mk,count in PR(matCount) do
TBI(mats,{mk,count})
end
table.sort(mats,function(a,b)
return a[2]>b[2]
end)
local lines={
OD("%H:%M:%S").." shiny sweep @ level "..gfxShinyLevel,
"  opaque BaseParts scanned: "..scanned,
"  smooth-material parts matched: "..smoothMatches,
"  parts set to new reflectance: "..changed,
"  TOP MAP MATERIALS:",
}
for i=1,MN(15,#mats) do
TBI(lines,"    "..mats[i][1].." x"..mats[i][2])
end
WF("GM_shiny_dump.txt",TCN(lines,"\n"))
end)
end
local function gfxRestoreShiny()
for part,was in PR(gfxShinySnap) do
QQ(function()
if part.Parent then
part.Reflectance=was
end
end)
end
table.clear(gfxShinySnap)
end
local function p4GfxSafe(yL,fn)
local ok,err=QQ(fn)
if not ok then
print("[GM] GFX ERROR "..yL..": "..TS(err))
zNT("Ghost Method","GFX error ("..yL.."): "..TS(err),9)
QQ(function()
WF("GM_gfx_error.txt",OD("%H:%M:%S").." "..yL..": "..TS(err))
end)
end
return ok
end
local function p4SetShiny(v)
gfxShinyLevel=v/100
if v>0 then
if not Graphics.enabled then
p4GfxSafe("ShinyInit (enabling Shader Pack)",function()
Graphics.enable()
end)
end
p4GfxSafe("ShinyApply",gfxApplyShiny)
else
p4GfxSafe("ShinyRestore",gfxRestoreShiny)
end
end
local gmBloom=nil
local function p4SetBloom(v)
local level=v/100
if level<=0 then
if gmBloom then
gmBloom:Destroy()
gmBloom=nil
end
return
end
if not gmBloom or gmBloom.Parent==nil then
gmBloom=IN("BloomEffect")
gmBloom.Name="GM_Bloom"
gmBloom.Parent=Lighting
end
QQ(function()
local t=math.clamp(level,0,2)
gmBloom.Intensity=t*t*0.75
gmBloom.Size=44
gmBloom.Threshold=0.85
end)
end
local function p4ShinyTest()
p4GfxSafe("ShinyTest",function()
local old=gfxShinyLevel
gfxRestoreShiny()
gfxShinyLevel=0.5
gfxApplyShiny()
zNT("Ghost Method","Reflejos al 50% por 5 segundos - MIRA EL SUELO",5)
TDL(5,function()
gfxRestoreShiny()
gfxShinyLevel=old
if old>0 then
gfxApplyShiny()
end
zNT("Ghost Method","Test terminado - reflejos restaurados",4)
end)
end)
end
function DLSSX.applyAtmo(p)
if not p.atmoApply then
return
end
local atmo=FFC(Lighting, "Atmosphere")
if not atmo then
atmo=IN("Atmosphere")
atmo.Name="GM_Atmosphere"
atmo.Parent=Lighting
DLSSX.atmoCreated=true
end
QQ(function()
atmo.Density=p.atmoDensity or 0.3
atmo.Offset=0.25
atmo.Color=CR(199,199,205)
atmo.Decay=CR(106,112,125)
atmo.Glare=p.atmoGlare or 0.25
atmo.Haze=p.atmoHaze or 0.8
end)
end
function DLSSX.applyDoF(p)
if p.dofApply==false or(p.dofFar or 0)<=0 then
if DLSSX.doF then
QQ(function()
DLSSX.doF:Destroy()
end)
DLSSX.doF=nil
end
return
end
if not DLSSX.doF or DLSSX.doF.Parent==nil then
DLSSX.doF=IN("DepthOfFieldEffect")
DLSSX.doF.Name="GM_DoF"
DLSSX.doF.Parent=Lighting
end
QQ(function()
DLSSX.doF.FarIntensity=p.dofFar
DLSSX.doF.NearIntensity=p.dofNear or 0
DLSSX.doF.FocusDistance=p.dofFocus or 120
DLSSX.doF.InFocusRadius=p.dofRadius or 20
end)
end
function DLSSX.applySunRays(p)
local sunRays=FFC(Lighting, "SunRaysEffect")
if not sunRays then
sunRays=IN("SunRaysEffect")
sunRays.Name="GM_SunRays"
sunRays.Parent=Lighting
DLSSX.sunRaysCreated=true
end
QQ(function()
sunRays.Intensity=p.sunRaysIntensity or 0.12
sunRays.Spread=p.sunRaysSpread or 0.7
end)
end
function DLSSX.applyCC(p)
local cc=FF(Lighting, "GM_ColorGrade")
if not cc then
cc=IN("ColorCorrectionEffect")
cc.Name="GM_ColorGrade"
cc.Parent=Lighting
end
QQ(function()
local dark=DLSSX.shadowDark or 0
cc.Brightness=(p.ccBrightness or 0.02) - dark*0.35
cc.Contrast=(p.ccContrast or 0.06)+dark*0.25
cc.Saturation=(p.ccSaturation or 1.12) - 1 - dark*0.1
cc.TintColor=p.ccTint or CR(255,250,245)
end)
end
local function gfxApply()
local p=GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista
QQ(function()
local render=settings().Rendering
render.QualityLevel=p.quality
end)
QQ(function()
Lighting.Technology=Enum.Technology.Future
end)
QQ(function()
Lighting.GlobalShadows=true
end)
QQ(function()
Lighting.Brightness=3
DLSSX.shadowApply(p)
Lighting.EnvironmentSpecularScale=1
Lighting.ShadowSoftness=p.softness
Lighting.ExposureCompensation=p.exposure
end)
local twModule=nil
for _,m in IP(Modules) do
if m.Name=="Time/Weather" then
twModule=m
end
end
if not(twModule and twModule.enabled) then
QQ(function()
Lighting.ClockTime=p.clockTime
end)
end
DLSSX.applyAtmo(p)
DLSSX.applyDoF(p)
DLSSX.applySunRays(p)
DLSSX.applyCC(p)
local terrain=FFC(Workspace, "Terrain")
if terrain then
QQ(function()
terrain.WaterReflectance=1
terrain.WaterRefraction=1
terrain.WaterWaveSize=2
terrain.WaterWaveSpeed=12
terrain.Decoration=true
end)
end
local sky=p4GetSky()
if sky then
QQ(function()
sky.SunAngularSize=21
sky.MoonAngularSize=14
sky.StarCount=5000
end)
end
gfxApplyLightShadows()
p4SetBloom(MFL((p.bloomIntensity or 0.4)*100/0.75))
if p.sparkleIntensity and p.sparkleIntensity>0 then
if not DLSSX.sparkle or DLSSX.sparkle.Parent==nil then
DLSSX.sparkle=IN("BloomEffect")
DLSSX.sparkle.Name="GM_Sparkle"
DLSSX.sparkle.Parent=Lighting
end
QQ(function()
DLSSX.sparkle.Intensity=p.sparkleIntensity
DLSSX.sparkle.Size=p.sparkleSize or 12
DLSSX.sparkle.Threshold=p.sparkleThreshold or 0.92
end)
elseif DLSSX.sparkle then
QQ(function()
DLSSX.sparkle:Destroy()
end)
DLSSX.sparkle=nil
end
end
local function p4SetGfxPreset(name)
if GFX_PRESETS[name] then
gfxPreset=name
if Graphics.enabled then
gfxApply()
end
end
end
DLSSX.applyShadowDark=function()
if not Graphics.enabled then
return
end
local p=GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista
DLSSX.shadowApply(p)
DLSSX.applyCC(p)
end
Graphics=zr1({
Name="DLSS",
enable=function()
if Graphics.enabled then
return
end
Graphics.enabled=true
if next(zGS)==nil then
QQ(function()
zGS.QualityLevel=settings().Rendering.QualityLevel
zGS.Technology=Lighting.Technology
zGS.GlobalShadows=Lighting.GlobalShadows
zGS.ShadowSoftness=Lighting.ShadowSoftness
zGS.ExposureCompensation=Lighting.ExposureCompensation
zGS.Brightness=Lighting.Brightness
zGS.Ambient=Lighting.Ambient
zGS.OutdoorAmbient=Lighting.OutdoorAmbient
zGS.ShadowColor=Lighting.ShadowColor
zGS.ClockTime=Lighting.ClockTime
zGS.EnvironmentDiffuseScale=Lighting.EnvironmentDiffuseScale
zGS.EnvironmentSpecularScale=Lighting.EnvironmentSpecularScale
local atmoSnap=FFC(Lighting, "Atmosphere")
if atmoSnap then
zGS.AtmoDensity=atmoSnap.Density
zGS.AtmoOffset=atmoSnap.Offset
zGS.AtmoColor=atmoSnap.Color
zGS.AtmoDecay=atmoSnap.Decay
zGS.AtmoGlare=atmoSnap.Glare
zGS.AtmoHaze=atmoSnap.Haze
end
local terrain=FFC(Workspace, "Terrain")
if terrain then
zGS.WaterReflectance=terrain.WaterReflectance
zGS.WaterRefraction=terrain.WaterRefraction
zGS.WaterWaveSize=terrain.WaterWaveSize
zGS.WaterWaveSpeed=terrain.WaterWaveSpeed
zGS.Decoration=terrain.Decoration
end
local sky=p4GetSky()
if sky then
zGS.SunAngularSize=sky.SunAngularSize
zGS.MoonAngularSize=sky.MoonAngularSize
zGS.StarCount=sky.StarCount
end
local sunRays=FFC(Lighting, "SunRaysEffect")
if sunRays then
zGS.SunRaysIntensity=sunRays.Intensity
zGS.SunRaysSpread=sunRays.Spread
end
end)
end
gfxApply()
local shinyClock=0
local p=GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista
Graphics.Scope:Bind(RunService.Heartbeat,function(dt)
gfxClock+=dt
shinyClock+=dt
if gfxClock>=2 then
gfxClock=0
QQ(function()
settings().Rendering.QualityLevel=p.quality
end)
QQ(function()
Lighting.Technology=Enum.Technology.Future
Lighting.GlobalShadows=true
Lighting.EnvironmentSpecularScale=1
Lighting.Brightness=3
DLSSX.shadowApply(p)
Lighting.ShadowSoftness=p.softness
Lighting.ExposureCompensation=p.exposure
end)
DLSSX.applyCC(p)
end
if shinyClock>=5 then
shinyClock=0
if gfxShinyLevel>0 then
gfxApplyShiny()
end
end
end)
Graphics.Scope:Bind(RunService.Heartbeat,function()
DLSSX.shadowApply(GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista)
end)
end,
zDS=function()
if not Graphics.enabled then
return
end
Graphics.enabled=false
Graphics.Scope:Wipe()
gfxRestoreLightShadows()
gfxRestoreShiny()
if gmBloom then
gmBloom:Destroy()
gmBloom=nil
end
QQ(function()
local cc=FF(Lighting, "GM_ColorGrade")
if cc then
cc:Destroy()
end
end)
if DLSSX.sparkle then
QQ(function()
DLSSX.sparkle:Destroy()
end)
DLSSX.sparkle=nil
end
if next(zGS)~=nil then
QQ(function()
local render=settings().Rendering
render.QualityLevel=zGS.QualityLevel
end)
QQ(function()
Lighting.Technology=zGS.Technology
end)
QQ(function()
Lighting.GlobalShadows=zGS.GlobalShadows
end)
QQ(function()
Lighting.ShadowSoftness=zGS.ShadowSoftness
end)
QQ(function()
Lighting.ExposureCompensation=zGS.ExposureCompensation
end)
QQ(function()
local terrain=FFC(Workspace, "Terrain")
if terrain then
terrain.WaterReflectance=zGS.WaterReflectance
terrain.WaterRefraction=zGS.WaterRefraction
terrain.WaterWaveSize=zGS.WaterWaveSize
terrain.WaterWaveSpeed=zGS.WaterWaveSpeed
terrain.Decoration=zGS.Decoration
end
end)
QQ(function()
local sky=p4GetSky()
if sky and zGS.SunAngularSize then
sky.SunAngularSize=zGS.SunAngularSize
sky.MoonAngularSize=zGS.MoonAngularSize
sky.StarCount=zGS.StarCount
end
end)
QQ(function()
local bloom=FFC(Lighting, "BloomEffect")
if bloom and zGS.BloomIntensity then
bloom.Intensity=zGS.BloomIntensity
bloom.Size=zGS.BloomSize
bloom.Threshold=zGS.BloomThreshold
end
end)
QQ(function()
local sunRays=FFC(Lighting, "SunRaysEffect")
if sunRays and zGS.SunRaysIntensity then
sunRays.Intensity=zGS.SunRaysIntensity
sunRays.Spread=zGS.SunRaysSpread
end
end)
QQ(function()
Lighting.Brightness=zGS.Brightness or 2
Lighting.Ambient=zGS.Ambient or CR(0,0,0)
Lighting.OutdoorAmbient=zGS.OutdoorAmbient or CR(70,70,70)
Lighting.ShadowColor=zGS.ShadowColor or CR(70,70,70)
Lighting.EnvironmentDiffuseScale=zGS.EnvironmentDiffuseScale or 0.5
Lighting.EnvironmentSpecularScale=zGS.EnvironmentSpecularScale or 0.5
if zGS.ClockTime then
Lighting.ClockTime=zGS.ClockTime
end
end)
QQ(function()
local atmo=FFC(Lighting, "Atmosphere")
if atmo then
if DLSSX.atmoCreated and atmo.Name=="GM_Atmosphere" then
atmo:Destroy()
elseif zGS.AtmoDensity then
atmo.Density=zGS.AtmoDensity
atmo.Offset=zGS.AtmoOffset
atmo.Color=zGS.AtmoColor
atmo.Decay=zGS.AtmoDecay
atmo.Glare=zGS.AtmoGlare
atmo.Haze=zGS.AtmoHaze
end
end
end)
QQ(function()
if DLSSX.doF then
DLSSX.doF:Destroy()
DLSSX.doF=nil
end
end)
QQ(function()
local sunRays=FFC(Lighting, "SunRaysEffect")
if sunRays and DLSSX.sunRaysCreated and sunRays.Name=="GM_SunRays" then
sunRays:Destroy()
end
end)
DLSSX.atmoCreated=false
DLSSX.sunRaysCreated=false
end
end,
verify=function()
if not Graphics.enabled then
return false,"enabled flag not set"
end
return true
end,
zVC=function()
if next(gfxLightShadows)~=nil then
return false,"light shadows not restored after zDS()"
end
if next(gfxShinySnap)~=nil then
return false,"material reflections not restored after zDS()"
end
if DLSSX.doF and DLSSX.doF.Parent~=nil then
return false,"depth of field still alive after zDS()"
end
return true
end,
})
DLSSX.shotHidden=false
DLSSX.shotSnaps={}
DLSSX.shotCoreTypes={
XC.Backpack,
XC.Chat,
XC.Health,
XC.PlayerList,
XC.EmotesMenu,
}
DLSSX.ShotMod=zr1({
Name="Screenshot Mode",
enable=function()
if DLSSX.ShotMod.enabled or DLSSX.shotHidden then
return
end
DLSSX.ShotMod.enabled=true
DLSSX.shotHidden=true
for _,coreType in IP(DLSSX.shotCoreTypes) do
QQ(function()
StarterGui:SetCoreGuiEnabled(coreType,false)
end)
end
local pg=FF(LocalPlayer, "PlayerGui")
if pg then
for _,child in IP(GC(pg)) do
if child:IsA("ScreenGui") then
local isOurs=SSB(child.Name,1,3)=="GM_"
or child.Name=="GM_UI" or child.Name=="GM_Toasts"
if not isOurs then
DLSSX.shotSnaps[child]=child.Enabled
QQ(function()
child.Enabled=false
end)
end
end
end
end
zNT("Ghost Method",gmT("Screenshot mode: UI de Evade oculta. (Ctrl+X para la nuestra)","Screenshot mode: Evade UI hidden. (X for ours)"),6)
end,
zDS=function()
if not DLSSX.ShotMod.enabled and not DLSSX.shotHidden then
return
end
DLSSX.ShotMod.enabled=false
DLSSX.shotHidden=false
for _,coreType in IP(DLSSX.shotCoreTypes) do
QQ(function()
StarterGui:SetCoreGuiEnabled(coreType,true)
end)
end
for child,was in PR(DLSSX.shotSnaps) do
QQ(function()
if child.Parent then
child.Enabled=was
end
end)
end
DLSSX.shotSnaps={}
zNT("Ghost Method",gmT("UI de Evade restaurada.","Evade UI restored."),4)
end,
verify=function()
return true
end,
zVC=function()
if DLSSX.ShotMod.enabled or DLSSX.shotHidden then
return false,"still hidden"
end
return true
end,
})
markStep("screenshot mode defined")
local ColorFilter
local ccInst=nil
local ccVals={brightness=0,contrast=0,saturation=0}
local CC_PRESETS={
["Off"]={0,0,0},
["Natural"]={0,0,0},
["Vivid"]={0,0.1,0.3},
["Cinematic"]={0,0.18,-0.05},
["Nocturne"]={0.12,0.08,-0.1},
["Sombrio"]={-0.08,0.15,-0.15},
}
local function ccApply()
if ccVals.brightness==0 and ccVals.contrast==0 and ccVals.saturation==0 then
if ccInst then
ccInst:Destroy()
ccInst=nil
end
return
end
if not ccInst or ccInst.Parent==nil then
ccInst=IN("ColorCorrectionEffect")
ccInst.Name="GM_ColorFilter"
ccInst.Parent=Lighting
end
ccInst.Brightness=ccVals.brightness
ccInst.Contrast=ccVals.contrast
ccInst.Saturation=ccVals.saturation
end
local function p4SetCCPreset(name)
local p=CC_PRESETS[name]
if p then
if name=="Off" then
ccVals.brightness,ccVals.contrast,ccVals.saturation=0,0,0
if ccInst then
ccInst:Destroy()
ccInst=nil
end
else
ccVals.brightness,ccVals.contrast,ccVals.saturation=p[1],p[2],p[3]
ccApply()
end
end
end
local function p4SetCCValue(key,v)
ccVals[key]=v
ccApply()
end
ColorFilter=zr1({
Name="Color Filter",
enable=function()
if ColorFilter.enabled then
return
end
ColorFilter.enabled=true
ccApply()
end,
zDS=function()
if not ColorFilter.enabled then
return
end
ColorFilter.enabled=false
if ccInst then
ccInst:Destroy()
ccInst=nil
end
ColorFilter.Scope:Wipe()
end,
verify=function()
return true
end,
zVC=function()
if ccInst then
return false,"filter instance still alive after zDS()"
end
return true
end,
})
local TimeWeather
local twSnap=nil
local twState={clock=14,density=nil,haze=nil}
local twClock=0
local function twAtmo()
return FFC(Lighting, "Atmosphere")
end
local function twApply()
QQ(function()
Lighting.ClockTime=twState.clock
end)
local a=twAtmo()
if a then
if twState.density then
QQ(function()
a.Density=twState.density
end)
end
if twState.haze then
QQ(function()
a.Haze=twState.haze
end)
end
end
end
local function p4SetClock(v)
twState.clock=v
if TimeWeather.enabled then
twApply()
end
end
local function p4SetDensity(v)
twState.density=v
if TimeWeather.enabled then
twApply()
end
end
local function p4SetHaze(v)
twState.haze=v
if TimeWeather.enabled then
twApply()
end
end
TimeWeather=zr1({
Name="Time/Weather",
enable=function()
if TimeWeather.enabled then
return
end
TimeWeather.enabled=true
if not twSnap then
twSnap={}
QQ(function()
twSnap.ClockTime=Lighting.ClockTime
local a=twAtmo()
if a then
twSnap.Density=a.Density
twSnap.Haze=a.Haze
end
end)
twState.clock=twSnap.ClockTime or 14
end
twApply()
TimeWeather.Scope:Bind(RunService.Heartbeat,function(dt)
twClock+=dt
if twClock<1 then
return
end
twClock=0
twApply()
end)
end,
zDS=function()
if not TimeWeather.enabled then
return
end
TimeWeather.enabled=false
TimeWeather.Scope:Wipe()
if twSnap then
QQ(function()
Lighting.ClockTime=twSnap.ClockTime
end)
local a=twAtmo()
if a then
QQ(function()
a.Density=twSnap.Density
end)
QQ(function()
a.Haze=twSnap.Haze
end)
end
end
twState.density=nil
twState.haze=nil
end,
verify=function()
return true
end,
zVC=function()
if TimeWeather.enabled then
return false,"still enabled after zDS()"
end
return true
end,
})
markStep("phase 4 defined")
local Island
local islMode="Ambos"
local islGui,islPill,islLabel=nil,nil,nil
local islFrames=0
local islFps=0
local function islDestroy()
if islGui then
QQ(function()
islGui:Destroy()
end)
end
islGui,islPill,islLabel=nil,nil,nil
end
local function islBuild()
if islGui then
return
end
islGui=ISG()
islGui.Name="GM_Island"
islGui.ResetOnSpawn=false
islGui.IgnoreGuiInset=true
islGui.DisplayOrder=400
islGui.Parent=GuiParent
islPill=INF()
islPill.Name="Pill"
islPill.AnchorPoint=VX(0.5,0)
islPill.Position=U2(0.5,0,0,10)
islPill.Size=UO(150,34)
islPill.BackgroundColor3=Palette.Panel
islPill.BackgroundTransparency=0.12
islPill.BorderSizePixel=0
islPill.Parent=islGui
local iCorner=IUC()
iCorner.CornerRadius=UD(1,0)
iCorner.Parent=islPill
local iGrad=IUG()
iGrad.Rotation=115
iGrad.Color=CSN(CR(34,24,52),CR(14,10,20))
iGrad.Parent=islPill
local iStroke=IUS()
iStroke.Color=Palette.PanelStroke
iStroke.Thickness=1.4
iStroke.Transparency=0.25
iStroke.Parent=islPill
local dot=INF()
dot.Size=UO(8,8)
dot.Position=U2(0,16,0.5,-4)
dot.BackgroundColor3=Palette.Accent
dot.BorderSizePixel=0
local dCorner=IUC()
dCorner.CornerRadius=UD(1,0)
dCorner.Parent=dot
dot.Parent=islPill
islLabel=ITL()
islLabel.BackgroundTransparency=1
islLabel.Size=U2(1,-44,1,0)
islLabel.Position=U2(0,34,0,0)
islLabel.Font=EFB
islLabel.TextSize=13
islLabel.TextColor3=Palette.TextBright
islLabel.TextXAlignment=TXL
islLabel.Text="- - -"
islLabel.Parent=islPill
TSC(
dot,
TWI(1.6,ES.Sine,ED.InOut,-1,true),
{BackgroundTransparency=0.5}
):Play()
CN(islPill.MouseEnter, function()
TSC(islPill,TWI(0.28,ESB,ED.Out),{
Size=UO(196,40),
}):Play()
end)
CN(islPill.MouseLeave, function()
TSC(islPill,TWI(0.24,ES.Quad,ED.Out),{
Size=UO(150,34),
}):Play()
end)
end
local function p5SetIslandMode(mode)
if mode=="Hora" or mode=="FPS" or mode=="Ambos" then
islMode=mode
end
end
Island=zr1({
Name="Dynamic Island",
enable=function()
if Island.enabled then
return
end
Island.enabled=true
islBuild()
local acc=0
Island.Scope:Bind(RunService.Heartbeat,function(dt)
islFrames+=1
acc+=dt
if acc<1 then
return
end
acc=0
islFps=islFrames
islFrames=0
local timeStr=OD("%H:%M")
local text
if islMode=="Hora" then
text=timeStr
elseif islMode=="FPS" then
text=islFps.." FPS"
else
text=timeStr.."  -  "..islFps.." FPS"
end
if islLabel then
islLabel.Text=text
end
end)
end,
zDS=function()
if not Island.enabled then
return
end
Island.enabled=false
Island.Scope:Wipe()
islDestroy()
end,
verify=function()
if not Island.enabled then
return false,"enabled flag not set"
end
return true
end,
zVC=function()
if islGui then
return false,"island gui still alive after zDS()"
end
return true
end,
})
local HttpService=GGS("HttpService")
local CONFIG_FILE="GM_config.json"
local CFG={
keystrokesOn=false,
keystrokesScale=100,
keystrokesOpacity=90,
keystrokesBgOpacity=90,
keystrokesDesign="Glass",
keystrokesColor="Dark",
keystrokesFont="Auto",
keystrokesWm=true,
keystrokesBg=true,
keystrokesTextSize=12,
profilePhotoMode="none",
profilePhotoId=0,
profilePhotoSeq=0,
keystrokesCustomIdle={22,14,36},
keystrokesCustomPressed={167,108,255},
keystrokesCustomText={216,208,235},
keystrokesPos=nil,
uiPos=nil,
islandOn=false,
islandMode="Ambos",
unusualColor="Original",
headlessHead=false,
headlessAccs=false,
korbloxOn=false,
korbloxLeg="Right",
gfxOn=false,
gfxPreset="Realista",
gfxSky=false,
gfxShiny=30,
gfxBloom=100,
gfxShadowDark=0,
filterPreset="Off",
filterBrightness=0,
filterContrast=0,
filterSaturation=0,
timeOn=false,
timeClock=14,
timeDensity=40,
timeHaze=77,
bhopOn=false,
bhopKey="Space",
bhopDelay=0,
crunchOn=false,
crunchSpeed=50,
crunchKey="LeftShift",
hudBhopOn=false,
hudCrunchOn=false,
hudBhopMode="Hold",
hudCrunchMode="Hold",
hudBtnSize=84,
hudBtnOpacity=85,
hudUnlocked=false,
hudBhopPos=nil,
hudCrunchPos=nil,
language="en",
soundsOn=true,
crosshairOn=false,
crosshairStyle="Cross",
crosshairSize=12,
crosshairGap=4,
crosshairThick=2,
crosshairOpacity=100,
crosshairColor={167,108,255},
crosshairOffX=0,
crosshairOffY=0,
evadeFontOn=false,
evadeFont="Gotham",
musicVolume=50,
spotifyDc="",
spotifyName="",
strafferOn=false,
strafferInvert=false,
strafferDeadzone=2,
surfOn=false,
lagOn=false,
lagKey="E",
lagDuration=500,
zzV8={},
rankPos=nil,
logoPos=nil,
iconOffsets=nil,
}
local APPLIES={}
APPLIES.keystrokes=function(withPos)
KeysAPI.setScale(CFG.keystrokesScale/100)
KeysAPI.setOpacity(CFG.keystrokesOpacity/100)
KeysAPI.setBgOpacity(CFG.keystrokesBgOpacity/100)
KeysAPI.setDesign(CFG.keystrokesDesign)
KeysAPI.setColor(CFG.keystrokesColor)
KeysAPI.setFont(CFG.keystrokesFont)
KeysAPI.setWm(CFG.keystrokesWm)
KeysAPI.setBg(CFG.keystrokesBg)
KeysAPI.setTextSize(CFG.keystrokesTextSize)
KeysAPI.setCustom(
CFG.keystrokesCustomIdle,
CFG.keystrokesCustomPressed,
CFG.keystrokesCustomText
)
if CFG.keystrokesOn then
KeysAPI.enable()
if withPos and CFG.keystrokesPos then
KeysAPI.setPos(U2(
CFG.keystrokesPos[1],CFG.keystrokesPos[2],
CFG.keystrokesPos[3],CFG.keystrokesPos[4]
))
end
else
KeysAPI.zDS()
end
end
APPLIES.island=function()
p5SetIslandMode(CFG.islandMode)
if CFG.islandOn then
Island.enable()
else
Island.zDS()
end
end
APPLIES.headless=function()
if CFG.headlessHead then
Headless.enable({head=true})
else
Headless.zDS({head=true})
end
if CFG.headlessAccs then
Headless.enable({accs=true})
else
Headless.zDS({accs=true})
end
end
APPLIES.korblox=function()
setKorbloxChoice(CFG.korbloxLeg)
if CFG.korbloxOn then
Korblox.enable()
else
Korblox.zDS()
end
end
APPLIES.gfx=function()
p4SetGfxPreset(CFG.gfxPreset)
p4SetBloom(CFG.gfxBloom)
DLSSX.shadowDark=(CFG.gfxShadowDark or 0)/100
if CFG.gfxOn then
Graphics.enable()
p4SetShiny(CFG.gfxShiny)
else
Graphics.zDS()
gfxShinyLevel=CFG.gfxShiny/100
end
p4SetSky(CFG.gfxSky)
end
APPLIES.filter=function()
p4SetCCPreset(CFG.filterPreset)
p4SetCCValue("brightness",CFG.filterBrightness/100)
p4SetCCValue("contrast",CFG.filterContrast/100)
p4SetCCValue("saturation",CFG.filterSaturation/100)
end
APPLIES.time=function()
p4SetClock(CFG.timeClock)
p4SetDensity(CFG.timeDensity/100)
p4SetHaze(CFG.timeHaze/100)
if CFG.timeOn then
TimeWeather.enable()
else
TimeWeather.zDS()
end
end
APPLIES.bhop=function()
MOVE.bhopDelayMs=CFG.bhopDelay
if CFG.bhopOn then
Bhop.enable()
else
Bhop.zDS()
end
end
APPLIES.crunch=function()
MOVE.setCrunchSpeed(CFG.crunchSpeed)
if CFG.crunchOn then
MOVE.setCrunch(true)
else
MOVE.setCrunch(false)
end
end
APPLIES.straffer=function()
MOVE.setStrafferInvert(CFG.strafferInvert)
MOVE.setStrafferDeadzone(CFG.strafferDeadzone)
if CFG.strafferOn then
MOVE.setStraffer(true)
else
MOVE.setStraffer(false)
end
end
APPLIES.surf=function()
if CFG.surfOn then
MOVE.zSf(true)
else
MOVE.zSf(false)
end
end
APPLIES.lag=function()
MOVE.zLD(CFG.lagDuration or 500)
if CFG.lagOn then
MOVE.zLg(true)
else
MOVE.zLg(false)
end
end
APPLIES.hud=function()
local want=CFG.hudBhopOn or CFG.hudCrunchOn
for _,m in IP(Modules) do
if m.Name=="Mobile HUD" then
if want and not m.enabled then
m.enable()
elseif not want and m.enabled then
m.zDS()
end
if m.enabled then
m.applyNow()
end
return
end
end
end
APPLIES.crosshair=function()
for _,m in IP(Modules) do
if m.Name=="Crosshair" then
if CFG.crosshairOn and not m.enabled then
m.enable()
elseif not CFG.crosshairOn and m.enabled then
m.zDS()
end
if m.enabled then
m.applyNow()
end
return
end
end
end
APPLIES.evadeFont=function()
for _,m in IP(Modules) do
if m.Name=="EvadeFont" then
if CFG.evadeFontOn and not m.enabled then
m.enable()
elseif not CFG.evadeFontOn and m.enabled then
m.zDS()
end
if m.enabled then
m.applyNow()
end
return
end
end
end
APPLIES.all=function()
APPLIES.keystrokes(true)
APPLIES.island()
APPLIES.headless()
APPLIES.korblox()
APPLIES.gfx()
APPLIES.filter()
APPLIES.time()
APPLIES.bhop()
APPLIES.crunch()
APPLIES.straffer()
APPLIES.surf()
APPLIES.lag()
APPLIES.hud()
APPLIES.crosshair()
APPLIES.evadeFont()
end
local gmSavePending=false
local function zMc()
if gmSavePending then
return
end
gmSavePending=true
TDL(1,function()
gmSavePending=false
if zGC then
zGC()
end
end)
end
onOverlayMoved=zMc
zzV1.actGet=function(hprefix)
if CFG.zzV8 then
return CFG.zzV8[hprefix]
end
return nil
end
zzV1.actSave=function(hprefix,act)
if not CFG.zzV8 then
CFG.zzV8={}
end
CFG.zzV8[hprefix]=act
zMc()
end
zGC=function()
QQ(function()
local op=KeysAPI.getPos()
if op then
CFG.keystrokesPos={op.X.Scale,op.X.Offset,op.Y.Scale,op.Y.Offset}
end
local data={mappings={}}
for _,m in IP(ze7) do
TBI(data.mappings,{from=m.from.name,to=m.to.name})
end
if Unusuals.enabled and zu2 then
data.unusual=zu2
end
data.cfg=CFG
WF(CONFIG_FILE,HttpService:JSONEncode(data))
end)
end
local function gmLoadConfig()
local ok,raw=QQ(function()
if isfile and readfile and ISF(CONFIG_FILE) then
return HttpService:JSONDecode(readfile(CONFIG_FILE))
end
return nil
end)
if not ok or type(raw)~="table" then
return
end
if type(raw.mappings)=="table" then
for _,m in IP(raw.mappings) do
local fromE=zeC.ze1[TS(m.from)]
local toE=zeC.ze1[TS(m.to)]
if fromE and toE then
p3SetMapping(fromE,toE)
end
end
if #ze7>0 then
zzV1.bootEnables=zzV1.bootEnables or {}
TBI(zzV1.bootEnables,function()
zr2.enable()
end)
print("[GM] config: "..#ze7.." emote mapping(s) restored")
end
end
if type(raw.unusual)=="string" and zeC.ze2[raw.unusual] then
zu2=raw.unusual
zzV1.bootEnables=zzV1.bootEnables or {}
TBI(zzV1.bootEnables,function()
Unusuals.enable()
end)
print("[GM] config: unusual '"..raw.unusual.."' restored")
end
if type(raw.cfg)=="table" then
for k,v in PR(raw.cfg) do
if k=="keystrokesPos" then
if type(v)=="table" and #v==4 then
CFG.keystrokesPos=v
end
elseif CFG[k]~=nil and type(v)==type(CFG[k]) then
CFG[k]=v
end
end
print("[GM] config: UI state restored")
elseif type(raw.islandMode)=="string" then
CFG.islandMode=raw.islandMode
p5SetIslandMode(raw.islandMode)
end
end
gmLoadConfig()
zzV1.language=CFG.language=="es" and "es" or "en"
zzV1.unusualColor=CFG.unusualColor or "Original"
zzV1.uiSoundSetEnabled(CFG.soundsOn~=false)
buildMobileHUD({
zr1=zr1,
zNT=zNT,
GuiParent=GuiParent,
getRoot=function()
return zzV1.root
end,
getHudCfg=function()
return {
bhopOn=CFG.hudBhopOn,
crunchOn=CFG.hudCrunchOn,
bhopMode=CFG.hudBhopMode,
crunchMode=CFG.hudCrunchMode,
size=CFG.hudBtnSize,
opacity=CFG.hudBtnOpacity,
unlocked=CFG.hudUnlocked,
pos={bhop=CFG.hudBhopPos,crunch=CFG.hudCrunchPos},
}
end,
setVirtual=function(key,on)
if key=="bhop" then
MOVE.setBhopVirtual(on)
else
MOVE.setCrunchVirtual(on)
end
end,
setBtnPos=function(key,pos)
local t={pos.X.Scale,pos.X.Offset,pos.Y.Scale,pos.Y.Offset}
if key=="bhop" then
CFG.hudBhopPos=t
else
CFG.hudCrunchPos=t
end
zMc()
end,
})
markStep("mobile hud defined")
buildCrosshair({
zr1=zr1,
zNT=zNT,
getRoot=function()
return zzV1.root
end,
getCfg=function()
return {
style=CFG.crosshairStyle,
size=CFG.crosshairSize,
gap=CFG.crosshairGap,
thickness=CFG.crosshairThick,
opacity=CFG.crosshairOpacity,
color=CFG.crosshairColor,
offX=CFG.crosshairOffX,
offY=CFG.crosshairOffY,
}
end,
})
markStep("crosshair defined")
buildEvadeFont({
zr1=zr1,
zNT=zNT,
getLocalPlayer=function()
return LocalPlayer
end,
getCfg=function()
return {
font=CFG.evadeFont,
}
end,
})
markStep("evade font defined")
zzV1.spotify=buildSpotify({
zr1=zr1,
zNT=zNT,
getVolume=function()
return CFG.musicVolume or 50
end,
getDc=function()
return CFG.spotifyDc or ""
end,
setDc=function(v)
CFG.spotifyDc=v or ""
zMc()
end,
setUserName=function(name)
CFG.spotifyName=name or ""
zMc()
end,
})
zzV1.skin=buildSkinChanger({
zr1=zr1,
zNT=zNT,
getLocalPlayer=function()
return LocalPlayer
end,
})
markStep("spotify + skin changer defined")
markStep("phase 5 defined")
do
local cgAcc=0
local cgCooldown=0
local cgGoneSince=nil
local cgWarned=false
local cgConn
cgConn=CN(RunService.Heartbeat, function(dt)
if zzV1.root==nil then
cgConn:Disconnect()
return
end
cgAcc+=dt
if cgAcc<2 then
return
end
cgAcc=0
local cam=Workspace.CurrentCamera
local char=LocalPlayer.Character
local hum=char and FFC(char, "Humanoid")
if hum==nil then
if cgGoneSince==nil then
cgGoneSince=OCL()
cgWarned=false
elseif not cgWarned and OCL() - cgGoneSince>20 then
cgWarned=true
zNT(
"Ghost Method",
gmT("El juego no te respawnio (bug de ronda). Usa el reset de Roblox para volver.","The game did not respawn you (round bug). Use Roblox reset to return."),
8
)
end
return
end
cgGoneSince=nil
if not cam or cam.CameraType~=Enum.CameraType.Custom then
return
end
local subject=cam.CameraSubject
if subject==hum then
return
end
local stale=subject==nil
or(typeof(subject)=="Instance" and subject.Parent==nil)
if not stale then
return
end
if OCL() - cgCooldown<3 then
return
end
cgCooldown=OCL()
cam.CameraSubject=hum
print("[GM] Camera Guard: camera re-attached to your character (round glitch).")
zNT("Ghost Method",gmT("Camara re-adjuntada al personaje (glitch de ronda corregido).","Camera re-attached to your character (round glitch fixed)."),5)
end)
end
local ghostCtx
ghostCtx={
TweenService=TweenService,
UserInputService=UserInputService,
LocalPlayer=LocalPlayer,
GuiParent=GuiParent,
getKeyboardOn=function() return CFG.keystrokesOn end,
getKeyScale=function() return CFG.keystrokesScale end,
getKeyOpacity=function() return CFG.keystrokesOpacity end,
getKeyBgOpacity=function() return CFG.keystrokesBgOpacity end,
getKeyDesign=function() return CFG.keystrokesDesign end,
getKeyColor=function() return CFG.keystrokesColor end,
getKeyFont=function() return CFG.keystrokesFont end,
getKeyWm=function() return CFG.keystrokesWm end,
getKeyBg=function() return CFG.keystrokesBg end,
getKeyTextSize=function() return CFG.keystrokesTextSize end,
getKeyCustomIdle=function()
local c=CFG.keystrokesCustomIdle
return CR(c[1],c[2],c[3])
end,
getKeyCustomPressed=function()
local c=CFG.keystrokesCustomPressed
return CR(c[1],c[2],c[3])
end,
getKeyCustomText=function()
local c=CFG.keystrokesCustomText
return CR(c[1],c[2],c[3])
end,
getUiPos=function() return CFG.uiPos end,
setUiPos=function(dx,dy)
CFG.uiPos={MFL(dx),MFL(dy)}
zMc()
end,
getIslandOn=function() return CFG.islandOn end,
zu6=function()
return CFG.unusualColor or "Original"
end,
zu7=function(name)
CFG.unusualColor=name
zzV1.unusualColor=name
if zu2 then
zu3(zu2)
end
zMc()
end,
getHeadlessHead=function() return CFG.headlessHead end,
getHeadlessAccs=function() return CFG.headlessAccs end,
getKorbloxOn=function() return CFG.korbloxOn end,
getKorbloxLegLabel=function()
if CFG.korbloxLeg=="Left" then
return "Left leg"
elseif CFG.korbloxLeg=="Both" then
return "Both legs"
end
return "Right leg"
end,
toggleScreenshot=function()
if DLSSX.shotHidden then
DLSSX.ShotMod.zDS()
else
DLSSX.ShotMod.enable()
end
end,
getCrosshairOn=function()
return CFG.crosshairOn
end,
setCrosshairOn=function(on)
CFG.crosshairOn=on
APPLIES.crosshair()
zMc()
end,
getCrosshairStyle=function()
return CFG.crosshairStyle
end,
setCrosshairStyle=function(s)
CFG.crosshairStyle=s
APPLIES.crosshair()
zMc()
end,
getCrosshairNum=function(key)
if key=="size" then
return CFG.crosshairSize
elseif key=="gap" then
return CFG.crosshairGap
elseif key=="thick" then
return CFG.crosshairThick
elseif key=="opacity" then
return CFG.crosshairOpacity
elseif key=="offx" then
return CFG.crosshairOffX
elseif key=="offy" then
return CFG.crosshairOffY
end
return 0
end,
setCrosshairNum=function(key,v)
if key=="size" then
CFG.crosshairSize=v
elseif key=="gap" then
CFG.crosshairGap=v
elseif key=="thick" then
CFG.crosshairThick=v
elseif key=="opacity" then
CFG.crosshairOpacity=v
elseif key=="offx" then
CFG.crosshairOffX=v
elseif key=="offy" then
CFG.crosshairOffY=v
end
APPLIES.crosshair()
zMc()
end,
centerCrosshair=function()
CFG.crosshairOffX=0
CFG.crosshairOffY=0
APPLIES.crosshair()
zMc()
end,
getCrosshairColor=function()
return CFG.crosshairColor
end,
setCrosshairColor=function(r,g,b)
CFG.crosshairColor={r,g,b}
APPLIES.crosshair()
zMc()
end,
setCrosshairColorPart=function(part,v)
local c=CFG.crosshairColor or {167,108,255}
local nc={c[1] or 167,c[2] or 108,c[3] or 255}
if part=="r" then
nc[1]=v
elseif part=="g" then
nc[2]=v
elseif part=="b" then
nc[3]=v
end
CFG.crosshairColor=nc
APPLIES.crosshair()
zMc()
end,
getEvadeFontOn=function()
return CFG.evadeFontOn
end,
setEvadeFontOn=function(on)
CFG.evadeFontOn=on
APPLIES.evadeFont()
zMc()
end,
getEvadeFontLabel=function()
return CFG.evadeFont
end,
setEvadeFontLabel=function(yL)
CFG.evadeFont=yL
APPLIES.evadeFont()
zMc()
end,
getRankPos=function()
return CFG.rankPos
end,
saveRankPos=function(x,y,s,r)
CFG.rankPos={x=x,y=y,s=s,r=r or 0}
zMc()
end,
resetRankPos=function()
CFG.rankPos=nil
zMc()
end,
getLogoPos=function()
return CFG.logoPos
end,
saveLogoPos=function(x,y,s)
CFG.logoPos={x=x,y=y,s=s}
zMc()
end,
resetLogoPos=function()
CFG.logoPos=nil
zMc()
end,
getIconOffsets=function()
return CFG.iconOffsets or {}
end,
saveIconOffset=function(iconName,x,y,s)
if not CFG.iconOffsets then
CFG.iconOffsets={}
end
CFG.iconOffsets[iconName]={x=x,y=y,s=s}
zMc()
end,
resetIconOffsets=function()
CFG.iconOffsets=nil
zMc()
end,
spSearch=function(query,cb)
if zzV1.spotify then
zzV1.spotify.search(query,cb)
end
end,
spPlaylist=function(link,cb)
if zzV1.spotify then
zzV1.spotify.loadPlaylist(link,cb)
end
end,
spPlayResult=function(i)
if zzV1.spotify then
zzV1.spotify.playResult(i)
end
end,
spPlayQueue=function(i)
if zzV1.spotify then
zzV1.spotify.playQueue(i)
end
end,
spPauseResume=function()
if zzV1.spotify then
zzV1.spotify.pauseResume()
end
end,
spStop=function()
if zzV1.spotify then
zzV1.spotify.stop()
end
end,
getMusicVolume=function()
return CFG.musicVolume or 50
end,
spSetVolume=function(v)
CFG.musicVolume=v
if zzV1.spotify then
zzV1.spotify.setVolume(v)
end
zMc()
end,
spSetStateHandler=function(fn)
if zzV1.spotify then
zzV1.spotify.setStateHandler(fn)
end
end,
spGetAccount=function()
if CFG.spotifyDc and #CFG.spotifyDc>10 then
return true,(CFG.spotifyName~="" and CFG.spotifyName) or gmT("conectado","connected")
end
return false,""
end,
spLogin=function(dc,cb)
if zzV1.spotify then
zzV1.spotify.login(dc,cb)
end
end,
spLogout=function(cb)
if zzV1.spotify then
zzV1.spotify.logout(cb)
end
end,
spRecent=function(cb)
if zzV1.spotify then
zzV1.spotify.recent(cb)
end
end,
spMyPlaylists=function(cb)
if zzV1.spotify then
zzV1.spotify.myPlaylists(cb)
end
end,
skinApply=function(name,cb)
if zzV1.skin then
zzV1.skin.apply(name,cb)
end
end,
skinRestore=function(cb)
if zzV1.skin then
zzV1.skin.restore(cb)
end
end,
getGfxOn=function() return CFG.gfxOn end,
getGfxPresetLabel=function() return CFG.gfxPreset end,
getSkyOn=function() return CFG.gfxSky end,
getShiny=function() return CFG.gfxShiny end,
getBloom=function() return CFG.gfxBloom end,
getFilterPreset=function() return CFG.filterPreset end,
getFilterBrightness=function() return CFG.filterBrightness end,
getFilterContrast=function() return CFG.filterContrast end,
getFilterSaturation=function() return CFG.filterSaturation end,
getTimeOn=function() return CFG.timeOn end,
getClock=function() return CFG.timeClock end,
getDensity=function() return CFG.timeDensity end,
getHaze=function() return CFG.timeHaze end,
getBhopOn=function() return CFG.bhopOn end,
getBhopKey=function() return CFG.bhopKey end,
getBhopDelay=function() return CFG.bhopDelay end,
getCrunchOn=function() return CFG.crunchOn end,
getCrunchKey=function() return CFG.crunchKey end,
getCrunchSpeed=function() return CFG.crunchSpeed end,
getStrafferOn=function() return CFG.strafferOn end,
zSo=function() return CFG.surfOn end,
zLo=function() return CFG.lagOn end,
zLk=function() return CFG.lagKey or "E" end,
zLd=function() return CFG.lagDuration or 500 end,
getStrafferInvert=function() return CFG.strafferInvert end,
getStrafferDeadzone=function() return CFG.strafferDeadzone end,
setKeyboard=function(on)
CFG.keystrokesOn=on
APPLIES.keystrokes()
zMc()
end,
setKeyScale=function(value)
CFG.keystrokesScale=value
KeysAPI.setScale(value/100)
zMc()
end,
setKeyOpacity=function(value)
CFG.keystrokesOpacity=value
KeysAPI.setOpacity(value/100)
zMc()
end,
setKeyBgOpacity=function(value)
CFG.keystrokesBgOpacity=value
KeysAPI.setBgOpacity(value/100)
zMc()
end,
setKeyDesign=function(name)
CFG.keystrokesDesign=name
KeysAPI.setDesign(name)
zMc()
end,
setKeyColor=function(name)
CFG.keystrokesColor=name
KeysAPI.setColor(name)
zMc()
end,
setKeyFont=function(name)
CFG.keystrokesFont=name
KeysAPI.setFont(name)
zMc()
end,
setKeyWm=function(on)
CFG.keystrokesWm=on
KeysAPI.setWm(on)
zMc()
end,
setKeyBg=function(on)
CFG.keystrokesBg=on
KeysAPI.setBg(on)
zMc()
end,
setKeyTextSize=function(value)
CFG.keystrokesTextSize=value
KeysAPI.setTextSize(value)
zMc()
end,
getProfilePhoto=function()
return {mode=CFG.profilePhotoMode,assetId=CFG.profilePhotoId}
end,
photoFileStatus=function()
if type(getcustomasset)~="function" then
return "nofunc",nil
end
if type(listfiles)~="function" then
return "nofile",nil
end
local best,bestNum=nil,-1
local legacy=nil
for _,f in IP(listfiles()) do
local m=SGM(f,"^GM_foto_(%d+)%.png$")
if not m then
m=SGM(f,"^GM_foto_(%d+)%.jpg$")
end
if m then
local num=TN(m)
if num and num>bestNum then
best,bestNum=f,num
end
elseif f=="GM_foto.png" or f=="GM_foto.jpg" then
legacy=legacy or f
end
end
local target=best or legacy
if not target then
return "nofile",nil
end
local ok,url=QQ(function()
return GCA(target)
end)
if ok and type(url)=="string" and #url>0 then
return "ok",url
end
return "badfile",nil
end,
downloadPhoto=function(url)
if type(url)~="string" or #url<8 then
return "badurl",nil
end
local ok,content=QQ(function()
return game:HttpGet(url)
end)
if not ok or type(content)~="string" or #content<64 then
return "badurl",nil
end
local b1=string.byte(content,1)
local b2=string.byte(content,2)
local ext=nil
if b1==137 and b2==80 then
ext="png"
elseif b1==255 and b2==216 then
ext="jpg"
else
return "notimg",nil
end
CFG.profilePhotoSeq=(TN(CFG.profilePhotoSeq) or 0)+1
local fname="GM_foto_"..TS(CFG.profilePhotoSeq).."."..ext
QQ(function()
if type(delfile)=="function" and type(listfiles)=="function" then
for _,f in IP(listfiles()) do
local isNum=SGM(f,"^GM_foto_%d+%.png$") or SGM(f,"^GM_foto_%d+%.jpg$")
if isNum or f=="GM_foto.png" or f=="GM_foto.jpg" then
if f~=fname then
delfile(f)
end
end
end
end
end)
local okW=QQ(function()
WF(fname,content)
end)
if not okW then
return "badwrite",nil
end
zMc()
return "ok",fname
end,
deletePhotoFiles=function()
QQ(function()
if type(delfile)=="function" and type(listfiles)=="function" then
for _,f in IP(listfiles()) do
local isNum=SGM(f,"^GM_foto_%d+%.png$") or SGM(f,"^GM_foto_%d+%.jpg$")
if isNum or f=="GM_foto.png" or f=="GM_foto.jpg" then
delfile(f)
end
end
end
end)
end,
savePhotoMode=function(mode,assetId)
CFG.profilePhotoMode=mode
CFG.profilePhotoId=assetId or 0
zMc()
end,
setKeyCustomIdle=function(c)
CFG.keystrokesCustomIdle={MFL(c.R*255+0.5),MFL(c.G*255+0.5),MFL(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
zMc()
end,
setKeyCustomPressed=function(c)
CFG.keystrokesCustomPressed={MFL(c.R*255+0.5),MFL(c.G*255+0.5),MFL(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
zMc()
end,
setKeyCustomText=function(c)
CFG.keystrokesCustomText={MFL(c.R*255+0.5),MFL(c.G*255+0.5),MFL(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
zMc()
end,
resetOverlayPosition=function()
KeysAPI.resetPos()
zMc()
end,
setIsland=function(on)
CFG.islandOn=on
APPLIES.island()
if zzV1.zSIA then
zzV1.zSIA(on)
end
zMc()
end,
getIslandMode=function()
return CFG.islandMode
end,
setIslandMode=function(yL)
CFG.islandMode=yL
p5SetIslandMode(yL)
zMc()
end,
setBhop=function(on)
CFG.bhopOn=on
APPLIES.bhop()
zMc()
end,
setBhopKeybind=function(element)
BhopKeybindElement=element
end,
onBhopKeySet=function(name)
CFG.bhopKey=name
zMc()
end,
setBhopDelay=function(ms)
CFG.bhopDelay=ms
MOVE.bhopDelayMs=ms
zMc()
end,
setCrunch=function(on)
CFG.crunchOn=on
APPLIES.crunch()
zMc()
end,
setCrunchKeybind=MOVE.setCrunchKeybind,
onCrunchKeySet=function(name)
CFG.crunchKey=name
zMc()
end,
setCrunchSpeed=function(ms)
CFG.crunchSpeed=ms
MOVE.setCrunchSpeed(ms)
zMc()
end,
setStraffer=function(on)
CFG.strafferOn=on
APPLIES.straffer()
zMc()
end,
zSf=function(on)
CFG.surfOn=on
APPLIES.surf()
zMc()
end,
zLg=function(on)
CFG.lagOn=on
APPLIES.lag()
zMc()
end,
zLK=function(element)
local keyName=element and element.CurrentKeybind or "E"
CFG.lagKey=keyName
MOVE.zLK(element)
zMc()
end,
zLs=function(name)
if name and name~="" then
CFG.lagKey=name
zMc()
end
end,
zLD=function(v)
CFG.lagDuration=v
MOVE.zLD(v)
zMc()
end,
setStrafferInvert=function(on)
CFG.strafferInvert=on
MOVE.setStrafferInvert(on)
zMc()
end,
setStrafferDeadzone=function(px)
CFG.strafferDeadzone=px
MOVE.setStrafferDeadzone(px)
zMc()
end,
getHudUnlocked=function() return CFG.hudUnlocked end,
getHudSize=function() return CFG.hudBtnSize end,
getHudOpacity=function() return CFG.hudBtnOpacity end,
getHudBhopOn=function() return CFG.hudBhopOn end,
getHudBhopMode=function() return CFG.hudBhopMode end,
getHudCrunchOn=function() return CFG.hudCrunchOn end,
getHudCrunchMode=function() return CFG.hudCrunchMode end,
setHudUnlocked=function(on)
CFG.hudUnlocked=on
APPLIES.hud()
zMc()
end,
setHudSize=function(v)
CFG.hudBtnSize=v
APPLIES.hud()
zMc()
end,
setHudOpacity=function(v)
CFG.hudBtnOpacity=v
APPLIES.hud()
zMc()
end,
setHudBhopOn=function(on)
CFG.hudBhopOn=on
APPLIES.hud()
zMc()
end,
setHudBhopMode=function(mode)
CFG.hudBhopMode=mode
APPLIES.hud()
zMc()
end,
setHudCrunchOn=function(on)
CFG.hudCrunchOn=on
APPLIES.hud()
zMc()
end,
setHudCrunchMode=function(mode)
CFG.hudCrunchMode=mode
APPLIES.hud()
zMc()
end,
getSoundsOn=function() return CFG.soundsOn end,
setSoundsOn=function(on)
CFG.soundsOn=on
zzV1.uiSoundSetEnabled(on)
if on then
TDL(0.08,function()
zzV1.uiSound("toggleOn")
end)
end
zMc()
end,
getLanguageLabel=function()
return CFG.language=="es" and "Espanol" or "English"
end,
setLanguage=function(yL)
local code=(yL=="Espanol") and "es" or "en"
if code==CFG.language then
return
end
local prev=CFG.language
CFG.language=code
zzV1.language=code
zMc()
QQ(function()
if zzV1.root then
zzV1.root:Destroy()
end
end)
local okB,errB=QQ(buildGhostUI,ghostCtx)
if okB and zzV1.root then
QQ(function()
if zzV1.zSIA then
zzV1.zSIA(CFG.islandOn)
end
end)
QQ(APPLIES.all)
zNT("Ghost Method",gmT("Idioma aplicado.","Language applied."),4)
else
QQ(function()
WF("GM_lang_error.txt",OD("%Y-%m-%d %H:%M:%S")
.." intento de rebuild con idioma="..TS(code)
.." fallo:\n"..TS(errB))
end)
CFG.language=prev
zzV1.language=prev
zMc()
local okR,errR=QQ(buildGhostUI,ghostCtx)
if okR and zzV1.root then
QQ(function()
if zzV1.zSIA then
zzV1.zSIA(CFG.islandOn)
end
end)
QQ(APPLIES.all)
zNT("Ghost Method",gmT(
"El cambio de idioma fallo - se restauro el idioma anterior. Detalles en GM_lang_error.txt",
"Language switch failed - previous language restored. Details in GM_lang_error.txt"),8)
else
QQ(function()
local f=readfile and isfile and ISF("GM_lang_error.txt") and readfile("GM_lang_error.txt") or ""
WF("GM_lang_error.txt",f.."\nRECUPERACION TAMBIEN FALLO:\n"..TS(errR))
end)
zNT("Ghost Method",gmT(
"Error de interfaz - re-ejecuta el script. Detalles en GM_lang_error.txt",
"Interface error - re-execute the script. Details in GM_lang_error.txt"),10)
end
end
end,
saveAllNow=function()
if zGC then
zGC()
zNT("Ghost Method",gmT("Configuracion guardada.","Configuration saved."),4)
end
end,
savePreset=function(slot)
local fname="GM_preset_"..(slot=="B" and "B" or "A")..".json"
QQ(function()
local data={mappings={}}
for _,m in IP(ze7) do
TBI(data.mappings,{from=m.from.name,to=m.to.name})
end
if Unusuals.enabled and zu2 then
data.unusual=zu2
end
data.cfg=CFG
WF(fname,HttpService:JSONEncode(data))
zNT("Ghost Method",gmT("Preset "..slot.." guardado (config + emotes + unusual).","Preset "..slot.." saved (config + emotes + unusual)."),4)
end)
end,
applyPreset=function(slot)
local fname="GM_preset_"..(slot=="B" and "B" or "A")..".json"
QQ(function()
if type(isfile)~="function" or not ISF(fname) then
zNT("Ghost Method",gmT("Ese preset esta vacio - guardalo primero.","That preset is empty - save it first."),5)
return
end
local raw=HttpService:JSONDecode(readfile(fname))
if type(raw.cfg)=="table" then
for k,v in PR(raw.cfg) do
if k=="keystrokesPos" or k=="uiPos" then
if type(v)=="table" then
CFG[k]=v
end
elseif CFG[k]~=nil and type(v)==type(CFG[k]) then
CFG[k]=v
end
end
end
if type(raw.mappings)=="table" then
p3RemoveAllMappings()
for _,m in IP(raw.mappings) do
local fromE=zeC.ze1[TS(m.from)]
local toE=zeC.ze1[TS(m.to)]
if fromE and toE then
p3SetMapping(fromE,toE)
end
end
end
if type(raw.unusual)=="string" and zeC.ze2[raw.unusual] then
zu4()
zu2=raw.unusual
Unusuals.enable()
end
zzV1.language=CFG.language=="es" and "es" or "en"
zMc()
QQ(function()
if zzV1.root then
zzV1.root:Destroy()
end
end)
local okB=QQ(buildGhostUI,ghostCtx)
if okB and zzV1.root then
if zzV1.zSIA then
zzV1.zSIA(CFG.islandOn)
end
APPLIES.all()
zNT("Ghost Method",gmT("Preset "..slot.." aplicado.","Preset "..slot.." applied."),4)
end
end)
end,
factoryReset=function()
local defaults={
keystrokesOn=false,keystrokesScale=100,keystrokesOpacity=90,
keystrokesBgOpacity=90,keystrokesDesign="Glass",keystrokesColor="Dark",
keystrokesFont="Auto",keystrokesWm=true,keystrokesBg=true,keystrokesTextSize=12,
islandOn=false,islandMode="Ambos",
unusualColor="Original",
headlessHead=false,headlessAccs=false,
korbloxOn=false,korbloxLeg="Right",
gfxOn=false,gfxPreset="Realista",gfxSky=false,gfxShiny=30,gfxBloom=100,
gfxShadowDark=0,
filterPreset="Off",filterBrightness=0,filterContrast=0,filterSaturation=0,
timeOn=false,timeClock=14,timeDensity=40,timeHaze=77,
bhopOn=false,bhopKey="Space",bhopDelay=0,
crunchOn=false,crunchSpeed=50,crunchKey="LeftShift",
strafferOn=false,strafferInvert=false,strafferDeadzone=2,
surfOn=false,lagOn=false,lagKey="E",lagDuration=500,
hudBhopOn=false,hudCrunchOn=false,hudBhopMode="Hold",hudCrunchMode="Hold",
hudBtnSize=84,hudBtnOpacity=85,hudUnlocked=false,
profilePhotoMode="none",profilePhotoId=0,profilePhotoSeq=0,
crosshairOn=false,crosshairStyle="Cross",crosshairSize=12,
crosshairGap=4,crosshairThick=2,crosshairOpacity=100,
crosshairColor={167,108,255},crosshairOffX=0,crosshairOffY=0,
evadeFontOn=false,evadeFont="Gotham",
musicVolume=50,spotifyDc="",spotifyName="",
}
for k,v in PR(defaults) do
CFG[k]=v
end
zzV1.unusualColor="Original"
CFG.keystrokesPos=nil
CFG.uiPos=nil
CFG.hudBhopPos=nil
CFG.hudCrunchPos=nil
p3RemoveAllMappings()
zu4()
zMc()
QQ(function()
if zzV1.root then
zzV1.root:Destroy()
end
end)
local okB=QQ(buildGhostUI,ghostCtx)
if okB and zzV1.root then
if zzV1.zSIA then
zzV1.zSIA(CFG.islandOn)
end
APPLIES.all()
zNT("Ghost Method",gmT("Valores de fabrica restaurados.","Factory settings restored."),5)
end
end,
setHeadlessHead=function(on)
CFG.headlessHead=on
APPLIES.headless()
zMc()
end,
setHeadlessAccs=function(on)
CFG.headlessAccs=on
APPLIES.headless()
zMc()
end,
setKorblox=function(on)
CFG.korbloxOn=on
APPLIES.korblox()
zMc()
end,
setKorbloxLeg=function(yL)
local choice=optionToChoice(yL)
if choice then
CFG.korbloxLeg=choice
setKorbloxChoice(choice)
zMc()
end
end,
openEmotePicker=openEmoteReplacerPicker,
removeAllMappings=function()
p3RemoveAllMappings()
zNT("Ghost Method","All emote mappings removed - templates restored.",4)
zMc()
end,
zu8=zu8,
setGfx=function(on)
CFG.gfxOn=on
APPLIES.gfx()
zMc()
end,
setGfxPreset=function(name)
CFG.gfxPreset=name
p4SetGfxPreset(name)
zMc()
end,
setSky=function(on)
CFG.gfxSky=on
p4SetSky(on)
zMc()
end,
setShiny=function(v)
CFG.gfxShiny=v
p4SetShiny(v)
zMc()
end,
setBloom=function(v)
CFG.gfxBloom=v
p4SetBloom(v)
zMc()
end,
getShadowDark=function()
return CFG.gfxShadowDark
end,
setShadowDark=function(v)
CFG.gfxShadowDark=v
DLSSX.shadowDark=v/100
DLSSX.applyShadowDark()
print("[GM] qq test: "..TS(QQ(function()
return "ok"
end)))
QQ(function()
local ccI=FF(Lighting, "GM_ColorGrade")
WF("GM_shadow_debug.txt",
"v="..TS(v)
.." dark="..TS(DLSSX.shadowDark)
.." dlssOn="..TS(Graphics and Graphics.enabled)
.." amb="..TS(Lighting.Ambient)
.." out="..TS(Lighting.OutdoorAmbient)
.." env="..TS(Lighting.EnvironmentDiffuseScale)
.." ccB="..TS(ccI and ccI.Brightness)
.." ccC="..TS(ccI and ccI.Contrast))
end)
zMc()
end,
setFilterPreset=function(name)
CFG.filterPreset=name
p4SetCCPreset(name)
CFG.filterBrightness=ccVals.brightness*100
CFG.filterContrast=ccVals.contrast*100
CFG.filterSaturation=ccVals.saturation*100
zMc()
end,
setColorValue=function(key,v)
if key=="brightness" then
CFG.filterBrightness=v*100
elseif key=="contrast" then
CFG.filterContrast=v*100
elseif key=="saturation" then
CFG.filterSaturation=v*100
end
p4SetCCValue(key,v)
zMc()
end,
setTime=function(on)
CFG.timeOn=on
APPLIES.time()
zMc()
end,
setClock=function(v)
CFG.timeClock=v
p4SetClock(v)
zMc()
end,
setDensity=function(v)
CFG.timeDensity=v*100
p4SetDensity(v)
zMc()
end,
setHaze=function(v)
CFG.timeHaze=v*100
p4SetHaze(v)
zMc()
end,
runSelfTest=function()
runSelfTest(true)
end,
unload=function()
unloadGhost()
end,
}
local uiOk,uiRootOrErr=QQ(buildGhostUI,ghostCtx)
if not uiOk or uiRootOrErr==nil then
local why=uiOk and "builder returned no root" or TS(uiRootOrErr)
error("[GM] custom UI build failed: "..why,0)
end
markStep("custom UI built")
zzV1.finalApply=function()
APPLIES.all()
if zzV1.bootEnables then
for _,fn in IP(zzV1.bootEnables) do
QQ(fn)
end
zzV1.bootEnables=nil
end
if zzV1.zSIA then
zzV1.zSIA(CFG.islandOn)
end
task.defer(function()
runSelfTest(false)
end)
local gmRankSeg=""
if type(zzV1.keyRank)=="string" and #zzV1.keyRank>0 then
gmRankSeg=" | "..gmT("rango: ","rank: ")..SUP(zzV1.keyRank)
end
zNT("Ghost Method",gmT("cargado - presiona X para el menu","loaded - press X to toggle the menu")
..gmRankSeg
..(zzV1.keyLeftStr and(" | "..gmT("key: te quedan ","key: ")..zzV1.keyLeftStr) or ""),5)
zzV1.finalApply=nil
end
runSelfTest=function(withNotification)
local allOk=true
print("=================================================================")
print("  [Ghost Method] SELF-TEST REPORT    executor: "..executorName())
print("=================================================================")
if zzV1 and zzV1.root then
print("[Ghost Method]  Custom UI ............ FOUND / OK")
else
allOk=false
print("[Ghost Method]  Custom UI ............ FAILED - UI root missing")
end
for _,mod in IP(Modules) do
local ok,reason=true,nil
if type(mod.enable)~="function" or type(mod.zDS)~="function" then
ok,reason=false,"missing enable()/zDS()"
end
local wasEnabled=mod.enabled
if ok and not wasEnabled then
local eOk,eErr=QQ(mod.enable,{hidden=true})
if not eOk then
ok,reason=false,"enable() errored: "..TS(eErr)
end
end
if ok then
local vOk,v1,v2=QQ(mod.verify)
if not vOk then
ok,reason=false,"verify() errored: "..TS(v1)
elseif v1==false then
ok,reason=false,TS(v2 or "verification failed")
end
end
if ok and not wasEnabled then
local dOk,dErr=QQ(mod.zDS)
if not dOk then
ok,reason=false,"zDS() errored: "..TS(dErr)
elseif type(mod.zVC)=="function" then
local cOk,c1,c2=QQ(mod.zVC)
if not cOk then
ok,reason=false,"zVC() errored: "..TS(c1)
elseif c1==false then
ok,reason=false,TS(c2 or "cleanup verification failed")
end
end
end
if not ok then
allOk=false
end
if ok then
print(SFM("[Ghost Method]  %-14s OK",mod.Name))
else
print(SFM("[Ghost Method]  %-14s FAILED - %s",mod.Name,TS(reason)))
end
mod.lastTestOk=ok
mod.lastTestReason=reason
end
print("=================================================================")
local rigOk,rigProbe=QQ(function()
local rigs=FF(Workspace, "Rigs")
return rigs and FF(rigs, LocalPlayer.Name) or nil
end)
local rig=rigOk and rigProbe or nil
if rig and FF(rig, "Head") then
print("[Ghost Method]  Headless: rig found + Head part OK")
else
print("[Ghost Method]  Headless: rig found + Head part FAILED (rig absent between rounds?)")
end
local meshOk,meshErr=QQ(function()
local probe=IN("CharacterMesh")
probe.BodyPart=Enum.BodyPart.RightLeg
probe.MeshId=101851696
probe.OverlayTextureId=101851254
probe.BaseTextureId=0
probe:Destroy()
end)
if rig and meshOk then
print("[Ghost Method]  Korblox: rig + real CharacterMesh data OK")
else
print("[Ghost Method]  Korblox: rig + real CharacterMesh data FAILED ("
..(not rig and "rig absent" or TS(meshErr))..")")
end
print("[Ghost Method]  Phase 3: "..#zeC.emotes.." emotes, "
..#zeC.unusuals.." unusuals in catalog (runtime scan)")
print("[Ghost Method]  RESULT: "..(allOk and "ALL SYSTEMS OK" or "FAILURES DETECTED - see lines above"))
print("=================================================================")
if withNotification then
zNT(
"Ghost Method - self-test",
allOk and "All modules OK. Full report printed to console (F9)."
or "Failures detected. Full report printed to console (F9).",
7
)
end
QQ(function()
local lines={"Ghost Method self-test @ "..OD("%Y-%m-%d %H:%M:%S")}
for _,mod in IP(Modules) do
TBI(lines,SFM("%-14s %s%s",mod.Name,
mod.lastTestOk and "OK" or "FAILED",
(mod.lastTestOk==false and mod.lastTestReason) and(" - "..TS(mod.lastTestReason)) or ""))
end
TBI(lines,"catalogs: "..#zeC.emotes.." emotes, "..#zeC.unusuals.." unusuals")
WF("GM_selftest.txt",TCN(lines,"\n"))
end)
return allOk
end
unloadGhost=function()
print("=================================================================")
print("[Ghost Method]  UNLOADING - wiping every connection and instance...")
if zGC then
zGC()
end
for _,mod in IP(Modules) do
QQ(mod.zDS)
end
QQ(function()
if zzV1.root then
zzV1.root:Destroy()
end
if zzV1.toasts then
zzV1.toasts:Destroy()
end
zzV1.root=nil
zzV1.toast=nil
zzV1.setVisible=nil
end)
QQ(function()
zzV1.uiSoundSetEnabled(false)
end)
GM_ENV.__GHOST_METHOD_ACTIVE=nil
GM_ENV.GHOST_METHOD_LOADED=nil
print("[Ghost Method]  Unloaded cleanly. Guard flags cleared - safe to re-execute.")
print("=================================================================")
end
if zzV1.finalApply then
QQ(zzV1.finalApply)
end
if fadeSplash then
fadeSplash()
end
markStep("boot complete")
end
local okBoot,bootReport=xpcall(body,function(err)
local okT,trace=QQ(debug.traceback,err,2)
if okT and type(trace)=="string" and #trace>0 then
return trace
end
return TS(err)
end)
if not okBoot then
bootCrash(bootReport)
end
