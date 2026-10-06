local IN=Instance.new local U2=UDim2.new local UD=UDim.new local CR=Color3.fromRGB local TX=Enum.TextXAlignment local ES=Enum.EasingStyle local ED=Enum.EasingDirection local EF=Enum.Font
local GM_ENV=(type(getgenv)=="\102\117\110\099\116\105\111\110") and getgenv() or _G
if GM_ENV["\095\095\071\072\079\083\084\095\077\069\084\072\079\068\095\065\067\084\073\086\069"] or GM_ENV["\071\072\079\083\084\095\077\069\084\072\079\068\095\076\079\065\068\069\068"] then
if GM_ENV["\071\077\095\070\079\082\067\069"] then
GM_ENV["\071\077\095\070\079\082\067\069"]=nil
GM_ENV["\095\095\071\072\079\083\084\095\077\069\084\072\079\068\095\065\067\084\073\086\069"]=nil
GM_ENV["\071\072\079\083\084\095\077\069\084\072\079\068\095\076\079\065\068\069\068"]=nil
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\071\077\095\070\079\082\067\069\032\100\101\116\101\099\116\097\100\111\032\045\032\103\117\097\114\100\032\108\105\109\112\105\097\100\111\044\032\114\101\045\101\106\101\099\117\116\097\110\100\111\046")
else
warn("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\068\111\117\098\108\101\032\101\120\101\099\117\116\105\111\110\032\100\101\116\101\099\116\101\100\032\045\032\097\108\114\101\097\100\121\032\114\117\110\110\105\110\103\046\032\083\101\099\111\110\100\032\101\120\101\099\117\116\105\111\110\032\105\103\110\111\114\101\100\046")
warn("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\083\105\032\101\108\032\109\101\110\117\032\110\111\032\114\101\115\112\111\110\100\101\058\032\101\106\101\099\117\116\097\032\103\101\116\103\101\110\118\040\041\046\071\077\095\070\079\082\067\069\032\061\032\116\114\117\101\032\121\032\114\101\045\101\106\101\099\117\116\097\046")
return
end
end
GM_ENV["\095\095\071\072\079\083\084\095\077\069\084\072\079\068\095\065\067\084\073\086\069"]=true
GM_ENV["\071\072\079\083\084\095\077\069\084\072\079\068\095\076\079\065\068\069\068"]=true
local zzV1={}
zzV1.language="\101\115"
local function gmT(es,en)
if zzV1.language=="\101\110" then
return en or es
end
return es
end
zzV1.soundsOn=true
local SND_POOL={}
local SND_KINDS={
click={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\101\108\101\099\116\114\111\110\105\099\112\105\110\103\115\104\111\114\116\046\119\097\118",speed=1.00,vol=0.22},
toggleOn={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\101\108\101\099\116\114\111\110\105\099\112\105\110\103\115\104\111\114\116\046\119\097\118",speed=1.42,vol=0.30},
toggleOff={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\101\108\101\099\116\114\111\110\105\099\112\105\110\103\115\104\111\114\116\046\119\097\118",speed=0.88,vol=0.30},
slider={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\101\108\101\099\116\114\111\110\105\099\112\105\110\103\115\104\111\114\116\046\119\097\118",speed=1.72,vol=0.08},
hover={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\101\108\101\099\116\114\111\110\105\099\112\105\110\103\115\104\111\114\116\046\119\097\118",speed=2.05,vol=0.05},
pop={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\101\108\101\099\116\114\111\110\105\099\112\105\110\103\115\104\111\114\116\046\119\097\118",speed=1.18,vol=0.22},
open={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\115\119\111\111\115\104\046\119\097\118",speed=0.92,vol=0.20},
close={id="\114\098\120\097\115\115\101\116\058\047\047\115\111\117\110\100\115\047\115\119\111\111\115\104\046\119\097\118",speed=1.22,vol=0.20},
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
pcall(function()
created=IN("\083\111\117\110\100")
created.SoundId=def.id
created.Parent=game:GetService("\083\111\117\110\100\083\101\114\118\105\099\101")
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
pcall(function()
s:Stop()
s.PlaybackSpeed=def.speed
s.Volume=def.vol
s:Play()
end)
end
zzV1.uiSoundSetEnabled=function(on)
zzV1.soundsOn=on and true or false
if not on then
for _,s in pairs(SND_POOL) do
if s then
pcall(function()
s:Stop()
end)
end
end
end
end
zzV1["\097\099\099\101\115\115\068\097\116\097"]=nil
zzV1["\097\099\099\101\115\115\084\111\107\101\110"]=nil
local function zzV5(a,b,c)
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
zzV1["\097\099\099\101\115\115\079\107"]=function()
local tok=zzV1["\097\099\099\101\115\115\084\111\107\101\110"]
local dat=zzV1["\097\099\099\101\115\115\068\097\116\097"]
if type(tok)~="\110\117\109\098\101\114" or type(dat)~="\116\097\098\108\101" then
return false
end
local exp=tonumber(dat.expires)
if not exp or os.time()>exp then
return false
end
return tok==zzV5(dat.expires,dat.user,dat.key)
end
local GuiParent
local LocalPlayer
local SplashRef
local LAST_STEP="\115\099\114\105\112\116\032\115\116\097\114\116"
local function markStep(label)
LAST_STEP=label
print("\091\071\077\093\032"..label)
end
local function bootCrash(report)
local reportText=tostring(report)
local message=reportText
local trace="\040\110\111\032\116\114\097\099\101\098\097\099\107\032\097\118\097\105\108\097\098\108\101\032\102\114\111\109\032\116\104\105\115\032\101\120\101\099\117\116\111\114\041"
local nl=string.find(reportText,"\010",1,true)
if nl then
message=string.sub(reportText,1,nl - 1)
trace=string.sub(reportText,nl+1)
end
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\066\079\079\084\032\067\082\065\083\072\032\097\102\116\101\114\032\115\116\101\112\058\032"..LAST_STEP)
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\069\114\114\111\114\058\032"..message)
print(trace)
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
pcall(function()
local lines={
"\071\104\111\115\116\032\077\101\116\104\111\100\032\098\111\111\116\032\099\114\097\115\104\058",
"\102\097\105\108\101\100\032\097\102\116\101\114\032\115\116\101\112\058\032"..LAST_STEP,
"",
"\101\114\114\111\114\058",
message,
"",
"\116\114\097\099\101\098\097\099\107\058",
trace,
}
writefile("\071\077\095\098\111\111\116\108\111\103\046\116\120\116",table.concat(lines,"\010"))
end)
local shown=false
if zzV1 and type(zzV1.toast)=="\102\117\110\099\116\105\111\110" then
shown=pcall(function()
zzV1.toast(
"\071\104\111\115\116\032\077\101\116\104\111\100\032\045\032\098\111\111\116\032\101\114\114\111\114",
"\070\097\105\108\101\100\032\097\102\116\101\114\032\091"
..LAST_STEP
.."\093\032\032\124\032\032"
..string.sub(message,1,260),
5
)
end)
end
if not shown then
pcall(function()
local parent
if LocalPlayer then
parent=LocalPlayer:FindFirstChildOfClass("\080\108\097\121\101\114\071\117\105")
end
if not parent then
parent=GuiParent or game:GetService("\067\111\114\101\071\117\105")
end
local banner=IN("\083\099\114\101\101\110\071\117\105")
banner.Name="\071\077\095\066\111\111\116\067\114\097\115\104"
banner.ResetOnSpawn=false
banner.DisplayOrder=2147483647
banner.Parent=parent
local frame=IN("\070\114\097\109\101")
frame.AnchorPoint=Vector2.new(0.5,0.5)
frame.Position=U2(0.5,0,0.5,0)
frame.Size=U2(0,520,0,120)
frame.BackgroundColor3=CR(16,10,26)
frame.BackgroundTransparency=0.05
frame.BorderSizePixel=0
frame.Parent=banner
IN("\085\073\067\111\114\110\101\114",frame).CornerRadius=UD(0,12)
local stroke=IN("\085\073\083\116\114\111\107\101")
stroke.Color=CR(255,80,80)
stroke.Thickness=2
stroke.Parent=frame
local title=IN("\084\101\120\116\076\097\098\101\108")
title.BackgroundTransparency=1
title.Position=U2(0,14,0,8)
title.Size=U2(1,-28,0,22)
title.Font=EF.GothamBold
title.Text="\071\072\079\083\084\032\077\069\084\072\079\068\032\124\032\066\079\079\084\032\069\082\082\079\082"
title.TextColor3=CR(255,120,120)
title.TextSize=17
title.TextXAlignment=TX.Left
title.Parent=frame
local body=IN("\084\101\120\116\076\097\098\101\108")
body.BackgroundTransparency=1
body.Position=U2(0,14,0,34)
body.Size=U2(1,-28,1,-44)
body.Font=EF.Code
body.Text="\091"..LAST_STEP.."\093\032\032"..message
body.TextColor3=CR(238,234,248)
body.TextSize=14
body.TextWrapped=true
body.TextXAlignment=TX.Left
body.TextYAlignment=Enum.TextYAlignment.Top
body.Parent=frame
task.delay(15,function()
banner:Destroy()
end)
end)
end
if SplashRef then
pcall(function()
SplashRef:Destroy()
end)
SplashRef=nil
end
pcall(function()
local splashBlur=game:GetService("\076\105\103\104\116\105\110\103"):FindFirstChild("\071\077\095\083\112\108\097\115\104\066\108\117\114")
if splashBlur then
splashBlur:Destroy()
end
end)
GM_ENV["\095\095\071\072\079\083\084\095\077\069\084\072\079\068\095\065\067\084\073\086\069"]=nil
GM_ENV["\071\072\079\083\084\095\077\069\084\072\079\068\095\076\079\065\068\069\068"]=nil
end
local function buildGhostUI(ctx)
local TweenService=ctx.TweenService
local UserInputService=ctx.UserInputService
local LocalPlayer=ctx.LocalPlayer
local Workspace=game:GetService("\087\111\114\107\115\112\097\099\101")
local C_WINDOW=CR(13,13,13)
local C_SIDEBAR=CR(15,15,15)
local C_CARD=CR(26,26,26)
local C_PILL=CR(38,38,38)
local C_HOVER=CR(26,26,26)
local C_PROFILE=CR(22,22,22)
local C_POPUP=CR(32,32,32)
local C_POPUP_HOVER=CR(46,46,46)
local C_TRACK_OFF=CR(51,51,51)
local C_KNOB_OFF=CR(207,207,207)
local C_TRACK_ON=CR(242,242,242)
local C_KNOB_ON=CR(17,17,17)
local C_TEXT=CR(245,245,245)
local C_DIM=CR(138,138,138)
local C_OFF=CR(154,154,154)
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
local SWITCH_W=TOUCH and 40 or 34
local SWITCH_H=TOUCH and 22 or 18
local KNOB_D=TOUCH and 16 or 14
local CTRL_ROW_H=TOUCH and 44 or 30
local PILL_H=TOUCH and 34 or 28
local BTN_H=TOUCH and 38 or 28
local BTN_FULL_H=TOUCH and 42 or 30
local GRID_PAD_Y=TOUCH and 12 or 8
local CARD_GAP=TOUCH and 10 or 8
local POPUP_OPT_H=TOUCH and 34 or 24
local POPUP_OPT_GAP=TOUCH and 4 or 2
local TRACK_H=TOUCH and 12 or 6
local TRACK_KNOB_D=TOUCH and 26 or 16
local uiConns={}
local function bindConn(conn)
uiConns[#uiConns+1]=conn
return conn
end
local root=IN("\083\099\114\101\101\110\071\117\105")
root.Name="\071\077\095\085\073"
root.ResetOnSpawn=false
root.IgnoreGuiInset=true
root.DisplayOrder=500
root.Parent=ctx.GuiParent
root.Destroying:Connect(function()
for _,c in ipairs(uiConns) do
pcall(function()
c:Disconnect()
end)
end
end)
local uiScale=IN("\085\073\083\099\097\108\101")
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
bindConn(Workspace:GetPropertyChangedSignal("\067\117\114\114\101\110\116\067\097\109\101\114\097"):Connect(function()
fitScale()
local cam=Workspace.CurrentCamera
if cam then
bindConn(cam:GetPropertyChangedSignal("\086\105\101\119\112\111\114\116\083\105\122\101"):Connect(fitScale))
end
end))
local shadows={}
do
local defs={{8,0.84},{18,0.92},{30,0.955}}
for i,def in ipairs(defs) do
local sh=IN("\070\114\097\109\101")
sh.Name="\083\104\097\100\111\119"..i
sh.AnchorPoint=Vector2.new(0.5,0.5)
sh.Position=U2(0.5,0,0.5,0)
sh.Size=UDim2.fromOffset(WIN_W+def[1]*2,WIN_H+def[1]*2)
sh.BackgroundColor3=Color3.new(0,0,0)
sh.BackgroundTransparency=def[2]
sh.BorderSizePixel=0
sh.ZIndex=1
local sc=IN("\085\073\067\111\114\110\101\114")
sc.CornerRadius=UD(0,14+def[1])
sc.Parent=sh
sh.Parent=root
shadows[i]=sh
end
end
local main=IN("\070\114\097\109\101")
main.Name="\077\097\105\110"
main.AnchorPoint=Vector2.new(0.5,0.5)
main.Position=U2(0.5,0,0.5,0)
main.Size=UDim2.fromOffset(WIN_W,WIN_H)
main.BackgroundColor3=C_WINDOW
main.BackgroundTransparency=0.05
main.BorderSizePixel=0
main.ClipsDescendants=true
main.ZIndex=2
local mainCorner=IN("\085\073\067\111\114\110\101\114")
mainCorner.CornerRadius=UD(0,14)
mainCorner.Parent=main
main.Parent=root
local popLayer=IN("\070\114\097\109\101")
popLayer.Name="\080\111\112\076\097\121\101\114"
popLayer.BackgroundTransparency=1
popLayer.Size=UDim2.fromScale(1,1)
popLayer.Visible=true
popLayer.ZIndex=40
popLayer.Parent=main
local popups={}
local function closeAllPopups()
for _,p in ipairs(popups) do
p.close()
end
end
local content=IN("\070\114\097\109\101")
content.Name="\067\111\110\116\101\110\116"
content.BackgroundTransparency=1
content.Position=UDim2.fromOffset(SIDEBAR_W,0)
content.Size=U2(1,-SIDEBAR_W,1,0)
content.ZIndex=3
content.Parent=main
local pages={}
local pageOrder=0
local function mkPage()
pageOrder+=1
local scroll=IN("\083\099\114\111\108\108\105\110\103\070\114\097\109\101")
scroll.Name="\080\097\103\101"..pageOrder
scroll.Visible=false
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.Size=UDim2.fromScale(1,1)
scroll.CanvasSize=U2(0,0,0,0)
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
scroll.ScrollBarThickness=5
scroll.ScrollBarImageColor3=CR(170,170,170)
scroll.ScrollBarImageTransparency=0.5
scroll.ScrollingDirection=Enum.ScrollingDirection.Y
scroll.ElasticBehavior=Enum.ElasticBehavior.WhenScrollable
scroll.Active=true
scroll.ZIndex=3
local pad=IN("\085\073\080\097\100\100\105\110\103")
pad.PaddingTop=UD(0,12)
pad.PaddingBottom=UD(0,14)
pad.PaddingLeft=UD(0,14)
pad.PaddingRight=UD(0,10)
pad.Parent=scroll
local lay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
lay.Padding=UD(0,12)
lay.SortOrder=Enum.SortOrder.LayoutOrder
lay.Parent=scroll
scroll.Parent=content
pages[pageOrder]=scroll
return scroll
end
local function mkIcon(parent,kind,tint)
local holder=IN("\070\114\097\109\101")
holder.Name="\073\099\111\110\095"..kind
holder.BackgroundTransparency=1
holder.Size=UDim2.fromOffset(16,16)
local pieces={}
local function bar(x,y,w,h,rot,filled,round)
local g=IN("\070\114\097\109\101")
g.BorderSizePixel=0
g.Position=UDim2.fromOffset(x - 1,y - 1)
g.Size=UDim2.fromOffset(w+2,h+2)
g.Rotation=rot or 0
g.Parent=holder
if filled then
g.BackgroundColor3=tint
g.BackgroundTransparency=0.84
if round then
local gc=IN("\085\073\067\111\114\110\101\114")
gc.CornerRadius=UD(1,0)
gc.Parent=g
end
else
g.BackgroundTransparency=1
local gs=IN("\085\073\083\116\114\111\107\101")
gs.Thickness=2.5
gs.Color=tint
gs.Transparency=0.86
gs.Parent=g
if round then
local gc=IN("\085\073\067\111\114\110\101\114")
gc.CornerRadius=UD(1,0)
gc.Parent=g
end
end
local f=IN("\070\114\097\109\101")
f.BorderSizePixel=0
f.Position=UDim2.fromOffset(x,y)
f.Size=UDim2.fromOffset(w,h)
f.Rotation=rot or 0
if filled then
f.BackgroundColor3=tint
pieces[#pieces+1]={frame=f}
else
f.BackgroundTransparency=1
local st=IN("\085\073\083\116\114\111\107\101")
st.Thickness=1.5
st.Color=tint
st.Parent=f
pieces[#pieces+1]={frame=f,stroke=st}
end
if round then
local cr=IN("\085\073\067\111\114\110\101\114")
cr.CornerRadius=UD(1,0)
cr.Parent=f
end
f.Parent=holder
end
if kind=="\104\117\100" then
bar(2,2,12,12,45,false,true)
bar(6,6,4,4,0,true,true)
elseif kind=="\109\111\118\101" then
bar(7,2,2,11,0,true,true)
bar(3.5,4.5,7,2,45,true,true)
bar(5.5,4.5,7,2,-45,true,true)
elseif kind=="\101\121\101" then
bar(1,3,14,10,0,false,true)
bar(6,6,4,4,0,true,true)
bar(-1.5,6.5,4,3,45,true,true)
bar(13.5,6.5,4,3,-45,true,true)
elseif kind=="\115\112\097\114\107\108\101" then
bar(3.5,3.5,9,9,45,false)
bar(12,1.5,3,3,0,true,true)
bar(0.5,11,2,2,0,true,true)
bar(12.5,12,1.5,1.5,0,true,true)
elseif kind=="\115\108\105\100\101\114\115" then
bar(1,3,14,1.5,0,true)
bar(10,1.5,4,4,0,true,true)
bar(1,7.25,14,1.5,0,true)
bar(4,5.75,4,4,0,true,true)
bar(1,11.5,14,1.5,0,true)
bar(8,10.25,4,4,0,true,true)
elseif kind=="\109\117\115\105\099" then
bar(4,4,2,8,0,true,true)
bar(10,4,2,8,0,true,true)
bar(3,2,10,2.5,0,true)
bar(1.5,10,5.5,4.5,0,true,true)
bar(8.5,10,5.5,4.5,0,true,true)
elseif kind=="\103\101\097\114" then
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
if d:IsA("\070\114\097\109\101") and d~=api.frame then
local gs=d:FindFirstChildOfClass("\085\073\083\116\114\111\107\101")
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
local sidebar=IN("\070\114\097\109\101")
sidebar.Name="\083\105\100\101\098\097\114"
sidebar.Size=U2(0,SIDEBAR_W,1,0)
sidebar.BackgroundColor3=C_SIDEBAR
sidebar.BorderSizePixel=0
sidebar.ZIndex=3
local sbCorner=IN("\085\073\067\111\114\110\101\114")
sbCorner.CornerRadius=UD(0,14)
sbCorner.Parent=sidebar
sidebar.Parent=main
local logo=IN("\084\101\120\116\076\097\098\101\108")
logo.Name="\076\111\103\111"
logo.BackgroundTransparency=1
logo.Position=UDim2.fromOffset(16,10)
logo.Size=UDim2.fromOffset(SIDEBAR_W - 30,34)
logo.Font=WIN_FONT_GOTHIC
logo.TextSize=27
logo.RichText=true
logo.TextXAlignment=TX.Left
logo.TextYAlignment=Enum.TextYAlignment.Center
logo.TextColor3=C_TEXT
logo.Text="\071\104\111\115\116\032\060\102\111\110\116\032\099\111\108\111\114\061\034\035\065\055\054\067\070\070\034\062\077\101\116\104\111\100\060\047\102\111\110\116\062"
logo.ZIndex=4
logo.Parent=sidebar
local navHolder=IN("\070\114\097\109\101")
navHolder.Name="\078\097\118"
navHolder.BackgroundTransparency=1
navHolder.Position=UDim2.fromOffset(12,58)
navHolder.Size=U2(1,-24,1,-58 - 74)
navHolder.ZIndex=4
navHolder.Parent=sidebar
local navLayout=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
navLayout.Padding=UD(0,6)
navLayout.SortOrder=Enum.SortOrder.LayoutOrder
navLayout.Parent=navHolder
local profile=IN("\070\114\097\109\101")
profile.Name="\080\114\111\102\105\108\101"
profile.AnchorPoint=Vector2.new(0,1)
profile.Position=U2(0,12,1,-12)
profile.Size=U2(1,-24,0,58)
profile.BackgroundColor3=C_PROFILE
profile.BorderSizePixel=0
profile.ZIndex=3
local pfCorner=IN("\085\073\067\111\114\110\101\114")
pfCorner.CornerRadius=UD(0,10)
pfCorner.Parent=profile
profile.Parent=sidebar
local avatar=IN("\070\114\097\109\101")
avatar.Name="\065\118\097\116\097\114"
avatar.Position=UDim2.fromOffset(12,14)
avatar.Size=UDim2.fromOffset(30,30)
avatar.BackgroundColor3=C_PILL
avatar.BorderSizePixel=0
avatar.ZIndex=4
local avCorner=IN("\085\073\067\111\114\110\101\114")
avCorner.CornerRadius=UD(1,0)
avCorner.Parent=avatar
local avRing=IN("\085\073\083\116\114\111\107\101")
avRing.Color=C_ACCENT
avRing.Thickness=1.5
avRing.Transparency=0.35
avRing.Parent=avatar
avatar.Parent=profile
local initial=IN("\084\101\120\116\076\097\098\101\108")
initial.BackgroundTransparency=1
initial.Size=UDim2.fromScale(1,1)
initial.Font=WIN_FONT_BOLD
initial.TextSize=13
initial.TextColor3=C_DIM
initial.Text=string.sub(LocalPlayer.DisplayName,1,1)
initial.ZIndex=4
initial.Parent=avatar
local thumb=IN("\073\109\097\103\101\076\097\098\101\108")
thumb.Name="\084\104\117\109\098"
thumb.BackgroundTransparency=1
thumb.Size=UDim2.fromScale(1,1)
thumb.Image="\114\098\120\116\104\117\109\098\058\047\047\116\121\112\101\061\065\118\097\116\097\114\072\101\097\100\083\104\111\116\038\105\100\061"..LocalPlayer.UserId.."\038\119\061\052\056\038\104\061\052\056"
thumb.ZIndex=5
local thCorner=IN("\085\073\067\111\114\110\101\114")
thCorner.CornerRadius=UD(1,0)
thCorner.Parent=thumb
thumb.Parent=avatar
pcall(function()
local AVATAR_DEFAULT="\114\098\120\116\104\117\109\098\058\047\047\116\121\112\101\061\065\118\097\116\097\114\072\101\097\100\083\104\111\116\038\105\100\061"..LocalPlayer.UserId.."\038\119\061\052\056\038\104\061\052\056"
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
if photoState.mode=="\097\115\115\101\116" and photoState.assetId and photoState.assetId>0 then
setPhotoImage("\114\098\120\097\115\115\101\116\105\100\058\047\047"..tostring(photoState.assetId))
photoActive=true
elseif photoState.mode=="\102\105\108\101" then
local status,url=ctx.photoFileStatus()
if status=="\111\107" and url then
setPhotoImage(url)
photoActive=true
else
setPhotoImage(nil)
if zzV1.toast then
zzV1.toast("\071\104\111\115\116\032\077\101\116\104\111\100","\076\097\032\102\111\116\111\032\040\071\077\095\102\111\116\111\046\112\110\103\047\106\112\103\041\032\110\111\032\101\115\116\097\032\101\110\032\101\108\032\119\111\114\107\115\112\097\099\101\032\045\032\097\118\097\116\097\114\032\110\111\114\109\097\108\046",6)
end
end
else
setPhotoImage(nil)
end
local avDim=IN("\070\114\097\109\101")
avDim.Name="\068\105\109"
avDim.Size=UDim2.fromScale(1,1)
avDim.BackgroundColor3=Color3.new(0,0,0)
avDim.BackgroundTransparency=0.45
avDim.BorderSizePixel=0
avDim.Visible=false
avDim.ZIndex=6
local dimCorner=IN("\085\073\067\111\114\110\101\114")
dimCorner.CornerRadius=UD(1,0)
dimCorner.Parent=avDim
avDim.Parent=avatar
local pencil=IN("\070\114\097\109\101")
pencil.Name="\080\101\110\099\105\108"
pencil.BackgroundTransparency=1
pencil.AnchorPoint=Vector2.new(0.5,0.5)
pencil.Position=UDim2.fromScale(0.5,0.5)
pencil.Size=UDim2.fromScale(1,1)
pencil.Visible=false
pencil.ZIndex=7
pencil.Parent=avatar
local pShaft=IN("\070\114\097\109\101")
pShaft.AnchorPoint=Vector2.new(0.5,0.5)
pShaft.Position=U2(0.54,1,0.46,-1)
pShaft.Size=UDim2.fromOffset(9,2.4)
pShaft.Rotation=45
pShaft.BackgroundColor3=C_TEXT
pShaft.BorderSizePixel=0
local shaftCorner=IN("\085\073\067\111\114\110\101\114")
shaftCorner.CornerRadius=UD(1,0)
shaftCorner.Parent=pShaft
pShaft.Parent=pencil
local pTip=IN("\070\114\097\109\101")
pTip.AnchorPoint=Vector2.new(0.5,0.5)
pTip.Position=U2(0.2,0,0.8,0)
pTip.Size=UDim2.fromOffset(3.6,3.2)
pTip.Rotation=45
pTip.BackgroundColor3=C_TEXT
pTip.BorderSizePixel=0
local tipCorner=IN("\085\073\067\111\114\110\101\114")
tipCorner.CornerRadius=UD(1,0)
tipCorner.Parent=pTip
pTip.Parent=pencil
local dotsBtn=IN("\084\101\120\116\066\117\116\116\111\110")
dotsBtn.Name="\068\111\116\115"
dotsBtn.Text=""
dotsBtn.AutoButtonColor=false
dotsBtn.BackgroundTransparency=1
dotsBtn.Position=UDim2.fromOffset(44,18)
dotsBtn.Size=UDim2.fromOffset(12,22)
dotsBtn.Visible=false
dotsBtn.ZIndex=9
dotsBtn.Parent=profile
for i=0,2 do
local d=IN("\070\114\097\109\101")
d.AnchorPoint=Vector2.new(0.5,0)
d.Position=U2(0.5,0,0,i*8)
d.Size=UDim2.fromOffset(3.5,3.5)
d.BackgroundColor3=C_TEXT
d.BackgroundTransparency=0.15
d.BorderSizePixel=0
local dCorner=IN("\085\073\067\111\114\110\101\114")
dCorner.CornerRadius=UD(1,0)
dCorner.Parent=d
d.Parent=dotsBtn
end
local hoverBtn=IN("\084\101\120\116\066\117\116\116\111\110")
hoverBtn.Name="\072\111\118\101\114"
hoverBtn.Text=""
hoverBtn.AutoButtonColor=false
hoverBtn.BackgroundTransparency=1
hoverBtn.Size=UDim2.fromScale(1,1)
hoverBtn.ZIndex=8
hoverBtn.Parent=avatar
local photoMenu=IN("\070\114\097\109\101")
photoMenu.Name="\080\104\111\116\111\077\101\110\117"
photoMenu.Visible=false
photoMenu.BackgroundColor3=C_POPUP
photoMenu.BackgroundTransparency=0.04
photoMenu.BorderSizePixel=0
photoMenu.Size=UDim2.fromOffset(96,60)
photoMenu.ZIndex=40
local pmCorner=IN("\085\073\067\111\114\110\101\114")
pmCorner.CornerRadius=UD(0,10)
pmCorner.Parent=photoMenu
local pmPad=IN("\085\073\080\097\100\100\105\110\103")
pmPad.PaddingTop=UD(0,4)
pmPad.PaddingBottom=UD(0,4)
pmPad.PaddingLeft=UD(0,4)
pmPad.PaddingRight=UD(0,4)
pmPad.Parent=photoMenu
local pmLay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
pmLay.Padding=UD(0,2)
pmLay.SortOrder=Enum.SortOrder.LayoutOrder
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
local photoDialog=IN("\070\114\097\109\101")
photoDialog.Name="\080\104\111\116\111\068\105\097\108\111\103"
photoDialog.Visible=false
photoDialog.BackgroundColor3=C_POPUP
photoDialog.BackgroundTransparency=0.04
photoDialog.BorderSizePixel=0
photoDialog.Size=UDim2.fromOffset(300,200)
photoDialog.ZIndex=40
local pdCorner=IN("\085\073\067\111\114\110\101\114")
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
local pdTitle=IN("\084\101\120\116\076\097\098\101\108")
pdTitle.BackgroundTransparency=1
pdTitle.Position=UDim2.fromOffset(14,10)
pdTitle.Size=U2(1,-28,0,20)
pdTitle.Font=WIN_FONT_MED
pdTitle.TextSize=16
pdTitle.TextXAlignment=TX.Left
pdTitle.TextColor3=C_TEXT
pdTitle.Text="\070\111\116\111\032\100\101\032\112\101\114\102\105\108"
pdTitle.ZIndex=41
pdTitle.Parent=photoDialog
local pdUrlLabel=IN("\084\101\120\116\076\097\098\101\108")
pdUrlLabel.BackgroundTransparency=1
pdUrlLabel.Position=UDim2.fromOffset(14,34)
pdUrlLabel.Size=U2(1,-28,0,12)
pdUrlLabel.Font=WIN_FONT_MED
pdUrlLabel.TextSize=11
pdUrlLabel.TextXAlignment=TX.Left
pdUrlLabel.TextColor3=C_TEXT
pdUrlLabel.Text="\080\101\103\097\032\101\108\032\108\105\110\107\032\100\101\032\116\117\032\105\109\097\103\101\110\058"
pdUrlLabel.ZIndex=41
pdUrlLabel.Parent=photoDialog
local pdUrlBox=IN("\084\101\120\116\066\111\120")
pdUrlBox.Name="\085\114\108\066\111\120"
pdUrlBox.PlaceholderText="\104\116\116\112\115\058\047\047\046\046\046\032\040\105\109\103\117\114\044\032\067\068\078\044\032\101\116\099\041"
pdUrlBox.Text=""
pdUrlBox.Font=WIN_FONT_MED
pdUrlBox.TextSize=10
pdUrlBox.TextColor3=C_TEXT
pdUrlBox.PlaceholderColor3=C_DIM
pdUrlBox.BackgroundColor3=C_PILL
pdUrlBox.BorderSizePixel=0
pdUrlBox.Position=UDim2.fromOffset(14,50)
pdUrlBox.Size=UDim2.fromOffset(212,26)
pdUrlBox.ZIndex=41
pdUrlBox.ClearTextOnFocus=false
local puCorner=IN("\085\073\067\111\114\110\101\114")
puCorner.CornerRadius=UD(0,8)
puCorner.Parent=pdUrlBox
local puPad=IN("\085\073\080\097\100\100\105\110\103")
puPad.PaddingLeft=UD(0,8)
puPad.PaddingRight=UD(0,8)
puPad.Parent=pdUrlBox
pdUrlBox.Parent=photoDialog
local pdLoad=IN("\084\101\120\116\066\117\116\116\111\110")
pdLoad.Name="\076\111\097\100\085\114\108"
pdLoad.AutoButtonColor=false
pdLoad.BackgroundColor3=C_ACCENT
pdLoad.BackgroundTransparency=0.25
pdLoad.Position=UDim2.fromOffset(232,50)
pdLoad.Size=UDim2.fromOffset(54,26)
pdLoad.Font=WIN_FONT_MED
pdLoad.TextSize=11
pdLoad.TextColor3=C_TEXT
pdLoad.Text="\067\097\114\103\097\114"
pdLoad.ZIndex=41
local plCorner=IN("\085\073\067\111\114\110\101\114")
plCorner.CornerRadius=UD(0,8)
plCorner.Parent=pdLoad
pdLoad.Parent=photoDialog
local pdStatus=IN("\084\101\120\116\076\097\098\101\108")
pdStatus.BackgroundTransparency=1
pdStatus.Position=UDim2.fromOffset(14,80)
pdStatus.Size=U2(1,-28,0,14)
pdStatus.Font=WIN_FONT_MED
pdStatus.TextSize=10
pdStatus.TextXAlignment=TX.Left
pdStatus.TextColor3=C_ACCENT
pdStatus.Text=""
pdStatus.ZIndex=41
pdStatus.Parent=photoDialog
local pdHint=IN("\084\101\120\116\076\097\098\101\108")
pdHint.BackgroundTransparency=1
pdHint.Position=UDim2.fromOffset(14,96)
pdHint.Size=U2(1,-28,0,12)
pdHint.Font=WIN_FONT
pdHint.TextSize=9
pdHint.TextXAlignment=TX.Left
pdHint.TextColor3=C_DIM
pdHint.Text="\082\101\099\111\109\101\110\100\097\100\111\058\032\105\109\097\103\101\110\032\099\117\097\100\114\097\100\097\044\032\101\106\032\053\048\048\120\053\048\048\112\120\046\032\083\101\032\097\106\117\115\116\097\032\097\108\032\105\099\111\110\111\032\115\111\108\097\046"
pdHint.ZIndex=41
pdHint.Parent=photoDialog
local pdIdLabel=IN("\084\101\120\116\076\097\098\101\108")
pdIdLabel.BackgroundTransparency=1
pdIdLabel.Position=UDim2.fromOffset(14,116)
pdIdLabel.Size=U2(1,-28,0,12)
pdIdLabel.Font=WIN_FONT_MED
pdIdLabel.TextSize=11
pdIdLabel.TextXAlignment=TX.Left
pdIdLabel.TextColor3=C_TEXT
pdIdLabel.Text="\111\032\117\110\032\065\115\115\101\116\032\073\068\032\100\101\032\082\111\098\108\111\120\058"
pdIdLabel.ZIndex=41
pdIdLabel.Parent=photoDialog
local pdBox=IN("\084\101\120\116\066\111\120")
pdBox.PlaceholderText="\065\115\115\101\116\032\073\068\032\040\110\117\109\101\114\111\115\041"
pdBox.Text=""
pdBox.Font=WIN_FONT_MED
pdBox.TextSize=11
pdBox.TextColor3=C_TEXT
pdBox.PlaceholderColor3=C_DIM
pdBox.BackgroundColor3=C_PILL
pdBox.BorderSizePixel=0
pdBox.Position=UDim2.fromOffset(14,132)
pdBox.Size=UDim2.fromOffset(160,26)
pdBox.ZIndex=41
pdBox.ClearTextOnFocus=false
local pbCorner=IN("\085\073\067\111\114\110\101\114")
pbCorner.CornerRadius=UD(0,8)
pbCorner.Parent=pdBox
local pbPad=IN("\085\073\080\097\100\100\105\110\103")
pbPad.PaddingLeft=UD(0,8)
pbPad.PaddingRight=UD(0,8)
pbPad.Parent=pdBox
pdBox.Parent=photoDialog
local pdApply=IN("\084\101\120\116\066\117\116\116\111\110")
pdApply.Name="\065\112\112\108\121\073\100"
pdApply.AutoButtonColor=false
pdApply.BackgroundColor3=C_PILL
pdApply.Position=UDim2.fromOffset(180,132)
pdApply.Size=UDim2.fromOffset(62,26)
pdApply.Font=WIN_FONT_MED
pdApply.TextSize=11
pdApply.TextColor3=C_TEXT
pdApply.Text="\065\112\108\105\099\097\114\032\073\068"
pdApply.ZIndex=41
local paCorner=IN("\085\073\067\111\114\110\101\114")
paCorner.CornerRadius=UD(0,8)
paCorner.Parent=pdApply
pdApply.Parent=photoDialog
local pdFileNote=IN("\084\101\120\116\076\097\098\101\108")
pdFileNote.BackgroundTransparency=1
pdFileNote.Position=UDim2.fromOffset(14,164)
pdFileNote.Size=U2(1,-28,0,12)
pdFileNote.Font=WIN_FONT
pdFileNote.TextSize=9
pdFileNote.TextXAlignment=TX.Left
pdFileNote.TextColor3=C_DIM
pdFileNote.Text="\069\120\116\114\097\058\032\071\077\095\102\111\116\111\046\112\110\103\047\106\112\103\032\101\110\032\101\108\032\119\111\114\107\115\112\097\099\101\032\115\101\032\100\101\116\101\099\116\097\032\115\111\108\111\046"
pdFileNote.ZIndex=41
pdFileNote.Parent=photoDialog
local pdClose=IN("\084\101\120\116\066\117\116\116\111\110")
pdClose.Name="\067\108\111\115\101"
pdClose.AutoButtonColor=false
pdClose.BackgroundColor3=C_PILL
pdClose.Position=U2(1,-76,1,-34)
pdClose.Size=UDim2.fromOffset(62,24)
pdClose.Font=WIN_FONT_MED
pdClose.TextSize=11
pdClose.TextColor3=C_DIM
pdClose.Text="\067\101\114\114\097\114"
pdClose.ZIndex=41
local pcCorner=IN("\085\073\067\111\114\110\101\114")
pcCorner.CornerRadius=UD(0,8)
pcCorner.Parent=pdClose
pdClose.Parent=photoDialog
local pollToken=0
local function startPolling()
pollToken=pollToken+1
local myToken=pollToken
task.spawn(function()
while dlgOpen and myToken==pollToken do
local status,url=ctx.photoFileStatus()
if status=="\111\107" and url then
photoActive=true
setPhotoImage(url)
ctx.savePhotoMode("\102\105\108\101",0)
dlgEntry.close()
if zzV1.toast then
zzV1.toast("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\070\111\116\111\032\097\112\108\105\099\097\100\097\032\100\101\115\100\101\032\071\077\095\102\111\116\111\046\112\110\103\046","\080\104\111\116\111\032\097\112\112\108\105\101\100\032\102\114\111\109\032\071\077\095\102\111\116\111\046\112\110\103\046"),5)
end
return
elseif status=="\110\111\102\117\110\099" then
pdStatus.Text="\069\115\116\101\032\101\120\101\099\117\116\111\114\032\110\111\032\108\101\101\032\097\114\099\104\105\118\111\115\032\045\032\117\115\097\032\108\105\110\107\032\111\032\065\115\115\101\116\032\073\068\046"
elseif status=="\098\097\100\102\105\108\101" then
pdStatus.Text="\071\077\095\102\111\116\111\046\112\110\103\047\106\112\103\032\101\115\116\097\032\099\111\114\114\117\112\116\111\032\111\032\110\111\032\101\115\032\117\110\097\032\105\109\097\103\101\110\046"
else
pdStatus.Text="\065\117\116\111\045\100\101\116\101\099\116\097\110\100\111\032\071\077\095\102\111\116\111\032\101\110\032\101\108\032\119\111\114\107\115\112\097\099\101\046\046\046"
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
photoDialog.Position=UDim2.fromOffset(10,mSize.Y - dSize.Y - 80)
photoDialog.Visible=true
local baseStatus=ctx.photoFileStatus()
if baseStatus=="\111\107" then
pdStatus.Text="\070\111\116\111\032\097\099\116\117\097\108\032\100\101\116\101\099\116\097\100\097\046\032\067\097\109\098\105\097\108\097\032\099\111\110\032\117\110\032\108\105\110\107\032\111\032\065\115\115\101\116\032\073\068\046"
else
startPolling()
end
end
pdLoad.Activated:Connect(function()
local url=pdUrlBox.Text
if type(url)~="\115\116\114\105\110\103" or #url<8 then
pdStatus.Text="\080\101\103\097\032\112\114\105\109\101\114\111\032\101\108\032\108\105\110\107\032\100\101\032\116\117\032\105\109\097\103\101\110\046"
return
end
pdStatus.Text="\068\101\115\099\097\114\103\097\110\100\111\032\105\109\097\103\101\110\046\046\046"
task.spawn(function()
local res=ctx.downloadPhoto(url)
if res=="\111\107" then
local status,curl=ctx.photoFileStatus()
if status=="\111\107" and curl then
photoActive=true
setPhotoImage(curl)
ctx.savePhotoMode("\102\105\108\101",0)
dlgEntry.close()
if zzV1.toast then
zzV1.toast("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\070\111\116\111\032\097\112\108\105\099\097\100\097\032\100\101\115\100\101\032\101\108\032\108\105\110\107\046","\080\104\111\116\111\032\097\112\112\108\105\101\100\032\102\114\111\109\032\116\104\101\032\108\105\110\107\046"),4)
end
else
pdStatus.Text="\068\101\115\099\097\114\103\097\100\097\032\112\101\114\111\032\110\111\032\115\101\032\112\117\100\111\032\109\111\115\116\114\097\114\032\045\032\112\114\117\101\098\097\032\111\116\114\097\046"
end
elseif res=="\110\111\116\105\109\103" then
pdStatus.Text="\069\115\032\117\110\097\032\112\097\103\105\110\097\044\032\110\111\032\117\110\097\032\105\109\097\103\101\110\058\032\099\111\112\105\097\032\101\108\032\108\105\110\107\032\068\069\032\108\097\032\105\109\097\103\101\110\046"
elseif res=="\098\097\100\119\114\105\116\101" then
pdStatus.Text="\078\111\032\115\101\032\112\117\100\111\032\103\117\097\114\100\097\114\032\101\108\032\097\114\099\104\105\118\111\046"
else
pdStatus.Text="\078\111\032\115\101\032\112\117\100\111\032\100\101\115\099\097\114\103\097\114\032\045\032\114\101\118\105\115\097\032\101\108\032\108\105\110\107\046"
end
end)
end)
pdApply.Activated:Connect(function()
local id=tonumber(pdBox.Text)
if id and id>0 then
photoActive=true
setPhotoImage("\114\098\120\097\115\115\101\116\105\100\058\047\047"..tostring(id))
ctx.savePhotoMode("\097\115\115\101\116",math.floor(id))
dlgEntry.close()
if zzV1.toast then
zzV1.toast("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\070\111\116\111\032\097\112\108\105\099\097\100\097\032\100\101\115\100\101\032\065\115\115\101\116\032\073\068\046","\080\104\111\116\111\032\097\112\112\108\105\101\100\032\102\114\111\109\032\065\115\115\101\116\032\073\068\046"),4)
end
else
pdStatus.Text="\069\115\101\032\065\115\115\101\116\032\073\068\032\110\111\032\101\115\032\118\097\108\105\100\111\032\040\115\111\108\111\032\110\117\109\101\114\111\115\041\046"
end
end)
pdClose.Activated:Connect(function()
dlgEntry.close()
end)
local hideToken=0
local function hideOverlays()
hideToken=hideToken+1
local myToken=hideToken
task.delay(0.25,function()
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
photoMenu.Position=UDim2.fromOffset(x,y)
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
local ob=IN("\084\101\120\116\066\117\116\116\111\110")
ob.Text=""
ob.AutoButtonColor=false
ob.BackgroundColor3=C_POPUP
ob.BackgroundTransparency=1
ob.Size=U2(1,0,0,26)
ob.ZIndex=41
local oc=IN("\085\073\067\111\114\110\101\114")
oc.CornerRadius=UD(0,6)
oc.Parent=ob
local ol=IN("\084\101\120\116\076\097\098\101\108")
ol.BackgroundTransparency=1
ol.Size=UDim2.fromScale(1,1)
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
menuOption("\081\117\105\116\097\114",function()
photoActive=false
setPhotoImage(nil)
ctx.savePhotoMode("\110\111\110\101",0)
ctx.deletePhotoFiles()
if zzV1.toast then
zzV1.toast("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\070\111\116\111\032\113\117\105\116\097\100\097\032\045\032\097\118\097\116\097\114\032\110\111\114\109\097\108\046","\080\104\111\116\111\032\114\101\109\111\118\101\100\032\045\032\100\101\102\097\117\108\116\032\097\118\097\116\097\114\046"),4)
end
end,true)
menuOption("\069\100\105\116\097\114",function()
openPhotoDialog()
end,false)
end)
local profName=IN("\084\101\120\116\076\097\098\101\108")
profName.BackgroundTransparency=1
profName.Position=UDim2.fromOffset(50,14)
profName.Size=U2(1,-58,0,14)
profName.Font=WIN_FONT_MED
profName.TextSize=12
profName.TextXAlignment=TX.Left
profName.TextTruncate=Enum.TextTruncate.AtEnd
profName.TextColor3=C_TEXT
profName.Text=LocalPlayer.DisplayName
profName.ZIndex=4
profName.Parent=profile
local profHandle=IN("\084\101\120\116\076\097\098\101\108")
profHandle.BackgroundTransparency=1
profHandle.Position=UDim2.fromOffset(50,30)
profHandle.Size=U2(1,-58,0,12)
profHandle.Font=WIN_FONT
profHandle.TextSize=10
profHandle.TextXAlignment=TX.Left
profHandle.TextTruncate=Enum.TextTruncate.AtEnd
profHandle.TextColor3=C_DIM
profHandle.Text="\064"..LocalPlayer.Name
profHandle.ZIndex=4
profHandle.Parent=profile
local navBtns={}
local selectPage
local function mkNavButton(holder,idx,def)
local btn=IN("\084\101\120\116\066\117\116\116\111\110")
btn.Name="\078\097\118\095"..def.name
btn.AutoButtonColor=false
btn.Text=""
btn.Size=U2(1,0,0,TOUCH and 46 or 38)
btn.LayoutOrder=idx
btn.BackgroundColor3=C_PILL
btn.BackgroundTransparency=1
btn.ZIndex=4
local nc=IN("\085\073\067\111\114\110\101\114")
nc.CornerRadius=UD(1,0)
nc.Parent=btn
local icon=mkIcon(btn,def.icon,C_DIM)
icon.frame.Position=UDim2.fromOffset(14,11)
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Position=UDim2.fromOffset(38,0)
lbl.Size=U2(1,-46,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=TOUCH and 13 or 12
lbl.TextXAlignment=TX.Left
lbl.TextColor3=C_DIM
lbl.Text=gmT(def.nameEs or def.name,def.name)
lbl.ZIndex=4
lbl.Parent=btn
local state={active=false,hover=false}
local nInfo=TweenInfo.new(0.18,ES.Quart,ED.Out)
local function paint()
if state.active then
TweenService:Create(btn,nInfo,{BackgroundTransparency=0,BackgroundColor3=C_PILL}):Play()
TweenService:Create(lbl,nInfo,{TextColor3=C_TEXT}):Play()
icon.tint(C_TEXT)
elseif state.hover then
TweenService:Create(btn,nInfo,{BackgroundTransparency=0,BackgroundColor3=C_HOVER}):Play()
TweenService:Create(lbl,nInfo,{TextColor3=C_OFF}):Play()
icon.tint(C_OFF)
else
TweenService:Create(btn,nInfo,{BackgroundTransparency=1,BackgroundColor3=C_PILL}):Play()
TweenService:Create(lbl,nInfo,{TextColor3=C_DIM}):Play()
icon.tint(C_DIM)
end
end
btn.MouseEnter:Connect(function()
state.hover=true
paint()
zzV1.uiSound("\104\111\118\101\114")
end)
btn.MouseLeave:Connect(function()
state.hover=false
paint()
end)
btn.Activated:Connect(function()
if not state.active then
zzV1.uiSound("\112\111\112")
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
local psc=pg:FindFirstChild("\071\077\095\080\097\103\101\080\111\112")
if not psc then
psc=IN("\085\073\083\099\097\108\101")
psc.Name="\071\077\095\080\097\103\101\080\111\112"
psc.Parent=pg
end
psc.Scale=0.97
TweenService:Create(
psc,
TweenInfo.new(0.22,ES.Back,ED.Out),
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
local card=IN("\070\114\097\109\101")
card.Name="\067\097\114\100\095"..title
card.BackgroundColor3=C_CARD
card.BackgroundTransparency=0.04
card.BorderSizePixel=0
card.Size=U2(1,0,0,0)
card.AutomaticSize=Enum.AutomaticSize.Y
card.LayoutOrder=nextRow()
card.ZIndex=3
local cc=IN("\085\073\067\111\114\110\101\114")
cc.CornerRadius=UD(0,12)
cc.Parent=card
local pad=IN("\085\073\080\097\100\100\105\110\103")
pad.PaddingLeft=UD(0,16)
pad.PaddingRight=UD(0,16)
pad.PaddingTop=UD(0,14)
pad.PaddingBottom=UD(0,14)
pad.Parent=card
local lay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
lay.Padding=UD(0,CARD_GAP)
lay.SortOrder=Enum.SortOrder.LayoutOrder
lay.Parent=card
local head=IN("\070\114\097\109\101")
head.BackgroundTransparency=1
head.Size=U2(1,0,0,20)
head.LayoutOrder=nextRow()
head.ZIndex=3
head.Parent=card
local marker=IN("\070\114\097\109\101")
marker.Size=UDim2.fromOffset(7,7)
marker.Position=U2(0,1,0,6)
marker.Rotation=45
marker.BackgroundColor3=C_ACCENT
marker.BorderSizePixel=0
marker.ZIndex=3
local mkCorner2=IN("\085\073\067\111\114\110\101\114")
mkCorner2.CornerRadius=UD(0,2)
mkCorner2.Parent=marker
marker.Parent=head
local ttl=IN("\084\101\120\116\076\097\098\101\108")
ttl.BackgroundTransparency=1
ttl.Position=UDim2.fromOffset(14,0)
ttl.Size=U2(1,-14,1,0)
ttl.Font=WIN_FONT_MED
ttl.TextSize=17
ttl.TextXAlignment=TX.Left
ttl.TextYAlignment=Enum.TextYAlignment.Center
ttl.TextColor3=C_DIM
ttl.Text=title
ttl.ZIndex=3
ttl.Parent=head
card.Parent=page
return card
end
local function mkGrid(card)
local grid=IN("\070\114\097\109\101")
grid.Name="\071\114\105\100"
grid.BackgroundTransparency=1
grid.Size=U2(1,0,0,0)
grid.AutomaticSize=Enum.AutomaticSize.Y
grid.LayoutOrder=nextRow()
grid.ZIndex=3
local gl=IN("\085\073\071\114\105\100\076\097\121\111\117\116")
gl.CellSize=U2(0.5,-12,0,TOGGLE_ROW_H)
gl.CellPadding=U2(0,24,0,GRID_PAD_Y)
gl.SortOrder=Enum.SortOrder.LayoutOrder
gl.Parent=grid
grid.Parent=card
return grid
end
local function mkToggle(parent,cfg)
local row=IN("\084\101\120\116\066\117\116\116\111\110")
row.Name="\084\111\103\103\108\101\095"..cfg.label
row.AutoButtonColor=false
row.Text=""
row.BackgroundTransparency=1
row.Size=U2(1,0,0,TOGGLE_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local track=IN("\070\114\097\109\101")
track.Name="\084\114\097\099\107"
track.Position=U2(0,0,0.5,-(SWITCH_H/2))
track.Size=UDim2.fromOffset(SWITCH_W,SWITCH_H)
track.BackgroundColor3=C_TRACK_OFF
track.BorderSizePixel=0
track.ZIndex=4
local tc=IN("\085\073\067\111\114\110\101\114")
tc.CornerRadius=UD(1,0)
tc.Parent=track
track.Parent=row
local knob=IN("\070\114\097\109\101")
knob.Name="\075\110\111\098"
knob.Position=UDim2.fromOffset(2,(SWITCH_H - KNOB_D)/2)
knob.Size=UDim2.fromOffset(KNOB_D,KNOB_D)
knob.BackgroundColor3=C_KNOB_OFF
knob.BorderSizePixel=0
knob.ZIndex=5
local kc=IN("\085\073\067\111\114\110\101\114")
kc.CornerRadius=UD(1,0)
kc.Parent=knob
knob.Parent=track
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Position=UDim2.fromOffset(SWITCH_W+8,0)
lbl.Size=U2(1,-48,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TX.Left
lbl.TextYAlignment=Enum.TextYAlignment.Center
lbl.TextTruncate=Enum.TextTruncate.AtEnd
lbl.TextColor3=C_OFF
lbl.Text=cfg.label
lbl.ZIndex=4
lbl.Parent=row
local on=cfg.init==true
local infoC=TweenInfo.new(0.18,ES.Quart,ED.Out)
local infoK=TweenInfo.new(0.26,ES.Back,ED.Out)
local function paint(animate)
local trackC=on and C_TRACK_ON or C_TRACK_OFF
local knobC=on and C_KNOB_ON or C_KNOB_OFF
local lblC=on and C_TEXT or C_OFF
local knobP=on and UDim2.fromOffset(SWITCH_W - KNOB_D - 2,(SWITCH_H - KNOB_D)/2)
or UDim2.fromOffset(2,(SWITCH_H - KNOB_D)/2)
if animate then
TweenService:Create(track,infoC,{BackgroundColor3=trackC}):Play()
TweenService:Create(knob,infoK,{BackgroundColor3=knobC,Position=knobP}):Play()
TweenService:Create(lbl,infoC,{TextColor3=lblC}):Play()
else
track.BackgroundColor3=trackC
knob.BackgroundColor3=knobC
knob.Position=knobP
lbl.TextColor3=lblC
end
end
paint(false)
row.Activated:Connect(function()
on=not on
paint(true)
zzV1.uiSound(on and "\116\111\103\103\108\101\079\110" or "\116\111\103\103\108\101\079\102\102")
if cfg.onChange then
cfg.onChange(on)
end
end)
row.Parent=parent
return row
end
local function mkSlider(parent,cfg)
local row=IN("\070\114\097\109\101")
row.Name="\083\108\105\100\101\114\095"..cfg.label
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TX.Left
lbl.TextYAlignment=Enum.TextYAlignment.Center
lbl.TextTruncate=Enum.TextTruncate.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.label
lbl.ZIndex=4
lbl.Parent=row
local track=IN("\070\114\097\109\101")
track.Name="\084\114\097\099\107"
track.Position=U2(0,168,0.5,-(TRACK_H/2))
track.Size=UDim2.fromOffset(150,TRACK_H)
track.BackgroundColor3=C_TRACK_OFF
track.BorderSizePixel=0
track.ZIndex=4
local tc=IN("\085\073\067\111\114\110\101\114")
tc.CornerRadius=UD(1,0)
tc.Parent=track
track.Parent=row
local fill=IN("\070\114\097\109\101")
fill.Name="\070\105\108\108"
fill.Size=U2(0,0,1,0)
fill.BackgroundColor3=C_TEXT
fill.BorderSizePixel=0
fill.ZIndex=5
local fc=IN("\085\073\067\111\114\110\101\114")
fc.CornerRadius=UD(1,0)
fc.Parent=fill
fill.Parent=track
local knob=IN("\070\114\097\109\101")
knob.Name="\075\110\111\098"
knob.AnchorPoint=Vector2.new(0.5,0.5)
knob.Position=U2(0,0,0.5,0)
knob.Size=UDim2.fromOffset(TRACK_KNOB_D,TRACK_KNOB_D)
knob.BackgroundColor3=C_TEXT
knob.BorderSizePixel=0
knob.ZIndex=6
local kc=IN("\085\073\067\111\114\110\101\114")
kc.CornerRadius=UD(0,5)
kc.Parent=knob
knob.Parent=track
local value=IN("\084\101\120\116\076\097\098\101\108")
value.BackgroundTransparency=1
value.Position=UDim2.fromOffset(324,0)
value.Size=UDim2.fromOffset(54,CTRL_ROW_H)
value.Font=WIN_FONT
value.TextSize=12
value.TextXAlignment=TX.Right
value.TextYAlignment=Enum.TextYAlignment.Center
value.TextColor3=C_TEXT
value.ZIndex=4
value.Parent=row
local current=cfg.init
local dragging=false
local function fmt(v)
local txt
if cfg.decimals then
txt=string.format("\037\046"..tostring(cfg.decimals).."\102",v)
else
txt=string.format("\037\100",math.floor(v+0.5))
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
local infoS=TweenInfo.new(0.16,ES.Quart,ED.Out)
TweenService:Create(fill,infoS,{Size=targetFill}):Play()
TweenService:Create(knob,infoS,{Position=targetKnob}):Play()
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
zzV1.uiSound("\115\108\105\100\101\114")
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
local snapped=math.floor(raw/cfg.step+0.5)*cfg.step
local clean=math.floor(snapped*100+0.5)/100
setValue(clean,true)
end
local hit=IN("\070\114\097\109\101")
hit.Name="\072\105\116\090\111\110\101"
hit.Position=U2(0,160,0,0)
hit.Size=U2(0,220,1,0)
hit.BackgroundTransparency=1
hit.Active=true
hit.ZIndex=7
hit.Parent=row
local function beginDrag(input)
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch then
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
if input.UserInputType==Enum.UserInputType.MouseMovement
or input.UserInputType==Enum.UserInputType.Touch then
fromAbsX(input.Position.X)
end
end))
bindConn(UserInputService.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch then
dragging=false
end
end))
render()
row.Parent=parent
return row
end
local function mkDropdown(parent,cfg)
local row=IN("\070\114\097\109\101")
row.Name="\068\114\111\112\100\111\119\110\095"..cfg.label
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TX.Left
lbl.TextYAlignment=Enum.TextYAlignment.Center
lbl.TextTruncate=Enum.TextTruncate.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.label
lbl.ZIndex=4
lbl.Parent=row
local pillW=132
local pill=IN("\084\101\120\116\066\117\116\116\111\110")
pill.Name="\080\105\108\108"
pill.AutoButtonColor=false
pill.AnchorPoint=Vector2.new(0,0.5)
pill.Position=U2(0,168,0.5,0)
pill.Size=UDim2.fromOffset(pillW,PILL_H)
pill.BackgroundColor3=C_PILL
pill.BorderSizePixel=0
pill.Font=WIN_FONT_MED
pill.TextSize=11
pill.TextColor3=C_TEXT
pill.TextXAlignment=TX.Left
pill.Text=cfg.init
pill.ZIndex=4
local pc=IN("\085\073\067\111\114\110\101\114")
pc.CornerRadius=UD(1,0)
pc.Parent=pill
local pPad=IN("\085\073\080\097\100\100\105\110\103")
pPad.PaddingLeft=UD(0,14)
pPad.PaddingRight=UD(0,24)
pPad.Parent=pill
pill.Parent=row
local chev=IN("\070\114\097\109\101")
chev.Name="\067\104\101\118\114\111\110"
chev.AnchorPoint=Vector2.new(1,0.5)
chev.Position=U2(1,-9,0.5,0)
chev.Size=UDim2.fromOffset(8,8)
chev.BackgroundTransparency=1
chev.ZIndex=5
chev.Parent=pill
local c1=IN("\070\114\097\109\101")
c1.Position=UDim2.fromOffset(0,3)
c1.Size=UDim2.fromOffset(5,1.5)
c1.Rotation=45
c1.BackgroundColor3=C_DIM
c1.BorderSizePixel=0
c1.Parent=chev
local c2=IN("\070\114\097\109\101")
c2.Position=UDim2.fromOffset(3,3)
c2.Size=UDim2.fromOffset(5,1.5)
c2.Rotation=-45
c2.BackgroundColor3=C_DIM
c2.BorderSizePixel=0
c2.Parent=chev
local popup=IN("\070\114\097\109\101")
popup.Name="\080\111\112\117\112"
popup.Visible=false
popup.BackgroundColor3=C_POPUP
popup.BackgroundTransparency=0.04
popup.BorderSizePixel=0
popup.Size=UDim2.fromOffset(pillW+48,#cfg.options*(POPUP_OPT_H+POPUP_OPT_GAP)+8)
popup.ZIndex=60
local gc=IN("\085\073\067\111\114\110\101\114")
gc.CornerRadius=UD(0,10)
gc.Parent=popup
local gPad=IN("\085\073\080\097\100\100\105\110\103")
gPad.PaddingTop=UD(0,4)
gPad.PaddingBottom=UD(0,4)
gPad.PaddingLeft=UD(0,4)
gPad.PaddingRight=UD(0,4)
gPad.Parent=popup
local gLay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
gLay.Padding=UD(0,POPUP_OPT_GAP)
gLay.SortOrder=Enum.SortOrder.LayoutOrder
gLay.Parent=popup
popup.Parent=popLayer
local catcher=IN("\084\101\120\116\066\117\116\116\111\110")
catcher.Name="\067\097\116\099\104\101\114"
catcher.Text=""
catcher.AutoButtonColor=false
catcher.BackgroundTransparency=1
catcher.Size=UDim2.fromScale(1,1)
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
popup.Position=UDim2.fromOffset(x,y)
popup.Visible=true
catcher.Visible=true
local psc=popup:FindFirstChild("\071\077\095\080\111\112")
if not psc then
psc=IN("\085\073\083\099\097\108\101")
psc.Name="\071\077\095\080\111\112"
psc.Parent=popup
end
psc.Scale=0.86
TweenService:Create(
psc,
TweenInfo.new(0.2,ES.Back,ED.Out),
{Scale=1}
):Play()
end
pill.Activated:Connect(function()
if open then
zzV1.uiSound("\116\111\103\103\108\101\079\102\102")
entry.close()
else
zzV1.uiSound("\112\111\112")
openPopup()
end
end)
catcher.Activated:Connect(function()
entry.close()
end)
for i,option in ipairs(cfg.options) do
local ob=IN("\084\101\120\116\066\117\116\116\111\110")
ob.Name="\079\112\116\095"..option
ob.AutoButtonColor=false
ob.Text=""
ob.BackgroundColor3=C_POPUP
ob.BackgroundTransparency=1
ob.Size=U2(1,0,0,POPUP_OPT_H)
ob.LayoutOrder=i
ob.ZIndex=61
local oc=IN("\085\073\067\111\114\110\101\114")
oc.CornerRadius=UD(0,6)
oc.Parent=ob
local ol=IN("\084\101\120\116\076\097\098\101\108")
ol.BackgroundTransparency=1
ol.Position=UDim2.fromOffset(10,0)
ol.Size=U2(1,-14,1,0)
ol.Font=WIN_FONT_MED
ol.TextSize=TOUCH and 12 or 11
ol.TextXAlignment=TX.Left
ol.TextYAlignment=Enum.TextYAlignment.Center
ol.TextTruncate=Enum.TextTruncate.AtEnd
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
zzV1.uiSound("\099\108\105\099\107")
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
local row=IN("\070\114\097\109\101")
row.Name="\075\101\121\098\105\110\100\095"..cfg.label
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TX.Left
lbl.TextYAlignment=Enum.TextYAlignment.Center
lbl.TextTruncate=Enum.TextTruncate.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.label
lbl.ZIndex=4
lbl.Parent=row
local pill=IN("\084\101\120\116\066\117\116\116\111\110")
pill.Name="\080\105\108\108"
pill.AutoButtonColor=false
pill.AnchorPoint=Vector2.new(0,0.5)
pill.Position=U2(0,168,0.5,0)
pill.Size=UDim2.fromOffset(110,PILL_H)
pill.BackgroundColor3=C_PILL
pill.BorderSizePixel=0
pill.Font=WIN_FONT_MED
pill.TextSize=11
pill.TextColor3=C_TEXT
pill.TextXAlignment=TX.Left
pill.Text=cfg.init
pill.ZIndex=4
local pc=IN("\085\073\067\111\114\110\101\114")
pc.CornerRadius=UD(1,0)
pc.Parent=pill
local pPad=IN("\085\073\080\097\100\100\105\110\103")
pPad.PaddingLeft=UD(0,14)
pPad.PaddingRight=UD(0,14)
pPad.Parent=pill
pill.Parent=row
local element={CurrentKeybind=cfg.init}
local listenConn=nil
local function displayName(name)
local short=string.gsub(name,"\094\077\111\117\115\101\066\117\116\116\111\110","\077\066")
short=string.gsub(short,"\094\088\066\117\116\116\111\110\049\036","\077\066\052")
short=string.gsub(short,"\094\088\066\117\116\116\111\110\050\036","\077\066\053")
return short
end
pill.TextTruncate=Enum.TextTruncate.AtEnd
pill.Text=displayName(element.CurrentKeybind)
pill.Activated:Connect(function()
if capturing or listenConn then
return
end
capturing=true
pill.Text="\046\046\046"
pill.TextColor3=C_DIM
listenConn=UserInputService.InputBegan:Connect(function(input)
local name=nil
if input.UserInputType==Enum.UserInputType.Keyboard then
if input.KeyCode~=Enum.KeyCode.Unknown and input.KeyCode~=Enum.KeyCode.Escape then
name=input.KeyCode.Name
end
elseif input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.MouseButton2
or input.UserInputType==Enum.UserInputType.MouseButton3
or input.UserInputType==Enum.UserInputType.MouseButton4
or input.UserInputType==Enum.UserInputType.MouseButton5 then
name=input.UserInputType.Name
end
if name==nil then
if input.KeyCode==Enum.KeyCode.Escape then
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
local btn=IN("\084\101\120\116\066\117\116\116\111\110")
btn.Name="\066\117\116\116\111\110\095"..cfg.label
btn.AutoButtonColor=false
btn.Size=U2(1,0,0,cfg.full and BTN_FULL_H or BTN_H)
btn.LayoutOrder=nextRow()
btn.BackgroundColor3=cfg.danger and C_DANGER_BG or C_PILL
btn.BorderSizePixel=0
btn.Font=WIN_FONT_MED
btn.TextSize=12
btn.TextColor3=cfg.danger and C_RED or C_TEXT
btn.TextTruncate=Enum.TextTruncate.AtEnd
btn.Text=cfg.label
btn.ZIndex=3
local bc=IN("\085\073\067\111\114\110\101\114")
bc.CornerRadius=UD(1,0)
bc.Parent=btn
local bPad=IN("\085\073\080\097\100\100\105\110\103")
bPad.PaddingLeft=UD(0,14)
bPad.PaddingRight=UD(0,14)
bPad.Parent=btn
local hoverBg=cfg.danger and C_DANGER_HOVER or C_POPUP_HOVER
local baseBg=cfg.danger and C_DANGER_BG or C_PILL
local hInfo=TweenInfo.new(0.15,ES.Quart,ED.Out)
btn.MouseEnter:Connect(function()
zzV1.uiSound("\104\111\118\101\114")
TweenService:Create(btn,hInfo,{BackgroundColor3=hoverBg}):Play()
end)
btn.MouseLeave:Connect(function()
TweenService:Create(btn,hInfo,{BackgroundColor3=baseBg}):Play()
end)
btn.Activated:Connect(function()
zzV1.uiSound("\099\108\105\099\107")
local sc=IN("\085\073\083\099\097\108\101")
sc.Parent=btn
sc.Scale=1
TweenService:Create(
sc,
TweenInfo.new(0.07,ES.Quad,ED.Out),
{Scale=0.94}
):Play()
task.delay(0.08,function()
if sc.Parent then
TweenService:Create(
sc,
TweenInfo.new(0.24,ES.Back,ED.Out),
{Scale=1}
):Play()
end
end)
task.delay(0.36,function()
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
local box=IN("\084\101\120\116\066\111\120")
box.Name="\073\110\112\117\116\095"..tostring(ph)
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
box.TextXAlignment=TX.Left
box.ZIndex=3
local bc=IN("\085\073\067\111\114\110\101\114")
bc.CornerRadius=UD(1,0)
bc.Parent=box
local bPad=IN("\085\073\080\097\100\100\105\110\103")
bPad.PaddingLeft=UD(0,14)
bPad.PaddingRight=UD(0,14)
bPad.Parent=box
box.Parent=parent
return box
end
local function mkHint(parent,text)
local h=IN("\084\101\120\116\076\097\098\101\108")
h.BackgroundTransparency=1
h.Size=U2(1,0,0,0)
h.AutomaticSize=Enum.AutomaticSize.Y
h.LayoutOrder=nextRow()
h.Font=WIN_FONT
h.TextSize=10
h.TextXAlignment=TX.Left
h.TextYAlignment=Enum.TextYAlignment.Top
h.TextWrapped=true
h.TextColor3=C_DIM
h.TextTransparency=0.3
h.Text=text
h.ZIndex=3
h.Parent=parent
return h
end
local function mkListHolder(parent)
local holder=IN("\070\114\097\109\101")
holder.Name="\076\105\115\116\072\111\108\100\101\114"
holder.BackgroundTransparency=1
holder.Size=U2(1,0,0,0)
holder.AutomaticSize=Enum.AutomaticSize.Y
holder.LayoutOrder=nextRow()
holder.ZIndex=3
local lay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
lay.Padding=UD(0,4)
lay.SortOrder=Enum.SortOrder.LayoutOrder
lay.Parent=holder
holder.Parent=parent
return holder
end
local function clearList(holder)
for _,ch in ipairs(holder:GetChildren()) do
if ch:IsA("\071\117\105\066\117\116\116\111\110") then
ch:Destroy()
end
end
end
local function mkTrackRow(parent,text,onClick)
local b=IN("\084\101\120\116\066\117\116\116\111\110")
b.Name="\084\114\097\099\107\082\111\119"
b.AutoButtonColor=false
b.Size=U2(1,0,0,TOUCH and 30 or 22)
b.BackgroundColor3=C_PILL
b.BackgroundTransparency=1
b.Font=WIN_FONT_MED
b.TextSize=TOUCH and 12 or 11
b.TextColor3=C_TEXT
b.TextXAlignment=TX.Left
b.TextTruncate=Enum.TextTruncate.AtEnd
b.Text=text
b.ZIndex=3
local bc=IN("\085\073\067\111\114\110\101\114")
bc.CornerRadius=UD(1,0)
bc.Parent=b
local bPad=IN("\085\073\080\097\100\100\105\110\103")
bPad.PaddingLeft=UD(0,10)
bPad.PaddingRight=UD(0,10)
bPad.Parent=b
b.MouseEnter:Connect(function()
b.BackgroundTransparency=0
b.BackgroundColor3=C_HOVER
zzV1.uiSound("\104\111\118\101\114")
end)
b.MouseLeave:Connect(function()
b.BackgroundTransparency=1
end)
b.Activated:Connect(function()
zzV1.uiSound("\099\108\105\099\107")
onClick()
end)
b.Parent=parent
return b
end
local NAV_DEFS={
{name="\072\085\068",nameEs="\072\085\068",icon="\104\117\100"},
{name="\077\111\118\101\109\101\110\116",nameEs="\077\111\118\105\109\105\101\110\116\111",icon="\109\111\118\101"},
{name="\086\105\115\117\097\108\115",nameEs="\086\105\115\117\097\108\115",icon="\101\121\101"},
{name="\065\118\097\116\097\114",nameEs="\065\118\097\116\097\114",icon="\115\112\097\114\107\108\101"},
{name="\065\116\109\111\115\112\104\101\114\101",nameEs="\065\116\109\111\115\102\101\114\097",icon="\115\108\105\100\101\114\115"},
{name="\083\112\111\116\105\102\121",nameEs="\083\112\111\116\105\102\121",icon="\109\117\115\105\099",hidden=true},
{name="\083\101\116\116\105\110\103\115",nameEs="\065\106\117\115\116\101\115",icon="\103\101\097\114"},
}
for i,def in ipairs(NAV_DEFS) do
if i==#NAV_DEFS then
local spacer=IN("\070\114\097\109\101")
spacer.Name="\078\097\118\068\105\118\105\100\101\114"
spacer.Size=U2(1,-28,0,9)
spacer.BackgroundTransparency=1
spacer.LayoutOrder=i - 0.5
spacer.ZIndex=4
spacer.Parent=navHolder
local line=IN("\070\114\097\109\101")
line.Size=U2(1,0,0,1)
line.Position=U2(0,0,0,4)
line.BackgroundColor3=C_ACCENT
line.BackgroundTransparency=0.72
line.BorderSizePixel=0
line.Parent=spacer
end
mkNavButton(navHolder,i,def)
mkPage()
end
local uiDx,uiDy=0,0
do
local saved=ctx.getUiPos()
if type(saved)=="\116\097\098\108\101" and #saved==2 then
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
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch
then
uiDragging=true
uiDragStart=input.Position
uiStartDx=uiDx
uiStartDy=uiDy
end
end
local function uiHandleUp(input)
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch
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
if input.UserInputType==Enum.UserInputType.MouseMovement
or input.UserInputType==Enum.UserInputType.Touch
then
local delta=input.Position - uiDragStart
local cam=Workspace.CurrentCamera
local vp=cam and cam.ViewportSize or Vector2.new(1280,720)
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
local ok,err=pcall(fn)
if not ok then
warn("\091\071\077\093\032\085\073\032\112\097\103\101\032\114\101\106\101\099\116\101\100\032\040"..kind.."\041\058\032"..tostring(err))
end
return ok
end
safeBuild("\072\085\068",function()
local page=pages[1]
local function mkColorSwatch(parent,cfg)
local row=IN("\070\114\097\109\101")
row.Name="\083\119\097\116\099\104\095"..cfg.label
row.BackgroundTransparency=1
row.Size=U2(1,0,0,CTRL_ROW_H)
row.LayoutOrder=nextRow()
row.ZIndex=3
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Size=U2(0,160,1,0)
lbl.Font=WIN_FONT_MED
lbl.TextSize=12
lbl.TextXAlignment=TX.Left
lbl.TextYAlignment=Enum.TextYAlignment.Center
lbl.TextTruncate=Enum.TextTruncate.AtEnd
lbl.TextColor3=C_TEXT
lbl.Text=cfg.label
lbl.ZIndex=4
lbl.Parent=row
local pill=IN("\084\101\120\116\066\117\116\116\111\110")
pill.Name="\080\105\108\108"
pill.AutoButtonColor=false
pill.AnchorPoint=Vector2.new(0,0.5)
pill.Position=U2(0,168,0.5,0)
pill.Size=UDim2.fromOffset(44,PILL_H)
pill.BackgroundColor3=cfg.color
pill.Text=""
pill.BorderSizePixel=0
pill.ZIndex=4
local pc=IN("\085\073\067\111\114\110\101\114")
pc.CornerRadius=UD(1,0)
pc.Parent=pill
local ps=IN("\085\073\083\116\114\111\107\101")
ps.Color=C_DIM
ps.Thickness=1
ps.Transparency=0.5
ps.Parent=pill
pill.Parent=row
local popup=IN("\070\114\097\109\101")
popup.Name="\080\111\112\117\112"
popup.Visible=false
popup.BackgroundColor3=C_POPUP
popup.BackgroundTransparency=0.04
popup.BorderSizePixel=0
popup.Size=UDim2.fromOffset(6*24+5*4+8,4*24+3*4+8)
popup.ZIndex=60
local gc=IN("\085\073\067\111\114\110\101\114")
gc.CornerRadius=UD(0,10)
gc.Parent=popup
local gPad=IN("\085\073\080\097\100\100\105\110\103")
gPad.PaddingTop=UD(0,4)
gPad.PaddingBottom=UD(0,4)
gPad.PaddingLeft=UD(0,4)
gPad.PaddingRight=UD(0,4)
gPad.Parent=popup
local gLay=IN("\085\073\071\114\105\100\076\097\121\111\117\116")
gLay.CellSize=UDim2.fromOffset(24,24)
gLay.CellPadding=UDim2.fromOffset(4,4)
gLay.SortOrder=Enum.SortOrder.LayoutOrder
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
local ob=IN("\084\101\120\116\066\117\116\116\111\110")
ob.Text=""
ob.AutoButtonColor=false
ob.BackgroundColor3=c
ob.BorderSizePixel=0
ob.LayoutOrder=order
ob.ZIndex=61
local oc=IN("\085\073\067\111\114\110\101\114")
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
popup.Position=UDim2.fromOffset(x,y)
popup.Visible=true
end
end)
row.Parent=parent
return row
end
local card=mkCard(page,"\075\101\121\115\116\114\111\107\101\115\032\111\118\101\114\108\097\121")
local grid=mkGrid(card)
mkToggle(grid,{
label="\069\110\097\098\108\101\100",
init=ctx.getKeyboardOn(),
onChange=ctx.setKeyboard,
})
mkToggle(grid,{
label=gmT("\077\097\114\099\097\032\100\101\032\097\103\117\097","\087\097\116\101\114\109\097\114\107"),
init=ctx.getKeyWm(),
onChange=ctx.setKeyWm,
})
mkSlider(card,{
label="\069\115\099\097\108\097",
min=50,
max=150,
step=5,
suffix="\037",
init=ctx.getKeyScale(),
onChange=ctx.setKeyScale,
})
mkSlider(card,{
label="\079\112\097\099\105\100\097\100\032\116\101\099\108\097\115",
min=20,
max=100,
step=5,
suffix="\037",
init=ctx.getKeyOpacity(),
onChange=ctx.setKeyOpacity,
})
mkSlider(card,{
label="\079\112\097\099\105\100\097\100\032\102\111\110\100\111",
min=0,
max=100,
step=5,
suffix="\037",
init=ctx.getKeyBgOpacity(),
onChange=ctx.setKeyBgOpacity,
})
mkSlider(card,{
label="\084\097\109\097\110\111\032\116\101\120\116\111",
min=8,
max=20,
step=1,
suffix="\112\120",
init=ctx.getKeyTextSize(),
onChange=ctx.setKeyTextSize,
})
mkButton(card,{
label="\082\101\115\101\116\032\111\118\101\114\108\097\121\032\112\111\115\105\116\105\111\110",
full=true,
onClick=ctx.resetOverlayPosition,
})
local cardS=mkCard(page,"\075\101\121\115\116\114\111\107\101\115\032\101\115\116\105\108\111")
local customRow
mkDropdown(cardS,{
label="\068\105\115\101\110\111",
options={"\071\108\097\115\115","\077\105\110\105\109\097\108","\071\111\116\105\099\111","\067\104\105\108\108"},
init=ctx.getKeyDesign(),
onChange=ctx.setKeyDesign,
})
mkDropdown(cardS,{
label="\067\111\108\111\114\101\115",
options={"\068\097\114\107","\080\117\114\112\108\101","\065\110\105\109\101","\080\097\115\116\101\108","\082\097\105\110\098\111\119","\080\101\114\115\111\110\097\108\105\122\097\100\111"},
init=ctx.getKeyColor(),
onChange=function(name)
ctx.setKeyColor(name)
customRow.Visible=string.find(name,"\080\101\114\115\111\110\097\108\105\122\097\100\111",1,true)~=nil
end,
})
mkDropdown(cardS,{
label="\070\117\101\110\116\101",
options={"\065\117\116\111","\071\111\116\104\097\109","\071\111\116\105\099\111","\066\097\110\103\101\114\115","\067\111\100\101","\077\105\099\104\114\111\109\097","\077\105\110\101\099\114\097\102\116"},
init=ctx.getKeyFont(),
onChange=ctx.setKeyFont,
})
local gridS=mkGrid(cardS)
mkToggle(gridS,{
label="\070\111\110\100\111\032\118\105\115\105\098\108\101",
init=ctx.getKeyBg(),
onChange=ctx.setKeyBg,
})
customRow=IN("\070\114\097\109\101")
customRow.Name="\067\117\115\116\111\109\067\111\108\111\114\115"
customRow.BackgroundTransparency=1
customRow.Size=U2(1,0,0,0)
customRow.AutomaticSize=Enum.AutomaticSize.Y
customRow.LayoutOrder=nextRow()
customRow.ZIndex=3
local cLay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
cLay.Padding=UD(0,CARD_GAP)
cLay.SortOrder=Enum.SortOrder.LayoutOrder
cLay.Parent=customRow
customRow.Parent=cardS
customRow.Visible=ctx.getKeyColor()=="\080\101\114\115\111\110\097\108\105\122\097\100\111"
mkColorSwatch(customRow,{
label="\067\111\108\111\114\032\116\101\099\108\097",
color=ctx.getKeyCustomIdle(),
onChange=ctx.setKeyCustomIdle,
})
mkColorSwatch(customRow,{
label="\067\111\108\111\114\032\112\114\101\115\105\111\110\097\100\097",
color=ctx.getKeyCustomPressed(),
onChange=ctx.setKeyCustomPressed,
})
mkColorSwatch(customRow,{
label="\067\111\108\111\114\032\116\101\120\116\111",
color=ctx.getKeyCustomText(),
onChange=ctx.setKeyCustomText,
})
local card2=mkCard(page,"\068\121\110\097\109\105\099\032\073\115\108\097\110\100")
local grid2=mkGrid(card2)
mkToggle(grid2,{
label=gmT("\077\111\115\116\114\097\114\032\068\121\110\097\109\105\099\032\073\115\108\097\110\100","\083\104\111\119\032\068\121\110\097\109\105\099\032\073\115\108\097\110\100"),
init=ctx.getIslandOn(),
onChange=ctx.setIsland,
})
mkDropdown(card2,{
label=gmT("\077\111\115\116\114\097\114\032\101\110\032\108\097\032\105\115\108\097\110\100","\083\104\111\119\032\111\110\032\116\104\101\032\105\115\108\097\110\100"),
options={"\072\111\114\097","\070\080\083","\065\109\098\111\115"},
init=ctx.getIslandMode(),
onChange=ctx.setIslandMode,
})
end)
safeBuild("\077\111\118\101\109\101\110\116",function()
local page=pages[2]
local cardH=mkCard(page,gmT("\072\085\068\032\099\101\108\117\108\097\114","\077\111\098\105\108\101\032\072\085\068"))
local gridH=mkGrid(cardH)
mkToggle(gridH,{
label=gmT("\068\101\115\098\108\111\113\117\101\097\114\032\112\111\115\105\099\105\111\110\101\115","\085\110\108\111\099\107\032\112\111\115\105\116\105\111\110\115"),
init=ctx.getHudUnlocked(),
onChange=ctx.setHudUnlocked,
})
mkSlider(cardH,{
label=gmT("\084\097\109\097\110\111\032\098\111\116\111\110\101\115","\066\117\116\116\111\110\032\115\105\122\101"),
min=60,
max=140,
step=4,
suffix="\112\120",
init=ctx.getHudSize(),
onChange=ctx.setHudSize,
})
mkSlider(cardH,{
label=gmT("\079\112\097\099\105\100\097\100\032\098\111\116\111\110\101\115","\066\117\116\116\111\110\032\111\112\097\099\105\116\121"),
min=20,
max=100,
step=5,
suffix="\037",
init=ctx.getHudOpacity(),
onChange=ctx.setHudOpacity,
})
local card=mkCard(page,"\065\117\116\111\032\066\072\079\080\032\045\032\111\110\099\101\032\112\101\114\032\108\097\110\100\105\110\103")
local grid=mkGrid(card)
mkToggle(grid,{
label="\069\110\097\098\108\101\100",
init=ctx.getBhopOn(),
onChange=ctx.setBhop,
})
mkKeybind(card,{
label="\074\117\109\112\032\107\101\121\032\040\104\111\108\100\041",
init=ctx.getBhopKey(),
onBind=ctx.setBhopKeybind,
onSet=ctx.onBhopKeySet,
})
mkSlider(card,{
label="\074\117\109\112\032\100\101\108\097\121",
min=0,
max=200,
step=5,
suffix="\109\115",
init=ctx.getBhopDelay(),
onChange=ctx.setBhopDelay,
})
mkToggle(grid,{
label=gmT("\066\111\116\111\110\032\100\101\032\067\101\108\117\108\097\114","\077\111\098\105\108\101\032\098\117\116\116\111\110"),
init=ctx.getHudBhopOn(),
onChange=ctx.setHudBhopOn,
})
mkDropdown(card,{
label=gmT("\077\111\100\111\032\100\101\108\032\098\111\116\111\110","\066\117\116\116\111\110\032\109\111\100\101"),
options={"\077\097\110\116\101\110\101\114","\084\111\103\103\108\101"},
init=ctx.getHudBhopMode(),
onChange=ctx.setHudBhopMode,
})
local card2=mkCard(page,"\067\114\117\110\099\104\032\115\112\097\109")
local grid2=mkGrid(card2)
mkToggle(grid2,{
label="\069\110\097\098\108\101\100",
init=ctx.getCrunchOn(),
onChange=ctx.setCrunch,
})
mkKeybind(card2,{
label="\067\114\117\110\099\104\032\107\101\121\032\040\104\111\108\100\041",
init=ctx.getCrunchKey(),
onBind=ctx.setCrunchKeybind,
onSet=ctx.onCrunchKeySet,
})
mkSlider(card2,{
label="\072\111\108\100\032\121\032\103\097\112",
min=10,
max=150,
step=5,
suffix="\109\115",
init=ctx.getCrunchSpeed(),
onChange=ctx.setCrunchSpeed,
})
mkToggle(grid2,{
label=gmT("\066\111\116\111\110\032\100\101\032\067\101\108\117\108\097\114","\077\111\098\105\108\101\032\098\117\116\116\111\110"),
init=ctx.getHudCrunchOn(),
onChange=ctx.setHudCrunchOn,
})
mkDropdown(card2,{
label=gmT("\077\111\100\111\032\100\101\108\032\098\111\116\111\110","\066\117\116\116\111\110\032\109\111\100\101"),
options={"\077\097\110\116\101\110\101\114","\084\111\103\103\108\101"},
init=ctx.getHudCrunchMode(),
onChange=ctx.setHudCrunchMode,
})
local card3=mkCard(page,"\065\117\116\111\032\083\116\114\097\102\102\101\114\032\040\097\105\114\101\041")
local grid3=mkGrid(card3)
mkToggle(grid3,{
label="\069\110\097\098\108\101\100",
init=ctx.getStrafferOn(),
onChange=ctx.setStraffer,
})
mkToggle(grid3,{
label="\073\110\118\101\114\116\105\114\032\040\114\101\118\101\114\115\101\032\098\104\111\112\041",
init=ctx.getStrafferInvert(),
onChange=ctx.setStrafferInvert,
})
mkSlider(card3,{
label="\068\101\097\100\122\111\110\101",
min=0,
max=50,
step=1,
suffix="\112\120",
init=ctx.getStrafferDeadzone(),
onChange=ctx.setStrafferDeadzone,
})
end)
safeBuild("\086\105\115\117\097\108\115",function()
local page=pages[3]
local card=mkCard(page,gmT("\077\111\100\111\032\102\111\116\111","\083\099\114\101\101\110\115\104\111\116\032\109\111\100\101"))
mkButton(card,{
label=gmT("\079\099\117\108\116\097\114\032\116\111\100\097\032\108\097\032\085\073","\072\105\100\101\032\097\108\108\032\085\073"),
full=true,
onClick=ctx.toggleScreenshot,
})
local shotHint=IN("\084\101\120\116\076\097\098\101\108")
shotHint.BackgroundTransparency=1
shotHint.Size=U2(1,0,0,0)
shotHint.AutomaticSize=Enum.AutomaticSize.Y
shotHint.LayoutOrder=nextRow()
shotHint.Font=WIN_FONT
shotHint.TextSize=10
shotHint.TextXAlignment=TX.Left
shotHint.TextYAlignment=Enum.TextYAlignment.Top
shotHint.TextWrapped=true
shotHint.TextColor3=C_DIM
shotHint.TextTransparency=0.3
shotHint.Text=gmT(
"\079\099\117\108\116\097\032\108\097\032\085\073\032\100\101\032\069\118\097\100\101\032\121\032\082\111\098\108\111\120\032\112\097\114\097\032\099\097\112\116\117\114\097\115\032\108\105\109\112\105\097\115\046\032\084\111\099\097\032\101\108\032\098\111\116\111\110\032\100\101\032\110\117\101\118\111\032\112\097\114\097\032\114\101\115\116\097\117\114\097\114\032\116\111\100\111\046",
"\072\105\100\101\115\032\069\118\097\100\101\032\043\032\082\111\098\108\111\120\032\085\073\032\102\111\114\032\099\108\101\097\110\032\115\099\114\101\101\110\115\104\111\116\115\046\032\080\114\101\115\115\032\116\104\101\032\098\117\116\116\111\110\032\097\103\097\105\110\032\116\111\032\114\101\115\116\111\114\101\032\101\118\101\114\121\116\104\105\110\103\046"
)
shotHint.ZIndex=3
shotHint.Parent=card
local cardCh=mkCard(page,gmT("\067\114\111\115\115\104\097\105\114","\067\114\111\115\115\104\097\105\114"))
mkToggle(cardCh,{
label=gmT("\065\099\116\105\118\097\114\032\099\114\111\115\115\104\097\105\114","\069\110\097\098\108\101\032\099\114\111\115\115\104\097\105\114"),
init=ctx.getCrosshairOn(),
onChange=ctx.setCrosshairOn,
})
mkDropdown(cardCh,{
label=gmT("\069\115\116\105\108\111","\083\116\121\108\101"),
options={"\068\111\116","\067\114\111\115\115","\067\105\114\099\108\101","\067\114\111\115\115\032\043\032\068\111\116"},
init=ctx.getCrosshairStyle(),
onChange=ctx.setCrosshairStyle,
})
mkSlider(cardCh,{
label=gmT("\084\097\109\097\110\111","\083\105\122\101"),
min=2,
max=40,
step=1,
suffix="\112\120",
init=ctx.getCrosshairNum("\115\105\122\101"),
onChange=function(v)
ctx.setCrosshairNum("\115\105\122\101",v)
end,
})
mkSlider(cardCh,{
label=gmT("\083\101\112\097\114\097\099\105\111\110","\071\097\112"),
min=0,
max=24,
step=1,
suffix="\112\120",
init=ctx.getCrosshairNum("\103\097\112"),
onChange=function(v)
ctx.setCrosshairNum("\103\097\112",v)
end,
})
mkSlider(cardCh,{
label=gmT("\071\114\111\115\111\114","\084\104\105\099\107\110\101\115\115"),
min=1,
max=10,
step=1,
suffix="\112\120",
init=ctx.getCrosshairNum("\116\104\105\099\107"),
onChange=function(v)
ctx.setCrosshairNum("\116\104\105\099\107",v)
end,
})
mkSlider(cardCh,{
label=gmT("\079\112\097\099\105\100\097\100","\079\112\097\099\105\116\121"),
min=10,
max=100,
step=5,
suffix="\037",
init=ctx.getCrosshairNum("\111\112\097\099\105\116\121"),
onChange=function(v)
ctx.setCrosshairNum("\111\112\097\099\105\116\121",v)
end,
})
mkSlider(cardCh,{
label=gmT("\080\111\115\105\099\105\111\110\032\088","\080\111\115\105\116\105\111\110\032\088"),
min=-400,
max=400,
step=2,
suffix="\112\120",
init=ctx.getCrosshairNum("\111\102\102\120"),
onChange=function(v)
ctx.setCrosshairNum("\111\102\102\120",v)
end,
})
mkSlider(cardCh,{
label=gmT("\080\111\115\105\099\105\111\110\032\089","\080\111\115\105\116\105\111\110\032\089"),
min=-400,
max=400,
step=2,
suffix="\112\120",
init=ctx.getCrosshairNum("\111\102\102\121"),
onChange=function(v)
ctx.setCrosshairNum("\111\102\102\121",v)
end,
})
local chPosGrid=mkGrid(cardCh)
mkButton(chPosGrid,{
label=gmT("\067\101\110\116\114\097\114","\067\101\110\116\101\114"),
onClick=ctx.centerCrosshair,
})
local chHint=IN("\084\101\120\116\076\097\098\101\108")
chHint.BackgroundTransparency=1
chHint.Size=U2(1,0,0,0)
chHint.AutomaticSize=Enum.AutomaticSize.Y
chHint.LayoutOrder=nextRow()
chHint.Font=WIN_FONT
chHint.TextSize=10
chHint.TextXAlignment=TX.Left
chHint.TextYAlignment=Enum.TextYAlignment.Top
chHint.TextWrapped=true
chHint.TextColor3=C_DIM
chHint.TextTransparency=0.3
chHint.Text=gmT(
"\077\117\101\118\101\032\080\111\115\105\099\105\111\110\032\088\047\089\032\112\097\114\097\032\097\108\105\110\101\097\114\108\111\032\099\111\110\032\101\108\032\112\117\110\116\111\032\100\101\032\109\105\114\097\032\100\101\032\069\118\097\100\101\046\032\039\067\101\110\116\114\097\114\039\032\108\111\032\100\101\118\117\101\108\118\101\032\097\108\032\109\101\100\105\111\032\101\120\097\099\116\111\046",
"\077\111\118\101\032\080\111\115\105\116\105\111\110\032\088\047\089\032\116\111\032\097\108\105\103\110\032\105\116\032\119\105\116\104\032\069\118\097\100\101\039\115\032\099\114\111\115\115\104\097\105\114\046\032\039\067\101\110\116\101\114\039\032\112\117\116\115\032\105\116\032\098\097\099\107\032\097\116\032\116\104\101\032\101\120\097\099\116\032\109\105\100\100\108\101\046"
)
chHint.ZIndex=3
chHint.Parent=cardCh
local chColors={
{gmT("\077\111\114\097\100\111","\080\117\114\112\108\101"),167,108,255},
{gmT("\066\108\097\110\099\111","\087\104\105\116\101"),255,255,255},
{gmT("\082\111\106\111","\082\101\100"),255,66,66},
{gmT("\086\101\114\100\101","\071\114\101\101\110"),80,255,120},
{gmT("\067\105\097\110","\067\121\097\110"),80,220,255},
{gmT("\082\111\115\097","\080\105\110\107"),255,105,180},
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
label=gmT("\067\111\108\111\114\032\082","\067\111\108\111\114\032\082"),
min=0,
max=255,
step=5,
init=cc[1] or 167,
onChange=function(v)
ctx.setCrosshairColorPart("\114",v)
end,
})
mkSlider(cardCh,{
label=gmT("\067\111\108\111\114\032\071","\067\111\108\111\114\032\071"),
min=0,
max=255,
step=5,
init=cc[2] or 108,
onChange=function(v)
ctx.setCrosshairColorPart("\103",v)
end,
})
mkSlider(cardCh,{
label=gmT("\067\111\108\111\114\032\066","\067\111\108\111\114\032\066"),
min=0,
max=255,
step=5,
init=cc[3] or 255,
onChange=function(v)
ctx.setCrosshairColorPart("\098",v)
end,
})
local cardF=mkCard(page,gmT("\070\117\101\110\116\101\032\100\101\032\069\118\097\100\101","\069\118\097\100\101\032\102\111\110\116"))
mkToggle(cardF,{
label=gmT("\067\097\109\098\105\097\114\032\102\117\101\110\116\101\032\100\101\108\032\106\117\101\103\111","\067\104\097\110\103\101\032\103\097\109\101\032\102\111\110\116"),
init=ctx.getEvadeFontOn(),
onChange=ctx.setEvadeFontOn,
})
mkDropdown(cardF,{
label=gmT("\070\117\101\110\116\101","\070\111\110\116"),
options={"\071\111\116\104\097\109","\071\111\116\104\097\109\032\066\111\108\100","\077\111\110\116\115\101\114\114\097\116","\077\105\110\101\099\114\097\102\116","\083\099\105\045\070\105","\065\114\099\097\100\101","\070\097\110\116\097\115\121","\067\111\100\101","\072\105\103\104\119\097\121","\067\097\114\116\111\111\110","\065\110\116\105\113\117\101"},
init=ctx.getEvadeFontLabel(),
onChange=ctx.setEvadeFontLabel,
})
local fontHint=IN("\084\101\120\116\076\097\098\101\108")
fontHint.BackgroundTransparency=1
fontHint.Size=U2(1,0,0,0)
fontHint.AutomaticSize=Enum.AutomaticSize.Y
fontHint.LayoutOrder=nextRow()
fontHint.Font=WIN_FONT
fontHint.TextSize=10
fontHint.TextXAlignment=TX.Left
fontHint.TextYAlignment=Enum.TextYAlignment.Top
fontHint.TextWrapped=true
fontHint.TextColor3=C_DIM
fontHint.TextTransparency=0.3
fontHint.Text=gmT(
"\067\097\109\098\105\097\032\108\097\032\102\117\101\110\116\101\032\100\101\032\084\079\068\065\032\108\097\032\085\073\032\100\101\032\069\118\097\100\101\058\032\109\101\110\117\044\032\118\101\108\111\099\105\100\097\100\044\032\116\097\098\108\097\115\046\032\065\108\032\100\101\115\097\099\116\105\118\097\114\032\115\101\032\114\101\115\116\097\117\114\097\032\099\097\100\097\032\102\117\101\110\116\101\032\111\114\105\103\105\110\097\108\046",
"\067\104\097\110\103\101\115\032\116\104\101\032\102\111\110\116\032\111\102\032\065\076\076\032\111\102\032\069\118\097\100\101\039\115\032\085\073\058\032\109\101\110\117\044\032\115\112\101\101\100\111\109\101\116\101\114\044\032\098\111\097\114\100\115\046\032\084\117\114\110\105\110\103\032\105\116\032\111\102\102\032\114\101\115\116\111\114\101\115\032\101\118\101\114\121\032\111\114\105\103\105\110\097\108\032\102\111\110\116\046"
)
fontHint.ZIndex=3
fontHint.Parent=cardF
end)
safeBuild("\065\118\097\116\097\114",function()
local page=pages[4]
local cardH=mkCard(page,"\072\101\097\100\108\101\115\115\032\045\032\108\111\099\097\108\032\111\110\108\121")
mkToggle(cardH,{
label="\072\101\097\100\108\101\115\115\032\104\101\097\100\032\040\108\111\099\097\108\041",
init=ctx.getHeadlessHead(),
onChange=ctx.setHeadlessHead,
})
mkToggle(cardH,{
label="\067\108\101\097\114\032\104\101\097\100\032\097\099\099\101\115\115\111\114\105\101\115\032\040\108\111\099\097\108\041",
init=ctx.getHeadlessAccs(),
onChange=ctx.setHeadlessAccs,
})
local cardK=mkCard(page,"\075\111\114\098\108\111\120\032\045\032\108\111\099\097\108\032\111\110\108\121")
local gridK=mkGrid(cardK)
mkToggle(gridK,{
label="\075\111\114\098\108\111\120\032\108\101\103\115\032\040\108\111\099\097\108\041",
init=ctx.getKorbloxOn(),
onChange=ctx.setKorblox,
})
mkDropdown(cardK,{
label="\087\104\105\099\104\032\108\101\103",
options={"\076\101\102\116\032\108\101\103","\082\105\103\104\116\032\108\101\103","\066\111\116\104\032\108\101\103\115"},
init=ctx.getKorbloxLegLabel(),
onChange=ctx.setKorbloxLeg,
})
local card=mkCard(page,"\069\109\111\116\101\032\114\101\112\108\097\099\101\114\032\045\032\115\116\097\099\107\097\098\108\101")
local grid=mkGrid(card)
mkButton(grid,{
label="\079\112\101\110\032\101\109\111\116\101\032\114\101\112\108\097\099\101\114",
onClick=ctx.openEmotePicker,
})
mkButton(grid,{
label="\082\101\109\111\118\101\032\065\076\076\032\101\109\111\116\101\032\109\097\112\112\105\110\103\115",
danger=true,
onClick=ctx.removeAllMappings,
})
local card2=mkCard(page,"\085\110\117\115\117\097\108\115")
mkButton(card2,{
label="\079\112\101\110\032\117\110\117\115\117\097\108\115\032\112\105\099\107\101\114",
full=true,
onClick=ctx.openUnusualsPicker,
})
local cardSkin=mkCard(page,gmT("\083\107\105\110\032\099\104\097\110\103\101\114","\083\107\105\110\032\099\104\097\110\103\101\114"))
local skinBox=mkInput(cardSkin,gmT("\085\115\101\114\110\097\109\101\032\100\101\032\082\111\098\108\111\120\046\046\046","\082\111\098\108\111\120\032\117\115\101\114\110\097\109\101\046\046\046"))
local skinStatus
local skinGrid=mkGrid(cardSkin)
mkButton(skinGrid,{
label=gmT("\065\112\108\105\099\097\114\032\115\107\105\110","\065\112\112\108\121\032\115\107\105\110"),
onClick=function()
if #skinBox.Text==0 then
return
end
skinStatus.Text=gmT("\067\097\114\103\097\110\100\111\032\097\118\097\116\097\114\046\046\046","\076\111\097\100\105\110\103\032\097\118\097\116\097\114\046\046\046")
local name=skinBox.Text
ctx.skinApply(name,function(ok,msg)
skinStatus.Text=tostring(msg)
end)
end,
})
mkButton(skinGrid,{
label=gmT("\082\101\115\116\097\117\114\097\114\032\109\105\111","\082\101\115\116\111\114\101\032\109\105\110\101"),
onClick=function()
ctx.skinRestore(function(ok,msg)
skinStatus.Text=tostring(msg)
end)
end,
})
skinStatus=mkHint(cardSkin,"\032")
mkHint(cardSkin,gmT(
"\069\115\099\114\105\098\101\032\101\108\032\117\115\101\114\110\097\109\101\032\100\101\032\099\117\097\108\113\117\105\101\114\032\112\101\114\115\111\110\097\032\121\032\116\117\032\097\118\097\116\097\114\032\116\111\109\097\032\115\117\032\115\107\105\110\046\032\049\048\048\037\032\108\111\099\097\108\058\032\101\108\032\115\101\114\118\105\100\111\114\032\115\105\103\117\101\032\118\105\101\110\100\111\032\084\085\032\097\118\097\116\097\114\046\032\082\101\115\116\097\117\114\097\114\032\100\101\118\117\101\108\118\101\032\101\108\032\116\117\121\111\032\101\120\097\099\116\111\046",
"\084\121\112\101\032\097\110\121\111\110\101\039\115\032\117\115\101\114\110\097\109\101\032\097\110\100\032\121\111\117\114\032\097\118\097\116\097\114\032\116\097\107\101\115\032\116\104\101\105\114\032\115\107\105\110\046\032\049\048\048\037\032\108\111\099\097\108\058\032\116\104\101\032\115\101\114\118\101\114\032\115\116\105\108\108\032\115\101\101\115\032\089\079\085\082\032\097\118\097\116\097\114\046\032\082\101\115\116\111\114\101\032\098\114\105\110\103\115\032\121\111\117\114\115\032\098\097\099\107\032\101\120\097\099\116\108\121\046"
))
end)
safeBuild("\065\116\109\111\115\112\104\101\114\101",function()
local page=pages[5]
local card=mkCard(page,"\068\076\083\083\032\047\032\069\110\104\097\110\099\101\114")
mkToggle(card,{
label="\068\076\083\083\032\099\105\110\101\109\097\116\105\099\111",
init=ctx.getGfxOn(),
onChange=ctx.setGfx,
})
mkDropdown(card,{
label="\080\114\101\115\101\116",
options={"\082\101\097\108\105\115\116\097","\067\105\110\101\109\097\116\105\099","\066\097\108\097\110\099\101\100"},
init=ctx.getGfxPresetLabel(),
onChange=ctx.setGfxPreset,
})
mkToggle(card,{
label="\067\105\101\108\111\032\114\101\097\108\105\115\116\097\032\072\068",
init=ctx.getSkyOn(),
onChange=ctx.setSky,
})
mkSlider(card,{
label="\082\101\102\108\101\106\111\115\032\101\110\032\109\097\116\101\114\105\097\108\101\115",
min=0,
max=100,
step=5,
suffix="\037",
init=ctx.getShiny(),
onChange=ctx.setShiny,
})
mkSlider(card,{
label="\073\110\116\101\110\115\105\100\097\100\032\100\101\032\066\108\111\111\109",
min=0,
max=200,
step=10,
suffix="\037",
init=ctx.getBloom(),
onChange=ctx.setBloom,
})
mkSlider(card,{
label=gmT("\079\115\099\117\114\105\100\097\100\032\100\101\032\115\111\109\098\114\097\115","\083\104\097\100\111\119\032\100\097\114\107\110\101\115\115"),
min=0,
max=100,
step=5,
suffix="\037",
init=ctx.getShadowDark(),
onChange=ctx.setShadowDark,
})
local card2=mkCard(page,"\067\111\108\111\114\032\102\105\108\116\101\114\115")
mkDropdown(card2,{
label="\070\105\108\116\101\114\032\112\114\101\115\101\116",
options={"\079\102\102","\078\097\116\117\114\097\108","\086\105\118\105\100","\067\105\110\101\109\097\116\105\099","\078\111\099\116\117\114\110\101","\083\111\109\098\114\105\111"},
init=ctx.getFilterPreset(),
onChange=ctx.setFilterPreset,
})
mkSlider(card2,{
label="\066\114\105\103\104\116\110\101\115\115",
min=-50,
max=50,
step=5,
suffix="\037",
init=ctx.getFilterBrightness(),
onChange=function(v)
ctx.setColorValue("\098\114\105\103\104\116\110\101\115\115",v/100)
end,
})
mkSlider(card2,{
label="\067\111\110\116\114\097\115\116",
min=-50,
max=50,
step=5,
suffix="\037",
init=ctx.getFilterContrast(),
onChange=function(v)
ctx.setColorValue("\099\111\110\116\114\097\115\116",v/100)
end,
})
mkSlider(card2,{
label="\083\097\116\117\114\097\116\105\111\110",
min=-100,
max=100,
step=5,
suffix="\037",
init=ctx.getFilterSaturation(),
onChange=function(v)
ctx.setColorValue("\115\097\116\117\114\097\116\105\111\110",v/100)
end,
})
local card3=mkCard(page,"\084\105\109\101\032\038\032\097\116\109\111\115\112\104\101\114\101")
mkToggle(card3,{
label="\069\110\097\098\108\101\032\116\105\109\101\047\097\116\109\111\115\112\104\101\114\101\032\099\111\110\116\114\111\108",
init=ctx.getTimeOn(),
onChange=ctx.setTime,
})
mkSlider(card3,{
label="\084\105\109\101\032\111\102\032\100\097\121",
min=0,
max=24,
step=0.5,
suffix="\104",
decimals=1,
init=ctx.getClock(),
onChange=ctx.setClock,
})
mkSlider(card3,{
label="\065\116\109\111\115\112\104\101\114\101\032\100\101\110\115\105\116\121",
min=0,
max=100,
step=5,
suffix="\037",
init=ctx.getDensity(),
onChange=function(v)
ctx.setDensity(v/100)
end,
})
mkSlider(card3,{
label="\065\116\109\111\115\112\104\101\114\101\032\104\097\122\101",
min=0,
max=100,
step=5,
suffix="\037",
init=ctx.getHaze(),
onChange=function(v)
ctx.setHaze(v/100)
end,
})
local card4=mkCard(page,"\098\121\032\077\105\110\119\111")
mkButton(card4,{
label="\082\117\110\032\115\101\108\102\045\116\101\115\116\032\114\101\112\111\114\116",
full=true,
onClick=ctx.runSelfTest,
})
mkButton(card4,{
label="\085\110\108\111\097\100\032\071\104\111\115\116\032\077\101\116\104\111\100",
full=true,
danger=true,
onClick=ctx.unload,
})
end)
safeBuild("\083\112\111\116\105\102\121",function()
local page=pages[6]
local function renderTrackList(holder,tracks,playFn)
clearList(holder)
for i,tr in ipairs(tracks) do
local label=tostring(i).."\046\032"..tr.title.."\032\045\032"..tr.artist
if not tr.url then
label=label..gmT("\032\040\115\105\110\032\112\114\101\118\105\101\119\041","\032\040\110\111\032\112\114\101\118\105\101\119\041")
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
local cardA=mkCard(page,gmT("\084\117\032\099\117\101\110\116\097","\089\111\117\114\032\097\099\099\111\117\110\116"))
local logged,accName=ctx.spGetAccount()
local accLabel=mkHint(cardA,logged
and(gmT("\067\111\110\101\099\116\097\100\111\032\099\111\109\111\058\032","\067\111\110\110\101\099\116\101\100\032\097\115\058\032")..tostring(accName))
or gmT("\083\101\115\105\111\110\032\110\111\032\105\110\105\099\105\097\100\097","\078\111\116\032\108\111\103\103\101\100\032\105\110"))
local dcBox=mkInput(cardA,"\115\112\095\100\099\032\046\046\046")
local accGrid=mkGrid(cardA)
mkButton(accGrid,{
label=gmT("\073\110\105\099\105\097\114\032\115\101\115\105\111\110","\076\111\103\032\105\110"),
onClick=function()
if #dcBox.Text<20 then
accLabel.Text=gmT("\080\101\103\097\032\101\108\032\118\097\108\111\114\032\115\112\095\100\099\032\112\114\105\109\101\114\111","\080\097\115\116\101\032\116\104\101\032\115\112\095\100\099\032\118\097\108\117\101\032\102\105\114\115\116")
return
end
accLabel.Text=gmT("\067\111\110\101\099\116\097\110\100\111\046\046\046","\067\111\110\110\101\099\116\105\110\103\046\046\046")
local dc=dcBox.Text
ctx.spLogin(dc,function(ok,msg)
if ok then
accLabel.Text=gmT("\067\111\110\101\099\116\097\100\111\032\099\111\109\111\058\032","\067\111\110\110\101\099\116\101\100\032\097\115\058\032")..tostring(msg)
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
label=gmT("\067\101\114\114\097\114\032\115\101\115\105\111\110","\076\111\103\032\111\117\116"),
onClick=function()
ctx.spLogout(function(ok,msg)
accLabel.Text=gmT("\083\101\115\105\111\110\032\099\101\114\114\097\100\097\046","\076\111\103\103\101\100\032\111\117\116\046")
clearList(recentsHolder or nil)
clearList(playlistsHolder or nil)
end)
end,
})
mkHint(cardA,gmT(
"\067\111\109\111\032\111\098\116\101\110\101\114\032\115\112\095\100\099\058\032\101\110\116\114\097\032\097\032\111\112\101\110\046\115\112\111\116\105\102\121\046\099\111\109\032\099\111\110\032\084\085\032\099\117\101\110\116\097\032\101\110\032\101\108\032\110\097\118\101\103\097\100\111\114\044\032\097\098\114\101\032\070\049\050\032\040\105\110\115\112\101\099\099\105\111\110\097\114\041\032\062\032\065\112\112\108\105\099\097\116\105\111\110\032\062\032\067\111\111\107\105\101\115\032\062\032\104\116\116\112\115\058\047\047\111\112\101\110\046\115\112\111\116\105\102\121\046\099\111\109\032\121\032\099\111\112\105\097\032\101\108\032\118\097\108\111\114\032\100\101\032\115\112\095\100\099\046\032\083\101\032\103\117\097\114\100\097\032\083\079\076\079\032\101\110\032\116\117\032\080\067\046",
"\072\111\119\032\116\111\032\103\101\116\032\115\112\095\100\099\058\032\108\111\103\032\105\110\116\111\032\111\112\101\110\046\115\112\111\116\105\102\121\046\099\111\109\032\105\110\032\121\111\117\114\032\098\114\111\119\115\101\114\044\032\111\112\101\110\032\070\049\050\032\040\105\110\115\112\101\099\116\041\032\062\032\065\112\112\108\105\099\097\116\105\111\110\032\062\032\067\111\111\107\105\101\115\032\062\032\104\116\116\112\115\058\047\047\111\112\101\110\046\115\112\111\116\105\102\121\046\099\111\109\032\097\110\100\032\099\111\112\121\032\116\104\101\032\115\112\095\100\099\032\118\097\108\117\101\046\032\073\116\032\105\115\032\115\116\111\114\101\100\032\079\078\076\089\032\111\110\032\121\111\117\114\032\080\067\046"
))
local cardP=mkCard(page,gmT("\082\101\112\114\111\100\117\099\116\111\114","\080\108\097\121\101\114"))
local nowLabel=mkHint(cardP,gmT("\078\097\100\097\032\115\117\101\110\097\032\116\111\100\097\118\105\097","\078\111\116\104\105\110\103\032\112\108\097\121\105\110\103\032\121\101\116"))
local playerGrid=mkGrid(cardP)
mkButton(playerGrid,{
label=gmT("\080\097\117\115\097\032\047\032\083\101\103\117\105\114","\080\097\117\115\101\032\047\032\082\101\115\117\109\101"),
onClick=ctx.spPauseResume,
})
mkButton(playerGrid,{
label=gmT("\080\097\114\097\114","\083\116\111\112"),
onClick=ctx.spStop,
})
mkSlider(cardP,{
label=gmT("\086\111\108\117\109\101\110","\086\111\108\117\109\101"),
min=0,
max=100,
step=5,
suffix="\037",
init=ctx.getMusicVolume(),
onChange=ctx.spSetVolume,
})
ctx.spSetStateHandler(function(state)
if state and state.playing then
nowLabel.Text="\126\032"..tostring(state.title).."\032\045\032"..tostring(state.artist)
elseif state and state.title~="" then
nowLabel.Text=gmT("\080\097\117\115\097\100\111\058\032","\080\097\117\115\101\100\058\032")..tostring(state.title)
else
nowLabel.Text=gmT("\078\097\100\097\032\115\117\101\110\097\032\116\111\100\097\118\105\097","\078\111\116\104\105\110\103\032\112\108\097\121\105\110\103\032\121\101\116")
end
end)
local cardS=mkCard(page,gmT("\066\117\115\099\097\114\032\101\110\032\083\112\111\116\105\102\121","\083\112\111\116\105\102\121\032\115\101\097\114\099\104"))
local searchBox=mkInput(cardS,gmT("\067\097\110\099\105\111\110\032\111\032\097\114\116\105\115\116\097\046\046\046","\083\111\110\103\032\111\114\032\097\114\116\105\115\116\046\046\046"))
local searchStatus
local resultsHolder
mkButton(cardS,{
label=gmT("\066\117\115\099\097\114\032\099\097\110\099\105\111\110\101\115","\083\101\097\114\099\104\032\115\111\110\103\115"),
full=true,
onClick=function()
if #searchBox.Text==0 then
return
end
searchStatus.Text=gmT("\066\117\115\099\097\110\100\111\046\046\046","\083\101\097\114\099\104\105\110\103\046\046\046")
local q=searchBox.Text
ctx.spSearch(q,function(err,tracks)
if err then
searchStatus.Text=gmT("\070\097\108\108\111\032\108\097\032\098\117\115\113\117\101\100\097\032\045\032\114\101\118\105\115\097\032\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116","\083\101\097\114\099\104\032\102\097\105\108\101\100\032\045\032\099\104\101\099\107\032\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116")
return
end
searchStatus.Text=tostring(#tracks)
..gmT("\032\114\101\115\117\108\116\097\100\111\115\032\045\032\116\111\099\097\032\117\110\097\032\099\097\110\099\105\111\110","\032\114\101\115\117\108\116\115\032\045\032\116\097\112\032\097\032\115\111\110\103")
clearList(resultsHolder)
for i,tr in ipairs(tracks) do
local label=tostring(i).."\046\032"..tr.title.."\032\045\032"..tr.artist
if not tr.url then
label=label..gmT("\032\040\115\105\110\032\112\114\101\118\105\101\119\041","\032\040\110\111\032\112\114\101\118\105\101\119\041")
end
mkTrackRow(resultsHolder,label,function()
ctx.spPlayResult(i)
end)
end
end)
end,
})
searchStatus=mkHint(cardS,"\032")
resultsHolder=mkListHolder(cardS)
local cardR=mkCard(page,gmT("\084\117\115\032\114\101\099\105\101\110\116\101\115","\089\111\117\114\032\114\101\099\101\110\116\108\121\032\112\108\097\121\101\100"))
mkButton(cardR,{
label=gmT("\067\097\114\103\097\114\032\114\101\099\105\101\110\116\101\115","\076\111\097\100\032\114\101\099\101\110\116\108\121\032\112\108\097\121\101\100"),
full=true,
onClick=function()
if doRecent then
doRecent()
end
end,
})
recentStatus=mkHint(cardR,gmT("\073\110\105\099\105\097\032\115\101\115\105\111\110\032\121\032\099\097\114\103\097\032\108\111\032\117\108\116\105\109\111\032\113\117\101\032\101\115\099\117\099\104\097\115\116\101\046","\076\111\103\032\105\110\032\097\110\100\032\108\111\097\100\032\119\104\097\116\032\121\111\117\032\108\097\115\116\032\104\101\097\114\100\046"))
recentsHolder=mkListHolder(cardR)
doRecent=function()
recentStatus.Text=gmT("\067\097\114\103\097\110\100\111\046\046\046","\076\111\097\100\105\110\103\046\046\046")
ctx.spRecent(function(err,tracks)
if err then
recentStatus.Text=gmT("\078\101\099\101\115\105\116\097\115\032\105\110\105\099\105\097\114\032\115\101\115\105\111\110\046","\089\111\117\032\110\101\101\100\032\116\111\032\108\111\103\032\105\110\032\102\105\114\115\116\046")
return
end
recentStatus.Text=tostring(#tracks)..gmT("\032\099\097\110\099\105\111\110\101\115\032\045\032\116\111\099\097\032\112\097\114\097\032\101\115\099\117\099\104\097\114","\032\115\111\110\103\115\032\045\032\116\097\112\032\116\111\032\104\101\097\114")
renderTrackList(recentsHolder,tracks,function(i)
ctx.spPlayResult(i)
end)
end)
end
local cardMy=mkCard(page,gmT("\077\105\115\032\112\108\097\121\108\105\115\116\115","\077\121\032\112\108\097\121\108\105\115\116\115"))
mkButton(cardMy,{
label=gmT("\067\097\114\103\097\114\032\109\105\115\032\112\108\097\121\108\105\115\116\115","\076\111\097\100\032\109\121\032\112\108\097\121\108\105\115\116\115"),
full=true,
onClick=function()
if doMyPlaylists then
doMyPlaylists()
end
end,
})
playlistListStatus=mkHint(cardMy,gmT("\084\117\115\032\112\108\097\121\108\105\115\116\115\032\097\112\097\114\101\099\101\110\032\097\113\117\105\059\032\116\111\099\097\032\117\110\097\032\121\032\115\101\032\099\097\114\103\097\032\097\098\097\106\111\046","\089\111\117\114\032\112\108\097\121\108\105\115\116\115\032\115\104\111\119\032\117\112\032\104\101\114\101\059\032\116\097\112\032\111\110\101\032\116\111\032\108\111\097\100\032\105\116\032\098\101\108\111\119\046"))
playlistsHolder=mkListHolder(cardMy)
doMyPlaylists=function()
playlistListStatus.Text=gmT("\067\097\114\103\097\110\100\111\046\046\046","\076\111\097\100\105\110\103\046\046\046")
ctx.spMyPlaylists(function(err,lists)
if err then
playlistListStatus.Text=gmT("\078\101\099\101\115\105\116\097\115\032\105\110\105\099\105\097\114\032\115\101\115\105\111\110\046","\089\111\117\032\110\101\101\100\032\116\111\032\108\111\103\032\105\110\032\102\105\114\115\116\046")
return
end
playlistListStatus.Text=tostring(#lists)..gmT("\032\112\108\097\121\108\105\115\116\115\032\045\032\116\111\099\097\032\117\110\097\032\112\097\114\097\032\099\097\114\103\097\114\108\097","\032\112\108\097\121\108\105\115\116\115\032\045\032\116\097\112\032\111\110\101\032\116\111\032\108\111\097\100\032\105\116")
clearList(playlistsHolder)
for _,pl in ipairs(lists) do
local pid=pl.id
mkTrackRow(playlistsHolder,pl.name,function()
if queueStatus then
queueStatus.Text=gmT("\067\097\114\103\097\110\100\111\032\112\108\097\121\108\105\115\116\046\046\046","\076\111\097\100\105\110\103\032\112\108\097\121\108\105\115\116\046\046\046")
end
ctx.spPlaylist(pid,function(err2,tracks)
if err2 or not queueStatus then
return
end
queueStatus.Text=tostring(#tracks)
..gmT("\032\099\097\110\099\105\111\110\101\115\032\045\032\116\111\099\097\032\117\110\097\032\121\032\115\105\103\117\101\032\115\111\108\097","\032\115\111\110\103\115\032\045\032\116\097\112\032\111\110\101\032\097\110\100\032\105\116\032\107\101\101\112\115\032\103\111\105\110\103")
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
local cardL=mkCard(page,gmT("\080\108\097\121\108\105\115\116\032\112\111\114\032\108\105\110\107","\080\108\097\121\108\105\115\116\032\098\121\032\108\105\110\107"))
local plBox=mkInput(cardL,gmT("\080\101\103\097\032\101\108\032\108\105\110\107\032\100\101\032\116\117\032\112\108\097\121\108\105\115\116\046\046\046","\080\097\115\116\101\032\121\111\117\114\032\112\108\097\121\108\105\115\116\032\108\105\110\107\046\046\046"))
mkButton(cardL,{
label=gmT("\067\097\114\103\097\114\032\112\108\097\121\108\105\115\116","\076\111\097\100\032\112\108\097\121\108\105\115\116"),
full=true,
onClick=function()
if #plBox.Text==0 then
return
end
queueStatus.Text=gmT("\067\097\114\103\097\110\100\111\046\046\046","\076\111\097\100\105\110\103\046\046\046")
local link=plBox.Text
ctx.spPlaylist(link,function(err,tracks)
if err then
queueStatus.Text=gmT("\078\111\032\115\101\032\112\117\100\111\032\099\097\114\103\097\114\032\045\032\114\101\118\105\115\097\032\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116","\067\111\117\108\100\032\110\111\116\032\108\111\097\100\032\045\032\099\104\101\099\107\032\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116")
return
end
queueStatus.Text=tostring(#tracks)
..gmT("\032\099\097\110\099\105\111\110\101\115\032\045\032\116\111\099\097\032\117\110\097\032\121\032\115\105\103\117\101\032\101\110\032\111\114\100\101\110\032\115\111\108\097","\032\116\114\097\099\107\115\032\045\032\116\097\112\032\111\110\101\032\097\110\100\032\105\116\032\107\101\101\112\115\032\103\111\105\110\103")
renderTrackList(queueHolder,tracks,function(i)
ctx.spPlayQueue(i)
end)
end)
end,
})
queueStatus=mkHint(cardL,"\032")
queueHolder=mkListHolder(cardL)
local cardH=mkCard(page,"\083\112\111\116\105\102\121")
mkHint(cardH,gmT(
"\066\117\115\099\097\032\099\097\110\099\105\111\110\101\115\032\114\101\097\108\101\115\032\100\101\032\083\112\111\116\105\102\121\032\121\032\101\115\099\117\099\104\097\032\101\108\032\112\114\101\118\105\101\119\032\040\051\048\115\041\046\032\080\101\103\097\032\101\108\032\108\105\110\107\032\100\101\032\116\117\032\112\108\097\121\108\105\115\116\032\112\117\098\108\105\099\097\032\121\032\115\101\032\114\101\112\114\111\100\117\099\101\032\101\110\032\111\114\100\101\110\046\032\083\105\032\097\108\103\111\032\102\097\108\108\097\044\032\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116\032\100\105\099\101\032\113\117\101\032\112\097\115\111\046",
"\083\101\097\114\099\104\032\114\101\097\108\032\083\112\111\116\105\102\121\032\115\111\110\103\115\032\097\110\100\032\104\101\097\114\032\116\104\101\032\051\048\115\032\112\114\101\118\105\101\119\046\032\080\097\115\116\101\032\121\111\117\114\032\112\117\098\108\105\099\032\112\108\097\121\108\105\115\116\032\108\105\110\107\032\097\110\100\032\105\116\032\112\108\097\121\115\032\105\110\032\111\114\100\101\114\046\032\073\102\032\097\110\121\116\104\105\110\103\032\102\097\105\108\115\044\032\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116\032\115\097\121\115\032\119\104\097\116\032\104\097\112\112\101\110\101\100\046"
))
end)
safeBuild("\083\101\116\116\105\110\103\115",function()
local page=pages[7]
local cardL=mkCard(page,gmT("\073\100\105\111\109\097","\076\097\110\103\117\097\103\101"))
mkDropdown(cardL,{
label=gmT("\073\100\105\111\109\097\032\100\101\108\032\115\099\114\105\112\116","\083\099\114\105\112\116\032\108\097\110\103\117\097\103\101"),
options={"\069\115\112\097\110\111\108","\069\110\103\108\105\115\104"},
init=ctx.getLanguageLabel(),
onChange=ctx.setLanguage,
})
local langHint=IN("\084\101\120\116\076\097\098\101\108")
langHint.BackgroundTransparency=1
langHint.Size=U2(1,0,0,0)
langHint.AutomaticSize=Enum.AutomaticSize.Y
langHint.LayoutOrder=nextRow()
langHint.Font=WIN_FONT
langHint.TextSize=10
langHint.TextXAlignment=TX.Left
langHint.TextYAlignment=Enum.TextYAlignment.Top
langHint.TextWrapped=true
langHint.TextColor3=C_DIM
langHint.TextTransparency=0.3
langHint.Text=gmT(
"\067\097\109\098\105\097\032\101\108\032\105\100\105\111\109\097\032\100\101\032\116\111\100\097\032\108\097\032\105\110\116\101\114\102\097\122\032\097\108\032\105\110\115\116\097\110\116\101\046",
"\083\119\105\116\099\104\032\116\104\101\032\119\104\111\108\101\032\105\110\116\101\114\102\097\099\101\032\108\097\110\103\117\097\103\101\032\105\110\115\116\097\110\116\108\121\046"
)
langHint.ZIndex=3
langHint.Parent=cardL
local cardS=mkCard(page,gmT("\083\111\110\105\100\111\115\032\100\101\032\108\097\032\105\110\116\101\114\102\097\122","\073\110\116\101\114\102\097\099\101\032\115\111\117\110\100\115"))
mkToggle(cardS,{
label=gmT("\083\111\110\105\100\111\115\032\085\073","\085\073\032\115\111\117\110\100\115"),
init=ctx.getSoundsOn(),
onChange=ctx.setSoundsOn,
})
local sndHint=IN("\084\101\120\116\076\097\098\101\108")
sndHint.BackgroundTransparency=1
sndHint.Size=U2(1,0,0,0)
sndHint.AutomaticSize=Enum.AutomaticSize.Y
sndHint.LayoutOrder=nextRow()
sndHint.Font=WIN_FONT
sndHint.TextSize=10
sndHint.TextXAlignment=TX.Left
sndHint.TextYAlignment=Enum.TextYAlignment.Top
sndHint.TextWrapped=true
sndHint.TextColor3=C_DIM
sndHint.TextTransparency=0.3
sndHint.Text=gmT(
"\070\101\101\100\098\097\099\107\032\115\111\110\111\114\111\032\099\114\101\109\111\115\111\032\101\110\032\116\111\100\097\032\108\097\032\105\110\116\101\114\102\097\122\058\032\116\111\103\103\108\101\115\044\032\098\111\116\111\110\101\115\044\032\115\108\105\100\101\114\115\032\121\032\109\101\110\117\115\046",
"\067\114\101\097\109\121\032\115\111\117\110\100\032\102\101\101\100\098\097\099\107\032\097\099\114\111\115\115\032\116\104\101\032\119\104\111\108\101\032\105\110\116\101\114\102\097\099\101\058\032\116\111\103\103\108\101\115\044\032\098\117\116\116\111\110\115\044\032\115\108\105\100\101\114\115\032\097\110\100\032\109\101\110\117\115\046"
)
sndHint.ZIndex=3
sndHint.Parent=cardS
local cardP=mkCard(page,gmT("\080\114\101\115\101\116\115\032\100\101\032\099\111\110\102\105\103\117\114\097\099\105\111\110","\067\111\110\102\105\103\117\114\097\116\105\111\110\032\112\114\101\115\101\116\115"))
local gridP=mkGrid(cardP)
mkButton(gridP,{
label=gmT("\067\097\114\103\097\114\032\080\114\101\115\101\116\032\065","\076\111\097\100\032\080\114\101\115\101\116\032\065"),
onClick=function()
ctx.applyPreset("\065")
end,
})
mkButton(gridP,{
label=gmT("\071\117\097\114\100\097\114\032\101\110\032\065","\083\097\118\101\032\105\110\116\111\032\065"),
onClick=function()
ctx.savePreset("\065")
end,
})
mkButton(gridP,{
label=gmT("\067\097\114\103\097\114\032\080\114\101\115\101\116\032\066","\076\111\097\100\032\080\114\101\115\101\116\032\066"),
onClick=function()
ctx.applyPreset("\066")
end,
})
mkButton(gridP,{
label=gmT("\071\117\097\114\100\097\114\032\101\110\032\066","\083\097\118\101\032\105\110\116\111\032\066"),
onClick=function()
ctx.savePreset("\066")
end,
})
local presHint=IN("\084\101\120\116\076\097\098\101\108")
presHint.BackgroundTransparency=1
presHint.Size=U2(1,0,0,0)
presHint.AutomaticSize=Enum.AutomaticSize.Y
presHint.LayoutOrder=nextRow()
presHint.Font=WIN_FONT
presHint.TextSize=10
presHint.TextXAlignment=TX.Left
presHint.TextYAlignment=Enum.TextYAlignment.Top
presHint.TextWrapped=true
presHint.TextColor3=C_DIM
presHint.TextTransparency=0.3
presHint.Text=gmT(
"\085\110\032\112\114\101\115\101\116\032\103\117\097\114\100\097\032\084\079\068\079\058\032\118\105\115\117\097\108\044\032\109\111\118\105\109\105\101\110\116\111\044\032\103\114\097\102\105\099\111\115\044\032\101\109\111\116\101\115\032\121\032\117\110\117\115\117\097\108\046\032\067\111\109\112\097\114\116\101\108\111\032\099\111\110\032\116\117\032\099\108\097\110\032\111\032\099\097\109\098\105\097\032\100\101\032\101\115\116\105\108\111\032\101\110\032\117\110\032\099\108\105\099\046",
"\065\032\112\114\101\115\101\116\032\115\097\118\101\115\032\069\086\069\082\089\084\072\073\078\071\058\032\118\105\115\117\097\108\115\044\032\109\111\118\101\109\101\110\116\044\032\103\114\097\112\104\105\099\115\044\032\101\109\111\116\101\115\032\097\110\100\032\117\110\117\115\117\097\108\046\032\083\104\097\114\101\032\105\116\032\119\105\116\104\032\121\111\117\114\032\099\108\097\110\032\111\114\032\115\119\105\116\099\104\032\115\116\121\108\101\115\032\105\110\032\111\110\101\032\099\108\105\099\107\046"
)
presHint.ZIndex=3
presHint.Parent=cardP
local cardM=mkCard(page,gmT("\077\097\110\116\101\110\105\109\105\101\110\116\111","\077\097\105\110\116\101\110\097\110\099\101"))
mkButton(cardM,{
label=gmT("\071\117\097\114\100\097\114\032\116\111\100\111\032\097\104\111\114\097","\083\097\118\101\032\101\118\101\114\121\116\104\105\110\103\032\110\111\119"),
full=true,
onClick=ctx.saveAllNow,
})
mkButton(cardM,{
label=gmT("\082\101\115\116\097\117\114\097\114\032\118\097\108\111\114\101\115\032\100\101\032\102\097\098\114\105\099\097","\070\097\099\116\111\114\121\032\114\101\115\101\116"),
full=true,
danger=true,
onClick=ctx.factoryReset,
})
end)
local menuOpen=true
local modalBtn=IN("\084\101\120\116\066\117\116\116\111\110")
modalBtn.Name="\077\111\100\097\108\076\111\099\107"
modalBtn.Text=""
modalBtn.AutoButtonColor=false
modalBtn.BackgroundColor3=Color3.new(1,1,1)
modalBtn.BackgroundTransparency=1
modalBtn.Size=UDim2.fromOffset(1,1)
modalBtn.Position=UDim2.fromOffset(2,2)
modalBtn.Modal=true
modalBtn.Visible=true
modalBtn.ZIndex=1
modalBtn.Parent=root
local mouseIconWasEnabled=UserInputService.MouseIconEnabled
local function applyCursorState()
pcall(function()
UserInputService.MouseIconEnabled=menuOpen and true or mouseIconWasEnabled
end)
end
applyCursorState()
bindConn(root.Destroying:Connect(function()
pcall(function()
UserInputService.MouseIconEnabled=mouseIconWasEnabled
end)
end))
bindConn(UserInputService.InputBegan:Connect(function(input)
if input.UserInputType~=Enum.UserInputType.MouseButton2 then
return
end
if menuOpen then
modalBtn.Visible=false
end
end))
bindConn(UserInputService.InputEnded:Connect(function(input)
if input.UserInputType~=Enum.UserInputType.MouseButton2 then
return
end
if menuOpen then
modalBtn.Visible=true
end
end))
local applyPillPos=nil
local function setVisible(state,animate)
if animate then
zzV1.uiSound(state and "\111\112\101\110" or "\099\108\111\115\101")
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
TweenService:Create(
uiScale,
TweenInfo.new(0.26,ES.Back,ED.Out),
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
if input.KeyCode~=Enum.KeyCode.X then
return
end
if capturing or UserInputService:GetFocusedTextBox()~=nil then
return
end
setVisible(not menuOpen,true)
end))
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
local openPill=IN("\084\101\120\116\066\117\116\116\111\110")
openPill.Name="\079\112\101\110\080\105\108\108"
openPill.AutoButtonColor=false
openPill.AnchorPoint=Vector2.new(0.5,0)
openPill.Position=U2(0.5,0,0,2)
openPill.Size=UDim2.fromOffset(54,54)
openPill.BackgroundColor3=C_CARD
openPill.BackgroundTransparency=0.15
openPill.BorderSizePixel=0
openPill.Font=WIN_FONT_GOTHIC
openPill.TextSize=18
openPill.TextColor3=C_TEXT
openPill.Text="\071\077"
openPill.ZIndex=2
local opCorner=IN("\085\073\067\111\114\110\101\114")
opCorner.CornerRadius=UD(1,0)
opCorner.Parent=openPill
local opStroke=IN("\085\073\083\116\114\111\107\101")
opStroke.Color=C_ACCENT
opStroke.Thickness=1.5
opStroke.Transparency=0.45
opStroke.Parent=openPill
openPill.Parent=root
openPill.Activated:Connect(function()
setVisible(not menuOpen,true)
end)
local islandActive=false
local pillInfo=TweenInfo.new(0.3,ES.Back,ED.Out)
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
TweenService:Create(openPill,pillInfo,{Position=target}):Play()
else
openPill.Position=target
end
end
zzV1.setIslandActive=function(active)
islandActive=active==true
applyPillPos(true)
end
applyPillPos(false)
end
zzV1.root=root
zzV1.setVisible=setVisible
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
design="\071\108\097\115\115",
color="\068\097\114\107",
font="\065\117\116\111",
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
if KS.color=="\080\101\114\115\111\110\097\108\105\122\097\100\111" then
local i=KS.customIdle
local p=KS.customPressed
local t=KS.customText
return {
idle=CR(i[1],i[2],i[3]),
pressed=CR(p[1],p[2],p[3]),
stroke=CR(
math.floor(i[1]*0.8+p[1]*0.2+0.5),
math.floor(i[2]*0.8+p[2]*0.2+0.5),
math.floor(i[3]*0.8+p[3]*0.2+0.5)
),
text=CR(t[1],t[2],t[3]),
textPressed=CR(255,255,255),
panel=CR(math.floor(i[1]*0.6),math.floor(i[2]*0.6),math.floor(i[3]*0.6)),
panelStroke=CR(i[1],i[2],i[3]),
handle=CR(
math.floor(i[1]*0.8+60),
math.floor(i[2]*0.8+40),
math.floor(i[3]*0.8+90)
),
handleText=CR(255,255,255),
keyGrad=CR(
math.floor(i[1]*0.4+153),
math.floor(i[2]*0.4+153),
math.floor(i[3]*0.4+153)
),
panelGrad=CR(
math.floor(i[1]*0.5+100),
math.floor(i[2]*0.5+100),
math.floor(i[3]*0.5+100)
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
local gridW=math.floor(6.75*KEY_SIZE+5*gap+0.5)
local gridH=4*KEY_SIZE+3*gap
local padTop=KS.wm and 30 or 6
local panelW=gridW+PAD_X*2
local panelH=gridH+padTop+PAD_BOTTOM
return gap,gridW,gridH,padTop,panelW,panelH
end
local Rows={
{
{"\084\097\098",1.5,Enum.KeyCode.Tab},
{"\081",1,Enum.KeyCode.Q},
{"\087",1,Enum.KeyCode.W},
{"\069",1,Enum.KeyCode.E},
{"\082",1,Enum.KeyCode.R},
{"\084",1,Enum.KeyCode.T},
},
{
{"\067\097\112\115\076\111\099\107",1.75,Enum.KeyCode.CapsLock},
{"\065",1,Enum.KeyCode.A},
{"\083",1,Enum.KeyCode.S},
{"\068",1,Enum.KeyCode.D},
{"\070",1,Enum.KeyCode.F},
{"\071",1,Enum.KeyCode.G},
},
{
{"\083\104\105\102\116",2.25,Enum.KeyCode.LeftShift},
{"\090",1,Enum.KeyCode.Z},
{"\088",1,Enum.KeyCode.X},
{"\067",1,Enum.KeyCode.C},
{"\086",1,Enum.KeyCode.V},
},
{
{"\067\116\114\108",1.25,Enum.KeyCode.LeftControl},
{"\065\108\116",1.25,Enum.KeyCode.LeftAlt},
{"\083\112\097\099\101",4,Enum.KeyCode.Space},
},
}
local AlternateCodes={
[Enum.KeyCode.LeftShift]=Enum.KeyCode.RightShift,
[Enum.KeyCode.LeftControl]=Enum.KeyCode.RightControl,
[Enum.KeyCode.LeftAlt]=Enum.KeyCode.RightAlt,
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
pcall(function()
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
if KS.color=="\082\097\105\110\098\111\119" and Keys and Keys.enabled then
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
if KS.color=="\082\097\105\110\098\111\119" then
C={
pressed=CR(250,250,255),
textPressed=CR(20,20,30),
}
end
local bg=C.pressed
local tx=C.textPressed
TweenService:Create(
chip.frame,
TweenInfo.new(0.07,ES.Quad,ED.Out),
{BackgroundColor3=bg,BackgroundTransparency=1 -(0.92*o)}
):Play()
if chip.hasStroke then
TweenService:Create(
chip.stroke,
TweenInfo.new(0.07,ES.Quad,ED.Out),
{Color=bg,Thickness=D.strokePressed,Transparency=1 -(0.95*o)}
):Play()
end
TweenService:Create(
chip.label,
TweenInfo.new(0.07,ES.Quad,ED.Out),
{TextColor3=tx,TextTransparency=1 -(0.95*o)}
):Play()
if chip.popScale then
TweenService:Create(
chip.popScale,
TweenInfo.new(0.07,ES.Quad,ED.Out),
{Scale=0.92}
):Play()
end
else
local bg,tx,st
if KS.color=="\082\097\105\110\098\111\119" then
bg,st=rainbowIdle(chip)
tx=CR(245,245,255)
else
bg=C.idle
tx=C.text
st=C.stroke
end
TweenService:Create(
chip.frame,
TweenInfo.new(0.12,ES.Quad,ED.Out),
{BackgroundColor3=bg,BackgroundTransparency=1 -(0.88*o)}
):Play()
if chip.hasStroke and st then
TweenService:Create(
chip.stroke,
TweenInfo.new(0.12,ES.Quad,ED.Out),
{Color=st,Thickness=D.stroke,Transparency=1 -(0.6*o)}
):Play()
end
TweenService:Create(
chip.label,
TweenInfo.new(0.12,ES.Quad,ED.Out),
{TextColor3=tx,TextTransparency=1 -(0.85*o)}
):Play()
if chip.popScale then
TweenService:Create(
chip.popScale,
TweenInfo.new(0.12,ES.Quad,ED.Out),
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
TweenService:Create(
overlayPanel,
TweenInfo.new(0.12,ES.Quad,ED.Out),
{BackgroundTransparency=panelT,BackgroundColor3=C.panel}
):Play()
if overlayPanel.GlassStroke then
local strokeT=KS.bg and(1 -(0.9*bo)) or 1
TweenService:Create(
overlayPanel.GlassStroke,
TweenInfo.new(0.12,ES.Quad,ED.Out),
{Transparency=strokeT,Color=C.panelStroke,Thickness=D.glassStroke}
):Play()
end
local handle=overlayPanel:FindFirstChild("\072\097\110\100\108\101")
if handle then
TweenService:Create(
handle,
TweenInfo.new(0.12,ES.Quad,ED.Out),
{BackgroundTransparency=1 -(0.45*bo),BackgroundColor3=C.handle}
):Play()
local lbl=handle:FindFirstChild("\076\097\098\101\108")
if lbl then
TweenService:Create(
lbl,
TweenInfo.new(0.12,ES.Quad,ED.Out),
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
if input.UserInputType==Enum.UserInputType.MouseButton1
or input.UserInputType==Enum.UserInputType.Touch
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
if input.UserInputType==Enum.UserInputType.MouseMovement
or input.UserInputType==Enum.UserInputType.Touch
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
local frame=IN("\070\114\097\109\101")
frame.Name="\075\101\121\095"..labelText
frame.AnchorPoint=Vector2.new(0.5,0.5)
frame.Position=UDim2.fromOffset(x+w/2,y+h/2)
frame.Size=UDim2.fromOffset(w,h)
frame.BackgroundColor3=C.idle
frame.BackgroundTransparency=1 -(0.88*KS.opacity)
frame.BorderSizePixel=0
frame.Active=false
frame.Selectable=false
frame.Parent=parent
local corner=IN("\085\073\067\111\114\110\101\114")
corner.CornerRadius=UD(0,D.corner)
corner.Parent=frame
if D.gradient then
local gradient=IN("\085\073\071\114\097\100\105\101\110\116")
gradient.Rotation=90
gradient.Color=ColorSequence.new(CR(255,255,255),C.keyGrad)
gradient.Parent=frame
end
local hasStroke=D.stroke>0
local stroke=nil
if hasStroke then
stroke=IN("\085\073\083\116\114\111\107\101")
stroke.Name="\083\116\114\111\107\101"
stroke.Color=C.stroke
stroke.Thickness=D.stroke
stroke.Transparency=1 -(0.6*KS.opacity)
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Parent=frame
end
local label=IN("\084\101\120\116\076\097\098\101\108")
label.Name="\076\097\098\101\108"
label.BackgroundTransparency=1
label.Size=UDim2.fromScale(1,1)
label.Font=keyFont()
label.Text=labelText
label.TextSize=math.max(7,KS.textSize+D.textDelta)
label.TextColor3=C.text
label.TextTransparency=1 -(0.85*KS.opacity)
label.Parent=frame
local popScale=IN("\085\073\083\099\097\108\101")
popScale.Name="\080\111\112\083\099\097\108\101"
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
overlayGui=IN("\083\099\114\101\101\110\071\117\105")
overlayGui.Name="\071\104\111\115\116\077\101\116\104\111\100\095\075\101\121\115\116\114\111\107\101\115"
overlayGui.ResetOnSpawn=false
overlayGui.IgnoreGuiInset=true
overlayGui.DisplayOrder=9999
overlayGui.Enabled=not startHidden
Keys.Scope:Track(overlayGui)
overlayRoot=IN("\070\114\097\109\101")
overlayRoot.Name="\082\111\111\116"
overlayRoot.AnchorPoint=Vector2.new(0.5,0.5)
overlayRoot.Position=KS.pos or DEFAULT_POS
overlayRoot.Size=UDim2.fromOffset(panelW,panelH)
overlayRoot.BackgroundTransparency=1
overlayRoot.Parent=overlayGui
scaleObj=IN("\085\073\083\099\097\108\101")
scaleObj.Scale=KS.scale
scaleObj.Parent=overlayRoot
overlayPanel=IN("\070\114\097\109\101")
overlayPanel.Name="\080\097\110\101\108"
overlayPanel.Size=UDim2.fromScale(1,1)
overlayPanel.BackgroundColor3=C.panel
overlayPanel.BackgroundTransparency=KS.bg and(1 -(0.55*KS.bgOpacity)) or 1
overlayPanel.BorderSizePixel=0
overlayPanel.Parent=overlayRoot
local panelCorner=IN("\085\073\067\111\114\110\101\114")
panelCorner.CornerRadius=UD(0,D.panelCorner)
panelCorner.Parent=overlayPanel
if D.panelGradient then
local panelGradient=IN("\085\073\071\114\097\100\105\101\110\116")
panelGradient.Rotation=90
panelGradient.Color=ColorSequence.new(CR(255,255,255),C.panelGrad)
panelGradient.Parent=overlayPanel
end
local glassStroke=IN("\085\073\083\116\114\111\107\101")
glassStroke.Name="\071\108\097\115\115\083\116\114\111\107\101"
glassStroke.Color=C.panelStroke
glassStroke.Thickness=D.glassStroke
glassStroke.Transparency=KS.bg and(1 -(0.9*KS.bgOpacity)) or 1
glassStroke.Parent=overlayPanel
if KS.wm then
local handle=IN("\070\114\097\109\101")
handle.Name="\072\097\110\100\108\101"
handle.AnchorPoint=Vector2.new(0.5,0)
handle.Position=U2(0.5,0,0,6)
handle.Size=UDim2.fromOffset(134,20)
handle.BackgroundColor3=C.handle
handle.BackgroundTransparency=1 -(0.45*KS.bgOpacity)
handle.BorderSizePixel=0
handle.Parent=overlayPanel
local handleCorner=IN("\085\073\067\111\114\110\101\114")
handleCorner.CornerRadius=UD(0,D.panelCorner)
handleCorner.Parent=handle
local handleLabel=IN("\084\101\120\116\076\097\098\101\108")
handleLabel.Name="\076\097\098\101\108"
handleLabel.BackgroundTransparency=1
handleLabel.Size=UDim2.fromScale(1,1)
handleLabel.Font=EF.GrenzeGotisch
handleLabel.Text="\071\072\079\083\084\032\077\069\084\072\079\068"
handleLabel.TextSize=12
handleLabel.TextColor3=C.handleText
handleLabel.TextTransparency=1 -(0.95*KS.bgOpacity)
handleLabel.Parent=handle
makeDraggable(handle)
end
local container=IN("\070\114\097\109\101")
container.Name="\075\101\121\115"
container.Position=UDim2.fromOffset(PAD_X,padTop)
container.Size=UDim2.fromOffset(gridW,gridH)
container.BackgroundTransparency=1
container.Parent=overlayPanel
for rowIndex,row in ipairs(Rows) do
local y=(rowIndex - 1)*(KEY_SIZE+gap)
local x=0
for _,def in ipairs(row) do
local w=math.floor(def[2]*KEY_SIZE+0.5)
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
pcall(function()
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
Name="\075\101\121\115\116\114\111\107\101\115",
enable=function(opts)
local hidden=(type(opts)=="\116\097\098\108\101" and opts.hidden==true)
if Keys.enabled then
return
end
Keys.enabled=true
buildOverlay(hidden)
Keys.Scope:Connect(UserInputService.InputBegan,function(input)
if input.UserInputType==Enum.UserInputType.Keyboard then
setChipPressed(input.KeyCode,true)
end
end)
Keys.Scope:Connect(UserInputService.InputEnded,function(input)
if input.UserInputType==Enum.UserInputType.Keyboard then
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
return false,"\111\118\101\114\108\097\121\032\083\099\114\101\101\110\071\117\105\032\110\111\116\032\112\097\114\101\110\116\101\100"
end
if builtKeys~=20 then
return false,"\101\120\112\101\099\116\101\100\032\050\048\032\107\101\121\115\032\040\054\043\054\043\053\043\051\041\044\032\098\117\105\108\116\032"..tostring(builtKeys)
end
if not scaleObj or not overlayPanel or not overlayRoot then
return false,"\111\118\101\114\108\097\121\032\115\116\114\117\099\116\117\114\101\032\105\110\099\111\109\112\108\101\116\101"
end
if Keys.Scope:Count()<3 then
return false,"\105\110\112\117\116\032\099\111\110\110\101\099\116\105\111\110\115\032\109\105\115\115\105\110\103"
end
return true
end,
verifyClean=function()
if overlayGui~=nil and overlayGui.Parent~=nil then
return false,"\111\118\101\114\108\097\121\032\115\116\105\108\108\032\112\097\114\101\110\116\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if rainbowConn then
return false,"\114\097\105\110\098\111\119\032\108\111\111\112\032\115\116\105\108\108\032\099\111\110\110\101\099\116\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if not Keys.Scope:IsClean() then
return false,"\115\099\111\112\101\032\115\116\105\108\108\032\104\111\108\100\115\032\108\105\118\101\032\099\111\110\110\101\099\116\105\111\110\115"
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
if name=="\080\101\114\115\111\110\097\108\105\122\097\100\111" or COLORS[name] or name=="\082\097\105\110\098\111\119" then
KS.color=name
if overlayGui then
if name=="\082\097\105\110\098\111\119" then
syncRainbow()
else
stopRainbow()
rebuild()
end
end
end
end
API.setFont=function(name)
if FONTS[name]~=nil or name=="\065\117\116\111" then
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
if type(idleArr)=="\116\097\098\108\101" and #idleArr==3 then
KS.customIdle=idleArr
end
if type(pressedArr)=="\116\097\098\108\101" and #pressedArr==3 then
KS.customPressed=pressedArr
end
if type(textArr)=="\116\097\098\108\101" and #textArr==3 then
KS.customText=textArr
end
if KS.color=="\080\101\114\115\111\110\097\108\105\122\097\100\111" and overlayGui then
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
local TweenService=game:GetService("\084\119\101\101\110\083\101\114\118\105\099\101")
local UserInputService=game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101")
local HUD
local gui=nil
local btns={}
local drags={}
local virtual={bhop=false,crunch=false}
local DEFS={
{key="\098\104\111\112",label="\066\072\079\080"},
{key="\099\114\117\110\099\104",label="\067\082\085\078\067\072"},
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
pcall(function()
TweenService:Create(
btn,
TweenInfo.new(0.12,ES.Quad,ED.Out),
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
gui=IN("\070\114\097\109\101")
gui.Name="\071\077\095\077\111\098\105\108\101\072\085\068"
gui.BackgroundTransparency=1
gui.Size=UDim2.fromScale(1,1)
gui.Visible=false
gui.ZIndex=2
gui.Parent=root
HUD.Scope:Track(gui)
for _,def in ipairs(DEFS) do
local btn=IN("\084\101\120\116\066\117\116\116\111\110")
btn.Name="\071\077\095\072\085\068\095"..def.label
btn.Text=def.label
btn.AutoButtonColor=false
btn.AnchorPoint=Vector2.new(0.5,0.5)
btn.BackgroundColor3=CR(22,14,36)
btn.BackgroundTransparency=0.15
btn.BorderSizePixel=0
btn.Font=EF.GothamBold
btn.TextSize=14
btn.TextColor3=CR(216,208,235)
btn.Active=true
btn.ZIndex=2
local bc=IN("\085\073\067\111\114\110\101\114")
bc.CornerRadius=UD(0,14)
bc.Parent=btn
local bs=IN("\085\073\083\116\114\111\107\101")
bs.Name="\083\116\114\111\107\101"
bs.Color=CR(120,80,190)
bs.Thickness=1.5
bs.Transparency=0.4
bs.Parent=btn
btn.Parent=gui
btns[def.key]=btn
btn.InputBegan:Connect(function(input)
if input.UserInputType~=Enum.UserInputType.MouseButton1
and input.UserInputType~=Enum.UserInputType.Touch then
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
if cfg[def.key.."\077\111\100\101"]=="\084\111\103\103\108\101" then
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
if input.UserInputType~=Enum.UserInputType.MouseButton1
and input.UserInputType~=Enum.UserInputType.Touch then
return
end
if drags[def.key] then
drags[def.key]=nil
env.setBtnPos(def.key,btn.Position)
return
end
local cfg=env.getHudCfg()
if cfg[def.key.."\077\111\100\101"]~="\084\111\103\103\108\101" then
virtual[def.key]=false
env.setVirtual(def.key,false)
paintBtn(def.key,false)
end
end)
end
HUD.Scope:Connect(UserInputService.InputChanged,function(input)
if input.UserInputType~=Enum.UserInputType.MouseMovement
and input.UserInputType~=Enum.UserInputType.Touch then
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
os.date("\037\072\058\037\077\058\037\083\032").."\097\112\112\108\121\058\032\098\104\111\112\079\110\061"..tostring(cfg.bhopOn)
.."\032\099\114\117\110\099\104\079\110\061"..tostring(cfg.crunchOn)
.."\032\115\105\122\101\061"..tostring(cfg.size)
.."\032\111\112\097\099\105\116\121\061"..tostring(cfg.opacity),
}
if not(cfg.bhopOn or cfg.crunchOn) then
if gui then
gui.Visible=false
end
dbg[#dbg+1]="\115\105\110\032\098\111\116\111\110\101\115\058\032\103\117\105\032"..(gui and "\111\099\117\108\116\111" or "\110\111\032\099\114\101\097\100\111")
pcall(function()
writefile("\071\077\095\104\117\100\095\100\101\098\117\103\046\116\120\116",table.concat(dbg,"\010"))
end)
return
end
if not ensureGui() then
dbg[#dbg+1]="\101\110\115\117\114\101\071\117\105\032\070\065\076\076\079"
pcall(function()
writefile("\071\077\095\104\117\100\095\100\101\098\117\103\046\116\120\116",table.concat(dbg,"\010"))
end)
return
end
gui.Visible=true
dbg[#dbg+1]="\103\117\105\058\032"..tostring(gui:GetFullName()).."\032\118\105\115\105\098\108\101\061"..tostring(gui.Visible)
for _,def in ipairs(DEFS) do
local btn=btns[def.key]
local on=cfg[def.key.."\079\110"]==true
btn.Visible=on
if on then
local size=cfg.size
btn.Size=UDim2.fromOffset(size,size)
btn.TextSize=math.max(11,math.floor(size/6))
local op=cfg.opacity/100
btn.BackgroundTransparency=1 -(0.85*op)
btn.TextTransparency=1 -(0.9*op)
local stroke=btn:FindFirstChild("\083\116\114\111\107\101")
if stroke then
stroke.Transparency=1 -(0.6*op)
stroke.Color=cfg.unlocked
and CR(167,108,255)
or CR(120,80,190)
stroke.Thickness=cfg.unlocked and 2.5 or 1.5
end
local pos=cfg.pos[def.key]
if type(pos)=="\116\097\098\108\101" and #pos==4 then
btn.Position=U2(pos[1],pos[2],pos[3],pos[4])
else
btn.Position=DEFAULT_POS[def.key]
end
task.defer(function()
pcall(function()
dbg[#dbg+1]=def.label.."\058\032\118\105\115\105\098\108\101\061"..tostring(btn.Visible)
.."\032\112\111\115\061"..tostring(btn.Position)
.."\032\097\098\115\061"..tostring(btn.AbsolutePosition)
.."\032\115\105\122\101\061"..tostring(btn.AbsoluteSize)
.."\032\098\103\084\061"..tostring(btn.BackgroundTransparency)
end)
pcall(function()
writefile("\071\077\095\104\117\100\095\100\101\098\117\103\046\116\120\116",table.concat(dbg,"\010"))
end)
end)
end
end
end
HUD=env.RegisterModule({
Name="\077\111\098\105\108\101\032\072\085\068",
enable=function(opts)
if HUD.enabled then
return
end
local okApply,errApply=pcall(function()
HUD.enabled=true
apply()
end)
if not okApply then
HUD.enabled=false
pcall(function()
writefile("\071\077\095\104\117\100\095\100\101\098\117\103\046\116\120\116",os.date("\037\072\058\037\077\058\037\083\032")
.."\069\078\065\066\076\069\032\069\082\082\079\082\058\032"..tostring(errApply))
end)
if env.notify then
env.notify("\071\104\111\115\116\032\077\101\116\104\111\100","\072\085\068\032\099\101\108\117\108\097\114\032\101\114\114\111\114\058\032"..tostring(errApply),8)
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
return false,"\103\117\105\032\110\111\116\032\098\117\105\108\116\032\119\104\105\108\101\032\101\110\097\098\108\101\100"
end
return true
end,
verifyClean=function()
if gui and gui.Visible then
return false,"\103\117\105\032\115\116\105\108\108\032\118\105\115\105\098\108\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
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
pcall(function()
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
math.clamp(math.floor(raw[1] or 167),0,255),
math.clamp(math.floor(raw[2] or 108),0,255),
math.clamp(math.floor(raw[3] or 255),0,255)
)
local alpha=1 - math.clamp(cfg.opacity or 100,5,100)/100
local size=math.clamp(cfg.size or 12,2,40)
local gap=math.clamp(cfg.gap or 4,0,24)
local thick=math.clamp(cfg.thickness or 2,1,10)
local style=cfg.style or "\067\114\111\115\115"
chGui=IN("\083\099\114\101\101\110\071\117\105")
chGui.Name="\071\077\095\067\114\111\115\115\104\097\105\114"
chGui.ResetOnSpawn=false
chGui.IgnoreGuiInset=true
chGui.DisplayOrder=40
chGui.Parent=root
local holder=IN("\070\114\097\109\101")
holder.Name="\072\111\108\100\101\114"
holder.AnchorPoint=Vector2.new(0.5,0.5)
holder.Position=U2(0.5,math.clamp(cfg.offX or 0,-600,600),0.5,math.clamp(cfg.offY or 0,-600,600))
holder.Size=UDim2.fromOffset((gap+size)*2+8,(gap+size)*2+8)
holder.BackgroundTransparency=1
holder.Parent=chGui
local function mkShape(px,py,w,h)
local f=IN("\070\114\097\109\101")
f.AnchorPoint=Vector2.new(0.5,0.5)
f.Position=UDim2.fromOffset(px,py)
f.Size=UDim2.fromOffset(w,h)
f.BackgroundColor3=color
f.BackgroundTransparency=alpha
f.BorderSizePixel=0
f.Parent=holder
return f
end
local function mkDot(d)
local f=mkShape(0,0,d,d)
local c=IN("\085\073\067\111\114\110\101\114")
c.CornerRadius=UD(1,0)
c.Parent=f
return f
end
local function mkRing(d)
local f=mkShape(0,0,d,d)
f.BackgroundTransparency=1
local st=IN("\085\073\083\116\114\111\107\101")
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
if style=="\068\111\116" then
mkDot(size)
elseif style=="\067\105\114\099\108\101" then
mkRing(size)
elseif style=="\067\114\111\115\115\032\043\032\068\111\116" then
mkArms()
mkDot(math.max(2,math.floor(thick*1.5)))
else
mkArms()
end
end
Crosshair=env.RegisterModule({
Name="\067\114\111\115\115\104\097\105\114",
enable=function()
if Crosshair.enabled then
return
end
Crosshair.enabled=true
chDraw()
if not chGui then
Crosshair.enabled=false
env.notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\067\114\111\115\115\104\097\105\114\058\032\110\111\032\115\101\032\112\117\100\111\032\099\114\101\097\114\032\101\108\032\111\118\101\114\108\097\121","\067\114\111\115\115\104\097\105\114\058\032\099\111\117\108\100\032\110\111\116\032\099\114\101\097\116\101\032\116\104\101\032\111\118\101\114\108\097\121"),4)
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
return false,"\103\117\105\032\115\116\105\108\108\032\097\108\105\118\101"
end
return true
end,
})
return Crosshair
end
local function buildEvadeFont(env)
local EvadeFont
local snaps=setmetatable({},{__mode="\107"})
local targetClasses={TextLabel=true,TextButton=true,TextBox=true}
local function isOurs(inst)
local gui=inst:FindFirstAncestorOfClass("\083\099\114\101\101\110\071\117\105")
if not gui then
return true
end
local n=gui.Name
return string.sub(n,1,3)=="\071\077\095"
or n=="\071\077\095\085\073"
or n=="\071\077\095\084\111\097\115\116\115"
or n=="\071\077\095\067\114\111\115\115\104\097\105\114"
end
local function fontFromLabel(label)
local map={
["\071\111\116\104\097\109"]=EF.Gotham,
["\071\111\116\104\097\109\032\066\111\108\100"]=EF.GothamBold,
["\077\111\110\116\115\101\114\114\097\116"]=EF.Montserrat,
["\083\099\105\045\070\105"]=EF.SciFi,
["\065\114\099\097\100\101"]=EF.Arcade,
["\070\097\110\116\097\115\121"]=EF.Fantasy,
["\067\111\100\101"]=EF.Code,
["\072\105\103\104\119\097\121"]=EF.Highway,
["\067\097\114\116\111\111\110"]=EF.Cartoon,
["\065\110\116\105\113\117\101"]=EF.Antique,
["\077\105\110\101\099\114\097\102\116"]=EF.Arcade,
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
pcall(function()
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
local pg=lp:FindFirstChild("\080\108\097\121\101\114\071\117\105")
if not pg then
return
end
for _,inst in ipairs(pg:GetDescendants()) do
applyOne(inst,font)
end
end
EvadeFont=env.RegisterModule({
Name="\069\118\097\100\101\070\111\110\116",
enable=function()
if EvadeFont.enabled then
return
end
local lp=env.getLocalPlayer()
if not lp or not lp:FindFirstChild("\080\108\097\121\101\114\071\117\105") then
env.notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\078\111\032\115\101\032\101\110\099\111\110\116\114\111\032\108\097\032\085\073\032\100\101\032\069\118\097\100\101\032\116\111\100\097\118\105\097\046","\069\118\097\100\101\039\115\032\085\073\032\110\111\116\032\102\111\117\110\100\032\121\101\116\046"),4)
return
end
EvadeFont.enabled=true
local font=fontFromLabel(env.getCfg().font)
scanAll(font)
local pg=lp:FindFirstChild("\080\108\097\121\101\114\071\117\105")
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
pcall(function()
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
return false,"\115\116\105\108\108\032\101\110\097\098\108\101\100"
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
pcall(function()
SPX.onState({
playing=SPX.playing,
title=SPX.current and SPX.current.title or "",
artist=SPX.current and SPX.current.artist or "",
})
end)
end
end
local function spDebug(tag,text)
pcall(function()
writefile("\071\077\095\115\112\111\116\105\102\121\095\100\101\098\117\103\046\116\120\116",os.date("\037\072\058\037\077\058\037\083")
.."\032\091"..tag.."\093\032"
..tostring(text))
end)
end
local function rawRequest(url,headers)
local fn=nil
if type(request)=="\102\117\110\099\116\105\111\110" then
fn=request
elseif type(http_request)=="\102\117\110\099\116\105\111\110" then
fn=http_request
elseif syn and type(syn.request)=="\102\117\110\099\116\105\111\110" then
fn=syn.request
end
if fn then
local ok,res=pcall(function()
return fn({Url=url,Method="\071\069\084",Headers=headers or {}})
end)
if ok and type(res)=="\116\097\098\108\101" then
return(res.Body or res.body or ""),true
end
spDebug("\114\101\113\117\101\115\116\045\102\110","\102\097\108\108\111\058\032"..tostring(res))
return nil,true
end
local ok2,body=pcall(function()
return game:HttpGet(url)
end)
if ok2 then
return body,false
end
spDebug("\104\116\116\112\103\101\116","\102\097\108\108\111\058\032"..tostring(body))
return nil,false
end
local HttpService=game:GetService("\072\116\116\112\083\101\114\118\105\099\101")
local function spToken(force)
local now=os.time()*1000
if not force and SPX.token and now<(SPX.tokenExp or 0) - 60000 then
return SPX.token
end
local dc=env.getDc and env.getDc() or ""
if type(dc)=="\115\116\114\105\110\103" and #dc>10 then
local body=rawRequest(
"\104\116\116\112\115\058\047\047\111\112\101\110\046\115\112\111\116\105\102\121\046\099\111\109\047\103\101\116\095\097\099\099\101\115\115\095\116\111\107\101\110\063\114\101\097\115\111\110\061\116\114\097\110\115\112\111\114\116\038\112\114\111\100\117\099\116\084\121\112\101\061\119\101\098\095\112\108\097\121\101\114",
{Cookie="\115\112\095\100\099\061"..dc}
)
if body and #body>0 then
local ok,data=pcall(function()
return HttpService:JSONDecode(body)
end)
if ok
and type(data)=="\116\097\098\108\101"
and type(data["\097\099\099\101\115\115\084\111\107\101\110"])=="\115\116\114\105\110\103"
and data.isAnonymous==false
then
SPX.token=data["\097\099\099\101\115\115\084\111\107\101\110"]
SPX.tokenExp=tonumber(data.accessTokenExpirationTimestampMs) or 0
SPX.isAnonymous=false
spDebug("\116\111\107\101\110","\116\111\107\101\110\032\100\101\032\085\083\085\065\082\073\079\032\111\107\032\040\101\120\112\105\114\097\032"..tostring(SPX.tokenExp).."\041")
return SPX.token
end
spDebug("\116\111\107\101\110\045\117\115\101\114","\099\111\111\107\105\101\032\115\112\095\100\099\032\105\110\118\097\108\105\100\097\032\111\032\097\110\111\110\105\109\097\058\032"
..tostring(string.sub(tostring(body),1,160)))
else
spDebug("\116\111\107\101\110\045\117\115\101\114","\103\101\116\095\097\099\099\101\115\115\095\116\111\107\101\110\032\115\105\110\032\114\101\115\112\117\101\115\116\097\032\040\099\111\111\107\105\101\041")
end
end
local body=rawRequest("\104\116\116\112\115\058\047\047\111\112\101\110\046\115\112\111\116\105\102\121\046\099\111\109\047\097\112\105\047\116\111\107\101\110",nil)
if not body or #body==0 then
spDebug("\116\111\107\101\110","\114\101\115\112\117\101\115\116\097\032\118\097\099\105\097\032\047\032\114\101\113\117\101\115\116\032\102\097\108\108\111")
return nil
end
local ok,data=pcall(function()
return HttpService:JSONDecode(body)
end)
if not ok or type(data)~="\116\097\098\108\101" then
spDebug("\116\111\107\101\110","\110\111\032\074\083\079\078\058\032"..tostring(string.sub(body,1,200)))
return nil
end
local tok=data["\097\099\099\101\115\115\084\111\107\101\110"]
if type(tok)~="\115\116\114\105\110\103" then
spDebug("\116\111\107\101\110","\097\099\099\101\115\115\084\111\107\101\110\032\110\111\032\115\116\114\105\110\103\058\032"..tostring(tok))
return nil
end
SPX.token=tok
SPX.isAnonymous=true
SPX.tokenExp=tonumber(data.accessTokenExpirationTimestampMs) or(os.time()*1000+1800000)
spDebug("\116\111\107\101\110","\116\111\107\101\110\032\065\078\079\078\073\077\079\032\111\107")
return tok
end
local function spApi(url)
local tok=spToken(false)
if not tok then
return nil,"\110\111\045\116\111\107\101\110"
end
local body=rawRequest(url,{Authorization="\066\101\097\114\101\114\032"..tok})
if not body or #body==0 then
return nil,"\101\109\112\116\121"
end
local ok,data=pcall(function()
return HttpService:JSONDecode(body)
end)
if not ok or type(data)~="\116\097\098\108\101" then
spDebug("\097\112\105","\110\111\032\074\083\079\078\058\032"..tostring(string.sub(tostring(body),1,200)))
return nil,"\098\097\100\045\106\115\111\110"
end
if data.error then
spDebug("\097\112\105","\115\112\111\116\105\102\121\032\101\114\114\111\114\058\032"..tostring(data.error.message))
return nil,"\115\112\111\116\105\102\121\058\032"..tostring(data.error.message)
end
return data,nil
end
local function trackOf(t)
if type(t)~="\116\097\098\108\101" then
return nil
end
local artist=""
if type(t.artists)=="\116\097\098\108\101" and t.artists[1] and t.artists[1].name then
artist=tostring(t.artists[1].name)
end
return {
title=tostring(t.name or "\063"),
artist=artist,
url=t.preview_url,
ms=tonumber(t.duration_ms) or 0,
}
end
local function spStop()
if SPX.sound then
pcall(function()
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
env.notify("\083\112\111\116\105\102\121",gmT("\069\115\097\032\099\097\110\099\105\111\110\032\110\111\032\116\105\101\110\101\032\112\114\101\118\105\101\119\032\100\105\115\112\111\110\105\098\108\101\046","\084\104\097\116\032\115\111\110\103\032\104\097\115\032\110\111\032\112\114\101\118\105\101\119\032\097\118\097\105\108\097\098\108\101\046"),4)
return
end
if SPX.sound then
pcall(function()
SPX.sound:Destroy()
end)
end
local s=IN("\083\111\117\110\100")
s.SoundId=track.url
s.Volume=(env.getVolume() or 50)/100
s.Parent=game:GetService("\083\111\117\110\100\083\101\114\118\105\099\101")
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
pcall(function()
s:Play()
end)
pushState()
end
Spotify=env.RegisterModule({
Name="\083\112\111\116\105\102\121",
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
return false,"\115\111\117\110\100\032\115\116\105\108\108\032\097\108\105\118\101"
end
return true
end,
})
SPX.search=function(query,cb)
task.spawn(function()
if type(query)~="\115\116\114\105\110\103" or #query==0 then
return
end
local data,err=spApi("\104\116\116\112\115\058\047\047\097\112\105\046\115\112\111\116\105\102\121\046\099\111\109\047\118\049\047\115\101\097\114\099\104\063\113\061"
..game:GetService("\072\116\116\112\083\101\114\118\105\099\101"):UrlEncode(query)
.."\038\116\121\112\101\061\116\114\097\099\107\038\108\105\109\105\116\061\056")
local out={}
if data and data.tracks and type(data.tracks.items)=="\116\097\098\108\101" then
for _,t in ipairs(data.tracks.items) do
local tr=trackOf(t)
if tr then
out[#out+1]=tr
end
end
end
SPX.results=out
pcall(function()
cb(err,out)
end)
end)
end
SPX.loadPlaylist=function(link,cb)
task.spawn(function()
local id=tostring(link or "")
local m=string.match(id,"\112\108\097\121\108\105\115\116\047\040\091\037\119\093\043\041")
if m then
id=m
end
if #id<10 then
pcall(function()
cb("\098\097\100\045\105\100",{})
end)
return
end
local data,err=spApi("\104\116\116\112\115\058\047\047\097\112\105\046\115\112\111\116\105\102\121\046\099\111\109\047\118\049\047\112\108\097\121\108\105\115\116\115\047"
..id.."\047\116\114\097\099\107\115\063\108\105\109\105\116\061\051\048")
local out={}
if data and type(data.items)=="\116\097\098\108\101" then
for _,it in ipairs(data.items) do
local tr=trackOf(it and it.track)
if tr then
out[#out+1]=tr
end
end
end
SPX.queue=out
SPX.queuePos=0
pcall(function()
cb(err,out)
end)
end)
end
SPX.login=function(dc,cb)
task.spawn(function()
if type(dc)~="\115\116\114\105\110\103" or #dc<20 then
pcall(function()
cb(false,gmT("\080\101\103\097\032\101\108\032\118\097\108\111\114\032\100\101\032\115\112\095\100\099\032\040\101\115\032\108\097\114\103\111\041\046","\080\097\115\116\101\032\116\104\101\032\115\112\095\100\099\032\118\097\108\117\101\032\040\105\116\039\115\032\108\111\110\103\041\046"))
end)
return
end
env.setDc(dc)
SPX.token=nil
local data,err=spApi("\104\116\116\112\115\058\047\047\097\112\105\046\115\112\111\116\105\102\121\046\099\111\109\047\118\049\047\109\101")
if data and data.id then
SPX.userName=tostring(data.display_name or data.id)
SPX.isAnonymous=false
env.setUserName(SPX.userName)
spDebug("\108\111\103\105\110","\079\075\032\099\111\109\111\032"..SPX.userName)
pcall(function()
cb(true,SPX.userName)
end)
else
env.setDc("")
SPX.token=nil
spDebug("\108\111\103\105\110","\102\097\108\108\111\058\032"..tostring(err))
pcall(function()
cb(false,gmT("\083\101\115\105\111\110\032\105\110\118\097\108\105\100\097\032\045\032\099\111\112\105\097\032\115\112\095\100\099\032\100\101\032\110\117\101\118\111","\073\110\118\097\108\105\100\032\115\101\115\115\105\111\110\032\045\032\099\111\112\121\032\115\112\095\100\099\032\097\103\097\105\110"))
end)
end
end)
end
SPX.logout=function(cb)
task.spawn(function()
env.setDc("")
env.setUserName("")
SPX.token=nil
SPX.userName=nil
SPX.isAnonymous=nil
pcall(function()
cb(true,gmT("\083\101\115\105\111\110\032\099\101\114\114\097\100\097\046","\076\111\103\103\101\100\032\111\117\116\046"))
end)
end)
end
SPX.recent=function(cb)
task.spawn(function()
local data,err=spApi("\104\116\116\112\115\058\047\047\097\112\105\046\115\112\111\116\105\102\121\046\099\111\109\047\118\049\047\109\101\047\112\108\097\121\101\114\047\114\101\099\101\110\116\108\121\045\112\108\097\121\101\100\063\108\105\109\105\116\061\049\048")
local out={}
if data and type(data.items)=="\116\097\098\108\101" then
for _,it in ipairs(data.items) do
local tr=trackOf(it and it.track)
if tr then
out[#out+1]=tr
end
end
end
SPX.results=out
pcall(function()
cb(err,out)
end)
end)
end
SPX.myPlaylists=function(cb)
task.spawn(function()
local data,err=spApi("\104\116\116\112\115\058\047\047\097\112\105\046\115\112\111\116\105\102\121\046\099\111\109\047\118\049\047\109\101\047\112\108\097\121\108\105\115\116\115\063\108\105\109\105\116\061\049\048")
local out={}
if data and type(data.items)=="\116\097\098\108\101" then
for _,it in ipairs(data.items) do
if type(it)=="\116\097\098\108\101" and it.id then
out[#out+1]={name=tostring(it.name or "\063"),id=tostring(it.id)}
end
end
end
pcall(function()
cb(err,out)
end)
end)
end
SPX.myTracks=function(cb)
task.spawn(function()
local data,err=spApi("\104\116\116\112\115\058\047\047\097\112\105\046\115\112\111\116\105\102\121\046\099\111\109\047\118\049\047\109\101\047\116\114\097\099\107\115\063\108\105\109\105\116\061\051\048")
local out={}
if data and type(data.items)=="\116\097\098\108\101" then
for _,it in ipairs(data.items) do
local tr=trackOf(it and it.track)
if tr then
out[#out+1]=tr
end
end
end
pcall(function()
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
pcall(function()
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
pcall(function()
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
local Workspace=game:GetService("\087\111\114\107\115\112\097\099\101")
local Players=game:GetService("\080\108\097\121\101\114\115")
local function humOf(model)
if not model then
return nil
end
return model:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
end
local function rigOf()
local lp=env.getLocalPlayer()
if not lp then
return nil
end
local rigs=Workspace:FindFirstChild("\082\105\103\115")
if not rigs then
return nil
end
return rigs:FindFirstChild(lp.Name)
end
local function snapshotOriginal()
if SKX.original then
return
end
local lp=env.getLocalPlayer()
local hum=humOf(lp and lp.Character)
if hum then
pcall(function()
SKX.original=hum:GetAppliedDescription()
end)
end
end
local function applyEverywhere(desc)
local applied={}
local lp=env.getLocalPlayer()
if not lp then
return applied
end
local hum=humOf(lp.Character)
if hum then
local ok=pcall(function()
hum:ApplyDescription(desc)
end)
if ok then
applied[#applied+1]="\099\104\097\114\097\099\116\101\114"
end
end
local rig=rigOf()
local rhum=humOf(rig)
if rhum then
local ok2=pcall(function()
rhum:ApplyDescription(desc)
end)
if ok2 then
applied[#applied+1]="\114\105\103"
end
end
return applied
end
SkinChanger=env.RegisterModule({
Name="\083\107\105\110\067\104\097\110\103\101\114",
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
task.spawn(function()
if type(username)~="\115\116\114\105\110\103" or #username==0 then
pcall(function()
cb(false,gmT("\069\115\099\114\105\098\101\032\117\110\032\117\115\101\114\110\097\109\101\032\112\114\105\109\101\114\111\046","\084\121\112\101\032\097\032\117\115\101\114\110\097\109\101\032\102\105\114\115\116\046"))
end)
return
end
snapshotOriginal()
local lp=env.getLocalPlayer()
local userId=nil
local okU,errU=pcall(function()
userId=Players:GetUserIdFromNameAsync(username)
end)
if not okU or not userId then
pcall(function()
cb(false,gmT("\078\111\032\101\120\105\115\116\101\032\110\105\110\103\117\110\032\117\115\117\097\114\105\111\032\034"..username.."\034","\078\111\032\082\111\098\108\111\120\032\117\115\101\114\032\110\097\109\101\100\032\034"..username.."\034"))
end)
return
end
local desc=nil
local okD=pcall(function()
desc=Players:GetHumanoidDescriptionFromUserId(userId)
end)
if not okD or not desc then
pcall(function()
cb(false,gmT("\078\111\032\115\101\032\112\117\100\111\032\099\097\114\103\097\114\032\101\108\032\097\118\097\116\097\114\046","\067\111\117\108\100\032\110\111\116\032\108\111\097\100\032\116\104\097\116\032\097\118\097\116\097\114\046"))
end)
return
end
local applied=applyEverywhere(desc)
SKX.appliedName=username
if SkinChanger.enabled==false then
SkinChanger.enabled=true
end
local where=table.concat(applied,"\032\043\032")
pcall(function()
cb(true,gmT("\083\107\105\110\032\100\101\032\064"..username.."\032\097\112\108\105\099\097\100\097","\083\107\105\110\032\102\114\111\109\032\064"..username.."\032\097\112\112\108\105\101\100")
..(#where>0 and("\032\040"..where.."\041") or ""))
end)
end)
end
SKX.restore=function(cb)
task.spawn(function()
if not SKX.original then
pcall(function()
cb(false,gmT("\078\111\032\104\097\098\105\097\032\115\107\105\110\032\099\097\109\098\105\097\100\097\046","\078\111\032\099\104\097\110\103\101\100\032\115\107\105\110\032\116\111\032\114\101\115\116\111\114\101\046"))
end)
return
end
applyEverywhere(SKX.original)
SKX.appliedName=nil
pcall(function()
cb(true,gmT("\084\117\032\097\118\097\116\097\114\032\111\114\105\103\105\110\097\108\032\101\115\116\097\032\100\101\032\118\117\101\108\116\097\046","\089\111\117\114\032\111\114\105\103\105\110\097\108\032\097\118\097\116\097\114\032\105\115\032\098\097\099\107\046"))
end)
end)
end
return SKX
end
local function body()
local UserInputService=game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101")
local TweenService=game:GetService("\084\119\101\101\110\083\101\114\118\105\099\101")
local Players=game:GetService("\080\108\097\121\101\114\115")
LocalPlayer=Players.LocalPlayer
local function executorName()
if type(identifyexecutor)=="\102\117\110\099\116\105\111\110" then
local ok,name=pcall(identifyexecutor)
if ok and type(name)=="\115\116\114\105\110\103" and #name>0 then
return name
end
end
return "\117\110\107\110\111\119\110"
end
local function resolveGuiParent()
local okHui,hui=pcall(function()
return(type(gethui)=="\102\117\110\099\116\105\111\110") and gethui() or nil
end)
if okHui and hui then
return hui
end
local okCore,core=pcall(function()
return game:GetService("\067\111\114\101\071\117\105")
end)
if okCore and core then
return core
end
return LocalPlayer:WaitForChild("\080\108\097\121\101\114\071\117\105")
end
GuiParent=resolveGuiParent()
markStep("\104\101\108\112\101\114\115\032\111\107")
local fadeSplash
do
local splashLighting=game:GetService("\076\105\103\104\116\105\110\103")
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
local tail=string.char(0x80)..string.rep("\000",((55 - len)%64))
tail=tail..string.rep("\000",4)..string.char(
math.floor(bitLen/0x1000000)%0x100,
math.floor(bitLen/0x10000)%0x100,
math.floor(bitLen/0x100)%0x100,
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
out[i]=string.format("\037\048\056\120",h[i])
end
return table.concat(out)
end
local zzV4="\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\109\105\110\119\111\107\107\048\047\107\101\121\115\071\077\047\109\097\105\110\047\107\101\121\115\046\106\115\111\110"
local zzV3={Minwo=true,Misshannixa=true}
local zzV2
zzV2=function()
if zzV3[LocalPlayer.Name] then
zzV1["\097\099\099\101\115\115\068\097\116\097"]={expires=os.time()+604800,user=LocalPlayer.Name,key="\111\119\110\101\114"}
zzV1["\097\099\099\101\115\115\084\111\107\101\110"]=zzV5(zzV1["\097\099\099\101\115\115\068\097\116\097"].expires,zzV1["\097\099\099\101\115\115\068\097\116\097"].user,zzV1["\097\099\099\101\115\115\068\097\116\097"].key)
return true,"\111\119\110\101\114"
end
local genv=(type(getgenv)=="\102\117\110\099\116\105\111\110") and getgenv() or _G
local supplied=genv["\071\077\095\075\069\089"]
if(type(supplied)~="\115\116\114\105\110\103" or #supplied==0) and isfile and readfile then
pcall(function()
if isfile("\071\077\095\107\101\121\046\116\120\116") then
supplied=readfile("\071\077\095\107\101\121\046\116\120\116")
end
end)
end
if type(supplied)~="\115\116\114\105\110\103" or #supplied==0 then
return false,"\110\111\032\107\101\121\032\105\110\103\114\101\115\097\100\097"
end
supplied=string.upper(string.gsub(supplied,"\037\115",""))
local body=nil
pcall(function()
body=game:HttpGet(zzV4.."\063\099\098\061"..tostring(math.floor(os.time()/30)))
end)
if type(body)~="\115\116\114\105\110\103" or #body==0 then
return false,"\110\111\032\115\101\032\112\117\100\111\032\100\101\115\099\097\114\103\097\114\032\107\101\121\115\046\106\115\111\110"
end
if #(string.gsub(body,"\037\115",""))==0 then
return false,"\107\101\121\115\046\106\115\111\110\032\118\097\099\105\111\032\045\032\117\115\097\032\101\108\032\103\101\110\101\114\097\100\111\114"
end
local ok,data=pcall(function()
return game:GetService("\072\116\116\112\083\101\114\118\105\099\101"):JSONDecode(body)
end)
if not ok or type(data)~="\116\097\098\108\101" then
return false,"\107\101\121\115\046\106\115\111\110\032\099\111\114\114\117\112\116\111"
end
local list=data.keys
if type(list)~="\116\097\098\108\101" then
list=data
end
local suppliedHash=zzV6(supplied)
for _,entry in ipairs(list) do
if type(entry)=="\116\097\098\108\101" and type(entry.hash)=="\115\116\114\105\110\103" then
local eh=string.lower(entry.hash)
if eh==suppliedHash then
if entry.active==false then
return false,"\107\101\121\032\100\101\115\097\099\116\105\118\097\100\097"
end
local exp=tonumber(entry.expires)
if not exp or exp<=0 then
return false,"\107\101\121\032\115\105\110\032\101\120\112\105\114\097\099\105\111\110"
end
if os.time()>exp then
return false,"\107\101\121\032\101\120\112\105\114\097\100\097"
end
local bound=entry.user
if type(bound)=="\115\116\114\105\110\103" and #bound>0 and bound~=LocalPlayer.Name then
return false,"\107\101\121\032\110\111\032\101\115\032\112\097\114\097\032\101\115\116\097\032\099\117\101\110\116\097"
end
zzV1["\097\099\099\101\115\115\068\097\116\097"]={expires=exp,user=bound,key=supplied}
zzV1["\097\099\099\101\115\115\084\111\107\101\110"]=zzV5(exp,bound,supplied)
return true,"\111\107"
end
end
end
return false,"\107\101\121\032\105\110\118\097\108\105\100\097"
end
local sp=IN("\083\099\114\101\101\110\071\117\105")
sp.Name="\071\077\095\083\112\108\097\115\104"
sp.ResetOnSpawn=false
sp.IgnoreGuiInset=true
sp.DisplayOrder=2147483646
sp.Parent=GuiParent
SplashRef=sp
local dim=IN("\070\114\097\109\101")
dim.Size=UDim2.fromScale(1,1)
dim.BackgroundColor3=CR(8,5,14)
dim.BackgroundTransparency=0.45
dim.BorderSizePixel=0
dim.Parent=sp
local blur=IN("\066\108\117\114\069\102\102\101\099\116")
blur.Name="\071\077\095\083\112\108\097\115\104\066\108\117\114"
blur.Size=0
blur.Parent=splashLighting
TweenService:Create(
blur,
TweenInfo.new(0.6,ES.Quad,ED.Out),
{Size=22}
):Play()
local box=IN("\070\114\097\109\101")
box.AnchorPoint=Vector2.new(0.5,0.5)
box.Position=U2(0.5,0,0.5,0)
box.Size=UDim2.fromOffset(470,0)
box.BackgroundColor3=CR(16,10,26)
box.BackgroundTransparency=0.22
box.BorderSizePixel=0
box.Parent=sp
local boxCorner=IN("\085\073\067\111\114\110\101\114")
boxCorner.CornerRadius=UD(0,24)
boxCorner.Parent=box
local boxGrad=IN("\085\073\071\114\097\100\105\101\110\116")
boxGrad.Rotation=115
boxGrad.Color=ColorSequence.new(CR(30,20,48),CR(12,8,20))
boxGrad.Parent=box
local boxStroke=IN("\085\073\083\116\114\111\107\101")
boxStroke.Color=CR(88,48,150)
boxStroke.Thickness=1.5
boxStroke.Transparency=0.35
boxStroke.Parent=box
TweenService:Create(
box,
TweenInfo.new(0.5,ES.Back,ED.Out),
{Size=UDim2.fromOffset(470,300)}
):Play()
local title=IN("\084\101\120\116\076\097\098\101\108")
title.BackgroundTransparency=1
title.AnchorPoint=Vector2.new(0.5,0)
title.Position=U2(0.5,0,0,24)
title.Size=UDim2.fromOffset(430,40)
title.Font=EF.GrenzeGotisch
title.Text="\071\072\079\083\084\032\077\069\084\072\079\068"
title.TextSize=34
title.TextColor3=CR(198,150,255)
title.TextTransparency=1
title.Parent=box
local titleStroke=IN("\085\073\083\116\114\111\107\101")
titleStroke.Color=CR(167,108,255)
titleStroke.Thickness=1
titleStroke.Transparency=1
titleStroke.Parent=title
local credit=IN("\084\101\120\116\076\097\098\101\108")
credit.BackgroundTransparency=1
credit.AnchorPoint=Vector2.new(0.5,0)
credit.Position=U2(0.5,0,0,66)
credit.Size=UDim2.fromOffset(300,18)
credit.Font=EF.GothamMedium
credit.Text="\098\121\032\077\105\110\119\111"
credit.TextSize=14
credit.TextColor3=CR(150,130,180)
credit.TextTransparency=1
credit.Parent=box
local statusDefs={"\067\097\114\103\097\110\100\111","\065\099\116\117\097\108\105\122\097\110\100\111","\067\111\109\112\114\111\098\097\110\100\111","\068\101\110\116\114\111"}
local statusLabels={}
for i,name in ipairs(statusDefs) do
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.AnchorPoint=Vector2.new(0.5,0)
lbl.Position=U2(0.5,0,0,104+(i - 1)*32)
lbl.Size=UDim2.fromOffset(340,24)
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
task.spawn(function()
TweenService:Create(title,TweenInfo.new(0.9,ES.Sine,ED.Out),{
TextTransparency=0.45,
}):Play()
TweenService:Create(titleStroke,TweenInfo.new(0.9,ES.Sine,ED.Out),{
Transparency=0.45,
}):Play()
task.wait(0.4)
TweenService:Create(credit,TweenInfo.new(0.5),{TextTransparency=0.35}):Play()
task.wait(0.25)
for i,name in ipairs(statusDefs) do
local lbl=statusLabels[i]
lbl.Text=name
TweenService:Create(lbl,TweenInfo.new(0.25),{TextTransparency=0}):Play()
for dots=1,3 do
task.wait(0.18)
lbl.Text=name..string.rep("\046",dots)
end
if name=="\067\111\109\112\114\111\098\097\110\100\111" then
local okK,whyK=zzV2()
if not okK then
lbl.Text=name.."\046\046\046\032\032\101\114\114\111\114\058\032"..tostring(whyK)
lbl.TextColor3=RED
splashFailed=true
splashDone=true
zzV1["\107\101\121\070\097\105\108\101\100"]=true
return
end
end
lbl.Text="\042\032\032"..name
lbl.TextColor3=GREEN
task.wait(0.12)
end
splashDone=true
if not splashFailed and zzV1["\102\105\110\097\108\065\112\112\108\121"] then
pcall(zzV1["\102\105\110\097\108\065\112\112\108\121"])
end
end)
fadeSplash=function()
if sp.Parent==nil then
return
end
task.spawn(function()
local waited=0
while not splashDone and waited<6 do
task.wait(0.05)
waited+=0.05
end
if splashFailed then
return
end
pcall(function()
local dur=0.5
TweenService:Create(blur,TweenInfo.new(dur),{Size=0}):Play()
TweenService:Create(dim,TweenInfo.new(dur),{BackgroundTransparency=1}):Play()
TweenService:Create(box,TweenInfo.new(dur),{BackgroundTransparency=1}):Play()
TweenService:Create(boxStroke,TweenInfo.new(dur),{Transparency=1}):Play()
for _,d in ipairs(box:GetDescendants()) do
if d:IsA("\084\101\120\116\076\097\098\101\108") then
TweenService:Create(d,TweenInfo.new(dur),{TextTransparency=1}):Play()
elseif d:IsA("\085\073\083\116\114\111\107\101") then
TweenService:Create(d,TweenInfo.new(dur),{Transparency=1}):Play()
end
end
end)
task.wait(0.6)
pcall(function()
blur:Destroy()
end)
pcall(function()
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
self.Name=name or "\115\099\111\112\101"
self.Connections={}
self.Instances={}
self.Cleanups={}
return self
end
function Scope:Connect(signal,fn)
local conn=signal:Connect(fn)
table.insert(self.Connections,conn)
return conn
end
function Scope:Track(instance)
table.insert(self.Instances,instance)
return instance
end
function Scope:AddCleanup(fn)
table.insert(self.Cleanups,fn)
return fn
end
function Scope:Count()
return #self.Connections+#self.Instances+#self.Cleanups
end
function Scope:IsClean()
for _,conn in ipairs(self.Connections) do
if typeof(conn)=="\082\066\088\083\099\114\105\112\116\067\111\110\110\101\099\116\105\111\110" and conn.Connected then
return false
end
end
return true
end
function Scope:Wipe()
for _,conn in ipairs(self.Connections) do
pcall(function()
if typeof(conn)=="\082\066\088\083\099\114\105\112\116\067\111\110\110\101\099\116\105\111\110" and conn.Connected then
conn:Disconnect()
end
end)
end
for _,inst in ipairs(self.Instances) do
pcall(function()
if inst and inst.Parent~=nil then
inst:Destroy()
end
end)
end
for _,fn in ipairs(self.Cleanups) do
pcall(fn)
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
if type(rawEnable)=="\102\117\110\099\116\105\111\110" then
def.enable=function(...)
if not zzV1["\097\099\099\101\115\115\079\107"]() then
return
end
return rawEnable(...)
end
end
table.insert(Modules,def)
return def
end
local Workspace=game:GetService("\087\111\114\107\115\112\097\099\101")
local RunService=game:GetService("\082\117\110\083\101\114\118\105\099\101")
local toastGui,toastList=nil,nil
local function toastEnsure()
if toastGui and toastGui.Parent then
return
end
toastGui=IN("\083\099\114\101\101\110\071\117\105")
toastGui.Name="\071\077\095\084\111\097\115\116\115"
toastGui.ResetOnSpawn=false
toastGui.IgnoreGuiInset=true
toastGui.DisplayOrder=1500
toastGui.Parent=GuiParent
zzV1.toasts=toastGui
toastList=IN("\070\114\097\109\101")
toastList.AnchorPoint=Vector2.new(1,0)
toastList.Position=U2(1,-14,0,14)
toastList.Size=UDim2.fromOffset(290,0)
toastList.BackgroundTransparency=1
toastList.Parent=toastGui
local tLayout=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
tLayout.Padding=UD(0,8)
tLayout.SortOrder=Enum.SortOrder.LayoutOrder
tLayout.Parent=toastList
end
local function notify(title,content,duration)
pcall(function()
toastEnsure()
local card=IN("\070\114\097\109\101")
card.Name="\084\111\097\115\116"
card.BackgroundColor3=CR(24,24,24)
card.BackgroundTransparency=0.5
card.BorderSizePixel=0
card.Size=UDim2.fromOffset(290,0)
card.AutomaticSize=Enum.AutomaticSize.Y
card.Parent=toastList
local cardCorner=IN("\085\073\067\111\114\110\101\114")
cardCorner.CornerRadius=UD(0,12)
cardCorner.Parent=card
local cardPad=IN("\085\073\080\097\100\100\105\110\103")
cardPad.PaddingLeft=UD(0,12)
cardPad.PaddingRight=UD(0,12)
cardPad.PaddingTop=UD(0,10)
cardPad.PaddingBottom=UD(0,12)
cardPad.Parent=card
local cardLay=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
cardLay.Padding=UD(0,2)
cardLay.SortOrder=Enum.SortOrder.LayoutOrder
cardLay.Parent=card
local ttl=IN("\084\101\120\116\076\097\098\101\108")
ttl.BackgroundTransparency=1
ttl.Size=U2(1,0,0,16)
ttl.Font=EF.GothamMedium
ttl.TextSize=14
ttl.TextXAlignment=TX.Left
ttl.TextColor3=CR(245,245,245)
ttl.TextTransparency=0.5
ttl.TextTruncate=Enum.TextTruncate.AtEnd
ttl.Text=title
ttl.Parent=card
local body=IN("\084\101\120\116\076\097\098\101\108")
body.BackgroundTransparency=1
body.Size=U2(1,0,0,0)
body.AutomaticSize=Enum.AutomaticSize.Y
body.Font=EF.Gotham
body.TextSize=12
body.TextXAlignment=TX.Left
body.TextYAlignment=Enum.TextYAlignment.Top
body.TextWrapped=true
body.TextColor3=CR(185,185,185)
body.TextTransparency=0.5
body.Text=content
body.Parent=card
local pop=IN("\085\073\083\099\097\108\101")
pop.Scale=0.92
pop.Parent=card
TweenService:Create(pop,TweenInfo.new(0.22,ES.Back,ED.Out),{Scale=1}):Play()
TweenService:Create(card,TweenInfo.new(0.22),{BackgroundTransparency=0.06}):Play()
TweenService:Create(ttl,TweenInfo.new(0.22),{TextTransparency=0}):Play()
TweenService:Create(body,TweenInfo.new(0.22),{TextTransparency=0}):Play()
task.delay(duration or 6,function()
if not card.Parent then
return
end
local dur=0.35
pcall(function()
TweenService:Create(card,TweenInfo.new(dur),{BackgroundTransparency=1}):Play()
TweenService:Create(pop,TweenInfo.new(dur),{Scale=0.94}):Play()
TweenService:Create(ttl,TweenInfo.new(dur),{TextTransparency=1}):Play()
TweenService:Create(body,TweenInfo.new(dur),{TextTransparency=1}):Play()
end)
task.delay(dur+0.05,function()
pcall(function()
card:Destroy()
end)
end)
end)
end)
end
zzV1.toast=notify
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
markStep("\107\101\121\115\116\114\111\107\101\115\032\100\101\102\105\110\101\100")
local MOVE={}
local Bhop
local BhopKeybindElement=nil
local function keyNameToEnum(value)
if typeof(value)=="\069\110\117\109\073\116\101\109" then
return value
end
local ok,enumItem=pcall(function()
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
if string.match(name,"\094\077\111\117\115\101\066\117\116\116\111\110\037\100\036") then
if gameProcessed then
return false
end
local ok,mouseType=pcall(function()
return Enum.UserInputType[name]
end)
return ok and input.UserInputType==mouseType or false
end
return input.KeyCode==keyNameToEnum(name)
end
local keyHeld=false
local function initialPush()
local char=LocalPlayer.Character
local hum=char and char:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
if hum
and Bhop.enabled
and hum.FloorMaterial~=Enum.Material.Air
and hum:GetState()~=Enum.HumanoidStateType.Jumping
then
hum:ChangeState(Enum.HumanoidStateType.Jumping)
end
end
Bhop=RegisterModule({
Name="\065\117\116\111\032\066\072\079\080",
enable=function()
if Bhop.enabled then
return
end
Bhop.enabled=true
keyHeld=false
local function hookCharacter(character)
local humanoid=character:WaitForChild("\072\117\109\097\110\111\105\100",10)
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
task.delay(delaySec,function()
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
task.spawn(hookCharacter,character)
end
Bhop.Scope:Connect(LocalPlayer.CharacterAdded,function(newCharacter)
task.spawn(hookCharacter,newCharacter)
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
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\110\111\116\032\115\101\116"
end
if Bhop.Scope:Count()<1 then
return false,"\110\111\032\099\104\097\114\097\099\116\101\114\047\114\101\115\112\097\119\110\032\099\111\110\110\101\099\116\105\111\110\115\032\098\111\117\110\100"
end
return true
end,
verifyClean=function()
if Bhop.enabled then
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\115\116\105\108\108\032\115\101\116\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if not Bhop.Scope:IsClean() then
return false,"\104\117\109\097\110\111\105\100\032\099\111\110\110\101\099\116\105\111\110\115\032\115\116\105\108\108\032\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
markStep("\098\104\111\112\032\100\101\102\105\110\101\100")
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
local ok,vim=pcall(function()
return game:GetService("\086\105\114\116\117\097\108\073\110\112\117\116\077\097\110\097\103\101\114")
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
return pcall(function()
VirtualInputManager:SendKeyEvent(down,keyCode,false,game)
end)
end
local A_KEY=Enum.KeyCode.A
local D_KEY=Enum.KeyCode.D
local Crunch
local crunchKeyHeld=false
local crunchHoldMs=50
local crunchGapMs=60
local CrunchKeybindElement={CurrentKeybind="\076\101\102\116\083\104\105\102\116"}
local function crunchInputMatches(input,gameProcessed)
local name=CrunchKeybindElement and CrunchKeybindElement.CurrentKeybind
if not name then
return false
end
if string.match(name,"\094\077\111\117\115\101\066\117\116\116\111\110\037\100\036") then
if gameProcessed then
return false
end
local ok,mouseType=pcall(function()
return Enum.UserInputType[name]
end)
return ok and input.UserInputType==mouseType or false
end
local ok2,enumItem=pcall(function()
return Enum.KeyCode[tostring(name)]
end)
return ok2 and input.KeyCode==enumItem or false
end
Crunch=RegisterModule({
Name="\067\114\117\110\099\104\032\115\112\097\109",
enable=function()
if Crunch.enabled then
return
end
if not ensureVIM() then
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\067\114\117\110\099\104\032\115\112\097\109\058\032\116\117\032\101\120\101\099\117\116\111\114\032\110\111\032\115\111\112\111\114\116\097\032\086\105\114\116\117\097\108\073\110\112\117\116\077\097\110\097\103\101\114\046","\067\114\117\110\099\104\032\115\112\097\109\058\032\121\111\117\114\032\101\120\101\099\117\116\111\114\032\100\111\101\115\032\110\111\116\032\115\117\112\112\111\114\116\032\086\105\114\116\117\097\108\073\110\112\117\116\077\097\110\097\103\101\114\046"),6)
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
task.spawn(function()
while Crunch.enabled do
if crunchKeyHeld or MOVE.crunchVirtual then
if not vimKey(true,Enum.KeyCode.LeftControl) then
break
end
task.wait(crunchHoldMs/1000)
if not vimKey(false,Enum.KeyCode.LeftControl) then
break
end
task.wait(crunchGapMs/1000)
else
task.wait(0.06)
end
end
vimKey(false,Enum.KeyCode.LeftControl)
end)
end,
disable=function()
if not Crunch.enabled then
return
end
Crunch.enabled=false
crunchKeyHeld=false
vimKey(false,Enum.KeyCode.LeftControl)
Crunch.Scope:Wipe()
end,
verify=function()
if not Crunch.enabled then
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\110\111\116\032\115\101\116"
end
if Crunch.Scope:Count()<1 then
return false,"\110\111\032\105\110\112\117\116\032\099\111\110\110\101\099\116\105\111\110\115\032\098\111\117\110\100"
end
return true
end,
verifyClean=function()
if Crunch.enabled then
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\115\116\105\108\108\032\115\101\116\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if not Crunch.Scope:IsClean() then
return false,"\099\111\110\110\101\099\116\105\111\110\115\032\115\116\105\108\108\032\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
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
Name="\065\117\116\111\032\083\116\114\097\102\102\101\114",
enable=function()
if Straffer.enabled then
return
end
if not ensureVIM() then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\065\117\116\111\032\083\116\114\097\102\102\101\114\058\032\116\117\032\101\120\101\099\117\116\111\114\032\110\111\032\115\111\112\111\114\116\097\032\086\105\114\116\117\097\108\073\110\112\117\116\077\097\110\097\103\101\114\046",6)
return
end
Straffer.enabled=true
strafeHeld=0
Straffer.Scope:Connect(UserInputService.InputChanged,function(input)
if input.UserInputType~=Enum.UserInputType.MouseMovement then
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
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\110\111\116\032\115\101\116"
end
if Straffer.Scope:Count()<1 then
return false,"\110\111\032\099\111\110\110\101\099\116\105\111\110\115\032\098\111\117\110\100"
end
return true
end,
verifyClean=function()
if Straffer.enabled then
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\115\116\105\108\108\032\115\101\116\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if not Straffer.Scope:IsClean() then
return false,"\099\111\110\110\101\099\116\105\111\110\115\032\115\116\105\108\108\032\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
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
local ok,rig=pcall(function()
local rigs=Workspace:FindFirstChild("\082\105\103\115")
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
local head=rig:FindFirstChild("\072\101\097\100")
if not head or not head:IsA("\066\097\115\101\080\097\114\116") then
return
end
hidePart(head,headSnaps)
for _,child in ipairs(head:GetChildren()) do
if child:IsA("\068\101\099\097\108") or child:IsA("\084\101\120\116\117\114\101") then
if not headSnaps[child] then
headSnaps[child]={Transparency=child.Transparency}
end
child.Transparency=1
end
end
end
local function restoreHeadless()
for node,snap in pairs(headSnaps) do
pcall(function()
node.Transparency=snap.Transparency
if snap.CastShadow~=nil then
node.CastShadow=snap.CastShadow
end
end)
end
headSnaps={}
end
local function applyClearAccs(rig)
local head=rig:FindFirstChild("\072\101\097\100")
if not head or not head:IsA("\066\097\115\101\080\097\114\116") then
return
end
for _,acc in ipairs(rig:GetChildren()) do
if acc:IsA("\065\099\099\101\115\115\111\114\121") then
local handle=acc:FindFirstChild("\072\097\110\100\108\101")
if handle and handle:IsA("\066\097\115\101\080\097\114\116") and not accSnaps[handle] then
local handleAtt=handle:FindFirstChildOfClass("\065\116\116\097\099\104\109\101\110\116")
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
pcall(function()
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
pcall(function()
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
pcall(function()
HeadlessReassertConn:Disconnect()
end)
HeadlessReassertConn=nil
end
end
Headless=RegisterModule({
Name="\072\101\097\100\108\101\115\115",
enable=function(opts)
local wantHead=true
local wantAccs=true
if type(opts)=="\116\097\098\108\101" and not opts.hidden then
wantHead=opts.head==true
wantAccs=opts.accs==true
end
local rig=getRig()
if rig then
if wantHead then
pcall(applyHeadless,rig)
end
if wantAccs then
pcall(applyClearAccs,rig)
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
if type(opts)=="\116\097\098\108\101" and not opts.hidden then
wantHead=opts.head==true
wantAccs=opts.accs==true
end
if wantHead then
headActive=false
pcall(restoreHeadless)
end
if wantAccs then
accsActive=false
pcall(restoreAccs)
end
Headless.enabled=headActive or accsActive
if not Headless.enabled then
stopHeadlessReassert()
end
end,
verify=function()
if headActive or accsActive then
if not HeadlessReassertConn then
return false,"\114\101\045\097\115\115\101\114\116\032\108\111\111\112\032\110\111\116\032\114\117\110\110\105\110\103\032\119\104\105\108\101\032\097\099\116\105\118\101"
end
end
if headActive and next(headSnaps)==nil then
local rig=getRig()
if rig and rig:FindFirstChild("\072\101\097\100") then
return false,"\104\101\097\100\032\115\110\097\112\115\104\111\116\032\109\105\115\115\105\110\103\032\119\104\105\108\101\032\104\101\097\100\108\101\115\115\032\097\099\116\105\118\101"
end
end
return true
end,
verifyClean=function()
if headActive or accsActive then
return false,"\102\101\097\116\117\114\101\032\102\108\097\103\115\032\115\116\105\108\108\032\097\099\116\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if next(headSnaps)~=nil or next(accSnaps)~=nil then
return false,"\115\110\097\112\115\104\111\116\115\032\110\111\116\032\114\101\115\116\111\114\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if HeadlessReassertConn then
return false,"\114\101\045\097\115\115\101\114\116\032\108\111\111\112\032\115\116\105\108\108\032\099\111\110\110\101\099\116\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
markStep("\104\101\097\100\108\101\115\115\032\100\101\102\105\110\101\100")
local Korblox
local KORBLOX_LEG_CHOICE="\082\105\103\104\116"
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
pcall(function()
if inst and inst.Parent~=nil then
inst:Destroy()
end
end)
end
leftCreated={}
end
local function applyRightLeg(rig)
local rightLeg=rig:FindFirstChild("\082\105\103\104\116\032\076\101\103")
if not rightLeg or not rightLeg:IsA("\066\097\115\101\080\097\114\116") then
return
end
for _,child in ipairs(rig:GetChildren()) do
if child:IsA("\067\104\097\114\097\099\116\101\114\077\101\115\104") and child.BodyPart==Enum.BodyPart.RightLeg then
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
local mesh=IN("\067\104\097\114\097\099\116\101\114\077\101\115\104")
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
pcall(function()
if rightMeshInstance.Parent~=nil then
rightMeshInstance:Destroy()
end
end)
end
rightMeshInstance=nil
rightMeshApplied=false
if rightMeshSnap then
if rig then
pcall(function()
local original=IN("\067\104\097\114\097\099\116\101\114\077\101\115\104")
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
local leftLeg=rig:FindFirstChild("\076\101\102\116\032\076\101\103")
if not leftLeg or not leftLeg:IsA("\066\097\115\101\080\097\114\116") then
return
end
if leftPartSnap==nil then
leftPartSnap=leftLeg.Transparency
end
leftLeg.Transparency=1
local okLoaded,loaded=pcall(function()
return game:GetObjects("\114\098\120\097\115\115\101\116\105\100\058\047\047\049\051\057\054\048\055\054\055\051")
end)
if not okLoaded or type(loaded)~="\116\097\098\108\101" or #loaded==0 then
warn("\091\071\077\093\032\075\111\114\098\108\111\120\058\032\099\111\117\108\100\032\110\111\116\032\108\111\097\100\032\114\098\120\097\115\115\101\116\105\100\058\047\047\049\051\057\054\048\055\054\055\051")
return
end
local upper,lower
for _,obj in ipairs(loaded) do
local pool={}
if obj:IsA("\077\101\115\104\080\097\114\116") then
table.insert(pool,obj)
end
for _,desc in ipairs(obj:GetDescendants()) do
if desc:IsA("\077\101\115\104\080\097\114\116") then
table.insert(pool,desc)
end
end
for _,node in ipairs(pool) do
if node.Name=="\076\101\102\116\085\112\112\101\114\076\101\103" and not upper then
upper=node:Clone()
elseif node.Name=="\076\101\102\116\076\111\119\101\114\076\101\103" and not lower then
lower=node:Clone()
end
end
end
if not upper or not lower then
warn("\091\071\077\093\032\075\111\114\098\108\111\120\058\032\076\101\102\116\085\112\112\101\114\076\101\103\047\076\101\102\116\076\111\119\101\114\076\101\103\032\077\101\115\104\080\097\114\116\115\032\110\111\116\032\102\111\117\110\100\032\105\110\032\049\051\057\054\048\055\054\055\051")
return
end
upper.Name="\071\077\095\075\111\114\098\108\111\120\076\101\102\116\085\112\112\101\114\076\101\103"
lower.Name="\071\077\095\075\111\114\098\108\111\120\076\101\102\116\076\111\119\101\114\076\101\103"
pcall(function()
upper.Anchored=false
upper.CanCollide=false
upper.Massless=true
lower.Anchored=false
lower.CanCollide=false
lower.Massless=true
end)
table.insert(leftCreated,upper)
table.insert(leftCreated,lower)
local upperKnee=upper:FindFirstChild("\076\101\102\116\075\110\101\101\082\105\103\065\116\116\097\099\104\109\101\110\116")
local lowerKnee=lower:FindFirstChild("\076\101\102\116\075\110\101\101\082\105\103\065\116\116\097\099\104\109\101\110\116")
local kneeWeld=IN("\087\101\108\100")
kneeWeld.Name="\071\077\095\075\111\114\098\108\111\120\075\110\101\101\087\101\108\100"
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
table.insert(leftCreated,kneeWeld)
local hipWeld=IN("\087\101\108\100")
hipWeld.Name="\071\077\095\075\111\114\098\108\111\120\072\105\112\087\101\108\100"
hipWeld.Part0=leftLeg
hipWeld.Part1=upper
local hipAtt=upper:FindFirstChild("\076\101\102\116\072\105\112\082\105\103\065\116\116\097\099\104\109\101\110\116")
if hipAtt then
hipWeld.C0=CFrame.new(0,0.8,0)*hipAtt.CFrame:Inverse()
else
hipWeld.C0=CFrame.new(0,0.8,0)
end
hipWeld.C1=CFrame.new()
hipWeld.Parent=upper
table.insert(leftCreated,hipWeld)
upper.Parent=rig
lower.Parent=rig
leftApplied=true
end
local function restoreLeftLeg(rig)
destroyLeftCreated()
leftApplied=false
if leftPartSnap~=nil then
local leftLeg=rig and rig:FindFirstChild("\076\101\102\116\032\076\101\103")
if leftLeg then
pcall(function()
leftLeg.Transparency=leftPartSnap
end)
end
leftPartSnap=nil
end
end
local function applyKorblox(rig)
if KORBLOX_LEG_CHOICE=="\082\105\103\104\116" or KORBLOX_LEG_CHOICE=="\066\111\116\104" then
pcall(applyRightLeg,rig)
end
if KORBLOX_LEG_CHOICE=="\076\101\102\116" or KORBLOX_LEG_CHOICE=="\066\111\116\104" then
pcall(applyLeftLeg,rig)
end
end
local function restoreKorblox(rig)
pcall(function()
restoreRightLeg(rig)
end)
pcall(function()
restoreLeftLeg(rig)
end)
end
local function setKorbloxChoice(choice)
if choice~="\076\101\102\116" and choice~="\082\105\103\104\116" and choice~="\066\111\116\104" then
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
if type(option)=="\116\097\098\108\101" then
label=option[1]
end
label=tostring(label or "")
if string.find(label,"\066\111\116\104",1,true) then
return "\066\111\116\104"
end
if string.find(label,"\076\101\102\116",1,true) then
return "\076\101\102\116"
end
if string.find(label,"\082\105\103\104\116",1,true) then
return "\082\105\103\104\116"
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
if not rightMeshApplied and(KORBLOX_LEG_CHOICE=="\082\105\103\104\116" or KORBLOX_LEG_CHOICE=="\066\111\116\104") then
pcall(applyRightLeg,rig)
end
if not leftApplied and(KORBLOX_LEG_CHOICE=="\076\101\102\116" or KORBLOX_LEG_CHOICE=="\066\111\116\104") then
pcall(applyLeftLeg,rig)
end
end)
end
local function stopKorbloxReassert()
if KorbloxReassertConn then
pcall(function()
KorbloxReassertConn:Disconnect()
end)
KorbloxReassertConn=nil
end
end
Korblox=RegisterModule({
Name="\075\111\114\098\108\111\120",
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
return false,"\101\110\097\098\108\101\100\047\097\112\112\108\105\101\100\032\102\108\097\103\032\110\111\116\032\115\101\116"
end
if not KorbloxReassertConn then
return false,"\114\101\045\097\115\115\101\114\116\032\108\111\111\112\032\110\111\116\032\114\117\110\110\105\110\103"
end
return true
end,
verifyClean=function()
if korbloxApplied or Korblox.enabled then
return false,"\101\110\097\098\108\101\100\047\097\112\112\108\105\101\100\032\102\108\097\103\032\115\116\105\108\108\032\115\101\116\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if KorbloxReassertConn then
return false,"\114\101\045\097\115\115\101\114\116\032\108\111\111\112\032\115\116\105\108\108\032\099\111\110\110\101\099\116\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if next(leftCreated)~=nil then
return false,"\099\114\101\097\116\101\100\032\108\101\103\032\105\110\115\116\097\110\099\101\115\032\115\116\105\108\108\032\116\114\097\099\107\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if rightMeshInstance~=nil then
return false,"\111\117\114\032\067\104\097\114\097\099\116\101\114\077\101\115\104\032\115\116\105\108\108\032\116\114\097\099\107\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
markStep("\107\111\114\098\108\111\120\032\100\101\102\105\110\101\100")
local ReplicatedStorage=game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")
local Catalog={emotes={},emoteByName={},unusuals={},unusualByName={}}
local gmSaveConfig
local previewing=false
local previewTrack=nil
local function phase3ExtractId(uri)
if type(uri)~="\115\116\114\105\110\103" then
return nil
end
local id=string.match(uri,"\037\100\043")
return id and tonumber(id) or nil
end
local function resolveEmoteAnim(folder)
local anims=folder:FindFirstChild("\065\110\105\109\097\116\105\111\110\115")
if anims then
local r6=anims:FindFirstChild("\082\054")
if r6 then
local a=r6:FindFirstChild("\065\110\105\109\097\116\105\111\110")
if a and a:IsA("\065\110\105\109\097\116\105\111\110") and a.AnimationId~="" then
return a
end
end
local r15=anims:FindFirstChild("\082\049\053")
if r15 then
local a=r15:FindFirstChild("\065\110\105\109\097\116\105\111\110")
if a and a:IsA("\065\110\105\109\097\116\105\111\110") and a.AnimationId~="" then
return a
end
end
end
for _,n in ipairs({
"\065\110\105\109\097\116\105\111\110\067\108\097\115\115\105\099",
"\065\110\105\109\097\116\105\111\110\082\054",
"\065\110\105\109\097\116\105\111\110",
"\065\110\105\109\097\116\105\111\110\076\069\071\065\067\089",
"\065\110\105\109\097\116\105\111\110\067\108\097\115\115\105\099\095\087\097\108\107\097\098\108\101",
"\065\110\105\109\097\116\105\111\110\095\087\097\108\107\097\098\108\101",
}) do
local a=folder:FindFirstChild(n)
if a and a:IsA("\065\110\105\109\097\116\105\111\110") and a.AnimationId~="" then
return a
end
end
for _,c in ipairs(folder:GetChildren()) do
if c:IsA("\065\110\105\109\097\116\105\111\110") and c.AnimationId~="" then
return c
end
end
local best,bestScore=nil,-999
for _,d in ipairs(folder:GetDescendants()) do
if d:IsA("\065\110\105\109\097\116\105\111\110") and d.AnimationId~="" then
local path=string.lower(d:GetFullName())
local score=0
if string.find(path,"\097\110\105\109\097\116\105\111\110\099\108\097\115\115\105\099",1,true) or string.find(path,"\046\114\054\046",1,true) then
score=score+10
end
if d.Name=="\065\110\105\109\097\116\105\111\110" then
score=score+5
end
if string.find(path,"\105\110\116\114\111",1,true) then
score=score - 100
end
if string.find(path,"\119\097\108\107\097\098\108\101",1,true) then
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
local items=ReplicatedStorage:FindFirstChild("\073\116\101\109\115")
if not items then
return
end
local all=items:GetDescendants()
for _,d in ipairs(all) do
if d.Name=="\069\109\111\116\101\115" or d.Name=="\069\109\111\116\101" then
for _,f in ipairs(d:GetChildren()) do
local anim=resolveEmoteAnim(f)
local id=anim and phase3ExtractId(anim.AnimationId)
if id and not Catalog.emoteByName[f.Name] then
local e={name=f.Name,id=id,template=f}
table.insert(Catalog.emotes,e)
Catalog.emoteByName[e.name]=e
end
end
elseif d.Name:lower():find("\117\110\117\115\117\097\108") and #d:GetChildren()>0 then
for _,tpl in ipairs(d:GetChildren()) do
if not Catalog.unusualByName[tpl.Name] then
local cc=tpl:FindFirstChild("\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099")
or tpl:FindFirstChild("\067\104\097\114\097\099\116\101\114")
or tpl:FindFirstChild("\067\104\097\114\097\099\116\101\114\079\076\068")
if cc then
local u={name=tpl.Name,template=tpl}
table.insert(Catalog.unusuals,u)
Catalog.unusualByName[u.name]=u
end
end
end
end
end
for _,d in ipairs(all) do
if d.Name=="\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099" or d.Name=="\067\104\097\114\097\099\116\101\114" or d.Name=="\067\104\097\114\097\099\116\101\114\079\076\068" then
local tpl=d.Parent
if tpl and not Catalog.unusualByName[tpl.Name] then
for _,fx in ipairs(d:GetDescendants()) do
if fx:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or fx:IsA("\066\101\097\109") or fx:IsA("\084\114\097\105\108") then
local u={name=tpl.Name,template=tpl}
table.insert(Catalog.unusuals,u)
Catalog.unusualByName[u.name]=u
break
end
end
end
end
end
print("\091\071\077\093\032\099\097\116\097\108\111\103\115\058\032"..#Catalog.emotes.."\032\101\109\111\116\101\115\044\032"..#Catalog.unusuals.."\032\117\110\117\115\117\097\108\115")
end
buildPhase3Catalogs()
task.delay(25,function()
pcall(buildPhase3Catalogs)
end)
task.delay(70,function()
pcall(buildPhase3Catalogs)
end)
markStep("\112\104\097\115\101\032\051\032\099\097\116\097\108\111\103\115")
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
if node.Parent.Name=="\069\109\111\116\101\115" then
return node
end
node=node.Parent
end
return nil
end
local function swapFolderTo(folder,newId)
local n=0
for _,d in ipairs(folder:GetDescendants()) do
if d:IsA("\065\110\105\109\097\116\105\111\110") and d.AnimationId~="" and swaps[d]==nil then
swaps[d]=d.AnimationId
d.AnimationId="\114\098\120\097\115\115\101\116\105\100\058\047\047"..newId
n=n+1
end
end
return n
end
local function unswapFolder(folder)
for _,d in ipairs(folder:GetDescendants()) do
if d:IsA("\065\110\105\109\097\116\105\111\110") and swaps[d]~=nil then
pcall(function()
d.AnimationId=swaps[d]
end)
swaps[d]=nil
end
end
end
local function restoreAllSwaps()
for inst,oldId in pairs(swaps) do
pcall(function()
inst.AnimationId=oldId
end)
end
swaps={}
end
local function destroyProp()
for _,inst in ipairs(propInsts) do
pcall(function()
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
local classic=toEntry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099")
or toEntry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114")
if not classic then
for _,d in ipairs(toEntry.template:GetDescendants()) do
if d.Name=="\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099" then
classic=d
break
end
end
if not classic then
for _,d in ipairs(toEntry.template:GetDescendants()) do
if d.Name=="\067\104\097\114\097\099\116\101\114" then
classic=d
break
end
end
end
end
if not classic then
print("\091\071\077\093\032\101\108\101\109\101\110\116\058\032\039"..toEntry.name.."\039\032\104\097\115\032\110\111\032\067\104\097\114\097\099\116\101\114\047\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099\032\109\111\100\101\108")
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\069\108\101\109\101\110\116\032\039"..toEntry.name.."\039\058\032\110\111\032\099\104\097\114\097\099\116\101\114\032\109\111\100\101\108\032\105\110\032\116\101\109\112\108\097\116\101",6)
return
end
local em=classic:FindFirstChild("\069\109\111\116\101\077\111\100\101\108")
if not em then
for _,c in ipairs(classic:GetChildren()) do
if c:IsA("\077\111\100\101\108") then
em=c
print("\091\071\077\093\032\101\108\101\109\101\110\116\058\032\117\115\105\110\103\032\109\111\100\101\108\032\039"..c.Name.."\039\032\040\110\111\032\069\109\111\116\101\077\111\100\101\108\032\105\110\032\116\101\109\112\108\097\116\101\041")
break
end
end
end
if not em then
print("\091\071\077\093\032\101\108\101\109\101\110\116\058\032\039"..toEntry.name.."\039\032\104\097\115\032\110\111\032\112\114\111\112\032\109\111\100\101\108")
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\069\108\101\109\101\110\116\032\039"..toEntry.name.."\039\058\032\110\111\032\112\114\111\112\032\109\111\100\101\108\032\105\110\032\116\101\109\112\108\097\116\101",6)
return
end
local part0Names={}
for _,d in ipairs(em:GetDescendants()) do
if(d:IsA("\077\111\116\111\114\054\068") or d:IsA("\087\101\108\100")) and d.Part0 then
part0Names[d.Name]=d.Part0.Name
end
end
local clone=em:Clone()
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("\066\097\115\101\080\097\114\116") then
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
if(d:IsA("\077\111\116\111\114\054\068") or d:IsA("\087\101\108\100")) and d.Part0 and d.Part0.Parent==classic then
if d.Part0.Name=="\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116" then
if puppetPrimary then
d.Part0=puppetPrimary
joined=joined+1
else
d:Destroy()
end
else
local host=rig:FindFirstChild(d.Part0.Name)
if host and host:IsA("\066\097\115\101\080\097\114\116") then
d.Part0=host
joined=joined+1
else
d:Destroy()
end
end
end
end
if joined==0 then
print("\091\071\077\093\032\101\108\101\109\101\110\116\058\032\110\111\032\077\111\116\111\114\054\068\032\106\111\105\110\116\115\032\102\111\117\110\100\032\105\110\032\112\114\111\112\032\045\032\102\097\108\108\098\097\099\107\032\040\112\105\118\111\116\032\043\032\116\111\114\115\111\032\119\101\108\100\041")
pcall(function()
clone:PivotTo(rig:GetPivot())
end)
local biggest=nil
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("\066\097\115\101\080\097\114\116") and(not biggest or d.Size.Magnitude>biggest.Size.Magnitude) then
biggest=d
end
end
local torso=rig:FindFirstChild("\084\111\114\115\111")
if biggest and torso then
local wc=IN("\087\101\108\100\067\111\110\115\116\114\097\105\110\116")
wc.Part0=torso
wc.Part1=biggest
wc.Parent=biggest
end
end
local anims={}
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("\065\110\105\109\097\116\105\111\110") and d.AnimationId~="" then
table.insert(anims,d)
end
end
if #anims>0 then
local ac=clone:FindFirstChildOfClass("\065\110\105\109\097\116\105\111\110\067\111\110\116\114\111\108\108\101\114")
if not ac then
ac=IN("\065\110\105\109\097\116\105\111\110\067\111\110\116\114\111\108\108\101\114")
ac.Parent=clone
end
for _,a in ipairs(anims) do
pcall(function()
local t=ac:LoadAnimation(a)
t.Looped=true
t:Play()
end)
end
end
clone.Parent=rig
table.insert(propInsts,clone)
propOwner=toEntry.name
print("\091\071\077\093\032\101\108\101\109\101\110\116\032\039"..toEntry.name.."\039\032\097\116\116\097\099\104\101\100\032\040"..joined.."\032\106\111\105\110\116\115\041")
local fxCount=0
for _,part in ipairs(classic:GetChildren()) do
if part:IsA("\066\097\115\101\080\097\114\116") then
local targetPart=rig:FindFirstChild(part.Name)
if targetPart then
for _,child in ipairs(part:GetChildren()) do
if child~=em and(child:IsA("\065\116\116\097\099\104\109\101\110\116") or child:IsA("\077\111\100\101\108") or child:IsA("\066\097\115\101\080\097\114\116")) then
local hasEffect=false
for _,fx in ipairs(child:GetDescendants()) do
if fx:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or fx:IsA("\066\101\097\109") or fx:IsA("\084\114\097\105\108") then
hasEffect=true
break
end
end
if hasEffect then
local fxClone=child:Clone()
fxClone.Parent=targetPart
if fxClone:IsA("\066\097\115\101\080\097\114\116") then
fxClone.CanCollide=false
fxClone.Massless=true
local w=IN("\087\101\108\100\067\111\110\115\116\114\097\105\110\116")
w.Part0=targetPart
w.Part1=fxClone
w.Parent=fxClone
end
table.insert(propInsts,fxClone)
fxCount=fxCount+1
end
end
end
end
end
end
if fxCount>0 then
print("\091\071\077\093\032\101\108\101\109\101\110\116\032\101\102\102\101\099\116\115\058\032"..fxCount.."\032\097\110\099\104\111\114\115\032\099\108\111\110\101\100")
end
pcall(function()
local lines={os.date("\037\072\058\037\077\058\037\083").."\032\112\114\111\112\032\039"..toEntry.name.."\039\032\100\105\097\103\110\111\115\116\105\099\115\058"}
table.insert(lines,"\032\032\101\109\032\061\032"..em:GetFullName())
for name,host in pairs(part0Names) do
table.insert(lines,"\032\032\112\097\114\116\048\078\097\109\101\115\091\039"..name.."\039\093\032\061\032"..tostring(host))
end
for _,d in ipairs(em:GetDescendants()) do
if d:IsA("\077\111\116\111\114\054\068") or d:IsA("\087\101\108\100") then
table.insert(lines,string.format("\032\032\084\080\076\032\032\106\111\105\110\116\032\039\037\115\039\032\091\037\115\093\032\080\097\114\116\048\061\037\115\032\080\097\114\116\049\061\037\115",
d.Name,d.ClassName,
d.Part0 and d.Part0.Name or "\110\105\108",
d.Part1 and d.Part1.Name or "\110\105\108"))
end
end
for _,d in ipairs(clone:GetDescendants()) do
if d:IsA("\077\111\116\111\114\054\068") or d:IsA("\087\101\108\100") then
table.insert(lines,string.format("\032\032\067\076\079\078\069\032\106\111\105\110\116\032\039\037\115\039\032\091\037\115\093\032\080\097\114\116\048\061\037\115\032\080\097\114\116\049\061\037\115",
d.Name,d.ClassName,
d.Part0 and d.Part0.Name or "\110\105\108",
d.Part1 and d.Part1.Name or "\110\105\108"))
end
end
table.insert(lines,"\032\032\106\111\105\110\101\100\061"..joined)
writefile("\071\077\095\112\114\111\112\095\106\111\105\110\116\115\046\116\120\116",table.concat(lines,"\010"))
end)
end
local emoteSwapToken=0
local function hideModelTree(model)
for _,d in ipairs(model:GetDescendants()) do
if d:IsA("\066\097\115\101\080\097\114\116") then
d.Transparency=1
d.CastShadow=false
elseif d:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or d:IsA("\066\101\097\109") or d:IsA("\084\114\097\105\108") then
d.Enabled=false
elseif d:IsA("\068\101\099\097\108") or d:IsA("\084\101\120\116\117\114\101") then
d.Transparency=1
elseif d:IsA("\083\111\117\110\100") then
d:Stop()
end
end
end
local function sourcePropName(m)
local c=m.from.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099")
or m.from.template:FindFirstChild("\067\104\097\114\097\099\116\101\114")
if not c then
for _,d in ipairs(m.from.template:GetDescendants()) do
if d.Name=="\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099" or d.Name=="\067\104\097\114\097\099\116\101\114" then
c=d
break
end
end
end
if not c then
return nil
end
local em=c:FindFirstChild("\069\109\111\116\101\077\111\100\101\108")
if not em then
for _,ch in ipairs(c:GetChildren()) do
if ch:IsA("\077\111\100\101\108") then
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
task.delay(3,function()
if conn then
pcall(function()
conn:Disconnect()
end)
end
end)
end
local function swapSourceSound(m)
local targetSound=nil
local targetLooped=nil
pcall(function()
local cfg=require(m.to.template)
local info=cfg and cfg.EmoteInfo
if info then
local s=info.Sound
if type(s)=="\110\117\109\098\101\114" then
targetSound=s
elseif type(s)=="\116\097\098\108\101" and #s>0 then
targetSound=s[math.random(1,#s)]
end
local len=info.Length
targetLooped=not(type(len)=="\110\117\109\098\101\114" and len>0)
end
end)
local dbg={}
local fixedSet={}
local fixedCount=0
local function collectSoundPos()
local res={}
local function addFrom(holder,label)
pcall(function()
if holder and holder.PrimaryPart then
local sp=holder.PrimaryPart:FindFirstChild("\083\111\117\110\100\080\111\115")
if sp then
res[#res+1]=sp
dbg[#dbg+1]="\115\111\117\110\100\080\111\115\032"..label.."\058\032"..sp:GetFullName()
end
end
end)
end
addFrom(LocalPlayer.Character,"\112\117\112\112\101\116")
addFrom(getRig(),"\114\105\103")
return res
end
local function fixSound(snd)
pcall(function()
if targetSound then
snd:Stop()
snd.SoundId="\114\098\120\097\115\115\101\116\105\100\058\047\047"..tostring(targetSound)
if targetLooped~=nil then
snd.Looped=targetLooped
end
snd:Play()
dbg[#dbg+1]="\070\073\088\069\068\032\045\062\032\105\100\032"..tostring(targetSound)
else
snd.Volume=0
dbg[#dbg+1]="\077\085\084\069\068\032\040\116\097\114\103\101\116\032\115\105\110\032\109\117\115\105\099\097\041"
end
end)
end
local function tryFixAll()
for _,sp in ipairs(collectSoundPos()) do
local snd=sp:FindFirstChild("\069\109\111\116\101\083\111\117\110\100")
if snd and snd:IsA("\083\111\117\110\100") and not fixedSet[snd] then
fixedSet[snd]=true
local desired="\114\098\120\097\115\115\101\116\105\100\058\047\047"..tostring(targetSound)
if(targetSound and snd.SoundId==desired)
or(targetSound==nil and snd.Volume==0) then
dbg[#dbg+1]="\083\075\073\080\032\040\121\097\032\099\111\114\114\101\099\116\111\041"
else
fixedCount=fixedCount+1
fixSound(snd)
end
end
end
end
dbg[#dbg+1]=os.date("\037\072\058\037\077\058\037\083").."\032\115\119\097\112\083\111\117\114\099\101\083\111\117\110\100\032\039"..m.to.name
.."\039\032\116\097\114\103\101\116\083\111\117\110\100\061"..tostring(targetSound)
.."\032\116\097\114\103\101\116\076\111\111\112\101\100\061"..tostring(targetLooped)
tryFixAll()
local myToken=emoteSwapToken
local t0=tick()
while tick() - t0<3 and emoteSwapToken==myToken do
tryFixAll()
task.wait(0.1)
end
dbg[#dbg+1]="\102\105\120\101\100\032\105\110\115\116\097\110\099\101\115\058\032"..fixedCount
..(emoteSwapToken~=myToken and "\032\040\099\097\110\099\101\108\097\100\111\032\112\111\114\032\117\110\032\101\109\111\116\101\032\109\097\115\032\110\117\101\118\111\041" or "")
pcall(function()
writefile("\071\077\095\115\111\117\110\100\095\108\111\103\046\116\120\116",table.concat(dbg,"\010"))
end)
end
local function anyEmoteTrackPlaying()
local rig=getRig()
local hum=rig and rig:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
local an=hum and hum:FindFirstChildOfClass("\065\110\105\109\097\116\111\114")
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
local hum=rig:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
local animator=hum and hum:FindFirstChildOfClass("\065\110\105\109\097\116\111\114")
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
local ok,err=pcall(ensurePropFor,m.to)
pcall(function()
writefile("\071\077\095\112\114\111\112\095\108\111\103\046\116\120\116",os.date("\037\072\058\037\077\058\037\083")
.."\032\112\114\111\112\032\099\097\108\108\032\102\111\114\032\039"..m.to.name.."\039\032\111\107\061"..tostring(ok)
..(ok and "" or("\032\101\114\114\061"..tostring(err)))
.."\032\124\032\112\114\111\112\073\110\115\116\115\061"..#propInsts
.."\032\124\032\112\114\111\112\079\119\110\101\114\061"..tostring(propOwner))
end)
if not ok then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\069\108\101\109\101\110\116\032\101\114\114\111\114\032\040"..m.to.name.."\041\058\032"..tostring(err),8)
end
pcall(hideSourceProps,m)
pcall(swapSourceSound,m)
end
end)
end
local function p3SetMapping(fromE,toE)
if not fromE or not toE or fromE.name==toE.name then
return false
end
local existing=mappingBySource[fromE.name]
if existing then
pcall(function()
unswapFolder(fromE.template)
end)
existing.to=toE
else
local m={from=fromE,to=toE}
table.insert(activeMappings,m)
mappingBySource[fromE.name]=m
end
if EmoteReplacer.enabled then
pcall(function()
swapFolderTo(fromE.template,toE.id)
end)
end
if gmSaveConfig then
gmSaveConfig()
end
print("\091\071\077\093\032\109\097\112\112\105\110\103\058\032"..fromE.name.."\032\045\062\032"..toE.name)
return true
end
local function p3RemoveMapping(fromName)
local m=mappingBySource[fromName]
if not m then
return false
end
pcall(function()
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
print("\091\071\077\093\032\109\097\112\112\105\110\103\032\114\101\109\111\118\101\100\058\032"..fromName)
return true
end
local function p3RemoveAllMappings()
local names={}
for name in pairs(mappingBySource) do
table.insert(names,name)
end
for _,name in ipairs(names) do
p3RemoveMapping(name)
end
end
EmoteReplacer=RegisterModule({
Name="\069\109\111\116\101\032\082\101\112\108\097\099\101\114",
enable=function()
if EmoteReplacer.enabled then
return
end
EmoteReplacer.enabled=true
for _,m in ipairs(activeMappings) do
pcall(function()
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
return false,"\109\097\112\112\105\110\103\115\032\101\120\105\115\116\032\098\117\116\032\109\111\100\117\108\101\032\100\105\115\097\098\108\101\100"
end
if next(swaps)==nil then
return false,"\109\097\112\112\105\110\103\115\032\101\120\105\115\116\032\098\117\116\032\110\111\032\116\101\109\112\108\097\116\101\032\115\119\097\112\115\032\097\112\112\108\105\101\100"
end
return true
end,
verifyClean=function()
if next(swaps)~=nil then
return false,"\116\101\109\112\108\097\116\101\032\115\119\097\112\115\032\110\111\116\032\114\101\115\116\111\114\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if #propInsts>0 then
return false,"\101\108\101\109\101\110\116\032\105\110\115\116\097\110\099\101\115\032\115\116\105\108\108\032\097\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if emoteHookConn then
return false,"\101\109\111\116\101\032\104\111\111\107\032\115\116\105\108\108\032\099\111\110\110\101\099\116\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
local Unusuals
local appliedUnusual={}
local activeUnusual=nil
local function removeUnusualNow()
for _,inst in ipairs(appliedUnusual) do
pcall(function()
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
local cc=u.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099")
or u.template:FindFirstChild("\067\104\097\114\097\099\116\101\114")
or u.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\079\076\068")
if not cc then
return false
end
local n=0
for _,part in ipairs(cc:GetChildren()) do
if part:IsA("\066\097\115\101\080\097\114\116") then
local targetPart=rig:FindFirstChild(part.Name)
if targetPart then
for _,child in ipairs(part:GetChildren()) do
if child:IsA("\065\116\116\097\099\104\109\101\110\116") or child:IsA("\077\111\100\101\108") or child:IsA("\066\097\115\101\080\097\114\116") then
local clone=child:Clone()
clone.Parent=targetPart
if clone:IsA("\066\097\115\101\080\097\114\116") then
clone.CanCollide=false
clone.Massless=true
local w=IN("\087\101\108\100\067\111\110\115\116\114\097\105\110\116")
w.Part0=targetPart
w.Part1=clone
w.Parent=clone
end
table.insert(appliedUnusual,clone)
n=n+1
end
end
end
end
end
activeUnusual=name
print("\091\071\077\093\032\117\110\117\115\117\097\108\032\039"..name.."\039\032\097\112\112\108\105\101\100\058\032"..n.."\032\097\110\099\104\111\114\115")
if gmSaveConfig and n>0 then
gmSaveConfig()
end
return n>0
end
Unusuals=RegisterModule({
Name="\085\110\117\115\117\097\108\115",
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
return false,"\117\110\117\115\117\097\108\032\115\101\108\101\099\116\101\100\032\098\117\116\032\109\111\100\117\108\101\032\100\105\115\097\098\108\101\100"
end
return true
end,
verifyClean=function()
if #appliedUnusual>0 then
return false,"\117\110\117\115\117\097\108\032\105\110\115\116\097\110\099\101\115\032\115\116\105\108\108\032\097\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
markStep("\112\104\097\115\101\032\051\032\100\101\102\105\110\101\100")
local function p3DestroyGui(name)
local old=GuiParent:FindFirstChild(name)
if old then
pcall(function()
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
local gui=IN("\083\099\114\101\101\110\071\117\105")
gui.Name=guiName
gui.ResetOnSpawn=false
gui.DisplayOrder=600
gui.Parent=GuiParent
local panel=IN("\070\114\097\109\101")
panel.Name="\080\097\110\101\108"
panel.AnchorPoint=Vector2.new(0.5,0.5)
panel.Position=U2(0.5,0,0.5,0)
panel.Size=UDim2.fromOffset(width,height)
panel.BackgroundColor3=Palette.Panel
panel.BackgroundTransparency=0.06
panel.BorderSizePixel=0
panel.Parent=gui
local corner=IN("\085\073\067\111\114\110\101\114")
corner.CornerRadius=UD(0,18)
corner.Parent=panel
local grad=IN("\085\073\071\114\097\100\105\101\110\116")
grad.Rotation=115
grad.Color=ColorSequence.new(CR(30,20,48),CR(12,8,20))
grad.Parent=panel
local stroke=IN("\085\073\083\116\114\111\107\101")
stroke.Color=Palette.PanelStroke
stroke.Thickness=1.5
stroke.Transparency=0.15
stroke.Parent=panel
local header=IN("\084\101\120\116\076\097\098\101\108")
header.BackgroundTransparency=1
header.Size=U2(1,-100,0,44)
header.Position=U2(0,22,0,8)
header.Font=EF.GothamBold
header.Text=title
header.TextSize=22
header.TextXAlignment=TX.Left
header.TextColor3=Palette.AccentBright
header.Parent=panel
local divider=IN("\070\114\097\109\101")
divider.Size=U2(1,-44,0,1)
divider.Position=U2(0,22,0,54)
divider.BackgroundColor3=Palette.PanelStroke
divider.BackgroundTransparency=0.55
divider.BorderSizePixel=0
divider.Parent=panel
local closeBtn=IN("\084\101\120\116\066\117\116\116\111\110")
closeBtn.Size=UDim2.fromOffset(P3_CLOSE_D,P3_CLOSE_D)
closeBtn.Position=U2(1,-(P3_CLOSE_D+10),0,TOUCH and 8 or 12)
closeBtn.BackgroundColor3=Palette.AccentDeep
closeBtn.BackgroundTransparency=0.25
closeBtn.Font=EF.GothamBold
closeBtn.Text="\088"
closeBtn.TextSize=TOUCH and 16 or 14
closeBtn.TextColor3=Palette.TextBright
local cCorner=IN("\085\073\067\111\114\110\101\114")
cCorner.CornerRadius=UD(1,0)
cCorner.Parent=closeBtn
closeBtn.Parent=panel
closeBtn.Activated:Connect(function()
gui:Destroy()
end)
local uiScale=IN("\085\073\083\099\097\108\101")
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
fitConn=cam:GetPropertyChangedSignal("\086\105\101\119\112\111\114\116\083\105\122\101"):Connect(fit)
end
gui.Destroying:Connect(function()
if fitConn then
fitConn:Disconnect()
end
end)
return {gui=gui,panel=panel}
end
local function p3MakeSearch(parent,posX,posY,width)
local box=IN("\084\101\120\116\066\111\120")
box.Size=UDim2.fromOffset(width,P3_SEARCH_H)
box.Position=UDim2.fromOffset(posX,posY)
box.BackgroundColor3=Palette.AccentDeep
box.BackgroundTransparency=0.75
box.Font=EF.Gotham
box.PlaceholderText="\083\101\097\114\099\104\046\046\046"
box.Text=""
box.TextSize=TOUCH and 14 or 13
box.TextColor3=Palette.TextBright
box.ClearTextOnFocus=false
local corner=IN("\085\073\067\111\114\110\101\114")
corner.CornerRadius=UD(0,10)
corner.Parent=box
local stroke=IN("\085\073\083\116\114\111\107\101")
stroke.Color=Palette.PanelStroke
stroke.Transparency=0.5
stroke.Parent=box
box.Parent=parent
return box
end
local function p3MakeList(parent,posX,posY,width,height,columns)
local holder=IN("\070\114\097\109\101")
holder.Size=UDim2.fromOffset(width,height)
holder.Position=UDim2.fromOffset(posX,posY)
holder.BackgroundColor3=Palette.Chip
holder.BackgroundTransparency=0.35
holder.BorderSizePixel=0
local corner=IN("\085\073\067\111\114\110\101\114")
corner.CornerRadius=UD(0,12)
corner.Parent=holder
local stroke=IN("\085\073\083\116\114\111\107\101")
stroke.Color=Palette.PanelStroke
stroke.Transparency=0.55
stroke.Parent=holder
holder.Parent=parent
local scroll=IN("\083\099\114\111\108\108\105\110\103\070\114\097\109\101")
scroll.Size=U2(1,-12,1,-12)
scroll.Position=UDim2.fromOffset(6,6)
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.ScrollBarThickness=TOUCH and 6 or 4
scroll.ScrollBarImageColor3=Palette.Accent
scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
scroll.CanvasSize=U2()
scroll.Parent=holder
if columns==2 then
local grid=IN("\085\073\071\114\105\100\076\097\121\111\117\116")
grid.CellSize=U2(0.5,-5,0,P3_ROW_H)
grid.CellPadding=U2(0,10,0,8)
grid.SortOrder=Enum.SortOrder.LayoutOrder
grid.Parent=scroll
else
local list=IN("\085\073\076\105\115\116\076\097\121\111\117\116")
list.Padding=UD(0,6)
list.SortOrder=Enum.SortOrder.LayoutOrder
list.Parent=scroll
end
return scroll
end
local function p3AddRow(scroll,text,onClick,dimmed)
local btn=IN("\084\101\120\116\066\117\116\116\111\110")
btn.Size=U2(1,-6,0,P3_ROW_H)
btn.BackgroundColor3=Palette.Chip
btn.BackgroundTransparency=dimmed and 0.7 or 0.2
btn.Font=EF.Gotham
btn.Text=text
btn.TextSize=TOUCH and 14 or 13
btn.TextXAlignment=TX.Left
btn.TextTruncate=Enum.TextTruncate.AtEnd
btn.TextColor3=dimed and Palette.TextDim or Palette.TextBright
btn.AutoButtonColor=not dimmed
local pad=IN("\085\073\080\097\100\100\105\110\103")
pad.PaddingLeft=UD(0,10)
pad.Parent=btn
local corner=IN("\085\073\067\111\114\110\101\114")
corner.CornerRadius=UD(0,9)
corner.Parent=btn
local stroke=IN("\085\073\083\116\114\111\107\101")
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
pcall(function()
local stroke=row:FindFirstChildOfClass("\085\073\083\116\114\111\107\101")
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
if c:IsA("\084\101\120\116\066\117\116\116\111\110") then
c:Destroy()
end
end
end
local function p3MakeLabel(parent,posX,posY,width,text)
local lbl=IN("\084\101\120\116\076\097\098\101\108")
lbl.BackgroundTransparency=1
lbl.Size=UDim2.fromOffset(width,18)
lbl.Position=UDim2.fromOffset(posX,posY)
lbl.Font=EF.GothamBold
lbl.TextSize=TOUCH and 14 or 12
lbl.TextXAlignment=TX.Left
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
pcall(function()
inst:Destroy()
end)
end
pvPropInsts={}
end
local function p4StopPreview()
if previewTrack then
pcall(function()
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
pcall(function()
pvRigClone:Destroy()
end)
pvRigClone=nil
end
pvBox=IN("\070\114\097\109\101")
pvBox.Name="\080\114\101\118\105\101\119\066\111\120"
pvBox.AnchorPoint=Vector2.new(0.5,0.5)
pvBox.Position=U2(0.5,0,0.5,-14)
pvBox.Size=UDim2.fromOffset(252,336)
pvBox.BackgroundColor3=Palette.Panel
pvBox.BackgroundTransparency=0.06
pvBox.BorderSizePixel=0
pvBox.ZIndex=50
pvBox.Visible=false
local pvCorner=IN("\085\073\067\111\114\110\101\114")
pvCorner.CornerRadius=UD(0,16)
pvCorner.Parent=pvBox
local pvGrad=IN("\085\073\071\114\097\100\105\101\110\116")
pvGrad.Rotation=115
pvGrad.Color=ColorSequence.new(CR(30,20,48),CR(12,8,20))
pvGrad.Parent=pvBox
local pvStroke=IN("\085\073\083\116\114\111\107\101")
pvStroke.Color=Palette.PanelStroke
pvStroke.Thickness=1.5
pvStroke.Transparency=0.15
pvStroke.Parent=pvBox
pvBox.Parent=previewPickerGui
local pvTitle=IN("\084\101\120\116\076\097\098\101\108")
pvTitle.BackgroundTransparency=1
pvTitle.Position=UDim2.fromOffset(16,10)
pvTitle.Size=U2(1,-60,0,20)
pvTitle.Font=EF.GothamMedium
pvTitle.TextSize=15
pvTitle.TextXAlignment=TX.Left
pvTitle.TextColor3=Palette.AccentBright
pvTitle.Text="\080\114\101\118\105\101\119"
pvTitle.ZIndex=51
pvTitle.Parent=pvBox
pvNameLabel=IN("\084\101\120\116\076\097\098\101\108")
pvNameLabel.BackgroundTransparency=1
pvNameLabel.Position=UDim2.fromOffset(16,30)
pvNameLabel.Size=U2(1,-60,0,14)
pvNameLabel.Font=EF.GothamMedium
pvNameLabel.TextSize=11
pvNameLabel.TextXAlignment=TX.Left
pvNameLabel.TextTruncate=Enum.TextTruncate.AtEnd
pvNameLabel.TextColor3=Palette.TextDim
pvNameLabel.Text=""
pvNameLabel.ZIndex=51
pvNameLabel.Parent=pvBox
local pvClose=IN("\084\101\120\116\066\117\116\116\111\110")
pvClose.AnchorPoint=Vector2.new(1,0)
pvClose.Position=U2(1,-8,0,8)
pvClose.Size=UDim2.fromOffset(22,22)
pvClose.BackgroundColor3=Palette.AccentDeep
pvClose.BackgroundTransparency=0.25
pvClose.Font=EF.GothamBold
pvClose.Text="\088"
pvClose.TextSize=12
pvClose.TextColor3=Palette.TextBright
pvClose.ZIndex=51
local pvcCorner=IN("\085\073\067\111\114\110\101\114")
pvcCorner.CornerRadius=UD(1,0)
pvcCorner.Parent=pvClose
pvClose.Parent=pvBox
pvClose.Activated:Connect(function()
p4StopPreview()
end)
pvViewport=IN("\086\105\101\119\112\111\114\116\070\114\097\109\101")
pvViewport.Name="\086\105\101\119\112\111\114\116"
pvViewport.Position=UDim2.fromOffset(16,50)
pvViewport.Size=U2(1,-32,1,-96)
pvViewport.BackgroundColor3=CR(10,7,16)
pvViewport.BackgroundTransparency=0.12
pvViewport.BorderSizePixel=0
pvViewport.Ambient=CR(120,100,160)
pvViewport.LightColor=CR(255,240,220)
pvViewport.LightDirection=Vector3.new(-1,-1,-1)
pvViewport.ZIndex=51
local vpvCorner=IN("\085\073\067\111\114\110\101\114")
vpvCorner.CornerRadius=UD(0,12)
vpvCorner.Parent=pvViewport
pvViewport.Parent=pvBox
pvIconImg=IN("\073\109\097\103\101\076\097\098\101\108")
pvIconImg.Name="\073\099\111\110"
pvIconImg.Position=UDim2.fromOffset(16,50)
pvIconImg.Size=U2(1,-32,1,-96)
pvIconImg.BackgroundColor3=CR(10,7,16)
pvIconImg.BackgroundTransparency=0.12
pvIconImg.BorderSizePixel=0
pvIconImg.ScaleType=Enum.ScaleType.Fit
pvIconImg.Image=""
pvIconImg.Visible=false
pvIconImg.ZIndex=52
local pvImgCorner=IN("\085\073\067\111\114\110\101\114")
pvImgCorner.CornerRadius=UD(0,12)
pvImgCorner.Parent=pvIconImg
pvIconImg.Parent=pvBox
pvWorld=IN("\087\111\114\108\100\077\111\100\101\108")
pvWorld.Name="\087\111\114\108\100"
pvWorld.Parent=pvViewport
pvCam=IN("\067\097\109\101\114\097")
pvCam.FieldOfView=30
pvCam.Parent=pvWorld
pvViewport.CurrentCamera=pvCam
local pvHint=IN("\084\101\120\116\076\097\098\101\108")
pvHint.BackgroundTransparency=1
pvHint.AnchorPoint=Vector2.new(0.5,1)
pvHint.Position=U2(0.5,0,1,-8)
pvHint.Size=U2(1,-20,0,12)
pvHint.Font=EF.Gotham
pvHint.TextSize=9
pvHint.TextColor3=Palette.TextDim
pvHint.TextTransparency=0.35
pvHint.Text="\085\115\097\032\080\114\101\118\032\101\110\032\111\116\114\111\032\105\116\101\109\032\112\097\114\097\032\099\097\109\098\105\097\114\032\097\108\032\105\110\115\116\097\110\116\101"
pvHint.ZIndex=51
pvHint.Parent=pvBox
return true
end
local function pvRootOf(model)
local hrp=model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
if hrp and hrp:IsA("\066\097\115\101\080\097\114\116") then
return hrp
end
local hum=model:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
if hum then
local rp=hum.RootPart
if rp then
return rp
end
end
local torso=model:FindFirstChild("\084\111\114\115\111")
if torso and torso:IsA("\066\097\115\101\080\097\114\116") then
return torso
end
local biggest=nil
for _,d in ipairs(model:GetDescendants()) do
if d:IsA("\066\097\115\101\080\097\114\116") and(not biggest or d.Size.Magnitude>biggest.Size.Magnitude) then
biggest=d
end
end
return biggest
end
local function pvEnsureRig()
if pvRigClone and pvRigClone.Parent then
return pvRigClone
end
local template=ReplicatedStorage:FindFirstChild("\065\115\115\101\116\115")
and ReplicatedStorage.Assets:FindFirstChild("\073\116\101\109\115")
and ReplicatedStorage.Assets.Items:FindFirstChild("\086\105\115\117\097\108\082\105\103\067\108\097\115\115\105\099")
if not template or not template:IsA("\077\111\100\101\108") then
return nil
end
local clone=template:Clone()
clone.Name="\071\077\095\080\114\101\118\105\101\119\082\105\103"
clone:PivotTo(CFrame.new(0,3,0))
local root=pvRootOf(clone)
if root then
root.Anchored=true
end
local rig=getRig()
if rig then
for _,src in ipairs(rig:GetChildren()) do
if src:IsA("\066\097\115\101\080\097\114\116") then
local dst=clone:FindFirstChild(src.Name)
if dst and dst:IsA("\066\097\115\101\080\097\114\116") then
dst.Color=src.Color
end
end
end
local srcHead=rig:FindFirstChild("\072\101\097\100")
local dstHead=clone:FindFirstChild("\072\101\097\100")
if srcHead and srcHead:IsA("\066\097\115\101\080\097\114\116") and dstHead and dstHead:IsA("\066\097\115\101\080\097\114\116") then
if srcHead.Transparency>0.5 then
dstHead.Transparency=1
local face=dstHead:FindFirstChild("\102\097\099\101")
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
local classic=entry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099")
or entry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114")
if not classic then
for _,d in ipairs(entry.template:GetDescendants()) do
if d.Name=="\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099" or d.Name=="\067\104\097\114\097\099\116\101\114" then
classic=d
break
end
end
end
if not classic or not pvRigClone then
return
end
local em=classic:FindFirstChild("\069\109\111\116\101\077\111\100\101\108")
if not em then
for _,ch in ipairs(classic:GetChildren()) do
if ch:IsA("\077\111\100\101\108") then
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
if d:IsA("\066\097\115\101\080\097\114\116") then
d.Anchored=false
d.CanCollide=false
d.CanTouch=false
d.CanQuery=false
d.Massless=true
end
end
for _,d in ipairs(clone:GetChildren()) do
if(d:IsA("\077\111\116\111\114\054\068") or d:IsA("\087\101\108\100")) and d.Part0 and d.Part0.Parent==classic then
if d.Part0.Name=="\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116" then
local root=pvRootOf(pvRigClone)
if root then
d.Part0=root
else
d:Destroy()
end
else
local host=pvRigClone:FindFirstChild(d.Part0.Name)
if host and host:IsA("\066\097\115\101\080\097\114\116") then
d.Part0=host
else
d:Destroy()
end
end
end
end
clone.Parent=pvRigClone
table.insert(pvPropInsts,clone)
for _,part in ipairs(classic:GetChildren()) do
if part:IsA("\066\097\115\101\080\097\114\116") then
local targetPart=pvRigClone:FindFirstChild(part.Name)
if targetPart then
for _,child in ipairs(part:GetChildren()) do
if child~=em and(child:IsA("\065\116\116\097\099\104\109\101\110\116") or child:IsA("\077\111\100\101\108") or child:IsA("\066\097\115\101\080\097\114\116")) then
local hasEffect=false
for _,fx in ipairs(child:GetDescendants()) do
if fx:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or fx:IsA("\066\101\097\109") or fx:IsA("\084\114\097\105\108") then
hasEffect=true
break
end
end
if hasEffect then
local fxClone=child:Clone()
fxClone.Parent=targetPart
if fxClone:IsA("\066\097\115\101\080\097\114\116") then
fxClone.CanCollide=false
fxClone.Massless=true
local w=IN("\087\101\108\100\067\111\110\115\116\114\097\105\110\116")
w.Part0=targetPart
w.Part1=fxClone
w.Parent=fxClone
end
table.insert(pvPropInsts,fxClone)
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
pcall(function()
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
pvBox.Size=UDim2.fromOffset(252,306)
if pvIconImg then
pvIconImg.Position=UDim2.fromOffset(16,50)
pvIconImg.Size=UDim2.fromOffset(218,218)
pvIconImg.Visible=true
end
else
if pvIconImg then
pvIconImg.Visible=false
end
pvViewport.Visible=true
pvBox.Size=UDim2.fromOffset(252,336)
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
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\080\114\101\118\105\101\119\058\032\097\098\114\101\032\101\108\032\112\105\099\107\101\114\032\112\114\105\109\101\114\111\046",5)
return false
end
local clone=pvEnsureRig()
if not clone then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\080\114\101\118\105\101\119\058\032\086\105\115\117\097\108\082\105\103\067\108\097\115\115\105\099\032\110\111\032\101\110\099\111\110\116\114\097\100\111\046",5)
return false
end
local hum=clone:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
or clone:FindFirstChildOfClass("\065\110\105\109\097\116\105\111\110\067\111\110\116\114\111\108\108\101\114")
if not hum then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\080\114\101\118\105\101\119\032\102\097\105\108\101\100\032\040\114\105\103\032\115\105\110\032\097\110\105\109\097\116\111\114\041\046",5)
return false
end
if previewTrack then
pcall(function()
previewTrack:Stop(0)
end)
previewTrack=nil
end
pvDestroyProp()
local anim=IN("\065\110\105\109\097\116\105\111\110")
anim.Name="\071\077\095\080\114\101\118\105\101\119"
anim.AnimationId="\114\098\120\097\115\115\101\116\105\100\058\047\047"..entry.id
local ok,track=pcall(function()
return hum:LoadAnimation(anim)
end)
if not ok or not track then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\080\114\101\118\105\101\119\032\102\097\105\108\101\100\032\116\111\032\108\111\097\100\032\116\104\101\032\097\110\105\109\097\116\105\111\110\046",5)
return false
end
previewing=true
previewTrack=track
track.Priority=Enum.AnimationPriority.Action
pcall(function()
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
task.delay(delay,function()
if pvFitToken==myFit and pvBox and pvBox.Visible then
pvFitCamera()
end
end)
end
pvNameLabel.Text=entry.name
pvBox.Visible=true
pcall(function()
local lines={"\071\077\032\112\114\101\118\105\101\119\032\100\101\098\117\103\032\064\032"..os.date("\037\089\045\037\109\045\037\100\032\037\072\058\037\077\058\037\083")}
lines[#lines+1]="\101\110\116\114\121\058\032"..tostring(entry.name).."\032\105\100\061"..tostring(entry.id)
lines[#lines+1]="\114\105\103\032\102\117\101\110\116\101\058\032"..tostring(getRig() and getRig():GetFullName() or "\078\073\076")
lines[#lines+1]="\099\108\111\110\101\058\032"..tostring(pvRigClone and pvRigClone:GetFullName() or "\078\073\076")
if pvRigClone then
local parts=0
local visibleParts=0
for _,d in ipairs(pvRigClone:GetDescendants()) do
if d:IsA("\066\097\115\101\080\097\114\116") then
parts=parts+1
if d.Transparency<1 then
visibleParts=visibleParts+1
end
end
end
lines[#lines+1]="\099\108\111\110\101\032\112\097\114\116\115\058\032"..parts.."\032\040\118\105\115\105\098\108\101\115\058\032"..visibleParts.."\041"
local croot=pvRootOf(pvRigClone)
lines[#lines+1]="\099\108\111\110\101\032\114\111\111\116\058\032"..tostring(croot and croot.Name or "\078\073\076")
.."\032\112\111\115\061"..tostring(croot and croot.Position or "\110\105\108")
.."\032\097\110\099\104\111\114\101\100\061"..tostring(croot and croot.Anchored or "\110\105\108")
lines[#lines+1]="\099\108\111\110\101\032\112\105\118\111\116\058\032"..tostring(pvRigClone:GetPivot().Position)
local hum=pvRigClone:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
lines[#lines+1]="\099\108\111\110\101\032\104\117\109\097\110\111\105\100\058\032"..tostring(hum and hum:GetFullName() or "\078\073\076")
.."\032\104\101\097\108\116\104\061"..tostring(hum and hum.Health or "\110\105\108")
end
lines[#lines+1]="\119\111\114\108\100\058\032"..tostring(pvWorld and pvWorld:GetFullName() or "\078\073\076")
.."\032\104\105\106\111\115\061"..tostring(pvWorld and #pvWorld:GetChildren() or 0)
lines[#lines+1]="\118\105\101\119\112\111\114\116\058\032"..tostring(pvViewport and pvViewport:GetFullName() or "\078\073\076")
.."\032\099\097\109\061"..tostring(pvViewport and pvViewport.CurrentCamera~=nil)
lines[#lines+1]="\099\097\109\101\114\097\032\112\111\115\058\032"..tostring(pvCam and pvCam.CFrame.Position or "\078\073\076")
.."\032\102\111\118\061"..tostring(pvCam and pvCam.FieldOfView or "\063")
lines[#lines+1]="\098\111\120\032\118\105\115\105\098\108\101\058\032"..tostring(pvBox and pvBox.Visible)
lines[#lines+1]="\112\114\111\112\032\105\110\115\116\115\058\032"..#pvPropInsts
writefile("\071\077\095\112\114\101\118\105\101\119\095\100\101\098\117\103\046\116\120\116",table.concat(lines,"\010"))
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
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\080\114\101\118\105\101\119\058\032\097\098\114\101\032\101\108\032\112\105\099\107\101\114\032\112\114\105\109\101\114\111\046",5)
return false
end
local clone=pvEnsureRig()
if not clone then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\080\114\101\118\105\101\119\058\032\086\105\115\117\097\108\082\105\103\067\108\097\115\115\105\099\032\110\111\032\101\110\099\111\110\116\114\097\100\111\046",5)
return false
end
if previewTrack then
pcall(function()
previewTrack:Stop(0)
end)
previewTrack=nil
end
pvDestroyProp()
local cc=entry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\067\108\097\115\115\105\099")
or entry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114")
or entry.template:FindFirstChild("\067\104\097\114\097\099\116\101\114\079\076\068")
local n=0
local nAttach,nMesh,nEmitter=0,0,0
if cc then
for _,part in ipairs(cc:GetChildren()) do
if part:IsA("\066\097\115\101\080\097\114\116") then
local targetPart=clone:FindFirstChild(part.Name)
if targetPart and targetPart:IsA("\066\097\115\101\080\097\114\116") then
for _,child in ipairs(part:GetChildren()) do
if child:IsA("\065\116\116\097\099\104\109\101\110\116") or child:IsA("\077\111\100\101\108") or child:IsA("\066\097\115\101\080\097\114\116") then
local fxClone=child:Clone()
fxClone.Parent=targetPart
if fxClone:IsA("\066\097\115\101\080\097\114\116") then
fxClone.CanCollide=false
fxClone.Massless=true
local tplWeld=nil
for _,sib in ipairs(part:GetChildren()) do
if sib:IsA("\087\101\108\100") and sib.Part1==child then
tplWeld=sib
break
end
end
if tplWeld then
pcall(function()
fxClone.CFrame=targetPart.CFrame*tplWeld.C0*tplWeld.C1:Inverse()
end)
nMesh=nMesh+1
end
local w=IN("\087\101\108\100\067\111\110\115\116\114\097\105\110\116")
w.Part0=targetPart
w.Part1=fxClone
w.Parent=fxClone
elseif fxClone:IsA("\065\116\116\097\099\104\109\101\110\116") then
nAttach=nAttach+1
for _,d in ipairs(fxClone:GetDescendants()) do
if d:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or d:IsA("\066\101\097\109") or d:IsA("\084\114\097\105\108") then
nEmitter=nEmitter+1
break
end
end
end
table.insert(pvPropInsts,fxClone)
n=n+1
end
end
end
end
end
end
if n==0 then
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\069\115\101\032\117\110\117\115\117\097\108\032\110\111\032\116\105\101\110\101\032\101\102\101\099\116\111\115\032\118\105\115\105\098\108\101\115\032\101\110\032\101\108\032\116\101\109\112\108\097\116\101\046",5)
end
previewing=true
local iconId=nil
if nMesh==0 and nEmitter>0 then
pcall(function()
local cfg=require(entry.template)
local info=cfg and cfg.AppearanceInfo
if info then
iconId=tonumber(info.Icon)
end
end)
end
if pvIconImg then
if iconId and iconId>0 then
pvIconImg.Image="\114\098\120\097\115\115\101\116\105\100\058\047\047"..tostring(iconId)
else
iconId=nil
end
end
if iconId then
pvSetMode(true)
else
pvSetMode(false)
end
pcall(function()
writefile("\071\077\095\117\110\117\115\117\097\108\095\112\114\101\118\105\101\119\046\116\120\116",os.date("\037\072\058\037\077\058\037\083").."\032\039"..entry.name
.."\039\058\032\097\110\099\104\111\114\115\061"..nAttach
.."\032\109\101\115\104\101\115\061"..nMesh
.."\032\101\109\105\116\116\101\114\115\061"..nEmitter
.."\032\116\111\116\097\108\061"..n
.."\032\105\099\111\110\077\111\100\101\061"..tostring(iconId~=nil))
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
local pk=p3MakePicker("\071\077\095\080\051\095\069\109\111\116\101\082\101\112\108\097\099\101\114","\071\104\111\115\116\032\077\101\116\104\111\100\032\045\032\069\109\111\116\101\115",760,470)
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
p3MakeLabel(pk.panel,22,64,330,"\069\109\111\116\101\032\073\032\119\097\110\116\032\116\111\032\114\101\112\108\097\099\101")
p3MakeLabel(pk.panel,408,64,330,"\069\109\111\116\101\032\116\111\032\114\101\112\108\097\099\101\032\119\105\116\104")
local searchL=p3MakeSearch(pk.panel,22,84,330)
local searchR=p3MakeSearch(pk.panel,408,84,330)
local listL=p3MakeList(pk.panel,22,124,330,254)
local listR=p3MakeList(pk.panel,408,124,330,254)
local activeLabel=p3MakeLabel(pk.panel,22,388,716,"")
p3MakeLabel(pk.panel,22,408,716,"\077\097\112\112\105\110\103\115\032\115\116\097\099\107\032\045\032\111\110\101\032\112\101\114\032\115\111\117\114\099\101\032\101\109\111\116\101\046\032\069\108\101\109\101\110\116\115\032\040\103\117\105\116\097\114\115\032\101\116\099\046\041\032\102\111\108\108\111\119\032\097\117\116\111\109\097\116\105\099\097\108\108\121\046")
local selFrom,selTo=nil,nil
local selFromRow,selToRow=nil,nil
local applyBtn=IN("\084\101\120\116\066\117\116\116\111\110")
applyBtn.Size=UDim2.fromOffset(92,TOUCH and 42 or 30)
applyBtn.Position=U2(0.5,-100,0,TOUCH and 80 or 84)
applyBtn.BackgroundColor3=Palette.Accent
applyBtn.Font=EF.GothamBold
applyBtn.Text="\065\112\112\108\121"
applyBtn.TextSize=13
applyBtn.TextColor3=Palette.TextBright
local aCorner=IN("\085\073\067\111\114\110\101\114")
aCorner.CornerRadius=UD(0,10)
aCorner.Parent=applyBtn
applyBtn.Parent=pk.panel
local removeBtn=IN("\084\101\120\116\066\117\116\116\111\110")
removeBtn.Size=UDim2.fromOffset(92,TOUCH and 42 or 30)
removeBtn.Position=U2(0.5,8,0,TOUCH and 80 or 84)
removeBtn.BackgroundColor3=CR(90,40,70)
removeBtn.Font=EF.GothamBold
removeBtn.Text="\082\101\109\111\118\101"
removeBtn.TextSize=13
removeBtn.TextColor3=Palette.TextBright
local rCorner=IN("\085\073\067\111\114\110\101\114")
rCorner.CornerRadius=UD(0,10)
rCorner.Parent=removeBtn
removeBtn.Parent=pk.panel
local previewBtn=IN("\084\101\120\116\066\117\116\116\111\110")
previewBtn.Size=UDim2.fromOffset(92,TOUCH and 42 or 30)
previewBtn.Position=U2(0.5,-46,0,8)
previewBtn.BackgroundColor3=Palette.AccentDeep
previewBtn.Font=EF.GothamBold
previewBtn.Text="\080\114\101\118\105\101\119"
previewBtn.TextSize=13
previewBtn.TextColor3=Palette.TextBright
local pvCorner=IN("\085\073\067\111\114\110\101\114")
pvCorner.CornerRadius=UD(0,10)
pvCorner.Parent=previewBtn
previewBtn.Parent=pk.panel
local function refreshActive()
local parts={}
for _,m in ipairs(activeMappings) do
table.insert(parts,m.from.name.."\032\045\062\032"..m.to.name)
end
table.sort(parts)
activeLabel.Text=#parts==0 and "\065\099\116\105\118\101\032\109\097\112\112\105\110\103\115\058\032\110\111\110\101" or("\065\099\116\105\118\101\058\032"..table.concat(parts,"\032\032\045\032\032"))
end
local function refreshLeft()
p3ClearRows(listL)
local filter=string.lower(searchL.Text or "")
local shown=0
for _,e in ipairs(Catalog.emotes) do
if filter=="" or string.find(string.lower(e.name),filter,1,true) then
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
p3AddRow(listL,"\078\111\032\101\109\111\116\101\115\032\109\097\116\099\104",nil,true)
end
end
local function refreshRight()
p3ClearRows(listR)
local filter=string.lower(searchR.Text or "")
local shown=0
for _,e in ipairs(Catalog.emotes) do
if filter=="" or string.find(string.lower(e.name),filter,1,true) then
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
p3AddRow(listR,"\078\111\032\101\109\111\116\101\115\032\109\097\116\099\104",nil,true)
end
end
searchL:GetPropertyChangedSignal("\084\101\120\116"):Connect(refreshLeft)
searchR:GetPropertyChangedSignal("\084\101\120\116"):Connect(refreshRight)
applyBtn.Activated:Connect(function()
if selFrom and selTo then
if p3SetMapping(selFrom,selTo) then
if not EmoteReplacer.enabled then
EmoteReplacer.enable()
end
refreshActive()
refreshLeft()
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\082\101\112\108\097\099\101\100\032\034"..selFrom.name.."\034\032\119\105\116\104\032\034"..selTo.name.."\034\046",4)
end
else
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\083\101\108\101\099\116\032\097\110\032\101\109\111\116\101\032\111\110\032\066\079\084\072\032\115\105\100\101\115\032\102\105\114\115\116\046",4)
end
end)
removeBtn.Activated:Connect(function()
if selFrom then
if p3RemoveMapping(selFrom.name) then
refreshActive()
refreshLeft()
else
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\078\111\032\109\097\112\112\105\110\103\032\102\111\114\032"..selFrom.name.."\046",4)
end
else
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\083\101\108\101\099\116\032\116\104\101\032\083\079\085\082\067\069\032\101\109\111\116\101\032\040\108\101\102\116\041\032\116\111\032\114\101\109\111\118\101\032\105\116\115\032\109\097\112\112\105\110\103\046",4)
end
end)
previewBtn.Activated:Connect(function()
if selTo then
p4PreviewEmote(selTo)
else
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\083\101\108\101\099\099\105\111\110\097\032\117\110\032\101\109\111\116\101\032\101\110\032\101\108\032\108\097\100\111\032\068\069\082\069\067\072\079\032\112\097\114\097\032\112\114\101\118\105\115\117\097\108\105\122\097\114\046",5)
end
end)
refreshLeft()
refreshRight()
refreshActive()
end
local function openUnusualsPicker()
buildPhase3Catalogs()
local pk=p3MakePicker("\071\077\095\080\051\095\085\110\117\115\117\097\108\115","\071\104\111\115\116\032\077\101\116\104\111\100\032\045\032\085\110\117\115\117\097\108\115",640,470)
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
local removeBtn=IN("\084\101\120\116\066\117\116\116\111\110")
removeBtn.Size=UDim2.fromOffset(110,TOUCH and 36 or 28)
removeBtn.Position=U2(1,-132,0,64)
removeBtn.BackgroundColor3=CR(90,40,70)
removeBtn.Font=EF.GothamBold
removeBtn.Text="\082\101\109\111\118\101\032\097\112\112\108\105\101\100"
removeBtn.TextSize=11
removeBtn.TextColor3=Palette.TextBright
local rCorner=IN("\085\073\067\111\114\110\101\114")
rCorner.CornerRadius=UD(0,10)
rCorner.Parent=removeBtn
removeBtn.Parent=pk.panel
local list=p3MakeList(pk.panel,22,108,596,326,2)
local function refresh()
local appliedRow=nil
p3ClearRows(list)
local filter=string.lower(search.Text or "")
local shown=0
for _,u in ipairs(Catalog.unusuals) do
if filter=="" or string.find(string.lower(u.name),filter,1,true) then
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
local pvBtn=IN("\084\101\120\116\066\117\116\116\111\110")
pvBtn.Name="\080\118\066\116\110"
pvBtn.AnchorPoint=Vector2.new(1,0.5)
pvBtn.Position=U2(1,-8,0.5,0)
pvBtn.Size=UDim2.fromOffset(TOUCH and 56 or 48,P3_ROW_H - 8)
pvBtn.BackgroundColor3=Palette.AccentDeep
pvBtn.BackgroundTransparency=0.35
pvBtn.Font=EF.GothamBold
pvBtn.TextSize=TOUCH and 12 or 11
pvBtn.TextColor3=Palette.TextBright
pvBtn.Text="\080\114\101\118"
pvBtn.ZIndex=2
pvBtn.AutoButtonColor=true
local pvC=IN("\085\073\067\111\114\110\101\114")
pvC.CornerRadius=UD(0,7)
pvC.Parent=pvBtn
pvBtn.Parent=row
pvBtn.Activated:Connect(function()
p4PreviewUnusual(u)
end)
end
end
if shown==0 then
p3AddRow(list,"\078\111\032\117\110\117\115\117\097\108\115\032\109\097\116\099\104",nil,true)
end
end
search:GetPropertyChangedSignal("\084\101\120\116"):Connect(refresh)
removeBtn.Activated:Connect(function()
removeUnusualNow()
activeUnusual=nil
Unusuals.disable()
if gmSaveConfig then
gmSaveConfig()
end
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\085\110\117\115\117\097\108\032\114\101\109\111\118\101\100\046",4)
end)
refresh()
end
local Lighting=game:GetService("\076\105\103\104\116\105\110\103")
local Graphics
local gfxSnap={}
local gfxPreset="\082\101\097\108\105\115\116\097"
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
SkyboxBk="\114\098\120\097\115\115\101\116\105\100\058\047\047\057\050\052\054\052\049\055\050",
SkyboxDn="\114\098\120\097\115\115\101\116\105\100\058\047\047\057\050\052\054\052\050\053\048",
SkyboxFt="\114\098\120\097\115\115\101\116\105\100\058\047\047\057\050\052\054\052\050\049\055",
SkyboxLf="\114\098\120\097\115\115\101\116\105\100\058\047\047\057\050\052\054\052\050\051\052",
SkyboxRt="\114\098\120\097\115\115\101\116\105\100\058\047\047\057\050\052\054\052\049\056\057",
SkyboxUp="\114\098\120\097\115\115\101\116\105\100\058\047\047\057\050\052\054\052\049\053\055",
}
local skySwapOn=false
local skySnap=nil
local skyReassertConn=nil
local function p4GetSky()
return Lighting:FindFirstChildOfClass("\083\107\121")
end
local function p4SetSky(on)
if on then
local sky=p4GetSky()
if not sky then
sky=IN("\083\107\121")
sky.Name="\071\077\095\083\107\121\072\068"
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
pcall(function()
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
pcall(function()
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
pcall(function()
s:Destroy()
end)
end
skySnap=nil
end
end
local function gfxApplyLightShadows()
for _,d in ipairs(Workspace:GetDescendants()) do
if d:IsA("\080\111\105\110\116\076\105\103\104\116") or d:IsA("\083\112\111\116\076\105\103\104\116") or d:IsA("\083\117\114\102\097\099\101\076\105\103\104\116") then
if gfxLightShadows[d]==nil then
gfxLightShadows[d]=d.Shadows
end
pcall(function()
d.Shadows=true
end)
end
end
end
local function gfxRestoreLightShadows()
for light,was in pairs(gfxLightShadows) do
pcall(function()
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
pcall(function()
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
local rigs=Workspace:FindFirstChild("\082\105\103\115")
local playersF=Workspace:FindFirstChild("\080\108\097\121\101\114\115")
local scanned=0
local smoothMatches=0
local changed=0
local matCount={}
for _,p in ipairs(Workspace:GetDescendants()) do
if p:IsA("\066\097\115\101\080\097\114\116") and p.Transparency<0.5 then
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
pcall(function()
p.Reflectance=target
end)
changed+=1
end
end
end
end
end
pcall(function()
local mats={}
for mk,count in pairs(matCount) do
table.insert(mats,{mk,count})
end
table.sort(mats,function(a,b)
return a[2]>b[2]
end)
local lines={
os.date("\037\072\058\037\077\058\037\083").."\032\115\104\105\110\121\032\115\119\101\101\112\032\064\032\108\101\118\101\108\032"..gfxShinyLevel,
"\032\032\111\112\097\113\117\101\032\066\097\115\101\080\097\114\116\115\032\115\099\097\110\110\101\100\058\032"..scanned,
"\032\032\115\109\111\111\116\104\045\109\097\116\101\114\105\097\108\032\112\097\114\116\115\032\109\097\116\099\104\101\100\058\032"..smoothMatches,
"\032\032\112\097\114\116\115\032\115\101\116\032\116\111\032\110\101\119\032\114\101\102\108\101\099\116\097\110\099\101\058\032"..changed,
"\032\032\084\079\080\032\077\065\080\032\077\065\084\069\082\073\065\076\083\058",
}
for i=1,math.min(15,#mats) do
table.insert(lines,"\032\032\032\032"..mats[i][1].."\032\120"..mats[i][2])
end
writefile("\071\077\095\115\104\105\110\121\095\100\117\109\112\046\116\120\116",table.concat(lines,"\010"))
end)
end
local function gfxRestoreShiny()
for part,was in pairs(gfxShinySnap) do
pcall(function()
if part.Parent then
part.Reflectance=was
end
end)
end
table.clear(gfxShinySnap)
end
local function p4GfxSafe(label,fn)
local ok,err=pcall(fn)
if not ok then
print("\091\071\077\093\032\071\070\088\032\069\082\082\079\082\032"..label.."\058\032"..tostring(err))
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\071\070\088\032\101\114\114\111\114\032\040"..label.."\041\058\032"..tostring(err),9)
pcall(function()
writefile("\071\077\095\103\102\120\095\101\114\114\111\114\046\116\120\116",os.date("\037\072\058\037\077\058\037\083").."\032"..label.."\058\032"..tostring(err))
end)
end
return ok
end
local function p4SetShiny(v)
gfxShinyLevel=v/100
if v>0 then
if not Graphics.enabled then
p4GfxSafe("\083\104\105\110\121\073\110\105\116\032\040\101\110\097\098\108\105\110\103\032\083\104\097\100\101\114\032\080\097\099\107\041",function()
Graphics.enable()
end)
end
p4GfxSafe("\083\104\105\110\121\065\112\112\108\121",gfxApplyShiny)
else
p4GfxSafe("\083\104\105\110\121\082\101\115\116\111\114\101",gfxRestoreShiny)
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
gmBloom=IN("\066\108\111\111\109\069\102\102\101\099\116")
gmBloom.Name="\071\077\095\066\108\111\111\109"
gmBloom.Parent=Lighting
end
pcall(function()
local t=math.clamp(level,0,2)
gmBloom.Intensity=t*t*0.75
gmBloom.Size=44
gmBloom.Threshold=0.85
end)
end
local function p4ShinyTest()
p4GfxSafe("\083\104\105\110\121\084\101\115\116",function()
local old=gfxShinyLevel
gfxRestoreShiny()
gfxShinyLevel=0.5
gfxApplyShiny()
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\082\101\102\108\101\106\111\115\032\097\108\032\053\048\037\032\112\111\114\032\053\032\115\101\103\117\110\100\111\115\032\045\032\077\073\082\065\032\069\076\032\083\085\069\076\079",5)
task.delay(5,function()
gfxRestoreShiny()
gfxShinyLevel=old
if old>0 then
gfxApplyShiny()
end
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\084\101\115\116\032\116\101\114\109\105\110\097\100\111\032\045\032\114\101\102\108\101\106\111\115\032\114\101\115\116\097\117\114\097\100\111\115",4)
end)
end)
end
function DLSSX.applyAtmo(p)
if not p.atmoApply then
return
end
local atmo=Lighting:FindFirstChildOfClass("\065\116\109\111\115\112\104\101\114\101")
if not atmo then
atmo=IN("\065\116\109\111\115\112\104\101\114\101")
atmo.Name="\071\077\095\065\116\109\111\115\112\104\101\114\101"
atmo.Parent=Lighting
DLSSX.atmoCreated=true
end
pcall(function()
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
pcall(function()
DLSSX.doF:Destroy()
end)
DLSSX.doF=nil
end
return
end
if not DLSSX.doF or DLSSX.doF.Parent==nil then
DLSSX.doF=IN("\068\101\112\116\104\079\102\070\105\101\108\100\069\102\102\101\099\116")
DLSSX.doF.Name="\071\077\095\068\111\070"
DLSSX.doF.Parent=Lighting
end
pcall(function()
DLSSX.doF.FarIntensity=p.dofFar
DLSSX.doF.NearIntensity=p.dofNear or 0
DLSSX.doF.FocusDistance=p.dofFocus or 120
DLSSX.doF.InFocusRadius=p.dofRadius or 20
end)
end
function DLSSX.applySunRays(p)
local sunRays=Lighting:FindFirstChildOfClass("\083\117\110\082\097\121\115\069\102\102\101\099\116")
if not sunRays then
sunRays=IN("\083\117\110\082\097\121\115\069\102\102\101\099\116")
sunRays.Name="\071\077\095\083\117\110\082\097\121\115"
sunRays.Parent=Lighting
DLSSX.sunRaysCreated=true
end
pcall(function()
sunRays.Intensity=p.sunRaysIntensity or 0.12
sunRays.Spread=p.sunRaysSpread or 0.7
end)
end
function DLSSX.applyCC(p)
local cc=Lighting:FindFirstChild("\071\077\095\067\111\108\111\114\071\114\097\100\101")
if not cc then
cc=IN("\067\111\108\111\114\067\111\114\114\101\099\116\105\111\110\069\102\102\101\099\116")
cc.Name="\071\077\095\067\111\108\111\114\071\114\097\100\101"
cc.Parent=Lighting
end
pcall(function()
local dark=DLSSX.shadowDark or 0
cc.Brightness=(p.ccBrightness or 0.02) - dark*0.35
cc.Contrast=(p.ccContrast or 0.06)+dark*0.25
cc.Saturation=(p.ccSaturation or 1.12) - 1 - dark*0.1
cc.TintColor=p.ccTint or CR(255,250,245)
end)
end
local function gfxApply()
local p=GFX_PRESETS[gfxPreset] or GFX_PRESETS.Realista
pcall(function()
local render=settings().Rendering
render.QualityLevel=p.quality
end)
pcall(function()
Lighting.Technology=Enum.Technology.Future
end)
pcall(function()
Lighting.GlobalShadows=true
end)
pcall(function()
Lighting.Brightness=3
DLSSX.shadowApply(p)
Lighting.EnvironmentSpecularScale=1
Lighting.ShadowSoftness=p.softness
Lighting.ExposureCompensation=p.exposure
end)
local twModule=nil
for _,m in ipairs(Modules) do
if m.Name=="\084\105\109\101\047\087\101\097\116\104\101\114" then
twModule=m
end
end
if not(twModule and twModule.enabled) then
pcall(function()
Lighting.ClockTime=p.clockTime
end)
end
DLSSX.applyAtmo(p)
DLSSX.applyDoF(p)
DLSSX.applySunRays(p)
DLSSX.applyCC(p)
local terrain=Workspace:FindFirstChildOfClass("\084\101\114\114\097\105\110")
if terrain then
pcall(function()
terrain.WaterReflectance=1
terrain.WaterRefraction=1
terrain.WaterWaveSize=2
terrain.WaterWaveSpeed=12
terrain.Decoration=true
end)
end
local sky=p4GetSky()
if sky then
pcall(function()
sky.SunAngularSize=21
sky.MoonAngularSize=14
sky.StarCount=5000
end)
end
gfxApplyLightShadows()
p4SetBloom(math.floor((p.bloomIntensity or 0.4)*100/0.75))
if p.sparkleIntensity and p.sparkleIntensity>0 then
if not DLSSX.sparkle or DLSSX.sparkle.Parent==nil then
DLSSX.sparkle=IN("\066\108\111\111\109\069\102\102\101\099\116")
DLSSX.sparkle.Name="\071\077\095\083\112\097\114\107\108\101"
DLSSX.sparkle.Parent=Lighting
end
pcall(function()
DLSSX.sparkle.Intensity=p.sparkleIntensity
DLSSX.sparkle.Size=p.sparkleSize or 12
DLSSX.sparkle.Threshold=p.sparkleThreshold or 0.92
end)
elseif DLSSX.sparkle then
pcall(function()
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
Name="\068\076\083\083",
enable=function()
if Graphics.enabled then
return
end
Graphics.enabled=true
if next(gfxSnap)==nil then
pcall(function()
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
local atmoSnap=Lighting:FindFirstChildOfClass("\065\116\109\111\115\112\104\101\114\101")
if atmoSnap then
gfxSnap.AtmoDensity=atmoSnap.Density
gfxSnap.AtmoOffset=atmoSnap.Offset
gfxSnap.AtmoColor=atmoSnap.Color
gfxSnap.AtmoDecay=atmoSnap.Decay
gfxSnap.AtmoGlare=atmoSnap.Glare
gfxSnap.AtmoHaze=atmoSnap.Haze
end
local terrain=Workspace:FindFirstChildOfClass("\084\101\114\114\097\105\110")
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
local sunRays=Lighting:FindFirstChildOfClass("\083\117\110\082\097\121\115\069\102\102\101\099\116")
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
pcall(function()
settings().Rendering.QualityLevel=p.quality
end)
pcall(function()
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
pcall(function()
local cc=Lighting:FindFirstChild("\071\077\095\067\111\108\111\114\071\114\097\100\101")
if cc then
cc:Destroy()
end
end)
if DLSSX.sparkle then
pcall(function()
DLSSX.sparkle:Destroy()
end)
DLSSX.sparkle=nil
end
if next(gfxSnap)~=nil then
pcall(function()
local render=settings().Rendering
render.QualityLevel=gfxSnap.QualityLevel
end)
pcall(function()
Lighting.Technology=gfxSnap.Technology
end)
pcall(function()
Lighting.GlobalShadows=gfxSnap.GlobalShadows
end)
pcall(function()
Lighting.ShadowSoftness=gfxSnap.ShadowSoftness
end)
pcall(function()
Lighting.ExposureCompensation=gfxSnap.ExposureCompensation
end)
pcall(function()
local terrain=Workspace:FindFirstChildOfClass("\084\101\114\114\097\105\110")
if terrain then
terrain.WaterReflectance=gfxSnap.WaterReflectance
terrain.WaterRefraction=gfxSnap.WaterRefraction
terrain.WaterWaveSize=gfxSnap.WaterWaveSize
terrain.WaterWaveSpeed=gfxSnap.WaterWaveSpeed
terrain.Decoration=gfxSnap.Decoration
end
end)
pcall(function()
local sky=p4GetSky()
if sky and gfxSnap.SunAngularSize then
sky.SunAngularSize=gfxSnap.SunAngularSize
sky.MoonAngularSize=gfxSnap.MoonAngularSize
sky.StarCount=gfxSnap.StarCount
end
end)
pcall(function()
local bloom=Lighting:FindFirstChildOfClass("\066\108\111\111\109\069\102\102\101\099\116")
if bloom and gfxSnap.BloomIntensity then
bloom.Intensity=gfxSnap.BloomIntensity
bloom.Size=gfxSnap.BloomSize
bloom.Threshold=gfxSnap.BloomThreshold
end
end)
pcall(function()
local sunRays=Lighting:FindFirstChildOfClass("\083\117\110\082\097\121\115\069\102\102\101\099\116")
if sunRays and gfxSnap.SunRaysIntensity then
sunRays.Intensity=gfxSnap.SunRaysIntensity
sunRays.Spread=gfxSnap.SunRaysSpread
end
end)
pcall(function()
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
pcall(function()
local atmo=Lighting:FindFirstChildOfClass("\065\116\109\111\115\112\104\101\114\101")
if atmo then
if DLSSX.atmoCreated and atmo.Name=="\071\077\095\065\116\109\111\115\112\104\101\114\101" then
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
pcall(function()
if DLSSX.doF then
DLSSX.doF:Destroy()
DLSSX.doF=nil
end
end)
pcall(function()
local sunRays=Lighting:FindFirstChildOfClass("\083\117\110\082\097\121\115\069\102\102\101\099\116")
if sunRays and DLSSX.sunRaysCreated and sunRays.Name=="\071\077\095\083\117\110\082\097\121\115" then
sunRays:Destroy()
end
end)
DLSSX.atmoCreated=false
DLSSX.sunRaysCreated=false
end
end,
verify=function()
if not Graphics.enabled then
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\110\111\116\032\115\101\116"
end
return true
end,
verifyClean=function()
if next(gfxLightShadows)~=nil then
return false,"\108\105\103\104\116\032\115\104\097\100\111\119\115\032\110\111\116\032\114\101\115\116\111\114\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if next(gfxShinySnap)~=nil then
return false,"\109\097\116\101\114\105\097\108\032\114\101\102\108\101\099\116\105\111\110\115\032\110\111\116\032\114\101\115\116\111\114\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
if DLSSX.doF and DLSSX.doF.Parent~=nil then
return false,"\100\101\112\116\104\032\111\102\032\102\105\101\108\100\032\115\116\105\108\108\032\097\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
DLSSX.shotHidden=false
DLSSX.shotSnaps={}
DLSSX.shotCoreTypes={
Enum.CoreGuiType.Backpack,
Enum.CoreGuiType.Chat,
Enum.CoreGuiType.Health,
Enum.CoreGuiType.PlayerList,
Enum.CoreGuiType.EmotesMenu,
}
DLSSX.ShotMod=RegisterModule({
Name="\083\099\114\101\101\110\115\104\111\116\032\077\111\100\101",
enable=function()
if DLSSX.ShotMod.enabled or DLSSX.shotHidden then
return
end
DLSSX.ShotMod.enabled=true
DLSSX.shotHidden=true
for _,coreType in ipairs(DLSSX.shotCoreTypes) do
pcall(function()
StarterGui:SetCoreGuiEnabled(coreType,false)
end)
end
local pg=LocalPlayer:FindFirstChild("\080\108\097\121\101\114\071\117\105")
if pg then
for _,child in ipairs(pg:GetChildren()) do
if child:IsA("\083\099\114\101\101\110\071\117\105") then
local isOurs=string.sub(child.Name,1,3)=="\071\077\095"
or child.Name=="\071\077\095\085\073" or child.Name=="\071\077\095\084\111\097\115\116\115"
if not isOurs then
DLSSX.shotSnaps[child]=child.Enabled
pcall(function()
child.Enabled=false
end)
end
end
end
end
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\083\099\114\101\101\110\115\104\111\116\032\109\111\100\101\058\032\085\073\032\100\101\032\069\118\097\100\101\032\111\099\117\108\116\097\046\032\040\067\116\114\108\043\088\032\112\097\114\097\032\108\097\032\110\117\101\115\116\114\097\041","\083\099\114\101\101\110\115\104\111\116\032\109\111\100\101\058\032\069\118\097\100\101\032\085\073\032\104\105\100\100\101\110\046\032\040\088\032\102\111\114\032\111\117\114\115\041"),6)
end,
disable=function()
if not DLSSX.ShotMod.enabled and not DLSSX.shotHidden then
return
end
DLSSX.ShotMod.enabled=false
DLSSX.shotHidden=false
for _,coreType in ipairs(DLSSX.shotCoreTypes) do
pcall(function()
StarterGui:SetCoreGuiEnabled(coreType,true)
end)
end
for child,was in pairs(DLSSX.shotSnaps) do
pcall(function()
if child.Parent then
child.Enabled=was
end
end)
end
DLSSX.shotSnaps={}
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\085\073\032\100\101\032\069\118\097\100\101\032\114\101\115\116\097\117\114\097\100\097\046","\069\118\097\100\101\032\085\073\032\114\101\115\116\111\114\101\100\046"),4)
end,
verify=function()
return true
end,
verifyClean=function()
if DLSSX.ShotMod.enabled or DLSSX.shotHidden then
return false,"\115\116\105\108\108\032\104\105\100\100\101\110"
end
return true
end,
})
markStep("\115\099\114\101\101\110\115\104\111\116\032\109\111\100\101\032\100\101\102\105\110\101\100")
local ColorFilter
local ccInst=nil
local ccVals={brightness=0,contrast=0,saturation=0}
local CC_PRESETS={
["\079\102\102"]={0,0,0},
["\078\097\116\117\114\097\108"]={0,0,0},
["\086\105\118\105\100"]={0,0.1,0.3},
["\067\105\110\101\109\097\116\105\099"]={0,0.18,-0.05},
["\078\111\099\116\117\114\110\101"]={0.12,0.08,-0.1},
["\083\111\109\098\114\105\111"]={-0.08,0.15,-0.15},
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
ccInst=IN("\067\111\108\111\114\067\111\114\114\101\099\116\105\111\110\069\102\102\101\099\116")
ccInst.Name="\071\077\095\067\111\108\111\114\070\105\108\116\101\114"
ccInst.Parent=Lighting
end
ccInst.Brightness=ccVals.brightness
ccInst.Contrast=ccVals.contrast
ccInst.Saturation=ccVals.saturation
end
local function p4SetCCPreset(name)
local p=CC_PRESETS[name]
if p then
if name=="\079\102\102" then
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
Name="\067\111\108\111\114\032\070\105\108\116\101\114",
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
return false,"\102\105\108\116\101\114\032\105\110\115\116\097\110\099\101\032\115\116\105\108\108\032\097\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
local TimeWeather
local twSnap=nil
local twState={clock=14,density=nil,haze=nil}
local twClock=0
local function twAtmo()
return Lighting:FindFirstChildOfClass("\065\116\109\111\115\112\104\101\114\101")
end
local function twApply()
pcall(function()
Lighting.ClockTime=twState.clock
end)
local a=twAtmo()
if a then
if twState.density then
pcall(function()
a.Density=twState.density
end)
end
if twState.haze then
pcall(function()
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
Name="\084\105\109\101\047\087\101\097\116\104\101\114",
enable=function()
if TimeWeather.enabled then
return
end
TimeWeather.enabled=true
if not twSnap then
twSnap={}
pcall(function()
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
pcall(function()
Lighting.ClockTime=twSnap.ClockTime
end)
local a=twAtmo()
if a then
pcall(function()
a.Density=twSnap.Density
end)
pcall(function()
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
return false,"\115\116\105\108\108\032\101\110\097\098\108\101\100\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
markStep("\112\104\097\115\101\032\052\032\100\101\102\105\110\101\100")
local Island
local islMode="\065\109\098\111\115"
local islGui,islPill,islLabel=nil,nil,nil
local islFrames=0
local islFps=0
local function islDestroy()
if islGui then
pcall(function()
islGui:Destroy()
end)
end
islGui,islPill,islLabel=nil,nil,nil
end
local function islBuild()
if islGui then
return
end
islGui=IN("\083\099\114\101\101\110\071\117\105")
islGui.Name="\071\077\095\073\115\108\097\110\100"
islGui.ResetOnSpawn=false
islGui.IgnoreGuiInset=true
islGui.DisplayOrder=400
islGui.Parent=GuiParent
islPill=IN("\070\114\097\109\101")
islPill.Name="\080\105\108\108"
islPill.AnchorPoint=Vector2.new(0.5,0)
islPill.Position=U2(0.5,0,0,10)
islPill.Size=UDim2.fromOffset(150,34)
islPill.BackgroundColor3=Palette.Panel
islPill.BackgroundTransparency=0.12
islPill.BorderSizePixel=0
islPill.Parent=islGui
local iCorner=IN("\085\073\067\111\114\110\101\114")
iCorner.CornerRadius=UD(1,0)
iCorner.Parent=islPill
local iGrad=IN("\085\073\071\114\097\100\105\101\110\116")
iGrad.Rotation=115
iGrad.Color=ColorSequence.new(CR(34,24,52),CR(14,10,20))
iGrad.Parent=islPill
local iStroke=IN("\085\073\083\116\114\111\107\101")
iStroke.Color=Palette.PanelStroke
iStroke.Thickness=1.4
iStroke.Transparency=0.25
iStroke.Parent=islPill
local dot=IN("\070\114\097\109\101")
dot.Size=UDim2.fromOffset(8,8)
dot.Position=U2(0,16,0.5,-4)
dot.BackgroundColor3=Palette.Accent
dot.BorderSizePixel=0
local dCorner=IN("\085\073\067\111\114\110\101\114")
dCorner.CornerRadius=UD(1,0)
dCorner.Parent=dot
dot.Parent=islPill
islLabel=IN("\084\101\120\116\076\097\098\101\108")
islLabel.BackgroundTransparency=1
islLabel.Size=U2(1,-44,1,0)
islLabel.Position=U2(0,34,0,0)
islLabel.Font=EF.GothamBold
islLabel.TextSize=13
islLabel.TextColor3=Palette.TextBright
islLabel.TextXAlignment=TX.Left
islLabel.Text="\045\032\045\032\045"
islLabel.Parent=islPill
TweenService:Create(
dot,
TweenInfo.new(1.6,ES.Sine,ED.InOut,-1,true),
{BackgroundTransparency=0.5}
):Play()
islPill.MouseEnter:Connect(function()
TweenService:Create(islPill,TweenInfo.new(0.28,ES.Back,ED.Out),{
Size=UDim2.fromOffset(196,40),
}):Play()
end)
islPill.MouseLeave:Connect(function()
TweenService:Create(islPill,TweenInfo.new(0.24,ES.Quad,ED.Out),{
Size=UDim2.fromOffset(150,34),
}):Play()
end)
end
local function p5SetIslandMode(mode)
if mode=="\072\111\114\097" or mode=="\070\080\083" or mode=="\065\109\098\111\115" then
islMode=mode
end
end
Island=RegisterModule({
Name="\068\121\110\097\109\105\099\032\073\115\108\097\110\100",
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
local timeStr=os.date("\037\072\058\037\077")
local text
if islMode=="\072\111\114\097" then
text=timeStr
elseif islMode=="\070\080\083" then
text=islFps.."\032\070\080\083"
else
text=timeStr.."\032\032\045\032\032"..islFps.."\032\070\080\083"
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
return false,"\101\110\097\098\108\101\100\032\102\108\097\103\032\110\111\116\032\115\101\116"
end
return true
end,
verifyClean=function()
if islGui then
return false,"\105\115\108\097\110\100\032\103\117\105\032\115\116\105\108\108\032\097\108\105\118\101\032\097\102\116\101\114\032\100\105\115\097\098\108\101\040\041"
end
return true
end,
})
local HttpService=game:GetService("\072\116\116\112\083\101\114\118\105\099\101")
local CONFIG_FILE="\071\077\095\099\111\110\102\105\103\046\106\115\111\110"
local CFG={
keystrokesOn=false,
keystrokesScale=100,
keystrokesOpacity=90,
keystrokesBgOpacity=90,
keystrokesDesign="\071\108\097\115\115",
keystrokesColor="\068\097\114\107",
keystrokesFont="\065\117\116\111",
keystrokesWm=true,
keystrokesBg=true,
keystrokesTextSize=12,
profilePhotoMode="\110\111\110\101",
profilePhotoId=0,
profilePhotoSeq=0,
keystrokesCustomIdle={22,14,36},
keystrokesCustomPressed={167,108,255},
keystrokesCustomText={216,208,235},
keystrokesPos=nil,
uiPos=nil,
islandOn=false,
islandMode="\065\109\098\111\115",
headlessHead=false,
headlessAccs=false,
korbloxOn=false,
korbloxLeg="\082\105\103\104\116",
gfxOn=false,
gfxPreset="\082\101\097\108\105\115\116\097",
gfxSky=false,
gfxShiny=30,
gfxBloom=100,
gfxShadowDark=0,
filterPreset="\079\102\102",
filterBrightness=0,
filterContrast=0,
filterSaturation=0,
timeOn=false,
timeClock=14,
timeDensity=40,
timeHaze=77,
bhopOn=false,
bhopKey="\083\112\097\099\101",
bhopDelay=0,
crunchOn=false,
crunchSpeed=50,
crunchKey="\076\101\102\116\083\104\105\102\116",
hudBhopOn=false,
hudCrunchOn=false,
hudBhopMode="\077\097\110\116\101\110\101\114",
hudCrunchMode="\077\097\110\116\101\110\101\114",
hudBtnSize=84,
hudBtnOpacity=85,
hudUnlocked=false,
hudBhopPos=nil,
hudCrunchPos=nil,
language="\101\115",
soundsOn=true,
crosshairOn=false,
crosshairStyle="\067\114\111\115\115",
crosshairSize=12,
crosshairGap=4,
crosshairThick=2,
crosshairOpacity=100,
crosshairColor={167,108,255},
crosshairOffX=0,
crosshairOffY=0,
evadeFontOn=false,
evadeFont="\071\111\116\104\097\109",
musicVolume=50,
spotifyDc="",
spotifyName="",
strafferOn=false,
strafferInvert=false,
strafferDeadzone=2,
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
p4SetCCValue("\098\114\105\103\104\116\110\101\115\115",CFG.filterBrightness/100)
p4SetCCValue("\099\111\110\116\114\097\115\116",CFG.filterContrast/100)
p4SetCCValue("\115\097\116\117\114\097\116\105\111\110",CFG.filterSaturation/100)
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
if m.Name=="\077\111\098\105\108\101\032\072\085\068" then
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
if m.Name=="\067\114\111\115\115\104\097\105\114" then
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
if m.Name=="\069\118\097\100\101\070\111\110\116" then
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
task.delay(1,function()
gmSavePending=false
if gmSaveConfig then
gmSaveConfig()
end
end)
end
onOverlayMoved=gmMarkConfig
gmSaveConfig=function()
pcall(function()
local op=KeysAPI.getPos()
if op then
CFG.keystrokesPos={op.X.Scale,op.X.Offset,op.Y.Scale,op.Y.Offset}
end
local data={mappings={}}
for _,m in ipairs(activeMappings) do
table.insert(data.mappings,{from=m.from.name,to=m.to.name})
end
if Unusuals.enabled and activeUnusual then
data.unusual=activeUnusual
end
data.cfg=CFG
writefile(CONFIG_FILE,HttpService:JSONEncode(data))
end)
end
local function gmLoadConfig()
local ok,raw=pcall(function()
if isfile and readfile and isfile(CONFIG_FILE) then
return HttpService:JSONDecode(readfile(CONFIG_FILE))
end
return nil
end)
if not ok or type(raw)~="\116\097\098\108\101" then
return
end
if type(raw.mappings)=="\116\097\098\108\101" then
for _,m in ipairs(raw.mappings) do
local fromE=Catalog.emoteByName[tostring(m.from)]
local toE=Catalog.emoteByName[tostring(m.to)]
if fromE and toE then
p3SetMapping(fromE,toE)
end
end
if #activeMappings>0 then
zzV1["\098\111\111\116\069\110\097\098\108\101\115"]=zzV1["\098\111\111\116\069\110\097\098\108\101\115"] or {}
table.insert(zzV1["\098\111\111\116\069\110\097\098\108\101\115"],function()
EmoteReplacer.enable()
end)
print("\091\071\077\093\032\099\111\110\102\105\103\058\032"..#activeMappings.."\032\101\109\111\116\101\032\109\097\112\112\105\110\103\040\115\041\032\114\101\115\116\111\114\101\100")
end
end
if type(raw.unusual)=="\115\116\114\105\110\103" and Catalog.unusualByName[raw.unusual] then
activeUnusual=raw.unusual
zzV1["\098\111\111\116\069\110\097\098\108\101\115"]=zzV1["\098\111\111\116\069\110\097\098\108\101\115"] or {}
table.insert(zzV1["\098\111\111\116\069\110\097\098\108\101\115"],function()
Unusuals.enable()
end)
print("\091\071\077\093\032\099\111\110\102\105\103\058\032\117\110\117\115\117\097\108\032\039"..raw.unusual.."\039\032\114\101\115\116\111\114\101\100")
end
if type(raw.cfg)=="\116\097\098\108\101" then
for k,v in pairs(raw.cfg) do
if k=="\107\101\121\115\116\114\111\107\101\115\080\111\115" then
if type(v)=="\116\097\098\108\101" and #v==4 then
CFG.keystrokesPos=v
end
elseif CFG[k]~=nil and type(v)==type(CFG[k]) then
CFG[k]=v
end
end
print("\091\071\077\093\032\099\111\110\102\105\103\058\032\085\073\032\115\116\097\116\101\032\114\101\115\116\111\114\101\100")
elseif type(raw.islandMode)=="\115\116\114\105\110\103" then
CFG.islandMode=raw.islandMode
p5SetIslandMode(raw.islandMode)
end
end
gmLoadConfig()
zzV1.language=CFG.language=="\101\110" and "\101\110" or "\101\115"
zzV1.uiSoundSetEnabled(CFG.soundsOn~=false)
buildMobileHUD({
RegisterModule=RegisterModule,
notify=notify,
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
if key=="\098\104\111\112" then
MOVE.setBhopVirtual(on)
else
MOVE.setCrunchVirtual(on)
end
end,
setBtnPos=function(key,pos)
local t={pos.X.Scale,pos.X.Offset,pos.Y.Scale,pos.Y.Offset}
if key=="\098\104\111\112" then
CFG.hudBhopPos=t
else
CFG.hudCrunchPos=t
end
gmMarkConfig()
end,
})
markStep("\109\111\098\105\108\101\032\104\117\100\032\100\101\102\105\110\101\100")
buildCrosshair({
RegisterModule=RegisterModule,
notify=notify,
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
markStep("\099\114\111\115\115\104\097\105\114\032\100\101\102\105\110\101\100")
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
markStep("\101\118\097\100\101\032\102\111\110\116\032\100\101\102\105\110\101\100")
zzV1.spotify=buildSpotify({
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
zzV1.skin=buildSkinChanger({
RegisterModule=RegisterModule,
notify=notify,
getLocalPlayer=function()
return LocalPlayer
end,
})
markStep("\115\112\111\116\105\102\121\032\043\032\115\107\105\110\032\099\104\097\110\103\101\114\032\100\101\102\105\110\101\100")
markStep("\112\104\097\115\101\032\053\032\100\101\102\105\110\101\100")
do
local cgAcc=0
local cgCooldown=0
local cgGoneSince=nil
local cgWarned=false
local cgConn
cgConn=RunService.Heartbeat:Connect(function(dt)
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
local hum=char and char:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
if hum==nil then
if cgGoneSince==nil then
cgGoneSince=os.clock()
cgWarned=false
elseif not cgWarned and os.clock() - cgGoneSince>20 then
cgWarned=true
notify(
"\071\104\111\115\116\032\077\101\116\104\111\100",
gmT("\069\108\032\106\117\101\103\111\032\110\111\032\116\101\032\114\101\115\112\097\119\110\105\111\032\040\098\117\103\032\100\101\032\114\111\110\100\097\041\046\032\085\115\097\032\101\108\032\114\101\115\101\116\032\100\101\032\082\111\098\108\111\120\032\112\097\114\097\032\118\111\108\118\101\114\046","\084\104\101\032\103\097\109\101\032\100\105\100\032\110\111\116\032\114\101\115\112\097\119\110\032\121\111\117\032\040\114\111\117\110\100\032\098\117\103\041\046\032\085\115\101\032\082\111\098\108\111\120\032\114\101\115\101\116\032\116\111\032\114\101\116\117\114\110\046"),
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
or(typeof(subject)=="\073\110\115\116\097\110\099\101" and subject.Parent==nil)
if not stale then
return
end
if os.clock() - cgCooldown<3 then
return
end
cgCooldown=os.clock()
cam.CameraSubject=hum
print("\091\071\077\093\032\067\097\109\101\114\097\032\071\117\097\114\100\058\032\099\097\109\101\114\097\032\114\101\045\097\116\116\097\099\104\101\100\032\116\111\032\121\111\117\114\032\099\104\097\114\097\099\116\101\114\032\040\114\111\117\110\100\032\103\108\105\116\099\104\041\046")
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\067\097\109\097\114\097\032\114\101\045\097\100\106\117\110\116\097\100\097\032\097\108\032\112\101\114\115\111\110\097\106\101\032\040\103\108\105\116\099\104\032\100\101\032\114\111\110\100\097\032\099\111\114\114\101\103\105\100\111\041\046","\067\097\109\101\114\097\032\114\101\045\097\116\116\097\099\104\101\100\032\116\111\032\121\111\117\114\032\099\104\097\114\097\099\116\101\114\032\040\114\111\117\110\100\032\103\108\105\116\099\104\032\102\105\120\101\100\041\046"),5)
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
CFG.uiPos={math.floor(dx),math.floor(dy)}
gmMarkConfig()
end,
getIslandOn=function() return CFG.islandOn end,
getHeadlessHead=function() return CFG.headlessHead end,
getHeadlessAccs=function() return CFG.headlessAccs end,
getKorbloxOn=function() return CFG.korbloxOn end,
getKorbloxLegLabel=function()
if CFG.korbloxLeg=="\076\101\102\116" then
return "\076\101\102\116\032\108\101\103"
elseif CFG.korbloxLeg=="\066\111\116\104" then
return "\066\111\116\104\032\108\101\103\115"
end
return "\082\105\103\104\116\032\108\101\103"
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
if key=="\115\105\122\101" then
return CFG.crosshairSize
elseif key=="\103\097\112" then
return CFG.crosshairGap
elseif key=="\116\104\105\099\107" then
return CFG.crosshairThick
elseif key=="\111\112\097\099\105\116\121" then
return CFG.crosshairOpacity
elseif key=="\111\102\102\120" then
return CFG.crosshairOffX
elseif key=="\111\102\102\121" then
return CFG.crosshairOffY
end
return 0
end,
setCrosshairNum=function(key,v)
if key=="\115\105\122\101" then
CFG.crosshairSize=v
elseif key=="\103\097\112" then
CFG.crosshairGap=v
elseif key=="\116\104\105\099\107" then
CFG.crosshairThick=v
elseif key=="\111\112\097\099\105\116\121" then
CFG.crosshairOpacity=v
elseif key=="\111\102\102\120" then
CFG.crosshairOffX=v
elseif key=="\111\102\102\121" then
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
if part=="\114" then
nc[1]=v
elseif part=="\103" then
nc[2]=v
elseif part=="\098" then
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
gmMarkConfig()
end,
spSetStateHandler=function(fn)
if zzV1.spotify then
zzV1.spotify.setStateHandler(fn)
end
end,
spGetAccount=function()
if CFG.spotifyDc and #CFG.spotifyDc>10 then
return true,(CFG.spotifyName~="" and CFG.spotifyName) or gmT("\099\111\110\101\099\116\097\100\111","\099\111\110\110\101\099\116\101\100")
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
if type(getcustomasset)~="\102\117\110\099\116\105\111\110" then
return "\110\111\102\117\110\099",nil
end
if type(listfiles)~="\102\117\110\099\116\105\111\110" then
return "\110\111\102\105\108\101",nil
end
local best,bestNum=nil,-1
local legacy=nil
for _,f in ipairs(listfiles()) do
local m=string.match(f,"\094\071\077\095\102\111\116\111\095\040\037\100\043\041\037\046\112\110\103\036")
if not m then
m=string.match(f,"\094\071\077\095\102\111\116\111\095\040\037\100\043\041\037\046\106\112\103\036")
end
if m then
local num=tonumber(m)
if num and num>bestNum then
best,bestNum=f,num
end
elseif f=="\071\077\095\102\111\116\111\046\112\110\103" or f=="\071\077\095\102\111\116\111\046\106\112\103" then
legacy=legacy or f
end
end
local target=best or legacy
if not target then
return "\110\111\102\105\108\101",nil
end
local ok,url=pcall(function()
return getcustomasset(target)
end)
if ok and type(url)=="\115\116\114\105\110\103" and #url>0 then
return "\111\107",url
end
return "\098\097\100\102\105\108\101",nil
end,
downloadPhoto=function(url)
if type(url)~="\115\116\114\105\110\103" or #url<8 then
return "\098\097\100\117\114\108",nil
end
local ok,content=pcall(function()
return game:HttpGet(url)
end)
if not ok or type(content)~="\115\116\114\105\110\103" or #content<64 then
return "\098\097\100\117\114\108",nil
end
local b1=string.byte(content,1)
local b2=string.byte(content,2)
local ext=nil
if b1==137 and b2==80 then
ext="\112\110\103"
elseif b1==255 and b2==216 then
ext="\106\112\103"
else
return "\110\111\116\105\109\103",nil
end
CFG.profilePhotoSeq=(tonumber(CFG.profilePhotoSeq) or 0)+1
local fname="\071\077\095\102\111\116\111\095"..tostring(CFG.profilePhotoSeq).."\046"..ext
pcall(function()
if type(delfile)=="\102\117\110\099\116\105\111\110" and type(listfiles)=="\102\117\110\099\116\105\111\110" then
for _,f in ipairs(listfiles()) do
local isNum=string.match(f,"\094\071\077\095\102\111\116\111\095\037\100\043\037\046\112\110\103\036") or string.match(f,"\094\071\077\095\102\111\116\111\095\037\100\043\037\046\106\112\103\036")
if isNum or f=="\071\077\095\102\111\116\111\046\112\110\103" or f=="\071\077\095\102\111\116\111\046\106\112\103" then
if f~=fname then
delfile(f)
end
end
end
end
end)
local okW=pcall(function()
writefile(fname,content)
end)
if not okW then
return "\098\097\100\119\114\105\116\101",nil
end
gmMarkConfig()
return "\111\107",fname
end,
deletePhotoFiles=function()
pcall(function()
if type(delfile)=="\102\117\110\099\116\105\111\110" and type(listfiles)=="\102\117\110\099\116\105\111\110" then
for _,f in ipairs(listfiles()) do
local isNum=string.match(f,"\094\071\077\095\102\111\116\111\095\037\100\043\037\046\112\110\103\036") or string.match(f,"\094\071\077\095\102\111\116\111\095\037\100\043\037\046\106\112\103\036")
if isNum or f=="\071\077\095\102\111\116\111\046\112\110\103" or f=="\071\077\095\102\111\116\111\046\106\112\103" then
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
CFG.keystrokesCustomIdle={math.floor(c.R*255+0.5),math.floor(c.G*255+0.5),math.floor(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
gmMarkConfig()
end,
setKeyCustomPressed=function(c)
CFG.keystrokesCustomPressed={math.floor(c.R*255+0.5),math.floor(c.G*255+0.5),math.floor(c.B*255+0.5)}
KeysAPI.setCustom(CFG.keystrokesCustomIdle,CFG.keystrokesCustomPressed,CFG.keystrokesCustomText)
gmMarkConfig()
end,
setKeyCustomText=function(c)
CFG.keystrokesCustomText={math.floor(c.R*255+0.5),math.floor(c.G*255+0.5),math.floor(c.B*255+0.5)}
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
if zzV1.setIslandActive then
zzV1.setIslandActive(on)
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
zzV1.uiSoundSetEnabled(on)
if on then
task.delay(0.08,function()
zzV1.uiSound("\116\111\103\103\108\101\079\110")
end)
end
gmMarkConfig()
end,
getLanguageLabel=function()
return CFG.language=="\101\110" and "\069\110\103\108\105\115\104" or "\069\115\112\097\110\111\108"
end,
setLanguage=function(label)
local code=(label=="\069\110\103\108\105\115\104") and "\101\110" or "\101\115"
if code==CFG.language then
return
end
local prev=CFG.language
CFG.language=code
zzV1.language=code
gmMarkConfig()
pcall(function()
if zzV1.root then
zzV1.root:Destroy()
end
end)
local okB,errB=pcall(buildGhostUI,ghostCtx)
if okB and zzV1.root then
pcall(function()
if zzV1.setIslandActive then
zzV1.setIslandActive(CFG.islandOn)
end
end)
pcall(APPLIES.all)
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\073\100\105\111\109\097\032\097\112\108\105\099\097\100\111\046","\076\097\110\103\117\097\103\101\032\097\112\112\108\105\101\100\046"),4)
else
pcall(function()
writefile("\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116",os.date("\037\089\045\037\109\045\037\100\032\037\072\058\037\077\058\037\083")
.."\032\105\110\116\101\110\116\111\032\100\101\032\114\101\098\117\105\108\100\032\099\111\110\032\105\100\105\111\109\097\061"..tostring(code)
.."\032\102\097\108\108\111\058\010"..tostring(errB))
end)
CFG.language=prev
zzV1.language=prev
gmMarkConfig()
local okR,errR=pcall(buildGhostUI,ghostCtx)
if okR and zzV1.root then
pcall(function()
if zzV1.setIslandActive then
zzV1.setIslandActive(CFG.islandOn)
end
end)
pcall(APPLIES.all)
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT(
"\069\108\032\099\097\109\098\105\111\032\100\101\032\105\100\105\111\109\097\032\102\097\108\108\111\032\045\032\115\101\032\114\101\115\116\097\117\114\111\032\101\108\032\105\100\105\111\109\097\032\097\110\116\101\114\105\111\114\046\032\068\101\116\097\108\108\101\115\032\101\110\032\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116",
"\076\097\110\103\117\097\103\101\032\115\119\105\116\099\104\032\102\097\105\108\101\100\032\045\032\112\114\101\118\105\111\117\115\032\108\097\110\103\117\097\103\101\032\114\101\115\116\111\114\101\100\046\032\068\101\116\097\105\108\115\032\105\110\032\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116"),8)
else
pcall(function()
local f=readfile and isfile and isfile("\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116") and readfile("\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116") or ""
writefile("\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116",f.."\010\082\069\067\085\080\069\082\065\067\073\079\078\032\084\065\077\066\073\069\078\032\070\065\076\076\079\058\010"..tostring(errR))
end)
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT(
"\069\114\114\111\114\032\100\101\032\105\110\116\101\114\102\097\122\032\045\032\114\101\045\101\106\101\099\117\116\097\032\101\108\032\115\099\114\105\112\116\046\032\068\101\116\097\108\108\101\115\032\101\110\032\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116",
"\073\110\116\101\114\102\097\099\101\032\101\114\114\111\114\032\045\032\114\101\045\101\120\101\099\117\116\101\032\116\104\101\032\115\099\114\105\112\116\046\032\068\101\116\097\105\108\115\032\105\110\032\071\077\095\108\097\110\103\095\101\114\114\111\114\046\116\120\116"),10)
end
end
end,
saveAllNow=function()
if gmSaveConfig then
gmSaveConfig()
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\067\111\110\102\105\103\117\114\097\099\105\111\110\032\103\117\097\114\100\097\100\097\046","\067\111\110\102\105\103\117\114\097\116\105\111\110\032\115\097\118\101\100\046"),4)
end
end,
savePreset=function(slot)
local fname="\071\077\095\112\114\101\115\101\116\095"..(slot=="\066" and "\066" or "\065").."\046\106\115\111\110"
pcall(function()
local data={mappings={}}
for _,m in ipairs(activeMappings) do
table.insert(data.mappings,{from=m.from.name,to=m.to.name})
end
if Unusuals.enabled and activeUnusual then
data.unusual=activeUnusual
end
data.cfg=CFG
writefile(fname,HttpService:JSONEncode(data))
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\080\114\101\115\101\116\032"..slot.."\032\103\117\097\114\100\097\100\111\032\040\099\111\110\102\105\103\032\043\032\101\109\111\116\101\115\032\043\032\117\110\117\115\117\097\108\041\046","\080\114\101\115\101\116\032"..slot.."\032\115\097\118\101\100\032\040\099\111\110\102\105\103\032\043\032\101\109\111\116\101\115\032\043\032\117\110\117\115\117\097\108\041\046"),4)
end)
end,
applyPreset=function(slot)
local fname="\071\077\095\112\114\101\115\101\116\095"..(slot=="\066" and "\066" or "\065").."\046\106\115\111\110"
pcall(function()
if type(isfile)~="\102\117\110\099\116\105\111\110" or not isfile(fname) then
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\069\115\101\032\112\114\101\115\101\116\032\101\115\116\097\032\118\097\099\105\111\032\045\032\103\117\097\114\100\097\108\111\032\112\114\105\109\101\114\111\046","\084\104\097\116\032\112\114\101\115\101\116\032\105\115\032\101\109\112\116\121\032\045\032\115\097\118\101\032\105\116\032\102\105\114\115\116\046"),5)
return
end
local raw=HttpService:JSONDecode(readfile(fname))
if type(raw.cfg)=="\116\097\098\108\101" then
for k,v in pairs(raw.cfg) do
if k=="\107\101\121\115\116\114\111\107\101\115\080\111\115" or k=="\117\105\080\111\115" then
if type(v)=="\116\097\098\108\101" then
CFG[k]=v
end
elseif CFG[k]~=nil and type(v)==type(CFG[k]) then
CFG[k]=v
end
end
end
if type(raw.mappings)=="\116\097\098\108\101" then
p3RemoveAllMappings()
for _,m in ipairs(raw.mappings) do
local fromE=Catalog.emoteByName[tostring(m.from)]
local toE=Catalog.emoteByName[tostring(m.to)]
if fromE and toE then
p3SetMapping(fromE,toE)
end
end
end
if type(raw.unusual)=="\115\116\114\105\110\103" and Catalog.unusualByName[raw.unusual] then
removeUnusualNow()
activeUnusual=raw.unusual
Unusuals.enable()
end
zzV1.language=CFG.language=="\101\110" and "\101\110" or "\101\115"
gmMarkConfig()
pcall(function()
if zzV1.root then
zzV1.root:Destroy()
end
end)
local okB=pcall(buildGhostUI,ghostCtx)
if okB and zzV1.root then
if zzV1.setIslandActive then
zzV1.setIslandActive(CFG.islandOn)
end
APPLIES.all()
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\080\114\101\115\101\116\032"..slot.."\032\097\112\108\105\099\097\100\111\046","\080\114\101\115\101\116\032"..slot.."\032\097\112\112\108\105\101\100\046"),4)
end
end)
end,
factoryReset=function()
local defaults={
keystrokesOn=false,keystrokesScale=100,keystrokesOpacity=90,
keystrokesBgOpacity=90,keystrokesDesign="\071\108\097\115\115",keystrokesColor="\068\097\114\107",
keystrokesFont="\065\117\116\111",keystrokesWm=true,keystrokesBg=true,keystrokesTextSize=12,
islandOn=false,islandMode="\065\109\098\111\115",
headlessHead=false,headlessAccs=false,
korbloxOn=false,korbloxLeg="\082\105\103\104\116",
gfxOn=false,gfxPreset="\082\101\097\108\105\115\116\097",gfxSky=false,gfxShiny=30,gfxBloom=100,
gfxShadowDark=0,
filterPreset="\079\102\102",filterBrightness=0,filterContrast=0,filterSaturation=0,
timeOn=false,timeClock=14,timeDensity=40,timeHaze=77,
bhopOn=false,bhopKey="\083\112\097\099\101",bhopDelay=0,
crunchOn=false,crunchSpeed=50,crunchKey="\076\101\102\116\083\104\105\102\116",
strafferOn=false,strafferInvert=false,strafferDeadzone=2,
hudBhopOn=false,hudCrunchOn=false,hudBhopMode="\077\097\110\116\101\110\101\114",hudCrunchMode="\077\097\110\116\101\110\101\114",
hudBtnSize=84,hudBtnOpacity=85,hudUnlocked=false,
profilePhotoMode="\110\111\110\101",profilePhotoId=0,profilePhotoSeq=0,
crosshairOn=false,crosshairStyle="\067\114\111\115\115",crosshairSize=12,
crosshairGap=4,crosshairThick=2,crosshairOpacity=100,
crosshairColor={167,108,255},crosshairOffX=0,crosshairOffY=0,
evadeFontOn=false,evadeFont="\071\111\116\104\097\109",
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
pcall(function()
if zzV1.root then
zzV1.root:Destroy()
end
end)
local okB=pcall(buildGhostUI,ghostCtx)
if okB and zzV1.root then
if zzV1.setIslandActive then
zzV1.setIslandActive(CFG.islandOn)
end
APPLIES.all()
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\086\097\108\111\114\101\115\032\100\101\032\102\097\098\114\105\099\097\032\114\101\115\116\097\117\114\097\100\111\115\046","\070\097\099\116\111\114\121\032\115\101\116\116\105\110\103\115\032\114\101\115\116\111\114\101\100\046"),5)
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
notify("\071\104\111\115\116\032\077\101\116\104\111\100","\065\108\108\032\101\109\111\116\101\032\109\097\112\112\105\110\103\115\032\114\101\109\111\118\101\100\032\045\032\116\101\109\112\108\097\116\101\115\032\114\101\115\116\111\114\101\100\046",4)
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
pcall(function()
local ccI=Lighting:FindFirstChild("\071\077\095\067\111\108\111\114\071\114\097\100\101")
writefile("\071\077\095\115\104\097\100\111\119\095\100\101\098\117\103\046\116\120\116",
"\118\061"..tostring(v)
.."\032\100\097\114\107\061"..tostring(DLSSX.shadowDark)
.."\032\100\108\115\115\079\110\061"..tostring(Graphics and Graphics.enabled)
.."\032\097\109\098\061"..tostring(Lighting.Ambient)
.."\032\111\117\116\061"..tostring(Lighting.OutdoorAmbient)
.."\032\101\110\118\061"..tostring(Lighting.EnvironmentDiffuseScale)
.."\032\099\099\066\061"..tostring(ccI and ccI.Brightness)
.."\032\099\099\067\061"..tostring(ccI and ccI.Contrast))
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
if key=="\098\114\105\103\104\116\110\101\115\115" then
CFG.filterBrightness=v*100
elseif key=="\099\111\110\116\114\097\115\116" then
CFG.filterContrast=v*100
elseif key=="\115\097\116\117\114\097\116\105\111\110" then
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
local uiOk,uiRootOrErr=pcall(buildGhostUI,ghostCtx)
if not uiOk or uiRootOrErr==nil then
local why=uiOk and "\098\117\105\108\100\101\114\032\114\101\116\117\114\110\101\100\032\110\111\032\114\111\111\116" or tostring(uiRootOrErr)
error("\091\071\077\093\032\099\117\115\116\111\109\032\085\073\032\098\117\105\108\100\032\102\097\105\108\101\100\058\032"..why,0)
end
markStep("\099\117\115\116\111\109\032\085\073\032\098\117\105\108\116")
zzV1["\102\105\110\097\108\065\112\112\108\121"]=function()
APPLIES.all()
if zzV1["\098\111\111\116\069\110\097\098\108\101\115"] then
for _,fn in ipairs(zzV1["\098\111\111\116\069\110\097\098\108\101\115"]) do
pcall(fn)
end
zzV1["\098\111\111\116\069\110\097\098\108\101\115"]=nil
end
if zzV1.setIslandActive then
zzV1.setIslandActive(CFG.islandOn)
end
task.defer(function()
runSelfTest(false)
end)
notify("\071\104\111\115\116\032\077\101\116\104\111\100",gmT("\099\097\114\103\097\100\111\032\045\032\112\114\101\115\105\111\110\097\032\088\032\112\097\114\097\032\101\108\032\109\101\110\117","\108\111\097\100\101\100\032\045\032\112\114\101\115\115\032\088\032\116\111\032\116\111\103\103\108\101\032\116\104\101\032\109\101\110\117"),5)
zzV1["\102\105\110\097\108\065\112\112\108\121"]=nil
end
runSelfTest=function(withNotification)
local allOk=true
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
print("\032\032\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\083\069\076\070\045\084\069\083\084\032\082\069\080\079\082\084\032\032\032\032\101\120\101\099\117\116\111\114\058\032"..executorName())
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
if zzV1 and zzV1.root then
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\067\117\115\116\111\109\032\085\073\032\046\046\046\046\046\046\046\046\046\046\046\046\032\070\079\085\078\068\032\047\032\079\075")
else
allOk=false
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\067\117\115\116\111\109\032\085\073\032\046\046\046\046\046\046\046\046\046\046\046\046\032\070\065\073\076\069\068\032\045\032\085\073\032\114\111\111\116\032\109\105\115\115\105\110\103")
end
for _,mod in ipairs(Modules) do
local ok,reason=true,nil
if type(mod.enable)~="\102\117\110\099\116\105\111\110" or type(mod.disable)~="\102\117\110\099\116\105\111\110" then
ok,reason=false,"\109\105\115\115\105\110\103\032\101\110\097\098\108\101\040\041\047\100\105\115\097\098\108\101\040\041"
end
local wasEnabled=mod.enabled
if ok and not wasEnabled then
local eOk,eErr=pcall(mod.enable,{hidden=true})
if not eOk then
ok,reason=false,"\101\110\097\098\108\101\040\041\032\101\114\114\111\114\101\100\058\032"..tostring(eErr)
end
end
if ok then
local vOk,v1,v2=pcall(mod.verify)
if not vOk then
ok,reason=false,"\118\101\114\105\102\121\040\041\032\101\114\114\111\114\101\100\058\032"..tostring(v1)
elseif v1==false then
ok,reason=false,tostring(v2 or "\118\101\114\105\102\105\099\097\116\105\111\110\032\102\097\105\108\101\100")
end
end
if ok and not wasEnabled then
local dOk,dErr=pcall(mod.disable)
if not dOk then
ok,reason=false,"\100\105\115\097\098\108\101\040\041\032\101\114\114\111\114\101\100\058\032"..tostring(dErr)
elseif type(mod.verifyClean)=="\102\117\110\099\116\105\111\110" then
local cOk,c1,c2=pcall(mod.verifyClean)
if not cOk then
ok,reason=false,"\118\101\114\105\102\121\067\108\101\097\110\040\041\032\101\114\114\111\114\101\100\058\032"..tostring(c1)
elseif c1==false then
ok,reason=false,tostring(c2 or "\099\108\101\097\110\117\112\032\118\101\114\105\102\105\099\097\116\105\111\110\032\102\097\105\108\101\100")
end
end
end
if not ok then
allOk=false
end
if ok then
print(string.format("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\037\045\049\052\115\032\079\075",mod.Name))
else
print(string.format("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\037\045\049\052\115\032\070\065\073\076\069\068\032\045\032\037\115",mod.Name,tostring(reason)))
end
mod.lastTestOk=ok
mod.lastTestReason=reason
end
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
local rigOk,rigProbe=pcall(function()
local rigs=Workspace:FindFirstChild("\082\105\103\115")
return rigs and rigs:FindFirstChild(LocalPlayer.Name) or nil
end)
local rig=rigOk and rigProbe or nil
if rig and rig:FindFirstChild("\072\101\097\100") then
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\072\101\097\100\108\101\115\115\058\032\114\105\103\032\102\111\117\110\100\032\043\032\072\101\097\100\032\112\097\114\116\032\079\075")
else
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\072\101\097\100\108\101\115\115\058\032\114\105\103\032\102\111\117\110\100\032\043\032\072\101\097\100\032\112\097\114\116\032\070\065\073\076\069\068\032\040\114\105\103\032\097\098\115\101\110\116\032\098\101\116\119\101\101\110\032\114\111\117\110\100\115\063\041")
end
local meshOk,meshErr=pcall(function()
local probe=IN("\067\104\097\114\097\099\116\101\114\077\101\115\104")
probe.BodyPart=Enum.BodyPart.RightLeg
probe.MeshId=101851696
probe.OverlayTextureId=101851254
probe.BaseTextureId=0
probe:Destroy()
end)
if rig and meshOk then
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\075\111\114\098\108\111\120\058\032\114\105\103\032\043\032\114\101\097\108\032\067\104\097\114\097\099\116\101\114\077\101\115\104\032\100\097\116\097\032\079\075")
else
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\075\111\114\098\108\111\120\058\032\114\105\103\032\043\032\114\101\097\108\032\067\104\097\114\097\099\116\101\114\077\101\115\104\032\100\097\116\097\032\070\065\073\076\069\068\032\040"
..(not rig and "\114\105\103\032\097\098\115\101\110\116" or tostring(meshErr)).."\041")
end
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\080\104\097\115\101\032\051\058\032"..#Catalog.emotes.."\032\101\109\111\116\101\115\044\032"
..#Catalog.unusuals.."\032\117\110\117\115\117\097\108\115\032\105\110\032\099\097\116\097\108\111\103\032\040\114\117\110\116\105\109\101\032\115\099\097\110\041")
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\082\069\083\085\076\084\058\032"..(allOk and "\065\076\076\032\083\089\083\084\069\077\083\032\079\075" or "\070\065\073\076\085\082\069\083\032\068\069\084\069\067\084\069\068\032\045\032\115\101\101\032\108\105\110\101\115\032\097\098\111\118\101"))
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
if withNotification then
notify(
"\071\104\111\115\116\032\077\101\116\104\111\100\032\045\032\115\101\108\102\045\116\101\115\116",
allOk and "\065\108\108\032\109\111\100\117\108\101\115\032\079\075\046\032\070\117\108\108\032\114\101\112\111\114\116\032\112\114\105\110\116\101\100\032\116\111\032\099\111\110\115\111\108\101\032\040\070\057\041\046"
or "\070\097\105\108\117\114\101\115\032\100\101\116\101\099\116\101\100\046\032\070\117\108\108\032\114\101\112\111\114\116\032\112\114\105\110\116\101\100\032\116\111\032\099\111\110\115\111\108\101\032\040\070\057\041\046",
7
)
end
pcall(function()
local lines={"\071\104\111\115\116\032\077\101\116\104\111\100\032\115\101\108\102\045\116\101\115\116\032\064\032"..os.date("\037\089\045\037\109\045\037\100\032\037\072\058\037\077\058\037\083")}
for _,mod in ipairs(Modules) do
table.insert(lines,string.format("\037\045\049\052\115\032\037\115\037\115",mod.Name,
mod.lastTestOk and "\079\075" or "\070\065\073\076\069\068",
(mod.lastTestOk==false and mod.lastTestReason) and("\032\045\032"..tostring(mod.lastTestReason)) or ""))
end
table.insert(lines,"\099\097\116\097\108\111\103\115\058\032"..#Catalog.emotes.."\032\101\109\111\116\101\115\044\032"..#Catalog.unusuals.."\032\117\110\117\115\117\097\108\115")
writefile("\071\077\095\115\101\108\102\116\101\115\116\046\116\120\116",table.concat(lines,"\010"))
end)
return allOk
end
unloadGhost=function()
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\085\078\076\079\065\068\073\078\071\032\045\032\119\105\112\105\110\103\032\101\118\101\114\121\032\099\111\110\110\101\099\116\105\111\110\032\097\110\100\032\105\110\115\116\097\110\099\101\046\046\046")
if gmSaveConfig then
gmSaveConfig()
end
for _,mod in ipairs(Modules) do
pcall(mod.disable)
end
pcall(function()
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
pcall(function()
zzV1.uiSoundSetEnabled(false)
end)
GM_ENV["\095\095\071\072\079\083\084\095\077\069\084\072\079\068\095\065\067\084\073\086\069"]=nil
GM_ENV["\071\072\079\083\084\095\077\069\084\072\079\068\095\076\079\065\068\069\068"]=nil
print("\091\071\104\111\115\116\032\077\101\116\104\111\100\093\032\032\085\110\108\111\097\100\101\100\032\099\108\101\097\110\108\121\046\032\071\117\097\114\100\032\102\108\097\103\115\032\099\108\101\097\114\101\100\032\045\032\115\097\102\101\032\116\111\032\114\101\045\101\120\101\099\117\116\101\046")
print("\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061\061")
end
if fadeSplash then
fadeSplash()
end
markStep("\098\111\111\116\032\099\111\109\112\108\101\116\101")
end
local okBoot,bootReport=xpcall(body,function(err)
local okT,trace=pcall(debug.traceback,err,2)
if okT and type(trace)=="\115\116\114\105\110\103" and #trace>0 then
return trace
end
return tostring(err)
end)
if not okBoot then
bootCrash(bootReport)
end

