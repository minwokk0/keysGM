local IN=Instance.new local U2=UDim2.new local UD=UDim.new local CR=Color3.fromRGB local TX=Enum.TextXAlignment local ES=Enum.EasingStyle local ED=Enum.EasingDirection local EF=Enum.Font local XU=Enum.UserInputType local XK=Enum.KeyCode local XR=Enum.SortOrder local XA=Enum.AutomaticSize local XC=Enum.CoreGuiType local TY=Enum.TextYAlignment local TT=Enum.TextTruncate local TSV=game:GetService('TweenService') local TSC=function(a,b,c) return TSV:Create(a,b,c) end local UO=UDim2.fromOffset local US=UDim2.fromScale local VX=Vector2.new local MFL=math.floor local SFM=string.format local TDL=task.delay local SSB=string.sub local QQ=pcall local TSP=task.spawn local NSK=NumberSequenceKeypoint.new local CSN=ColorSequence.new local NSN=NumberSequence.new local SGM=string.match local SLW=string.lower local GGS=function(s) return game:GetService(s) end local TBI=table.insert local TCN=table.concat local SRP=string.rep local SUP=string.upper local SFD=string.find local IUC=function() return Instance.new('UICorner') end local INF=function() return Instance.new('Frame') end local ITL=function() return Instance.new('TextLabel') end local ITB=function() return Instance.new('TextButton') end local IUS=function() return Instance.new('UIStroke') end local IUP=function() return Instance.new('UIPadding') end local IUL=function() return Instance.new('UIListLayout') end local TWI=function(...) return TweenInfo.new(...) end local TXL=Enum.TextXAlignment.Left local TYC=Enum.TextYAlignment.Center local TYT=Enum.TextYAlignment.Top local ESQ=ES.Quart local ESB=ES.Back
local GM_ENV=(type(getgenv)=="function") and getgenv() or _G
if GM_ENV.__GHOST_METHOD_ACTIVE or GM_ENV.GHOST_METHOD_LOADED then
if GM_ENV.GM_FORCE then
GM_ENV.GM_FORCE=nil
GM_ENV.__GHOST_METHOD_ACTIVE=nil
GM_ENV.GHOST_METHOD_LOADED=nil
print("[Ghost Method] GM_FORCE detectado - guard limpiado, re-ejecutando.")
else
warn("[Ghost Method] Double execution detected - already running. Second execution ignored.")
warn("[Ghost Method] Si el menu no responde: ejecuta getgenv().GM_FORCE = true y re-ejecuta.")
return
end
end
GM_ENV.__GHOST_METHOD_ACTIVE=true
GM_ENV.GHOST_METHOD_LOADED=true
local GMUI={}
GMUI.language="es"
local function gmT(es,en)
if GMUI.language=="en" then
return en or es
end
return es
end
GMUI.soundsOn=true
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
GMUI.uiSound=function(kind)
if not GMUI.soundsOn then
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
GMUI.uiSoundSetEnabled=function(on)
GMUI.soundsOn=on and true or false
if not on then
for _,s in pairs(SND_POOL) do
if s then
QQ(function()
s:Stop()
end)
end
end
end
end
GMUI.accessData=nil
GMUI.accessToken=nil
local function gmMix(a,b,c)
local t=bit32.band(tonumber(a) or 0,0xffffffff)
local ub=#tostring(b)
local uc=#tostring(c)
t=bit32.bxor(t,bit32.lshift(ub,11))
t=bit32.bxor(t,bit32.lshift(uc,5))
t=bit32.band(t+0x9e3779b9,0xffffffff)
t=bit32.bxor(t,bit32.rshift(t,7))
t=bit32.band(t*17+uc,0xffffffff)
t=bit32.bxor(t,bit32.lshift(bit32.band(ub,0xff),13))
return bit32.band(t,0xffffffff)
end
GMUI.accessOk=function()
local tok=GMUI.accessToken
local dat=GMUI.accessData
if type(tok)~="number" or type(dat)~="table" then
return false
end
local exp=tonumber(dat.expires)
if not exp or os.time()>exp then
return false
end
return tok==gmMix(dat.expires,dat.user,dat.key)
end
local GuiParent
local LocalPlayer
local SplashRef
local LAST_STEP="script start"
local function markStep(label)
LAST_STEP=label
print("[GM] "..label)
end
local function bootCrash(report)
local reportText=tostring(report)
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
writefile("GM_bootlog.txt",TCN(lines,"\n"))
end)
local shown=false
if GMUI and type(GMUI.toast)=="function" then
shown=QQ(function()
GMUI.toast(
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
parent=LocalPlayer:FindFirstChildOfClass("PlayerGui")
end
if not parent then
parent=GuiParent or GGS("CoreGui")
end
local banner=IN("ScreenGui")
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
local stroke=IUS()
stroke.Color=CR(255,80,80)
stroke.Thickness=2
stroke.Parent=frame
local title=ITL()
title.BackgroundTransparency=1
title.Position=U2(0,14,0,8)
title.Size=U2(1,-28,0,22)
title.Font=EF.GothamBold
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
local C_TRACK_ON=CR(255,255,255)
local C_KNOB_ON=CR(20,16,28)
local C_TEXT=CR(232,228,240)
local C_DIM=CR(154,144,168)
local C_OFF=CR(160,152,176)
local C_ACCENT=CR(167,108,255)
local C_RED=CR(239,68,68)
local C_DANGER_BG=CR(46,22,24)
local C_DANGER_HOVER=CR(64,30,32)
local WIN_W,WIN_H=590,410
local WIN_FONT=EF.Gotham
local WIN_FONT_MED=EF.GothamMedium
local WIN_FONT_BOLD=EF.GothamBold
local WIN_FONT_GOTHIC=EF.GrenzeGotisch
local TOUCH=UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
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
local root=IN("ScreenGui")
root.Name="GM_UI"
root.ResetOnSpawn=false
root.IgnoreGuiInset=true
root.DisplayOrder=500
root.Parent=ctx.GuiParent
root.Destroying:Connect(function()
for _,c in ipairs(uiConns) do
QQ(function()
c:Disconnect()
end)
end
end)
local uiScale=IN("UIScale")
uiScale.Parent=root
local currentFit=1
local function fitScale()
local cam=Workspace.CurrentCamera
if not cam then
return
end
local vp=cam.ViewportSize
local s=math.min((vp.X - 30)/WIN_W,(vp.Y - 30)/WIN_H,1)
if s<0.55 then
s=0.55
end
currentFit=s
uiScale.Scale=s
end
fitScale()
bindConn(Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
fitScale()
local cam=Workspace.CurrentCamera
if cam then
bindConn(cam:GetPropertyChangedSignal("ViewportSize"):Connect(fitScale))
end
end))
local shadows={}
do
local defs={{8,0.84},{18,0.92},{30,0.955}}
for i,def in ipairs(defs) do
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
local strokeGrad=IN("UIGradient")
strokeGrad.Rotation=90
strokeGrad.Color=CSN(
CR(120,70,200),
CR(80,50,160)
)
strokeGrad.Transparency=NSN({
NSK(0,0.6),
NSK(0.5,0.75),
NSK(1,0.6),
})
strokeGrad.Parent=mainStroke
main.Parent=root
local popLayer=INF()
popLayer.Name="PopLayer"
popLayer.BackgroundTransparency=1
popLayer.Size=US(1,1)
popLayer.Visible=true
popLayer.ZIndex=40
popLayer.Parent=main
local popups={}
local function closeAllPopups()
for _,p in ipairs(popups) do
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
local scroll=IN("ScrollingFrame")
scroll.Name="Page"..pageOrder
scroll.Visible=false
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.Size=US(1,1)
scroll.CanvasSize=U2(0,0,0,0)
scroll.AutomaticCanvasSize=XA.Y
scroll.ScrollBarThickness=5
scroll.ScrollBarImageColor3=CR(170,170,170)
scroll.ScrollBarImageTransparency=0.5
scroll.ScrollingDirection=Enum.ScrollingDirection.Y
scroll.ElasticBehavior=Enum.ElasticBehavior.WhenScrollable
scroll.Active=true
scroll.ZIndex=3
local pad=IUP()
pad.PaddingTop=UD(0,12)
pad.PaddingBottom=UD(0,14)
pad.PaddingLeft=UD(0,14)
pad.PaddingRight=UD(0,10)
pad.Parent=scroll
local lay=IUL()
lay.Padding=UD(0,12)
lay.SortOrder=XR.LayoutOrder
lay.Parent=scroll
scroll.Parent=content
pages[pageOrder]=scroll
return scroll
end
local function mkIcon(parent,kind,tint)
local holder=INF()
holder.Name="Icon_"..kind
holder.BackgroundTransparency=1
holder.Size=UO(16,16)
local pieces={}
local function bar(x,y,w,h,rot,filled,round)
local g=INF()
g.BorderSizePixel=0
g.Position=UO(x - 1,y - 1)
g.Size=UO(w+2,h+2)
g.Rotation=rot or 0
g.Parent=holder
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
pieces[#pieces+1]={frame=f,stroke=st}
end
if round then
local cr=IUC()
cr.CornerRadius=UD(1,0)
cr.Parent=f
end
f.Parent=holder
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
holder.Parent=parent
local api={frame=holder}
function api.tint(color)
for _,p in ipairs(pieces) do
if p.stroke then
p.stroke.Color=color
else
p.frame.BackgroundColor3=color
end
end
for _,d in ipairs(holder:GetChildren()) do
if d:IsA("Frame") and d~=api.frame then
local gs=d:FindFirstChildOfClass("UIStroke")
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
QQ(function()
if isfile and readfile and isfile("GM_logo.png") then
local data=readfile("GM_logo.png")
if #data>100 then
local fname="GM_logo_"..tostring(MFL(os.clock()*1000))..".png"
writefile(fname,data)
logoImg=getcustomasset(fname)
end
end
end)
local SUB_NAME="ECLIPSE"
local SUB_COLORS={
["ECLIPSE"]=CR(198,150,255),
["SAPPHIRE"]=CR(91,140,255),
["ESMERALD"]=CR(74,222,128),
["WRAITH"]=CR(184,184,208),
}
local SUB_COLOR=SUB_COLORS[SUB_NAME] or C_ACCENT
local hdrFrame=INF()
hdrFrame.Name="HeaderFrame"
hdrFrame.BackgroundTransparency=1
hdrFrame.Position=UO(8,6)
hdrFrame.Size=U2(1,-16,0,48)
hdrFrame.ZIndex=4
hdrFrame.Parent=sidebar
local hdrPad=IUP()
hdrPad.PaddingLeft=UD(0,4)
hdrPad.PaddingRight=UD(0,4)
hdrPad.PaddingTop=UD(0,4)
hdrPad.PaddingBottom=UD(0,4)
hdrPad.Parent=hdrFrame
local hdrLay=IUL()
hdrLay.FillDirection=Enum.FillDirection.Horizontal
hdrLay.Padding=UD(0,8)
hdrLay.VerticalAlignment=Enum.VerticalAlignment.Center
hdrLay.Parent=hdrFrame
if logoImg then
local img=IN("ImageLabel")
img.Name="LogoImg"
img.BackgroundTransparency=1
img.Size=UO(40,40)
img.ScaleType=Enum.ScaleType.Fit
img.Image=logoImg
img.ZIndex=5
img.Parent=hdrFrame
else
local txt=ITL()
txt.Name="LogoText"
txt.BackgroundTransparency=1
txt.Size=UO(140,40)
txt.Font=WIN_FONT_GOTHIC
txt.TextSize=24
txt.RichText=true
txt.TextXAlignment=TXL
txt.TextColor3=C_TEXT
txt.Text='Ghost <font color="#A76CFF">Method</font>'
txt.ZIndex=5
txt.Parent=hdrFrame
end
local subPill=INF()
subPill.Name="SubPill"
subPill.AnchorPoint=VX(1,0.5)
subPill.Position=U2(1,-4,0.5,0)
subPill.Size=UO(86,28)
subPill.BackgroundColor3=CR(40,20,70)
subPill.BackgroundTransparency=0.1
subPill.BorderSizePixel=0
subPill.ZIndex=5
local spCorner=IUC()
spCorner.CornerRadius=UD(1,0)
spCorner.Parent=subPill
subPill.Parent=hdrFrame
local spShine=INF()
spShine.Name="Shine"
spShine.AnchorPoint=VX(0,0)
spShine.Position=U2(0,-30,0,0)
spShine.Size=U2(0,14,1,0)
spShine.BackgroundTransparency=0.4
spShine.BackgroundColor3=CR(255,255,255)
spShine.BorderSizePixel=0
spShine.ZIndex=6
spShine.Visible=false
local spShCorner=IUC()
spShCorner.CornerRadius=UD(1,0)
spShCorner.Parent=spShine
spShine.Parent=subPill
local subLabel=ITL()
subLabel.Name="SubLabel"
subLabel.BackgroundTransparency=1
subLabel.Size=US(1,1)
subLabel.Font=WIN_FONT_BOLD
subLabel.TextSize=10
subLabel.TextColor3=SUB_COLOR
subLabel.Text=SUB_NAME
subLabel.ZIndex=7
subLabel.Parent=subPill
local subStroke=IUS()
subStroke.Name="SubRainbow"
subStroke.Thickness=1.5
subStroke.Transparency=0.2
subStroke.Parent=subPill
local rainbowGrad=IN("UIGradient")
rainbowGrad.Name="RainbowGrad"
rainbowGrad.Rotation=0
rainbowGrad.Color=CSN({
ColorSequenceKeypoint.new(0,CR(255,0,100)),
ColorSequenceKeypoint.new(0.2,CR(255,100,0)),
ColorSequenceKeypoint.new(0.4,CR(255,255,0)),
ColorSequenceKeypoint.new(0.6,CR(0,255,100)),
ColorSequenceKeypoint.new(0.8,CR(0,100,255)),
ColorSequenceKeypoint.new(1,CR(200,0,255)),
})
rainbowGrad.Parent=subStroke
TSP(function()
while true do
QQ(function()
rainbowGrad.Rotation=(rainbowGrad.Rotation+2)%360
end)
task.wait(0.03)
end
end)
TSP(function()
while true do
QQ(function()
spShine.Visible=true
spShine.Position=U2(0,-30,0,0)
TSC(spShine,
TWI(1.2,ES.Quad,ED.Out),
{Position=U2(1,10,0,0)}
):Play()
end)
task.wait(2.5)
QQ(function()
spShine.Visible=false
end)
task.wait(1)
end
end)
local sparkles={}
for i=1,4 do
local sp=INF()
sp.Name="Sparkle"..i
sp.Size=UO(2,2)
sp.BackgroundColor3=SUB_COLOR
sp.BackgroundTransparency=1
sp.BorderSizePixel=0
sp.ZIndex=8
local spC=IUC()
spC.CornerRadius=UD(1,0)
spC.Parent=sp
sp.Parent=hdrFrame
sparkles[i]=sp
end
TSP(function()
local rng=Random.new()
while true do
for i,sp in ipairs(sparkles) do
QQ(function()
sp.Position=U2(rng:NextNumber(0.4,0.95),0,rng:NextNumber(0,0.4),0)
sp.BackgroundTransparency=1
local ti=TWI(0.4,ES.Quad,ED.Out)
TSC(sp,ti,{BackgroundTransparency=0.1}):Play()
end)
task.wait(rng:NextNumber(0.1,0.5))
QQ(function()
TSC(sp,TWI(0.6),{BackgroundTransparency=1}):Play()
end)
end
task.wait(rng:NextNumber(2,4))
end
end)
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
local function winBtn(txt,color,hover,onClick)
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
b.MouseEnter:Connect(function()
TSC(b,TWI(0.15,ESQ,ED.Out),{BackgroundTransparency=0,BackgroundColor3=hover,Size=UO(34,34)}):Play()
TSC(bs,TWI(0.15),{Transparency=0.2}):Play()
GMUI.uiSound("hover")
end)
b.MouseLeave:Connect(function()
TSC(b,TWI(0.15,ESQ,ED.Out),{BackgroundTransparency=0.25,BackgroundColor3=color,Size=UO(32,32)}):Play()
TSC(bs,TWI(0.15),{Transparency=0.6}):Play()
end)
b.Activated:Connect(function()
GMUI.uiSound("click")
onClick()
end)
b.Parent=winBtns
return b
end
local minimized=false
winBtn("~",CR(38,28,58),CR(58,42,88),function()
minimized=not minimized
if minimized then
TSC(main,TWI(0.35,ESB,ED.In),{Size=UO(WIN_W,46)}):Play()
TSC(content,TWI(0.3),{Visible=false}):Play()
for _,sh in ipairs(shadows) do
TSC(sh,TWI(0.3),{Size=UO(WIN_W+18,46+18)}):Play()
end
else
TSC(main,TWI(0.35,ESB,ED.Out),{Size=UO(WIN_W,WIN_H)}):Play()
task.wait(0.2)
content.Visible=true
for _,sh in ipairs(shadows) do
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
local fadeGrad=IN("UIGradient")
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
local avatar=INF()
avatar.Name="Avatar"
avatar.Position=UO(12,14)
avatar.Size=UO(30,30)
avatar.BackgroundColor3=C_PILL
avatar.BorderSizePixel=0
avatar.ZIndex=4
local avCorner=IUC()
avCorner.CornerRadius=UD(1,0)
avCorner.Parent=avatar
local avRing=IUS()
avRing.Color=C_ACCENT
avRing.Thickness=1.5
avRing.Transparency=0.35
avRing.Parent=avatar
avatar.Parent=profile
local initial=ITL()
initial.BackgroundTransparency=1
initial.Size=US(1,1)
initial.Font=WIN_FONT_BOLD
initial.TextSize=13
initial.TextColor3=C_DIM
initial.Text=SSB(LocalPlayer.DisplayName,1,1)
initial.ZIndex=4
initial.Parent=avatar
local thumb=IN("ImageLabel")
thumb.Name="Thumb"
thumb.BackgroundTransparency=1
thumb.Size=US(1,1)
thumb.Image="rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=48&h=48"
thumb.ZIndex=5
local thCorner=IUC()
thCorner.CornerRadius=UD(1,0)
thCorner.Parent=thumb
thumb.Parent=avatar
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
setPhotoImage("rbxassetid://"..tostring(photoState.assetId))
photoActive=true
elseif photoState.mode=="file" then
local status,url=ctx.photoFileStatus()
if status=="ok" and url then
setPhotoImage(url)
photoActive=true
else
setPhotoImage(nil)
if GMUI.toast then
GMUI.toast("Ghost Method","La foto (GM_foto.png/jpg) no esta en el workspace - avatar normal.",6)
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
avDim.Parent=avatar
local pencil=INF()
pencil.Name="Pencil"
pencil.BackgroundTransparency=1
pencil.AnchorPoint=VX(0.5,0.5)
pencil.Position=US(0.5,0.5)
pencil.Size=US(1,1)
pencil.Visible=false
pencil.ZIndex=7
pencil.Parent=avatar
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
hoverBtn.Parent=avatar
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
local photoDialog=INF()
photoDialog.Name="PhotoDialog"
photoDialog.Visible=false
photoDialog.BackgroundColor3=C_POPUP
photoDialog.BackgroundTransparency=0.04
photoDialog.BorderSizePixel=0
photoDialog.Size=UO(300,200)
photoDialog.ZIndex=40
local pdCorner=IUC()
pdCorner.CornerRadius=UD(0,12)
pdCorner.Parent=photoDialog
photoDialog.Parent=popLayer
local dlgEntry={}
local dlgOpen=false
function dlgEntry.close()
if not dlgOpen then
return
end
dlgOpen=false
photoDialog.Visible=false
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
pdTitle.Parent=photoDialog
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
pdUrlLabel.Parent=photoDialog
local pdUrlBox=IN("TextBox")
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
pdUrlBox.Parent=photoDialog
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
pdLoad.Parent=photoDialog
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
pdStatus.Parent=photoDialog
local pdHint=ITL()
pdHint.BackgroundTransparency=1
pdHint.Position=UO(14,96)
pdHint.Size=U2(1,-28,0,12)
pdHint.Font=WIN_FONT
pdHint.TextSize=9
pdHint.TextXAlignment=TXL
pdHint.TextColor3=C_DIM
pdHint.Text="Recomendado: imagen cuadrada, ej 500x500px. Se ajusta al icono sola."
pdHint.ZIndex=41
pdHint.Parent=photoDialog
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
pdIdLabel.Parent=photoDialog
local pdBox=IN("TextBox")
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
pdBox.Parent=photoDialog
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
pdApply.Parent=photoDialog
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
pdFileNote.Parent=photoDialog
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
pdClose.Parent=photoDialog
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
if GMUI.toast then
GMUI.toast("Ghost Method",gmT("Foto aplicada desde GM_foto.png.","Photo applied from GM_foto.png."),5)
end
return
elseif status=="nofunc" then
pdStatus.Text="Este executor no lee archivos - usa link o Asset ID."
elseif status=="badfile" then
pdStatus.Text="GM_foto.png/jpg esta corrupto o no es una imagen."
else
pdStatus.Text="Auto-detectando GM_foto en el workspace..."
end
task.wait(1)
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
local dSize=photoDialog.AbsoluteSize
photoDialog.Position=UO(10,mSize.Y - dSize.Y - 80)
photoDialog.Visible=true
local baseStatus=ctx.photoFileStatus()
if baseStatus=="ok" then
pdStatus.Text="Foto actual detectada. Cambiala con un link o Asset ID."
else
startPolling()
end
end
pdLoad.Activated:Connect(function()
local url=pdUrlBox.Text
if type(url)~="string" or #url<8 then
pdStatus.Text="Pega primero el link de tu imagen."
return
end
pdStatus.Text="Descargando imagen..."
TSP(function()
local res=ctx.downloadPhoto(url)
if res=="ok" then
local status,curl=ctx.photoFileStatus()
if status=="ok" and curl then
photoActive=true
setPhotoImage(curl)
ctx.savePhotoMode("file",0)
dlgEntry.close()
if GMUI.toast then
GMUI.toast("Ghost Method",gmT("Foto aplicada desde el link.","Photo applied from the link."),4)
end
else
pdStatus.Text="Descargada pero no se pudo mostrar - prueba otra."
end
elseif res=="notimg" then
pdStatus.Text="Es una pagina, no una imagen: copia el link DE la imagen."
elseif res=="badwrite" then
pdStatus.Text="No se pudo guardar el archivo."
else
pdStatus.Text="No se pudo descargar - revisa el link."
end
end)
end)
pdApply.Activated:Connect(function()
local id=tonumber(pdBox.Text)
if id and id>0 then
photoActive=true
setPhotoImage("rbxassetid://"..tostring(id))
ctx.savePhotoMode("asset",MFL(id))
dlgEntry.close()
if GMUI.toast then
GMUI.toast("Ghost Method",gmT("Foto aplicada desde Asset ID.","Photo applied from Asset ID."),4)
end
else
pdStatus.Text="Ese Asset ID no es valido (solo numeros)."
end
end)
pdClose.Activated:Connect(function()
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
hoverBtn.MouseEnter:Connect(function()
hideToken=hideToken+1
if photoActive then
dotsBtn.Visible=true
else
avDim.Visible=true
pencil.Visible=true
end
end)
hoverBtn.MouseLeave:Connect(hideOverlays)
dotsBtn.MouseEnter:Connect(function()
hideToken=hideToken+1
end)
dotsBtn.MouseLeave:Connect(hideOverlays)
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
hoverBtn.Activated:Connect(function()
if not photoActive then
openPhotoDialog()
else
toggleMenu()
end
end)
dotsBtn.Activated:Connect(function()
toggleMenu()
end)
local function menuOption(text,onClick,danger)
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
ob.MouseEnter:Connect(function()
ob.BackgroundColor3=C_POPUP_HOVER
ob.BackgroundTransparency=0
end)
ob.MouseLeave:Connect(function()
ob.BackgroundTransparency=1
end)
ob.Activated:Connect(function()
menuEntry.close()
onClick()
end)
ob.Parent=photoMenu
end
menuOption("Quitar",function()
photoActive=false
setPhotoImage(nil)
ctx.savePhotoMode("none",0)
ctx.deletePhotoFiles()
if GMUI.toast then
GMUI.toast("Ghost Method",gmT("Foto quitada - avatar normal.","Photo removed - default avatar."),4)
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
local function mkNavButton(holder,idx,def)
local btn=ITB()
btn.Name="Nav_"..def.name
btn.AutoButtonColor=false
btn.Text=""
btn.Size=U2(1,0,0,TOUCH and 52 or 46)
btn.LayoutOrder=idx
btn.BackgroundColor3=C_CARD
btn.BackgroundTransparency=0.3
btn.ZIndex=4
local nc=IUC()
nc.CornerRadius=UD(1,0)
nc.Parent=btn
local nStroke=IUS()
nStroke.Name="BtnStroke"
nStroke.Color=C_PILL
nStroke.Thickness=1
nStroke.Transparency=0.5
nStroke.Parent=btn
local ng=IUS()
ng.Name="NavGlow"
ng.Color=C_ACCENT
ng.Thickness=1.5
ng.Transparency=1
ng.Parent=btn
local iconBg=INF()
iconBg.Name="IconBg"
iconBg.AnchorPoint=VX(0,0.5)
iconBg.Position=U2(0,6,0.5,0)
iconBg.Size=UO(32,32)
iconBg.BackgroundColor3=CR(16,12,24)
iconBg.BackgroundTransparency=0.1
iconBg.BorderSizePixel=0
iconBg.ZIndex=5
local ibc=IUC()
ibc.CornerRadius=UD(1,0)
ibc.Parent=iconBg
local ibs=IUS()
ibs.Name="IconGlow"
ibs.Color=C_ACCENT
ibs.Thickness=1
ibs.Transparency=0.5
ibs.Parent=iconBg
iconBg.Parent=btn
local icon=mkIcon(iconBg,def.icon,C_TEXT)
icon.frame.Position=UO(8,8)
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.Position=UO(48,0)
lbl.Size=U2(1,-56,1,0)
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
indicator.Size=UO(3,TOUCH and 30 or 26)
indicator.BackgroundColor3=CR(255,255,255)
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
TSC(btn,nInfo,{BackgroundTransparency=0.05,BackgroundColor3=CR(60,36,100)}):Play()
TSC(nStroke,nInfo,{Color=C_ACCENT,Transparency=0.1,Thickness=1.5}):Play()
TSC(ng,nInfo,{Transparency=0.2}):Play()
TSC(ibs,nInfo,{Transparency=0.15,Thickness=1.5}):Play()
TSC(iconBg,nInfo,{BackgroundTransparency=0.1}):Play()
indicator.Visible=true
icon.tint(C_TEXT)
elseif state.hover then
TSC(btn,nInfo,{BackgroundTransparency=0.15,BackgroundColor3=C_HOVER}):Play()
TSC(nStroke,nInfo,{Color=C_ACCENT,Transparency=0.4,Thickness=1}):Play()
TSC(ng,nInfo,{Transparency=0.6}):Play()
TSC(ibs,nInfo,{Transparency=0.4}):Play()
TSC(iconBg,nInfo,{BackgroundTransparency=0.25}):Play()
indicator.Visible=false
icon.tint(C_OFF)
else
TSC(btn,nInfo,{BackgroundTransparency=0.3,BackgroundColor3=C_CARD}):Play()
TSC(nStroke,nInfo,{Color=C_PILL,Transparency=0.5,Thickness=1}):Play()
TSC(ng,nInfo,{Transparency=1}):Play()
TSC(ibs,nInfo,{Transparency=0.7,Thickness=1}):Play()
TSC(iconBg,nInfo,{BackgroundTransparency=0.4}):Play()
indicator.Visible=false
icon.tint(C_DIM)
end
end
btn.MouseEnter:Connect(function()
state.hover=true
paint()
GMUI.uiSound("hover")
end)
btn.MouseLeave:Connect(function()
state.hover=false
paint()
end)
btn.Activated:Connect(function()
if not state.active then
GMUI.uiSound("pop")
end
selectPage(idx)
end)
btn.Parent=holder
if def.hidden then
btn.Visible=false
end
local api={state=state,paint=paint}
navBtns[idx]=api
return api
end
selectPage=function(idx)
for i,b in ipairs(navBtns) do
b.state.active=(i==idx)
b.paint()
if pages[i] then
pages[i].Visible=(i==idx)
end
end
local pg=pages[idx]
if pg then
local psc=pg:FindFirstChild("GM_PagePop")
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
row.Name="Toggle_"..cfg.label
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
lbl.Text=cfg.label
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
row.Activated:Connect(function()
on=not on
paint(true)
GMUI.uiSound(on and "toggleOn" or "toggleOff")
if cfg.onChange then
cfg.onChange(on)
end
end)
row.Parent=parent
return row
end
local function mkSlider(parent,cfg)
local row=INF()
row.Name="Slider_"..cfg.label
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
lbl.Text=cfg.label
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
local fgrad=IN("UIGradient")
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
knob.BackgroundColor3=CR(255,255,255)
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
txt=SFM("%."..tostring(cfg.decimals).."f",v)
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
local now=os.clock()
if now - lastTick>0.045 then
lastTick=now
GMUI.uiSound("slider")
end
end
if cfg.onChange then
cfg.onChange(v)
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
hit.InputBegan:Connect(beginDrag)
bindConn(UserInputService.InputChanged:Connect(function(input)
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
bindConn(UserInputService.InputEnded:Connect(function(input)
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
row.Name="Dropdown_"..cfg.label
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
lbl.Text=cfg.label
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
for opt,l in pairs(optionLbls) do
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
local psc=popup:FindFirstChild("GM_Pop")
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
pill.Activated:Connect(function()
if open then
GMUI.uiSound("toggleOff")
entry.close()
else
GMUI.uiSound("pop")
openPopup()
end
end)
catcher.Activated:Connect(function()
entry.close()
end)
for i,option in ipairs(cfg.options) do
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
ob.MouseEnter:Connect(function()
ob.BackgroundTransparency=0
ob.BackgroundColor3=C_POPUP_HOVER
end)
ob.MouseLeave:Connect(function()
ob.BackgroundTransparency=1
end)
ob.Activated:Connect(function()
GMUI.uiSound("click")
current=option
pill.Text=option
refreshLabels()
entry.close()
if cfg.onChange then
cfg.onChange(option)
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
row.Name="Keybind_"..cfg.label
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
lbl.Text=cfg.label
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
local short=string.gsub(name,"^MouseButton","MB")
short=string.gsub(short,"^XButton1$","MB4")
short=string.gsub(short,"^XButton2$","MB5")
return short
end
pill.TextTruncate=TT.AtEnd
pill.Text=displayName(element.CurrentKeybind)
pill.Activated:Connect(function()
if capturing or listenConn then
return
end
capturing=true
pill.Text="..."
pill.TextColor3=C_DIM
listenConn=UserInputService.InputBegan:Connect(function(input)
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
local function mkButton(parent,cfg)
local btn=ITB()
btn.Name="Button_"..cfg.label
btn.AutoButtonColor=false
btn.Size=U2(1,0,0,cfg.full and BTN_FULL_H or BTN_H)
btn.LayoutOrder=nextRow()
btn.BackgroundColor3=cfg.danger and C_DANGER_BG or C_PILL
btn.BorderSizePixel=0
btn.Font=WIN_FONT_MED
btn.TextSize=12
btn.TextColor3=cfg.danger and C_RED or C_TEXT
btn.TextTruncate=TT.AtEnd
btn.Text=cfg.label
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
btn.MouseEnter:Connect(function()
GMUI.uiSound("hover")
TSC(btn,hInfo,{BackgroundColor3=hoverBg}):Play()
end)
btn.MouseLeave:Connect(function()
TSC(btn,hInfo,{BackgroundColor3=baseBg}):Play()
end)
btn.Activated:Connect(function()
GMUI.uiSound("click")
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
if cfg.onClick then
cfg.onClick()
end
end)
btn.Parent=parent
return btn
end
local function mkInput(parent,ph)
local box=IN("TextBox")
box.Name="Input_"..tostring(ph)
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
local holder=INF()
holder.Name="ListHolder"
holder.BackgroundTransparency=1
holder.Size=U2(1,0,0,0)
holder.AutomaticSize=XA.Y
holder.LayoutOrder=nextRow()
holder.ZIndex=3
local lay=IUL()
lay.Padding=UD(0,4)
lay.SortOrder=XR.LayoutOrder
lay.Parent=holder
holder.Parent=parent
return holder
end
local function clearList(holder)
for _,ch in ipairs(holder:GetChildren()) do
if ch:IsA("GuiButton") then
ch:Destroy()
end
end
end
local function mkTrackRow(parent,text,onClick)
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
b.MouseEnter:Connect(function()
b.BackgroundTransparency=0
b.BackgroundColor3=C_HOVER
GMUI.uiSound("hover")
end)
b.MouseLeave:Connect(function()
b.BackgroundTransparency=1
end)
b.Activated:Connect(function()
GMUI.uiSound("click")
onClick()
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
for i,def in ipairs(NAV_DEFS) do
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
uiDx=tonumber(saved[1]) or 0
uiDy=tonumber(saved[2]) or 0
end
end
local function applyUiPos()
main.Position=U2(0.5,uiDx,0.5,uiDy)
for _,sh in ipairs(shadows) do
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
bindConn(sidebar.InputBegan:Connect(uiHandleDown))
bindConn(sidebar.InputEnded:Connect(uiHandleUp))
bindConn(logo.InputBegan:Connect(uiHandleDown))
bindConn(logo.InputEnded:Connect(uiHandleUp))
bindConn(UserInputService.InputChanged:Connect(function(input)
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
warn("[GM] UI page rejected ("..kind.."): "..tostring(err))
end
return ok
end
safeBuild("HUD",function()
local page=pages[1]
local function mkColorSwatch(parent,cfg)
local row=INF()
row.Name="Swatch_"..cfg.label
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
lbl.Text=cfg.label
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
CR(22,14,36),CR(255,255,255),
CR(167,108,255),CR(120,70,200),
CR(255,94,162),CR(190,90,255),
CR(154,230,180),CR(94,231,133),
CR(72,209,204),CR(80,160,255),
CR(255,170,60),CR(255,120,60),
CR(255,80,80),CR(200,60,60),
CR(90,90,120),CR(50,50,70),
CR(238,235,246),CR(216,208,235),
CR(30,30,40),CR(15,15,25),
CR(40,90,60),CR(140,200,255),
}
local order=0
for _,c in ipairs(SWATCHES) do
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
ob.MouseEnter:Connect(function()
ob.BackgroundTransparency=0.15
end)
ob.MouseLeave:Connect(function()
ob.BackgroundTransparency=0
end)
ob.Activated:Connect(function()
entry.close()
pill.BackgroundColor3=c
cfg.onChange(c)
end)
ob.Parent=popup
end
pill.Activated:Connect(function()
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
local card=mkCard(page,"Keystrokes overlay")
local grid=mkGrid(card)
mkToggle(grid,{
label="Enabled",
init=ctx.getKeyboardOn(),
onChange=ctx.setKeyboard,
})
mkToggle(grid,{
label=gmT("Marca de agua","Watermark"),
init=ctx.getKeyWm(),
onChange=ctx.setKeyWm,
})
mkSlider(card,{
label="Escala",
min=50,
max=150,
step=5,
suffix="%",
init=ctx.getKeyScale(),
onChange=ctx.setKeyScale,
})
mkSlider(card,{
label="Opacidad teclas",
min=20,
max=100,
step=5,
suffix="%",
init=ctx.getKeyOpacity(),
onChange=ctx.setKeyOpacity,
})
mkSlider(card,{
label="Opacidad fondo",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getKeyBgOpacity(),
onChange=ctx.setKeyBgOpacity,
})
mkSlider(card,{
label="Tamano texto",
min=8,
max=20,
step=1,
suffix="px",
init=ctx.getKeyTextSize(),
onChange=ctx.setKeyTextSize,
})
mkButton(card,{
label="Reset overlay position",
full=true,
onClick=ctx.resetOverlayPosition,
})
local cardS=mkCard(page,"Keystrokes estilo")
local customRow
mkDropdown(cardS,{
label="Diseno",
options={"Glass","Minimal","Gotico","Chill"},
init=ctx.getKeyDesign(),
onChange=ctx.setKeyDesign,
})
mkDropdown(cardS,{
label="Colores",
options={"Dark","Purple","Anime","Pastel","Rainbow","Personalizado"},
init=ctx.getKeyColor(),
onChange=function(name)
ctx.setKeyColor(name)
customRow.Visible=SFD(name,"Personalizado",1,true)~=nil
end,
})
mkDropdown(cardS,{
label="Fuente",
options={"Auto","Gotham","Gotico","Bangers","Code","Michroma","Minecraft"},
init=ctx.getKeyFont(),
onChange=ctx.setKeyFont,
})
local gridS=mkGrid(cardS)
mkToggle(gridS,{
label="Fondo visible",
init=ctx.getKeyBg(),
onChange=ctx.setKeyBg,
})
customRow=INF()
customRow.Name="CustomColors"
customRow.BackgroundTransparency=1
customRow.Size=U2(1,0,0,0)
customRow.AutomaticSize=XA.Y
customRow.LayoutOrder=nextRow()
customRow.ZIndex=3
local cLay=IUL()
cLay.Padding=UD(0,CARD_GAP)
cLay.SortOrder=XR.LayoutOrder
cLay.Parent=customRow
customRow.Parent=cardS
customRow.Visible=ctx.getKeyColor()=="Personalizado"
mkColorSwatch(customRow,{
label="Color tecla",
color=ctx.getKeyCustomIdle(),
onChange=ctx.setKeyCustomIdle,
})
mkColorSwatch(customRow,{
label="Color presionada",
color=ctx.getKeyCustomPressed(),
onChange=ctx.setKeyCustomPressed,
})
mkColorSwatch(customRow,{
label="Color texto",
color=ctx.getKeyCustomText(),
onChange=ctx.setKeyCustomText,
})
local card2=mkCard(page,"Dynamic Island")
local grid2=mkGrid(card2)
mkToggle(grid2,{
label=gmT("Mostrar Dynamic Island","Show Dynamic Island"),
init=ctx.getIslandOn(),
onChange=ctx.setIsland,
})
mkDropdown(card2,{
label=gmT("Mostrar en la island","Show on the island"),
options={"Hora","FPS","Ambos"},
init=ctx.getIslandMode(),
onChange=ctx.setIslandMode,
})
end)
safeBuild("Movement",function()
local page=pages[2]
local cardH=mkCard(page,gmT("HUD celular","Mobile HUD"))
local gridH=mkGrid(cardH)
mkToggle(gridH,{
label=gmT("Desbloquear posiciones","Unlock positions"),
init=ctx.getHudUnlocked(),
onChange=ctx.setHudUnlocked,
})
mkSlider(cardH,{
label=gmT("Tamano botones","Button size"),
min=60,
max=140,
step=4,
suffix="px",
init=ctx.getHudSize(),
onChange=ctx.setHudSize,
})
mkSlider(cardH,{
label=gmT("Opacidad botones","Button opacity"),
min=20,
max=100,
step=5,
suffix="%",
init=ctx.getHudOpacity(),
onChange=ctx.setHudOpacity,
})
local card=mkCard(page,"Auto BHOP - once per landing")
local grid=mkGrid(card)
mkToggle(grid,{
label="Enabled",
init=ctx.getBhopOn(),
onChange=ctx.setBhop,
})
mkKeybind(card,{
label="Jump key (hold)",
init=ctx.getBhopKey(),
onBind=ctx.setBhopKeybind,
onSet=ctx.onBhopKeySet,
})
mkSlider(card,{
label="Jump delay",
min=0,
max=200,
step=5,
suffix="ms",
init=ctx.getBhopDelay(),
onChange=ctx.setBhopDelay,
})
mkToggle(grid,{
label=gmT("Boton de Celular","Mobile button"),
init=ctx.getHudBhopOn(),
onChange=ctx.setHudBhopOn,
})
mkDropdown(card,{
label=gmT("Modo del boton","Button mode"),
options={"Mantener","Toggle"},
init=ctx.getHudBhopMode(),
onChange=ctx.setHudBhopMode,
})
local card2=mkCard(page,"Crunch spam")
local grid2=mkGrid(card2)
mkToggle(grid2,{
label="Enabled",
init=ctx.getCrunchOn(),
onChange=ctx.setCrunch,
})
mkKeybind(card2,{
label="Crunch key (hold)",
init=ctx.getCrunchKey(),
onBind=ctx.setCrunchKeybind,
onSet=ctx.onCrunchKeySet,
})
mkSlider(card2,{
label="Hold y gap",
min=10,
max=150,
step=5,
suffix="ms",
init=ctx.getCrunchSpeed(),
onChange=ctx.setCrunchSpeed,
})
mkToggle(grid2,{
label=gmT("Boton de Celular","Mobile button"),
init=ctx.getHudCrunchOn(),
onChange=ctx.setHudCrunchOn,
})
mkDropdown(card2,{
label=gmT("Modo del boton","Button mode"),
options={"Mantener","Toggle"},
init=ctx.getHudCrunchMode(),
onChange=ctx.setHudCrunchMode,
})
local card3=mkCard(page,"Auto Straffer (aire)")
local grid3=mkGrid(card3)
mkToggle(grid3,{
label="Enabled",
init=ctx.getStrafferOn(),
onChange=ctx.setStraffer,
})
mkToggle(grid3,{
label="Invertir (reverse bhop)",
init=ctx.getStrafferInvert(),
onChange=ctx.setStrafferInvert,
})
mkSlider(card3,{
label="Deadzone",
min=0,
max=50,
step=1,
suffix="px",
init=ctx.getStrafferDeadzone(),
onChange=ctx.setStrafferDeadzone,
})
end)
safeBuild("Visuals",function()
local page=pages[3]
local card=mkCard(page,gmT("Modo foto","Screenshot mode"))
mkButton(card,{
label=gmT("Ocultar toda la UI","Hide all UI"),
full=true,
onClick=ctx.toggleScreenshot,
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
label=gmT("Activar crosshair","Enable crosshair"),
init=ctx.getCrosshairOn(),
onChange=ctx.setCrosshairOn,
})
mkDropdown(cardCh,{
label=gmT("Estilo","Style"),
options={"Dot","Cross","Circle","Cross + Dot"},
init=ctx.getCrosshairStyle(),
onChange=ctx.setCrosshairStyle,
})
mkSlider(cardCh,{
label=gmT("Tamano","Size"),
min=2,
max=40,
step=1,
suffix="px",
init=ctx.getCrosshairNum("size"),
onChange=function(v)
ctx.setCrosshairNum("size",v)
end,
})
mkSlider(cardCh,{
label=gmT("Separacion","Gap"),
min=0,
max=24,
step=1,
suffix="px",
init=ctx.getCrosshairNum("gap"),
onChange=function(v)
ctx.setCrosshairNum("gap",v)
end,
})
mkSlider(cardCh,{
label=gmT("Grosor","Thickness"),
min=1,
max=10,
step=1,
suffix="px",
init=ctx.getCrosshairNum("thick"),
onChange=function(v)
ctx.setCrosshairNum("thick",v)
end,
})
mkSlider(cardCh,{
label=gmT("Opacidad","Opacity"),
min=10,
max=100,
step=5,
suffix="%",
init=ctx.getCrosshairNum("opacity"),
onChange=function(v)
ctx.setCrosshairNum("opacity",v)
end,
})
mkSlider(cardCh,{
label=gmT("Posicion X","Position X"),
min=-400,
max=400,
step=2,
suffix="px",
init=ctx.getCrosshairNum("offx"),
onChange=function(v)
ctx.setCrosshairNum("offx",v)
end,
})
mkSlider(cardCh,{
label=gmT("Posicion Y","Position Y"),
min=-400,
max=400,
step=2,
suffix="px",
init=ctx.getCrosshairNum("offy"),
onChange=function(v)
ctx.setCrosshairNum("offy",v)
end,
})
local chPosGrid=mkGrid(cardCh)
mkButton(chPosGrid,{
label=gmT("Centrar","Center"),
onClick=ctx.centerCrosshair,
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
for _,cdef in ipairs(chColors) do
mkButton(chGrid,{
label=cdef[1],
onClick=function()
ctx.setCrosshairColor(cdef[2],cdef[3],cdef[4])
end,
})
end
local cc=ctx.getCrosshairColor() or {167,108,255}
mkSlider(cardCh,{
label=gmT("Color R","Color R"),
min=0,
max=255,
step=5,
init=cc[1] or 167,
onChange=function(v)
ctx.setCrosshairColorPart("r",v)
end,
})
mkSlider(cardCh,{
label=gmT("Color G","Color G"),
min=0,
max=255,
step=5,
init=cc[2] or 108,
onChange=function(v)
ctx.setCrosshairColorPart("g",v)
end,
})
mkSlider(cardCh,{
label=gmT("Color B","Color B"),
min=0,
max=255,
step=5,
init=cc[3] or 255,
onChange=function(v)
ctx.setCrosshairColorPart("b",v)
end,
})
local cardF=mkCard(page,gmT("Fuente de Evade","Evade font"))
mkToggle(cardF,{
label=gmT("Cambiar fuente del juego","Change game font"),
init=ctx.getEvadeFontOn(),
onChange=ctx.setEvadeFontOn,
})
mkDropdown(cardF,{
label=gmT("Fuente","Font"),
options={"Gotham","Gotham Bold","Montserrat","Minecraft","Sci-Fi","Arcade","Fantasy","Code","Highway","Cartoon","Antique"},
init=ctx.getEvadeFontLabel(),
onChange=ctx.setEvadeFontLabel,
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
label="Headless head (local)",
init=ctx.getHeadlessHead(),
onChange=ctx.setHeadlessHead,
})
mkToggle(cardH,{
label="Clear head accessories (local)",
init=ctx.getHeadlessAccs(),
onChange=ctx.setHeadlessAccs,
})
local cardK=mkCard(page,"Korblox - local only")
local gridK=mkGrid(cardK)
mkToggle(gridK,{
label="Korblox legs (local)",
init=ctx.getKorbloxOn(),
onChange=ctx.setKorblox,
})
mkDropdown(cardK,{
label="Which leg",
options={"Left leg","Right leg","Both legs"},
init=ctx.getKorbloxLegLabel(),
onChange=ctx.setKorbloxLeg,
})
local card=mkCard(page,"Emote replacer - stackable")
local grid=mkGrid(card)
mkButton(grid,{
label="Open emote replacer",
onClick=ctx.openEmotePicker,
})
mkButton(grid,{
label="Remove ALL emote mappings",
danger=true,
onClick=ctx.removeAllMappings,
})
local card2=mkCard(page,"Unusuals")
mkButton(card2,{
label="Open unusuals picker",
full=true,
onClick=ctx.openUnusualsPicker,
})
local cardSkin=mkCard(page,gmT("Skin changer","Skin changer"))
local skinBox=mkInput(cardSkin,gmT("Username de Roblox...","Roblox username..."))
local skinStatus
local skinGrid=mkGrid(cardSkin)
mkButton(skinGrid,{
label=gmT("Aplicar skin","Apply skin"),
onClick=function()
if #skinBox.Text==0 then
return
end
skinStatus.Text=gmT("Cargando avatar...","Loading avatar...")
local name=skinBox.Text
ctx.skinApply(name,function(ok,msg)
skinStatus.Text=tostring(msg)
end)
end,
})
mkButton(skinGrid,{
label=gmT("Restaurar mio","Restore mine"),
onClick=function()
ctx.skinRestore(function(ok,msg)
skinStatus.Text=tostring(msg)
end)
end,
})
skinStatus=mkHint(cardSkin," ")
mkHint(cardSkin,gmT(
"Escribe el username de cualquier persona y tu avatar toma su skin. 100% local: el servidor sigue viendo TU avatar. Restaurar devuelve el tuyo exacto.",
"Type anyone's username and your avatar takes their skin. 100% local: the server still sees YOUR avatar. Restore brings yours back exactly."
))
end)
safeBuild("Atmosphere",function()
local page=pages[5]
local card=mkCard(page,"DLSS / Enhancer")
mkToggle(card,{
label="DLSS cinematico",
init=ctx.getGfxOn(),
onChange=ctx.setGfx,
})
mkDropdown(card,{
label="Preset",
options={"Realista","Cinematic","Balanced"},
init=ctx.getGfxPresetLabel(),
onChange=ctx.setGfxPreset,
})
mkToggle(card,{
label="Cielo realista HD",
init=ctx.getSkyOn(),
onChange=ctx.setSky,
})
mkSlider(card,{
label="Reflejos en materiales",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getShiny(),
onChange=ctx.setShiny,
})
mkSlider(card,{
label="Intensidad de Bloom",
min=0,
max=200,
step=10,
suffix="%",
init=ctx.getBloom(),
onChange=ctx.setBloom,
})
mkSlider(card,{
label=gmT("Oscuridad de sombras","Shadow darkness"),
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getShadowDark(),
onChange=ctx.setShadowDark,
})
local card2=mkCard(page,"Color filters")
mkDropdown(card2,{
label="Filter preset",
options={"Off","Natural","Vivid","Cinematic","Nocturne","Sombrio"},
init=ctx.getFilterPreset(),
onChange=ctx.setFilterPreset,
})
mkSlider(card2,{
label="Brightness",
min=-50,
max=50,
step=5,
suffix="%",
init=ctx.getFilterBrightness(),
onChange=function(v)
ctx.setColorValue("brightness",v/100)
end,
})
mkSlider(card2,{
label="Contrast",
min=-50,
max=50,
step=5,
suffix="%",
init=ctx.getFilterContrast(),
onChange=function(v)
ctx.setColorValue("contrast",v/100)
end,
})
mkSlider(card2,{
label="Saturation",
min=-100,
max=100,
step=5,
suffix="%",
init=ctx.getFilterSaturation(),
onChange=function(v)
ctx.setColorValue("saturation",v/100)
end,
})
local card3=mkCard(page,"Time & atmosphere")
mkToggle(card3,{
label="Enable time/atmosphere control",
init=ctx.getTimeOn(),
onChange=ctx.setTime,
})
mkSlider(card3,{
label="Time of day",
min=0,
max=24,
step=0.5,
suffix="h",
decimals=1,
init=ctx.getClock(),
onChange=ctx.setClock,
})
mkSlider(card3,{
label="Atmosphere density",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getDensity(),
onChange=function(v)
ctx.setDensity(v/100)
end,
})
mkSlider(card3,{
label="Atmosphere haze",
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getHaze(),
onChange=function(v)
ctx.setHaze(v/100)
end,
})
local card4=mkCard(page,"by Minwo")
mkButton(card4,{
label="Run self-test report",
full=true,
onClick=ctx.runSelfTest,
})
mkButton(card4,{
label="Unload Ghost Method",
full=true,
danger=true,
onClick=ctx.unload,
})
end)
safeBuild("Spotify",function()
local page=pages[6]
local function renderTrackList(holder,tracks,playFn)
clearList(holder)
for i,tr in ipairs(tracks) do
local label=tostring(i)..". "..tr.title.." - "..tr.artist
if not tr.url then
label=label..gmT(" (sin preview)"," (no preview)")
end
mkTrackRow(holder,label,function()
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
and(gmT("Conectado como: ","Connected as: ")..tostring(accName))
or gmT("Sesion no iniciada","Not logged in"))
local dcBox=mkInput(cardA,"sp_dc ...")
local accGrid=mkGrid(cardA)
mkButton(accGrid,{
label=gmT("Iniciar sesion","Log in"),
onClick=function()
if #dcBox.Text<20 then
accLabel.Text=gmT("Pega el valor sp_dc primero","Paste the sp_dc value first")
return
end
accLabel.Text=gmT("Conectando...","Connecting...")
local dc=dcBox.Text
ctx.spLogin(dc,function(ok,msg)
if ok then
accLabel.Text=gmT("Conectado como: ","Connected as: ")..tostring(msg)
if doRecent then
doRecent()
end
if doMyPlaylists then
doMyPlaylists()
end
else
accLabel.Text=tostring(msg)
end
end)
end,
})
mkButton(accGrid,{
label=gmT("Cerrar sesion","Log out"),
onClick=function()
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
mkButton(playerGrid,{
label=gmT("Pausa / Seguir","Pause / Resume"),
onClick=ctx.spPauseResume,
})
mkButton(playerGrid,{
label=gmT("Parar","Stop"),
onClick=ctx.spStop,
})
mkSlider(cardP,{
label=gmT("Volumen","Volume"),
min=0,
max=100,
step=5,
suffix="%",
init=ctx.getMusicVolume(),
onChange=ctx.spSetVolume,
})
ctx.spSetStateHandler(function(state)
if state and state.playing then
nowLabel.Text="~ "..tostring(state.title).." - "..tostring(state.artist)
elseif state and state.title~="" then
nowLabel.Text=gmT("Pausado: ","Paused: ")..tostring(state.title)
else
nowLabel.Text=gmT("Nada suena todavia","Nothing playing yet")
end
end)
local cardS=mkCard(page,gmT("Buscar en Spotify","Spotify search"))
local searchBox=mkInput(cardS,gmT("Cancion o artista...","Song or artist..."))
local searchStatus
local resultsHolder
mkButton(cardS,{
label=gmT("Buscar canciones","Search songs"),
full=true,
onClick=function()
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
searchStatus.Text=tostring(#tracks)
..gmT(" resultados - toca una cancion"," results - tap a song")
clearList(resultsHolder)
for i,tr in ipairs(tracks) do
local label=tostring(i)..". "..tr.title.." - "..tr.artist
if not tr.url then
label=label..gmT(" (sin preview)"," (no preview)")
end
mkTrackRow(resultsHolder,label,function()
ctx.spPlayResult(i)
end)
end
end)
end,
})
searchStatus=mkHint(cardS," ")
resultsHolder=mkListHolder(cardS)
local cardR=mkCard(page,gmT("Tus recientes","Your recently played"))
mkButton(cardR,{
label=gmT("Cargar recientes","Load recently played"),
full=true,
onClick=function()
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
recentStatus.Text=tostring(#tracks)..gmT(" canciones - toca para escuchar"," songs - tap to hear")
renderTrackList(recentsHolder,tracks,function(i)
ctx.spPlayResult(i)
end)
end)
end
local cardMy=mkCard(page,gmT("Mis playlists","My playlists"))
mkButton(cardMy,{
label=gmT("Cargar mis playlists","Load my playlists"),
full=true,
onClick=function()
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
playlistListStatus.Text=tostring(#lists)..gmT(" playlists - toca una para cargarla"," playlists - tap one to load it")
clearList(playlistsHolder)
for _,pl in ipairs(lists) do
local pid=pl.id
mkTrackRow(playlistsHolder,pl.name,function()
if queueStatus then
queueStatus.Text=gmT("Cargando playlist...","Loading playlist...")
end
ctx.spPlaylist(pid,function(err2,tracks)
if err2 or not queueStatus then
return
end
queueStatus.Text=tostring(#tracks)
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
mkButton(cardL,{
label=gmT("Cargar playlist","Load playlist"),
full=true,
onClick=function()
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
queueStatus.Text=tostring(#tracks)
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
label=gmT("Idioma del script","Script language"),
options={"Espanol","English"},
init=ctx.getLanguageLabel(),
onChange=ctx.setLanguage,
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
label=gmT("Sonidos UI","UI sounds"),
init=ctx.getSoundsOn(),
onChange=ctx.setSoundsOn,
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
mkButton(gridP,{
label=gmT("Cargar Preset A","Load Preset A"),
onClick=function()
ctx.applyPreset("A")
end,
})
mkButton(gridP,{
label=gmT("Guardar en A","Save into A"),
onClick=function()
ctx.savePreset("A")
end,
})
mkButton(gridP,{
label=gmT("Cargar Preset B","Load Preset B"),
onClick=function()
ctx.applyPreset("B")
end,
})
mkButton(gridP,{
label=gmT("Guardar en B","Save into B"),
onClick=function()
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
mkButton(cardM,{
label=gmT("Guardar todo ahora","Save everything now"),
full=true,
onClick=ctx.saveAllNow,
})
mkButton(cardM,{
label=gmT("Restaurar valores de fabrica","Factory reset"),
full=true,
danger=true,
onClick=ctx.factoryReset,
})
end)
local menuOpen=true
local modalBtn=ITB()
modalBtn.Name="ModalLock"
modalBtn.Text=""
modalBtn.AutoButtonColor=false
modalBtn.BackgroundColor3=Color3.new(1,1,1)
modalBtn.BackgroundTransparency=1
modalBtn.Size=UO(1,1)
modalBtn.Position=UO(2,2)
modalBtn.Modal=true
modalBtn.Visible=true
modalBtn.ZIndex=1
modalBtn.Parent=root
local mouseIconWasEnabled=UserInputService.MouseIconEnabled
local function applyCursorState()
QQ(function()
UserInputService.MouseIconEnabled=menuOpen and true or mouseIconWasEnabled
end)
end
applyCursorState()
bindConn(root.Destroying:Connect(function()
QQ(function()
UserInputService.MouseIconEnabled=mouseIconWasEnabled
end)
end))
bindConn(UserInputService.InputBegan:Connect(function(input)
if input.UserInputType~=XU.MouseButton2 then
return
end
if menuOpen then
modalBtn.Visible=false
end
end))
bindConn(UserInputService.InputEnded:Connect(function(input)
if input.UserInputType~=XU.MouseButton2 then
return
end
if menuOpen then
modalBtn.Visible=true
end
end))
local applyPillPos=nil
local function setVisible(state,animate)
if animate then
GMUI.uiSound(state and "open" or "close")
end
menuOpen=state
main.Visible=state
for _,sh in ipairs(shadows) do
sh.Visible=state
end
modalBtn.Visible=state
applyCursorState()
if not state then
closeAllPopups()
elseif animate then
uiScale.Scale=currentFit*0.88
TSC(
uiScale,
TWI(0.26,ESB,ED.Out),
{Scale=currentFit}
):Play()
end
if applyPillPos then
applyPillPos(animate==true)
end
end
bindConn(UserInputService.InputBegan:Connect(function(input)
if root.Parent==nil then
return
end
if input.KeyCode~=XK.X then
return
end
if capturing or UserInputService:GetFocusedTextBox()~=nil then
return
end
setVisible(not menuOpen,true)
end))
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
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
openPill.Activated:Connect(function()
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
GMUI.setIslandActive=function(active)
islandActive=active==true
applyPillPos(true)
end
applyPillPos(false)
end
GMUI.root=root
GMUI.setVisible=setVisible
return root
end
local function buildKeystrokes(env)
local TweenService=env.TweenService
local RunService=env.RunService
local UserInputService=env.UserInputService
local LocalPlayer=env.LocalPlayer
local GuiParent=env.GuiParent
local KS={
scale=1,
opacity=0.9,
bgOpacity=0.9,
design="Glass",
color="Dark",
font="Auto",
textSize=12,
wm=true,
bg=true,
pos=nil,
customIdle={22,14,36},
customPressed={167,108,255},
customText={216,208,235},
}
local DEFAULT_POS=U2(0.14,0,0.62,0)
local DESIGNS={
Glass={
corner=8,
gap=6,
gradient=true,
stroke=1.4,
strokePressed=2.4,
panelCorner=14,
panelGradient=true,
glassStroke=1.5,
font=EF.GothamMedium,
textDelta=0,
},
Minimal={
corner=12,
gap=6,
gradient=false,
stroke=0,
strokePressed=1.6,
panelCorner=12,
panelGradient=false,
glassStroke=1,
font=EF.Gotham,
textDelta=-1,
},
Gotico={
corner=2,
gap=5,
gradient=false,
stroke=1.8,
strokePressed=2.8,
panelCorner=4,
panelGradient=false,
glassStroke=2,
font=EF.GrenzeGotisch,
textDelta=2,
},
Chill={
corner=16,
gap=9,
gradient=true,
stroke=0,
strokePressed=2.2,
panelCorner=18,
panelGradient=true,
glassStroke=1.2,
font=EF.GothamMedium,
textDelta=0,
},
}
local COLORS={
Dark={
idle=CR(22,14,36),
pressed=CR(167,108,255),
stroke=CR(120,80,190),
text=CR(216,208,235),
textPressed=CR(255,255,255),
panel=CR(16,10,26),
panelStroke=CR(88,48,150),
handle=CR(120,70,200),
handleText=CR(255,255,255),
keyGrad=CR(185,175,205),
panelGrad=CR(140,130,165),
},
Purple={
idle=CR(38,22,66),
pressed=CR(198,150,255),
stroke=CR(167,108,255),
text=CR(235,225,255),
textPressed=CR(255,255,255),
panel=CR(24,12,44),
panelStroke=CR(167,108,255),
handle=CR(96,52,180),
handleText=CR(255,255,255),
keyGrad=CR(215,200,240),
panelGrad=CR(150,130,190),
},
Anime={
idle=CR(46,16,54),
pressed=CR(255,94,162),
stroke=CR(190,90,255),
text=CR(255,215,240),
textPressed=CR(255,255,255),
panel=CR(30,8,38),
panelStroke=CR(255,94,162),
handle=CR(160,40,140),
handleText=CR(255,255,255),
keyGrad=CR(230,190,225),
panelGrad=CR(190,150,180),
},
Pastel={
idle=CR(238,235,246),
pressed=CR(154,230,180),
stroke=CR(210,205,235),
text=CR(90,90,120),
textPressed=CR(20,60,45),
panel=CR(245,243,250),
panelStroke=CR(200,195,230),
handle=CR(170,220,190),
handleText=CR(30,80,55),
keyGrad=CR(225,222,236),
panelGrad=CR(228,225,238),
},
}
local FONTS={
Auto=nil,
Gotham=EF.Gotham,
Gotico=EF.GrenzeGotisch,
Bangers=EF.Bangers,
Code=EF.Code,
Michroma=EF.Michroma,
Minecraft=EF.Arcade,
}
local function activeColors()
if KS.color=="Personalizado" then
local i=KS.customIdle
local p=KS.customPressed
local t=KS.customText
return {
idle=CR(i[1],i[2],i[3]),
pressed=CR(p[1],p[2],p[3]),
stroke=CR(
MFL(i[1]*0.8+p[1]*0.2+0.5),
MFL(i[2]*0.8+p[2]*0.2+0.5),
MFL(i[3]*0.8+p[3]*0.2+0.5)
),
text=CR(t[1],t[2],t[3]),
textPressed=CR(255,255,255),
panel=CR(MFL(i[1]*0.6),MFL(i[2]*0.6),MFL(i[3]*0.6)),
panelStroke=CR(i[1],i[2],i[3]),
handle=CR(
MFL(i[1]*0.8+60),
MFL(i[2]*0.8+40),
MFL(i[3]*0.8+90)
),
handleText=CR(255,255,255),
keyGrad=CR(
MFL(i[1]*0.4+153),
MFL(i[2]*0.4+153),
MFL(i[3]*0.4+153)
),
panelGrad=CR(
MFL(i[1]*0.5+100),
MFL(i[2]*0.5+100),
MFL(i[3]*0.5+100)
),
}
end
return COLORS[KS.color] or COLORS.Dark
end
local function keyFont()
local D=DESIGNS[KS.design] or DESIGNS.Glass
local f=FONTS[KS.font]
if f then
return f
end
return D.font
end
local KEY_SIZE=42
local PAD_X=10
local PAD_BOTTOM=10
local function metrics()
local D=DESIGNS[KS.design] or DESIGNS.Glass
local gap=D.gap
local gridW=MFL(6.75*KEY_SIZE+5*gap+0.5)
local gridH=4*KEY_SIZE+3*gap
local padTop=KS.wm and 30 or 6
local panelW=gridW+PAD_X*2
local panelH=gridH+padTop+PAD_BOTTOM
return gap,gridW,gridH,padTop,panelW,panelH
end
local Rows={
{
{"Tab",1.5,XK.Tab},
{"Q",1,XK.Q},
{"W",1,XK.W},
{"E",1,XK.E},
{"R",1,XK.R},
{"T",1,XK.T},
},
{
{"CapsLock",1.75,XK.CapsLock},
{"A",1,XK.A},
{"S",1,XK.S},
{"D",1,XK.D},
{"F",1,XK.F},
{"G",1,XK.G},
},
{
{"Shift",2.25,XK.LeftShift},
{"Z",1,XK.Z},
{"X",1,XK.X},
{"C",1,XK.C},
{"V",1,XK.V},
},
{
{"Ctrl",1.25,XK.LeftControl},
{"Alt",1.25,XK.LeftAlt},
{"Space",4,XK.Space},
},
}
local AlternateCodes={
[XK.LeftShift]=XK.RightShift,
[XK.LeftControl]=XK.RightControl,
[XK.LeftAlt]=XK.RightAlt,
}
local Keys
local overlayGui,overlayRoot,scaleObj,overlayPanel
local Chips={}
local builtKeys=0
local rainbowConn=nil
local function rainbowIdle(chip)
local hue=(tick()*0.10+chip.rowOffset)%1
return Color3.fromHSV(hue,0.55,0.62),Color3.fromHSV(hue,0.7,0.75)
end
local function stopRainbow()
if rainbowConn then
QQ(function()
rainbowConn:Disconnect()
end)
rainbowConn=nil
end
end
local function startRainbow()
if rainbowConn or not Keys or not Keys.enabled then
return
end
rainbowConn=Keys.Scope:Connect(RunService.Heartbeat,function()
if not overlayGui or not overlayRoot then
return
end
local o=KS.opacity
for _,chip in pairs(Chips) do
if not chip.pressed then
local bg,st=rainbowIdle(chip)
chip.frame.BackgroundColor3=bg
chip.frame.BackgroundTransparency=1 -(0.88*o)
if chip.stroke and chip.hasStroke then
chip.stroke.Color=st
end
end
end
end)
end
local function syncRainbow()
if KS.color=="Rainbow" and Keys and Keys.enabled then
startRainbow()
else
stopRainbow()
end
end
local function chipVisual(chip,pressed)
local D=DESIGNS[KS.design] or DESIGNS.Glass
local C=activeColors()
local o=KS.opacity
if pressed then
if KS.color=="Rainbow" then
C={
pressed=CR(250,250,255),
textPressed=CR(20,20,30),
}
end
local bg=C.pressed
local tx=C.textPressed
TSC(
chip.frame,
TWI(0.07,ES.Quad,ED.Out),
{BackgroundColor3=bg,BackgroundTransparency=1 -(0.92*o)}
):Play()
if chip.hasStroke then
TSC(
chip.stroke,
TWI(0.07,ES.Quad,ED.Out),
{Color=bg,Thickness=D.strokePressed,Transparency=1 -(0.95*o)}
):Play()
end
TSC(
chip.label,
TWI(0.07,ES.Quad,ED.Out),
{TextColor3=tx,TextTransparency=1 -(0.95*o)}
):Play()
if chip.popScale then
TSC(
chip.popScale,
TWI(0.07,ES.Quad,ED.Out),
{Scale=0.92}
):Play()
end
else
local bg,tx,st
if KS.color=="Rainbow" then
bg,st=rainbowIdle(chip)
tx=CR(245,245,255)
else
bg=C.idle
tx=C.text
st=C.stroke
end
TSC(
chip.frame,
TWI(0.12,ES.Quad,ED.Out),
{BackgroundColor3=bg,BackgroundTransparency=1 -(0.88*o)}
):Play()
if chip.hasStroke and st then
TSC(
chip.stroke,
TWI(0.12,ES.Quad,ED.Out),
{Color=st,Thickness=D.stroke,Transparency=1 -(0.6*o)}
):Play()
end
TSC(
chip.label,
TWI(0.12,ES.Quad,ED.Out),
{TextColor3=tx,TextTransparency=1 -(0.85*o)}
):Play()
if chip.popScale then
TSC(
chip.popScale,
TWI(0.12,ES.Quad,ED.Out),
{Scale=1}
):Play()
end
end
end
local function setChipPressed(keyCode,pressed)
local chip=Chips[keyCode]
if not chip or chip.pressed==pressed then
return
end
chip.pressed=pressed
chipVisual(chip,pressed)
end
local function repaintChips()
for _,chip in pairs(Chips) do
chipVisual(chip,chip.pressed)
end
end
local function refreshBgOpacity()
if not overlayPanel then
return
end
local bo=KS.bgOpacity
local D=DESIGNS[KS.design] or DESIGNS.Glass
local C=activeColors()
local panelT=KS.bg and(1 -(0.55*bo)) or 1
TSC(
overlayPanel,
TWI(0.12,ES.Quad,ED.Out),
{BackgroundTransparency=panelT,BackgroundColor3=C.panel}
):Play()
if overlayPanel.GlassStroke then
local strokeT=KS.bg and(1 -(0.9*bo)) or 1
TSC(
overlayPanel.GlassStroke,
TWI(0.12,ES.Quad,ED.Out),
{Transparency=strokeT,Color=C.panelStroke,Thickness=D.glassStroke}
):Play()
end
local handle=overlayPanel:FindFirstChild("Handle")
if handle then
TSC(
handle,
TWI(0.12,ES.Quad,ED.Out),
{BackgroundTransparency=1 -(0.45*bo),BackgroundColor3=C.handle}
):Play()
local lbl=handle:FindFirstChild("Label")
if lbl then
TSC(
lbl,
TWI(0.12,ES.Quad,ED.Out),
{TextTransparency=1 -(0.95*bo),TextColor3=C.handleText}
):Play()
end
end
end
local function applyScale()
if scaleObj then
scaleObj.Scale=KS.scale
end
end
local function makeDraggable(handleGui)
local dragging=false
local dragStart,startPos
local endConn
Keys.Scope:Connect(handleGui.InputBegan,function(input)
if input.UserInputType==XU.MouseButton1
or input.UserInputType==XU.Touch
then
dragging=true
dragStart=input.Position
startPos=overlayRoot and overlayRoot.Position or nil
if endConn then
endConn:Disconnect()
end
endConn=Keys.Scope:Connect(input.Changed,function()
if input.UserInputState==Enum.UserInputState.End then
dragging=false
if endConn then
endConn:Disconnect()
endConn=nil
end
if env.onMoved then
env.onMoved()
end
end
end)
end
end)
Keys.Scope:Connect(UserInputService.InputChanged,function(input)
if not dragging or not overlayRoot or not startPos then
return
end
if input.UserInputType==XU.MouseMovement
or input.UserInputType==XU.Touch
then
local delta=input.Position - dragStart
KS.pos=U2(
startPos.X.Scale,startPos.X.Offset+delta.X,
startPos.Y.Scale,startPos.Y.Offset+delta.Y
)
overlayRoot.Position=KS.pos
end
end)
Keys.Scope:AddCleanup(function()
dragging=false
endConn=nil
end)
end
local function makeChip(parent,labelText,x,y,w,h,keyCode,rowIndex)
local D=DESIGNS[KS.design] or DESIGNS.Glass
local C=activeColors()
local frame=INF()
frame.Name="Key_"..labelText
frame.AnchorPoint=VX(0.5,0.5)
frame.Position=UO(x+w/2,y+h/2)
frame.Size=UO(w,h)
frame.BackgroundColor3=C.idle
frame.BackgroundTransparency=1 -(0.88*KS.opacity)
frame.BorderSizePixel=0
frame.Active=false
frame.Selectable=false
frame.Parent=parent
local corner=IUC()
corner.CornerRadius=UD(0,D.corner)
corner.Parent=frame
if D.gradient then
local gradient=IN("UIGradient")
gradient.Rotation=90
gradient.Color=CSN(CR(255,255,255),C.keyGrad)
gradient.Parent=frame
end
local hasStroke=D.stroke>0
local stroke=nil
if hasStroke then
stroke=IUS()
stroke.Name="Stroke"
stroke.Color=C.stroke
stroke.Thickness=D.stroke
stroke.Transparency=1 -(0.6*KS.opacity)
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Parent=frame
end
local label=ITL()
label.Name="Label"
label.BackgroundTransparency=1
label.Size=US(1,1)
label.Font=keyFont()
label.Text=labelText
label.TextSize=math.max(7,KS.textSize+D.textDelta)
label.TextColor3=C.text
label.TextTransparency=1 -(0.85*KS.opacity)
label.Parent=frame
local popScale=IN("UIScale")
popScale.Name="PopScale"
popScale.Scale=1
popScale.Parent=frame
local chip={
frame=frame,
stroke=stroke,
label=label,
popScale=popScale,
pressed=false,
hasStroke=hasStroke,
rowOffset=(rowIndex - 1)*0.08,
}
Chips[keyCode]=chip
local alt=AlternateCodes[keyCode]
if alt then
Chips[alt]=chip
end
builtKeys=builtKeys+1
end
local function buildOverlay(startHidden)
if overlayGui then
return
end
Chips={}
builtKeys=0
local D=DESIGNS[KS.design] or DESIGNS.Glass
local C=activeColors()
local gap,gridW,gridH,padTop,panelW,panelH=metrics()
overlayGui=IN("ScreenGui")
overlayGui.Name="GhostMethod_Keystrokes"
overlayGui.ResetOnSpawn=false
overlayGui.IgnoreGuiInset=true
overlayGui.DisplayOrder=9999
overlayGui.Enabled=not startHidden
Keys.Scope:Track(overlayGui)
overlayRoot=INF()
overlayRoot.Name="Root"
overlayRoot.AnchorPoint=VX(0.5,0.5)
overlayRoot.Position=KS.pos or DEFAULT_POS
overlayRoot.Size=UO(panelW,panelH)
overlayRoot.BackgroundTransparency=1
overlayRoot.Parent=overlayGui
scaleObj=IN("UIScale")
scaleObj.Scale=KS.scale
scaleObj.Parent=overlayRoot
overlayPanel=INF()
overlayPanel.Name="Panel"
overlayPanel.Size=US(1,1)
overlayPanel.BackgroundColor3=C.panel
overlayPanel.BackgroundTransparency=KS.bg and(1 -(0.55*KS.bgOpacity)) or 1
overlayPanel.BorderSizePixel=0
overlayPanel.Parent=overlayRoot
local panelCorner=IUC()
panelCorner.CornerRadius=UD(0,D.panelCorner)
panelCorner.Parent=overlayPanel
if D.panelGradient then
local panelGradient=IN("UIGradient")
panelGradient.Rotation=90
panelGradient.Color=CSN(CR(255,255,255),C.panelGrad)
panelGradient.Parent=overlayPanel
end
local glassStroke=IUS()
glassStroke.Name="GlassStroke"
glassStroke.Color=C.panelStroke
glassStroke.Thickness=D.glassStroke
glassStroke.Transparency=KS.bg and(1 -(0.9*KS.bgOpacity)) or 1
glassStroke.Parent=overlayPanel
if KS.wm then
local handle=INF()
handle.Name="Handle"
handle.AnchorPoint=VX(0.5,0)
handle.Position=U2(0.5,0,0,6)
handle.Size=UO(134,20)
handle.BackgroundColor3=C.handle
handle.BackgroundTransparency=1 -(0.45*KS.bgOpacity)
handle.BorderSizePixel=0
handle.Parent=overlayPanel
local handleCorner=IUC()
handleCorner.CornerRadius=UD(0,D.panelCorner)
handleCorner.Parent=handle
local handleLabel=ITL()
handleLabel.Name="Label"
handleLabel.BackgroundTransparency=1
handleLabel.Size=US(1,1)
handleLabel.Font=EF.GrenzeGotisch
handleLabel.Text="GHOST METHOD"
handleLabel.TextSize=12
handleLabel.TextColor3=C.handleText
handleLabel.TextTransparency=1 -(0.95*KS.bgOpacity)
handleLabel.Parent=handle
makeDraggable(handle)
end
local container=INF()
container.Name="Keys"
container.Position=UO(PAD_X,padTop)
container.Size=UO(gridW,gridH)
container.BackgroundTransparency=1
container.Parent=overlayPanel
for rowIndex,row in ipairs(Rows) do
local y=(rowIndex - 1)*(KEY_SIZE+gap)
local x=0
for _,def in ipairs(row) do
local w=MFL(def[2]*KEY_SIZE+0.5)
makeChip(container,def[1],x,y,w,KEY_SIZE,def[3],rowIndex)
x=x+w+gap
end
end
overlayGui.Parent=GuiParent
makeDraggable(overlayPanel)
syncRainbow()
end
local function rebuild()
if not overlayGui then
return
end
QQ(function()
overlayGui:Destroy()
end)
overlayGui=nil
overlayRoot=nil
scaleObj=nil
overlayPanel=nil
Chips={}
builtKeys=0
stopRainbow()
buildOverlay(false)
end
Keys=env.RegisterModule({
Name="Keystrokes",
enable=function(opts)
local hidden=(type(opts)=="table" and opts.hidden==true)
if Keys.enabled then
return
end
Keys.enabled=true
buildOverlay(hidden)
Keys.Scope:Connect(UserInputService.InputBegan,function(input)
if input.UserInputType==XU.Keyboard then
setChipPressed(input.KeyCode,true)
end
end)
Keys.Scope:Connect(UserInputService.InputEnded,function(input)
if input.UserInputType==XU.Keyboard then
setChipPressed(input.KeyCode,false)
end
end)
Keys.Scope:Connect(UserInputService.WindowFocusReleased,function()
for keyCode in pairs(Chips) do
setChipPressed(keyCode,false)
end
end)
end,
disable=function()
if not Keys.enabled then
return
end
Keys.enabled=false
Keys.Scope:Wipe()
overlayGui=nil
overlayRoot=nil
scaleObj=nil
overlayPanel=nil
Chips={}
builtKeys=0
stopRainbow()
end,
verify=function()
if not overlayGui or overlayGui.Parent==nil then
return false,"overlay ScreenGui not parented"
end
if builtKeys~=20 then
return false,"expected 20 keys (6+6+5+3), built "..tostring(builtKeys)
end
if not scaleObj or not overlayPanel or not overlayRoot then
return false,"overlay structure incomplete"
end
if Keys.Scope:Count()<3 then
return false,"input connections missing"
end
return true
end,
verifyClean=function()
if overlayGui~=nil and overlayGui.Parent~=nil then
return false,"overlay still parented after disable()"
end
if rainbowConn then
return false,"rainbow loop still connected after disable()"
end
if not Keys.Scope:IsClean() then
return false,"scope still holds live connections"
end
return true
end,
})
local API={}
API.enable=function()
Keys.enable()
end
API.disable=function()
Keys.disable()
end
API.setScale=function(v)
KS.scale=v
applyScale()
end
API.setOpacity=function(v)
KS.opacity=v
repaintChips()
end
API.setBgOpacity=function(v)
KS.bgOpacity=v
refreshBgOpacity()
end
API.setTextSize=function(v)
KS.textSize=v
local D=DESIGNS[KS.design] or DESIGNS.Glass
local size=math.max(7,v+D.textDelta)
for _,chip in pairs(Chips) do
chip.label.TextSize=size
end
end
API.setDesign=function(name)
if DESIGNS[name] then
KS.design=name
rebuild()
end
end
API.setColor=function(name)
if name=="Personalizado" or COLORS[name] or name=="Rainbow" then
KS.color=name
if overlayGui then
if name=="Rainbow" then
syncRainbow()
else
stopRainbow()
rebuild()
end
end
end
end
API.setFont=function(name)
if FONTS[name]~=nil or name=="Auto" then
KS.font=name
rebuild()
end
end
API.setWm=function(on)
KS.wm=on==true
rebuild()
end
API.setBg=function(on)
KS.bg=on==true
refreshBgOpacity()
end
API.setCustom=function(idleArr,pressedArr,textArr)
if type(idleArr)=="table" and #idleArr==3 then
KS.customIdle=idleArr
end
if type(pressedArr)=="table" and #pressedArr==3 then
KS.customPressed=pressedArr
end
if type(textArr)=="table" and #textArr==3 then
KS.customText=textArr
end
if KS.color=="Personalizado" and overlayGui then
stopRainbow()
rebuild()
end
end
API.setPos=function(p)
KS.pos=p
if overlayRoot then
overlayRoot.Position=p
end
end
API.getPos=function()
return KS.pos or DEFAULT_POS
end
API.resetPos=function()
KS.pos=DEFAULT_POS
if overlayRoot then
overlayRoot.Position=DEFAULT_POS
end
end
return API
end
local function buildMobileHUD(env)
local TweenService=GGS("TweenService")
local UserInputService=GGS("UserInputService")
local HUD
local gui=nil
local btns={}
local drags={}
local virtual={bhop=false,crunch=false}
local DEFS={
{key="bhop",label="BHOP"},
{key="crunch",label="CRUNCH"},
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
and CR(167,108,255)
or CR(22,14,36),
TextColor3=active
and CR(255,255,255)
or CR(216,208,235),
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
for _,def in ipairs(DEFS) do
local btn=ITB()
btn.Name="GM_HUD_"..def.label
btn.Text=def.label
btn.AutoButtonColor=false
btn.AnchorPoint=VX(0.5,0.5)
btn.BackgroundColor3=CR(22,14,36)
btn.BackgroundTransparency=0.15
btn.BorderSizePixel=0
btn.Font=EF.GothamBold
btn.TextSize=14
btn.TextColor3=CR(216,208,235)
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
btn.InputBegan:Connect(function(input)
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
btn.InputEnded:Connect(function(input)
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
HUD.Scope:Connect(UserInputService.InputChanged,function(input)
if input.UserInputType~=XU.MouseMovement
and input.UserInputType~=XU.Touch then
return
end
for _,def in ipairs(DEFS) do
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
return true
end
local function apply()
local cfg=env.getHudCfg()
local dbg={
os.date("%H:%M:%S ").."apply: bhopOn="..tostring(cfg.bhopOn)
.." crunchOn="..tostring(cfg.crunchOn)
.." size="..tostring(cfg.size)
.." opacity="..tostring(cfg.opacity),
}
if not(cfg.bhopOn or cfg.crunchOn) then
if gui then
gui.Visible=false
end
dbg[#dbg+1]="sin botones: gui "..(gui and "oculto" or "no creado")
QQ(function()
writefile("GM_hud_debug.txt",TCN(dbg,"\n"))
end)
return
end
if not ensureGui() then
dbg[#dbg+1]="ensureGui FALLO"
QQ(function()
writefile("GM_hud_debug.txt",TCN(dbg,"\n"))
end)
return
end
gui.Visible=true
dbg[#dbg+1]="gui: "..tostring(gui:GetFullName()).." visible="..tostring(gui.Visible)
for _,def in ipairs(DEFS) do
local btn=btns[def.key]
local on=cfg[def.key.."On"]==true
btn.Visible=on
if on then
local size=cfg.size
btn.Size=UO(size,size)
btn.TextSize=math.max(11,MFL(size/6))
local op=cfg.opacity/100
btn.BackgroundTransparency=1 -(0.85*op)
btn.TextTransparency=1 -(0.9*op)
local stroke=btn:FindFirstChild("Stroke")
if stroke then
stroke.Transparency=1 -(0.6*op)
stroke.Color=cfg.unlocked
and CR(167,108,255)
or CR(120,80,190)
stroke.Thickness=cfg.unlocked and 2.5 or 1.5
end
local pos=cfg.pos[def.key]
if type(pos)=="table" and #pos==4 then
btn.Position=U2(pos[1],pos[2],pos[3],pos[4])
else
btn.Position=DEFAULT_POS[def.key]
end
task.defer(function()
QQ(function()
dbg[#dbg+1]=def.label..": visible="..tostring(btn.Visible)
.." pos="..tostring(btn.Position)
.." abs="..tostring(btn.AbsolutePosition)
.." size="..tostring(btn.AbsoluteSize)
.." bgT="..tostring(btn.BackgroundTransparency)
end)
QQ(function()
writefile("GM_hud_debug.txt",TCN(dbg,"\n"))
end)
end)
end
end
end
HUD=env.RegisterModule({
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
writefile("GM_hud_debug.txt",os.date("%H:%M:%S ")
.."ENABLE ERROR: "..tostring(errApply))
end)
if env.notify then
env.notify("Ghost Method","HUD celular error: "..tostring(errApply),8)
end
end
end,
disable=function()
if not HUD.enabled then
return
end
HUD.enabled=false
if gui then
gui.Visible=false
end
for _,def in ipairs(DEFS) do
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
verifyClean=function()
if gui and gui.Visible then
return false,"gui still visible after disable()"
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
chGui=IN("ScreenGui")
chGui.Name="GM_Crosshair"
chGui.ResetOnSpawn=false
chGui.IgnoreGuiInset=true
chGui.DisplayOrder=40
chGui.Parent=root
local holder=INF()
holder.Name="Holder"
holder.AnchorPoint=VX(0.5,0.5)
holder.Position=U2(0.5,math.clamp(cfg.offX or 0,-600,600),0.5,math.clamp(cfg.offY or 0,-600,600))
holder.Size=UO((gap+size)*2+8,(gap+size)*2+8)
holder.BackgroundTransparency=1
holder.Parent=chGui
local function mkShape(px,py,w,h)
local f=INF()
f.AnchorPoint=VX(0.5,0.5)
f.Position=UO(px,py)
f.Size=UO(w,h)
f.BackgroundColor3=color
f.BackgroundTransparency=alpha
f.BorderSizePixel=0
f.Parent=holder
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
mkDot(math.max(2,MFL(thick*1.5)))
else
mkArms()
end
end
Crosshair=env.RegisterModule({
Name="Crosshair",
enable=function()
if Crosshair.enabled then
return
end
Crosshair.enabled=true
chDraw()
if not chGui then
Crosshair.enabled=false
env.notify("Ghost Method",gmT("Crosshair: no se pudo crear el overlay","Crosshair: could not create the overlay"),4)
end
end,
disable=function()
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
verifyClean=function()
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
local function fontFromLabel(label)
local map={
["Gotham"]=EF.Gotham,
["Gotham Bold"]=EF.GothamBold,
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
return map[label] or EF.Gotham
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
local pg=lp:FindFirstChild("PlayerGui")
if not pg then
return
end
for _,inst in ipairs(pg:GetDescendants()) do
applyOne(inst,font)
end
end
EvadeFont=env.RegisterModule({
Name="EvadeFont",
enable=function()
if EvadeFont.enabled then
return
end
local lp=env.getLocalPlayer()
if not lp or not lp:FindFirstChild("PlayerGui") then
env.notify("Ghost Method",gmT("No se encontro la UI de Evade todavia.","Evade's UI not found yet."),4)
return
end
EvadeFont.enabled=true
local font=fontFromLabel(env.getCfg().font)
scanAll(font)
local pg=lp:FindFirstChild("PlayerGui")
EvadeFont.Scope:Connect(pg.DescendantAdded,function(inst)
task.defer(function()
if EvadeFont.enabled and inst and inst.Parent then
applyOne(inst,fontFromLabel(env.getCfg().font))
end
end)
end)
end,
disable=function()
if not EvadeFont.enabled then
return
end
EvadeFont.enabled=false
EvadeFont.Scope:Wipe()
for inst,orig in pairs(snaps) do
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
verifyClean=function()
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
writefile("GM_spotify_debug.txt",os.date("%H:%M:%S")
.." ["..tag.."] "
..tostring(text))
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
spDebug("request-fn","fallo: "..tostring(res))
return nil,true
end
local ok2,body=QQ(function()
return game:HttpGet(url)
end)
if ok2 then
return body,false
end
spDebug("httpget","fallo: "..tostring(body))
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
SPX.tokenExp=tonumber(data.accessTokenExpirationTimestampMs) or 0
SPX.isAnonymous=false
spDebug("token","token de USUARIO ok (expira "..tostring(SPX.tokenExp)..")")
return SPX.token
end
spDebug("token-user","cookie sp_dc invalida o anonima: "
..tostring(SSB(tostring(body),1,160)))
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
spDebug("token","no JSON: "..tostring(SSB(body,1,200)))
return nil
end
local tok=data.accessToken
if type(tok)~="string" then
spDebug("token","accessToken no string: "..tostring(tok))
return nil
end
SPX.token=tok
SPX.isAnonymous=true
SPX.tokenExp=tonumber(data.accessTokenExpirationTimestampMs) or(os.time()*1000+1800000)
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
spDebug("api","no JSON: "..tostring(SSB(tostring(body),1,200)))
return nil,"bad-json"
end
if data.error then
spDebug("api","spotify error: "..tostring(data.error.message))
return nil,"spotify: "..tostring(data.error.message)
end
return data,nil
end
local function trackOf(t)
if type(t)~="table" then
return nil
end
local artist=""
if type(t.artists)=="table" and t.artists[1] and t.artists[1].name then
artist=tostring(t.artists[1].name)
end
return {
title=tostring(t.name or "?"),
artist=artist,
url=t.preview_url,
ms=tonumber(t.duration_ms) or 0,
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
env.notify("Spotify",gmT("Esa cancion no tiene preview disponible.","That song has no preview available."),4)
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
s.Ended:Connect(function()
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
Spotify=env.RegisterModule({
Name="Spotify",
enable=function()
if Spotify.enabled then
return
end
Spotify.enabled=true
end,
disable=function()
if not Spotify.enabled then
return
end
Spotify.enabled=false
spStop()
end,
verify=function()
return true
end,
verifyClean=function()
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
for _,t in ipairs(data.tracks.items) do
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
local id=tostring(link or "")
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
for _,it in ipairs(data.items) do
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
SPX.userName=tostring(data.display_name or data.id)
SPX.isAnonymous=false
env.setUserName(SPX.userName)
spDebug("login","OK como "..SPX.userName)
QQ(function()
cb(true,SPX.userName)
end)
else
env.setDc("")
SPX.token=nil
spDebug("login","fallo: "..tostring(err))
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
for _,it in ipairs(data.items) do
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
for _,it in ipairs(data.items) do
if type(it)=="table" and it.id then
out[#out+1]={name=tostring(it.name or "?"),id=tostring(it.id)}
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
for _,it in ipairs(data.items) do
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
local SkinChanger
local SKX={}
SKX.original=nil
SKX.appliedName=nil
local Workspace=GGS("Workspace")
local Players=GGS("Players")
local function humOf(model)
if not model then
return nil
end
return model:FindFirstChildOfClass("Humanoid")
end
local function rigOf()
local lp=env.getLocalPlayer()
if not lp then
return nil
end
local rigs=Workspace:FindFirstChild("Rigs")
if not rigs then
return nil
end
return rigs:FindFirstChild(lp.Name)
end
local function captureBodyColors(char)
if not char then
return nil
end
local colors={}
local bc=char:FindFirstChildOfClass("BodyColors")
if bc then
colors.Head=bc.HeadColor3
colors.Torso=bc.TorsoColor3
colors.LeftArm=bc.LeftArmColor3
colors.RightArm=bc.RightArmColor3
colors.LeftLeg=bc.LeftLegColor3
colors.RightLeg=bc.RightLegColor3
return colors
end
local head=char:FindFirstChild("Head")
if head and head:IsA("BasePart") then
colors.Head=head.Color
end
local torsoNames={"Torso","UpperTorso","LowerTorso"}
for _,tn in ipairs(torsoNames) do
local p=char:FindFirstChild(tn)
if p and p:IsA("BasePart") then
colors.Torso=p.Color
break
end
end
local leftArmNames={"LeftArm","LeftUpperArm"}
for _,an in ipairs(leftArmNames) do
local p=char:FindFirstChild(an)
if p and p:IsA("BasePart") then
colors.LeftArm=p.Color
break
end
end
local rightArmNames={"RightArm","RightUpperArm"}
for _,an in ipairs(rightArmNames) do
local p=char:FindFirstChild(an)
if p and p:IsA("BasePart") then
colors.RightArm=p.Color
break
end
end
local leftLegNames={"LeftLeg","LeftUpperLeg"}
for _,ln in ipairs(leftLegNames) do
local p=char:FindFirstChild(ln)
if p and p:IsA("BasePart") then
colors.LeftLeg=p.Color
break
end
end
local rightLegNames={"RightLeg","RightUpperLeg"}
for _,ln in ipairs(rightLegNames) do
local p=char:FindFirstChild(ln)
if p and p:IsA("BasePart") then
colors.RightLeg=p.Color
break
end
end
if colors.Head then
return colors
end
return nil
end
local function applyBodyColors(char,colors)
if not char or not colors then
return
end
local bc=char:FindFirstChildOfClass("BodyColors")
if bc then
QQ(function()
bc.HeadColor3=colors.Head
bc.TorsoColor3=colors.Torso
bc.LeftArmColor3=colors.LeftArm
bc.RightArmColor3=colors.RightArm
bc.LeftLegColor3=colors.LeftLeg
bc.RightLegColor3=colors.RightLeg
end)
end
local partMap={
Head="Head",
Torso={"Torso","UpperTorso","LowerTorso"},
LeftArm={"LeftArm","LeftUpperArm","LeftLowerArm","LeftHand"},
RightArm={"RightArm","RightUpperArm","RightLowerArm","RightHand"},
LeftLeg={"LeftLeg","LeftUpperLeg","LeftLowerLeg","LeftFoot"},
RightLeg={"RightLeg","RightUpperLeg","RightLowerLeg","RightFoot"},
}
for group,names in pairs(partMap) do
local color=colors[group]
if color then
if type(names)=="string" then
names={names}
end
for _,pn in ipairs(names) do
local part=char:FindFirstChild(pn)
if part and part:IsA("BasePart") then
QQ(function()
part.Color=color
end)
end
end
end
end
end
local function snapshotOriginal()
if SKX.original then
return
end
local lp=env.getLocalPlayer()
local char=lp and lp.Character
local hum=humOf(char)
if hum then
QQ(function()
SKX.original=hum:GetAppliedDescription()
local realColors=captureBodyColors(char)
if realColors then
SKX.original.HeadColor=realColors.Head
SKX.original.TorsoColor=realColors.Torso
SKX.original.LeftArmColor=realColors.LeftArm
SKX.original.RightArmColor=realColors.RightArm
SKX.original.LeftLegColor=realColors.LeftLeg
SKX.original.RightLegColor=realColors.RightLeg
end
SKX.bodyColors=realColors
end)
end
end
local function applyEverywhere(desc)
local applied={}
local lp=env.getLocalPlayer()
if not lp then
return applied
end
local char=lp.Character
local hum=humOf(char)
if hum then
local ok=QQ(function()
hum:ApplyDescription(desc)
end)
if ok then
applied[#applied+1]="character"
end
if desc then
applyBodyColors(char,{
Head=desc.HeadColor,
Torso=desc.TorsoColor,
LeftArm=desc.LeftArmColor,
RightArm=desc.RightArmColor,
LeftLeg=desc.LeftLegColor,
RightLeg=desc.RightLegColor,
})
end
end
local rig=rigOf()
local rhum=humOf(rig)
if rhum then
local ok2=QQ(function()
rhum:ApplyDescription(desc)
end)
if ok2 then
applied[#applied+1]="rig"
end
if desc then
applyBodyColors(rig,{
Head=desc.HeadColor,
Torso=desc.TorsoColor,
LeftArm=desc.LeftArmColor,
RightArm=desc.RightArmColor,
LeftLeg=desc.LeftLegColor,
RightLeg=desc.RightLegColor,
})
end
end
return applied
end
SkinChanger=env.RegisterModule({
Name="SkinChanger",
enable=function()
if SkinChanger.enabled then
return
end
SkinChanger.enabled=true
end,
disable=function()
if not SkinChanger.enabled then
return
end
SkinChanger.enabled=false
if SKX.original then
applyEverywhere(SKX.original)
local lp=env.getLocalPlayer()
if lp and lp.Character and SKX.bodyColors then
applyBodyColors(lp.Character,SKX.bodyColors)
end
local rig=rigOf()
if rig and SKX.bodyColors then
applyBodyColors(rig,SKX.bodyColors)
end
SKX.appliedName=nil
end
end,
verify=function()
return true
end,
verifyClean=function()
return true
end,
})
SKX.apply=function(username,cb)
TSP(function()
if type(username)~="string" or #username==0 then
QQ(function()
cb(false,gmT("Escribe un username primero.","Type a username first."))
end)
return
end
snapshotOriginal()
local lp=env.getLocalPlayer()
local userId=nil
local okU,errU=QQ(function()
userId=Players:GetUserIdFromNameAsync(username)
end)
if not okU or not userId then
QQ(function()
cb(false,gmT("No existe ningun usuario \""..username.."\"","No Roblox user named \""..username.."\""))
end)
return
end
local desc=nil
local okD=QQ(function()
desc=Players:GetHumanoidDescriptionFromUserId(userId)
end)
if not okD or not desc then
QQ(function()
cb(false,gmT("No se pudo cargar el avatar.","Could not load that avatar."))
end)
return
end
local applied=applyEverywhere(desc)
SKX.appliedName=username
if SkinChanger.enabled==false then
SkinChanger.enabled=true
end
local where=TCN(applied," + ")
QQ(function()
cb(true,gmT("Skin de @"..username.." aplicada","Skin from @"..username.." applied")
..(#where>0 and(" ("..where..")") or ""))
end)
end)
end
SKX.restore=function(cb)
TSP(function()
if not SKX.original then
QQ(function()
cb(false,gmT("No habia skin cambiada.","No changed skin to restore."))
end)
return
end
applyEverywhere(SKX.original)
SKX.appliedName=nil
QQ(function()
cb(true,gmT("Tu avatar original esta de vuelta.","Your original avatar is back."))
end)
end)
end
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
return LocalPlayer:WaitForChild("PlayerGui")
end
GuiParent=resolveGuiParent()
markStep("helpers ok")
local fadeSplash
do
local splashLighting=GGS("Lighting")
local function sha256_hex(msg)
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
local ACTIVATION_HOOK=""
local KEY_URL="https://raw.githubusercontent.com/minwokk0/keysGM/main/keys.json"
local GM_OWNERS={Minwo=true,Misshannixa=true}
local p6CheckKey
p6CheckKey=function()
if GM_OWNERS[LocalPlayer.Name] then
GMUI.accessData={expires=os.time()+604800,user=LocalPlayer.Name,key="owner"}
GMUI.accessToken=gmMix(GMUI.accessData.expires,GMUI.accessData.user,GMUI.accessData.key)
return true,"owner"
end
local genv=(type(getgenv)=="function") and getgenv() or _G
local supplied=genv.GM_KEY
if(type(supplied)~="string" or #supplied==0) and isfile and readfile then
QQ(function()
if isfile("GM_key.txt") then
supplied=readfile("GM_key.txt")
end
end)
end
if type(supplied)~="string" or #supplied==0 then
return false,"no key ingresada"
end
supplied=SUP(string.gsub(supplied,"%s",""))
local body=nil
QQ(function()
body=game:HttpGet(KEY_URL.."?cb="..tostring(MFL(os.time()/30)))
end)
if type(body)~="string" or #body==0 then
return false,"no se pudo descargar keys.json"
end
if #(string.gsub(body,"%s",""))==0 then
return false,"keys.json vacio - usa el generador"
end
local ok,data=QQ(function()
return GGS("HttpService"):JSONDecode(body)
end)
if not ok or type(data)~="table" then
return false,"keys.json corrupto"
end
local list=data.keys
if type(list)~="table" then
list=data
end
local suppliedHash=sha256_hex(supplied)
for _,entry in ipairs(list) do
if type(entry)=="table" and type(entry.hash)=="string" then
local eh=SLW(entry.hash)
if eh==suppliedHash then
if entry.active==false then
return false,"key desactivada"
end
local hardExp=tonumber(entry.expires)
if not hardExp or hardExp<=0 then
return false,"key sin expiracion"
end
if os.time()>hardExp then
return false,"key expirada"
end
local bound=entry.user
if type(bound)=="string" and #bound>0 and bound~=LocalPlayer.Name then
return false,"key no es para esta cuenta"
end
local exp=hardExp
local dur=tonumber(entry.duration)
if dur and dur>0 then
local hprefix=SSB(eh,1,12)
local actA=nil
if GMUI.actGet then
actA=tonumber(GMUI.actGet(hprefix))
end
local actB=nil
QQ(function()
local fn="GM_"..hprefix..".dat"
if isfile and readfile and isfile(fn) then
actB=tonumber(SGM(readfile(fn),"^%d+"))
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
writefile("GM_"..hprefix..".dat",
tostring(act).."|"..tostring(gmMix(act,dur,hprefix)))
end
end)
if GMUI.actSave then
GMUI.actSave(hprefix,act)
end
QQ(function()
if #ACTIVATION_HOOK>0 and type(request)=="function" then
request({
Url=ACTIVATION_HOOK,
Method="POST",
Headers={["Content-Type"]="application/json"},
Body=GGS("HttpService"):JSONEncode({
content="Key "..hprefix.." ("..tostring(bound)
..") activada <t:"..tostring(act)..":R>",
}),
})
end
end)
end
local realExp=act+dur
if os.time()>realExp then
return false,"key expirada"
end
exp=realExp
end
local left=exp - os.time()
if left>0 then
local ld=MFL(left/86400)
local lh=MFL((left%86400)/3600)
local lm=MFL((left%3600)/60)
GMUI.keyLeftStr=tostring(ld).."d "
..SFM("%02d",lh).."h "
..SFM("%02d",lm).."m"
end
GMUI.accessData={expires=exp,user=bound,key=supplied}
GMUI.accessToken=gmMix(exp,bound,supplied)
return true,"ok"
end
end
end
return false,"key invalida"
end
local sp=IN("ScreenGui")
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
local boxGrad=IN("UIGradient")
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
title.Font=EF.GrenzeGotisch
title.Text="GHOST METHOD"
title.TextSize=34
title.TextColor3=CR(198,150,255)
title.TextTransparency=1
title.Parent=box
local titleStroke=IUS()
titleStroke.Color=CR(167,108,255)
titleStroke.Thickness=1
titleStroke.Transparency=1
titleStroke.Parent=title
local credit=ITL()
credit.BackgroundTransparency=1
credit.AnchorPoint=VX(0.5,0)
credit.Position=U2(0.5,0,0,66)
credit.Size=UO(300,18)
credit.Font=EF.GothamMedium
credit.Text="by Minwo"
credit.TextSize=14
credit.TextColor3=CR(150,130,180)
credit.TextTransparency=1
credit.Parent=box
local statusDefs={"Cargando","Actualizando","Comprobando","Dentro"}
local statusLabels={}
for i,name in ipairs(statusDefs) do
local lbl=ITL()
lbl.BackgroundTransparency=1
lbl.AnchorPoint=VX(0.5,0)
lbl.Position=U2(0.5,0,0,104+(i - 1)*32)
lbl.Size=UO(340,24)
lbl.Font=EF.GothamMedium
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
task.wait(0.4)
TSC(credit,TWI(0.5),{TextTransparency=0.35}):Play()
task.wait(0.25)
for i,name in ipairs(statusDefs) do
local lbl=statusLabels[i]
lbl.Text=name
TSC(lbl,TWI(0.25),{TextTransparency=0}):Play()
for dots=1,3 do
task.wait(0.18)
lbl.Text=name..SRP(".",dots)
end
if name=="Comprobando" then
local okK,whyK=p6CheckKey()
if not okK then
lbl.Text=name.."...  error: "..tostring(whyK)
lbl.TextColor3=RED
splashFailed=true
splashDone=true
GMUI.keyFailed=true
return
end
end
lbl.Text="*  "..name
lbl.TextColor3=GREEN
task.wait(0.12)
end
splashDone=true
if not splashFailed and GMUI.finalApply then
QQ(GMUI.finalApply)
end
end)
fadeSplash=function()
if sp.Parent==nil then
return
end
TSP(function()
local waited=0
while not splashDone and waited<6 do
task.wait(0.05)
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
for _,d in ipairs(box:GetDescendants()) do
if d:IsA("TextLabel") then
TSC(d,TWI(dur),{TextTransparency=1}):Play()
elseif d:IsA("UIStroke") then
TSC(d,TWI(dur),{Transparency=1}):Play()
end
end
end)
task.wait(0.6)
QQ(function()
blur:Destroy()
end)
QQ(function()
sp:Destroy()
end)
end)
end
end
local Palette={
Accent=CR(167,108,255),
AccentBright=CR(198,150,255),
AccentDeep=CR(120,70,200),
Chip=CR(22,14,36),
KeyStroke=CR(120,80,190),
Panel=CR(16,10,26),
PanelStroke=CR(88,48,150),
TextDim=CR(216,208,235),
TextBright=CR(255,255,255),
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
function Scope:Connect(signal,fn)
local conn=signal:Connect(fn)
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
for _,conn in ipairs(self.Connections) do
if typeof(conn)=="RBXScriptConnection" and conn.Connected then
return false
end
end
return true
end
function Scope:Wipe()
for _,conn in ipairs(self.Connections) do
QQ(function()
if typeof(conn)=="RBXScriptConnection" and conn.Connected then
conn:Disconnect()
end
end)
end
for _,inst in ipairs(self.Instances) do
QQ(function()
if inst and inst.Parent~=nil then
inst:Destroy()
end
end)
end
for _,fn in ipairs(self.Cleanups) do
QQ(fn)
end
self.Connections={}
self.Instances={}
self.Cleanups={}
end
local Modules={}
local function RegisterModule(def)
def.Scope=Scope.new(def.Name)
def.enabled=false
def.lastTestOk=nil
def.lastTestReason=nil
local rawEnable=def.enable
if type(rawEnable)=="function" then
def.enable=function(...)
if not GMUI.accessOk() then
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
toastGui=IN("ScreenGui")
toastGui.Name="GM_Toasts"
toastGui.ResetOnSpawn=false
toastGui.IgnoreGuiInset=true
toastGui.DisplayOrder=1500
toastGui.Parent=GuiParent
GMUI.toasts=toastGui
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
local function notify(title,content,duration)
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
ttl.Font=EF.GothamMedium
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
body.Font=EF.Gotham
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
GMUI.toast=notify
local runSelfTest
local unloadGhost
local onOverlayMoved=nil
local KeysAPI=buildKeystrokes({
RegisterModule=RegisterModule,
TweenService=TweenService,
RunService=RunService,
UserInputService=UserInputService,
GuiParent=GuiParent,
onMoved=function()
onOverlayMoved()
end,
})
markStep("keystrokes defined")
local MOVE={}
local Bhop
local BhopKeybindElement=nil
local function keyNameToEnum(value)
if typeof(value)=="EnumItem" then
return value
end
local ok,enumItem=QQ(function()
return Enum.KeyCode[tostring(value)]
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
local hum=char and char:FindFirstChildOfClass("Humanoid")
if hum
and Bhop.enabled
and hum.FloorMaterial~=Enum.Material.Air
and hum:GetState()~=Enum.HumanoidStateType.Jumping
then
hum:ChangeState(Enum.HumanoidStateType.Jumping)
end
end
Bhop=RegisterModule({
Name="Auto BHOP",
enable=function()
if Bhop.enabled then
return
end
Bhop.enabled=true
keyHeld=false
local function hookCharacter(character)
local humanoid=character:WaitForChild("Humanoid",10)
if not humanoid then
return
end
if not Bhop.enabled then
return
end
Bhop.Scope:Connect(humanoid.StateChanged,function(_,newState)
if newState~=Enum.HumanoidStateType.Landed then
return
end
if not Bhop.enabled or(not keyHeld and not MOVE.bhopVirtual) then
return
end
local delaySec=(MOVE.bhopDelayMs or 0)/1000
if delaySec<=0 then
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
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
if humanoid.FloorMaterial==Enum.Material.Air then
return
end
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
humanoid.Jump=true
end)
end)
end
local character=LocalPlayer.Character
if character then
TSP(hookCharacter,character)
end
Bhop.Scope:Connect(LocalPlayer.CharacterAdded,function(newCharacter)
TSP(hookCharacter,newCharacter)
end)
Bhop.Scope:Connect(UserInputService.InputBegan,function(input,gameProcessed)
if not bindMatches(input,gameProcessed) then
return
end
keyHeld=true
initialPush()
end)
Bhop.Scope:Connect(UserInputService.InputEnded,function(input)
if not bindMatches(input,false) then
return
end
keyHeld=false
end)
end,
disable=function()
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
verifyClean=function()
if Bhop.enabled then
return false,"enabled flag still set after disable()"
end
if not Bhop.Scope:IsClean() then
return false,"humanoid connections still live after disable()"
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
return Enum.KeyCode[tostring(name)]
end)
return ok2 and input.KeyCode==enumItem or false
end
Crunch=RegisterModule({
Name="Crunch spam",
enable=function()
if Crunch.enabled then
return
end
if not ensureVIM() then
notify("Ghost Method",gmT("Crunch spam: tu executor no soporta VirtualInputManager.","Crunch spam: your executor does not support VirtualInputManager."),6)
return
end
Crunch.enabled=true
crunchKeyHeld=false
Crunch.Scope:Connect(UserInputService.InputBegan,function(input,gameProcessed)
if UserInputService:GetFocusedTextBox()~=nil then
return
end
if crunchInputMatches(input,gameProcessed) then
crunchKeyHeld=true
end
end)
Crunch.Scope:Connect(UserInputService.InputEnded,function(input)
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
task.wait(crunchHoldMs/1000)
if not vimKey(false,XK.LeftControl) then
break
end
task.wait(crunchGapMs/1000)
else
task.wait(0.06)
end
end
vimKey(false,XK.LeftControl)
end)
end,
disable=function()
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
verifyClean=function()
if Crunch.enabled then
return false,"enabled flag still set after disable()"
end
if not Crunch.Scope:IsClean() then
return false,"connections still live after disable()"
end
return true
end,
})
MOVE.setCrunch=function(on)
if on then
Crunch.enable()
else
Crunch.disable()
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
local strafeInvert=false
local strafeDeadzone=2
local strafeHeld=0
local strafeLastMove=0
local function strafeSetHeld(dir)
if strafeHeld==dir then
return
end
if strafeHeld==1 then
vimKey(false,D_KEY)
elseif strafeHeld==-1 then
vimKey(false,A_KEY)
end
if dir==1 then
vimKey(true,D_KEY)
elseif dir==-1 then
vimKey(true,A_KEY)
end
strafeHeld=dir
end
Straffer=RegisterModule({
Name="Auto Straffer",
enable=function()
if Straffer.enabled then
return
end
if not ensureVIM() then
notify("Ghost Method","Auto Straffer: tu executor no soporta VirtualInputManager.",6)
return
end
Straffer.enabled=true
strafeHeld=0
Straffer.Scope:Connect(UserInputService.InputChanged,function(input)
if input.UserInputType~=XU.MouseMovement then
return
end
local dx=input.Delta.X
if math.abs(dx)<strafeDeadzone then
return
end
local dir=dx>0 and 1 or -1
if strafeInvert then
dir=-dir
end
strafeSetHeld(dir)
strafeLastMove=os.clock()
end)
Straffer.Scope:Connect(RunService.Heartbeat,function()
if strafeHeld==0 then
return
end
if os.clock() - strafeLastMove>0.12 then
strafeSetHeld(0)
end
end)
end,
disable=function()
if not Straffer.enabled then
return
end
Straffer.enabled=false
strafeSetHeld(0)
Straffer.Scope:Wipe()
end,
verify=function()
if not Straffer.enabled then
return false,"enabled flag not set"
end
if Straffer.Scope:Count()<1 then
return false,"no connections bound"
end
return true
end,
verifyClean=function()
if Straffer.enabled then
return false,"enabled flag still set after disable()"
end
if not Straffer.Scope:IsClean() then
return false,"connections still live after disable()"
end
return true
end,
})
MOVE.setStraffer=function(on)
if on then
Straffer.enable()
else
Straffer.disable()
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
end
local function getRig()
local ok,rig=QQ(function()
local rigs=Workspace:FindFirstChild("Rigs")
if not rigs then
return nil
end
return rigs:FindFirstChild(LocalPlayer.Name)
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
local head=rig:FindFirstChild("Head")
if not head or not head:IsA("BasePart") then
return
end
hidePart(head,headSnaps)
for _,child in ipairs(head:GetChildren()) do
if child:IsA("Decal") or child:IsA("Texture") then
if not headSnaps[child] then
headSnaps[child]={Transparency=child.Transparency}
end
child.Transparency=1
end
end
end
local function restoreHeadless()
for node,snap in pairs(headSnaps) do
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
local head=rig:FindFirstChild("Head")
if not head or not head:IsA("BasePart") then
return
end
for _,acc in ipairs(rig:GetChildren()) do
if acc:IsA("Accessory") then
local handle=acc:FindFirstChild("Handle")
if handle and handle:IsA("BasePart") and not accSnaps[handle] then
local handleAtt=handle:FindFirstChildOfClass("Attachment")
if handleAtt and head:FindFirstChild(handleAtt.Name) then
accSnaps[handle]={Transparency=handle.Transparency}
handle.Transparency=1
end
end
end
end
end
local function restoreAccs()
for handle,snap in pairs(accSnaps) do
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
HeadlessReassertConn=Headless.Scope:Connect(RunService.Heartbeat,function()
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
Headless=RegisterModule({
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
disable=function(opts)
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
if rig and rig:FindFirstChild("Head") then
return false,"head snapshot missing while headless active"
end
end
return true
end,
verifyClean=function()
if headActive or accsActive then
return false,"feature flags still active after disable()"
end
if next(headSnaps)~=nil or next(accSnaps)~=nil then
return false,"snapshots not restored after disable()"
end
if HeadlessReassertConn then
return false,"re-assert loop still connected after disable()"
end
return true
end,
})
markStep("headless defined")
local Korblox
local KORBLOX_LEG_CHOICE="Right"
local korbloxApplied=false
local rightMeshSnap=nil
local rightMeshInstance=nil
local rightMeshApplied=false
local leftPartSnap=nil
local leftApplied=false
local leftCreated={}
local KorbloxReassertConn=nil
local KorbloxReassertClock=0
local function destroyLeftCreated()
for _,inst in ipairs(leftCreated) do
QQ(function()
if inst and inst.Parent~=nil then
inst:Destroy()
end
end)
end
leftCreated={}
end
local function applyRightLeg(rig)
local rightLeg=rig:FindFirstChild("Right Leg")
if not rightLeg or not rightLeg:IsA("BasePart") then
return
end
for _,child in ipairs(rig:GetChildren()) do
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
rightMeshInstance=mesh
rightMeshApplied=true
end
local function restoreRightLeg(rig)
if rightMeshInstance then
QQ(function()
if rightMeshInstance.Parent~=nil then
rightMeshInstance:Destroy()
end
end)
end
rightMeshInstance=nil
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
local leftLeg=rig:FindFirstChild("Left Leg")
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
for _,obj in ipairs(loaded) do
local pool={}
if obj:IsA("MeshPart") then
TBI(pool,obj)
end
for _,desc in ipairs(obj:GetDescendants()) do
if desc:IsA("MeshPart") then
TBI(pool,desc)
end
end
for _,node in ipairs(pool) do
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
local upperKnee=upper:FindFirstChild("LeftKneeRigAttachment")
local lowerKnee=lower:FindFirstChild("LeftKneeRigAttachment")
local kneeWeld=IN("Weld")
kneeWeld.Name="GM_KorbloxKneeWeld"
kneeWeld.Part0=upper
kneeWeld.Part1=lower
if upperKnee and lowerKnee then
kneeWeld.C0=upperKnee.CFrame
kneeWeld.C1=lowerKnee.CFrame
else
kneeWeld.C0=CFrame.new(0,-(upper.Size.Y/2),0)
kneeWeld.C1=CFrame.new(0,(lower.Size.Y/2),0)
end
kneeWeld.Parent=upper
TBI(leftCreated,kneeWeld)
local hipWeld=IN("Weld")
hipWeld.Name="GM_KorbloxHipWeld"
hipWeld.Part0=leftLeg
hipWeld.Part1=upper
local hipAtt=upper:FindFirstChild("LeftHipRigAttachment")
if hipAtt then
hipWeld.C0=CFrame.new(0,0.8,0)*hipAtt.CFrame:Inverse()
else
hipWeld.C0=CFrame.new(0,0.8,0)
end
hipWeld.C1=CFrame.new()
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
local leftLeg=rig and rig:FindFirstChild("Left Leg")
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
local label=option
if type(option)=="table" then
label=option[1]
end
label=tostring(label or "")
if SFD(label,"Both",1,true) then
return "Both"
end
if SFD(label,"Left",1,true) then
return "Left"
end
if SFD(label,"Right",1,true) then
return "Right"
end
return nil
end
local function startKorbloxReassert()
if KorbloxReassertConn then
return
end
KorbloxReassertClock=0
KorbloxReassertConn=Korblox.Scope:Connect(RunService.Heartbeat,function()
KorbloxReassertClock=KorbloxReassertClock+1
if KorbloxReassertClock<30 then
return
end
KorbloxReassertClock=0
local rig=getRig()
if not rig then
return
end
if rightMeshInstance and rightMeshInstance.Parent==nil then
rightMeshInstance=nil
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
Korblox=RegisterModule({
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
disable=function()
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
verifyClean=function()
if korbloxApplied or Korblox.enabled then
return false,"enabled/applied flag still set after disable()"
end
if KorbloxReassertConn then
return false,"re-assert loop still connected after disable()"
end
if next(leftCreated)~=nil then
return false,"created leg instances still tracked after disable()"
end
if rightMeshInstance~=nil then
return false,"our CharacterMesh still tracked after disable()"
end
return true
end,
})
markStep("korblox defined")
local ReplicatedStorage=GGS("ReplicatedStorage")
local Catalog={emotes={},emoteByName={},unusuals={},unusualByName={}}
local gmSaveConfig
local previewing=false
local previewTrack=nil
local function phase3ExtractId(uri)
if type(uri)~="string" then
return nil
end
local id=SGM(uri,"%d+")
return id and tonumber(id) or nil
end
local function resolveEmoteAnim(folder)
local anims=folder:FindFirstChild("Animations")
if anims then
local r6=anims:FindFirstChild("R6")
if r6 then
local a=r6:FindFirstChild("Animation")
if a and a:IsA("Animation") and a.AnimationId~="" then
return a
end
end
local r15=anims:FindFirstChild("R15")
if r15 then
local a=r15:FindFirstChild("Animation")
if a and a:IsA("Animation") and a.AnimationId~="" then
return a
end
end
end
for _,n in ipairs({
"AnimationClassic",
"AnimationR6",
"Animation",
"AnimationLEGACY",
"AnimationClassic_Walkable",
"Animation_Walkable",
}) do
local a=folder:FindFirstChild(n)
if a and a:IsA("Animation") and a.AnimationId~="" then
return a
end
end
for _,c in ipairs(folder:GetChildren()) do
if c:IsA("Animation") and c.AnimationId~="" then
return c
end
end
local best,bestScore=nil,-999
for _,d in ipairs(folder:GetDescendants()) do
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
local function buildPhase3Catalogs()
local items=ReplicatedStorage:FindFirstChild("Items")
if not items then
return
end
local all=items:GetDescendants()
for _,d in ipairs(all) do
if d.Name=="Emotes" or d.Name=="Emote" then
for _,f in ipairs(d:GetChildren()) do
local anim=resolveEmoteAnim(f)
local id=anim and phase3ExtractId(anim.AnimationId)
if id and not Catalog.emoteByName[f.Name] then
local e={name=f.Name,id=id,template=f}
TBI(Catalog.emotes,e)
Catalog.emoteByName[e.name]=e
end
end
elseif d.Name:lower():find("unusual") and #d:GetChildren()>0 then
for _,tpl in ipairs(d:GetChildren()) do
if not Catalog.unusualByName[tpl.Name] then
local cc=tpl:FindFirstChild("CharacterClassic")
or tpl:FindFirstChild("Character")
or tpl:FindFirstChild("CharacterOLD")
if cc then
local u={name=tpl.Name,template=tpl}
TBI(Catalog.unusuals,u)
Catalog.unusualByName[u.name]=u
end
end
end
end
end
for _,d in ipairs(all) do
if d.Name=="CharacterClassic" or d.Name=="Character" or d.Name=="CharacterOLD" then
local tpl=d.Parent
if tpl and not Catalog.unusualByName[tpl.Name] then
for _,fx in ipairs(d:GetDescendants()) do
if fx:IsA("ParticleEmitter") or fx:IsA("Beam") or fx:IsA("Trail") then
local u={name=tpl.Name,template=tpl}
TBI(Catalog.unusuals,u)
Catalog.unusualByName[u.name]=u
break
end
end
end
end
end
print("[GM] catalogs: "..#Catalog.emotes.." emotes, "..#Catalog.unusuals.." unusuals")
end
buildPhase3Catalogs()
TDL(25,function()
QQ(buildPhase3Catalogs)
end)
TDL(70,function()
QQ(buildPhase3Catalogs)
end)
markStep("phase 3 catalogs")
local EmoteReplacer
local swaps={}
local activeMappings={}
local mappingBySource={}
local propInsts={}
local propOwner=nil
local emoteHookConn=nil
local function emoteFolderOf(animInst)
local node=animInst
while node and node.Parent do
if node.Parent.Name=="Emotes" then
return node
end
node=node.Parent
end
return nil
end
local function swapFolderTo(folder,newId)
local n=0
for _,d in ipairs(folder:GetDescendants()) do
if d:IsA("Animation") and d.AnimationId~="" and swaps[d]==nil then
swaps[d]=d.AnimationId
d.AnimationId="rbxassetid://"..newId
n=n+1
end
end
return n
end
local function unswapFolder(folder)
for _,d in ipairs(folder:GetDescendants()) do
if d:IsA("Animation") and swaps[d]~=nil then
QQ(function()
d.AnimationId=swaps[d]
end)
swaps[d]=nil
end
end
end
local function restoreAllSwaps()
for inst,oldId in pairs(swaps) do
QQ(function()
inst.AnimationId=oldId
end)
end
swaps={}
end
local function destroyProp()
for _,inst in ipairs(propInsts) do
QQ(function()
inst:Destroy()
end)
end
propInsts={}
propOwner=nil
end
local function ensurePropFor(toEntry)
if not toEntry then
return
end
if propOwner==toEntry.name and #propInsts>0 then
return
end
destroyProp()
local rig=getRig()
if not rig then
return
end
local classic=toEntry.template:FindFirstChild("CharacterClassic")
or toEntry.template:FindFirstChild("Character")
if not classic then
for _,d in ipairs(toEntry.template:GetDescendants()) do
if d.Name=="CharacterClassic" then
classic=d
break
end
end
if not classic then
for _,d in ipairs(toEntry.template:GetDescendants()) do
if d.Name=="Character" then
classic=d
break
end
end
end
end
if not classic then
print("[GM] element: '"..toEntry.name.."' has no Character/CharacterClassic model")
notify("Ghost Method","Element '"..toEntry.name.."': no character model in template",6)
return
end
local em=classic:FindFirstChild("EmoteModel")
if not em then
for _,c in ipairs(classic:GetChildren()) do
if c:IsA("Model") then
em=c
print("[GM] element: using model '"..c.Name.."' (no EmoteModel in template)")
break
end
end
end
if not em then
print("[GM] element: '"..toEntry.name.."' has no prop model")
notify("Ghost Method","Element '"..toEntry.name.."': no prop model in template",6)
return
end
local part0Names={}
for _,d in ipairs(em:GetDescendants()) do
if(d:IsA("Motor6D") or d:IsA("Weld")) and d.Part0 then
part0Names[d.Name]=d.Part0.Name
end
end
local clone=em:Clone()
for _,d in ipairs(clone:GetDescendants()) do
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
for _,d in ipairs(clone:GetChildren()) do
if(d:IsA("Motor6D") or d:IsA("Weld")) and d.Part0 and d.Part0.Parent==classic then
if d.Part0.Name=="HumanoidRootPart" then
if puppetPrimary then
d.Part0=puppetPrimary
joined=joined+1
else
d:Destroy()
end
else
local host=rig:FindFirstChild(d.Part0.Name)
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
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("BasePart") and(not biggest or d.Size.Magnitude>biggest.Size.Magnitude) then
biggest=d
end
end
local torso=rig:FindFirstChild("Torso")
if biggest and torso then
local wc=IN("WeldConstraint")
wc.Part0=torso
wc.Part1=biggest
wc.Parent=biggest
end
end
local anims={}
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("Animation") and d.AnimationId~="" then
TBI(anims,d)
end
end
if #anims>0 then
local ac=clone:FindFirstChildOfClass("AnimationController")
if not ac then
ac=IN("AnimationController")
ac.Parent=clone
end
for _,a in ipairs(anims) do
QQ(function()
local t=ac:LoadAnimation(a)
t.Looped=true
t:Play()
end)
end
end
clone.Parent=rig
TBI(propInsts,clone)
propOwner=toEntry.name
print("[GM] element '"..toEntry.name.."' attached ("..joined.." joints)")
local fxCount=0
for _,part in ipairs(classic:GetChildren()) do
if part:IsA("BasePart") then
local targetPart=rig:FindFirstChild(part.Name)
if targetPart then
for _,child in ipairs(part:GetChildren()) do
if child~=em and(child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart")) then
local hasEffect=false
for _,fx in ipairs(child:GetDescendants()) do
if fx:IsA("ParticleEmitter") or fx:IsA("Beam") or fx:IsA("Trail") then
hasEffect=true
break
end
end
if hasEffect then
local fxClone=child:Clone()
fxClone.Parent=targetPart
if fxClone:IsA("BasePart") then
fxClone.CanCollide=false
fxClone.Massless=true
local w=IN("WeldConstraint")
w.Part0=targetPart
w.Part1=fxClone
w.Parent=fxClone
end
TBI(propInsts,fxClone)
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
local lines={os.date("%H:%M:%S").." prop '"..toEntry.name.."' diagnostics:"}
TBI(lines,"  em = "..em:GetFullName())
for name,host in pairs(part0Names) do
TBI(lines,"  part0Names['"..name.."'] = "..tostring(host))
end
for _,d in ipairs(em:GetDescendants()) do
if d:IsA("Motor6D") or d:IsA("Weld") then
TBI(lines,SFM("  TPL  joint '%s' [%s] Part0=%s Part1=%s",
d.Name,d.ClassName,
d.Part0 and d.Part0.Name or "nil",
d.Part1 and d.Part1.Name or "nil"))
end
end
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("Motor6D") or d:IsA("Weld") then
TBI(lines,SFM("  CLONE joint '%s' [%s] Part0=%s Part1=%s",
d.Name,d.ClassName,
d.Part0 and d.Part0.Name or "nil",
d.Part1 and d.Part1.Name or "nil"))
end
end
TBI(lines,"  joined="..joined)
writefile("GM_prop_joints.txt",TCN(lines,"\n"))
end)
end
local emoteSwapToken=0
local function hideModelTree(model)
for _,d in ipairs(model:GetDescendants()) do
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
local function sourcePropName(m)
local c=m.from.template:FindFirstChild("CharacterClassic")
or m.from.template:FindFirstChild("Character")
if not c then
for _,d in ipairs(m.from.template:GetDescendants()) do
if d.Name=="CharacterClassic" or d.Name=="Character" then
c=d
break
end
end
end
if not c then
return nil
end
local em=c:FindFirstChild("EmoteModel")
if not em then
for _,ch in ipairs(c:GetChildren()) do
if ch:IsA("Model") then
em=ch
break
end
end
end
return em and em.Name or nil
end
local function isOurProp(inst)
for _,p in ipairs(propInsts) do
if p==inst then
return true
end
end
return false
end
local function hideSourceProps(m)
local rig=getRig()
if not rig then
return
end
local srcName=sourcePropName(m)
if not srcName then
return
end
emoteSwapToken=emoteSwapToken+1
local token=emoteSwapToken
for _,ch in ipairs(rig:GetChildren()) do
if ch.Name==srcName and not isOurProp(ch) then
hideModelTree(ch)
end
end
local conn
conn=rig.ChildAdded:Connect(function(child)
if emoteSwapToken~=token then
conn:Disconnect()
return
end
if child.Name==srcName and not isOurProp(child) then
hideModelTree(child)
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
local function swapSourceSound(m)
local targetSound=nil
local targetLooped=nil
QQ(function()
local cfg=require(m.to.template)
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
local function addFrom(holder,label)
QQ(function()
if holder and holder.PrimaryPart then
local sp=holder.PrimaryPart:FindFirstChild("SoundPos")
if sp then
res[#res+1]=sp
dbg[#dbg+1]="soundPos "..label..": "..sp:GetFullName()
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
snd.SoundId="rbxassetid://"..tostring(targetSound)
if targetLooped~=nil then
snd.Looped=targetLooped
end
snd:Play()
dbg[#dbg+1]="FIXED -> id "..tostring(targetSound)
else
snd.Volume=0
dbg[#dbg+1]="MUTED (target sin musica)"
end
end)
end
local function tryFixAll()
for _,sp in ipairs(collectSoundPos()) do
local snd=sp:FindFirstChild("EmoteSound")
if snd and snd:IsA("Sound") and not fixedSet[snd] then
fixedSet[snd]=true
local desired="rbxassetid://"..tostring(targetSound)
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
dbg[#dbg+1]=os.date("%H:%M:%S").." swapSourceSound '"..m.to.name
.."' targetSound="..tostring(targetSound)
.." targetLooped="..tostring(targetLooped)
tryFixAll()
local myToken=emoteSwapToken
local t0=tick()
while tick() - t0<3 and emoteSwapToken==myToken do
tryFixAll()
task.wait(0.1)
end
dbg[#dbg+1]="fixed instances: "..fixedCount
..(emoteSwapToken~=myToken and " (cancelado por un emote mas nuevo)" or "")
QQ(function()
writefile("GM_sound_log.txt",TCN(dbg,"\n"))
end)
end
local function anyEmoteTrackPlaying()
local rig=getRig()
local hum=rig and rig:FindFirstChildOfClass("Humanoid")
local an=hum and hum:FindFirstChildOfClass("Animator")
if not an then
return false
end
for _,t in ipairs(an:GetPlayingAnimationTracks()) do
if t.Animation and emoteFolderOf(t.Animation) then
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
local hum=rig:FindFirstChildOfClass("Humanoid")
local animator=hum and hum:FindFirstChildOfClass("Animator")
if not animator then
return
end
if emoteHookConn then
emoteHookConn:Disconnect()
end
emoteHookConn=animator.AnimationPlayed:Connect(function(track)
if not EmoteReplacer.enabled or #activeMappings==0 then
return
end
local anim=track.Animation
if not anim then
return
end
local folder=emoteFolderOf(anim)
if not folder then
return
end
local m=mappingBySource[folder.Name]
if not m then
return
end
local id=phase3ExtractId(anim.AnimationId)
if id==m.to.id then
emoteSwapToken=emoteSwapToken+1
local ok,err=QQ(ensurePropFor,m.to)
QQ(function()
writefile("GM_prop_log.txt",os.date("%H:%M:%S")
.." prop call for '"..m.to.name.."' ok="..tostring(ok)
..(ok and "" or(" err="..tostring(err)))
.." | propInsts="..#propInsts
.." | propOwner="..tostring(propOwner))
end)
if not ok then
notify("Ghost Method","Element error ("..m.to.name.."): "..tostring(err),8)
end
QQ(hideSourceProps,m)
QQ(swapSourceSound,m)
end
end)
end
local function p3SetMapping(fromE,toE)
if not fromE or not toE or fromE.name==toE.name then
return false
end
local existing=mappingBySource[fromE.name]
if existing then
QQ(function()
unswapFolder(fromE.template)
end)
existing.to=toE
else
local m={from=fromE,to=toE}
TBI(activeMappings,m)
mappingBySource[fromE.name]=m
end
if EmoteReplacer.enabled then
QQ(function()
swapFolderTo(fromE.template,toE.id)
end)
end
if gmSaveConfig then
gmSaveConfig()
end
print("[GM] mapping: "..fromE.name.." -> "..toE.name)
return true
end
local function p3RemoveMapping(fromName)
local m=mappingBySource[fromName]
if not m then
return false
end
QQ(function()
unswapFolder(m.from.template)
end)
mappingBySource[fromName]=nil
for i,mm in ipairs(activeMappings) do
if mm==m then
table.remove(activeMappings,i)
break
end
end
if propOwner==m.to.name then
destroyProp()
end
if gmSaveConfig then
gmSaveConfig()
end
print("[GM] mapping removed: "..fromName)
return true
end
local function p3RemoveAllMappings()
local names={}
for name in pairs(mappingBySource) do
TBI(names,name)
end
for _,name in ipairs(names) do
p3RemoveMapping(name)
end
end
EmoteReplacer=RegisterModule({
Name="Emote Replacer",
enable=function()
if EmoteReplacer.enabled then
return
end
EmoteReplacer.enabled=true
for _,m in ipairs(activeMappings) do
QQ(function()
swapFolderTo(m.from.template,m.to.id)
end)
end
hookEmoteAnimator()
EmoteReplacer.Scope:Connect(RunService.Heartbeat,function()
if not emoteHookConn or not emoteHookConn.Connected then
hookEmoteAnimator()
end
if #propInsts>0 and not previewing and not anyEmoteTrackPlaying() then
destroyProp()
end
end)
end,
disable=function()
if not EmoteReplacer.enabled then
return
end
EmoteReplacer.enabled=false
restoreAllSwaps()
destroyProp()
if emoteHookConn then
emoteHookConn:Disconnect()
emoteHookConn=nil
end
EmoteReplacer.Scope:Wipe()
end,
verify=function()
if #activeMappings==0 then
return true
end
if not EmoteReplacer.enabled then
return false,"mappings exist but module disabled"
end
if next(swaps)==nil then
return false,"mappings exist but no template swaps applied"
end
return true
end,
verifyClean=function()
if next(swaps)~=nil then
return false,"template swaps not restored after disable()"
end
if #propInsts>0 then
return false,"element instances still alive after disable()"
end
if emoteHookConn then
return false,"emote hook still connected after disable()"
end
return true
end,
})
local Unusuals
local appliedUnusual={}
local activeUnusual=nil
local function removeUnusualNow()
for _,inst in ipairs(appliedUnusual) do
QQ(function()
inst:Destroy()
end)
end
appliedUnusual={}
end
local function applyUnusualNow(name)
local rig=getRig()
local u=Catalog.unusualByName[name]
if not rig or not u then
return false
end
removeUnusualNow()
local cc=u.template:FindFirstChild("CharacterClassic")
or u.template:FindFirstChild("Character")
or u.template:FindFirstChild("CharacterOLD")
if not cc then
return false
end
local n=0
for _,part in ipairs(cc:GetChildren()) do
if part:IsA("BasePart") then
local targetPart=rig:FindFirstChild(part.Name)
if targetPart then
for _,child in ipairs(part:GetChildren()) do
if child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart") then
local clone=child:Clone()
clone.Parent=targetPart
if clone:IsA("BasePart") then
clone.CanCollide=false
clone.Massless=true
local w=IN("WeldConstraint")
w.Part0=targetPart
w.Part1=clone
w.Parent=clone
end
TBI(appliedUnusual,clone)
n=n+1
end
end
end
end
end
activeUnusual=name
print("[GM] unusual '"..name.."' applied: "..n.." anchors")
if gmSaveConfig and n>0 then
gmSaveConfig()
end
return n>0
end
Unusuals=RegisterModule({
Name="Unusuals",
enable=function()
if Unusuals.enabled then
return
end
Unusuals.enabled=true
if activeUnusual then
applyUnusualNow(activeUnusual)
end
Unusuals.Scope:Connect(RunService.Heartbeat,function()
if activeUnusual and #appliedUnusual==0 then
applyUnusualNow(activeUnusual)
end
end)
end,
disable=function()
if not Unusuals.enabled then
return
end
Unusuals.enabled=false
removeUnusualNow()
Unusuals.Scope:Wipe()
end,
verify=function()
if not activeUnusual then
return true
end
if not Unusuals.enabled then
return false,"unusual selected but module disabled"
end
return true
end,
verifyClean=function()
if #appliedUnusual>0 then
return false,"unusual instances still alive after disable()"
end
return true
end,
})
markStep("phase 3 defined")
local function p3DestroyGui(name)
local old=GuiParent:FindFirstChild(name)
if old then
QQ(function()
old:Destroy()
end)
end
end
local TOUCH=UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local P3_ROW_H=TOUCH and 38 or 28
local P3_SEARCH_H=TOUCH and 36 or 28
local P3_CLOSE_D=TOUCH and 40 or 30
local function p3MakePicker(guiName,title,width,height)
p3DestroyGui(guiName)
local gui=IN("ScreenGui")
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
local grad=IN("UIGradient")
grad.Rotation=115
grad.Color=CSN(CR(30,20,48),CR(12,8,20))
grad.Parent=panel
local stroke=IUS()
stroke.Color=Palette.PanelStroke
stroke.Thickness=1.5
stroke.Transparency=0.15
stroke.Parent=panel
local header=ITL()
header.BackgroundTransparency=1
header.Size=U2(1,-100,0,44)
header.Position=U2(0,22,0,8)
header.Font=EF.GothamBold
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
closeBtn.Font=EF.GothamBold
closeBtn.Text="X"
closeBtn.TextSize=TOUCH and 16 or 14
closeBtn.TextColor3=Palette.TextBright
local cCorner=IUC()
cCorner.CornerRadius=UD(1,0)
cCorner.Parent=closeBtn
closeBtn.Parent=panel
closeBtn.Activated:Connect(function()
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
local s=math.min((vp.X - 24)/width,(vp.Y - 24)/height,1)
if s<0.42 then
s=0.42
end
uiScale.Scale=s
end
fit()
uiScale.Parent=panel
local cam=Workspace.CurrentCamera
if cam then
fitConn=cam:GetPropertyChangedSignal("ViewportSize"):Connect(fit)
end
gui.Destroying:Connect(function()
if fitConn then
fitConn:Disconnect()
end
end)
return {gui=gui,panel=panel}
end
local function p3MakeSearch(parent,posX,posY,width)
local box=IN("TextBox")
box.Size=UO(width,P3_SEARCH_H)
box.Position=UO(posX,posY)
box.BackgroundColor3=Palette.AccentDeep
box.BackgroundTransparency=0.75
box.Font=EF.Gotham
box.PlaceholderText="Search..."
box.Text=""
box.TextSize=TOUCH and 14 or 13
box.TextColor3=Palette.TextBright
box.ClearTextOnFocus=false
local corner=IUC()
corner.CornerRadius=UD(0,10)
corner.Parent=box
local stroke=IUS()
stroke.Color=Palette.PanelStroke
stroke.Transparency=0.5
stroke.Parent=box
box.Parent=parent
return box
end
local function p3MakeList(parent,posX,posY,width,height,columns)
local holder=INF()
holder.Size=UO(width,height)
holder.Position=UO(posX,posY)
holder.BackgroundColor3=Palette.Chip
holder.BackgroundTransparency=0.35
holder.BorderSizePixel=0
local corner=IUC()
corner.CornerRadius=UD(0,12)
corner.Parent=holder
local stroke=IUS()
stroke.Color=Palette.PanelStroke
stroke.Transparency=0.55
stroke.Parent=holder
holder.Parent=parent
local scroll=IN("ScrollingFrame")
scroll.Size=U2(1,-12,1,-12)
scroll.Position=UO(6,6)
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.ScrollBarThickness=TOUCH and 6 or 4
scroll.ScrollBarImageColor3=Palette.Accent
scroll.AutomaticCanvasSize=XA.Y
scroll.CanvasSize=U2()
scroll.Parent=holder
if columns==2 then
local grid=IN("UIGridLayout")
grid.CellSize=U2(0.5,-5,0,P3_ROW_H)
grid.CellPadding=U2(0,10,0,8)
grid.SortOrder=XR.LayoutOrder
grid.Parent=scroll
else
local list=IUL()
list.Padding=UD(0,6)
list.SortOrder=XR.LayoutOrder
list.Parent=scroll
end
return scroll
end
local function p3AddRow(scroll,text,onClick,dimmed)
local btn=ITB()
btn.Size=U2(1,-6,0,P3_ROW_H)
btn.BackgroundColor3=Palette.Chip
btn.BackgroundTransparency=dimmed and 0.7 or 0.2
btn.Font=EF.Gotham
btn.Text=text
btn.TextSize=TOUCH and 14 or 13
btn.TextXAlignment=TXL
btn.TextTruncate=TT.AtEnd
btn.TextColor3=dimed and Palette.TextDim or Palette.TextBright
btn.AutoButtonColor=not dimmed
local pad=IUP()
pad.PaddingLeft=UD(0,10)
pad.Parent=btn
local corner=IUC()
corner.CornerRadius=UD(0,9)
corner.Parent=btn
local stroke=IUS()
stroke.Color=Palette.PanelStroke
stroke.Transparency=0.6
stroke.Parent=btn
btn.Parent=scroll
if onClick then
btn.Activated:Connect(onClick)
end
return btn
end
local function p3MarkRow(row,on)
if not row then
return
end
QQ(function()
local stroke=row:FindFirstChildOfClass("UIStroke")
if stroke then
stroke.Color=on and Palette.Accent or Palette.PanelStroke
stroke.Thickness=on and 2 or 1
stroke.Transparency=on and 0.05 or 0.6
end
row.BackgroundColor3=on and Palette.AccentDeep or Palette.Chip
row.AutoButtonColor=not on
end)
end
local function p3ClearRows(scroll)
for _,c in ipairs(scroll:GetChildren()) do
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
lbl.Font=EF.GothamBold
lbl.TextSize=TOUCH and 14 or 12
lbl.TextXAlignment=TXL
lbl.TextColor3=Palette.AccentBright
lbl.Text=text
lbl.Parent=parent
return lbl
end
local previewPickerGui=nil
local pvBox=nil
local pvViewport=nil
local pvWorld=nil
local pvCam=nil
local pvNameLabel=nil
local pvIconImg=nil
local pvRigClone=nil
local pvPropInsts={}
local pvFitToken=0
local function pvDestroyProp()
for _,inst in ipairs(pvPropInsts) do
QQ(function()
inst:Destroy()
end)
end
pvPropInsts={}
end
local function p4StopPreview()
if previewTrack then
QQ(function()
previewTrack:Stop(0)
end)
previewTrack=nil
end
pvDestroyProp()
previewing=false
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
if pvRigClone then
QQ(function()
pvRigClone:Destroy()
end)
pvRigClone=nil
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
local pvGrad=IN("UIGradient")
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
pvTitle.Font=EF.GothamMedium
pvTitle.TextSize=15
pvTitle.TextXAlignment=TXL
pvTitle.TextColor3=Palette.AccentBright
pvTitle.Text="Preview"
pvTitle.ZIndex=51
pvTitle.Parent=pvBox
pvNameLabel=ITL()
pvNameLabel.BackgroundTransparency=1
pvNameLabel.Position=UO(16,30)
pvNameLabel.Size=U2(1,-60,0,14)
pvNameLabel.Font=EF.GothamMedium
pvNameLabel.TextSize=11
pvNameLabel.TextXAlignment=TXL
pvNameLabel.TextTruncate=TT.AtEnd
pvNameLabel.TextColor3=Palette.TextDim
pvNameLabel.Text=""
pvNameLabel.ZIndex=51
pvNameLabel.Parent=pvBox
local pvClose=ITB()
pvClose.AnchorPoint=VX(1,0)
pvClose.Position=U2(1,-8,0,8)
pvClose.Size=UO(22,22)
pvClose.BackgroundColor3=Palette.AccentDeep
pvClose.BackgroundTransparency=0.25
pvClose.Font=EF.GothamBold
pvClose.Text="X"
pvClose.TextSize=12
pvClose.TextColor3=Palette.TextBright
pvClose.ZIndex=51
local pvcCorner=IUC()
pvcCorner.CornerRadius=UD(1,0)
pvcCorner.Parent=pvClose
pvClose.Parent=pvBox
pvClose.Activated:Connect(function()
p4StopPreview()
end)
pvViewport=IN("ViewportFrame")
pvViewport.Name="Viewport"
pvViewport.Position=UO(16,50)
pvViewport.Size=U2(1,-32,1,-96)
pvViewport.BackgroundColor3=CR(10,7,16)
pvViewport.BackgroundTransparency=0.12
pvViewport.BorderSizePixel=0
pvViewport.Ambient=CR(120,100,160)
pvViewport.LightColor=CR(255,240,220)
pvViewport.LightDirection=Vector3.new(-1,-1,-1)
pvViewport.ZIndex=51
local vpvCorner=IUC()
vpvCorner.CornerRadius=UD(0,12)
vpvCorner.Parent=pvViewport
pvViewport.Parent=pvBox
pvIconImg=IN("ImageLabel")
pvIconImg.Name="Icon"
pvIconImg.Position=UO(16,50)
pvIconImg.Size=U2(1,-32,1,-96)
pvIconImg.BackgroundColor3=CR(10,7,16)
pvIconImg.BackgroundTransparency=0.12
pvIconImg.BorderSizePixel=0
pvIconImg.ScaleType=Enum.ScaleType.Fit
pvIconImg.Image=""
pvIconImg.Visible=false
pvIconImg.ZIndex=52
local pvImgCorner=IUC()
pvImgCorner.CornerRadius=UD(0,12)
pvImgCorner.Parent=pvIconImg
pvIconImg.Parent=pvBox
pvWorld=IN("WorldModel")
pvWorld.Name="World"
pvWorld.Parent=pvViewport
pvCam=IN("Camera")
pvCam.FieldOfView=30
pvCam.Parent=pvWorld
pvViewport.CurrentCamera=pvCam
local pvHint=ITL()
pvHint.BackgroundTransparency=1
pvHint.AnchorPoint=VX(0.5,1)
pvHint.Position=U2(0.5,0,1,-8)
pvHint.Size=U2(1,-20,0,12)
pvHint.Font=EF.Gotham
pvHint.TextSize=9
pvHint.TextColor3=Palette.TextDim
pvHint.TextTransparency=0.35
pvHint.Text="Usa Prev en otro item para cambiar al instante"
pvHint.ZIndex=51
pvHint.Parent=pvBox
return true
end
local function pvRootOf(model)
local hrp=model:FindFirstChild("HumanoidRootPart")
if hrp and hrp:IsA("BasePart") then
return hrp
end
local hum=model:FindFirstChildOfClass("Humanoid")
if hum then
local rp=hum.RootPart
if rp then
return rp
end
end
local torso=model:FindFirstChild("Torso")
if torso and torso:IsA("BasePart") then
return torso
end
local biggest=nil
for _,d in ipairs(model:GetDescendants()) do
if d:IsA("BasePart") and(not biggest or d.Size.Magnitude>biggest.Size.Magnitude) then
biggest=d
end
end
return biggest
end
local function pvEnsureRig()
if pvRigClone and pvRigClone.Parent then
return pvRigClone
end
local template=ReplicatedStorage:FindFirstChild("Assets")
and ReplicatedStorage.Assets:FindFirstChild("Items")
and ReplicatedStorage.Assets.Items:FindFirstChild("VisualRigClassic")
if not template or not template:IsA("Model") then
return nil
end
local clone=template:Clone()
clone.Name="GM_PreviewRig"
clone:PivotTo(CFrame.new(0,3,0))
local root=pvRootOf(clone)
if root then
root.Anchored=true
end
local rig=getRig()
if rig then
for _,src in ipairs(rig:GetChildren()) do
if src:IsA("BasePart") then
local dst=clone:FindFirstChild(src.Name)
if dst and dst:IsA("BasePart") then
dst.Color=src.Color
end
end
end
local srcHead=rig:FindFirstChild("Head")
local dstHead=clone:FindFirstChild("Head")
if srcHead and srcHead:IsA("BasePart") and dstHead and dstHead:IsA("BasePart") then
if srcHead.Transparency>0.5 then
dstHead.Transparency=1
local face=dstHead:FindFirstChild("face")
if face then
face.Transparency=1
end
end
end
end
clone.Parent=pvWorld
pvRigClone=clone
return clone
end
local function pvAttachElement(entry)
local classic=entry.template:FindFirstChild("CharacterClassic")
or entry.template:FindFirstChild("Character")
if not classic then
for _,d in ipairs(entry.template:GetDescendants()) do
if d.Name=="CharacterClassic" or d.Name=="Character" then
classic=d
break
end
end
end
if not classic or not pvRigClone then
return
end
local em=classic:FindFirstChild("EmoteModel")
if not em then
for _,ch in ipairs(classic:GetChildren()) do
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
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("BasePart") then
d.Anchored=false
d.CanCollide=false
d.CanTouch=false
d.CanQuery=false
d.Massless=true
end
end
for _,d in ipairs(clone:GetChildren()) do
if(d:IsA("Motor6D") or d:IsA("Weld")) and d.Part0 and d.Part0.Parent==classic then
if d.Part0.Name=="HumanoidRootPart" then
local root=pvRootOf(pvRigClone)
if root then
d.Part0=root
else
d:Destroy()
end
else
local host=pvRigClone:FindFirstChild(d.Part0.Name)
if host and host:IsA("BasePart") then
d.Part0=host
else
d:Destroy()
end
end
end
end
clone.Parent=pvRigClone
TBI(pvPropInsts,clone)
for _,part in ipairs(classic:GetChildren()) do
if part:IsA("BasePart") then
local targetPart=pvRigClone:FindFirstChild(part.Name)
if targetPart then
for _,child in ipairs(part:GetChildren()) do
if child~=em and(child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart")) then
local hasEffect=false
for _,fx in ipairs(child:GetDescendants()) do
if fx:IsA("ParticleEmitter") or fx:IsA("Beam") or fx:IsA("Trail") then
hasEffect=true
break
end
end
if hasEffect then
local fxClone=child:Clone()
fxClone.Parent=targetPart
if fxClone:IsA("BasePart") then
fxClone.CanCollide=false
fxClone.Massless=true
local w=IN("WeldConstraint")
w.Part0=targetPart
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
if not pvRigClone or not pvCam then
return
end
QQ(function()
local pivot=pvRigClone:GetPivot()
local size=pvRigClone:GetExtentsSize()
local maxDim=math.max(size.X,size.Y,size.Z)
local k=1.15*math.max(1,maxDim/5.2)
if k>3.3 then
k=3.3
end
pvCam.CFrame=CFrame.new(0,0.34*k,0)
*CFrame.new((pivot*CFrame.new(4.25*k,1.7*k,-8.5*k)).p,pivot.p)
end)
end
local function pvSetMode(isIcon)
if pvBox and pvBox.Parent then
if isIcon then
pvViewport.Visible=false
pvBox.Size=UO(252,306)
if pvIconImg then
pvIconImg.Position=UO(16,50)
pvIconImg.Size=UO(218,218)
pvIconImg.Visible=true
end
else
if pvIconImg then
pvIconImg.Visible=false
end
pvViewport.Visible=true
pvBox.Size=UO(252,336)
end
end
end
local function p4PreviewEmote(entry)
if not entry then
return false
end
if pvBox and pvBox.Parent and pvBox.Visible
and pvNameLabel and pvNameLabel.Text==entry.name then
p4StopPreview()
return true
end
if not pvEnsureBox() then
notify("Ghost Method","Preview: abre el picker primero.",5)
return false
end
local clone=pvEnsureRig()
if not clone then
notify("Ghost Method","Preview: VisualRigClassic no encontrado.",5)
return false
end
local hum=clone:FindFirstChildOfClass("Humanoid")
or clone:FindFirstChildOfClass("AnimationController")
if not hum then
notify("Ghost Method","Preview failed (rig sin animator).",5)
return false
end
if previewTrack then
QQ(function()
previewTrack:Stop(0)
end)
previewTrack=nil
end
pvDestroyProp()
local anim=IN("Animation")
anim.Name="GM_Preview"
anim.AnimationId="rbxassetid://"..entry.id
local ok,track=QQ(function()
return hum:LoadAnimation(anim)
end)
if not ok or not track then
notify("Ghost Method","Preview failed to load the animation.",5)
return false
end
previewing=true
previewTrack=track
track.Priority=Enum.AnimationPriority.Action
QQ(function()
track.Looped=true
end)
track:Play(0.1)
pvAttachElement(entry)
pvSetMode(false)
pvViewport.CurrentCamera=nil
pvViewport.CurrentCamera=pvCam
pvFitCamera()
pvFitToken=pvFitToken+1
local myFit=pvFitToken
for _,delay in ipairs({0.2,0.45,0.9,1.6}) do
TDL(delay,function()
if pvFitToken==myFit and pvBox and pvBox.Visible then
pvFitCamera()
end
end)
end
pvNameLabel.Text=entry.name
pvBox.Visible=true
QQ(function()
local lines={"GM preview debug @ "..os.date("%Y-%m-%d %H:%M:%S")}
lines[#lines+1]="entry: "..tostring(entry.name).." id="..tostring(entry.id)
lines[#lines+1]="rig fuente: "..tostring(getRig() and getRig():GetFullName() or "NIL")
lines[#lines+1]="clone: "..tostring(pvRigClone and pvRigClone:GetFullName() or "NIL")
if pvRigClone then
local parts=0
local visibleParts=0
for _,d in ipairs(pvRigClone:GetDescendants()) do
if d:IsA("BasePart") then
parts=parts+1
if d.Transparency<1 then
visibleParts=visibleParts+1
end
end
end
lines[#lines+1]="clone parts: "..parts.." (visibles: "..visibleParts..")"
local croot=pvRootOf(pvRigClone)
lines[#lines+1]="clone root: "..tostring(croot and croot.Name or "NIL")
.." pos="..tostring(croot and croot.Position or "nil")
.." anchored="..tostring(croot and croot.Anchored or "nil")
lines[#lines+1]="clone pivot: "..tostring(pvRigClone:GetPivot().Position)
local hum=pvRigClone:FindFirstChildOfClass("Humanoid")
lines[#lines+1]="clone humanoid: "..tostring(hum and hum:GetFullName() or "NIL")
.." health="..tostring(hum and hum.Health or "nil")
end
lines[#lines+1]="world: "..tostring(pvWorld and pvWorld:GetFullName() or "NIL")
.." hijos="..tostring(pvWorld and #pvWorld:GetChildren() or 0)
lines[#lines+1]="viewport: "..tostring(pvViewport and pvViewport:GetFullName() or "NIL")
.." cam="..tostring(pvViewport and pvViewport.CurrentCamera~=nil)
lines[#lines+1]="camera pos: "..tostring(pvCam and pvCam.CFrame.Position or "NIL")
.." fov="..tostring(pvCam and pvCam.FieldOfView or "?")
lines[#lines+1]="box visible: "..tostring(pvBox and pvBox.Visible)
lines[#lines+1]="prop insts: "..#pvPropInsts
writefile("GM_preview_debug.txt",TCN(lines,"\n"))
end)
return true
end
local function p4PreviewUnusual(entry)
if not entry then
return false
end
if pvBox and pvBox.Parent and pvBox.Visible
and pvNameLabel and pvNameLabel.Text==entry.name then
p4StopPreview()
return true
end
if not pvEnsureBox() then
notify("Ghost Method","Preview: abre el picker primero.",5)
return false
end
local clone=pvEnsureRig()
if not clone then
notify("Ghost Method","Preview: VisualRigClassic no encontrado.",5)
return false
end
if previewTrack then
QQ(function()
previewTrack:Stop(0)
end)
previewTrack=nil
end
pvDestroyProp()
local cc=entry.template:FindFirstChild("CharacterClassic")
or entry.template:FindFirstChild("Character")
or entry.template:FindFirstChild("CharacterOLD")
local n=0
local nAttach,nMesh,nEmitter=0,0,0
if cc then
for _,part in ipairs(cc:GetChildren()) do
if part:IsA("BasePart") then
local targetPart=clone:FindFirstChild(part.Name)
if targetPart and targetPart:IsA("BasePart") then
for _,child in ipairs(part:GetChildren()) do
if child:IsA("Attachment") or child:IsA("Model") or child:IsA("BasePart") then
local fxClone=child:Clone()
fxClone.Parent=targetPart
if fxClone:IsA("BasePart") then
fxClone.CanCollide=false
fxClone.Massless=true
local tplWeld=nil
for _,sib in ipairs(part:GetChildren()) do
if sib:IsA("Weld") and sib.Part1==child then
tplWeld=sib
break
end
end
if tplWeld then
QQ(function()
fxClone.CFrame=targetPart.CFrame*tplWeld.C0*tplWeld.C1:Inverse()
end)
nMesh=nMesh+1
end
local w=IN("WeldConstraint")
w.Part0=targetPart
w.Part1=fxClone
w.Parent=fxClone
elseif fxClone:IsA("Attachment") then
nAttach=nAttach+1
for _,d in ipairs(fxClone:GetDescendants()) do
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
notify("Ghost Method","Ese unusual no tiene efectos visibles en el template.",5)
end
previewing=true
local iconId=nil
if nMesh==0 and nEmitter>0 then
QQ(function()
local cfg=require(entry.template)
local info=cfg and cfg.AppearanceInfo
if info then
iconId=tonumber(info.Icon)
end
end)
end
if pvIconImg then
if iconId and iconId>0 then
pvIconImg.Image="rbxassetid://"..tostring(iconId)
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
writefile("GM_unusual_preview.txt",os.date("%H:%M:%S").." '"..entry.name
.."': anchors="..nAttach
.." meshes="..nMesh
.." emitters="..nEmitter
.." total="..n
.." iconMode="..tostring(iconId~=nil))
end)
pvViewport.CurrentCamera=nil
pvViewport.CurrentCamera=pvCam
pvFitCamera()
pvNameLabel.Text=entry.name
pvBox.Visible=true
return true
end
local function openEmoteReplacerPicker()
buildPhase3Catalogs()
local pk=p3MakePicker("GM_P3_EmoteReplacer","Ghost Method - Emotes",760,470)
previewPickerGui=pk.gui
pk.gui.Destroying:Connect(function()
previewing=false
previewTrack=nil
pvBox=nil
pvViewport=nil
pvWorld=nil
pvCam=nil
pvNameLabel=nil
pvIconImg=nil
pvRigClone=nil
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
applyBtn.Font=EF.GothamBold
applyBtn.Text="Apply"
applyBtn.TextSize=13
applyBtn.TextColor3=Palette.TextBright
local aCorner=IUC()
aCorner.CornerRadius=UD(0,10)
aCorner.Parent=applyBtn
applyBtn.Parent=pk.panel
local removeBtn=ITB()
removeBtn.Size=UO(92,TOUCH and 42 or 30)
removeBtn.Position=U2(0.5,8,0,TOUCH and 80 or 84)
removeBtn.BackgroundColor3=CR(90,40,70)
removeBtn.Font=EF.GothamBold
removeBtn.Text="Remove"
removeBtn.TextSize=13
removeBtn.TextColor3=Palette.TextBright
local rCorner=IUC()
rCorner.CornerRadius=UD(0,10)
rCorner.Parent=removeBtn
removeBtn.Parent=pk.panel
local previewBtn=ITB()
previewBtn.Size=UO(92,TOUCH and 42 or 30)
previewBtn.Position=U2(0.5,-46,0,8)
previewBtn.BackgroundColor3=Palette.AccentDeep
previewBtn.Font=EF.GothamBold
previewBtn.Text="Preview"
previewBtn.TextSize=13
previewBtn.TextColor3=Palette.TextBright
local pvCorner=IUC()
pvCorner.CornerRadius=UD(0,10)
pvCorner.Parent=previewBtn
previewBtn.Parent=pk.panel
local function refreshActive()
local parts={}
for _,m in ipairs(activeMappings) do
TBI(parts,m.from.name.." -> "..m.to.name)
end
table.sort(parts)
activeLabel.Text=#parts==0 and "Active mappings: none" or("Active: "..TCN(parts,"  -  "))
end
local function refreshLeft()
p3ClearRows(listL)
local filter=SLW(searchL.Text or "")
local shown=0
for _,e in ipairs(Catalog.emotes) do
if filter=="" or SFD(SLW(e.name),filter,1,true) then
shown=shown+1
if shown>250 then
break
end
local row=p3AddRow(listL,e.name,function()
p3MarkRow(selFromRow,false)
selFrom=e
selFromRow=row
p3MarkRow(row,true)
end,false)
if mappingBySource[e.name] then
row.TextColor3=Palette.Accent
end
end
end
if shown==0 then
p3AddRow(listL,"No emotes match",nil,true)
end
end
local function refreshRight()
p3ClearRows(listR)
local filter=SLW(searchR.Text or "")
local shown=0
for _,e in ipairs(Catalog.emotes) do
if filter=="" or SFD(SLW(e.name),filter,1,true) then
shown=shown+1
if shown>250 then
break
end
local row=p3AddRow(listR,e.name,function()
p3MarkRow(selToRow,false)
selTo=e
selToRow=row
p3MarkRow(row,true)
end,false)
end
end
if shown==0 then
p3AddRow(listR,"No emotes match",nil,true)
end
end
searchL:GetPropertyChangedSignal("Text"):Connect(refreshLeft)
searchR:GetPropertyChangedSignal("Text"):Connect(refreshRight)
applyBtn.Activated:Connect(function()
if selFrom and selTo then
if p3SetMapping(selFrom,selTo) then
if not EmoteReplacer.enabled then
EmoteReplacer.enable()
end
refreshActive()
refreshLeft()
notify("Ghost Method","Replaced \""..selFrom.name.."\" with \""..selTo.name.."\".",4)
end
else
notify("Ghost Method","Select an emote on BOTH sides first.",4)
end
end)
removeBtn.Activated:Connect(function()
if selFrom then
if p3RemoveMapping(selFrom.name) then
refreshActive()
refreshLeft()
else
notify("Ghost Method","No mapping for "..selFrom.name..".",4)
end
else
notify("Ghost Method","Select the SOURCE emote (left) to remove its mapping.",4)
end
end)
previewBtn.Activated:Connect(function()
if selTo then
p4PreviewEmote(selTo)
else
notify("Ghost Method","Selecciona un emote en el lado DERECHO para previsualizar.",5)
end
end)
refreshLeft()
refreshRight()
refreshActive()
end
local function openUnusualsPicker()
buildPhase3Catalogs()
local pk=p3MakePicker("GM_P3_Unusuals","Ghost Method - Unusuals",640,470)
previewPickerGui=pk.gui
pk.gui.Destroying:Connect(function()
previewing=false
previewTrack=nil
pvBox=nil
pvViewport=nil
pvWorld=nil
pvCam=nil
pvNameLabel=nil
pvIconImg=nil
pvRigClone=nil
pvPropInsts={}
end)
local search=p3MakeSearch(pk.panel,22,64,460)
local removeBtn=ITB()
removeBtn.Size=UO(110,TOUCH and 36 or 28)
removeBtn.Position=U2(1,-132,0,64)
removeBtn.BackgroundColor3=CR(90,40,70)
removeBtn.Font=EF.GothamBold
removeBtn.Text="Remove applied"
removeBtn.TextSize=11
removeBtn.TextColor3=Palette.TextBright
local rCorner=IUC()
rCorner.CornerRadius=UD(0,10)
rCorner.Parent=removeBtn
removeBtn.Parent=pk.panel
local list=p3MakeList(pk.panel,22,108,596,326,2)
local function refresh()
local appliedRow=nil
p3ClearRows(list)
local filter=SLW(search.Text or "")
local shown=0
for _,u in ipairs(Catalog.unusuals) do
if filter=="" or SFD(SLW(u.name),filter,1,true) then
shown=shown+1
local row=p3AddRow(list,u.name,function()
if not Unusuals.enabled then
Unusuals.enable()
end
applyUnusualNow(u.name)
p3MarkRow(appliedRow,false)
appliedRow=row
p3MarkRow(row,true)
end,false)
local pvBtn=ITB()
pvBtn.Name="PvBtn"
pvBtn.AnchorPoint=VX(1,0.5)
pvBtn.Position=U2(1,-8,0.5,0)
pvBtn.Size=UO(TOUCH and 56 or 48,P3_ROW_H - 8)
pvBtn.BackgroundColor3=Palette.AccentDeep
pvBtn.BackgroundTransparency=0.35
pvBtn.Font=EF.GothamBold
pvBtn.TextSize=TOUCH and 12 or 11
pvBtn.TextColor3=Palette.TextBright
pvBtn.Text="Prev"
pvBtn.ZIndex=2
pvBtn.AutoButtonColor=true
local pvC=IUC()
pvC.CornerRadius=UD(0,7)
pvC.Parent=pvBtn
pvBtn.Parent=row
pvBtn.Activated:Connect(function()
p4PreviewUnusual(u)
end)
end
end
if shown==0 then
p3AddRow(list,"No unusuals match",nil,true)
end
end
search:GetPropertyChangedSignal("Text"):Connect(refresh)
removeBtn.Activated:Connect(function()
removeUnusualNow()
activeUnusual=nil
Unusuals.disable()
if gmSaveConfig then
gmSaveConfig()
end
notify("Ghost Method","Unusual removed.",4)
end)
refresh()
end
local Lighting=GGS("Lighting")
local Graphics
local gfxSnap={}
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
return Lighting:FindFirstChildOfClass("Sky")
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
for k in pairs(REAL_SKY) do
skySnap[k]=sky[k]
end
end
for k,v in pairs(REAL_SKY) do
QQ(function()
sky[k]=v
end)
end
skySwapOn=true
if not skyReassertConn then
local acc=0
skyReassertConn=RunService.Heartbeat:Connect(function(dt)
acc+=dt
if acc<3 then
return
end
acc=0
if skySwapOn then
local s=p4GetSky()
if s then
for k,v in pairs(REAL_SKY) do
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
for _,d in ipairs(Workspace:GetDescendants()) do
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
for light,was in pairs(gfxLightShadows) do
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
[Enum.Material.SmoothPlastic]=true,
[Enum.Material.Plastic]=true,
[Enum.Material.Metal]=true,
[Enum.Material.Marble]=true,
[Enum.Material.Granite]=true,
[Enum.Material.Slate]=true,
[Enum.Material.Concrete]=true,
[Enum.Material.Pavement]=true,
[Enum.Material.Asphalt]=true,
[Enum.Material.DiamondPlate]=true,
[Enum.Material.Glass]=true,
[Enum.Material.Ice]=true,
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
[Enum.Material.Metal]=1.5,
[Enum.Material.DiamondPlate]=1.2,
[Enum.Material.Glass]=1.8,
[Enum.Material.Ice]=1.5,
[Enum.Material.SmoothPlastic]=0.5,
[Enum.Material.Plastic]=0.35,
[Enum.Material.Marble]=0.4,
[Enum.Material.Granite]=0.3,
[Enum.Material.Slate]=0.3,
[Enum.Material.Concrete]=0.15,
[Enum.Material.Pavement]=0.15,
[Enum.Material.Asphalt]=0.1,
}
local function gfxApplyShiny()
if gfxShinyLevel<=0 then
return
end
local rigs=Workspace:FindFirstChild("Rigs")
local playersF=Workspace:FindFirstChild("Players")
local scanned=0
local smoothMatches=0
local changed=0
local matCount={}
for _,p in ipairs(Workspace:GetDescendants()) do
if p:IsA("BasePart") and p.Transparency<0.5 then
scanned+=1
local mk=tostring(p.Material)
matCount[mk]=(matCount[mk] or 0)+1
if SMOOTH_MATERIALS[p.Material] then
if not(rigs and p:IsDescendantOf(rigs)) and not(playersF and p:IsDescendantOf(playersF)) then
smoothMatches+=1
if gfxShinySnap[p]==nil then
gfxShinySnap[p]=p.Reflectance
end
local shine=DLSSX.MAT_SHINE[p.Material] or 1
local target=math.min(1,math.max(gfxShinySnap[p] or 0,gfxShinyLevel*shine))
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
for mk,count in pairs(matCount) do
TBI(mats,{mk,count})
end
table.sort(mats,function(a,b)
return a[2]>b[2]
end)
local lines={
os.date("%H:%M:%S").." shiny sweep @ level "..gfxShinyLevel,
"  opaque BaseParts scanned: "..scanned,
"  smooth-material parts matched: "..smoothMatches,
"  parts set to new reflectance: "..changed,
"  TOP MAP MATERIALS:",
}
for i=1,math.min(15,#mats) do
TBI(lines,"    "..mats[i][1].." x"..mats[i][2])
end
writefile("GM_shiny_dump.txt",TCN(lines,"\n"))
end)
end
local function gfxRestoreShiny()
for part,was in pairs(gfxShinySnap) do
QQ(function()
if part.Parent then
part.Reflectance=was
end
end)
end
table.clear(gfxShinySnap)
end
local function p4GfxSafe(label,fn)
local ok,err=QQ(fn)
if not ok then
print("[GM] GFX ERROR "..label..": "..tostring(err))
notify("Ghost Method","GFX error ("..label.."): "..tostring(err),9)
QQ(function()
writefile("GM_gfx_error.txt",os.date("%H:%M:%S").." "..label..": "..tostring(err))
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
notify("Ghost Method","Reflejos al 50% por 5 segundos - MIRA EL SUELO",5)
TDL(5,function()
gfxRestoreShiny()
gfxShinyLevel=old
if old>0 then
gfxApplyShiny()
end
notify("Ghost Method","Test terminado - reflejos restaurados",4)
end)
end)
end
function DLSSX.applyAtmo(p)
if not p.atmoApply then
return
end
local atmo=Lighting:FindFirstChildOfClass("Atmosphere")
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
local sunRays=Lighting:FindFirstChildOfClass("SunRaysEffect")
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
local cc=Lighting:FindFirstChild("GM_ColorGrade")
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
for _,m in ipairs(Modules) do
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
local terrain=Workspace:FindFirstChildOfClass("Terrain")
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
Graphics=RegisterModule({
Name="DLSS",
enable=function()
if Graphics.enabled then
return
end
Graphics.enabled=true
if next(gfxSnap)==nil then
QQ(function()
gfxSnap.QualityLevel=settings().Rendering.QualityLevel
gfxSnap.Technology=Lighting.Technology
gfxSnap.GlobalShadows=Lighting.GlobalShadows
gfxSnap.ShadowSoftness=Lighting.ShadowSoftness
gfxSnap.ExposureCompensation=Lighting.ExposureCompensation
gfxSnap.Brightness=Lighting.Brightness
gfxSnap.Ambient=Lighting.Ambient
gfxSnap.OutdoorAmbient=Lighting.OutdoorAmbient
gfxSnap.ShadowColor=Lighting.ShadowColor
gfxSnap.ClockTime=Lighting.ClockTime
gfxSnap.EnvironmentDiffuseScale=Lighting.EnvironmentDiffuseScale
gfxSnap.EnvironmentSpecularScale=Lighting.EnvironmentSpecularScale
local atmoSnap=Lighting:FindFirstChildOfClass("Atmosphere")
if atmoSnap then
gfxSnap.AtmoDensity=atmoSnap.Density
gfxSnap.AtmoOffset=atmoSnap.Offset
gfxSnap.AtmoColor=atmoSnap.Color
gfxSnap.AtmoDecay=atmoSnap.Decay
gfxSnap.AtmoGlare=atmoSnap.Glare
gfxSnap.AtmoHaze=atmoSnap.Haze
end
local terrain=Workspace:FindFirstChildOfClass("Terrain")
if terrain then
gfxSnap.WaterReflectance=terrain.WaterReflectance
gfxSnap.WaterRefraction=terrain.WaterRefraction
gfxSnap.WaterWaveSize=terrain.WaterWaveSize
gfxSnap.WaterWaveSpeed=terrain.WaterWaveSpeed
gfxSnap.Decoration=terrain.Decoration
end
local sky=p4GetSky()
if sky then
gfxSnap.SunAngularSize=sky.SunAngularSize
gfxSnap.MoonAngularSize=sky.MoonAngularSize
gfxSnap.StarCount=sky.StarCount
end
local sunRays=Lighting:FindFirstChildOfClass("SunRaysEffect")
if sunRays then
gfxSnap.SunRaysIntensity=sunRays.Intensity
gfxSnap.SunRaysSpread=sunRays.Spread
end
end)
end
gfxApply()
local shinyClock=0
local p=GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista
Graphics.Scope:Connect(RunService.Heartbeat,function(dt)
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
Graphics.Scope:Connect(RunService.Heartbeat,function()
DLSSX.shadowApply(GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista)
end)
end,
disable=function()
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
local cc=Lighting:FindFirstChild("GM_ColorGrade")
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
if next(gfxSnap)~=nil then
QQ(function()
local render=settings().Rendering
render.QualityLevel=gfxSnap.QualityLevel
end)
QQ(function()
Lighting.Technology=gfxSnap.Technology
end)
QQ(function()
Lighting.GlobalShadows=gfxSnap.GlobalShadows
end)
QQ(function()
Lighting.ShadowSoftness=gfxSnap.ShadowSoftness
end)
QQ(function()
Lighting.ExposureCompensation=gfxSnap.ExposureCompensation
end)
QQ(function()
local terrain=Workspace:FindFirstChildOfClass("Terrain")
if terrain then
terrain.WaterReflectance=gfxSnap.WaterReflectance
terrain.WaterRefraction=gfxSnap.WaterRefraction
terrain.WaterWaveSize=gfxSnap.WaterWaveSize
terrain.WaterWaveSpeed=gfxSnap.WaterWaveSpeed
terrain.Decoration=gfxSnap.Decoration
end
end)
QQ(function()
local sky=p4GetSky()
if sky and gfxSnap.SunAngularSize then
sky.SunAngularSize=gfxSnap.SunAngularSize
sky.MoonAngularSize=gfxSnap.MoonAngularSize
sky.StarCount=gfxSnap.StarCount
end
end)
QQ(function()
local bloom=Lighting:FindFirstChildOfClass("BloomEffect")
if bloom and gfxSnap.BloomIntensity then
bloom.Intensity=gfxSnap.BloomIntensity
bloom.Size=gfxSnap.BloomSize
bloom.Threshold=gfxSnap.BloomThreshold
end
end)
QQ(function()
local sunRays=Lighting:FindFirstChildOfClass("SunRaysEffect")
if sunRays and gfxSnap.SunRaysIntensity then
sunRays.Intensity=gfxSnap.SunRaysIntensity
sunRays.Spread=gfxSnap.SunRaysSpread
end
end)
QQ(function()
Lighting.Brightness=gfxSnap.Brightness or 2
Lighting.Ambient=gfxSnap.Ambient or CR(0,0,0)
Lighting.OutdoorAmbient=gfxSnap.OutdoorAmbient or CR(70,70,70)
Lighting.ShadowColor=gfxSnap.ShadowColor or CR(70,70,70)
Lighting.EnvironmentDiffuseScale=gfxSnap.EnvironmentDiffuseScale or 0.5
Lighting.EnvironmentSpecularScale=gfxSnap.EnvironmentSpecularScale or 0.5
if gfxSnap.ClockTime then
Lighting.ClockTime=gfxSnap.ClockTime
end
end)
QQ(function()
local atmo=Lighting:FindFirstChildOfClass("Atmosphere")
if atmo then
if DLSSX.atmoCreated and atmo.Name=="GM_Atmosphere" then
atmo:Destroy()
elseif gfxSnap.AtmoDensity then
atmo.Density=gfxSnap.AtmoDensity
atmo.Offset=gfxSnap.AtmoOffset
atmo.Color=gfxSnap.AtmoColor
atmo.Decay=gfxSnap.AtmoDecay
atmo.Glare=gfxSnap.AtmoGlare
atmo.Haze=gfxSnap.AtmoHaze
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
local sunRays=Lighting:FindFirstChildOfClass("SunRaysEffect")
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
verifyClean=function()
if next(gfxLightShadows)~=nil then
return false,"light shadows not restored after disable()"
end
if next(gfxShinySnap)~=nil then
return false,"material reflections not restored after disable()"
end
if DLSSX.doF and DLSSX.doF.Parent~=nil then
return false,"depth of field still alive after disable()"
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
DLSSX.ShotMod=RegisterModule({
Name="Screenshot Mode",
enable=function()
if DLSSX.ShotMod.enabled or DLSSX.shotHidden then
return
end
DLSSX.ShotMod.enabled=true
DLSSX.shotHidden=true
for _,coreType in ipairs(DLSSX.shotCoreTypes) do
QQ(function()
StarterGui:SetCoreGuiEnabled(coreType,false)
end)
end
local pg=LocalPlayer:FindFirstChild("PlayerGui")
if pg then
for _,child in ipairs(pg:GetChildren()) do
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
notify("Ghost Method",gmT("Screenshot mode: UI de Evade oculta. (Ctrl+X para la nuestra)","Screenshot mode: Evade UI hidden. (X for ours)"),6)
end,
disable=function()
if not DLSSX.ShotMod.enabled and not DLSSX.shotHidden then
return
end
DLSSX.ShotMod.enabled=false
DLSSX.shotHidden=false
for _,coreType in ipairs(DLSSX.shotCoreTypes) do
QQ(function()
StarterGui:SetCoreGuiEnabled(coreType,true)
end)
end
for child,was in pairs(DLSSX.shotSnaps) do
QQ(function()
if child.Parent then
child.Enabled=was
end
end)
end
DLSSX.shotSnaps={}
notify("Ghost Method",gmT("UI de Evade restaurada.","Evade UI restored."),4)
end,
verify=function()
return true
end,
verifyClean=function()
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
ColorFilter=RegisterModule({
Name="Color Filter",
enable=function()
if ColorFilter.enabled then
return
end
ColorFilter.enabled=true
ccApply()
end,
disable=function()
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
verifyClean=function()
if ccInst then
return false,"filter instance still alive after disable()"
end
return true
end,
})
local TimeWeather
local twSnap=nil
local twState={clock=14,density=nil,haze=nil}
local twClock=0
local function twAtmo()
return Lighting:FindFirstChildOfClass("Atmosphere")
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
TimeWeather=RegisterModule({
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
TimeWeather.Scope:Connect(RunService.Heartbeat,function(dt)
twClock+=dt
if twClock<1 then
return
end
twClock=0
twApply()
end)
end,
disable=function()
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
verifyClean=function()
if TimeWeather.enabled then
return false,"still enabled after disable()"
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
islGui=IN("ScreenGui")
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
local iGrad=IN("UIGradient")
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
islLabel.Font=EF.GothamBold
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
islPill.MouseEnter:Connect(function()
TSC(islPill,TWI(0.28,ESB,ED.Out),{
Size=UO(196,40),
}):Play()
end)
islPill.MouseLeave:Connect(function()
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
Island=RegisterModule({
Name="Dynamic Island",
enable=function()
if Island.enabled then
return
end
Island.enabled=true
islBuild()
local acc=0
Island.Scope:Connect(RunService.Heartbeat,function(dt)
islFrames+=1
acc+=dt
if acc<1 then
return
end
acc=0
islFps=islFrames
islFrames=0
local timeStr=os.date("%H:%M")
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
disable=function()
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
verifyClean=function()
if islGui then
return false,"island gui still alive after disable()"
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
hudBhopMode="Mantener",
hudCrunchMode="Mantener",
hudBtnSize=84,
hudBtnOpacity=85,
hudUnlocked=false,
hudBhopPos=nil,
hudCrunchPos=nil,
language="es",
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
gmActivation={},
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
KeysAPI.disable()
end
end
APPLIES.island=function()
p5SetIslandMode(CFG.islandMode)
if CFG.islandOn then
Island.enable()
else
Island.disable()
end
end
APPLIES.headless=function()
if CFG.headlessHead then
Headless.enable({head=true})
else
Headless.disable({head=true})
end
if CFG.headlessAccs then
Headless.enable({accs=true})
else
Headless.disable({accs=true})
end
end
APPLIES.korblox=function()
setKorbloxChoice(CFG.korbloxLeg)
if CFG.korbloxOn then
Korblox.enable()
else
Korblox.disable()
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
Graphics.disable()
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
TimeWeather.disable()
end
end
APPLIES.bhop=function()
MOVE.bhopDelayMs=CFG.bhopDelay
if CFG.bhopOn then
Bhop.enable()
else
Bhop.disable()
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
APPLIES.hud=function()
local want=CFG.hudBhopOn or CFG.hudCrunchOn
for _,m in ipairs(Modules) do
if m.Name=="Mobile HUD" then
if want and not m.enabled then
m.enable()
elseif not want and m.enabled then
m.disable()
end
if m.enabled then
m.applyNow()
end
return
end
end
end
APPLIES.crosshair=function()
for _,m in ipairs(Modules) do
if m.Name=="Crosshair" then
if CFG.crosshairOn and not m.enabled then
m.enable()
elseif not CFG.crosshairOn and m.enabled then
m.disable()
end
if m.enabled then
m.applyNow()
end
return
end
end
end
APPLIES.evadeFont=function()
for _,m in ipairs(Modules) do
if m.Name=="EvadeFont" then
if CFG.evadeFontOn and not m.enabled then
m.enable()
elseif not CFG.evadeFontOn and m.enabled then
m.disable()
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
APPLIES.hud()
APPLIES.crosshair()
APPLIES.evadeFont()
end
local gmSavePending=false
local function gmMarkConfig()
if gmSavePending then
return
end
gmSavePending=true
TDL(1,function()
gmSavePending=false
if gmSaveConfig then
gmSaveConfig()
end
end)
end
onOverlayMoved=gmMarkConfig
GMUI.actGet=function(hprefix)
if CFG.gmActivation then
return CFG.gmActivation[hprefix]
end
return nil
end
GMUI.actSave=function(hprefix,act)
if not CFG.gmActivation then
CFG.gmActivation={}
end
CFG.gmActivation[hprefix]=act
gmMarkConfig()
end
gmSaveConfig=function()
QQ(function()
local op=KeysAPI.getPos()
if op then
CFG.keystrokesPos={op.X.Scale,op.X.Offset,op.Y.Scale,op.Y.Offset}
end
local data={mappings={}}
for _,m in ipairs(activeMappings) do
TBI(data.mappings,{from=m.from.name,to=m.to.name})
end
if Unusuals.enabled and activeUnusual then
data.unusual=activeUnusual
end
data.cfg=CFG
writefile(CONFIG_FILE,HttpService:JSONEncode(data))
end)
end
local function gmLoadConfig()
local ok,raw=QQ(function()
if isfile and readfile and isfile(CONFIG_FILE) then
return HttpService:JSONDecode(readfile(CONFIG_FILE))
end
return nil
end)
if not ok or type(raw)~="table" then
return
end
if type(raw.mappings)=="table" then
for _,m in ipairs(raw.mappings) do
local fromE=Catalog.emoteByName[tostring(m.from)]
local toE=Catalog.emoteByName[tostring(m.to)]
if fromE and toE then
p3SetMapping(fromE,toE)
end
end
if #activeMappings>0 then
GMUI.bootEnables=GMUI.bootEnables or {}
TBI(GMUI.bootEnables,function()
EmoteReplacer.enable()
end)
print("[GM] config: "..#activeMappings.." emote mapping(s) restored")
end
end
if type(raw.unusual)=="string" and Catalog.unusualByName[raw.unusual] then
activeUnusual=raw.unusual
GMUI.bootEnables=GMUI.bootEnables or {}
TBI(GMUI.bootEnables,function()
Unusuals.enable()
end)
print("[GM] config: unusual '"..raw.unusual.."' restored")
end
if type(raw.cfg)=="table" then
for k,v in pairs(raw.cfg) do
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
GMUI.language=CFG.language=="en" and "en" or "es"
GMUI.uiSoundSetEnabled(CFG.soundsOn~=false)
buildMobileHUD({
RegisterModule=RegisterModule,
notify=notify,
GuiParent=GuiParent,
getRoot=function()
return GMUI.root
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
gmMarkConfig()
end,
})
markStep("mobile hud defined")
buildCrosshair({
RegisterModule=RegisterModule,
notify=notify,
getRoot=function()
return GMUI.root
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
RegisterModule=RegisterModule,
notify=notify,
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
GMUI.spotify=buildSpotify({
RegisterModule=RegisterModule,
notify=notify,
getVolume=function()
return CFG.musicVolume or 50
end,
getDc=function()
return CFG.spotifyDc or ""
end,
setDc=function(v)
CFG.spotifyDc=v or ""
gmMarkConfig()
end,
setUserName=function(name)
CFG.spotifyName=name or ""
gmMarkConfig()
end,
})
GMUI.skin=buildSkinChanger({
RegisterModule=RegisterModule,
notify=notify,
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
cgConn=RunService.Heartbeat:Connect(function(dt)
if GMUI.root==nil then
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
local hum=char and char:FindFirstChildOfClass("Humanoid")
if hum==nil then
if cgGoneSince==nil then
cgGoneSince=os.clock()
cgWarned=false
elseif not cgWarned and os.clock() - cgGoneSince>20 then
cgWarned=true
notify(
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
if os.clock() - cgCooldown<3 then
return
end
cgCooldown=os.clock()
cam.CameraSubject=hum
print("[GM] Camera Guard: camera re-attached to your character (round glitch).")
notify("Ghost Method",gmT("Camara re-adjuntada al personaje (glitch de ronda corregido).","Camera re-attached to your character (round glitch fixed)."),5)
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
gmMarkConfig()
end,
getIslandOn=function() return CFG.islandOn end,
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
DLSSX.ShotMod.disable()
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
gmMarkConfig()
end,
getCrosshairStyle=function()
return CFG.crosshairStyle
end,
setCrosshairStyle=function(s)
CFG.crosshairStyle=s
APPLIES.crosshair()
gmMarkConfig()
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
gmMarkConfig()
end,
centerCrosshair=function()
CFG.crosshairOffX=0
CFG.crosshairOffY=0
APPLIES.crosshair()
gmMarkConfig()
end,
getCrosshairColor=function()
return CFG.crosshairColor
end,
setCrosshairColor=function(r,g,b)
CFG.crosshairColor={r,g,b}
APPLIES.crosshair()
gmMarkConfig()
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
gmMarkConfig()
end,
getEvadeFontOn=function()
return CFG.evadeFontOn
end,
setEvadeFontOn=function(on)
CFG.evadeFontOn=on
APPLIES.evadeFont()
gmMarkConfig()
end,
getEvadeFontLabel=function()
return CFG.evadeFont
end,
setEvadeFontLabel=function(label)
CFG.evadeFont=label
APPLIES.evadeFont()
gmMarkConfig()
end,
spSearch=function(query,cb)
if GMUI.spotify then
GMUI.spotify.search(query,cb)
end
end,
spPlaylist=function(link,cb)
if GMUI.spotify then
GMUI.spotify.loadPlaylist(link,cb)
end
end,
spPlayResult=function(i)
if GMUI.spotify then
GMUI.spotify.playResult(i)
end
end,
spPlayQueue=function(i)
if GMUI.spotify then
GMUI.spotify.playQueue(i)
end
end,
spPauseResume=function()
if GMUI.spotify then
GMUI.spotify.pauseResume()
end
end,
spStop=function()
if GMUI.spotify then
GMUI.spotify.stop()
end
end,
getMusicVolume=function()
return CFG.musicVolume or 50
end,
spSetVolume=function(v)
CFG.musicVolume=v
if GMUI.spotify then
GMUI.spotify.setVolume(v)
end
gmMarkConfig()
end,
spSetStateHandler=function(fn)
if GMUI.spotify then
GMUI.spotify.setStateHandler(fn)
end
end,
spGetAccount=function()
if CFG.spotifyDc and #CFG.spotifyDc>10 then
return true,(CFG.spotifyName~="" and CFG.spotifyName) or gmT("conectado","connected")
end
return false,""
end,
spLogin=function(dc,cb)
if GMUI.spotify then
GMUI.spotify.login(dc,cb)
end
end,
spLogout=function(cb)
if GMUI.spotify then
GMUI.spotify.logout(cb)
end
end,
spRecent=function(cb)
if GMUI.spotify then
GMUI.spotify.recent(cb)
end
end,
spMyPlaylists=function(cb)
if GMUI.spotify then
GMUI.spotify.myPlaylists(cb)
end
end,
skinApply=function(name,cb)
if GMUI.skin then
GMUI.skin.apply(name,cb)
end
end,
skinRestore=function(cb)
if GMUI.skin then
GMUI.skin.restore(cb)
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
getStrafferInvert=function() return CFG.strafferInvert end,
getStrafferDeadzone=function() return CFG.strafferDeadzone end,
setKeyboard=function(on)
CFG.keystrokesOn=on
APPLIES.keystrokes()
gmMarkConfig()
end,
setKeyScale=function(value)
CFG.keystrokesScale=value
KeysAPI.setScale(value/100)
gmMarkConfig()
end,
setKeyOpacity=function(value)
CFG.keystrokesOpacity=value
KeysAPI.setOpacity(value/100)
gmMarkConfig()
end,
setKeyBgOpacity=function(value)
CFG.keystrokesBgOpacity=value
KeysAPI.setBgOpacity(value/100)
gmMarkConfig()
end,
setKeyDesign=function(name)
CFG.keystrokesDesign=name
KeysAPI.setDesign(name)
gmMarkConfig()
end,
setKeyColor=function(name)
CFG.keystrokesColor=name
KeysAPI.setColor(name)
gmMarkConfig()
end,
setKeyFont=function(name)
CFG.keystrokesFont=name
KeysAPI.setFont(name)
gmMarkConfig()
end,
setKeyWm=function(on)
CFG.keystrokesWm=on
KeysAPI.setWm(on)
gmMarkConfig()
end,
setKeyBg=function(on)
CFG.keystrokesBg=on
KeysAPI.setBg(on)
gmMarkConfig()
end,
setKeyTextSize=function(value)
CFG.keystrokesTextSize=value
KeysAPI.setTextSize(value)
gmMarkConfig()
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
for _,f in ipairs(listfiles()) do
local m=SGM(f,"^GM_foto_(%d+)%.png$")
if not m then
m=SGM(f,"^GM_foto_(%d+)%.jpg$")
end
if m then
local num=tonumber(m)
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
return getcustomasset(target)
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
CFG.profilePhotoSeq=(tonumber(CFG.profilePhotoSeq) or 0)+1
local fname="GM_foto_"..tostring(CFG.profilePhotoSeq).."."..ext
QQ(function()
if type(delfile)=="function" and type(listfiles)=="function" then
for _,f in ipairs(listfiles()) do
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
writefile(fname,content)
end)
if not okW then
return "badwrite",nil
end
gmMarkConfig()
return "ok",fname
end,
deletePhotoFiles=function()
QQ(function()
if type(delfile)=="function" and type(listfiles)=="function" then
for _,f in ipairs(listfiles()) do
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
gmMarkConfig()
end,
setKeyCustomIdle=function(c)
CFG.keystrokesCustomIdle={MFL(c.R*255+0.5),MFL(c.G*255+0.5),MFL(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
gmMarkConfig()
end,
setKeyCustomPressed=function(c)
CFG.keystrokesCustomPressed={MFL(c.R*255+0.5),MFL(c.G*255+0.5),MFL(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
gmMarkConfig()
end,
setKeyCustomText=function(c)
CFG.keystrokesCustomText={MFL(c.R*255+0.5),MFL(c.G*255+0.5),MFL(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
gmMarkConfig()
end,
resetOverlayPosition=function()
KeysAPI.resetPos()
gmMarkConfig()
end,
setIsland=function(on)
CFG.islandOn=on
APPLIES.island()
if GMUI.setIslandActive then
GMUI.setIslandActive(on)
end
gmMarkConfig()
end,
getIslandMode=function()
return CFG.islandMode
end,
setIslandMode=function(label)
CFG.islandMode=label
p5SetIslandMode(label)
gmMarkConfig()
end,
setBhop=function(on)
CFG.bhopOn=on
APPLIES.bhop()
gmMarkConfig()
end,
setBhopKeybind=function(element)
BhopKeybindElement=element
end,
onBhopKeySet=function(name)
CFG.bhopKey=name
gmMarkConfig()
end,
setBhopDelay=function(ms)
CFG.bhopDelay=ms
MOVE.bhopDelayMs=ms
gmMarkConfig()
end,
setCrunch=function(on)
CFG.crunchOn=on
APPLIES.crunch()
gmMarkConfig()
end,
setCrunchKeybind=MOVE.setCrunchKeybind,
onCrunchKeySet=function(name)
CFG.crunchKey=name
gmMarkConfig()
end,
setCrunchSpeed=function(ms)
CFG.crunchSpeed=ms
MOVE.setCrunchSpeed(ms)
gmMarkConfig()
end,
setStraffer=function(on)
CFG.strafferOn=on
APPLIES.straffer()
gmMarkConfig()
end,
setStrafferInvert=function(on)
CFG.strafferInvert=on
MOVE.setStrafferInvert(on)
gmMarkConfig()
end,
setStrafferDeadzone=function(px)
CFG.strafferDeadzone=px
MOVE.setStrafferDeadzone(px)
gmMarkConfig()
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
gmMarkConfig()
end,
setHudSize=function(v)
CFG.hudBtnSize=v
APPLIES.hud()
gmMarkConfig()
end,
setHudOpacity=function(v)
CFG.hudBtnOpacity=v
APPLIES.hud()
gmMarkConfig()
end,
setHudBhopOn=function(on)
CFG.hudBhopOn=on
APPLIES.hud()
gmMarkConfig()
end,
setHudBhopMode=function(mode)
CFG.hudBhopMode=mode
APPLIES.hud()
gmMarkConfig()
end,
setHudCrunchOn=function(on)
CFG.hudCrunchOn=on
APPLIES.hud()
gmMarkConfig()
end,
setHudCrunchMode=function(mode)
CFG.hudCrunchMode=mode
APPLIES.hud()
gmMarkConfig()
end,
getSoundsOn=function() return CFG.soundsOn end,
setSoundsOn=function(on)
CFG.soundsOn=on
GMUI.uiSoundSetEnabled(on)
if on then
TDL(0.08,function()
GMUI.uiSound("toggleOn")
end)
end
gmMarkConfig()
end,
getLanguageLabel=function()
return CFG.language=="en" and "English" or "Espanol"
end,
setLanguage=function(label)
local code=(label=="English") and "en" or "es"
if code==CFG.language then
return
end
local prev=CFG.language
CFG.language=code
GMUI.language=code
gmMarkConfig()
QQ(function()
if GMUI.root then
GMUI.root:Destroy()
end
end)
local okB,errB=QQ(buildGhostUI,ghostCtx)
if okB and GMUI.root then
QQ(function()
if GMUI.setIslandActive then
GMUI.setIslandActive(CFG.islandOn)
end
end)
QQ(APPLIES.all)
notify("Ghost Method",gmT("Idioma aplicado.","Language applied."),4)
else
QQ(function()
writefile("GM_lang_error.txt",os.date("%Y-%m-%d %H:%M:%S")
.." intento de rebuild con idioma="..tostring(code)
.." fallo:\n"..tostring(errB))
end)
CFG.language=prev
GMUI.language=prev
gmMarkConfig()
local okR,errR=QQ(buildGhostUI,ghostCtx)
if okR and GMUI.root then
QQ(function()
if GMUI.setIslandActive then
GMUI.setIslandActive(CFG.islandOn)
end
end)
QQ(APPLIES.all)
notify("Ghost Method",gmT(
"El cambio de idioma fallo - se restauro el idioma anterior. Detalles en GM_lang_error.txt",
"Language switch failed - previous language restored. Details in GM_lang_error.txt"),8)
else
QQ(function()
local f=readfile and isfile and isfile("GM_lang_error.txt") and readfile("GM_lang_error.txt") or ""
writefile("GM_lang_error.txt",f.."\nRECUPERACION TAMBIEN FALLO:\n"..tostring(errR))
end)
notify("Ghost Method",gmT(
"Error de interfaz - re-ejecuta el script. Detalles en GM_lang_error.txt",
"Interface error - re-execute the script. Details in GM_lang_error.txt"),10)
end
end
end,
saveAllNow=function()
if gmSaveConfig then
gmSaveConfig()
notify("Ghost Method",gmT("Configuracion guardada.","Configuration saved."),4)
end
end,
savePreset=function(slot)
local fname="GM_preset_"..(slot=="B" and "B" or "A")..".json"
QQ(function()
local data={mappings={}}
for _,m in ipairs(activeMappings) do
TBI(data.mappings,{from=m.from.name,to=m.to.name})
end
if Unusuals.enabled and activeUnusual then
data.unusual=activeUnusual
end
data.cfg=CFG
writefile(fname,HttpService:JSONEncode(data))
notify("Ghost Method",gmT("Preset "..slot.." guardado (config + emotes + unusual).","Preset "..slot.." saved (config + emotes + unusual)."),4)
end)
end,
applyPreset=function(slot)
local fname="GM_preset_"..(slot=="B" and "B" or "A")..".json"
QQ(function()
if type(isfile)~="function" or not isfile(fname) then
notify("Ghost Method",gmT("Ese preset esta vacio - guardalo primero.","That preset is empty - save it first."),5)
return
end
local raw=HttpService:JSONDecode(readfile(fname))
if type(raw.cfg)=="table" then
for k,v in pairs(raw.cfg) do
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
for _,m in ipairs(raw.mappings) do
local fromE=Catalog.emoteByName[tostring(m.from)]
local toE=Catalog.emoteByName[tostring(m.to)]
if fromE and toE then
p3SetMapping(fromE,toE)
end
end
end
if type(raw.unusual)=="string" and Catalog.unusualByName[raw.unusual] then
removeUnusualNow()
activeUnusual=raw.unusual
Unusuals.enable()
end
GMUI.language=CFG.language=="en" and "en" or "es"
gmMarkConfig()
QQ(function()
if GMUI.root then
GMUI.root:Destroy()
end
end)
local okB=QQ(buildGhostUI,ghostCtx)
if okB and GMUI.root then
if GMUI.setIslandActive then
GMUI.setIslandActive(CFG.islandOn)
end
APPLIES.all()
notify("Ghost Method",gmT("Preset "..slot.." aplicado.","Preset "..slot.." applied."),4)
end
end)
end,
factoryReset=function()
local defaults={
keystrokesOn=false,keystrokesScale=100,keystrokesOpacity=90,
keystrokesBgOpacity=90,keystrokesDesign="Glass",keystrokesColor="Dark",
keystrokesFont="Auto",keystrokesWm=true,keystrokesBg=true,keystrokesTextSize=12,
islandOn=false,islandMode="Ambos",
headlessHead=false,headlessAccs=false,
korbloxOn=false,korbloxLeg="Right",
gfxOn=false,gfxPreset="Realista",gfxSky=false,gfxShiny=30,gfxBloom=100,
gfxShadowDark=0,
filterPreset="Off",filterBrightness=0,filterContrast=0,filterSaturation=0,
timeOn=false,timeClock=14,timeDensity=40,timeHaze=77,
bhopOn=false,bhopKey="Space",bhopDelay=0,
crunchOn=false,crunchSpeed=50,crunchKey="LeftShift",
strafferOn=false,strafferInvert=false,strafferDeadzone=2,
hudBhopOn=false,hudCrunchOn=false,hudBhopMode="Mantener",hudCrunchMode="Mantener",
hudBtnSize=84,hudBtnOpacity=85,hudUnlocked=false,
profilePhotoMode="none",profilePhotoId=0,profilePhotoSeq=0,
crosshairOn=false,crosshairStyle="Cross",crosshairSize=12,
crosshairGap=4,crosshairThick=2,crosshairOpacity=100,
crosshairColor={167,108,255},crosshairOffX=0,crosshairOffY=0,
evadeFontOn=false,evadeFont="Gotham",
musicVolume=50,spotifyDc="",spotifyName="",
}
for k,v in pairs(defaults) do
CFG[k]=v
end
CFG.keystrokesPos=nil
CFG.uiPos=nil
CFG.hudBhopPos=nil
CFG.hudCrunchPos=nil
p3RemoveAllMappings()
removeUnusualNow()
gmMarkConfig()
QQ(function()
if GMUI.root then
GMUI.root:Destroy()
end
end)
local okB=QQ(buildGhostUI,ghostCtx)
if okB and GMUI.root then
if GMUI.setIslandActive then
GMUI.setIslandActive(CFG.islandOn)
end
APPLIES.all()
notify("Ghost Method",gmT("Valores de fabrica restaurados.","Factory settings restored."),5)
end
end,
setHeadlessHead=function(on)
CFG.headlessHead=on
APPLIES.headless()
gmMarkConfig()
end,
setHeadlessAccs=function(on)
CFG.headlessAccs=on
APPLIES.headless()
gmMarkConfig()
end,
setKorblox=function(on)
CFG.korbloxOn=on
APPLIES.korblox()
gmMarkConfig()
end,
setKorbloxLeg=function(label)
local choice=optionToChoice(label)
if choice then
CFG.korbloxLeg=choice
setKorbloxChoice(choice)
gmMarkConfig()
end
end,
openEmotePicker=openEmoteReplacerPicker,
removeAllMappings=function()
p3RemoveAllMappings()
notify("Ghost Method","All emote mappings removed - templates restored.",4)
gmMarkConfig()
end,
openUnusualsPicker=openUnusualsPicker,
setGfx=function(on)
CFG.gfxOn=on
APPLIES.gfx()
gmMarkConfig()
end,
setGfxPreset=function(name)
CFG.gfxPreset=name
p4SetGfxPreset(name)
gmMarkConfig()
end,
setSky=function(on)
CFG.gfxSky=on
p4SetSky(on)
gmMarkConfig()
end,
setShiny=function(v)
CFG.gfxShiny=v
p4SetShiny(v)
gmMarkConfig()
end,
setBloom=function(v)
CFG.gfxBloom=v
p4SetBloom(v)
gmMarkConfig()
end,
getShadowDark=function()
return CFG.gfxShadowDark
end,
setShadowDark=function(v)
CFG.gfxShadowDark=v
DLSSX.shadowDark=v/100
DLSSX.applyShadowDark()
QQ(function()
local ccI=Lighting:FindFirstChild("GM_ColorGrade")
writefile("GM_shadow_debug.txt",
"v="..tostring(v)
.." dark="..tostring(DLSSX.shadowDark)
.." dlssOn="..tostring(Graphics and Graphics.enabled)
.." amb="..tostring(Lighting.Ambient)
.." out="..tostring(Lighting.OutdoorAmbient)
.." env="..tostring(Lighting.EnvironmentDiffuseScale)
.." ccB="..tostring(ccI and ccI.Brightness)
.." ccC="..tostring(ccI and ccI.Contrast))
end)
gmMarkConfig()
end,
setFilterPreset=function(name)
CFG.filterPreset=name
p4SetCCPreset(name)
CFG.filterBrightness=ccVals.brightness*100
CFG.filterContrast=ccVals.contrast*100
CFG.filterSaturation=ccVals.saturation*100
gmMarkConfig()
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
gmMarkConfig()
end,
setTime=function(on)
CFG.timeOn=on
APPLIES.time()
gmMarkConfig()
end,
setClock=function(v)
CFG.timeClock=v
p4SetClock(v)
gmMarkConfig()
end,
setDensity=function(v)
CFG.timeDensity=v*100
p4SetDensity(v)
gmMarkConfig()
end,
setHaze=function(v)
CFG.timeHaze=v*100
p4SetHaze(v)
gmMarkConfig()
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
local why=uiOk and "builder returned no root" or tostring(uiRootOrErr)
error("[GM] custom UI build failed: "..why,0)
end
markStep("custom UI built")
GMUI.finalApply=function()
APPLIES.all()
if GMUI.bootEnables then
for _,fn in ipairs(GMUI.bootEnables) do
QQ(fn)
end
GMUI.bootEnables=nil
end
if GMUI.setIslandActive then
GMUI.setIslandActive(CFG.islandOn)
end
task.defer(function()
runSelfTest(false)
end)
notify("Ghost Method",gmT("cargado - presiona X para el menu","loaded - press X to toggle the menu")
..(GMUI.keyLeftStr and(" | "..gmT("key: te quedan ","key: ")..GMUI.keyLeftStr) or ""),5)
GMUI.finalApply=nil
end
runSelfTest=function(withNotification)
local allOk=true
print("=================================================================")
print("  [Ghost Method] SELF-TEST REPORT    executor: "..executorName())
print("=================================================================")
if GMUI and GMUI.root then
print("[Ghost Method]  Custom UI ............ FOUND / OK")
else
allOk=false
print("[Ghost Method]  Custom UI ............ FAILED - UI root missing")
end
for _,mod in ipairs(Modules) do
local ok,reason=true,nil
if type(mod.enable)~="function" or type(mod.disable)~="function" then
ok,reason=false,"missing enable()/disable()"
end
local wasEnabled=mod.enabled
if ok and not wasEnabled then
local eOk,eErr=QQ(mod.enable,{hidden=true})
if not eOk then
ok,reason=false,"enable() errored: "..tostring(eErr)
end
end
if ok then
local vOk,v1,v2=QQ(mod.verify)
if not vOk then
ok,reason=false,"verify() errored: "..tostring(v1)
elseif v1==false then
ok,reason=false,tostring(v2 or "verification failed")
end
end
if ok and not wasEnabled then
local dOk,dErr=QQ(mod.disable)
if not dOk then
ok,reason=false,"disable() errored: "..tostring(dErr)
elseif type(mod.verifyClean)=="function" then
local cOk,c1,c2=QQ(mod.verifyClean)
if not cOk then
ok,reason=false,"verifyClean() errored: "..tostring(c1)
elseif c1==false then
ok,reason=false,tostring(c2 or "cleanup verification failed")
end
end
end
if not ok then
allOk=false
end
if ok then
print(SFM("[Ghost Method]  %-14s OK",mod.Name))
else
print(SFM("[Ghost Method]  %-14s FAILED - %s",mod.Name,tostring(reason)))
end
mod.lastTestOk=ok
mod.lastTestReason=reason
end
print("=================================================================")
local rigOk,rigProbe=QQ(function()
local rigs=Workspace:FindFirstChild("Rigs")
return rigs and rigs:FindFirstChild(LocalPlayer.Name) or nil
end)
local rig=rigOk and rigProbe or nil
if rig and rig:FindFirstChild("Head") then
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
..(not rig and "rig absent" or tostring(meshErr))..")")
end
print("[Ghost Method]  Phase 3: "..#Catalog.emotes.." emotes, "
..#Catalog.unusuals.." unusuals in catalog (runtime scan)")
print("[Ghost Method]  RESULT: "..(allOk and "ALL SYSTEMS OK" or "FAILURES DETECTED - see lines above"))
print("=================================================================")
if withNotification then
notify(
"Ghost Method - self-test",
allOk and "All modules OK. Full report printed to console (F9)."
or "Failures detected. Full report printed to console (F9).",
7
)
end
QQ(function()
local lines={"Ghost Method self-test @ "..os.date("%Y-%m-%d %H:%M:%S")}
for _,mod in ipairs(Modules) do
TBI(lines,SFM("%-14s %s%s",mod.Name,
mod.lastTestOk and "OK" or "FAILED",
(mod.lastTestOk==false and mod.lastTestReason) and(" - "..tostring(mod.lastTestReason)) or ""))
end
TBI(lines,"catalogs: "..#Catalog.emotes.." emotes, "..#Catalog.unusuals.." unusuals")
writefile("GM_selftest.txt",TCN(lines,"\n"))
end)
return allOk
end
unloadGhost=function()
print("=================================================================")
print("[Ghost Method]  UNLOADING - wiping every connection and instance...")
if gmSaveConfig then
gmSaveConfig()
end
for _,mod in ipairs(Modules) do
QQ(mod.disable)
end
QQ(function()
if GMUI.root then
GMUI.root:Destroy()
end
if GMUI.toasts then
GMUI.toasts:Destroy()
end
GMUI.root=nil
GMUI.toast=nil
GMUI.setVisible=nil
end)
QQ(function()
GMUI.uiSoundSetEnabled(false)
end)
GM_ENV.__GHOST_METHOD_ACTIVE=nil
GM_ENV.GHOST_METHOD_LOADED=nil
print("[Ghost Method]  Unloaded cleanly. Guard flags cleared - safe to re-execute.")
print("=================================================================")
end
if fadeSplash then
fadeSplash()
end
markStep("boot complete")
end
local okBoot,bootReport=xQQ(body,function(err)
local okT,trace=QQ(debug.traceback,err,2)
if okT and type(trace)=="string" and #trace>0 then
return trace
end
return tostring(err)
end)
if not okBoot then
bootCrash(bootReport)
end
