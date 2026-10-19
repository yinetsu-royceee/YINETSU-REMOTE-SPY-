--[[
    YINETSU [REMOTE SPY] — COMPLETE FINAL BUILD
    Sub-tabs sa Remote Spy · Avatar fix · Complete features
]]

--==============================================================
-- SERVICES
--==============================================================
local CG = game:GetService("CoreGui")
local RS = game:GetService("RunService")
local HS = game:GetService("HttpService")
local VU = game:GetService("VirtualUser")
local RStorage = game:GetService("ReplicatedStorage")
local PL = game:GetService("Players")
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LG = game:GetService("Lighting")
local ST = game:GetService("Stats")
local TPS = game:GetService("TeleportService")
local MPS = game:GetService("MarketplaceService")

local LP = PL.LocalPlayer
local cfg = {Intro=1.5, W=1000, H=680, MinW=520, MinH=420, Path="Yinetsu_Logs/settings.json", Dir="Yinetsu_Logs"}

pcall(function()
    local a = CG:FindFirstChild("YinetsuMain"); if a then a:Destroy() end
    local b = CG:FindFirstChild("YinetsuFloat"); if b then b:Destroy() end
end)
getgenv().YinetsuExecuted = true
getgenv().YinetsuUIActive = true

--==============================================================
-- THEMES (15)
--==============================================================
local Themes = {
    Midnight=   {Bg=Color3.fromRGB(14,17,27),   Su=Color3.fromRGB(23,28,42),  Sa=Color3.fromRGB(31,38,55),  Ac=Color3.fromRGB(120,105,255), Aa=Color3.fromRGB(57,210,255),  Tx=Color3.fromRGB(240,243,255), Mu=Color3.fromRGB(157,167,190), Sc=Color3.fromRGB(92,225,160),  Wa=Color3.fromRGB(255,198,92),  Da=Color3.fromRGB(255,100,120)},
    Ocean=      {Bg=Color3.fromRGB(8,23,34),    Su=Color3.fromRGB(14,39,54),  Sa=Color3.fromRGB(20,54,70),  Ac=Color3.fromRGB(45,190,230),  Aa=Color3.fromRGB(74,255,218),  Tx=Color3.fromRGB(232,250,255), Mu=Color3.fromRGB(142,188,203), Sc=Color3.fromRGB(92,225,160),  Wa=Color3.fromRGB(255,198,92),  Da=Color3.fromRGB(255,100,120)},
    Sakura=     {Bg=Color3.fromRGB(33,19,31),   Su=Color3.fromRGB(49,29,47),  Sa=Color3.fromRGB(66,38,60),  Ac=Color3.fromRGB(255,117,180), Aa=Color3.fromRGB(205,144,255), Tx=Color3.fromRGB(255,239,248), Mu=Color3.fromRGB(204,161,190), Sc=Color3.fromRGB(125,231,174), Wa=Color3.fromRGB(255,204,115), Da=Color3.fromRGB(255,105,139)},
    Emerald=    {Bg=Color3.fromRGB(12,25,21),   Su=Color3.fromRGB(20,41,34),  Sa=Color3.fromRGB(28,56,46),  Ac=Color3.fromRGB(59,218,147),  Aa=Color3.fromRGB(167,255,110), Tx=Color3.fromRGB(234,255,243), Mu=Color3.fromRGB(153,193,169), Sc=Color3.fromRGB(92,225,160),  Wa=Color3.fromRGB(255,198,92),  Da=Color3.fromRGB(255,100,120)},
    Sunset=     {Bg=Color3.fromRGB(32,19,26),   Su=Color3.fromRGB(49,29,39),  Sa=Color3.fromRGB(68,39,49),  Ac=Color3.fromRGB(255,126,86),  Aa=Color3.fromRGB(255,194,94),  Tx=Color3.fromRGB(255,242,233), Mu=Color3.fromRGB(207,167,152), Sc=Color3.fromRGB(128,229,153), Wa=Color3.fromRGB(255,202,104), Da=Color3.fromRGB(255,100,120)},
    Violet=     {Bg=Color3.fromRGB(23,15,38),   Su=Color3.fromRGB(37,25,58),  Sa=Color3.fromRGB(50,34,77),  Ac=Color3.fromRGB(173,103,255), Aa=Color3.fromRGB(112,137,255), Tx=Color3.fromRGB(246,238,255), Mu=Color3.fromRGB(184,163,212), Sc=Color3.fromRGB(116,232,170), Wa=Color3.fromRGB(255,198,92),  Da=Color3.fromRGB(255,100,120)},
    Light=      {Bg=Color3.fromRGB(238,242,250),Su=Color3.fromRGB(255,255,255),Sa=Color3.fromRGB(224,231,244),Ac=Color3.fromRGB(91,91,230),   Aa=Color3.fromRGB(0,164,198),   Tx=Color3.fromRGB(30,37,55),    Mu=Color3.fromRGB(102,113,136), Sc=Color3.fromRGB(24,156,99),   Wa=Color3.fromRGB(193,122,0),   Da=Color3.fromRGB(207,49,76)},
    Cyberpunk=  {Bg=Color3.fromRGB(10,4,20),    Su=Color3.fromRGB(20,8,34),   Sa=Color3.fromRGB(32,14,52),  Ac=Color3.fromRGB(255,0,170),   Aa=Color3.fromRGB(0,240,255),   Tx=Color3.fromRGB(240,200,255), Mu=Color3.fromRGB(180,140,200), Sc=Color3.fromRGB(0,255,180),   Wa=Color3.fromRGB(255,220,0),   Da=Color3.fromRGB(255,60,120)},
    Monochrome= {Bg=Color3.fromRGB(18,18,18),   Su=Color3.fromRGB(30,30,30),  Sa=Color3.fromRGB(48,48,48),  Ac=Color3.fromRGB(200,200,200), Aa=Color3.fromRGB(140,140,140), Tx=Color3.fromRGB(240,240,240), Mu=Color3.fromRGB(150,150,150), Sc=Color3.fromRGB(180,220,180), Wa=Color3.fromRGB(230,220,180), Da=Color3.fromRGB(230,160,160)},
    NeonPink=   {Bg=Color3.fromRGB(24,6,18),    Su=Color3.fromRGB(40,10,30),  Sa=Color3.fromRGB(58,16,44),  Ac=Color3.fromRGB(255,20,147),  Aa=Color3.fromRGB(255,120,220), Tx=Color3.fromRGB(255,230,245), Mu=Color3.fromRGB(210,150,190), Sc=Color3.fromRGB(180,255,200), Wa=Color3.fromRGB(255,220,150), Da=Color3.fromRGB(255,80,140)},
    Forest=     {Bg=Color3.fromRGB(14,22,14),   Su=Color3.fromRGB(22,36,22),  Sa=Color3.fromRGB(32,52,32),  Ac=Color3.fromRGB(120,200,90),  Aa=Color3.fromRGB(200,240,120), Tx=Color3.fromRGB(230,245,220), Mu=Color3.fromRGB(150,180,140), Sc=Color3.fromRGB(150,230,120), Wa=Color3.fromRGB(240,220,140), Da=Color3.fromRGB(240,120,120)},
    BloodMoon=  {Bg=Color3.fromRGB(20,4,4),     Su=Color3.fromRGB(34,8,8),    Sa=Color3.fromRGB(52,14,14),  Ac=Color3.fromRGB(220,30,30),   Aa=Color3.fromRGB(255,120,60),  Tx=Color3.fromRGB(255,220,220), Mu=Color3.fromRGB(200,140,140), Sc=Color3.fromRGB(180,220,140), Wa=Color3.fromRGB(255,200,120), Da=Color3.fromRGB(255,80,80)},
    Ice=        {Bg=Color3.fromRGB(12,22,32),   Su=Color3.fromRGB(20,36,52),  Sa=Color3.fromRGB(30,52,72),  Ac=Color3.fromRGB(150,220,255), Aa=Color3.fromRGB(220,240,255), Tx=Color3.fromRGB(230,245,255), Mu=Color3.fromRGB(160,190,210), Sc=Color3.fromRGB(150,230,220), Wa=Color3.fromRGB(255,230,170), Da=Color3.fromRGB(255,140,160)},
    Gold=       {Bg=Color3.fromRGB(24,18,8),    Su=Color3.fromRGB(40,30,14),  Sa=Color3.fromRGB(58,44,22),  Ac=Color3.fromRGB(255,200,60),  Aa=Color3.fromRGB(255,240,160), Tx=Color3.fromRGB(255,245,220), Mu=Color3.fromRGB(200,180,140), Sc=Color3.fromRGB(200,230,130), Wa=Color3.fromRGB(255,200,100), Da=Color3.fromRGB(255,120,100)},
    Pastel=     {Bg=Color3.fromRGB(250,240,245),Su=Color3.fromRGB(255,250,252),Sa=Color3.fromRGB(245,230,240),Ac=Color3.fromRGB(240,140,180), Aa=Color3.fromRGB(150,200,240), Tx=Color3.fromRGB(80,60,80),    Mu=Color3.fromRGB(160,140,160), Sc=Color3.fromRGB(150,210,170), Wa=Color3.fromRGB(240,200,140), Da=Color3.fromRGB(240,120,140)},
}
local themeOrder = {"Midnight","Ocean","Sakura","Emerald","Sunset","Violet","Light","Cyberpunk","Monochrome","NeonPink","Forest","BloodMoon","Ice","Gold","Pastel"}

local Settings = {
    theme="Cyberpunk", animateColors=true, animationSpeed=0.8, animationIntensity=0.4,
    guiScale=0.8, musicId="", musicVolume=0.5,
    musicTracks={}, musicShuffle=true, musicIndex=1,
    musicFavoritesOnly=false, musicRepeat="all",
}
local curName, curThem

pcall(function()
    if not isfolder(cfg.Dir) then makefolder(cfg.Dir) end
    if isfile(cfg.Path) then
        local d = HS:JSONDecode(readfile(cfg.Path))
        for k,v in pairs(d) do Settings[k]=v end
    end
end)

-- Migrate old playlist format to new tracks format
if Settings.musicPlaylist and #Settings.musicPlaylist > 0 and type(Settings.musicPlaylist[1]) == "string" then
    Settings.musicTracks = {}
    for _, id in ipairs(Settings.musicPlaylist) do
        table.insert(Settings.musicTracks, {id=id, name=id, fav=false})
    end
    Settings.musicPlaylist = nil
end
if not Settings.musicTracks then Settings.musicTracks = {} end

-- Apply known phonk names
local knownNames = {
    ["127635921273625"] = "Shiawase (G2961 Remix)",
    ["5409360995"]      = "Shiawase (Tidal Wave VIP)",
    ["81457346687617"]  = "Funk Azulejo",
    ["139266399633943"] = "Lost Phonk",
    ["101101342670886"] = "Dark City Lights Phonk",
    ["119181820374358"] = "Cursed Slowdown",
    ["93316204367148"]  = "SIUU PHONK",
    ["81654436561725"]  = "Flamewall",
    ["118241465317467"] = "CINEMATIC PHONK HORIZON",
    ["86517694279595"]  = "WHAT THE PHONK?",
    ["103415930328599"] = "ELECTRIC PHANTOM",
}
for _, t in ipairs(Settings.musicTracks) do
    -- Update name from known list
    if knownNames[t.id] then
        t.name = knownNames[t.id]
    end
    -- Fallback: "Track N" → ID
    if t.name and t.name:match("^Track %d+$") then
        t.name = t.id
    end
end

-- Seed default tracks if empty
if #Settings.musicTracks == 0 then
    local seedIds = {
        {"127635921273625", "Shiawase (G2961 Remix)"},
        {"5409360995",      "Shiawase (Tidal Wave VIP)"},
        {"81457346687617",  "Funk Azulejo"},
        {"139266399633943", "Lost Phonk"},
        {"101101342670886", "Dark City Lights Phonk"},
        {"119181820374358", "Cursed Slowdown"},
        {"93316204367148",  "SIUU PHONK"},
        {"81654436561725",  "Flamewall"},
        {"118241465317467", "CINEMATIC PHONK HORIZON"},
        {"86517694279595",  "WHAT THE PHONK?"},
        {"103415930328599", "ELECTRIC PHANTOM"},
    }
    for _, t in ipairs(seedIds) do
        table.insert(Settings.musicTracks, {id=t[1], name=t[2], fav=false})
    end
end

curName = (Themes[Settings.theme] and Settings.theme) or "Midnight"
curThem = Themes[curName]

local function saveSettings()
    pcall(function() writefile(cfg.Path, HS:JSONEncode(Settings)) end)
end

--==============================================================
-- REGISTRIES
--==============================================================
local R, A, C = {}, {}, {}
R.chStrokes = {}
local S = {
    selR=nil, selA=nil, multi={}, multiMode=false,
    sched={}, blk={}, blkName={}, spamBlock=false, spamCount={},
    rec=false, recSeq={}, play=false, autoClr=false, loop=false,
    snip=false, modOn=false, negOn=false, mulOn=false,
    cT="", cR="", layoutN=999999999,
    logs={}, queue={}, MAX=300,
    min=false, fpsBoost=false, tp=false, hook=nil,
    start=os.clock(), fps=0, cnt=0, lastFPS=os.clock(),
    sysLog={}, oL={}, oE={}, hue=0, avatarURL=nil,
    fly=false, noclip=false, antiFling=false, rejoinDeath=false,
    fullbright=false,
    savedPos=nil, flyConn=nil, noclipConn=nil,
    autoClick=false, autoClickPos=Vector2.new(0,0), autoClickConn=nil, autoClickSpd=0.1,
    charConn=nil,
    unloading=false,
    musicSound=nil,
    musicId="",
    musicVolume=0.5,
    musicPlaying=false,
    suppressEnded=false,
    shuffleHistory={},
}

local function track(c) table.insert(C,c); return c end
local function reg(i,p,b,a) table.insert(A,{inst=i,prop=p,base=b,anim=a~=false}) end

_G.__yinetsu_applyTheme = function(themeName, animate)
    local newTheme = Themes[themeName]
    if not newTheme then return false end
    local oldTheme = curThem
    local function colKey(c)
        return math.floor(c.R*255)..","..math.floor(c.G*255)..","..math.floor(c.B*255)
    end
    local colorMap = {}
    for key, oldCol in pairs(oldTheme) do
        local newCol = newTheme[key]
        if newCol then colorMap[colKey(oldCol)] = newCol end
    end
    for _, entry in ipairs(A) do
        if entry.inst and entry.inst.Parent then
            local newColor = colorMap[colKey(entry.base)]
            if newColor then
                if animate and entry.anim then
                    pcall(function()
                        TS:Create(entry.inst, TweenInfo.new(0.25), {[entry.prop] = newColor}):Play()
                    end)
                else
                    pcall(function() entry.inst[entry.prop] = newColor end)
                end
                entry.base = newColor
            end
        end
    end
    curName = themeName
    curThem = newTheme
    return true
end

local _yinetsu_instance_count = 0
local function create(cls, props, parent)
    _yinetsu_instance_count = _yinetsu_instance_count + 1
    -- Mag-pause bawat 20 elements para sumingit yung loading bar animation
    if _yinetsu_instance_count % 20 == 0 then
        task.wait()
    end
    local i = Instance.new(cls)
    for k,v in pairs(props or {}) do i[k]=v end
    i.Parent = parent
    return i
end

local function corner(p,r) return create("UICorner",{CornerRadius=UDim.new(0,r or 10)},p) end

local function mkStroke(p, col, thick, trans)
    local s = create("UIStroke",{
        Color=col or curThem.Ac, Thickness=thick or 1.5, Transparency=trans or 0.15,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
    }, p)
    reg(s,"Color",curThem.Ac,true)
    return s
end

local function chromaStroke(p)
    local s = create("UIStroke",{Color=curThem.Ac, Thickness=1.5, Transparency=0.1, ApplyStrokeMode=Enum.ApplyStrokeMode.Border}, p)
    local g = create("UIGradient",{
        Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0,curThem.Ac),
            ColorSequenceKeypoint.new(0.5,curThem.Aa),
            ColorSequenceKeypoint.new(1,curThem.Ac),
        }), Rotation=0,
    }, s)
    table.insert(R.chStrokes, {Stroke=s, Gradient=g})
    reg(s,"Color",curThem.Ac,true)
    return s
end

local function padding(p,l,r,t,b)
    return create("UIPadding",{PaddingLeft=UDim.new(0,l or 0),PaddingRight=UDim.new(0,r or 0),PaddingTop=UDim.new(0,t or 0),PaddingBottom=UDim.new(0,b or 0)},p)
end

local function label(parent,text,size,pos,fs,col)
    local l = create("TextLabel",{
        BackgroundTransparency=1,Text=text,Size=size,Position=pos,
        Font=Enum.Font.Gotham,TextSize=fs or 14,TextColor3=col or curThem.Tx,
        TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,
    }, parent)
    reg(l,"TextColor3",col or curThem.Tx,true)
    return l
end

local function panel(parent,name,size,pos)
    local p = create("Frame",{
        Name=name,Size=size,Position=pos or UDim2.new(),
        BackgroundColor3=curThem.Su,BorderSizePixel=0,
        BackgroundTransparency=0.35,
    }, parent)
    corner(p,12); chromaStroke(p)
    reg(p,"BackgroundColor3",curThem.Su,false)
    return p
end

local function beautify(v, ind, vis)
    ind=ind or 0; vis=vis or {}; if vis[v] then return "recursive_table" end; vis[v]=true
    local sp = string.rep(" ", ind); local t = typeof(v)
    if t=="number" or t=="boolean" then return tostring(v)
    elseif t=="string" then return '"'..v:gsub('"','\\"')..'"'
    elseif t=="Vector3" then return "Vector3.new("..tostring(v)..")"
    elseif t=="Vector2" then return "Vector2.new("..tostring(v)..")"
    elseif t=="CFrame" then return "CFrame.new("..tostring(v)..")"
    elseif t=="Color3" then return "Color3.new("..tostring(v)..")"
    elseif t=="EnumItem" then return tostring(v)
    elseif t=="Instance" then return v:GetFullName()
    elseif t=="table" then
        local s="{\n"; local c=0
        for k,val in next,v do c=c+1; s=s..sp.." ["..beautify(k,ind+1,vis).."] = "..beautify(val,ind+1,vis)..",\n" end
        return c==0 and "{}" or s..sp.."}"
    end
    return "nil"
end

local function v2s(v, vis)
    vis=vis or {}; if vis[v] then return "recursive_table" end; vis[v]=true
    local t = typeof(v)
    if t=="number" or t=="boolean" then return tostring(v)
    elseif t=="string" then return '"'..v:gsub('"','\\"')..'"'
    elseif t=="Vector3" then return "Vector3.new("..tostring(v)..")"
    elseif t=="Vector2" then return "Vector2.new("..tostring(v)..")"
    elseif t=="CFrame" then return "CFrame.new("..tostring(v)..")"
    elseif t=="Color3" then return "Color3.new("..tostring(v)..")"
    elseif t=="EnumItem" then return tostring(v)
    elseif t=="Instance" then return v:GetFullName()
    elseif t=="table" then
        local s="{" for k,val in next,v do s=s.."["..v2s(k,vis).."]="..v2s(val,vis).."," end
        return s.."}"
    end
    return "nil"
end

--==============================================================
-- SYSTEM LOG FUNCTION (early definition)
--==============================================================
_G.addSysLog = function(m, c)
    c = c or "INFO"
    table.insert(S.sysLog, {Time=os.date("%H:%M:%S"), Cat=c, Msg=tostring(m)})
    if #S.sysLog > 250 then table.remove(S.sysLog, 1) end
    if _G.__refSysLog then pcall(_G.__refSysLog) end
end

--==============================================================
-- FLOAT Y BUTTON
--==============================================================
local FUI = create("ScreenGui",{Name="YinetsuFloat",ZIndexBehavior=Enum.ZIndexBehavior.Sibling,ResetOnSpawn=false},CG)
local TB = create("TextButton",{
    Size=UDim2.new(0,56,0,56),Position=UDim2.new(0,12,0.5,0),
    BackgroundColor3=curThem.Bg,Text="",TextColor3=curThem.Tx,
    Font=Enum.Font.GothamBold,TextSize=22,BorderSizePixel=0,AutoButtonColor=false,
},FUI)
corner(TB,10)

local TBImg = create("ImageLabel",{
    Size=UDim2.new(1,0,1,0),
    Position=UDim2.new(0,0,0,0),
    BackgroundTransparency=1,
    Image="rbxassetid://118248260133330",
    ScaleType=Enum.ScaleType.Crop,
    ZIndex=2,
},TB)
corner(TBImg,10)

local TBS = mkStroke(TB,curThem.Ac,2.5,0.05)
reg(TB,"BackgroundColor3",curThem.Bg,false)

local function draggable(obj, h)
    h = h or obj
    local d, ds, sp = false, nil, nil
    track(h.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            d=true; ds=i.Position; sp=obj.Position
        end
    end))
    track(UIS.InputChanged:Connect(function(i)
        if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local dl = i.Position - ds
            obj.Position = UDim2.new(sp.X.Scale,sp.X.Offset+dl.X,sp.Y.Scale,sp.Y.Offset+dl.Y)
        end
    end))
    track(UIS.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d=false end
    end))
end
draggable(TB)

--==============================================================
-- PHASE 6: UI POLISH HELPERS
--==============================================================
-- Fade in/out animations
local function fadeIn(obj, dur)
    dur = dur or 0.25
    if not obj then return end
    obj.BackgroundTransparency = 1
    TS:Create(obj, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
end

local function fadeOut(obj, dur, destroyAfter)
    dur = dur or 0.25
    if not obj then return end
    local tw = TS:Create(obj, TweenInfo.new(dur, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
    tw:Play()
    if destroyAfter then
        tw.Completed:Connect(function()
            if obj and obj.Parent then obj:Destroy() end
        end)
    end
end

-- Slide in animation (from right)
local function slideIn(obj, offsetX, dur)
    dur = dur or 0.3
    offsetX = offsetX or 20
    if not obj then return end
    local targetPos = obj.Position
    obj.Position = UDim2.new(targetPos.X.Scale, targetPos.X.Offset + offsetX, targetPos.Y.Scale, targetPos.Y.Offset)
    obj.BackgroundTransparency = 1
    TS:Create(obj, TweenInfo.new(dur, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = targetPos,
        BackgroundTransparency = 0
    }):Play()
end

-- Scale pulse (for buttons)
local function pulse(obj)
    if not obj then return end
    local origSize = obj.Size
    TS:Create(obj, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
        Size = UDim2.new(origSize.X.Scale, origSize.X.Offset + 6, origSize.Y.Scale, origSize.Y.Offset + 4)
    }):Play()
    task.delay(0.08, function()
        if obj and obj.Parent then
            TS:Create(obj, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = origSize}):Play()
        end
    end)
end

-- Loading spinner (returns connection to stop)
local function makeSpinner(parent, size)
    size = size or 24
    local spinner = create("Frame", {
        Size = UDim2.fromOffset(size, size),
        BackgroundTransparency = 1,
        ZIndex = 200,
    }, parent)

    local ring = create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ZIndex = 201,
    }, spinner)
    local ringCorner = corner(ring, size/2)
    local ringStroke = create("UIStroke", {
        Color = curThem.Ac,
        Thickness = 2,
        Transparency = 0.3,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, ring)

    local dot = create("Frame", {
        Size = UDim2.fromOffset(6, 6),
        Position = UDim2.new(0.5, -3, 0, -3),
        BackgroundColor3 = curThem.Aa,
        BorderSizePixel = 0,
        ZIndex = 202,
    }, ring)
    corner(dot, 3)

    local angle = 0
    local conn = RS.RenderStepped:Connect(function(dt)
        if not spinner or not spinner.Parent then
            conn:Disconnect()
            return
        end
        angle = (angle + dt * 360) % 360
        local rad = math.rad(angle)
        local cx = math.cos(rad) * (size/2 - 3)
        local cy = math.sin(rad) * (size/2 - 3)
        dot.Position = UDim2.new(0.5, cx - 3, 0.5, cy - 3)
    end)

    return spinner, conn
end

-- Error toast with auto-retry
local function notifyError(msg, retryFn)
    notify("❌ "..msg, "error")
    if retryFn then
        task.delay(3, function()
            if R.errorRetry then R.errorRetry(retryFn) end
        end)
    end
end

-- Smooth hover glow for buttons
local function addHoverGlow(btn)
    if not btn then return end
    local glow = create("UIStroke", {
        Color = curThem.Aa,
        Thickness = 0,
        Transparency = 0.5,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, btn)
    track(btn.MouseEnter:Connect(function()
        if btn.Parent then
            TS:Create(glow, TweenInfo.new(0.2), {Thickness = 3, Transparency = 0.2}):Play()
        end
    end))
    track(btn.MouseLeave:Connect(function()
        if btn.Parent then
            TS:Create(glow, TweenInfo.new(0.2), {Thickness = 0, Transparency = 0.5}):Play()
        end
    end))
end

R.fadeIn = fadeIn
R.fadeOut = fadeOut
R.slideIn = slideIn
R.pulse = pulse
R.makeSpinner = makeSpinner
R.addHoverGlow = addHoverGlow

--==============================================================
-- SCREEN + LOADING
--==============================================================
local SG = create("ScreenGui",{Name="YinetsuMain",ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,DisplayOrder=100},CG)
local LF = create("Frame",{Name="LoadingScreen",Size=UDim2.fromScale(1,1),BackgroundColor3=curThem.Bg,BorderSizePixel=0,ZIndex=100},SG)
reg(LF,"BackgroundColor3",curThem.Bg,false)

local LC = create("Frame",{
    Size=UDim2.new(0,440,0,290),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
    BackgroundColor3=curThem.Su,BorderSizePixel=0,ZIndex=101,
},LF)
corner(LC,18); chromaStroke(LC); reg(LC,"BackgroundColor3",curThem.Su,false)

create("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,24,0,22),Size=UDim2.new(1,-48,0,34),Text="YINETSU",Font=Enum.Font.GothamBold,TextSize=28,TextColor3=curThem.Tx,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=102},LC)
create("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,24,0,60),Size=UDim2.new(1,-48,0,22),Text="[REMOTE SPY]",Font=Enum.Font.Gotham,TextSize=12,TextColor3=curThem.Mu,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=102},LC)

-- LOADING AVATAR: Frame with NO fill (transparent) + stroke ring only
local lRing = create("Frame",{
    Size=UDim2.fromOffset(92,92),Position=UDim2.new(0,24,0,108),
    BackgroundTransparency=1,BorderSizePixel=0,ZIndex=102,
},LC)
corner(lRing,46); chromaStroke(lRing)

local LAv = create("ImageLabel",{
    Size=UDim2.fromScale(1,1),BackgroundTransparency=1,
    Image="rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=420&h=420",
    ZIndex=103,
},lRing)
corner(LAv,46)

create("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,136,0,118),Size=UDim2.new(1,-160,0,28),Text=LP.DisplayName,Font=Enum.Font.GothamBold,TextSize=18,TextColor3=curThem.Tx,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=102},LC)
create("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,136,0,148),Size=UDim2.new(1,-160,0,22),Text="@"..LP.Name,Font=Enum.Font.Gotham,TextSize=13,TextColor3=curThem.Mu,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=102},LC)

local LT = create("Frame",{Position=UDim2.new(0,24,1,-58),Size=UDim2.new(1,-48,0,12),BackgroundColor3=curThem.Sa,BorderSizePixel=0,ZIndex=102,ClipsDescendants=true},LC)
corner(LT,6); reg(LT,"BackgroundColor3",curThem.Sa,false)
local LB = create("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=curThem.Ac,BorderSizePixel=0,ZIndex=103},LT)
corner(LB,6) -- Tinanggal yung reg() para tayo na mag-mano sa RGB animation sa baba

local Shim = create("Frame",{Size=UDim2.new(0,80,1,0),Position=UDim2.new(0,-100,0,0),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=0.5,BorderSizePixel=0,ZIndex=104},LT)
create("UIGradient",{Color=ColorSequence.new(Color3.new(1,1,1)),Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0.2),NumberSequenceKeypoint.new(1,1)})},Shim)

task.spawn(function()
    while LT.Parent and LF.Parent do
        Shim.Position = UDim2.new(0,-100,0,0)
        TS:Create(Shim,TweenInfo.new(1.4,Enum.EasingStyle.Linear),{Position=UDim2.new(1,0,0,0)}):Play()
        task.wait(1.4)
    end
end)

local LPct = create("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,24,1,-38),Size=UDim2.new(1,-48,0,22),Text="Initializing... 0%",Font=Enum.Font.Gotham,TextSize=11,TextColor3=curThem.Mu,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=102},LC)

task.spawn(function()
    local ok, img = pcall(function()
        return PL:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if not (ok and type(img) == "string" and #img > 5) then
        img = "https://www.roblox.com/headshot-thumbnail/image?userId="..LP.UserId.."&width=420&height=420&format=png"
    end
    if img and #img > 5 then
        S.avatarURL = img
        -- Loading avatar
        pcall(function() if LAv then LAv.Image = img end end)
        -- Wait for R.setHAvatar to be defined (retry up to 5 seconds)
        local t = 0
        while t < 50 and not R.setHAvatar do
            t = t + 1
            task.wait(0.1)
        end
        -- Apply to header avatar
        if R.setHAvatar then
            pcall(function() R.setHAvatar(img) end)
        end
    end
end)

local guiLoaded = false 
local loadStart = os.clock()
local loadConn

loadConn = RS.RenderStepped:Connect(function(dt)
    if not LF or not LF.Parent then
        if loadConn then loadConn:Disconnect() end
        return
    end

    local p = 0
    if guiLoaded then
        p = 1
    else
        local elementWeight = _yinetsu_instance_count * 1.5
        local timeWeight = (os.clock() - loadStart) * 5
        local totalWeight = elementWeight + timeWeight
        p = 1 - (1 / (1 + (totalWeight / 100)))
    end

    if p >= 1 then
        LPct.Text = "Ready · 100%"
    else
        LPct.Text = string.format("Initializing... %d%%", math.floor(p * 100))
    end

    LB.Size = UDim2.new(p, 0, 1, 0)

    -- SYNCED ANIMATION: Gumagamit ng S.hue (Main GUI) para sabay sila
    if Settings.animateColors then
        local sh = math.sin(S.hue * math.pi * 2) * Settings.animationIntensity
        
        local hLB, sLB, vLB = Color3.toHSV(curThem.Ac)
        LB.BackgroundColor3 = Color3.fromHSV((hLB + sh) % 1, sLB, vLB)
        
        local hLC, sLC, vLC = Color3.toHSV(curThem.Su)
        LC.BackgroundColor3 = Color3.fromHSV((hLC + sh) % 1, sLC, vLC)
        
        local hLT, sLT, vLT = Color3.toHSV(curThem.Sa)
        LT.BackgroundColor3 = Color3.fromHSV((hLT + sh) % 1, sLT, vLT)
        
        local hLF, sLF, vLF = Color3.toHSV(curThem.Bg)
        LF.BackgroundColor3 = Color3.fromHSV((hLF + sh * 0.5) % 1, sLF, vLF)

        for _,it in ipairs(R.chStrokes) do
            if it.Gradient and it.Gradient.Parent then
                it.Gradient.Rotation = (it.Gradient.Rotation + dt * 200) % 360
            end
        end
    end
end)

--==============================================================
-- MAIN WINDOW + TOASTS
--==============================================================
local Main = create("Frame",{
    Name="Main",Size=UDim2.new(0,cfg.W,0,cfg.H),
    Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
    BackgroundColor3=curThem.Bg,BorderSizePixel=0,Visible=false,ClipsDescendants=true,
},SG)
corner(Main,18); reg(Main,"BackgroundColor3",curThem.Bg,false)

-- Main Window Background Image
local MainBgImg = create("ImageLabel",{
    Name="MainBgImg",
    Size=UDim2.new(1,0,1,0),
    Position=UDim2.new(0,0,0,0),
    BackgroundTransparency=1,
    Image="rbxassetid://95060662280839",
    ImageColor3=Color3.fromRGB(255,255,255),
    ImageTransparency=0.4,
    ScaleType=Enum.ScaleType.Crop,
    ZIndex=0,
},Main)
corner(MainBgImg,18)

local MainSC = create("UIScale",{Scale=0.9*Settings.guiScale},Main)

local ToastBox = create("Frame",{Name="Toasts",Size=UDim2.new(0,300,0,400),Position=UDim2.new(1,-316,0,16),BackgroundTransparency=1,ZIndex=200},SG)
create("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top},ToastBox)

local function notify(msg,kind)
    local col = curThem.Ac
    local icon = "ℹ️"
    if kind=="success" then col=curThem.Sc; icon="✅"
    elseif kind=="warn" then col=curThem.Wa; icon="⚠️"
    elseif kind=="error" then col=curThem.Da; icon="❌" end

    local toast = create("Frame",{
        Size=UDim2.new(0,300,0,0),
        Position=UDim2.new(0,20,0,0),
        BackgroundColor3=curThem.Su,
        BackgroundTransparency=1,
        BorderSizePixel=0,
        ClipsDescendants=true,
    },ToastBox)
    corner(toast,10); mkStroke(toast,col,1,0.15)
    reg(toast,"BackgroundColor3",curThem.Su,false)

    create("Frame",{Size=UDim2.new(0,4,1,0),BackgroundColor3=col,BorderSizePixel=0},toast)

    local txt = create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-16,1,0),
        Position=UDim2.new(0,12,0,0),
        Text=msg,
        TextColor3=curThem.Tx,
        Font=Enum.Font.Gotham,
        TextSize=12,
        TextWrapped=true,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Center,
    },toast)
    reg(txt,"TextColor3",curThem.Tx,true)

    -- Slide in + fade in
    TS:Create(toast, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0,300,0,44),
        Position = UDim2.new(0,0,0,0),
        BackgroundTransparency = 0,
    }):Play()

    -- Error toasts shake
    if kind == "error" then
        task.spawn(function()
            task.wait(0.35)
            for i=1,3 do
                if not toast.Parent then return end
                TS:Create(toast, TweenInfo.new(0.05), {Position = UDim2.new(0,6,0,0)}):Play()
                task.wait(0.05)
                TS:Create(toast, TweenInfo.new(0.05), {Position = UDim2.new(0,-6,0,0)}):Play()
                task.wait(0.05)
            end
            if toast.Parent then
                TS:Create(toast, TweenInfo.new(0.08), {Position = UDim2.new(0,0,0,0)}):Play()
            end
        end)
    end

    -- Auto dismiss with slide out
    task.delay(2.5,function()
        if toast and toast.Parent then
            TS:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0,300,0,0),
                Position = UDim2.new(0,20,0,0),
                BackgroundTransparency = 1,
            }):Play()
            task.wait(0.35)
            if toast.Parent then toast:Destroy() end
        end
    end)

    -- Auto-log sa System Log
    if _G.addSysLog then
        local cat = "INFO"
        if kind=="success" then cat="OK"
        elseif kind=="warn" then cat="WARN"
        elseif kind=="error" then cat="ERROR" end
        pcall(_G.addSysLog, msg, cat)
    end
end

--==============================================================
-- HEADER (curved + transparent avatar)
--==============================================================
local Header = create("Frame",{
    Name="Header",Size=UDim2.new(1,0,0,84),
    BackgroundColor3=curThem.Su,BorderSizePixel=0,
},Main)
corner(Header,18); reg(Header,"BackgroundColor3",curThem.Su,false)

-- Cover bottom corners (keep square)
R.headerCover = create("Frame",{Position=UDim2.new(0,0,1,-20),Size=UDim2.new(1,0,0,20),BackgroundColor3=curThem.Su,BorderSizePixel=0,ZIndex=2},Header)
reg(R.headerCover,"BackgroundColor3",curThem.Su,false)

R.titleLbl = create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(0,300,0,30),Position=UDim2.new(0,26,0,14),Text="YINETSU  [REMOTE SPY]",Font=Enum.Font.GothamBold,TextSize=20,TextColor3=curThem.Tx,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=3},Header)

local function getSub()
    local plat = "Mobile"
    pcall(function()
        local p = UIS:GetPlatform()
        if p==Enum.Platform.Android then plat="Android"
        elseif p==Enum.Platform.IOS then plat="iOS"
        elseif p==Enum.Platform.Windows then plat="Windows"
        elseif p==Enum.Platform.OSX then plat="macOS"
        elseif p==Enum.Platform.Linux then plat="Linux"
        else plat = tostring(p):gsub("Enum.Platform%.","") end
    end)
    local ex = ""
    pcall(function() ex = identifyexecutor and identifyexecutor() or "" end)
    if ex=="" then pcall(function() ex = getexecutorname and getexecutorname() or "" end) end
    if ex~="" and ex~=nil then return plat.." · "..tostring(ex) end
    return plat
end
create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(0,400,0,20),Position=UDim2.new(0,26,0,48),Text=getSub(),Font=Enum.Font.Gotham,TextSize=12,TextColor3=curThem.Mu,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=3},Header)

-- HEADER AVATAR: NO FILL anywhere. Only stroke ring + image.
R.hAvR = create("Frame",{
    Size=UDim2.fromOffset(60,60),Position=UDim2.new(0, 320, 0.5, -30),
    BackgroundTransparency=1,BorderSizePixel=0,ZIndex=3,
},Header)
corner(R.hAvR,30); chromaStroke(R.hAvR)

local HAv = create("ImageLabel",{
    Size=UDim2.fromScale(1,1),BackgroundTransparency=1,
    Image="rbxthumb://type=AvatarHeadShot&id="..LP.UserId.."&w=420&h=420",
    ZIndex=4,
},R.hAvR)
corner(HAv,30)

R.setHAvatar = function(img) if HAv and HAv.Parent then HAv.Image = img end end
if S.avatarURL then HAv.Image = S.avatarURL end

R.nameLbl = create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(0,200,0,26),Position=UDim2.new(0, 390, 0.5, -28),Text=LP.DisplayName,Font=Enum.Font.GothamBold,TextSize=15,TextColor3=curThem.Tx,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=3},Header)
R.atNameLbl = create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(0,200,0,20),Position=UDim2.new(0, 390, 0.5, 2),Text="@"..LP.Name,Font=Enum.Font.Gotham,TextSize=11,TextColor3=curThem.Mu,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=3},Header)

-- MAKE MAIN WINDOW DRAGGABLE
draggable(Main, Header)

--==============================================================
-- PREMIUM BUTTON
--==============================================================
local function pBtn(parent, text, size, pos, cb)
    local b = create("TextButton",{
        Size=size,Position=pos,BackgroundColor3=curThem.Sa,
        BorderSizePixel=0,AutoButtonColor=false,Text=text,
        TextColor3=curThem.Tx,Font=Enum.Font.GothamSemibold,
        TextSize=12,TextWrapped=true,
        ClipsDescendants=true,
    },parent)
    corner(b,10); mkStroke(b,curThem.Ac,1.5,0.15)
    reg(b,"BackgroundColor3",curThem.Sa,false); reg(b,"TextColor3",curThem.Tx,true)
    local bs = b.Size

    -- Hover glow stroke
    local glow = create("UIStroke",{
        Color=curThem.Aa,Thickness=0,Transparency=0.6,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
    },b)

    -- Ripple effect container
    local rippleHolder = create("Frame",{
        Size=UDim2.fromScale(1,1),
        BackgroundTransparency=1,
        ClipsDescendants=true,
        ZIndex=b.ZIndex,
    },b)
    corner(rippleHolder,10)

    local function spawnRipple(x, y)
        local ripple = create("Frame",{
            Size=UDim2.fromOffset(0,0),
            Position=UDim2.new(0, x, 0, y),
            AnchorPoint=Vector2.new(0.5,0.5),
            BackgroundColor3=curThem.Tx,
            BackgroundTransparency=0.7,
            BorderSizePixel=0,
            ZIndex=b.ZIndex + 1,
        },rippleHolder)
        corner(ripple,999)
        TS:Create(ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(math.max(b.AbsoluteSize.X, b.AbsoluteSize.Y) * 1.5, math.max(b.AbsoluteSize.X, b.AbsoluteSize.Y) * 1.5),
            BackgroundTransparency = 1,
        }):Play()
        task.delay(0.55, function()
            if ripple and ripple.Parent then ripple:Destroy() end
        end)
    end

    track(b.MouseEnter:Connect(function()
        if b.Parent then
            TS:Create(b,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3=curThem.Ac}):Play()
            TS:Create(glow,TweenInfo.new(0.2),{Thickness=2.5,Transparency=0.2}):Play()
        end
    end))
    track(b.MouseLeave:Connect(function()
        if b.Parent then
            TS:Create(b,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3=curThem.Sa,Size=bs}):Play()
            TS:Create(glow,TweenInfo.new(0.2),{Thickness=0,Transparency=0.6}):Play()
        end
    end))
    track(b.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(bs.X.Scale,bs.X.Offset-3,bs.Y.Scale,bs.Y.Offset-2)}):Play()
            -- Ripple at click position
            local relX = i.Position.X - b.AbsolutePosition.X
            local relY = i.Position.Y - b.AbsolutePosition.Y
            spawnRipple(relX, relY)
        end
    end))
    track(b.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            TS:Create(b,TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out),{Size=bs}):Play()
        end
    end))
    track(b.Activated:Connect(function()
        if cb then local ok, err = pcall(cb); if not ok then print("[Yinetsu]",err) end end
    end))
    return b
end
R.pBtn = pBtn

R.hideBtn = pBtn(Header,"Hide",UDim2.new(0,60,0,36),UDim2.new(1,-76,0.5,-18),function()
    S.min = not S.min
    
    if S.tweenSize then S.tweenSize:Cancel() end
    if S.tweenPos then S.tweenPos:Cancel() end

    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    
    local currentPos = Main.Position
    local currentH = Main.Size.Y.Offset 
    local currentW = Main.Size.X.Offset
    
    local topEdge = currentPos.Y.Offset - (currentH / 2)

    if S.min then
        -- ================= HIDE =================
        for _, v in ipairs(Main:GetChildren()) do
            if v:IsA("GuiObject") and v ~= Header then v.Visible = false end
        end
        R.headerCover.Visible = false
        
        local targetH = 84
        local targetY = topEdge + (targetH / 2)
        
        S.tweenSize = TS:Create(Main, tweenInfo, { Size = UDim2.new(0, currentW, 0, targetH) })
        S.tweenPos = TS:Create(Main, tweenInfo, { Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, targetY) })
        
        S.tweenSize:Play()
        S.tweenPos:Play()
        R.hideBtn.Text = "Show"
        
    else
        -- ================= SHOW =================
        for _, v in ipairs(Main:GetChildren()) do
            if v:IsA("GuiObject") and v ~= Header then v.Visible = true end
        end
        R.headerCover.Visible = true
        
        local vp = workspace.CurrentCamera.ViewportSize
        local targetW = math.clamp(vp.X-30, cfg.MinW, cfg.W)
        local targetH = math.clamp(vp.Y-50, cfg.MinH, cfg.H)
        local targetY = topEdge + (targetH / 2)
        
        S.tweenSize = TS:Create(Main, tweenInfo, { Size = UDim2.new(0, targetW, 0, targetH) })
        S.tweenPos = TS:Create(Main, tweenInfo, { Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, targetY) })
        
        S.tweenSize:Play()
        S.tweenPos:Play()
        R.hideBtn.Text = "Hide"
    end
end)
R.hideBtn.ZIndex = 3
--==============================================================
-- DOTS BUTTON (⋮) — TOGGLE-ABLE QUICK ACTIONS
--==============================================================
R.dotsBtn = pBtn(Header,"...",UDim2.new(0,40,0,36),UDim2.new(1,-136,0.5,-18),function()
    -- TOGGLE: kung bukas na, isara lang
    if R.__dotsMenu and R.__dotsMenu.Parent then
        R.__dotsMenu:Destroy()
        R.__dotsMenu = nil
        R.__dotsOutsideConn = nil
        return
    end

    -- Gumawa ng bagong menu
    local qa = create("Frame",{
        Name = "DotsMenu",
        Size=UDim2.new(0,200,0,0),
        Position=UDim2.new(1,-210,0,84),
        BackgroundColor3=curThem.Su,
        BorderSizePixel=0,
        ZIndex=400,
        AutomaticSize=Enum.AutomaticSize.Y,
    },Main)
    corner(qa,10); chromaStroke(qa)
    reg(qa,"BackgroundColor3",curThem.Su,false)
    padding(qa,8,8,8,8)
    create("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder},qa)

    -- Small fade-in animation
    qa.BackgroundTransparency = 1
    TS:Create(qa, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0,
    }):Play()

    -- Store reference
    R.__dotsMenu = qa

    -- Function to close menu
    local function closeMenu()
        if R.__dotsMenu and R.__dotsMenu.Parent then
            local menu = R.__dotsMenu
            R.__dotsMenu = nil
            local tw = TS:Create(menu, TweenInfo.new(0.15), {BackgroundTransparency = 1})
            tw:Play()
            tw.Completed:Connect(function()
                if menu and menu.Parent then menu:Destroy() end
            end)
        end
        if R.__dotsOutsideConn then
            R.__dotsOutsideConn:Disconnect()
            R.__dotsOutsideConn = nil
        end
    end

    -- ═══ QUICK ACTIONS LIST ═══
local qaActions = {
    {"📁 Open Files", function() closeMenu(); if R.openFM then R.openFM() end end},
    {"💾 Quick Save", function() closeMenu(); if R.quickSave then R.quickSave() end end},
    {"⭐ Recent Files", function() closeMenu(); if R.showRecentFiles then R.showRecentFiles() end end},
    {"🔄 Reload Script", function() closeMenu(); if R.reloadScript then R.reloadScript() end end},
}

    for i,a in ipairs(qaActions) do
        local b = create("TextButton",{
            Size=UDim2.new(1,0,0,32),
            BackgroundColor3=curThem.Sa,
            BorderSizePixel=0,
            Text=a[1],
            TextColor3=curThem.Tx,
            Font=Enum.Font.GothamSemibold,
            TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Left,
            AutoButtonColor=false,
            LayoutOrder=i,
            ZIndex=401,
        },qa)
        corner(b,6); padding(b,10,10,0,0); mkStroke(b,curThem.Ac,1,0.3)
        reg(b,"BackgroundColor3",curThem.Sa,false)
        reg(b,"TextColor3",curThem.Tx,true)

        -- Hover feedback
        track(b.MouseEnter:Connect(function()
            TS:Create(b, TweenInfo.new(0.12), {BackgroundColor3=curThem.Ac}):Play()
        end))
        track(b.MouseLeave:Connect(function()
            TS:Create(b, TweenInfo.new(0.12), {BackgroundColor3=curThem.Sa}):Play()
        end))

        track(b.Activated:Connect(function()
            pcall(a[2])
        end))
    end

    -- ═══ CLICK-OUTSIDE TO CLOSE ═══
    -- Delay para hindi agad ma-trigger ng same click na nag-open
    task.delay(0.1, function()
        R.__dotsOutsideConn = UIS.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or
               input.UserInputType == Enum.UserInputType.Touch then
                local pos = input.Position
                local inMenu = false
                local inBtn = false

                if qa and qa.Parent then
                    local ap = qa.AbsolutePosition
                    local as = qa.AbsoluteSize
                    inMenu = pos.X >= ap.X and pos.X <= ap.X + as.X and
                             pos.Y >= ap.Y and pos.Y <= ap.Y + as.Y
                end

                if R.dotsBtn and R.dotsBtn.Parent then
                    local ap = R.dotsBtn.AbsolutePosition
                    local as = R.dotsBtn.AbsoluteSize
                    inBtn = pos.X >= ap.X and pos.X <= ap.X + as.X and
                            pos.Y >= ap.Y and pos.Y <= ap.Y + as.Y
                end

                if not inMenu and not inBtn then
                    closeMenu()
                end
            end
        end)
    end)
end)
R.dotsBtn.ZIndex = 3

--==============================================================
-- QUICK ACTIONS: Reload Script
--==============================================================
R.reloadScript = function()
    notify("🔄 Reloading script...","info")
    if _G.addSysLog then pcall(_G.addSysLog,"Reload initiated","RELOAD") end
    task.wait(0.5)
    
    -- Try to get current script source via getscriptbytecode (executor-dependent)
    local ok, src = pcall(function()
        if type(getscriptbytecode) == "function" and debug and debug.info then
            -- Use debug.info to find current function
            local s = debug.info(1, "s")
            if s then return s end
        end
        return nil
    end)
    
    if ok and src then
        local fn, err = loadstring(src)
        if fn then
            -- Cleanup first
            pcall(function()
                getgenv().YinetsuUIActive = false
                if R.stopMusic then pcall(R.stopMusic) end
                if SG then SG:Destroy() end
                if FUI then FUI:Destroy() end
                for _,c in ipairs(C) do pcall(function() c:Disconnect() end) end
            end)
            task.wait(0.2)
            local runOk, runErr = pcall(fn)
            if not runOk then
                notify("❌ Reload failed: "..tostring(runErr):sub(1,50),"error")
            end
            return
        end
    end
    
    -- Fallback: tell user to re-execute manually
    notify("⚠️ Auto-reload not supported. Re-execute manually.","warn")
    if _G.addSysLog then pcall(_G.addSysLog,"Reload not supported by executor","WARN") end
end

--==============================================================
-- QUICK ACTIONS: Quick Save
--==============================================================
R.quickSave = function()
    local ok, err = pcall(function()
        -- Save current settings
        Settings.theme = curName
        saveSettings()
        
        -- Save current state snapshot
        local snapPath = cfg.Dir .. "/quicksave_" .. tostring(game.GameId) .. ".json"
        local snapshot = {
            _savedAt = os.date("%Y-%m-%d %H:%M:%S"),
            _gameId = tostring(game.GameId),
            _placeId = tostring(game.PlaceId),
            theme = curName,
            guiScale = Settings.guiScale,
            animationSpeed = Settings.animationSpeed,
            animationIntensity = Settings.animationIntensity,
            animateColors = Settings.animateColors,
            musicVolume = Settings.musicVolume,
            musicTracks = Settings.musicTracks,
            musicIndex = Settings.musicIndex,
            fly = S.fly,
            noclip = S.noclip,
            fullbright = S.fullbright,
        antiFling = S.antiFling,
        savedPos = nil, -- CFrame cannot be serialized to JSON reliably
    }
    writefile(snapPath, HS:JSONEncode(snapshot))
end)
    
    if ok then
        notify("💾 Quick Save: OK","success")
        if _G.addSysLog then pcall(_G.addSysLog,"Quick Save complete","SAVE") end
    else
        notify("❌ Quick Save failed: "..tostring(err):sub(1,50),"error")
    end
end

--==============================================================
-- QUICK ACTIONS: Recent Files
--==============================================================
R.showRecentFiles = function()
    -- Close existing popup
    if R.__recentPopup and R.__recentPopup.Parent then
        R.__recentPopup:Destroy()
        R.__recentPopup = nil
        return
    end
    
    local popup = create("Frame",{
        Name = "RecentFiles",
        Size = UDim2.new(0, 340, 0, 420),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = curThem.Su,
        BorderSizePixel = 0,
        ZIndex = 500,
    }, SG)
    corner(popup, 14); chromaStroke(popup)
    reg(popup, "BackgroundColor3", curThem.Su, false)
    padding(popup, 14, 14, 12, 12)
    R.__recentPopup = popup
    
    -- Title
    create("TextLabel",{
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -40, 0, 24),
        Position = UDim2.new(0, 0, 0, 0),
        Text = "⭐ RECENT FILES",
        TextColor3 = curThem.Aa,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 501,
    }, popup)
    
    -- Close button
    local closeX = create("TextButton",{
        Size = UDim2.fromOffset(28, 28),
        Position = UDim2.new(1, -28, 0, 0),
        BackgroundColor3 = curThem.Da,
        BorderSizePixel = 0,
        Text = "×",
        TextColor3 = curThem.Tx,
        Font = Enum.Font.GothamBold,
        TextSize = 17,
        AutoButtonColor = false,
        ZIndex = 502,
    }, popup)
    corner(closeX, 8)
    closeX.MouseButton1Click:Connect(function()
        if popup and popup.Parent then popup:Destroy(); R.__recentPopup = nil end
    end)
    
    -- Tabs
    local tabRow = create("Frame",{
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 32),
        BackgroundTransparency = 1,
        ZIndex = 501,
    }, popup)
    create("UIListLayout",{
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, tabRow)
    
    local currentTab = "files"
    local contentHolder = create("Frame",{
        Size = UDim2.new(1, 0, 1, -80),
        Position = UDim2.new(0, 0, 0, 70),
        BackgroundColor3 = curThem.Bg,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 501,
    }, popup)
    corner(contentHolder, 10); mkStroke(contentHolder, curThem.Ac, 1, 0.3)
    padding(contentHolder, 6, 6, 6, 6)
    
    local scroll = create("ScrollingFrame",{
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 5,
        ScrollBarImageColor3 = curThem.Ac,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 502,
    }, contentHolder)
    create("UIListLayout",{
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, scroll)
    
    local function refreshTab()
        for _, c in ipairs(scroll:GetChildren()) do
            if c:IsA("TextButton") or c:IsA("TextLabel") or c:IsA("Frame") then
                c:Destroy()
            end
        end
        
        if currentTab == "files" then
            -- List recent saved files
            local baseDir = cfg.Dir .. "/" .. tostring(game.GameId)
            local raw = {}
            pcall(function() raw = listfiles(baseDir) end)
            
            local files = {}
            for _, p in ipairs(raw) do
                local isD = false
                pcall(function() isD = isfolder(p) end)
                if not isD then
                    local name = p:match("([^/\\]+)$") or p
                    if not name:match("^%.") and name ~= "settings.json" then
                        table.insert(files, {path = p, name = name})
                    end
                end
            end
            
            -- Sort by modified time (or name as fallback)
            table.sort(files, function(a,b) return a.name < b.name end)
            
            if #files == 0 then
                create("TextLabel",{
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 40),
                    Text = "No recent files",
                    TextColor3 = curThem.Mu,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    LayoutOrder = 1,
                    ZIndex = 503,
                }, scroll)
            else
                for i, f in ipairs(files) do
                    if i > 30 then break end
                    local row = create("TextButton",{
                        Size = UDim2.new(1, 0, 0, 32),
                        BackgroundColor3 = curThem.Sa,
                        BorderSizePixel = 0,
                        Text = "  📄 " .. f.name,
                        TextColor3 = curThem.Tx,
                        Font = Enum.Font.Gotham,
                        TextSize = 11,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        AutoButtonColor = false,
                        LayoutOrder = i,
                        ZIndex = 503,
                    }, scroll)
                    corner(row, 6); mkStroke(row, curThem.Ac, 1, 0.3)
                    row.MouseButton1Click:Connect(function()
                        local ok, content = pcall(readfile, f.path)
                        if ok and content then
                            pcall(function() setclipboard(content) end)
                            notify("📋 Copied: "..f.name,"success")
                        else
                            notify("❌ Read failed","error")
                        end
                    end)
                end
            end
        elseif currentTab == "search" then
            -- List recent searches
            local histPath = cfg.Dir .. "/history.json"
            local hist = {}
            if isfile(histPath) then
                local ok, h = pcall(function() return HS:JSONDecode(readfile(histPath)) end)
                if ok and type(h) == "table" then hist = h end
            end
            
            if #hist == 0 then
                create("TextLabel",{
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 40),
                    Text = "No search history",
                    TextColor3 = curThem.Mu,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    LayoutOrder = 1,
                    ZIndex = 503,
                }, scroll)
            else
                for i = #hist, math.max(1, #hist - 20), -1 do
                    local h = hist[i]
                    if h then
                        local row = create("TextButton",{
                            Size = UDim2.new(1, 0, 0, 40),
                            BackgroundColor3 = curThem.Sa,
                            BorderSizePixel = 0,
                            Text = "",
                            AutoButtonColor = false,
                            LayoutOrder = (1000 - i),
                            ZIndex = 503,
                        }, scroll)
                        corner(row, 6); mkStroke(row, curThem.Ac, 1, 0.3)
                        
                        create("TextLabel",{
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, -16, 0, 18),
                            Position = UDim2.new(0, 8, 0, 4),
                            Text = "🔍 " .. tostring(h.query or "?"),
                            TextColor3 = curThem.Tx,
                            Font = Enum.Font.GothamSemibold,
                            TextSize = 11,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 504,
                        }, row)
                        
                        create("TextLabel",{
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, -16, 0, 16),
                            Position = UDim2.new(0, 8, 0, 20),
                            Text = tostring(h.type or "?") .. " · " .. tostring(h.count or 0) .. " results · " .. tostring(h.date or "") .. " " .. tostring(h.time or ""),
                            TextColor3 = curThem.Mu,
                            Font = Enum.Font.Gotham,
                            TextSize = 9,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 504,
                        }, row)
                        
                        row.MouseButton1Click:Connect(function()
                            if R.aiInputBox then
                                R.aiInputBox.Text = tostring(h.query or "")
                                if R.aiSendBtn then pcall(function() R.aiSendBtn:Activate() end) end
                            end
                            if popup and popup.Parent then popup:Destroy(); R.__recentPopup = nil end
                        end)
                    end
                end
            end
        elseif currentTab == "quicksave" then
            -- Show quicksave info
            local snapPath = cfg.Dir .. "/quicksave_" .. tostring(game.GameId) .. ".json"
            if isfile(snapPath) then
                local ok, data = pcall(function() return HS:JSONDecode(readfile(snapPath)) end)
                if ok and data then
                    local infoFrame = create("Frame",{
                        Size = UDim2.new(1, 0, 0, 200),
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        ZIndex = 503,
                    }, scroll)
                    
                    local lines = {
                        "💾 Quick Save Snapshot",
                        "",
                        "📅 Saved: " .. tostring(data._savedAt or "?"),
                        "🎮 Place: " .. tostring(data._placeId or "?"),
                        "🎨 Theme: " .. tostring(data.theme or "?"),
                        "⚙️ GUI Scale: " .. tostring(data.guiScale or "?"),
                        "🎵 Tracks: " .. #(data.musicTracks or {}),
                        "✈️ Fly: " .. (data.fly and "ON" or "OFF"),
                        "🚫 Noclip: " .. (data.noclip and "ON" or "OFF"),
                        "💡 Fullbright: " .. (data.fullbright and "ON" or "OFF"),
                    }
                    
                    for i, line in ipairs(lines) do
                        create("TextLabel",{
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 0, 18),
                            Position = UDim2.new(0, 0, 0, (i-1) * 18),
                            Text = line,
                            TextColor3 = i == 1 and curThem.Aa or curThem.Tx,
                            Font = i == 1 and Enum.Font.GothamBold or Enum.Font.Gotham,
                            TextSize = 11,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 504,
                        }, infoFrame)
                    end
                    
                    -- Load button
                    local loadBtn = create("TextButton",{
                        Size = UDim2.new(1, 0, 0, 34),
                        Position = UDim2.new(0, 0, 0, 210),
                        BackgroundColor3 = curThem.Sc,
                        BorderSizePixel = 0,
                        Text = "📂 Load Snapshot",
                        TextColor3 = curThem.Tx,
                        Font = Enum.Font.GothamBold,
                        TextSize = 11,
                        AutoButtonColor = false,
                        LayoutOrder = 2,
                        ZIndex = 503,
                    }, scroll)
                    corner(loadBtn, 6); mkStroke(loadBtn, curThem.Ac, 1.2, 0.2)
                    loadBtn.MouseButton1Click:Connect(function()
                        if data.theme and Themes[data.theme] then
                            _G.__yinetsu_applyTheme(data.theme, true)
                        end
                        if data.guiScale then
                            Settings.guiScale = data.guiScale
                            if MainSC then MainSC.Scale = data.guiScale end
                        end
                        saveSettings()
                        notify("✅ Snapshot loaded","success")
                        if popup and popup.Parent then popup:Destroy(); R.__recentPopup = nil end
                    end)
                else
                    create("TextLabel",{
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 40),
                        Text = "❌ Invalid snapshot file",
                        TextColor3 = curThem.Da,
                        Font = Enum.Font.Gotham,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        LayoutOrder = 1,
                        ZIndex = 503,
                    }, scroll)
                end
            else
                create("TextLabel",{
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 40),
                    Text = "No quicksave yet",
                    TextColor3 = curThem.Mu,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    LayoutOrder = 1,
                    ZIndex = 503,
                }, scroll)
            end
        end
    end
    
    -- Create tabs
    local tabs = {
        {"files", "📄 Files"},
        {"search", "🔍 Searches"},
        {"quicksave", "💾 Quicksave"},
    }
    
    for i, t in ipairs(tabs) do
        local btn = create("TextButton",{
            Size = UDim2.new(0.32, 0, 1, 0),
            BackgroundColor3 = (t[1] == currentTab) and curThem.Ac or curThem.Sa,
            BorderSizePixel = 0,
            Text = t[2],
            TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamSemibold,
            TextSize = 10,
            AutoButtonColor = false,
            LayoutOrder = i,
            ZIndex = 502,
        }, tabRow)
        corner(btn, 6); mkStroke(btn, curThem.Ac, 1.2, 0.2)
        btn.MouseButton1Click:Connect(function()
            currentTab = t[1]
            for _, c in ipairs(tabRow:GetChildren()) do
                if c:IsA("TextButton") then
                    -- Match by name attribute
                end
            end
            -- Reset all tab colors
local btnIdx = 0
for _, child in ipairs(tabRow:GetChildren()) do
    if child:IsA("TextButton") then
        btnIdx = btnIdx + 1
        child.BackgroundColor3 = (btnIdx == i) and curThem.Ac or curThem.Sa
    end
end
            refreshTab()
        end)
    end
    
    refreshTab()
end

--==============================================================
-- NAV
--==============================================================
local Nav = create("Frame",{Position=UDim2.new(0,14,0,98),Size=UDim2.new(0,180,1,-112),BackgroundColor3=curThem.Su,BorderSizePixel=0},Main)
corner(Nav,14); chromaStroke(Nav); reg(Nav,"BackgroundColor3",curThem.Su,false)
Nav.BackgroundTransparency = 0.3

local NavS = create("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=curThem.Ac,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y},Nav)
padding(NavS,10,8,12,12)
create("UIListLayout",{Padding=UDim.new(0,8),SortOrder=Enum.SortOrder.LayoutOrder},NavS)

local Cont = create("Frame",{Position=UDim2.new(0,208,0,98),Size=UDim2.new(1,-222,1,-112),BackgroundTransparency=1,BorderSizePixel=0},Main)

local Pages = {}
local function mkPage(n)
    local pg = create("ScrollingFrame",{
        Name=n,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,
        ScrollBarThickness=6,ScrollBarImageColor3=curThem.Ac,
        CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false,
    },Cont)
    padding(pg,4,10,4,20)
    create("UIListLayout",{Padding=UDim.new(0,12),SortOrder=Enum.SortOrder.LayoutOrder},pg)
    Pages[n]=pg
    return pg
end

local function showPage(n)
    for k,v in pairs(Pages) do
        if k == n then
            v.Visible = true
            -- Fade + slide in animation
            v.BackgroundTransparency = 1
            local origPos = v.Position
            v.Position = UDim2.new(origPos.X.Scale, origPos.X.Offset + 15, origPos.Y.Scale, origPos.Y.Offset)
            TS:Create(v, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = origPos,
                BackgroundTransparency = 1, -- scrolling frames stay transparent
            }):Play()
        else
            v.Visible = false
        end
    end
    for _,c in ipairs(NavS:GetChildren()) do
        if c:IsA("TextButton") then
            local sel = c:GetAttribute("P")==n
            TS:Create(c,TweenInfo.new(0.18),{BackgroundColor3=sel and curThem.Ac or curThem.Sa}):Play()
        end
    end
    if _G.addSysLog then pcall(_G.addSysLog,"Page: "..n,"NAV") end
end

local function navBtn(t,p,o)
    local b = pBtn(NavS,t,UDim2.new(1,0,0,46),UDim2.new(),function() showPage(p) end)
    b.LayoutOrder=o; b:SetAttribute("P",p)
    return b
end

local P = {
    Overview=mkPage("Overview"),
    AI=mkPage("AI"),
    Spy=mkPage("Spy"),
    Editor=mkPage("Editor"),
    Cheats=mkPage("Cheats"),Utilities=mkPage("Utilities"),Theme=mkPage("Themes"),
    Music=mkPage("Music"),
    Perf=mkPage("Performance"),Settings=mkPage("Settings"),Social=mkPage("Social"),
}

navBtn("Overview","Overview",1)
navBtn("Yinetsu AI","AI",2)
navBtn("Remote Spy","Spy",3)
navBtn("Editor","Editor",3)
navBtn("Cheats","Cheats",4)
navBtn("Utilities","Utilities",5)
navBtn("Themes","Themes",6)
navBtn("Music","Music",7)
navBtn("Performance","Performance",8)
navBtn("Settings","Settings",9)
navBtn("Social","Social",10)

--==============================================================
-- OVERVIEW
--==============================================================
do
    local wp = panel(P.Overview,"WelcomePanel",UDim2.new(1,-6,0,160),UDim2.new())
    padding(wp,18,18,14,14)
    label(wp,"Welcome back, "..LP.DisplayName,UDim2.new(1,0,0,30),UDim2.new(),20,curThem.Tx).Font=Enum.Font.GothamBold
    label(wp,"Remote spy · editor · cheats · performance monitor",UDim2.new(1,0,0,24),UDim2.new(0,0,0,38),13,curThem.Mu)
    label(wp,"Place ID: "..tostring(game.PlaceId).."  ·  Game ID: "..tostring(game.GameId),UDim2.new(1,0,0,22),UDim2.new(0,0,0,68),12,curThem.Aa)
    R.gameNameLbl = label(wp,"Current game: Loading...",UDim2.new(1,0,0,22),UDim2.new(0,0,0,94),13,curThem.Sc)
    label(wp,"Active theme: "..curName,UDim2.new(1,0,0,22),UDim2.new(0,0,0,122),12,curThem.Aa)

    task.spawn(function()
        task.wait(1)
        local gname = "Place "..tostring(game.PlaceId)
        local ok, info = pcall(function()
            return MPS:GetProductInfo(tonumber(game.PlaceId), Enum.InfoType.Asset)
        end)
        if ok and type(info) == "table" then
            local n = info.Name
            if type(n) == "string" and #n > 0 and n ~= "MarketplaceService" then
                gname = n
            end
        end
        if R.gameNameLbl and R.gameNameLbl.Parent then
            R.gameNameLbl.Text = "Current game: "..gname
        end
    end)

    local statP = panel(P.Overview,"StatusPanel",UDim2.new(1,-6,0,118),UDim2.new())
    padding(statP,18,18,14,14)
    label(statP,"SESSION STATUS",UDim2.new(1,0,0,24),UDim2.new(),13,curThem.Aa)
    label(statP,"Hook active · Monitoring remotes",UDim2.new(1,0,0,26),UDim2.new(0,0,0,32),15,curThem.Sc)
    R.SessClock = label(statP,"Session: 00:00:00",UDim2.new(1,0,0,22),UDim2.new(0,0,0,66),12,curThem.Mu)

    local fpsP = panel(P.Overview,"FPSCard",UDim2.new(1,-6,0,90),UDim2.new())
    padding(fpsP,18,18,12,12)
    label(fpsP,"CURRENT FPS",UDim2.new(0.5,0,0,22),UDim2.new(),12,curThem.Mu)
    R.HomeFPS = label(fpsP,"--",UDim2.new(0.5,0,0,38),UDim2.new(0,0,0,24),26,curThem.Tx)
    R.HomeFPS.Font = Enum.Font.GothamBold
    label(fpsP,"Client rendering rate",UDim2.new(0.5,0,0,24),UDim2.new(0.5,0,0.5,-12),12,curThem.Mu)

    -- Mini Music Player Card
local musicP = panel(P.Overview,"MusicCard",UDim2.new(1,-6,0,130),UDim2.new())
padding(musicP,18,18,14,14)
label(musicP,"NOW PLAYING",UDim2.new(1,0,0,22),UDim2.new(),12,curThem.Aa)

R.musicTrackLbl = label(musicP,"ID: (none)",UDim2.new(1,0,0,22),UDim2.new(0,0,0,32),13,curThem.Tx)
R.musicVolLbl = label(musicP,"Volume: 0.5",UDim2.new(1,0,0,20),UDim2.new(0,0,0,58),11,curThem.Mu)
R.musicStatusLbl = label(musicP,"Status: Stopped",UDim2.new(1,0,0,20),UDim2.new(0,0,0,80),11,curThem.Sc)

task.spawn(function()
    while getgenv().YinetsuUIActive and SG.Parent do
if R.musicTrackLbl and R.musicTrackLbl.Parent
   and R.musicVolLbl and R.musicVolLbl.Parent
   and R.musicStatusLbl and R.musicStatusLbl.Parent then
    local t = Settings.musicTracks and Settings.musicTracks[Settings.musicIndex]
    local id = (t and t.id) or ""
    R.musicTrackLbl.Text = "ID: " .. (id ~= "" and id or "(none)")
    R.musicVolLbl.Text = "Volume: " .. string.format("%.2f", Settings.musicVolume or 0.5)
            if R.musicSound then
                if R.musicSound.IsPlaying then
                    R.musicStatusLbl.Text = "Status: ▶ Playing"
                    R.musicStatusLbl.TextColor3 = curThem.Sc
                elseif R.musicSound.IsPaused then
                    R.musicStatusLbl.Text = "Status: ⏸ Paused"
                    R.musicStatusLbl.TextColor3 = curThem.Wa
                else
                    R.musicStatusLbl.Text = "Status: ⏹ Stopped"
                    R.musicStatusLbl.TextColor3 = curThem.Mu
                end
            end
        end
        task.wait(0.3)
    end
  end)
end
--==============================================================
-- REMOTE SPY PAGE (WITH SUB-TABS)
--==============================================================
do
    -- Search bar (always visible)
    R.SearchBar = create("TextBox",{
        Size=UDim2.new(1,0,0,42),BackgroundColor3=curThem.Sa,BorderSizePixel=0,
        PlaceholderText="Search remote name...",PlaceholderColor3=curThem.Mu,
        Text="",TextColor3=curThem.Tx,ClearTextOnFocus=false,
        Font=Enum.Font.Gotham,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,
    },P.Spy)
    corner(R.SearchBar,10); padding(R.SearchBar,14,14,0,0); mkStroke(R.SearchBar,curThem.Ac,1.5,0.15)
    reg(R.SearchBar,"BackgroundColor3",curThem.Sa,false)

    -- Quick actions row (always visible)
    local qRow = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},P.Spy)
    create("UIListLayout",{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},qRow)
    R.bScanAll = pBtn(qRow,"Scan All",UDim2.new(0,110,0,42),UDim2.new(),nil)
    R.bClear = pBtn(qRow,"Clear",UDim2.new(0,90,0,42),UDim2.new(),nil)
    R.bSniper = pBtn(qRow,"Sniper",UDim2.new(0,100,0,42),UDim2.new(),nil)
    R.bCopyAll = pBtn(qRow,"Copy All",UDim2.new(0,110,0,42),UDim2.new(),nil)
    R.bScanAll.LayoutOrder=1; R.bClear.LayoutOrder=2; R.bSniper.LayoutOrder=3; R.bCopyAll.LayoutOrder=4
    R.RemCount = label(qRow,"0 remotes",UDim2.new(0,100,0,42),UDim2.new(),13,curThem.Mu)
    R.RemCount.TextXAlignment=Enum.TextXAlignment.Right
    R.RemCount.LayoutOrder=5

    -- Remote list + Code view (always visible)
    local splitRow = create("Frame",{Size=UDim2.new(1,0,0,240),BackgroundTransparency=1},P.Spy)

    R.RemScroll = create("ScrollingFrame",{
        Size=UDim2.new(0.5,-5,1,0),BackgroundColor3=curThem.Su,BorderSizePixel=0,
        ScrollBarThickness=5,ScrollBarImageColor3=curThem.Ac,
        CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
    },splitRow)
    corner(R.RemScroll,12); chromaStroke(R.RemScroll); reg(R.RemScroll,"BackgroundColor3",curThem.Su,false)
    padding(R.RemScroll,8,8,8,8)
    create("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},R.RemScroll)

    local CodeCont = create("Frame",{
        Size=UDim2.new(0.5,-5,1,0),Position=UDim2.new(0.5,5,0,0),
        BackgroundColor3=curThem.Bg,BorderSizePixel=0,
    },splitRow)
    corner(CodeCont,12); chromaStroke(CodeCont); reg(CodeCont,"BackgroundColor3",curThem.Bg,false)

    local CodeScr = create("ScrollingFrame",{
        Size=UDim2.new(1,-14,1,-14),Position=UDim2.new(0,7,0,7),
        BackgroundTransparency=1,ScrollBarThickness=4,ScrollBarImageColor3=curThem.Aa,
        CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.XY,
    },CodeCont)
    R.CodeView = create("TextBox",{
        Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
        Text="-- Select a remote to view its args.",
        TextColor3=curThem.Aa,Font=Enum.Font.Code,TextSize=12,MultiLine=true,
        ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Top,TextEditable=false,
        AutomaticSize=Enum.AutomaticSize.XY,
    },CodeScr)

    -- SUB-TABS navigation
    local SubTabBar = create("Frame",{Size=UDim2.new(1,0,0,40),BackgroundTransparency=1},P.Spy)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},SubTabBar)

    -- Sub-tab content containers
    local SubPages = {}
    local function mkSub(name)
        local pg = create("Frame",{
            Name=name,Size=UDim2.new(1,-6,0,0),BackgroundTransparency=1,
            AutomaticSize=Enum.AutomaticSize.Y,Visible=false,
        },P.Spy)
        create("UIListLayout",{Padding=UDim.new(0,10),SortOrder=Enum.SortOrder.LayoutOrder},pg)
        SubPages[name]=pg
        return pg
    end

local function showSub(n)
    for k,v in pairs(SubPages) do
        if k == n then
            v.Visible = true
            -- Fade in
            for _, child in ipairs(v:GetDescendants()) do
                if child:IsA("GuiObject") and child.BackgroundTransparency < 1 then
                    local origT = child.BackgroundTransparency
                    child.BackgroundTransparency = 1
                    TS:Create(child, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                        BackgroundTransparency = origT,
                    }):Play()
                end
            end
        else
            v.Visible = false
        end
    end
    for _,c in ipairs(SubTabBar:GetChildren()) do
        if c:IsA("TextButton") then
            local sel = c:GetAttribute("S")==n
            TS:Create(c,TweenInfo.new(0.15),{BackgroundColor3=sel and curThem.Ac or curThem.Sa}):Play()
        end
    end
end

    local function subBtn(t,n,o)
        local b = pBtn(SubTabBar,t,UDim2.new(0,140,0,40),UDim2.new(),function() showSub(n) end)
        b.LayoutOrder=o; b:SetAttribute("S",n)
        return b
    end

    -- Sub-tab: ACTIONS
    local ActionsSub = mkSub("Actions")

    -- Sub-tab: INFO
    local InfoSub = mkSub("Info")

    -- Sub-tab: FILTERS
    local FiltersSub = mkSub("Filters")

    -- Sub-tab: LOOP & SPAM
    local LoopSpamSub = mkSub("LoopSpam")

    -- CREATE sub-tab buttons
    local subActions = subBtn("Actions","Actions",1)
    local subInfo = subBtn("Remote Info","Info",2)
    local subFilters = subBtn("Filters","Filters",3)
    local subLoopSpam = subBtn("Loop & Spam","LoopSpam",4)

    -- Populate ACTIONS
    local actRow = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},ActionsSub)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},actRow)

    pBtn(actRow,"Run",UDim2.new(0,100,0,42),UDim2.new(),function()
        if S.multiMode then
            for _,d in pairs(S.multi) do
                task.spawn(function()
                    pcall(function()
                        if d.remote and d.remote.Parent then
                            if d.remote.ClassName=="RemoteEvent" then d.remote:FireServer(unpack(d.args))
                            else d.remote:InvokeServer(unpack(d.args)) end
                        end
                    end)
                end)
            end
        elseif S.selR and S.selR.Parent then
            pcall(function()
                if S.selR.ClassName=="RemoteEvent" then S.selR:FireServer(unpack(S.selA))
                else S.selR:InvokeServer(unpack(S.selA)) end
            end)
        end
        notify("Fired","success")
    end).LayoutOrder=1

    pBtn(actRow,"Copy",UDim2.new(0,100,0,42),UDim2.new(),function()
        setclipboard(R.CodeView.Text); notify("Copied","success")
    end).LayoutOrder=2

    pBtn(actRow,"Multi",UDim2.new(0,100,0,42),UDim2.new(),function()
        S.multiMode = not S.multiMode
        if not S.multiMode then S.multi={}; R.CodeView.Text="" end
        notify("Multi: "..(S.multiMode and "ON" or "OFF"),"info")
    end).LayoutOrder=3

    pBtn(actRow,"Clear Multi",UDim2.new(0,120,0,42),UDim2.new(),function()
        S.multi = {}; R.CodeView.Text = ""; notify("Multi cleared","info")
    end).LayoutOrder=4

    local actRow2 = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},ActionsSub)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},actRow2)

pBtn(actRow2,"Save File",UDim2.new(0,110,0,42),UDim2.new(),function()
    if #S.multi>0 then
        local formatted = {}
        for _, v in ipairs(S.multi) do
            table.insert(formatted, {
                name = v.remote.Name,
                path = v.remote:GetFullName(),
                args = v.args,
                id = tostring(v.remote)
            })
        end
        R.openSaveDialog(formatted, "remotes", "Remotes")
    else notify("No multi selected","warn") end
end).LayoutOrder=1

pBtn(actRow2,"Make Script",UDim2.new(0,130,0,42),UDim2.new(),function()
    local seq = S.recSeq
    if #seq == 0 then
        if S.selR and S.selR.Parent then
            seq = {{remote = S.selR, args = S.selA}}
        else
            notify("Nothing recorded or selected","warn")
            return
        end
    end
    local f = "-- [[ YINETSU GENERATED ]]\n\nwhile task.wait(0.1) do\n"
    for _,it in ipairs(seq) do
        local a = v2s(it.args)
        local cl = (it.remote.ClassName=="RemoteEvent" and "FireServer" or "InvokeServer")
        f = f..string.format("    game:GetService('ReplicatedStorage').%s:%s(unpack(%s))\n",it.remote.Name,cl,a)
    end
    f = f.."end"
    setclipboard(f); notify("Script copied","success")
end).LayoutOrder=2

    pBtn(actRow2,"Run All Logs",UDim2.new(0,140,0,42),UDim2.new(),function()
        local l = {}
        for _,e in pairs(S.logs) do
            if e.remote and e.remote.Parent then table.insert(l,{remote=e.remote,args=e.args}) end
        end
        for i,it in ipairs(l) do
            pcall(function()
                if it.remote.ClassName=="RemoteEvent" then it.remote:FireServer(unpack(it.args))
                else it.remote:InvokeServer(unpack(it.args)) end
            end)
            if i%10==0 then task.wait() end
        end
        notify("Ran "..#l,"success")
    end).LayoutOrder=3

    -- Populate INFO
    local infoRow = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},InfoSub)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},infoRow)

    pBtn(infoRow,"Copy Path",UDim2.new(0,110,0,42),UDim2.new(),function()
        if S.selR and S.selR.Parent then setclipboard(S.selR:GetFullName()); notify("Path copied","success")
        else notify("No remote selected","warn") end
    end).LayoutOrder=1

    pBtn(infoRow,"Get Script",UDim2.new(0,110,0,42),UDim2.new(),function()
        if S.selR and S.selR.Parent then setclipboard("-- Script for: "..S.selR.Name.."\n"..R.CodeView.Text); notify("Copied","success")
        else notify("No remote","warn") end
    end).LayoutOrder=2

    pBtn(infoRow,"Func Info",UDim2.new(0,110,0,42),UDim2.new(),function()
        if S.selR and S.selR.Parent then
            R.CodeView.Text = "-- YINETSU REMOTE INFO --\nName: "..S.selR.Name.."\nPath: "..S.selR:GetFullName().."\nClass: "..S.selR.ClassName.."\nArgs: "..#S.selA
            notify("Info shown","success")
        else notify("No remote","warn") end
    end).LayoutOrder=3

    local infoRow2 = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},InfoSub)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},infoRow2)

    pBtn(infoRow2,"Decompiler+",UDim2.new(0,130,0,42),UDim2.new(),function()
        if S.selR and S.selR.Parent then
            local gen = "-- [[ GENERATED BY YINETSU ]]\n\n"
            gen = gen.."local Remote = "..S.selR:GetFullName().."\n"
            gen = gen.."local args = "..beautify(S.selA).."\n\n"
            gen = gen.."Remote:"..(S.selR.ClassName=="RemoteEvent" and "FireServer" or "InvokeServer").."(unpack(args))\n"
            R.CodeView.Text = gen; notify("Decompiled","success")
        else notify("No remote","warn") end
    end).LayoutOrder=1

    -- Populate FILTERS
    local filtRow = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},FiltersSub)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder},filtRow)

    pBtn(filtRow,"Exclude (i)",UDim2.new(0,115,0,42),UDim2.new(),function()
        if S.selR then S.blk[S.selR]=true; notify("Excluded (i)","success") else notify("No remote","warn") end
    end).LayoutOrder=1
    pBtn(filtRow,"Exclude (n)",UDim2.new(0,115,0,42),UDim2.new(),function()
        if S.selR then S.blkName[S.selR.Name]=true; notify("Excluded (n)","success") else notify("No remote","warn") end
    end).LayoutOrder=2
    pBtn(filtRow,"Block (i)",UDim2.new(0,110,0,42),UDim2.new(),function()
        if S.selR then S.blk[S.selR]=true; notify("Blocked (i)","success") else notify("No remote","warn") end
    end).LayoutOrder=3
    pBtn(filtRow,"Block (n)",UDim2.new(0,110,0,42),UDim2.new(),function()
        if S.selR then S.blkName[S.selR.Name]=true; notify("Blocked (n)","success") else notify("No remote","warn") end
    end).LayoutOrder=4

    local gP = panel(FiltersSub,"GuardPanel",UDim2.new(1,-6,0,130),UDim2.new())
    padding(gP,18,18,12,12)
    label(gP,"GUARD / FILTERS",UDim2.new(1,0,0,22),UDim2.new(),13,curThem.Aa)
    label(gP,"Block spammy remotes and clear blacklists.",UDim2.new(1,0,0,18),UDim2.new(0,0,0,26),11,curThem.Mu).TextWrapped=true

    R.ab1 = pBtn(gP,"Block Spam",UDim2.new(0.32,0,0,44),UDim2.new(0,0,0,58),nil)
    pBtn(gP,"Reset Filters",UDim2.new(0.32,0,0,44),UDim2.new(0.34,0,0,58),function()
        S.blk={}; S.blkName={}; notify("Filters cleared","success")
    end)
    R.ab3 = pBtn(gP,"Clear Remotes",UDim2.new(0.32,0,0,44),UDim2.new(0.68,0,0,58),nil)

    R.ab1.Activated:Connect(function()
        S.spamBlock = not S.spamBlock
        R.ab1.Text = S.spamBlock and "Anti-Spam: ON" or "Block Spam"
    end)
    R.ab3.Activated:Connect(function()
        for _,v in pairs(R.RemScroll:GetChildren()) do
            if v:IsA("TextButton") then v:Destroy() end
        end
        S.logs={}; S.queue={}; S.layoutN=999999999
        R.RemCount.Text = "0 remotes"; notify("Cleared","success")
    end)

    -- Populate LOOP & SPAM
    local loopRow = create("Frame",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1},LoopSpamSub)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},loopRow)

    R.bLoop = pBtn(loopRow,"Loop Fire",UDim2.new(0,120,0,42),UDim2.new(),nil); R.bLoop.LayoutOrder=1
    R.LoopSpd = create("TextBox",{Size=UDim2.new(0,70,0,42),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="0.1",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},loopRow)
    corner(R.LoopSpd,8); mkStroke(R.LoopSpd,curThem.Ac,1.5,0.15); reg(R.LoopSpd,"BackgroundColor3",curThem.Sa,false); R.LoopSpd.LayoutOrder=2

    R.bLoopClr = pBtn(loopRow,"Loop Clr",UDim2.new(0,120,0,42),UDim2.new(),nil); R.bLoopClr.LayoutOrder=3
    R.ClrSpd = create("TextBox",{Size=UDim2.new(0,70,0,42),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="1.0",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},loopRow)
    corner(R.ClrSpd,8); mkStroke(R.ClrSpd,curThem.Ac,1.5,0.15); reg(R.ClrSpd,"BackgroundColor3",curThem.Sa,false); R.ClrSpd.LayoutOrder=4

    R.bLoop.Activated:Connect(function()
        S.loop = not S.loop; R.bLoop.Text = S.loop and "STOP" or "Loop Fire"
        if S.loop then
            task.spawn(function()
                while S.loop and getgenv().YinetsuUIActive do
                    if S.multiMode then
                        for _,d in pairs(S.multi) do
                            task.spawn(function()
                                pcall(function()
                                    if d.remote and d.remote.Parent then
                                        if d.remote.ClassName=="RemoteEvent" then d.remote:FireServer(unpack(d.args))
                                        else d.remote:InvokeServer(unpack(d.args)) end
                                    end
                                end)
                            end)
                        end
                    elseif S.selR and S.selR.Parent then
                        pcall(function()
                            if S.selR.ClassName=="RemoteEvent" then S.selR:FireServer(unpack(S.selA))
                            else S.selR:InvokeServer(unpack(S.selA)) end
                        end)
                    end
                    task.wait(tonumber(R.LoopSpd.Text) or 0.1)
                end
            end)
        end
    end)

    R.bLoopClr.Activated:Connect(function()
        S.autoClr = not S.autoClr; R.bLoopClr.Text = S.autoClr and "STOP" or "Loop Clr"
        if S.autoClr then
            task.spawn(function()
                while S.autoClr and getgenv().YinetsuUIActive do
                    for _,v in pairs(R.RemScroll:GetChildren()) do
                        if v:IsA("TextButton") then v:Destroy() end
                    end
                    S.logs={}; S.queue={}; S.layoutN=999999999
                    R.RemCount.Text = "0 remotes"
                    task.wait(tonumber(R.ClrSpd.Text) or 1.0)
                end
            end)
        end
    end)

    -- Spam Tool panel
    local spP = panel(LoopSpamSub,"SpamPanel",UDim2.new(1,-6,0,200),UDim2.new())
    padding(spP,18,18,14,14)
    label(spP,"SPAM TOOL",UDim2.new(1,0,0,22),UDim2.new(),13,curThem.Aa)
    label(spP,"Parallel fire — all calls sent in the same tick when delay = 0.",UDim2.new(1,0,0,18),UDim2.new(0,0,0,26),11,curThem.Mu).TextWrapped=true

    local spRow = create("Frame",{Size=UDim2.new(1,0,0,62),Position=UDim2.new(0,0,0,54),BackgroundTransparency=1},spP)

    local function inputF(parent,t,def)
        local w = create("Frame",{Size=UDim2.new(0.32,0,0,62),BackgroundTransparency=1},parent)
        create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),Text=t,TextColor3=curThem.Mu,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left},w)
        local b = create("TextBox",{Size=UDim2.new(1,0,0,38),Position=UDim2.new(0,0,0,22),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text=tostring(def),TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=13,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},w)
        corner(b,8); padding(b,12,12,0,0); mkStroke(b,curThem.Ac,1.5,0.15); reg(b,"BackgroundColor3",curThem.Sa,false)
        return w, b
    end

    local scW, scB = inputF(spRow,"Count","50"); scW.Position=UDim2.new(0,0,0,0)
    local sdW, sdB = inputF(spRow,"Delay (seconds)","0"); sdW.Position=UDim2.new(0.34,0,0,0)
    R.spamTgt = create("TextLabel",{Size=UDim2.new(0.32,0,0,62),Position=UDim2.new(0.68,0,0,0),BackgroundTransparency=1,Text="(no remote)",TextColor3=curThem.Aa,Font=Enum.Font.Gotham,TextSize=11,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center},spRow)

    pBtn(spP,"SPAM NOW",UDim2.new(1,0,0,46),UDim2.new(0,0,0,132),function()
        local cnt = math.clamp(tonumber(scB.Text) or 50,1,10000)
        local dly = math.clamp(tonumber(sdB.Text) or 0,0,60)
        local tg = {}
        if S.multiMode and #S.multi>0 then
            for _,d in pairs(S.multi) do
                if d.remote and d.remote.Parent then table.insert(tg,{remote=d.remote,args=d.args}) end
            end
        elseif S.selR and S.selR.Parent then
            table.insert(tg,{remote=S.selR,args=S.selA})
        end
        if #tg==0 then notify("No remote selected","warn"); return end
        notify("Spamming "..cnt.."x (delay "..dly.."s)","info")
        task.spawn(function()
            for _=1,cnt do
                for _,t in ipairs(tg) do
                    task.spawn(function()
                        pcall(function()
                            if t.remote.ClassName=="RemoteEvent" then t.remote:FireServer(unpack(t.args))
                            else t.remote:InvokeServer(unpack(t.args)) end
                        end)
                    end)
                end
                if dly>0 then task.wait(dly) end
            end
            notify("Done "..cnt.."x","success")
        end)
    end)

    -- DEFAULT SUB-TAB
    showSub("Actions")
end

--==============================================================
-- YINETSU AI CHAT TAB (TRUE AI COMMAND SYSTEM · MULTI-LANG)
--==============================================================
do
    local TextService = game:GetService("TextService")
    local AI_ENDPOINT = "https://yinetsu-ai.vercel.app/api/chat"
    local chatHistory = {}
    local isWaiting = false

    --==========================================================
    -- ACTION REGISTRY
    --==========================================================
    local function findPlayer(name)
        name = tostring(name):lower()
        for _, p in ipairs(PL:GetPlayers()) do
            if p ~= LP and (p.Name:lower():find(name, 1, true) or p.DisplayName:lower():find(name, 1, true)) then
                return p
            end
        end
        return nil
    end

local function pressBtn(btn)
    if not btn then return false, "no button" end
    -- Method 1: firesignal
    if type(firesignal) == "function" then
        local ok = pcall(firesignal, btn.Activated)
        if ok then return true, "firesignal" end
    end
    -- Method 2: getconnections fallback
    if type(getconnections) == "function" then
        local ok, conns = pcall(getconnections, btn.Activated)
        if ok and type(conns) == "table" and #conns > 0 then
            for _, conn in ipairs(conns) do
                pcall(function()
                    if type(conn) == "table" and conn.Fire then
                        conn:Fire()
                    end
                end)
                return true, "getconnections"
            end
        end
    end
    return false, "no method available"
end

local function toggleCheat(stateKey, want, btn, name)
    if not btn then return "❌ "..name..": button missing" end
    if S[stateKey] == want then
        return name..": already "..(want and "ON" or "OFF")
    end
    local before = S[stateKey]
    local ok, method = pressBtn(btn)
    if not ok then
        return "❌ "..name.." failed ("..tostring(method)..")"
    end
    -- Wait for state change (max 1.5s)
    local timeout = 0
    while S[stateKey] == before and timeout < 30 do
        task.wait(0.05)
        timeout = timeout + 1
    end
    if S[stateKey] == before then
        return "❌ "..name.." didn't toggle via "..tostring(method)
    end
    return "✅ "..name..": "..(want and "ON" or "OFF")
end

local function doSearch(query, searchType)
    local ok, resp = pcall(function()
        local url = "https://yinetsu-ai.vercel.app/api/search?q="..HS:UrlEncode(query).."&type="..searchType
        return game:HttpGet(url, true)
    end)
    if not ok or not resp or resp == "" then
        return "❌ Search failed (network)"
    end
    local decodeOk, data = pcall(function() return HS:JSONDecode(resp) end)
    if not decodeOk or not data or not data.results then
        return "❌ Invalid response"
    end
    local count = data.count or 0
    if count == 0 then return "🔍 No results for: "..query end

    local icons = { web = "🌐", audio = "🎵", game = "🎮", user = "👤" }
    local srcBadge = ""
    if data.source == "tavily" then srcBadge = " 🔍"
    elseif data.source == "wikipedia" then srcBadge = " 📖"
    elseif data.source == "duckduckgo" then srcBadge = " 🦆"
    end
    local out = (icons[searchType] or "🔍").." **"..string.upper(searchType).." Search:** "..query..srcBadge.."\n\n"

    for i, r in ipairs(data.results) do
        if searchType == "audio" then
            out = out .. "**"..i..". "..(r.name or "Untitled").."**\n"
            out = out .. "ID: `"..(r.id or "?").."` · by "..(r.creator or "Unknown").."\n"
        elseif searchType == "game" then
            out = out .. "**"..i..". "..(r.name or "Untitled").."**\n"
            out = out .. "by "..(r.creator or "Unknown").." · 👥 "..(r.playing or 0).."\n"
        elseif searchType == "user" then
            out = out .. "**"..i..". "..(r.displayName or r.name).."** (@"..(r.name or "?")..")\n"
        else
            out = out .. "**"..i..". "..(r.title or "Result").."**\n"
            if r.snippet and r.snippet ~= "" then
                local snip = r.snippet
                if #snip > 220 then snip = snip:sub(1,220).."..." end
                out = out .. snip.."\n"
            end
            if r.url and r.url ~= "" then
                out = out .. "🔗 "..r.url.."\n"
            end
        end
        out = out .. "\n"
    end
    return out
end

-- ============================================
-- PHASE 2: SMART RESULT CARDS
-- ============================================
S.lastResults = nil
S.selectMode = false
S.selectedResults = {}
S.currentResultHandlers = {}

local function sanitizeFileName(name, fallback)
    local n = tostring(name or ""):gsub("[^%w_%-%. ]", ""):gsub("%s+", "_")
    n = n:gsub("_+", "_"):gsub("^_+", ""):gsub("_+$", "")
    if n == "" then n = fallback or "Result" end
    if #n > 45 then n = n:sub(1, 45) end
    return n
end

R.openSaveDialog = function(results, searchType, defaultPrefix)
    local dialogPath = {}
    local selected = {}
    local itemCheckboxes = {}
    local useCustomName = false
    for i = 1, #results do selected[i] = true end

    local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(800,600)
    local popupW = math.min(340, vp.X - 30)
    local popupH = 360

    local popup = create("Frame", {
        Size = UDim2.fromOffset(popupW, popupH),
        Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = curThem.Su, BorderSizePixel = 0, ZIndex = 700,
    }, SG)
    corner(popup, 12); chromaStroke(popup); reg(popup, "BackgroundColor3", curThem.Su, false)
    padding(popup, 10, 10, 8, 8)

    -- TITLE
    create("TextLabel", {
        BackgroundTransparency=1, Size=UDim2.new(1,-36,0,18), Position=UDim2.new(0,0,0,0),
        Text="💾 SAVE "..#results,
        TextColor3=curThem.Aa, Font=Enum.Font.GothamBold, TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=701,
    }, popup)

    local closeX = create("TextButton", {
        Size=UDim2.fromOffset(20,20), Position=UDim2.new(1,-20,0,0),
        BackgroundColor3=curThem.Da, BorderSizePixel=0, Text="×", TextColor3=curThem.Tx,
        Font=Enum.Font.GothamBold, TextSize=13, AutoButtonColor=false, ZIndex=702,
    }, popup)
    corner(closeX, 5); mkStroke(closeX, curThem.Ac, 1, 0.2)
    closeX.MouseButton1Click:Connect(function() popup:Destroy() end)

    -- ALL / NONE row
    local selAllRow = create("Frame", {
        Size=UDim2.new(1,0,0,22), Position=UDim2.new(0,0,0,22),
        BackgroundTransparency=1, ZIndex=701,
    }, popup)
    create("UIListLayout", {Padding=UDim.new(0,4), FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder, VerticalAlignment=Enum.VerticalAlignment.Center}, selAllRow)

    local selectAllBtn = create("TextButton", {
        Size=UDim2.new(0.33,0,1,0), BackgroundColor3=curThem.Sc, BorderSizePixel=0,
        Text="✅ All", TextColor3=curThem.Tx, Font=Enum.Font.GothamSemibold, TextSize=9,
        AutoButtonColor=false, LayoutOrder=1, ZIndex=702,
    }, selAllRow)
    corner(selectAllBtn, 4); mkStroke(selectAllBtn, curThem.Ac, 1, 0.2)

    local selectNoneBtn = create("TextButton", {
        Size=UDim2.new(0.33,0,1,0), BackgroundColor3=curThem.Sa, BorderSizePixel=0,
        Text="✖ None", TextColor3=curThem.Tx, Font=Enum.Font.GothamSemibold, TextSize=9,
        AutoButtonColor=false, LayoutOrder=2, ZIndex=702,
    }, selAllRow)
    corner(selectNoneBtn, 4); mkStroke(selectNoneBtn, curThem.Ac, 1, 0.2)

    local selCountLbl = create("TextLabel", {
        Size=UDim2.new(0.3,0,1,0), BackgroundTransparency=1,
        Text=#results.."", TextColor3=curThem.Aa,
        Font=Enum.Font.GothamBold, TextSize=9, TextXAlignment=Enum.TextXAlignment.Right,
        TextYAlignment=Enum.TextYAlignment.Center, LayoutOrder=3, ZIndex=702,
    }, selAllRow)

    -- ITEMS LIST
    local itemsListHolder = create("Frame", {
        Size=UDim2.new(1,0,0,100), Position=UDim2.new(0,0,0,48),
        BackgroundColor3=curThem.Bg, BackgroundTransparency=0.3,
        BorderSizePixel=0, ZIndex=701,
    }, popup)
    corner(itemsListHolder, 6); mkStroke(itemsListHolder, curThem.Sc, 1, 0.3)

    local itemsList = create("ScrollingFrame", {
        Size=UDim2.new(1,-6,1,-6), Position=UDim2.new(0,3,0,3),
        BackgroundTransparency=1, BorderSizePixel=0,
        ScrollBarThickness=3, ScrollBarImageColor3=curThem.Ac,
        CanvasSize=UDim2.new(0,0,0,0), AutomaticCanvasSize=Enum.AutomaticSize.Y,
        ZIndex=702,
    }, itemsListHolder)
    create("UIListLayout", {Padding=UDim.new(0,2), SortOrder=Enum.SortOrder.LayoutOrder}, itemsList)

    local function getDisplayName(r, idx)
        if searchType == "audio" then return (r.name or "Audio #"..idx)
        elseif searchType == "game" then return (r.name or "Game #"..idx)
        elseif searchType == "user" then return "@"..(r.name or "user"..idx)
        elseif searchType == "script" then return (r.title or "Script #"..idx)
        else return (r.title or "Result #"..idx)
        end
    end

    -- Convert display name to safe filename
    local function sanitizeFileName(name, fallback)
        local n = tostring(name or "")
        n = n:gsub("[^%w%s_%-%.]", "")
        n = n:gsub("%s+", "_")
        n = n:gsub("_+", "_")
        n = n:gsub("^_+", ""):gsub("_+$", "")
        if #n > 40 then n = n:sub(1, 40) end
        if n == "" then n = fallback or "File" end
        return n
    end

    local function updateSelCount()
        local cnt = 0
        for _ in pairs(selected) do cnt = cnt + 1 end
        selCountLbl.Text = cnt..""
        return cnt
    end

    for i, r in ipairs(results) do
        local row = create("TextButton", {
            Size=UDim2.new(1,-4,0,24),
            BackgroundColor3=selected[i] and curThem.Ac or curThem.Sa,
            BackgroundTransparency=selected[i] and 0.3 or 0.1,
            BorderSizePixel=0, Text="", AutoButtonColor=false,
            LayoutOrder=i, ZIndex=703,
        }, itemsList)
        corner(row, 4)
        if selected[i] then mkStroke(row, curThem.Aa, 1.2, 0) end

        local cb = create("TextLabel", {
            Size=UDim2.fromOffset(16,16), Position=UDim2.new(0,4,0.5,-8),
            BackgroundColor3=selected[i] and curThem.Sc or curThem.Sa,
            BorderSizePixel=0, Text=selected[i] and "✓" or "",
            TextColor3=Color3.new(1,1,1), Font=Enum.Font.GothamBold, TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Center, TextYAlignment=Enum.TextYAlignment.Center,
            ZIndex=704,
        }, row)
        corner(cb, 3); mkStroke(cb, curThem.Ac, 1, 0.2)

        create("TextLabel", {
            Size=UDim2.new(1,-28,1,0), Position=UDim2.new(0,24,0,0),
            BackgroundTransparency=1, Text=i..". "..getDisplayName(r, i),
            TextColor3=curThem.Tx, Font=Enum.Font.Gotham, TextSize=9,
            TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Center,
            TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=704,
        }, row)

        itemCheckboxes[i] = { row = row, cb = cb }

        row.MouseButton1Click:Connect(function()
            selected[i] = not selected[i]
            local on = selected[i]
            row.BackgroundColor3 = on and curThem.Ac or curThem.Sa
            row.BackgroundTransparency = on and 0.3 or 0.1
            cb.BackgroundColor3 = on and curThem.Sc or curThem.Sa
            cb.Text = on and "✓" or ""
            local st = row:FindFirstChildOfClass("UIStroke")
            if on then
                if not st then
                    create("UIStroke", {Color=curThem.Aa, Thickness=1.2, Transparency=0,
                        ApplyStrokeMode=Enum.ApplyStrokeMode.Border}, row)
                end
            else
                if st then st:Destroy() end
            end
            updateSelCount()
        end)
    end

    selectAllBtn.MouseButton1Click:Connect(function()
        for i = 1, #results do selected[i] = true end
        for i, h in pairs(itemCheckboxes) do
            h.row.BackgroundColor3 = curThem.Ac
            h.row.BackgroundTransparency = 0.3
            h.cb.BackgroundColor3 = curThem.Sc
            h.cb.Text = "✓"
            if not h.row:FindFirstChildOfClass("UIStroke") then
                create("UIStroke", {Color=curThem.Aa, Thickness=1.2, Transparency=0,
                    ApplyStrokeMode=Enum.ApplyStrokeMode.Border}, h.row)
            end
        end
        updateSelCount()
    end)

    selectNoneBtn.MouseButton1Click:Connect(function()
        selected = {}
        for i, h in pairs(itemCheckboxes) do
            h.row.BackgroundColor3 = curThem.Sa
            h.row.BackgroundTransparency = 0.1
            h.cb.BackgroundColor3 = curThem.Sa
            h.cb.Text = ""
            local st = h.row:FindFirstChildOfClass("UIStroke")
            if st then st:Destroy() end
        end
        updateSelCount()
    end)

    -- PATH LABEL
    local pathLbl = create("TextLabel", {
        BackgroundTransparency=1, Size=UDim2.new(1,0,0,10),
        Position=UDim2.new(0,0,0,152),
        Text="📁 /", TextColor3=curThem.Aa, Font=Enum.Font.Code,
        TextSize=8, TextXAlignment=Enum.TextXAlignment.Left,
        TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=701,
    }, popup)

    -- FOLDER LIST
    local folderList = create("ScrollingFrame", {
        Size=UDim2.new(1,0,0,36), Position=UDim2.new(0,0,0,166),
        BackgroundColor3=curThem.Bg, BackgroundTransparency=0.3,
        BorderSizePixel=0, ScrollBarThickness=3,
        ScrollBarImageColor3=curThem.Ac, CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y, ZIndex=701,
    }, popup)
    corner(folderList, 5); mkStroke(folderList, curThem.Ac, 1, 0.4)
    padding(folderList, 4, 4, 4, 4)
    create("UIListLayout", {Padding=UDim.new(0,2), SortOrder=Enum.SortOrder.LayoutOrder}, folderList)

    -- NAV ROW
    local navRow = create("Frame", {
        Size=UDim2.new(1,0,0,22), Position=UDim2.new(0,0,0,208),
        BackgroundTransparency=1, ZIndex=701,
    }, popup)
    create("UIListLayout", {Padding=UDim.new(0,4), FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder}, navRow)

    local backBtn = create("TextButton", {
        Size=UDim2.new(0.32,0,1,0), BackgroundColor3=curThem.Sa,
        BorderSizePixel=0, Text="←", TextColor3=curThem.Tx,
        Font=Enum.Font.GothamSemibold, TextSize=11, AutoButtonColor=false,
        LayoutOrder=1, ZIndex=702,
    }, navRow)
    corner(backBtn, 4); mkStroke(backBtn, curThem.Ac, 1, 0.3)

    local newFolderBtn = create("TextButton", {
        Size=UDim2.new(0.32,0,1,0), BackgroundColor3=curThem.Sc,
        BorderSizePixel=0, Text="+ 📁", TextColor3=curThem.Tx,
        Font=Enum.Font.GothamSemibold, TextSize=11, AutoButtonColor=false,
        LayoutOrder=2, ZIndex=702,
    }, navRow)
    corner(newFolderBtn, 4); mkStroke(newFolderBtn, curThem.Ac, 1, 0.3)

    local homeBtn = create("TextButton", {
        Size=UDim2.new(0.32,0,1,0), BackgroundColor3=curThem.Sa,
        BorderSizePixel=0, Text="🏠", TextColor3=curThem.Tx,
        Font=Enum.Font.GothamSemibold, TextSize=11, AutoButtonColor=false,
        LayoutOrder=3, ZIndex=702,
    }, navRow)
    corner(homeBtn, 4); mkStroke(homeBtn, curThem.Ac, 1, 0.3)

    -- CUSTOM NAME INPUT (optional override)
    local prefixBox = create("TextBox", {
        Size=UDim2.new(1,0,0,24), Position=UDim2.new(0,0,0,236),
        BackgroundColor3=curThem.Sa, BorderSizePixel=0,
        Text="",
        PlaceholderText="Custom name (optional — leave blank for auto)",
        PlaceholderColor3=curThem.Mu,
        TextColor3=curThem.Tx, ClearTextOnFocus=false, Font=Enum.Font.Gotham, TextSize=10,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=701,
    }, popup)
    corner(prefixBox, 5); padding(prefixBox, 8, 8, 0, 0)
    mkStroke(prefixBox, curThem.Ac, 1, 0.4); reg(prefixBox, "BackgroundColor3", curThem.Sa, false)

    -- Detect custom name typing
    prefixBox:GetPropertyChangedSignal("Text"):Connect(function()
        useCustomName = (#prefixBox.Text > 0)
    end)

    -- FOLDER REFRESH
    local function refreshFolderList()
        for _, c in ipairs(folderList:GetChildren()) do
            if c:IsA("TextButton") or c:IsA("Frame") or c:IsA("TextLabel") then c:Destroy() end
        end
        pathLbl.Text = #dialogPath == 0 and ("📁 / (Yinetsu_Logs/"..tostring(game.GameId)..")") or ("📁 /"..table.concat(dialogPath,"/"))
        local baseDir = cfg.Dir .. "/" .. tostring(game.GameId)
        local curDir = baseDir
        if #dialogPath > 0 then curDir = baseDir .. "/" .. table.concat(dialogPath, "/") end
        if not isfolder(curDir) then pcall(function() makefolder(curDir) end) end
        local raw = {}; pcall(function() raw = listfiles(curDir) end)
        local folders = {}
        for _, p in pairs(raw) do
            local isD = false; pcall(function() isD = isfolder(p) end)
            if isD then
                local n = p:match("([^/\\]+)$")
                if n and not n:match("^_") then table.insert(folders, n) end
            end
        end
        table.sort(folders)

        for i, name in ipairs(folders) do
            local btn = create("TextButton", {
                Size=UDim2.new(1,0,0,18), BackgroundColor3=curThem.Sa,
                BorderSizePixel=0, Text="📁 "..name, TextColor3=curThem.Tx,
                Font=Enum.Font.Gotham, TextSize=9, TextXAlignment=Enum.TextXAlignment.Left,
                AutoButtonColor=false, LayoutOrder=i, ZIndex=702,
            }, folderList)
            corner(btn, 4); padding(btn, 6, 6, 0, 0)
            btn.MouseButton1Click:Connect(function() table.insert(dialogPath, name); refreshFolderList() end)
        end
        if #folders == 0 then
            create("TextLabel", {
                Size=UDim2.new(1,0,0,18), BackgroundTransparency=1,
                Text="(tap 🏠 for root)", TextColor3=curThem.Mu,
                Font=Enum.Font.Gotham, TextSize=9, TextXAlignment=Enum.TextXAlignment.Left,
                LayoutOrder=1, ZIndex=702,
            }, folderList)
        end
    end

    backBtn.MouseButton1Click:Connect(function() if #dialogPath > 0 then table.remove(dialogPath); refreshFolderList() end end)
    homeBtn.MouseButton1Click:Connect(function() dialogPath = {}; refreshFolderList() end)

    -- NEW FOLDER DIALOG
    newFolderBtn.MouseButton1Click:Connect(function()
        local np = create("Frame", {
            Size=UDim2.fromOffset(240,120), Position=UDim2.fromScale(0.5,0.5),
            AnchorPoint=Vector2.new(0.5,0.5), BackgroundColor3=curThem.Su,
            BorderSizePixel=0, ZIndex=800,
        }, SG)
        corner(np, 10); chromaStroke(np); reg(np, "BackgroundColor3", curThem.Su, false)

        create("TextLabel", {
            BackgroundTransparency=1, Size=UDim2.new(1,-20,0,20), Position=UDim2.new(0,10,0,8),
            Text="📁 NEW FOLDER", TextColor3=curThem.Aa,
            Font=Enum.Font.GothamBold, TextSize=11,
            TextXAlignment=Enum.TextXAlignment.Center, ZIndex=801,
        }, np)

        local nb = create("TextBox", {
            Size=UDim2.new(1,-20,0,28), Position=UDim2.new(0,10,0,32),
            BackgroundColor3=curThem.Sa, BorderSizePixel=0, Text="NewFolder",
            TextColor3=curThem.Tx, ClearTextOnFocus=false, Font=Enum.Font.Gotham,
            TextSize=10, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=801,
        }, np)
        corner(nb, 5); padding(nb, 8, 8, 0, 0); mkStroke(nb, curThem.Ac, 1, 0.4)

        local cb = create("TextButton", {
            Size=UDim2.new(0.45,0,0,26), Position=UDim2.new(0.03,0,1,-36),
            BackgroundColor3=curThem.Sc, BorderSizePixel=0, Text="✓",
            TextColor3=curThem.Tx, Font=Enum.Font.GothamSemibold, TextSize=11,
            AutoButtonColor=false, ZIndex=801,
        }, np)
        corner(cb, 5); mkStroke(cb, curThem.Ac, 1.2, 0.2)
        cb.MouseButton1Click:Connect(function()
            local n = nb.Text:gsub("[^%w_%-%s]", ""):gsub("%s+", "_")
            if n == "" then n = "NewFolder" end
            local baseDir = cfg.Dir .. "/" .. tostring(game.GameId)
            local curDir = baseDir
            if #dialogPath > 0 then curDir = baseDir .. "/" .. table.concat(dialogPath, "/") end
            pcall(function() makefolder(curDir .. "/" .. n) end)
            np:Destroy(); refreshFolderList()
        end)

        local xb = create("TextButton", {
            Size=UDim2.new(0.45,0,0,26), Position=UDim2.new(0.52,0,1,-36),
            BackgroundColor3=curThem.Da, BorderSizePixel=0, Text="✖",
            TextColor3=curThem.Tx, Font=Enum.Font.GothamSemibold, TextSize=11,
            AutoButtonColor=false, ZIndex=801,
        }, np)
        corner(xb, 5); mkStroke(xb, curThem.Ac, 1.2, 0.2)
        xb.MouseButton1Click:Connect(function() np:Destroy() end)
    end)

    -- SAVE / CANCEL
    local bottomRow = create("Frame", {
        Size=UDim2.new(1,0,0,30), Position=UDim2.new(0,0,1,-30),
        BackgroundTransparency=1, ZIndex=701,
    }, popup)
    create("UIListLayout", {Padding=UDim.new(0,6), FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder}, bottomRow)

    local saveBtn = create("TextButton", {
        Size=UDim2.new(0.5,-3,1,0), BackgroundColor3=curThem.Sc,
        BorderSizePixel=0, Text="💾 SAVE", TextColor3=curThem.Tx,
        Font=Enum.Font.GothamBold, TextSize=11, AutoButtonColor=false,
        LayoutOrder=1, ZIndex=702,
    }, bottomRow)
    corner(saveBtn, 6); mkStroke(saveBtn, curThem.Ac, 1.2, 0.2)

    saveBtn.MouseButton1Click:Connect(function()
        local selResults = {}
        for i = 1, #results do
            if selected[i] then table.insert(selResults, results[i]) end
        end
        if #selResults == 0 then notify("⚠️ No items", "warn"); return end

        local baseDir = cfg.Dir .. "/" .. tostring(game.GameId)
        local curDir = baseDir
        if #dialogPath > 0 then curDir = baseDir .. "/" .. table.concat(dialogPath, "/") end
        if not isfolder(curDir) then pcall(function() makefolder(curDir) end) end

        local customName = prefixBox.Text
        local saved, failed = 0, 0
        local usedNames = {} -- track para hindi mag-conflict

        for i, r in ipairs(selResults) do
            -- Determine base filename
            local baseName
            if useCustomName and customName ~= "" then
                -- Custom name mode: add number suffix
                baseName = sanitizeFileName(customName, "File").."_"..i
            else
                -- Auto mode: use result's own title
                local displayName = getDisplayName(r, i)
                baseName = sanitizeFileName(displayName, "Result")
                -- Kung na-duplicate, dagdagan ng number
                if usedNames[baseName] then
                    usedNames[baseName] = usedNames[baseName] + 1
                    baseName = baseName.."_"..usedNames[baseName]
                else
                    usedNames[baseName] = 1
                end
            end

            -- Dynamic Extension Logic (lua for script, txt for music)
local ext = ".json"
if searchType == "script" then ext = ".lua" 
elseif searchType == "audio" then ext = ".txt" end

local fileName = baseName..ext
local fullPath = curDir.."/"..fileName

            -- Ensure no existing file conflict
            local counter = 1
            while isfile(fullPath) do
                fileName = baseName.." ("..counter..").json"
                fullPath = curDir.."/"..fileName
                counter = counter + 1
                if counter > 100 then break end
            end

            local singleData = {
                _type = "search_"..tostring(searchType), _searchType = searchType,
                _savedAt = os.date("%Y-%m-%d %H:%M:%S"), _gameId = tostring(game.PlaceId),
                _index = i, _total = #selResults, result = r,
            }
            local ok = pcall(function() writefile(fullPath, HS:JSONEncode(singleData)) end)
            if ok then saved = saved + 1 else failed = failed + 1 end
        end

        popup:Destroy()
        if failed == 0 then notify("💾 Saved "..saved.." file"..(saved>1 and "s" or ""), "success")
        else notify("⚠️ Saved "..saved..", failed "..failed, "warn") end
        if R.__fmRefresh then pcall(R.__fmRefresh) end
    end)

    local cancelBtn = create("TextButton", {
        Size=UDim2.new(0.5,-3,1,0), BackgroundColor3=curThem.Da,
        BorderSizePixel=0, Text="✖ CANCEL", TextColor3=curThem.Tx,
        Font=Enum.Font.GothamBold, TextSize=11, AutoButtonColor=false,
        LayoutOrder=2, ZIndex=702,
    }, bottomRow)
    corner(cancelBtn, 6); mkStroke(cancelBtn, curThem.Ac, 1.2, 0.2)
    cancelBtn.MouseButton1Click:Connect(function() popup:Destroy() end)

    refreshFolderList()
end

local function doSearchData(query, searchType)
    local ok, resp = pcall(function()
        local url = "https://yinetsu-ai.vercel.app/api/search?q="..HS:UrlEncode(query).."&type="..searchType
        return game:HttpGet(url, true)
    end)
    if not ok or not resp or resp == "" then return nil, "Network error" end
    local decodeOk, data = pcall(function() return HS:JSONDecode(resp) end)
    if not decodeOk or not data then return nil, "Invalid response" end

    -- AUTO-VERIFY AUDIO: Filter dead songs
    if searchType == "audio" and data.results then
        local verified = {}
        local toCheck = math.min(#data.results, 10)

        notify("🔍 Verifying "..toCheck.." songs...", "info")

        for i = 1, toCheck do
            local r = data.results[i]
            if r.id then
                local testSound = Instance.new("Sound")
                testSound.SoundId = "rbxassetid://"..tostring(r.id)
                testSound.Volume = 0
                testSound.Parent = game:GetService("SoundService")

                local timeout = 0
                local isWorking = false

                while timeout < 15 and not isWorking do
                    task.wait(0.1)
                    timeout = timeout + 1
                    pcall(function()
                        if testSound.TimeLength > 0 then isWorking = true end
                    end)
                end

                testSound:Destroy()

                if isWorking then
                    local cleanName = r.name or "Audio"
                    cleanName = cleanName:gsub("%s*%(October 2026%).*$", "")
                    cleanName = cleanName:gsub("%s*:.*$", "")
                    cleanName = cleanName:gsub("Roblox Music Codes%s*", "")
                    cleanName = cleanName:gsub("Get Ready to Rock with Filipino Hits:%s*", "")
                    cleanName = cleanName:gsub("Uncovering the Best Song IDs for your Roblox Boombox%s*", "")
                    cleanName = cleanName:gsub("Top 10+ Roblox Tagalog Code Song ID 2022%s*", "")
                    cleanName = cleanName:gsub("^%s+", ""):gsub("%s+$", "")
                    if cleanName == "" then cleanName = "Audio #"..tostring(r.id) end

                    table.insert(verified, {
                        id = r.id,
                        name = cleanName,
                        creator = r.creator or "Roblox",
                        source = r.source or "web",
                        url = r.url or ("https://www.roblox.com/library/"..r.id)
                    })
                end
            end
        end

        data.results = verified
        data.count = #verified

        if #verified == 0 then
            notify("⚠️ No working audio in results", "warn")
        else
            notify("✅ "..#verified.." working audio found", "success")
        end
    end

    return data, nil
end

local function addResultCard(parent, result, searchType, index)
local card = create("Frame",{
    Size=UDim2.new(1,-8,0,92),
    BackgroundColor3=curThem.Su,
    BackgroundTransparency=0.15,
    BorderSizePixel=0,
    LayoutOrder=index,
}, parent)
corner(card,10)
local cardStroke = mkStroke(card, curThem.Ac, 1.5, 0.15)
reg(card,"BackgroundColor3",curThem.Su,false)
padding(card, 12, 12, 8, 8)

-- Multi-select overlay + checkbox (hidden by default)
local selOverlay = create("Frame",{
    Name = "_selOverlay",
    Size = UDim2.fromScale(1,1),
    BackgroundColor3 = curThem.Ac,
    BackgroundTransparency = 0.75,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 20,
}, card)
corner(selOverlay, 10)

local selCheckBox = create("TextLabel",{
    Name = "_selCheck",
    Size = UDim2.fromOffset(26, 26),
    Position = UDim2.new(0, 8, 0, 8),
    BackgroundColor3 = curThem.Sc,
    BorderSizePixel = 0,
    Text = "✓",
    TextColor3 = Color3.new(1,1,1),
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    Visible = false,
    ZIndex = 21,
}, card)
corner(selCheckBox, 6)

-- Hover lift effect
local cardOrigSize = card.Size
track(card.MouseEnter:Connect(function()
    if card.Parent then
        TS:Create(card, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.05,
        }):Play()
        TS:Create(cardStroke, TweenInfo.new(0.15), {
            Thickness = 2.5,
            Transparency = 0,
        }):Play()
    end
end))
track(card.MouseLeave:Connect(function()
    if card.Parent then
        TS:Create(card, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 0.15,
        }):Play()
        TS:Create(cardStroke, TweenInfo.new(0.15), {
            Thickness = 1.5,
            Transparency = 0.15,
        }):Play()
    end
end))

    local title = "Result"
    if searchType == "audio" then title = result.name or "Untitled"
    elseif searchType == "game" then title = result.name or "Untitled"
    elseif searchType == "user" then title = (result.displayName or result.name or "Unknown")
    else title = result.title or "Result"
    end

    local titleLbl = create("TextLabel",{
        Size=UDim2.new(1,-70,0,20),
        BackgroundTransparency=1,
        Text=index..". "..title,
        TextColor3=curThem.Tx,
        Font=Enum.Font.GothamBold,
        TextSize=12,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Center,
    }, card)
    reg(titleLbl,"TextColor3",curThem.Tx,true)

    if result.safety then
        local badge = "⚫"
        if result.safety.level == "SAFE" or result.safety.level == "LIKELY_SAFE" then badge = "🟢 SAFE"
        elseif result.safety.level == "CAUTION" then badge = "🟡 CAUTION"
        elseif result.safety.level == "SUSPICIOUS" then badge = "🟠 SUSPECT"
        elseif result.safety.level == "DANGER" then badge = "🔴 DANGER" end

        create("TextLabel",{
            Size=UDim2.new(0,68,0,16),
            Position=UDim2.new(1,-68,0,2),
            BackgroundTransparency=1,
            Text=badge,
            TextColor3=curThem.Sc,
            Font=Enum.Font.GothamBold,
            TextSize=10,
            TextXAlignment=Enum.TextXAlignment.Right,
        }, card)
    end

    local infoText = ""
    if searchType == "audio" then
        infoText = "ID: "..(result.id or "?").." · by "..(result.creator or "Unknown")
    elseif searchType == "game" then
        local pCount = result.playing or result.playerCount or 0
        local pId = result.placeId or result.id or "?"
        infoText = "Place: "..tostring(pId).." · "..tostring(pCount).." playing"
    elseif searchType == "user" then
        infoText = "@"..(result.name or "?")
    elseif searchType == "script" then
        local code = result.code or ""
        infoText = code:sub(1,55)..((#code > 55) and "..." or "")
    else
        local u = result.url or ""
        infoText = u:sub(1,55)..((#u > 55) and "..." or "")
    end

    local infoLbl = create("TextLabel",{
        Size=UDim2.new(1,0,0,14),
        Position=UDim2.new(0,0,0,22),
        BackgroundTransparency=1,
        Text=infoText,
        TextColor3=curThem.Mu,
        Font=Enum.Font.Code,
        TextSize=9,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Center,
    }, card)
    reg(infoLbl,"TextColor3",curThem.Mu,true)

    local btnRow = create("Frame",{
        Size=UDim2.new(1,0,0,26),
        Position=UDim2.new(0,0,1,-26),
        BackgroundTransparency=1,
    }, card)
    create("UIListLayout",{
        Padding=UDim.new(0,4),
        FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder,
    }, btnRow)

    local function cardBtn(txt, cb, order)
        local b = create("TextButton",{
            Size=UDim2.new(0, 78, 0, 24),
            BackgroundColor3=curThem.Sa,
            BorderSizePixel=0,
            Text=txt,
            TextColor3=curThem.Tx,
            Font=Enum.Font.Gotham,
            TextSize=10,
            AutoButtonColor=false,
            LayoutOrder=order,
        }, btnRow)
        corner(b,6)
        mkStroke(b,curThem.Ac,1.2,0.2)
        reg(b,"BackgroundColor3",curThem.Sa,false)
        track(b.Activated:Connect(function() if cb then pcall(cb) end end))
        return b
    end

    local copyValue = ""
    local copyLabel = "📋 Copy"
    if searchType == "audio" then copyValue = tostring(result.id or ""); copyLabel = "📋 ID"
    elseif searchType == "game" then copyValue = tostring(result.placeId or result.id or ""); copyLabel = "📋 Place"
    elseif searchType == "user" then copyValue = tostring(result.name or ""); copyLabel = "📋 User"
    elseif searchType == "script" then copyValue = tostring(result.code or ""); copyLabel = "📋 Code"
    else copyValue = tostring(result.url or ""); copyLabel = "📋 URL" end

    if copyValue ~= "" then
        cardBtn(copyLabel, function()
            pcall(function() setclipboard(copyValue) end)
            notify("📋 Copied!", "success")
        end, 1)
    end

    if result.url and result.url ~= "" and searchType ~= "script" then
        cardBtn("🔗 URL", function()
            pcall(function() setclipboard(result.url) end)
            notify("🔗 URL copied!", "success")
        end, 2)
    end

if searchType == "audio" and result.id then
    cardBtn("➕ Playlist", function()
        local cleanName = result.name or "Audio"
        cleanName = cleanName:gsub("%s*25 Popular Phonk IDs.*$", "")
        cleanName = cleanName:gsub("%s*%(Working in %d+%).*$", "")
        cleanName = cleanName:gsub("%s*Roblox Music Codes.*$", "")
        cleanName = cleanName:gsub("^%s+", ""):gsub("%s+$", "")
        if cleanName == "" then cleanName = "Audio #"..tostring(result.id):sub(-6) end

        notify("🔍 Verifying "..cleanName.."...", "info")

        local verifySound = Instance.new("Sound")
        verifySound.SoundId = "rbxassetid://"..tostring(result.id)
        verifySound.Volume = 0
        verifySound.Parent = game:GetService("SoundService")

        local verified = false
        local timeout = 0

        while timeout < 25 and not verified do
            task.wait(0.1)
            timeout = timeout + 1
            pcall(function()
                if verifySound.TimeLength > 0 then verified = true end
            end)
        end

        verifySound:Destroy()

        if verified then
            table.insert(Settings.musicTracks, {
                id = tostring(result.id),
                name = cleanName,
                fav = false
            })
            saveSettings()
            notify("✅ Added: "..cleanName, "success")
            if R.refreshMusicList then pcall(R.refreshMusicList) end
        else
            notify("❌ Audio not playable (dead/private)", "error")
        end
    end, 3)
elseif searchType == "script" and result.code then
    -- ═══ PHASE 5: SCRIPT PREVIEW + SAFETY ═══
    cardBtn("👁 Preview", function()
        -- Execution log tracking
        if not S.execLog then S.execLog = {} end

        local code = result.code or ""
        local safety = result.safety or {level="UNKNOWN", flags={}}

        -- Safety badge
        local badge = "⚫ UNKNOWN"
        local badgeColor = curThem.Mu
        if safety.level == "SAFE" or safety.level == "LIKELY_SAFE" then
            badge = "🟢 SAFE"; badgeColor = curThem.Sc
        elseif safety.level == "CAUTION" then
            badge = "🟡 CAUTION"; badgeColor = curThem.Wa
        elseif safety.level == "SUSPICIOUS" then
            badge = "🟠 SUSPICIOUS"; badgeColor = Color3.fromRGB(255,140,60)
        elseif safety.level == "DANGER" then
            badge = "🔴 DANGER"; badgeColor = curThem.Da
        end

-- ═══ ADAPTIVE PREVIEW SIZE (base sa code length) ═══
local vpY = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.Y) or 720
local vpX = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X) or 1280

-- Width: max 560, min 400 (mobile-safe)
local popupW = math.clamp(vpX - 60, 400, 560)

-- Estimate code height: ~50 chars per line at 12px Font.Code
local lines = math.max(1, math.ceil(#code / 50))
local estimatedCodeH = lines * 16 + 8

-- Chrome (title + safety + buttons + padding): ~155px
-- Total height = 155 + code height, min 200px, max 60% of screen
local popupH = math.clamp(155 + estimatedCodeH, 200, math.floor(vpY * 0.60))

local popup = create("Frame",{
    Size=UDim2.new(0,popupW,0,popupH),
    Position=UDim2.fromScale(0.5,0.5),
    AnchorPoint=Vector2.new(0.5,0.5),
    BackgroundColor3=curThem.Su,
    BorderSizePixel=0,ZIndex=600,
},SG)
        corner(popup,14); chromaStroke(popup)
        reg(popup,"BackgroundColor3",curThem.Su,false)

        -- Title
        create("TextLabel",{
            BackgroundTransparency=1,
            Size=UDim2.new(1,-60,0,26),
            Position=UDim2.new(0,16,0,14),
            Text="📜 SCRIPT PREVIEW",
            TextColor3=curThem.Aa,Font=Enum.Font.GothamBold,
            TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=601,
        },popup)

        -- Close button
        local closeBtn = create("TextButton",{
            Size=UDim2.fromOffset(30,30),
            Position=UDim2.new(1,-40,0,12),
            BackgroundColor3=curThem.Da,BorderSizePixel=0,
            Text="×",TextColor3=curThem.Tx,
            Font=Enum.Font.GothamBold,TextSize=18,
            AutoButtonColor=false,ZIndex=602,
        },popup)
        corner(closeBtn,8); mkStroke(closeBtn,curThem.Ac,1.2,0.2)

        -- Safety badge
        create("TextLabel",{
            BackgroundTransparency=1,
            Size=UDim2.new(1,-60,0,20),
            Position=UDim2.new(0,16,0,42),
            Text="Safety: "..badge.."  ·  Size: "..#code.." bytes",
            TextColor3=badgeColor,Font=Enum.Font.GothamSemibold,
            TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=601,
        },popup)

        -- Safety flags
        if safety.flags and #safety.flags > 0 then
            local flagsText = "⚠️ "..table.concat(safety.flags, "  ·  ")
            create("TextLabel",{
                BackgroundTransparency=1,
                Size=UDim2.new(1,-60,0,32),
                Position=UDim2.new(0,16,0,64),
                Text=flagsText,
                TextColor3=curThem.Wa,Font=Enum.Font.Gotham,
                TextSize=10,TextWrapped=true,
                TextXAlignment=Enum.TextXAlignment.Left,
                TextYAlignment=Enum.TextYAlignment.Top,ZIndex=601,
            },popup)
        end

        -- Code display
        local codeFrame = create("Frame",{
            Size=UDim2.new(1,-32,1,-160),
            Position=UDim2.new(0,16,0,102),
            BackgroundColor3=curThem.Bg,
            BorderSizePixel=0,ZIndex=601,
        },popup)
        corner(codeFrame,10); mkStroke(codeFrame,curThem.Aa,1.5,0.15)
        reg(codeFrame,"BackgroundColor3",curThem.Bg,false)

local codeScroll = create("ScrollingFrame",{
    Size=UDim2.new(1,-16,1,-16),
    Position=UDim2.new(0,8,0,8),
    BackgroundTransparency=1,BorderSizePixel=0,
    ScrollBarThickness=5,ScrollBarImageColor3=curThem.Ac,
    CanvasSize=UDim2.new(0,0,0,0),
    AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=602,
},codeFrame)
-- Add UIPadding so text doesn't clip on the edges
padding(codeScroll, 8, 8, 8, 8)

-- Container so TextLabel wraps to scroll width properly
local codeInner = create("Frame",{
    Size=UDim2.new(1,0,0,0),
    BackgroundTransparency=1,
    AutomaticSize=Enum.AutomaticSize.Y,
    ZIndex=603,
},codeScroll)

local codeLabel = create("TextLabel",{
    Size=UDim2.new(1,0,0,0),
    BackgroundTransparency=1,
    Text=code,
    TextColor3=curThem.Sc,
    Font=Enum.Font.Code,
    TextSize=12,                       -- ← bumped from 11 for readability
    TextWrapped=true,                  -- ← this now actually works (see below)
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Top,
    AutomaticSize=Enum.AutomaticSize.Y,
    RichText=false,
    ZIndex=604,
},codeInner)

        -- DANGER block
        local isDanger = (safety.level == "DANGER")

        -- Buttons
        local btnRow = create("Frame",{
            Size=UDim2.new(1,-32,0,44),
            Position=UDim2.new(0,16,1,-56),
            BackgroundTransparency=1,ZIndex=601,
        },popup)
        create("UIListLayout",{
            Padding=UDim.new(0,8),
            FillDirection=Enum.FillDirection.Horizontal,
            SortOrder=Enum.SortOrder.LayoutOrder,
            VerticalAlignment=Enum.VerticalAlignment.Center,
        },btnRow)

        local execBtn = pBtn(btnRow, isDanger and "🚫 BLOCKED" or "⚡ Execute", UDim2.new(0.32,0,0,44), UDim2.new(), nil)
        execBtn.LayoutOrder = 1
        execBtn.ZIndex = 602
        if isDanger then
            execBtn.BackgroundColor3 = curThem.Da
            execBtn.TextColor3 = curThem.Tx
        end

        local copyBtn = pBtn(btnRow,"📋 Copy Code",UDim2.new(0.32,0,0,44),UDim2.new(),function()
            pcall(function() setclipboard(code) end)
            notify("📋 Code copied!","success")
        end)
        copyBtn.LayoutOrder = 2
        copyBtn.ZIndex = 602

        local cancelBtn = pBtn(btnRow,"✖ Cancel",UDim2.new(0.32,0,0,44),UDim2.new(),function()
            popup:Destroy()
        end)
        cancelBtn.LayoutOrder = 3
        cancelBtn.ZIndex = 602

        closeBtn.Activated:Connect(function() popup:Destroy() end)

        execBtn.Activated:Connect(function()
            if isDanger then
                notify("🚫 Blocked: dangerous pattern detected","error")
                return
            end
            popup:Destroy()

            -- Execute with tracking
            local t0 = os.clock()
            local ok, err = pcall(function()
                loadstring(code)()
            end)
            local dt = (os.clock() - t0) * 1000

            -- Log execution
            table.insert(S.execLog, {
                time = os.date("%H:%M:%S"),
                safety = safety.level or "UNKNOWN",
                size = #code,
                ms = math.floor(dt),
                ok = ok,
                err = ok and nil or tostring(err),
                preview = code:sub(1, 80):gsub("\n"," "),
            })
            if #S.execLog > 50 then table.remove(S.execLog, 1) end

            if ok then
                notify("⚡ Executed in "..math.floor(dt).."ms","success")
                if _G.addSysLog then
                    pcall(_G.addSysLog, "Executed script ("..#code.."B, "..math.floor(dt).."ms)","EXEC")
                end
            else
                notify("❌ Execution failed","error")
                if _G.addSysLog then
                    pcall(_G.addSysLog, "Execute failed: "..tostring(err):sub(1,80), "ERROR")
                end
            end
        end)
    end, 3)
  end
    return { 
        index = index, 
        result = result, 
        card = card,
        overlay = selOverlay,
        checkBox = selCheckBox
    }
end

local function renderSearchResults(data, searchType)
    if not data or not data.results or #data.results == 0 then
        notify("🔍 No results for: "..((data and data.query) or "?"), "info")
        return
    end

    -- Reset select state
    S.selectMode = false
    S.selectedResults = {}
    S.currentResultHandlers = {}

    S.lastResults = {type = searchType, data = data.results, query = data.query or ""}

    local msgFrame = create("Frame",{
        Size=UDim2.new(1,-8,0,0), BackgroundTransparency=1, BorderSizePixel=0,
        AutomaticSize=Enum.AutomaticSize.Y,
    }, R.aiChatScroll)
    create("UIListLayout",{Padding=UDim.new(0,6), SortOrder=Enum.SortOrder.LayoutOrder}, msgFrame)

    local hdrText = "🔍 "..string.upper(searchType).." Search: "..(data.query or "?")
    if data.source then hdrText = hdrText.." ("..data.source..")" end
    hdrText = hdrText.." — "..#data.results.." results  ·  long-press to multi-select"

    create("TextLabel",{Size=UDim2.new(1,0,0,28), BackgroundTransparency=1, Text=hdrText,
        TextColor3=curThem.Aa, Font=Enum.Font.GothamBold, TextSize=10,
        TextWrapped=true, TextXAlignment=Enum.TextXAlignment.Left, LayoutOrder=0}, msgFrame)

local maxCards = math.min(#data.results, 10)
for i = 1, maxCards do
    local h = addResultCard(msgFrame, data.results[i], searchType, i)
    if h then table.insert(S.currentResultHandlers, h) end
end

    -- Bulk row
    local bulkRow = create("Frame",{Size=UDim2.new(1,0,0,28), BackgroundTransparency=1, LayoutOrder=999}, msgFrame)
    create("UIListLayout",{Padding=UDim.new(0,4), FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder}, bulkRow)

    local function bulkBtn(txt, cb, order, col)
        local b = create("TextButton",{Size=UDim2.new(0.32,0,0,26), BackgroundColor3=curThem.Sa,
            BorderSizePixel=0, Text=txt, TextColor3=curThem.Tx, Font=Enum.Font.GothamSemibold,
            TextSize=10, AutoButtonColor=false, LayoutOrder=order}, bulkRow)
        corner(b,6); mkStroke(b,col or curThem.Ac,1.2,0.2)
        reg(b,"BackgroundColor3",curThem.Sa,false)
        track(b.Activated:Connect(function() if cb then pcall(cb) end end))
        return b
    end

    bulkBtn("📋 Copy All", function()
        local all = {}
        for _, r in ipairs(data.results) do
            if searchType == "audio" then table.insert(all, tostring(r.id or ""))
            elseif searchType == "game" then table.insert(all, tostring(r.placeId or r.id or ""))
            elseif searchType == "user" then table.insert(all, tostring(r.name or ""))
            elseif searchType == "script" then table.insert(all, tostring(r.code or ""))
            else table.insert(all, tostring(r.url or "")) end
        end
        setclipboard(table.concat(all, "\n"))
        notify("📋 Copied "..#all.." items", "success")
    end, 1, curThem.Sc)

    -- SAVE ALL (uses new dialog with split)
    bulkBtn("💾 Save All", function()
        R.openSaveDialog(data.results, searchType, "Search_"..searchType)
    end, 2, curThem.Wa)

    bulkBtn("🔄 Again", function()
        if data.query and R.aiInputBox then
            R.aiInputBox.Text = data.query
            if R.aiSendBtn then R.aiSendBtn:Activate() end
        end
    end, 3, curThem.Aa)

    -- ═══ FLOATING SELECT BAR ═══
    R.__updateSelectBar = function()
        -- Find or create bar
        local bar = R.__selectBar
        local count = 0
        for _ in pairs(S.selectedResults) do count = count + 1 end

        if not S.selectMode or count == 0 then
            if bar and bar.Parent then bar:Destroy(); R.__selectBar = nil end
            return
        end

        if not bar or not bar.Parent then
            bar = create("Frame",{
                Name = "SelectBar",
                Size = UDim2.new(1, -16, 0, 44),
                Position = UDim2.new(0, 8, 0, 8),
                BackgroundColor3 = curThem.Su,
                BorderSizePixel = 0,
                ZIndex = 500,
            }, R.aiChatDisplay or R.aiChatScroll.Parent)
            corner(bar, 10); chromaStroke(bar)
            reg(bar,"BackgroundColor3",curThem.Su,false)

            local countLbl = create("TextLabel",{
                BackgroundTransparency=1, Size=UDim2.new(0.4,0,1,0), Position=UDim2.new(0,12,0,0),
                Text="0 selected", TextColor3=curThem.Aa, Font=Enum.Font.GothamBold,
                TextSize=12, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=501,
            }, bar)
            bar:SetAttribute("_countLbl", countLbl.Name)

            local saveSel = pBtn(bar, "💾 Save", UDim2.new(0,90,0,32), UDim2.new(0.42,0,0.5,-16), function()
                local sel = {}
                local indices = {}
                for _, h in pairs(S.selectedResults) do table.insert(indices, h.index) end
                table.sort(indices)
                for _, idx in ipairs(indices) do
                    for _, h in pairs(S.selectedResults) do
                        if h.index == idx then table.insert(sel, h.result); break end
                    end
                end
                if #sel == 0 then notify("Nothing selected","warn"); return end
                R.openSaveDialog(sel, searchType, "Selected_"..searchType)
            end)
            saveSel.ZIndex = 501

            local cancelSel = pBtn(bar, "✖ Cancel", UDim2.new(0,90,0,32), UDim2.new(0.75,0,0.5,-16), function()
    S.selectMode = false
    S.selectedResults = {}
    for _, h in ipairs(S.currentResultHandlers) do
        if h and h.checkBox then h.checkBox.Visible = false end
        if h and h.overlay then h.overlay.Visible = false end
    end
    R.__updateSelectBar()
end)
            cancelSel.ZIndex = 501

            R.__selectBar = bar
            R.__selectCountLbl = countLbl
        end

-- Toggle card overlays
for _, h in ipairs(S.currentResultHandlers) do
    if h and h.overlay then h.overlay.Visible = S.selectMode end
    if h and h.checkBox then h.checkBox.Visible = S.selectMode end
end

        if R.__selectCountLbl then
            R.__selectCountLbl.Text = count.." selected"
        end
    end

    task.defer(function()
        task.wait(0.15)
        if R.aiChatScroll then
            R.aiChatScroll.CanvasPosition = Vector2.new(0, R.aiChatScroll.AbsoluteCanvasSize.Y)
        end
    end)
end


local ACTIONS = {
    -- THEMES
    change_theme = {
        desc = "Change UI theme. arg: theme name",
        run = function(arg)
            arg = tostring(arg or ""):gsub("%s","")
            for _, t in ipairs(themeOrder) do
                if t:lower() == arg:lower() then
                    Settings.theme = t; saveSettings()
                    if _G.__yinetsu_applyTheme then pcall(_G.__yinetsu_applyTheme, t, true) end
                    if R.ThemeStat then R.ThemeStat.Text = "Current: "..t end
                    return "✅ Theme: "..t
                end
            end
            return "❌ Theme not found"
        end
    },
    list_themes = { desc = "List themes. no arg",
        run = function() return "🎨 "..table.concat(themeOrder, ", ") end },

    -- CHARACTER
    set_speed = {
        desc = "Set WalkSpeed. arg: number",
        run = function(arg)
            local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            if not h then return "❌ No character" end
            local n = tonumber(arg); if not n then return "❌ Invalid" end
            h.WalkSpeed = n
            if R.SpeedBox then R.SpeedBox.Text = tostring(n) end
            return "✅ Speed: "..n
        end
    },
    set_jump = {
        desc = "Set JumpPower. arg: number",
        run = function(arg)
            local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            if not h then return "❌ No character" end
            local n = tonumber(arg); if not n then return "❌ Invalid" end
            h.UseJumpPower = true; h.JumpPower = n
            if R.JumpBox then R.JumpBox.Text = tostring(n) end
            return "✅ Jump: "..n
        end
    },

    -- FLY (direct toggle)
    fly = {
        desc = "Toggle flight. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            if S.fly == want then return "Fly: already "..(want and "ON" or "OFF") end
            local c = LP.Character
            if not c then return "❌ No character" end
            local hrp = c:FindFirstChild("HumanoidRootPart")
            local h = c:FindFirstChildOfClass("Humanoid")
            if not hrp or not h then return "❌ Missing parts" end
            S.fly = want
            if R.bFly then R.bFly.Text = want and "Fly: ON" or "Fly: OFF" end
            if R.FlyControls then R.FlyControls.Visible = want end
if want then
    local bv = hrp:FindFirstChild("YinetsuFly") or Instance.new("BodyVelocity", hrp)
    bv.Name = "YinetsuFly"; bv.MaxForce = Vector3.new(9e9,9e9,9e9); bv.Velocity = Vector3.new(0,0,0)
    local bg = hrp:FindFirstChild("YinetsuFlyGyro") or Instance.new("BodyGyro", hrp)
    bg.Name = "YinetsuFlyGyro"; bg.MaxTorque = Vector3.new(9e9,9e9,9e9); bg.P = 90000; bg.D = 500; bg.CFrame = hrp.CFrame

    -- Get ControlModule for joystick input (works with PlatformStand)
    local cm = nil
    pcall(function()
        local ps = LP:FindFirstChild("PlayerScripts")
        if ps then
            local pm = ps:FindFirstChild("PlayerModule")
            if pm then
                local cmod = pm:FindFirstChild("ControlModule")
                if cmod then cm = require(cmod) end
            end
        end
    end)

    if S.flyConn then S.flyConn:Disconnect() end
    S.flyConn = RS.RenderStepped:Connect(function()
        if not hrp.Parent or not S.fly then return end
        if not bv.Parent or not bg.Parent then return end
        local cam = workspace.CurrentCamera; if not cam then return end
        bg.CFrame = cam.CFrame

        local mv = Vector3.new()
        if cm then
            pcall(function() mv = cm:GetMoveVector() end)
        end
        if mv.Magnitude < 0.05 then
            pcall(function() mv = UIS:GetMoveVector() end)
        end

        local spd = 60
        if R.flySpdBox then spd = tonumber(R.flySpdBox.Text) or 60 end
        spd = math.clamp(spd, 5, 500)
        local vel = Vector3.new()
        if mv.Magnitude > 0.05 then
            vel = (cam.CFrame.RightVector * mv.X) - (cam.CFrame.LookVector * mv.Z)
        end
        bv.Velocity = vel.Magnitude > 0 and (vel.Unit * spd) or Vector3.new(0,0,0)
    end)
    h.PlatformStand = true
    return "✅ Fly: ON"
            else
                if S.flyConn then S.flyConn:Disconnect(); S.flyConn = nil end
                local bv = hrp:FindFirstChild("YinetsuFly"); if bv then bv:Destroy() end
                local bg = hrp:FindFirstChild("YinetsuFlyGyro"); if bg then bg:Destroy() end
                h.PlatformStand = false
                return "✅ Fly: OFF"
            end
        end
    },

    -- NOCLIP (direct)
    noclip = {
        desc = "Toggle noclip. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            if S.noclip == want then return "Noclip: already "..(want and "ON" or "OFF") end
            S.noclip = want
            if R.bNoclip then R.bNoclip.Text = want and "Noclip: ON" or "Noclip: OFF" end
            if want then
                if S.noclipConn then S.noclipConn:Disconnect() end
                S.noclipConn = RS.Stepped:Connect(function()
                    local c = LP.Character; if not c then return end
                    for _,v in pairs(c:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end)
                return "✅ Noclip: ON"
            else
                if S.noclipConn then S.noclipConn:Disconnect(); S.noclipConn = nil end
                local c = LP.Character
                if c then
                    for _,v in pairs(c:GetDescendants()) do
                        if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.CanCollide = true end
                    end
                end
                return "✅ Noclip: OFF"
            end
        end
    },

    -- FULLBRIGHT (direct)
    fullbright = {
        desc = "Toggle fullbright. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            if S.fullbright == want then return "Fullbright: already "..(want and "ON" or "OFF") end
            S.fullbright = want
            if R.bFullbright then R.bFullbright.Text = want and "Fullbright: ON" or "Fullbright: OFF" end
            if want then
                S.oL.Brightness = LG.Brightness
                S.oL.ClockTime = LG.ClockTime
                S.oL.FogEnd = LG.FogEnd
                LG.Brightness = 5; LG.ClockTime = 14; LG.FogEnd = 100000
                return "✅ Fullbright: ON"
            else
                LG.Brightness = S.oL.Brightness or 2
                LG.ClockTime = S.oL.ClockTime or 14
                LG.FogEnd = S.oL.FogEnd or 100000
                return "✅ Fullbright: OFF"
            end
        end
    },

    -- ANTI-FLING (direct)
    anti_fling = {
        desc = "Toggle Anti-Fling. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            if S.antiFling == want then return "Anti-Fling: already "..(want and "ON" or "OFF") end
            S.antiFling = want
            if R.bAntiFling then R.bAntiFling.Text = want and "Anti-Fling: ON" or "Anti-Fling: OFF" end
            if want then
                S.charConn = RS.Heartbeat:Connect(function()
                    local c = LP.Character; if not c then return end
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    if hrp and not hrp:FindFirstChild("YinetsuAntiFling") then
                        local av = Instance.new("BodyAngularVelocity", hrp)
                        av.Name = "YinetsuAntiFling"
                        av.MaxTorque = Vector3.new(0,0,0); av.AngularVelocity = Vector3.new(0,0,0)
                    end
                end)
                return "✅ Anti-Fling: ON"
            else
                if S.charConn then S.charConn:Disconnect(); S.charConn = nil end
                local c = LP.Character
                if c then
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    if hrp then local av = hrp:FindFirstChild("YinetsuAntiFling"); if av then av:Destroy() end end
                end
                return "✅ Anti-Fling: OFF"
            end
        end
    },

    rejoin_death = {
        desc = "Toggle Rejoin on Death. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            S.rejoinDeath = want
            if R.bRejoinDeath then R.bRejoinDeath.Text = want and "Rejoin Death: ON" or "Rejoin Death: OFF" end
            return "✅ Rejoin Death: "..(want and "ON" or "OFF")
        end
    },
    auto_clicker = {
        desc = "Toggle Auto-Clicker. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            S.autoClick = want
            if R.bAutoClick then R.bAutoClick.Text = want and "Auto-Click: ON" or "Auto-Click: OFF" end
            if R.ACApp then R.ACApp.Visible = want end
            return "✅ Auto-Clicker: "..(want and "ON" or "OFF")
        end
    },
    negate_args = {
        desc = "Toggle Negate Args. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            S.negOn = want
            if R.bNeg then R.bNeg.Text = want and "NEG: ON" or "NEG: OFF" end
            return "✅ Negate: "..(want and "ON" or "OFF")
        end
    },
    multiply_args = {
        desc = "Toggle Multiply x9999. arg: on|off",
        run = function(arg)
            local want = tostring(arg or ""):lower() == "on"
            S.modOn = want
            if R.bMod then R.bMod.Text = want and "MOD: ON" or "MOD: OFF" end
            return "✅ Multiply: "..(want and "ON" or "OFF")
        end
    },

    -- TELEPORT
    teleport_to = {
        desc = "Teleport to player. arg: player_name",
        run = function(arg)
            if not arg or arg=="" then return "❌ No name" end
            arg = tostring(arg):lower()
            for _, p in ipairs(PL:GetPlayers()) do
                if p ~= LP and (p.Name:lower():find(arg,1,true) or p.DisplayName:lower():find(arg,1,true)) then
                    local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                    local mhrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and mhrp then
                        mhrp.CFrame = hrp.CFrame + Vector3.new(0,3,0)
                        return "✅ TP to "..p.Name
                    end
                end
            end
            return "❌ Player not found"
        end
    },
    save_position = { desc = "Save position. no arg",
        run = function()
            local c = LP.Character; local h = c and c:FindFirstChild("HumanoidRootPart")
            if h then S.savedPos = h.CFrame; return "✅ Position saved" end
            return "❌ No character"
        end },
    load_position = { desc = "Load saved position. no arg",
        run = function()
            if not S.savedPos then return "❌ Nothing saved" end
            local c = LP.Character; local h = c and c:FindFirstChild("HumanoidRootPart")
            if h then h.CFrame = S.savedPos; return "✅ Teleported" end
            return "❌ No character"
        end },

    -- MUSIC
    play_music = { desc = "Play music. no arg",
        run = function() if R.playMusic then R.playMusic() end return "▶ Music playing" end },
    pause_music = { desc = "Pause music. no arg",
        run = function() if R.pauseMusic then R.pauseMusic() end return "⏸ Music paused" end },
    stop_music = { desc = "Stop music. no arg",
        run = function() if R.stopMusic then R.stopMusic() end return "⏹ Music stopped" end },
    next_track = { desc = "Next track. no arg",
        run = function() if R.nextTrack then R.nextTrack() end return "⏭ Next track" end },
    prev_track = { desc = "Previous track. no arg",
        run = function() if R.prevTrack then R.prevTrack() end return "⏮ Previous track" end },
    set_volume = { desc = "Set volume. arg: 0-1",
        run = function(arg)
            local v = tonumber(arg)
            if not v or v<0 or v>1 then return "❌ Volume 0-1 only" end
            Settings.musicVolume = v
            if R.musicSound then R.musicSound.Volume = v end
            saveSettings(); return "🔊 Volume "..string.format("%.2f",v)
        end },
    toggle_shuffle = { desc = "Toggle shuffle. no arg",
        run = function()
            Settings.musicShuffle = not Settings.musicShuffle; saveSettings()
            return "🔀 Shuffle "..(Settings.musicShuffle and "ON" or "OFF")
        end },
    toggle_favorites_only = { desc = "Toggle favorites only. no arg",
        run = function()
            Settings.musicFavoritesOnly = not Settings.musicFavoritesOnly; saveSettings()
            return "⭐ Favs only "..(Settings.musicFavoritesOnly and "ON" or "OFF")
        end },

    -- UTILITIES
    rejoin_server = { desc = "Rejoin server. no arg",
        run = function()
            if S.tp then return "❌ Already teleporting" end
            S.tp = true
            pcall(function() TPS:Teleport(game.PlaceId, LP) end)
            return "🔄 Rejoining..."
        end },
    server_hop = { desc = "Server hop. no arg",
        run = function()
            if S.tp then return "❌ Already teleporting" end
            S.tp = true
            pcall(function() TPS:Teleport(game.PlaceId, LP) end)
            return "🔄 Server hopping..."
        end },
    copy_place_id = { desc = "Copy Place ID. no arg",
        run = function()
            if setclipboard then setclipboard(tostring(game.PlaceId)) end
            return "📋 Place ID: "..game.PlaceId
        end },
    enable_fps_boost = { desc = "Enable FPS booster. no arg",
        run = function()
            if S.fpsBoost then return "FPS Boost: already ON" end
            if R.setFPSBoost then R.setFPSBoost(true) end
            if R.bFPS then R.bFPS.Text = "Disable FPS Booster" end
            return "🚀 FPS Boost: ON"
        end },
    disable_fps_boost = { desc = "Disable FPS booster. no arg",
        run = function()
            if not S.fpsBoost then return "FPS Boost: already OFF" end
            if R.setFPSBoost then R.setFPSBoost(false) end
            if R.bFPS then R.bFPS.Text = "Enable FPS Booster" end
            return "FPS Boost: OFF"
        end },

    -- SEQUENCE
    start_recording = { desc = "Start recording. no arg",
        run = function()
            if S.rec then return "Already recording" end
            S.rec = true; S.recSeq = {}
            if R.bRec then R.bRec.Text = "STOP" end
            if R.recInfo then R.recInfo.Text = "0 actions" end
            return "⏺ Recording started"
        end },
    stop_recording = { desc = "Stop recording. no arg",
        run = function()
            if not S.rec then return "Not recording" end
            S.rec = false
            if R.bRec then R.bRec.Text = "Record" end
            return "⏹ Stopped ("..#S.recSeq.." actions)"
        end },
    play_sequence = { desc = "Play sequence. no arg",
        run = function()
            if #S.recSeq == 0 then return "❌ Nothing recorded" end
            S.play = true
            if R.bPlay then R.bPlay.Text = "STOP" end
            task.spawn(function()
                while S.play and getgenv().YinetsuUIActive do
                    for _, it in ipairs(S.recSeq) do
                        if not S.play then break end
                        pcall(function()
                            if it.remote and it.remote.Parent then
                                if it.remote.ClassName=="RemoteEvent" then it.remote:FireServer(unpack(it.args))
                                else it.remote:InvokeServer(unpack(it.args)) end
                            end
                        end)
                        task.wait(tonumber(R.SeqSpd and R.SeqSpd.Text) or 0.1)
                    end
                end
            end)
            return "▶ Playing sequence"
        end },
    stop_sequence = { desc = "Stop sequence. no arg",
        run = function()
            S.play = false
            if R.bPlay then R.bPlay.Text = "Play" end
            return "⏹ Sequence stopped"
        end },

    -- UI
    set_gui_scale = { desc = "Set GUI scale. arg: 0.5-1.5",
        run = function(arg)
            local n = tonumber(arg)
            if not n or n<0.5 or n>1.5 then return "❌ 0.5-1.5 only" end
            Settings.guiScale = n
            if MainSC then MainSC.Scale = 0.9*n end
            saveSettings(); return "✅ Scale: "..n
        end },
    toggle_animation = { desc = "Toggle animated colors. no arg",
        run = function()
            Settings.animateColors = not Settings.animateColors; saveSettings()
            return "Animation "..(Settings.animateColors and "ON" or "OFF")
        end },
    clear_chat = { desc = "Clear chat. no arg",
        run = function()
            for _, c in ipairs(R.aiChatScroll:GetChildren()) do
                if c:IsA("Frame") then c:Destroy() end
            end
            return "🧹 Chat cleared"
        end },
        fetch_script = {
    desc = "Fetch and analyze a Lua script from URL. arg: full URL",
    run = function(arg)
        if not arg or arg == "" then return "❌ No URL provided" end
        arg = tostring(arg):gsub("%s", "")
        local ok, resp = pcall(function()
            local url = "https://yinetsu-ai.vercel.app/api/fetch-script?url="..HS:UrlEncode(arg)
            return game:HttpGet(url, true)
        end)
        if not ok or not resp or resp == "" then
            return "❌ Fetch failed (network)"
        end
        local decodeOk, data = pcall(function() return HS:JSONDecode(resp) end)
        if not decodeOk or not data then return "❌ Invalid response" end
        if data.error then return "❌ "..tostring(data.error) end

        local safety = data.safety or {level="UNKNOWN", flags={}}
        local badge = ""
        if safety.level == "SAFE" then badge = "🟢 SAFE"
        elseif safety.level == "LIKELY_SAFE" then badge = "🟢 LIKELY SAFE"
        elseif safety.level == "CAUTION" then badge = "🟡 CAUTION"
        elseif safety.level == "SUSPICIOUS" then badge = "🟠 SUSPICIOUS"
        elseif safety.level == "DANGER" then badge = "🔴 DANGER"
        else badge = "⚫ UNKNOWN" end

        local out = "📜 **Fetched Script**\n"
        out = out .. "Source: `"..tostring(data.host or "?").."`\n"
        out = out .. "Size: "..tostring(data.length or 0).." bytes\n"
        out = out .. "Safety: "..badge.."\n\n"

        if safety.flags and #safety.flags > 0 then
            out = out .. "**Analysis:**\n"
            for _, f in ipairs(safety.flags) do
                out = out .. "• "..f.."\n"
            end
            out = out .. "\n"
        end

        if safety.level == "DANGER" then
            out = out .. "⚠️ **DO NOT EXECUTE.** Dangerous patterns detected.\n"
            return out
        end

        if data.code and data.code ~= "" then
            out = out .. "**Preview (first 5000 chars):**\n```lua\n"
            out = out .. data.code
            if data.truncated then out = out .. "\n-- [TRUNCATED]"
            end
            out = out .. "\n```"
        else
            out = out .. "No code returned."
        end
        return out
    end
},
    help = { desc = "Show all commands. no arg",
        run = function()
            return "📖 Commands: theme, speed, jump, fly, noclip, fullbright, anti_fling, rejoin_death, auto_clicker, negate, multiply, teleport, music controls, fps_boost, recording, gui_scale"
        end },
        copy_result = {
    desc = "Copy Nth result from last search. arg: number (1-10)",
    run = function(arg)
        local n = tonumber(arg or "1")
        if not S.lastResults or not S.lastResults.data or not S.lastResults.data[n] then
            return "❌ No result #"..tostring(n)
        end
        local r = S.lastResults.data[n]
        local val = ""
        if S.lastResults.type == "audio" then val = tostring(r.id or "")
        elseif S.lastResults.type == "game" then val = tostring(r.placeId or r.id or "")
        elseif S.lastResults.type == "user" then val = tostring(r.name or "")
        elseif S.lastResults.type == "script" then val = tostring(r.code or "")
        else val = tostring(r.url or "") end
        pcall(function() setclipboard(val) end)
        return "📋 Copied #"..n
    end
},
execute_result = {
    desc = "Execute Nth script from last search. arg: number",
    run = function(arg)
        local n = tonumber(arg or "1")
        if not S.lastResults or not S.lastResults.data or not S.lastResults.data[n] then
            return "❌ No result #"..tostring(n)
        end
        local r = S.lastResults.data[n]
        if not r.code then return "❌ Not a script" end
        local ok, err = pcall(function() loadstring(r.code)() end)
        if ok then return "⚡ Executed #"..n end
        return "❌ Failed: "..tostring(err)
    end
},
join_result = {
    desc = "Join Nth game from last search. arg: number",
    run = function(arg)
        local n = tonumber(arg or "1")
        if not S.lastResults or not S.lastResults.data or not S.lastResults.data[n] then
            return "❌ No result #"..tostring(n)
        end
        local r = S.lastResults.data[n]
        local targetPlaceId = tonumber(r.placeId or r.id)
        if not targetPlaceId then return "❌ Invalid place ID" end

        -- Guard: don't join current game
        if targetPlaceId == game.PlaceId then
            return "⚠️ Nasa loob ka na ng game na yan (#"..n..")"
        end

        -- Guard: no re-entry while teleporting
        if S.tp then return "⏳ Teleport in progress..." end
        S.tp = true

        local gameName = r.name or r.title or ("Place "..targetPlaceId)

        notify("🎮 Joining: "..gameName:sub(1,40).."...", "info")
        if _G.addSysLog then
            pcall(_G.addSysLog, "Join #"..n.." → "..gameName.." ("..targetPlaceId..")", "TELEPORT")
        end

task.delay(15, function() if S.tp then S.tp = false end end)
task.spawn(function()
    local success = false
    local errMsg = "unknown"

            -- METHOD 1: queue_on_teleport (survives teleport)
            local qot = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            if qot then
                pcall(function()
                    qot([[
                        -- Yinetsu re-injection on teleport
                        repeat task.wait() until game:IsLoaded()
                        task.wait(1)
                        -- Note: user re-executes script; this just confirms load
                    ]])
                end)
            end

            -- METHOD 2: TeleportService with retry (primary)
            for attempt = 1, 3 do
                local ok, err = pcall(function()
                    TPS:Teleport(targetPlaceId, LP)
                end)
                if ok then
                    success = true
                    break
                else
                    errMsg = tostring(err)
                    task.wait(0.5 * attempt)
                end
            end

            -- METHOD 3: TeleportToPlaceInstance (if we know server)
            if not success and r.serverId then
                local ok = pcall(function()
                    TPS:TeleportToPlaceInstance(targetPlaceId, r.serverId, LP)
                end)
                if ok then success = true end
            end

            if not success then
                S.tp = false
                notify("❌ Join failed: "..errMsg:sub(1,60), "error")
                if _G.addSysLog then
                    pcall(_G.addSysLog, "Join failed: "..errMsg:sub(1,80), "ERROR")
                end
            end
            -- NOTE: On success, client teleports out; S.tp stays true intentionally
        end)

        return "🎮 Joining #"..n..": "..gameName:sub(1,40)
    end
},
-- ═══ PHASE 7: ROBLOX INTEGRATION ═══
game_info = {
    desc = "Get info about current game. no arg",
    run = function()
        local name = "Unknown"
        pcall(function()
            local info = MPS:GetProductInfo(game.PlaceId)
            if info and info.Name then name = info.Name end
        end)
        local players = #PL:GetPlayers()
        local creator = "?"
        pcall(function()
            local info = MPS:GetProductInfo(game.PlaceId)
            if info and info.Creator and info.Creator.Name then
                creator = info.Creator.Name
            end
        end)
        local out = "🎮 **Current Game**\n"
        out = out .. "Name: "..name.."\n"
        out = out .. "Place ID: "..tostring(game.PlaceId).."\n"
        out = out .. "Creator: "..creator.."\n"
        out = out .. "Players: "..players.."\n"
        return out
    end
},
join_by_id = {
    desc = "Join a Roblox game by Place ID. arg: numeric place id",
    run = function(arg)
        local pid = tonumber(tostring(arg or ""):match("%d+"))
        if not pid then return "❌ Invalid Place ID" end
        if pid == game.PlaceId then return "⚠️ Nasa loob ka na ng game na yan" end
        if S.tp then return "⏳ Teleport in progress..." end
        S.tp = true

        notify("🎮 Joining Place "..pid.."...", "info")
        if _G.addSysLog then
            pcall(_G.addSysLog, "Join by ID → "..pid, "TELEPORT")
        end

        task.spawn(function()
            local qot = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            if qot then
                pcall(function() qot([[
                    repeat task.wait() until game:IsLoaded()
                ]]) end)
            end

            local ok, err = pcall(function()
                TPS:Teleport(pid, LP)
            end)
            if not ok then
                S.tp = false
                notify("❌ Join failed: "..tostring(err):sub(1,60), "error")
            end
        end)
        return "🎮 Joining Place "..pid
    end
},
server_hop_smart = {
    desc = "Hop to a different server of the same game. no arg",
    run = function()
        if S.tp then return "⏳ Teleport in progress..." end
        S.tp = true

        notify("🔄 Smart server hop...", "info")
        if _G.addSysLog then
            pcall(_G.addSysLog, "Server hop initiated","TELEPORT")
        end

        task.spawn(function()
            local qot = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            if qot then
                pcall(function() qot([[
                    repeat task.wait() until game:IsLoaded()
                ]]) end)
            end

            -- Try to fetch public servers list
            local servers = {}
            pcall(function()
                local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                local resp = game:HttpGet(url, true)
                local data = HS:JSONDecode(resp)
                if data and data.data then
                    for _, s in ipairs(data.data) do
                        if s.id and s.playing and s.maxPlayers and s.playing < s.maxPlayers then
                            table.insert(servers, s.id)
                        end
                    end
                end
            end)

            if #servers == 0 then
                -- Fallback: plain rejoin (Roblox matchmaking)
                local ok = pcall(function() TPS:Teleport(game.PlaceId, LP) end)
                if not ok then
                    S.tp = false
                    notify("❌ Server hop failed","error")
                end
                return
            end

            -- Pick random different server
            local curServer = game.JobId
            local candidates = {}
            for _, sid in ipairs(servers) do
                if sid ~= curServer then table.insert(candidates, sid) end
            end
            if #candidates == 0 then
                S.tp = false
                return notify("⚠️ Walang ibang server available","warn")
            end
            local pick = candidates[math.random(1, #candidates)]
            local ok, err = pcall(function()
                TPS:TeleportToPlaceInstance(game.PlaceId, pick, LP)
            end)
            if not ok then
                S.tp = false
                notify("❌ Hop failed: "..tostring(err):sub(1,50),"error")
            end
        end)
        return "🔄 Server hop initiated"
    end
},
rejoin_current = {
    desc = "Rejoin current server (same JobId). no arg",
    run = function()
        if S.tp then return "⏳ Teleport in progress..." end
        S.tp = true

        notify("🔄 Rejoining same server...", "info")
        if _G.addSysLog then
            pcall(_G.addSysLog, "Rejoin current server","TELEPORT")
        end

        task.spawn(function()
            local qot = queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
            if qot then
                pcall(function() qot([[
                    repeat task.wait() until game:IsLoaded()
                ]]) end)
            end

            -- Try same server first, fallback to fresh
            local sameServerOk = false
            if game.JobId and #game.JobId > 0 then
                sameServerOk = pcall(function()
                    TPS:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
                end)
            end
            if not sameServerOk then
                local freshOk = pcall(function() TPS:Teleport(game.PlaceId, LP) end)
                if not freshOk then
                    S.tp = false
                    notify("❌ Rejoin failed","error")
                end
            end
        end)
        return "🔄 Rejoining server"
    end
},
copy_jobid = {
    desc = "Copy current server JobId. no arg",
    run = function()
        local jid = game.JobId
        if not jid or jid == "" then return "❌ JobId unavailable" end
        pcall(function() setclipboard(jid) end)
        return "📋 JobId copied: "..jid:sub(1,20).."..."
    end
},
copy_game_link = {
    desc = "Copy current game's Roblox link. no arg",
    run = function()
        local link = "https://www.roblox.com/games/"..game.PlaceId
        pcall(function() setclipboard(link) end)
        return "🔗 Link copied: "..link
    end
},
playlist_result = {
    desc = "Add Nth music to playlist. arg: number",
    run = function(arg)
        local n = tonumber(arg or "1")
        if not S.lastResults or not S.lastResults.data or not S.lastResults.data[n] then
            return "❌ No result #"..tostring(n)
        end
        local r = S.lastResults.data[n]
        if not r.id then return "❌ Not a music" end
        table.insert(Settings.musicTracks, {id=tostring(r.id), name=tostring(r.name or "Track"), fav=false})
        saveSettings()
        if R.refreshMusicList then pcall(R.refreshMusicList) end
        return "➕ Added #"..n.." to playlist"
    end
},
-- ═══ PHASE 5: EXECUTION LOG ═══
show_executions = {
    desc = "Show recent script executions. no arg",
    run = function()
        if not S.execLog or #S.execLog == 0 then
            return "📜 No executions yet"
        end
        local out = "📜 **Recent Executions** (last "..math.min(#S.execLog,10)..")\n\n"
        local start = math.max(1, #S.execLog - 9)
        for i = #S.execLog, start, -1 do
            local e = S.execLog[i]
            local icon = e.ok and "✅" or "❌"
            local badge = "⚫"
            if e.safety == "SAFE" or e.safety == "LIKELY_SAFE" then badge = "🟢"
            elseif e.safety == "CAUTION" then badge = "🟡"
            elseif e.safety == "SUSPICIOUS" then badge = "🟠"
            elseif e.safety == "DANGER" then badge = "🔴" end
            out = out .. icon.." "..badge.." `"..e.time.."` · "..e.size.."B · "..e.ms.."ms\n"
            if not e.ok and e.err then
                out = out .. "   ↳ "..e.err:sub(1,60).."\n"
            end
        end
        return out
    end
},
clear_executions = {
    desc = "Clear execution log. no arg",
    run = function()
        S.execLog = {}
        return "🧹 Execution log cleared"
    end
},
open_result = {
    desc = "Copy URL of Nth result. arg: number",
    run = function(arg)
        local n = tonumber(arg or "1")
        if not S.lastResults or not S.lastResults.data or not S.lastResults.data[n] then
            return "❌ No result #"..tostring(n)
        end
        local r = S.lastResults.data[n]
        local url = r.url or ""
        if url == "" and r.placeId then url = "https://www.roblox.com/games/"..r.placeId end
        if url == "" and r.id and S.lastResults.type == "audio" then url = "https://www.roblox.com/library/"..r.id end
        if url == "" then return "❌ No URL" end
        pcall(function() setclipboard(url) end)
        return "🔗 URL #"..n.." copied"
    end
},
        search_script = {
    desc = "Search Roblox Lua scripts with auto-fetch. arg: game name like 'Blox Fruits'",
    run = function(arg)
        if not arg or arg == "" then return "❌ No query" end
        local ok, resp = pcall(function()
            local url = "https://yinetsu-ai.vercel.app/api/search?q="..HS:UrlEncode(arg).."&type=script"
            return game:HttpGet(url, true)
        end)
        if not ok or not resp or resp == "" then return "❌ Search failed" end
        local decodeOk, data = pcall(function() return HS:JSONDecode(resp) end)
        if not decodeOk or not data then return "❌ Invalid response" end

        local count = data.extractedCount or 0
        if count == 0 then return "🔍 No scripts found for: "..arg end

        local out = "📜 **Scripts for "..arg.."** ("..count.." found)\n\n"

        for i, s in ipairs(data.scripts or {}) do
            if i > 8 then break end
            local badge = "⚫"
            if s.safety then
                if s.safety.level == "SAFE" or s.safety.level == "LIKELY_SAFE" then badge = "🟢"
                elseif s.safety.level == "CAUTION" then badge = "🟡"
                elseif s.safety.level == "SUSPICIOUS" then badge = "🟠"
                elseif s.safety.level == "DANGER" then badge = "🔴" end
            end
            out = out .. "**"..i..". "..badge.."** `"..s.code.."`\n"
            if s.sourceTitle then out = out .. "Source: "..s.sourceTitle.."\n" end
            out = out .. "\n"
        end
        return out
    end
},
web_search = {
    desc = "Search general web for info/news. arg: query text",
    run = function(arg)
        if not arg or arg == "" then return "❌ No query" end
        return doSearch(arg, "web")
    end
},
search_music = {
    desc = "Search Roblox audio/music IDs. arg: keyword like 'phonk' or 'lofi'",
    run = function(arg)
        if not arg or arg == "" then return "❌ No query" end
        return doSearch(arg, "audio")
    end
},
search_game = {
    desc = "Search Roblox games. arg: game name",
    run = function(arg)
        if not arg or arg == "" then return "❌ No query" end
        return doSearch(arg, "game")
    end
},
search_user = {
    desc = "Search Roblox users/players. arg: username",
    run = function(arg)
        if not arg or arg == "" then return "❌ No query" end
        return doSearch(arg, "user")
    end
   },
}

_G.YinetsuActions = ACTIONS

-- Build system prompt with action list

local actionSpec = "You are Yinetsu AI, assistant for the Yinetsu Remote Spy Roblox script.\n\n"    
actionSpec = actionSpec .. "CRITICAL RULES:\n"
    actionSpec = actionSpec .. "1. Detect the user's language and ALWAYS reply in the SAME language. Korean→Korean, Spanish→Spanish, Tagalog→Tagalog, Portuguese→Portuguese, Japanese→Japanese, etc.\n"
    actionSpec = actionSpec .. "2. Never default to English unless the user wrote in English.\n"
    actionSpec = actionSpec .. "3. When the user asks you to DO something, output the action tag on its own line: [ACTION:action_name:arg]\n"
    actionSpec = actionSpec .. "4. Even if the user speaks another language, extract the intent and output the action in English. Example: Korean '테마를 오션으로 바꿔' → [ACTION:change_theme:ocean]\n"
    actionSpec = actionSpec .. "5. After the action tag, write a SHORT confirmation in the user's language.\n\n"
    actionSpec = actionSpec .. "AVAILABLE ACTIONS:\n"
    for name, data in pairs(ACTIONS) do
        actionSpec = actionSpec .. "- " .. name .. ": " .. data.desc .. "\n"
    end
    actionSpec = actionSpec .. "\n\n*** SCRIPT FETCHING ***\n"
actionSpec = actionSpec .. "When user provides a URL to a Lua script and asks to fetch/get/download it, output: [ACTION:fetch_script:URL]\n"
actionSpec = actionSpec .. "Examples:\n"
actionSpec = actionSpec .. "  * 'kunin mo yung #1' (after search results) → [ACTION:fetch_script:PASTE_URL_HERE]\n"
actionSpec = actionSpec .. "  * 'fetch this script pastebin.com/raw/xyz' → [ACTION:fetch_script:https://pastebin.com/raw/xyz]\n"
actionSpec = actionSpec .. "  * 'get the code from that link' → [ACTION:fetch_script:URL]\n"
actionSpec = actionSpec .. "After fetching, the system will show the code + safety analysis.\n"
actionSpec = actionSpec .. "\n\n*** SCRIPT SEARCH ***\n"
actionSpec = actionSpec .. "When user asks for a Roblox SCRIPT/LOADSTRING/EXPLOIT for a specific game → [ACTION:search_script:game_name]\n"
actionSpec = actionSpec .. "Examples:\n"
actionSpec = actionSpec .. "  * 'hanap mo Blox Fruits script' → [ACTION:search_script:Blox Fruits]\n"
actionSpec = actionSpec .. "  * 'find Arsenal script' → [ACTION:search_script:Arsenal]\n"
actionSpec = actionSpec .. "  * 'search Doors exploit' → [ACTION:search_script:Doors]\n"
actionSpec = actionSpec .. "The system will auto-extract loadstrings from search results.\n"
actionSpec = actionSpec .. "\n\n🚨 MANDATORY OUTPUT FORMAT 🚨\n"
actionSpec = actionSpec .. "IMPORTANT: Only output an ACTION tag if the user explicitly asks to SEARCH, FIND, EXECUTE, or CONTROL something in the UI.\n"
actionSpec = actionSpec .. "If the user is asking general questions (e.g., 'who is Elon Musk', 'what is 2+2', or casual chit-chat), DO NOT output any action tag. Answer directly and concisely in conversational text in their language.\n\n"
actionSpec = actionSpec .. "If user explicitly asks for a SCRIPT/EXPLOIT → [ACTION:search_script:GAME_NAME]\n"
actionSpec = actionSpec .. "If user explicitly asks to search MUSIC → [ACTION:search_music:KEYWORD]\n"
actionSpec = actionSpec .. "If user explicitly asks to search a GAME → [ACTION:search_game:KEYWORD]\n"
actionSpec = actionSpec .. "FORMAT (EXACT):\n"
actionSpec = actionSpec .. "Line 1: [ACTION:action_name:argument]\n"
actionSpec = actionSpec .. "Line 2+: Short reply in user's language (1-2 lines max)\n\n"
actionSpec = actionSpec .. "CORRECT EXAMPLES:\n"
actionSpec = actionSpec .. "  User: 'hanap mo steal-egg script' → 'Here: [ACTION:search_script:steal-egg]\\nHinahanap ko na!'\n"
actionSpec = actionSpec .. "  User: 'find phonk music' → '[ACTION:search_music:phonk]\\nSearching!'\n"
actionSpec = actionSpec .. "  User: 'find game like Doors' → '[ACTION:search_game:Doors]\\nSearching!'\n\n"
actionSpec = actionSpec .. "WRONG (do NOT do this):\n"
actionSpec = actionSpec .. "  ✗ 'Here is a loadstring for you.' (NO ACTION TAG — FAIL)\n"
actionSpec = actionSpec .. "  ✗ 'I found some scripts.' (NO ACTION TAG — FAIL)\n"
actionSpec = actionSpec .. "  ✗ 'Searching for scripts...' (NO ACTION TAG — FAIL)\n\n"
actionSpec = actionSpec .. "If you don't output the action tag, the user gets NOTHING. Always include the tag.\n"
    actionSpec = actionSpec .. "\n\nSEARCH GUIDELINES (multi-language aware):\n"
actionSpec = actionSpec .. "- User wants to find MUSIC/AUDIO/SONGS/IDs on Roblox → [ACTION:search_music:keyword]\n"
actionSpec = actionSpec .. "- User wants to find GAMES/EXPERIENCES on Roblox → [ACTION:search_game:keyword]\n"
actionSpec = actionSpec .. "- User wants to find PLAYERS/USERS on Roblox → [ACTION:search_user:username]\n"
actionSpec = actionSpec .. "- User wants general info/news/articles from the web → [ACTION:web_search:query]\n"
actionSpec = actionSpec .. "- Examples in ANY language:\n"
actionSpec = actionSpec .. "  * 'find phonk IDs' / 'hanap phonk ID' / 'busca phonk' → [ACTION:search_music:phonk]\n"
actionSpec = actionSpec .. "  * 'search Roblox news' / 'hanapin balita' → [ACTION:web_search:Roblox news]\n"
actionSpec = actionSpec .. "  * 'find game like Doors' → [ACTION:search_game:Doors]\n"
actionSpec = actionSpec .. "  * 'find user Royce' → [ACTION:search_user:Royce]\n"
actionSpec = actionSpec .. "\n\n🧠 CONTEXT-AWARE COMMANDS (CRITICAL) 🧠\n"
actionSpec = actionSpec .. "You remember the LAST search results. When user refers to a result by number, use context actions.\n\n"
actionSpec = actionSpec .. "User may use: #1, #2, number, 'una', 'pangalawa', 'first', 'second', 'yung 1st', 'yung 3rd', etc.\n\n"
actionSpec = actionSpec .. "CONTEXT ACTIONS:\n"
actionSpec = actionSpec .. "- User wants to COPY a result → [ACTION:copy_result:NUMBER]\n"
actionSpec = actionSpec .. "- User wants to EXECUTE a script → [ACTION:execute_result:NUMBER]\n"
actionSpec = actionSpec .. "- User wants to JOIN a game → [ACTION:join_result:NUMBER]\n"
actionSpec = actionSpec .. "- User wants to ADD music to playlist → [ACTION:playlist_result:NUMBER]\n"
actionSpec = actionSpec .. "- User wants the URL → [ACTION:open_result:NUMBER]\n\n"
actionSpec = actionSpec .. "EXAMPLES:\n"
actionSpec = actionSpec .. "  'i-copy mo yung #1' → [ACTION:copy_result:1]\n"
actionSpec = actionSpec .. "  'execute mo yung 2' → [ACTION:execute_result:2]\n"
actionSpec = actionSpec .. "  'join mo yung 3' → [ACTION:join_result:3]\n"
actionSpec = actionSpec .. "  'add yung una sa playlist' → [ACTION:playlist_result:1]\n"
actionSpec = actionSpec .. "  'copy mo yung pangalawa' → [ACTION:copy_result:2]\n"
actionSpec = actionSpec .. "  'kunin mo URL ng 1st' → [ACTION:open_result:1]\n"
actionSpec = actionSpec .. "  'ano yung #3?' → no action, just describe\n"
actionSpec = actionSpec .. "  'more like this' → re-run last search\n\n"
actionSpec = actionSpec .. "NUMBER MAPPING (multi-language):\n"
actionSpec = actionSpec .. "  una/first/1/1st/isang → 1\n"
actionSpec = actionSpec .. "  pangalawa/second/2/2nd/dalawa → 2\n"
actionSpec = actionSpec .. "  pangatlo/third/3/3rd/tatlo → 3\n"
actionSpec = actionSpec .. "  pang-apat/fourth/4/4th/apat → 4\n"
actionSpec = actionSpec .. "  ... and so on\n"
actionSpec = actionSpec .. "\n\n💾 PERSISTENCE COMMANDS 💾\n"
actionSpec = actionSpec .. "- User wants to see past searches → [ACTION:show_history]\n"
actionSpec = actionSpec .. "- User wants to clear search history → [ACTION:clear_history]\n"
actionSpec = actionSpec .. "- User wants to save current search → [ACTION:save_search]\n"
actionSpec = actionSpec .. "- User wants to see favorites → [ACTION:show_favorites]\n"
actionSpec = actionSpec .. "- User wants to clear favorites → [ACTION:clear_favorites]\n\n"
actionSpec = actionSpec .. "Examples:\n"
actionSpec = actionSpec .. "  'show my history' / 'ano mga hinanap ko' → [ACTION:show_history]\n"
actionSpec = actionSpec .. "  'clear history' / 'burahin mo history' → [ACTION:clear_history]\n"
actionSpec = actionSpec .. "  'save this' / 'i-save mo to' → [ACTION:save_search]\n"
actionSpec = actionSpec .. "  'show favorites' / 'ipakita mo favorites' → [ACTION:show_favorites]\n"
actionSpec = actionSpec .. "  'clear favorites' → [ACTION:clear_favorites]\n"
actionSpec = actionSpec .. "\n\n🛡️ SCRIPT EXECUTION LOG 🛡️\n"
actionSpec = actionSpec .. "- User wants to see recent script executions → [ACTION:show_executions]\n"
actionSpec = actionSpec .. "- User wants to clear execution log → [ACTION:clear_executions]\n\n"
actionSpec = actionSpec .. "Examples:\n"
actionSpec = actionSpec .. "  'show executions' / 'ano na-execute ko' → [ACTION:show_executions]\n"
actionSpec = actionSpec .. "  'recent scripts' / 'history ng scripts' → [ACTION:show_executions]\n"
actionSpec = actionSpec .. "  'clear executions' / 'burahin execute log' → [ACTION:clear_executions]\n"
actionSpec = actionSpec .. "\n⚠️ SCRIPT SAFETY RULES ⚠️\n"
actionSpec = actionSpec .. "When user asks to EXECUTE a script from search results:\n"
actionSpec = actionSpec .. "  * If dangerous → [ACTION:execute_result:N]\n"
actionSpec = actionSpec .. "  * The system auto-blocks DANGER-level scripts and shows a preview\n"
actionSpec = actionSpec .. "  * User must confirm preview before execution (safety first)\n"
actionSpec = actionSpec .. "\n\n🎮 ROBLOX INTEGRATION 🎮\n"
actionSpec = actionSpec .. "- User wants info about current game → [ACTION:game_info]\n"
actionSpec = actionSpec .. "- User wants to JOIN a game by Place ID → [ACTION:join_by_id:NUMERIC_ID]\n"
actionSpec = actionSpec .. "- User wants to join #N from search results → [ACTION:join_result:N]\n"
actionSpec = actionSpec .. "- User wants to hop to another server of same game → [ACTION:server_hop_smart]\n"
actionSpec = actionSpec .. "- User wants to REJOIN the SAME current server → [ACTION:rejoin_current]\n"
actionSpec = actionSpec .. "- User wants to copy current server JobId → [ACTION:copy_jobid]\n"
actionSpec = actionSpec .. "- User wants to copy current game's link → [ACTION:copy_game_link]\n\n"
actionSpec = actionSpec .. "Examples (multi-language):\n"
actionSpec = actionSpec .. "  'join this game' / 'salihan mo ko dito' → [ACTION:rejoin_current]\n"
actionSpec = actionSpec .. "  'server hop' / 'lipat server' / 'hop tayo' → [ACTION:server_hop_smart]\n"
actionSpec = actionSpec .. "  'what game is this' / 'anong game to' → [ACTION:game_info]\n"
actionSpec = actionSpec .. "  'join game 2753915549' → [ACTION:join_by_id:2753915549]\n"
actionSpec = actionSpec .. "  'join mo yung #2' → [ACTION:join_result:2]\n"
actionSpec = actionSpec .. "  'copy jobid' → [ACTION:copy_jobid]\n"
actionSpec = actionSpec .. "  'copy link ng game' → [ACTION:copy_game_link]\n"
actionSpec = actionSpec .. "\nIf no action is needed, just reply normally in the user's language. Be concise."
    local ENCODED_SPEC = HS:UrlEncode(actionSpec)

    --==========================================================
    -- HEADER
    --==========================================================
    local aiHeader = panel(P.AI,"AIHeaderPanel",UDim2.new(1,-6,0,86),UDim2.new())
    padding(aiHeader,18,18,12,12)

    local aiDot = create("Frame",{
        Size=UDim2.fromOffset(10,10),
        Position=UDim2.new(0,4,0,10),
        BackgroundColor3=curThem.Sc,
        BorderSizePixel=0,
    },aiHeader)
    corner(aiDot,5)
    reg(aiDot,"BackgroundColor3",curThem.Sc,true)

    label(aiHeader,"YINETSU AI ASSISTANT",UDim2.new(1,-30,0,24),UDim2.new(0,22,0,2),15,curThem.Aa).Font=Enum.Font.GothamBold
    label(aiHeader,"Any language · Can control the script",UDim2.new(1,-30,0,18),UDim2.new(0,22,0,26),11,curThem.Mu)

    R.aiStatusLbl = label(aiHeader,"● Ready",UDim2.new(1,-30,0,18),UDim2.new(0,22,0,48),11,curThem.Sc)
    R.aiStatusLbl.Font = Enum.Font.GothamSemibold

    --==========================================================
    -- CHAT DISPLAY
    --==========================================================
    local chatDisplay = create("Frame",{
        Size=UDim2.new(1,-6,1,-230),
        Position=UDim2.new(0,0,0,98),
        BackgroundColor3=curThem.Bg,
        BackgroundTransparency=0.3,
        BorderSizePixel=0,
        ClipsDescendants=true,
    },P.AI)
    corner(chatDisplay,12); mkStroke(chatDisplay,curThem.Aa,1.5,0.15)
    reg(chatDisplay,"BackgroundColor3",curThem.Bg,false)
    R.aiChatDisplay = chatDisplay
    R.aiChatScroll = create("ScrollingFrame",{
        Size=UDim2.new(1,-16,1,-16),
        Position=UDim2.new(0,8,0,8),
        BackgroundTransparency=1,
        BorderSizePixel=0,
        ScrollBarThickness=5,
        ScrollBarImageColor3=curThem.Ac,
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
    },chatDisplay)

    local chatLayout = create("UIListLayout",{
        Padding=UDim.new(0,10),
        SortOrder=Enum.SortOrder.LayoutOrder,
    },R.aiChatScroll)

    padding(R.aiChatScroll,4,8,4,8)

    --==========================================================
    -- INPUT AREA
    --==========================================================
    local inputPanel = create("Frame",{
        Size=UDim2.new(1,-6,0,112),
        Position=UDim2.new(0,0,1,-118),
        BackgroundTransparency=1,
        BorderSizePixel=0,
    },P.AI)

    R.aiInputBox = create("TextBox",{
        Size=UDim2.new(1,-116,0,46),
        Position=UDim2.new(0,0,0,0),
        BackgroundColor3=curThem.Sa,
        BorderSizePixel=0,
        Text="",
        PlaceholderText="Ask in any language...",
        PlaceholderColor3=curThem.Mu,
        TextColor3=curThem.Tx,
        Font=Enum.Font.Gotham,
        TextSize=13,
        ClearTextOnFocus=false,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Center,
    },inputPanel)
    corner(R.aiInputBox,10)
    padding(R.aiInputBox,14,14,0,0)
    mkStroke(R.aiInputBox,curThem.Ac,1.5,0.15)
    reg(R.aiInputBox,"BackgroundColor3",curThem.Sa,false)

    R.aiSendBtn = pBtn(inputPanel,"Send →",UDim2.new(0,106,0,46),UDim2.new(1,-106,0,0),nil)
    R.aiClearBtn = pBtn(inputPanel,"Clear Chat",UDim2.new(0,106,0,40),UDim2.new(0,0,0,58),nil)

    R.aiCharCount = create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-116,0,40),
        Position=UDim2.new(0,0,0,58),
        Text="0 / 500",
        TextColor3=curThem.Mu,
        Font=Enum.Font.Gotham,
        TextSize=10,
        TextXAlignment=Enum.TextXAlignment.Right,
        TextYAlignment=Enum.TextYAlignment.Center,
    },inputPanel)
    reg(R.aiCharCount,"TextColor3",curThem.Mu,true)

    R.aiInputBox:GetPropertyChangedSignal("Text"):Connect(function()
        local len = #R.aiInputBox.Text
        R.aiCharCount.Text = len.." / 500"
        R.aiCharCount.TextColor3 = len > 450 and curThem.Wa or curThem.Mu
        if len > 500 then
            R.aiInputBox.Text = R.aiInputBox.Text:sub(1,500)
        end
    end)

    --==========================================================
    -- MESSAGE RENDERER
    --==========================================================
    local function calcTextHeight(text, availWidth)
        local ok, bounds = pcall(function()
            return TextService:GetTextSize(text, 12, Enum.Font.Gotham, Vector2.new(availWidth, math.huge))
        end)
        local h = (ok and bounds and bounds.Y) or 24
        if h < 20 then h = 20 end
        return h
    end

local function addMessage(sender, text, isUser, skipTypewriter, isAction)
    local availWidth = math.max(150, (R.aiChatScroll.AbsoluteSize.X or 320) - 60)
    local textHeight = calcTextHeight(text, availWidth)

    local bgColor = isUser and curThem.Sa or curThem.Su
    local strokeCol = isUser and curThem.Aa or (isAction and curThem.Sc or curThem.Ac)

    local msgFrame = create("Frame",{
        Size=UDim2.new(1,-8,0, textHeight + 46),
        BackgroundColor3 = bgColor,
        BackgroundTransparency = 0.15,
        BorderSizePixel=0,
    },R.aiChatScroll)
    corner(msgFrame,10)
    mkStroke(msgFrame, strokeCol, 1.5, 0.15)
    reg(msgFrame,"BackgroundColor3", bgColor, false)
    padding(msgFrame, 14, 14, 10, 12)

    local topRow = create("Frame",{
        Size=UDim2.new(1,0,0,16),
        BackgroundTransparency=1,
    },msgFrame)

    local senderLbl = create("TextLabel",{
        Size=UDim2.new(1,-80,1,0),
        BackgroundTransparency=1,
        Text=sender,
        TextColor3 = isUser and curThem.Aa or (isAction and curThem.Sc or curThem.Ac),
        Font=Enum.Font.GothamBold,
        TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Center,
    },topRow)
    reg(senderLbl,"TextColor3", isUser and curThem.Aa or (isAction and curThem.Sc or curThem.Ac), true)

    local timeLbl = create("TextLabel",{
        Size=UDim2.new(0,80,1,0),
        Position=UDim2.new(1,-80,0,0),
        BackgroundTransparency=1,
        Text=os.date("%H:%M"),
        TextColor3=curThem.Mu,
        Font=Enum.Font.Gotham,
        TextSize=10,
        TextXAlignment=Enum.TextXAlignment.Right,
        TextYAlignment=Enum.TextYAlignment.Center,
    },topRow)
    reg(timeLbl,"TextColor3",curThem.Mu,true)

    local textLbl = create("TextLabel",{
        Size=UDim2.new(1,0,0,textHeight),
        Position=UDim2.new(0,0,0,22),
        BackgroundTransparency=1,
        Text=(skipTypewriter or isUser) and text or "",
        TextColor3=curThem.Tx,
        Font=Enum.Font.Gotham,
        TextSize=12,
        TextWrapped=true,
        TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Top,
    },msgFrame)
    reg(textLbl,"TextColor3",curThem.Tx,true)

    -- One-time scroll to bottom (pagkatapos ma-render yung message)
    task.defer(function()
        task.wait(0.1)
        if R.aiChatScroll and msgFrame and msgFrame.Parent then
            R.aiChatScroll.CanvasPosition = Vector2.new(0, chatLayout.AbsoluteContentSize.Y)
        end
    end)

    -- Typewriter effect (walang scroll habang nagta-type)
    if not isUser and not skipTypewriter then
        task.spawn(function()
            local full = text
            for i = 1, #full do
                if not textLbl or not textLbl.Parent then return end
                textLbl.Text = full:sub(1, i)
                task.wait(0.015)
            end
        end)
    end

    table.insert(chatHistory, {sender=sender, text=text, isUser=isUser})
    return msgFrame, textLbl
end

    --==========================================================
    -- ACTION PARSER
    --==========================================================
    local function parseActions(replyText)
        local actions = {}
        for actionStr in replyText:gmatch("%[ACTION:([^%]]+)%]") do
            local parts = {}
            for p in actionStr:gmatch("([^:]+)") do table.insert(parts, p) end
            table.insert(actions, {name=parts[1], arg=parts[2], raw=actionStr})
        end
        local cleaned = replyText:gsub("%[ACTION:[^%]]+%]",""):gsub("%s+$",""):gsub("^\n+",""):gsub("^%s+","")
        return cleaned, actions
    end


local function executeActions(actions)
    if #actions == 0 then return end
    local searchActions = {
        search_music = "audio",
        search_game = "game",
        search_user = "user",
        web_search = "web",
        search_script = "script",
    }
    for _, a in ipairs(actions) do
        local handler = ACTIONS[a.name]
        if handler then
            -- Show spinner during action
            local spinnerFrame
            if R.aiStatusLbl and R.aiStatusLbl.Parent then
                spinnerFrame, _ = R.makeSpinner(R.aiChatScroll, 28)
                spinnerFrame.LayoutOrder = 999998
            end

            if searchActions[a.name] then
                local data, err = doSearchData(a.arg, searchActions[a.name])
                if data then
                    task.wait(0.15)
                    -- NORMALIZE: script type has 'scripts' instead of 'results'
                    if searchActions[a.name] == "script" then
                        local normalized = {
                            query = data.query or a.arg,
                            type = "script",
                            count = data.extractedCount or 0,
                            source = "tavily",
                            results = {}
                        }
                        for i, s in ipairs(data.scripts or {}) do
                            table.insert(normalized.results, {
                                title = (s.sourceTitle or "Script").." #"..i,
                                code = s.code or "",
                                safety = s.safety,
                                url = s.source or "",
                            })
                        end
                        data = normalized
                    end
                    -- AUTO-SAVE HISTORY
                    pcall(function()
                        if not isfolder(cfg.Dir) then makefolder(cfg.Dir) end
                        local histPath = cfg.Dir.."/history.json"
                        local hist = {}
                        if isfile(histPath) then
                            local ok2, h = pcall(function() return HS:JSONDecode(readfile(histPath)) end)
                            if ok2 and type(h) == "table" then hist = h end
                        end
                        table.insert(hist, {
                            type = searchActions[a.name],
                            query = a.arg or "?",
                            time = os.date("%H:%M"),
                            date = os.date("%Y-%m-%d"),
                            count = #(data.results or {})
                        })
                        while #hist > 50 do table.remove(hist, 1) end
                        writefile(histPath, HS:JSONEncode(hist))
                    end)
                    -- RENDER
                    local renderOk, renderErr = pcall(renderSearchResults, data, searchActions[a.name])
                    if renderOk then
                        notify("✅ Search done", "success")
                    else
                        warn("[Yinetsu] renderSearchResults ERROR: "..tostring(renderErr))
                        notify("❌ Render error — check console", "error")
                    end
                else
                    notify("❌ "..(err or "Search failed"), "error")
                end
            else
                local ok, res = pcall(handler.run, a.arg)
                if spinnerFrame and spinnerFrame.Parent then spinnerFrame:Destroy() end
                if ok then
                    notify("⚡ "..(res or a.name), "success")
                else
                    notify("Action failed: "..a.name, "error")
                end
            end
            if spinnerFrame and spinnerFrame.Parent then spinnerFrame:Destroy() end
        else
            notify("Unknown action: "..a.name, "warn")
        end
    end
end

    --==========================================================
    -- TYPING INDICATOR
    --==========================================================
    local function showTyping()
        local typingFrame = create("Frame",{
            Name="TypingIndicator",
            Size=UDim2.new(0,180,0,42),
            BackgroundColor3=curThem.Su,
            BackgroundTransparency=0.15,
            BorderSizePixel=0,
        },R.aiChatScroll)
        corner(typingFrame,10)
        mkStroke(typingFrame,curThem.Ac,1.5,0.2)
        reg(typingFrame,"BackgroundColor3",curThem.Su,false)
        padding(typingFrame,14,14,10,10)

        local lbl = create("TextLabel",{
            Size=UDim2.new(1,-40,1,0),
            BackgroundTransparency=1,
            Text="Yinetsu AI is thinking",
            TextColor3=curThem.Aa,
            Font=Enum.Font.Gotham,
            TextSize=12,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextYAlignment=Enum.TextYAlignment.Center,
        },typingFrame)
        reg(lbl,"TextColor3",curThem.Aa,true)

        local dots = {}
        for i=1,3 do
            local d = create("Frame",{
                Size=UDim2.fromOffset(6,6),
                Position=UDim2.new(1, -(30) + (i-1)*9, 0.5, -3),
                BackgroundColor3=curThem.Ac,
                BackgroundTransparency=0.5,
                BorderSizePixel=0,
            },typingFrame)
            corner(d,3)
            dots[i] = d
        end

        local tick = 0
        local animConn = RS.RenderStepped:Connect(function(dt)
            tick = tick + dt
            for i, d in ipairs(dots) do
                if d and d.Parent then
                    local phase = (tick*3 - i*0.3) % 1
                    d.BackgroundTransparency = 0.2 + math.abs(math.sin(phase * math.pi)) * 0.6
                end
            end
        end)

        typingFrame.AncestryChanged:Connect(function()
            if not typingFrame:IsDescendantOf(game) then
                if animConn then animConn:Disconnect() end
            end
        end)

        task.defer(function()
            task.wait(0.08)
            if R.aiChatScroll then
                R.aiChatScroll.CanvasPosition = Vector2.new(0, chatLayout.AbsoluteContentSize.Y)
            end
        end)

        return typingFrame
    end

    --==========================================================
    -- SEND MESSAGE
    --==========================================================
    local function sendMessage()
        if isWaiting then return end
        local message = R.aiInputBox.Text
        if not message or message:gsub("%s","") == "" then return end

        addMessage("You", message, true, true)
        R.aiInputBox.Text = ""
        isWaiting = true
        R.aiSendBtn.Text = "..."
        R.aiStatusLbl.Text = "● Thinking..."
        R.aiStatusLbl.TextColor3 = curThem.Wa

        local typing = showTyping()

task.spawn(function()
    local ok, err = pcall(function()
        -- Build conversation history (last 10 messages)
        local historyList = {}
        local total = #chatHistory
        local startIdx = math.max(1, total - 10)
        for i = startIdx, total do
            local h = chatHistory[i]
            if h and h.text and h.text ~= "" then
                table.insert(historyList, {
                    role = h.isUser and "user" or "assistant",
                    content = h.text
                })
            end
        end
        local historyJSON = HS:JSONEncode(historyList)
        local encodedHistory = HS:UrlEncode(historyJSON)

        -- Retry logic (3 attempts with exponential backoff)
        local response, httpOk
        local maxRetries = 3
        for attempt = 1, maxRetries do
            httpOk, response = pcall(function()
                return game:HttpGet(
                    AI_ENDPOINT .. "?message=" .. HS:UrlEncode(message) ..
                    "&system=" .. ENCODED_SPEC ..
                    "&history=" .. encodedHistory,
                    true
                )
            end)
            if httpOk and response and #response > 0 then break end
            if attempt < maxRetries then
                if R.aiStatusLbl and R.aiStatusLbl.Parent then
                    R.aiStatusLbl.Text = "● Retry "..attempt.."/"..maxRetries
                end
                task.wait(0.5 * attempt)
            end
        end

        if not httpOk or not response or #response == 0 then
            error("Network failed after "..maxRetries.." retries")
        end

        if typing and typing.Parent then typing:Destroy() end

        local decodeOk, data = pcall(function() return HS:JSONDecode(response) end)
        local replyText = nil
        if decodeOk and type(data) == "table" then
            replyText = data.reply or data.message or data.response or data.text
        end
        if type(replyText) ~= "string" or replyText == "" then
            replyText = tostring(response)
        end

        local cleanText, actions = parseActions(replyText)
        local isAction = #actions > 0
        if cleanText == "" and isAction then cleanText = "⚡ Done!" end

        addMessage("Yinetsu AI", cleanText, false, false, isAction)

        if isAction then
            local ok2, err2 = pcall(executeActions, actions)
            if not ok2 then
                warn("[Yinetsu] executeActions error: " .. tostring(err2))
                notify("❌ Action error", "error")
            end
        end
    end)

    if typing and typing.Parent then typing:Destroy() end
if not ok then
    warn("[Yinetsu] sendMessage error: " .. tostring(err))
    addMessage("Yinetsu AI", "❌ Error: " .. tostring(err) .. "\n\n_Tap to retry_", false, true)
    R.aiStatusLbl.Text = "● Error"
    R.aiStatusLbl.TextColor3 = curThem.Da

    -- Auto-retry button
    local retryBtn = pBtn(R.aiChatScroll, "🔄 Retry", UDim2.new(0,120,0,34), UDim2.new(), function()
        R.aiInputBox.Text = message
        sendMessage()
    end)
    retryBtn.LayoutOrder = 999999
else
    R.aiStatusLbl.Text = "● Ready"
    R.aiStatusLbl.TextColor3 = curThem.Sc
end

    isWaiting = false
    R.aiSendBtn.Text = "Send →"
    end)
end
    R.aiSendBtn.Activated:Connect(sendMessage)
    R.aiInputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then sendMessage() end
    end)

    R.aiClearBtn.Activated:Connect(function()
        for _, child in ipairs(R.aiChatScroll:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end
        chatHistory = {}
        addMessage("Yinetsu AI", "Chat cleared. How can I help you?", false, true)
        R.aiStatusLbl.Text = "● Ready"
        R.aiStatusLbl.TextColor3 = curThem.Sc
        notify("Chat cleared","info")
    end)

task.defer(function()
    task.wait(0.5)
    local uname = LP.DisplayName or LP.Name
    addMessage("Yinetsu AI", "Hi "..uname.."! I'm Yinetsu AI, how can I help you?", false, false)
    end)
end
--==============================================================
-- EDITOR PAGE
--==============================================================
do
    local edPages = {}
    local curPg = 1
    local function initPg(p) if not edPages[p] then edPages[p]={text="{\n  [1]='Speed',\n  [2]=100\n}",looping=false,speed=0.1} end end
    initPg(1)

    local EdP = panel(P.Editor,"EdPanel",UDim2.new(1,-6,0,70),UDim2.new())
    padding(EdP,18,18,12,12)
    label(EdP,"YINETSU EDITOR",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    R.lblPg = label(EdP,"Page: 1 · Loop: OFF",UDim2.new(1,0,0,22),UDim2.new(0,0,0,30),12,curThem.Mu)

    local edH = create("Frame",{Size=UDim2.new(1,-6,0,260),BackgroundColor3=curThem.Bg,BorderSizePixel=0},P.Editor)
    corner(edH,12); mkStroke(edH,curThem.Aa,1.5,0.15); reg(edH,"BackgroundColor3",curThem.Bg,false)

    R.EdBox = create("TextBox",{Size=UDim2.new(1,-20,1,-20),Position=UDim2.new(0,10,0,10),BackgroundTransparency=1,Text="",TextColor3=curThem.Sc,Font=Enum.Font.Code,TextSize=12,MultiLine=true,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top},edH)
    reg(R.EdBox,"TextColor3",curThem.Sc,true)

    -- Scrollable row WITH UIPadding to prevent stroke clipping
    local edBRHolder = create("Frame",{Size=UDim2.new(1,-6,0,56),BackgroundTransparency=1},P.Editor)
    local edBR = create("ScrollingFrame",{
        Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
        ScrollBarThickness=4,ScrollBarImageColor3=curThem.Ac,
        CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.X,
        ScrollingDirection=Enum.ScrollingDirection.X,
    },edBRHolder)
    padding(edBR,8,8,8,8)
    create("UIListLayout",{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},edBR)

    local function eB(t,w,cb) return pBtn(edBR,t,UDim2.new(0,w or 100,0,44),UDim2.new(),cb) end

    R.edSpd = create("TextBox",{Size=UDim2.new(0,80,0,44),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="0.1",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},edBR)
    corner(R.edSpd,8); mkStroke(R.edSpd,curThem.Ac,1.5,0.15); reg(R.edSpd,"BackgroundColor3",curThem.Sa,false)

    local function upPgUI()
        R.lblPg.Text = string.format("Page: %d · Loop: %s · Speed: %s",curPg,edPages[curPg].looping and "ON" or "OFF",tostring(edPages[curPg].speed))
        R.EdBox.Text = edPages[curPg].text
        R.edSpd.Text = tostring(edPages[curPg].speed)
    end
    R.EdBox:GetPropertyChangedSignal("Text"):Connect(function() if edPages[curPg] then edPages[curPg].text = R.EdBox.Text end end)
    R.edSpd:GetPropertyChangedSignal("Text"):Connect(function() if edPages[curPg] then edPages[curPg].speed = tonumber(R.edSpd.Text) or 0.1 end end)

    local function fireEd(c)
        if not S.selR or not S.selR.Parent then notify("No remote selected","warn"); return end
        local s, r = pcall(function() return loadstring("return "..c)() end)
        if s and typeof(r)=="table" then
            if S.selR.ClassName=="RemoteEvent" then S.selR:FireServer(unpack(r))
            else
                local ret = {S.selR:InvokeServer(unpack(r))}
                getgenv().LastReturn = ret
                R.CodeView.Text = "-- [[ SERVER RETURN ]]\n"..beautify(ret)
            end
        end
    end

    eB("Run",80,function() fireEd(R.EdBox.Text); notify("Executed","success") end).LayoutOrder=1
    eB("Beautify",100,function()
        local s,r = pcall(function() return loadstring("return "..R.EdBox.Text)() end)
        if s and typeof(r)=="table" then R.EdBox.Text = beautify(r); notify("Beautified","success") else notify("Invalid","error") end
    end).LayoutOrder=2
    eB("Minify",90,function()
        local s,r = pcall(function() return loadstring("return "..R.EdBox.Text)() end)
        if s and typeof(r)=="table" then R.EdBox.Text = v2s(r); notify("Minified","success") else notify("Invalid","error") end
    end).LayoutOrder=3
    eB("Prev",80,function() if curPg>1 then curPg=curPg-1; upPgUI() end end).LayoutOrder=4
    eB("Next",80,function() curPg=curPg+1; initPg(curPg); upPgUI() end).LayoutOrder=5
    eB("Loop",90,function()
        local p = curPg
        edPages[p].looping = not edPages[p].looping
        upPgUI()
        if edPages[p].looping then
            task.spawn(function()
                while edPages[p].looping and getgenv().YinetsuUIActive do
                    fireEd(edPages[p].text)
                    task.wait(edPages[p].speed)
                end
            end)
        end
    end).LayoutOrder=6

    local tpl = {{"WalkSpeed","{[1]='Speed', [2]=100}"},{"Teleport","{[1]=CFrame.new(0,100,0)}"},{"Kill","{[1]='Hit', [2]=workspace.Enemy}"},{"GodMode","{[1]=true, [2]='GodMode'}"},{"Reset","{}"}}
    local tIdx = 0
    eB("Template",100,function()
        tIdx = tIdx % #tpl + 1
        R.EdBox.Text = tpl[tIdx][2]
        notify("Template: "..tpl[tIdx][1],"info")
    end).LayoutOrder=7
    upPgUI()
end

--==============================================================
-- ZARCHIVER-STYLE FILE MANAGER (FIXED)
--==============================================================
do
    -- ═══════════════════════════════════════════════════════════
    -- STATE
    -- ═══════════════════════════════════════════════════════════
    local FM = {
        path = {},
        baseDir = "Yinetsu_Logs",
        showHidden = false,
        searchQuery = "",
        searching = false,
        multiMode = false,
        selected = {},
        clipboard = nil,
        window = nil,
        fileList = nil,
        breadcrumbRow = nil,
        statusLbl = nil,
        searchBar = nil,
        fabBtn = nil,
        clipboardBar = nil,
        selectBar = nil,
        hideList = {},
    }

    -- Forward declarations
    local refresh
    local updateClipboardBar
    local closeAllPopups
    local registerPopup
    local activePopups = {}
    local popupConnections = {}

    -- ═══════════════════════════════════════════════════════════
    -- HELPERS
    -- ═══════════════════════════════════════════════════════════
    local function getRootDir()
        return FM.baseDir .. "/" .. tostring(game.GameId)
    end

    local function getCurrentDir()
        if #FM.path == 0 then return getRootDir() end
        return getRootDir() .. "/" .. table.concat(FM.path, "/")
    end

    local function ensureDir(path)
        if not isfolder(path) then
            pcall(function() makefolder(path) end)
        end
    end

    local function fmtSize(bytes)
        bytes = tonumber(bytes) or 0
        if bytes < 1024 then return bytes.." B" end
        if bytes < 1024*1024 then return string.format("%.1f KB", bytes/1024) end
        if bytes < 1024*1024*1024 then return string.format("%.1f MB", bytes/1024/1024) end
        return string.format("%.1f GB", bytes/1024/1024/1024)
    end

    local function getFileName(fullPath)
        return fullPath:match("([^/\\]+)$") or fullPath
    end

    local function getExt(name)
        local e = name:match("%.([^%.]+)$")
        return e and e:lower() or ""
    end

    local function isScriptFile(name)
        local e = getExt(name)
        return e == "lua" or e == "txt" or e == "json" or e == "md"
    end

    local function getHideListPath()
        return FM.baseDir .. "/" .. tostring(game.GameId) .. "/.yinetsu_hidden.json"
    end

    local function loadHideList()
        local path = getHideListPath()
        if isfile(path) then
            local ok, data = pcall(function() return HS:JSONDecode(readfile(path)) end)
            if ok and type(data) == "table" then return data end
        end
        return {}
    end

    local function saveHideList(list)
        local path = getHideListPath()
        pcall(function()
            writefile(path, HS:JSONEncode(list))
        end)
    end

    local function isHidden(name, fullPath)
        if name:sub(1,1) == "." then return true end
        local list = FM.hideList or {}
        if fullPath and list[fullPath] then return true end
        if list[name] then return true end
        return false
    end

    local function getFileSize(path)
        local ok, size = pcall(function() return #readfile(path) end)
        if ok then return size end
        return 0
    end

    local function sanitizeName(n)
        return tostring(n or ""):gsub("[^%w_%-%. ]", ""):gsub("^%s+", ""):gsub("%s+$", "")
    end

    local function getUniquePath(dir, baseName)
        local candidate = dir .. "/" .. baseName
        if not isfile(candidate) and not isfolder(candidate) then
            return candidate
        end
        local name = baseName
        local ext = ""
        local dotI = baseName:match("^.*()%.")
        if dotI then
            name = baseName:sub(1, dotI - 1)
            ext = baseName:sub(dotI)
        end
        local i = 1
        while true do
            local try = dir .. "/" .. name .. " (" .. i .. ")" .. ext
            if not isfile(try) and not isfolder(try) then
                return try
            end
            i = i + 1
            if i > 1000 then return dir .. "/" .. name .. "_" .. os.time() .. ext end
        end
    end

    -- ═══════════════════════════════════════════════════════════
    -- SCAN
    -- ═══════════════════════════════════════════════════════════
    local function scanDir(dirPath, recursive)
        local results = {}
        local raw = {}
        pcall(function() raw = listfiles(dirPath) end)

        for _, p in pairs(raw) do
            local name = getFileName(p)
            local isDir = false
            pcall(function() isDir = isfolder(p) end)

            if FM.showHidden or not isHidden(name, p) then
                if isDir then
                    table.insert(results, {
                        name = name, path = p, isFolder = true, size = 0, type = "Folder",
                    })
                    if recursive then
                        local sub = scanDir(p, true)
                        for _, s in ipairs(sub) do
                            table.insert(results, s)
                        end
                    end
                else
                    local size = getFileSize(p)
                    local ext = getExt(name)
                    table.insert(results, {
                        name = name, path = p, isFolder = false, size = size,
                        type = ext ~= "" and (ext:upper().." file") or "File",
                    })
                end
            end
        end

        table.sort(results, function(a, b)
            if a.isFolder ~= b.isFolder then return a.isFolder end
            return a.name:lower() < b.name:lower()
        end)

        return results
    end

    -- ═══════════════════════════════════════════════════════════
    -- FILE OPS
    -- ═══════════════════════════════════════════════════════════
    local function copyItem(srcPath, destDir)
        local name = getFileName(srcPath)
        local destPath = getUniquePath(destDir, name)
        local isDir = false
        pcall(function() isDir = isfolder(srcPath) end)

        if isDir then
            local function copyFolder(src, dest)
                pcall(function() makefolder(dest) end)
                local raw = {}
                pcall(function() raw = listfiles(src) end)
                for _, p in pairs(raw) do
                    local n = getFileName(p)
                    local isD = false
                    pcall(function() isD = isfolder(p) end)
                    if isD then
                        copyFolder(p, dest .. "/" .. n)
                    else
                        pcall(function() writefile(dest .. "/" .. n, readfile(p)) end)
                    end
                end
            end
            copyFolder(srcPath, destPath)
        else
            pcall(function() writefile(destPath, readfile(srcPath)) end)
        end
        return destPath
    end

local function moveItem(srcPath, destDir)
    local name = getFileName(srcPath)
    local destPath = getUniquePath(destDir, name)
    local isDir = false
    pcall(function() isDir = isfolder(srcPath) end)

    if isDir then
        copyItem(srcPath, destDir)
        local function delFolder(src)
            local raw = {}
            pcall(function() raw = listfiles(src) end)
            for _, p in pairs(raw) do
                local isD = false
                pcall(function() isD = isfolder(p) end)
                if isD then delFolder(p)
                else pcall(function() delfile(p) end) end
            end
            pcall(function() delfolder(src) end)
        end
        delFolder(srcPath)
    else
        local okRead, content = pcall(readfile, srcPath)
        if okRead and content then
            local okWrite = pcall(writefile, destPath, content)
            -- Verify dest exists before deleting source
            if okWrite and isfile(destPath) then
                task.spawn(function()
                    task.wait(0.05)
                    pcall(delfile, srcPath)
                end)
            end
        end
    end
    return destPath
end

    local function deleteItem(path)
        local isDir = false
        pcall(function() isDir = isfolder(path) end)
        if isDir then
            local function delFolder(src)
                local raw = {}
                pcall(function() raw = listfiles(src) end)
                for _, p in pairs(raw) do
                    local isD = false
                    pcall(function() isD = isfolder(p) end)
                    if isD then delFolder(p)
                    else pcall(function() delfile(p) end) end
                end
                pcall(function() delfolder(src) end)
            end
            delFolder(path)
        else
            pcall(function() delfile(path) end)
        end
    end

    -- ═══════════════════════════════════════════════════════════
    -- POPUP SYSTEM
    -- ═══════════════════════════════════════════════════════════
    closeAllPopups = function()
        for _, conn in ipairs(popupConnections) do
            pcall(function() conn:Disconnect() end)
        end
        popupConnections = {}
        for _, p in ipairs(activePopups) do
            if p and p.Parent then pcall(function() p:Destroy() end) end
        end
        activePopups = {}
    end

    registerPopup = function(popup, extraConns)
        table.insert(activePopups, popup)
        if extraConns then
            for _, c in ipairs(extraConns) do
                table.insert(popupConnections, c)
            end
        end
    end

    -- ═══════════════════════════════════════════════════════════
    -- BUILD WINDOW
    -- ═══════════════════════════════════════════════════════════
R.openFM = function()
    -- Tanggalin existing FM kung meron
    if FM.window and FM.window.Parent then FM.window:Destroy() end
    closeAllPopups()

    -- HIDE main GUI elements para full focus sa FM
    if Header then Header.Visible = false end
    if Nav then Nav.Visible = false end
    if Cont then Cont.Visible = false end

    FM.path = {}
    FM.showHidden = false
    FM.searchQuery = ""
    FM.searching = false
    FM.multiMode = false
    FM.selected = {}
    FM.clipboard = nil
    FM.hideList = loadHideList()
    ensureDir(getRootDir())

-- Compute size based sa Main frame (hindi viewport)
local winW = Main.AbsoluteSize.X - 24   -- minus 12px margin each side
local winH = Main.AbsoluteSize.Y - 24   -- minus 12px margin top/bottom
winW = math.max(winW, 320)
winH = math.max(winH, 400)

local win = create("Frame", {
    Name = "ZFileManager",
    Size = UDim2.new(1, -24, 1, -24),  -- full width minus margin
    Position = UDim2.new(0, 12, 0, 12),  -- 12px margin from Main edges
    BackgroundColor3 = curThem.Bg,
    BorderSizePixel = 0,
    ZIndex = 800,
    ClipsDescendants = true,
}, Main)
        corner(win, 16); chromaStroke(win)
        reg(win, "BackgroundColor3", curThem.Bg, false)
        FM.window = win

        -- TOP BAR
        local topBar = create("Frame", {
            Name = "TopBar",
            Size = UDim2.new(1, 0, 0, 52),
            BackgroundColor3 = curThem.Su,
            BorderSizePixel = 0,
            ZIndex = 801,
        }, win)
        corner(topBar, 16)
        reg(topBar, "BackgroundColor3", curThem.Su, false)

        create("Frame", {
            Size = UDim2.new(1, 0, 0, 16),
            Position = UDim2.new(0, 0, 1, -16),
            BackgroundColor3 = curThem.Su,
            BorderSizePixel = 0, ZIndex = 802,
        }, topBar)

        create("Frame", {
            Size = UDim2.new(1, 0, 0, 2),
            Position = UDim2.new(0, 0, 1, -2),
            BackgroundColor3 = curThem.Ac,
            BorderSizePixel = 0, ZIndex = 803,
        }, topBar)

        -- Back button
        local backBtn = create("TextButton", {
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(0, 8, 0.5, -18),
            BackgroundColor3 = curThem.Sa,
            BorderSizePixel = 0,
            Text = "←", TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamBold, TextSize = 20,
            AutoButtonColor = false, ZIndex = 804,
        }, topBar)
        corner(backBtn, 8); mkStroke(backBtn, curThem.Ac, 1.5, 0.2)

        -- Breadcrumb
        local bcHolder = create("Frame", {
            Size = UDim2.new(1, -180, 0, 36),
            Position = UDim2.new(0, 52, 0.5, -18),
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            ZIndex = 804,
        }, topBar)

        local bcScroll = create("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.X,
            ScrollingDirection = Enum.ScrollingDirection.X,
            ZIndex = 804,
        }, bcHolder)

        create("UIListLayout", {
            Padding = UDim.new(0, 4),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }, bcScroll)

        -- Search button
        local searchBtn = create("TextButton", {
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(1, -88, 0.5, -18),
            BackgroundColor3 = curThem.Sa,
            BorderSizePixel = 0,
            Text = "🔍", TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamBold, TextSize = 14,
            AutoButtonColor = false, ZIndex = 804,
        }, topBar)
        corner(searchBtn, 8); mkStroke(searchBtn, curThem.Ac, 1.5, 0.2)

        -- Menu button
        local menuBtn = create("TextButton", {
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(1, -46, 0.5, -18),
            BackgroundColor3 = curThem.Sa,
            BorderSizePixel = 0,
            Text = "⋮", TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamBold, TextSize = 20,
            AutoButtonColor = false, ZIndex = 804,
        }, topBar)
        corner(menuBtn, 8); mkStroke(menuBtn, curThem.Ac, 1.5, 0.2)

        -- Search bar
        local searchBar = create("Frame", {
            Size = UDim2.new(1, -16, 0, 40),
            Position = UDim2.new(0, 8, 0, 58),
            BackgroundColor3 = curThem.Sa,
            BorderSizePixel = 0, Visible = false, ZIndex = 810,
        }, win)
        corner(searchBar, 10); mkStroke(searchBar, curThem.Ac, 1.5, 0.15)

        local searchInput = create("TextBox", {
            Size = UDim2.new(1, -44, 1, 0),
            Position = UDim2.new(0, 12, 0, 0),
            BackgroundTransparency = 1,
            PlaceholderText = "Search files (recursive)...",
            PlaceholderColor3 = curThem.Mu,
            Text = "", TextColor3 = curThem.Tx,
            Font = Enum.Font.Gotham, TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false, ZIndex = 811,
        }, searchBar)

        local searchClose = create("TextButton", {
            Size = UDim2.fromOffset(32, 32),
            Position = UDim2.new(1, -38, 0.5, -16),
            BackgroundTransparency = 1,
            Text = "✖", TextColor3 = curThem.Da,
            Font = Enum.Font.GothamBold, TextSize = 16,
            AutoButtonColor = false, ZIndex = 811,
        }, searchBar)

        -- Select bar
        local selectBar = create("Frame", {
            Size = UDim2.new(1, -16, 0, 44),
            Position = UDim2.new(0, 8, 0, 58),
            BackgroundColor3 = curThem.Su,
            BorderSizePixel = 0, Visible = false, ZIndex = 810,
        }, win)
        corner(selectBar, 10); chromaStroke(selectBar)
        FM.selectBar = selectBar

        local selectCancel = create("TextButton", {
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.new(0, 4, 0.5, -18),
            BackgroundColor3 = curThem.Da, BorderSizePixel = 0,
            Text = "✖", TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamBold, TextSize = 16,
            AutoButtonColor = false, ZIndex = 811,
        }, selectBar)
        corner(selectCancel, 8)

        local selectCount = create("TextLabel", {
    Size = UDim2.new(1, -200, 1, 0),
    Position = UDim2.new(0, 46, 0, 0),
    BackgroundTransparency = 1,
    Text = "0 selected", TextColor3 = curThem.Aa,
    Font = Enum.Font.GothamBold, TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 811,
}, selectBar)

local selectDel = create("TextButton", {
    Size = UDim2.fromOffset(34, 34),
    Position = UDim2.new(1, -42, 0.5, -17),
    BackgroundColor3 = curThem.Da, BorderSizePixel = 0,
    Text = "🗑", TextColor3 = curThem.Tx,
    Font = Enum.Font.GothamBold, TextSize = 14,
    AutoButtonColor = false, ZIndex = 811,
}, selectBar)
corner(selectDel, 8)

local selectCut = create("TextButton", {
    Size = UDim2.fromOffset(34, 34),
    Position = UDim2.new(1, -80, 0.5, -17),
    BackgroundColor3 = curThem.Sa, BorderSizePixel = 0,
    Text = "✂", TextColor3 = curThem.Tx,
    Font = Enum.Font.GothamBold, TextSize = 14,
    AutoButtonColor = false, ZIndex = 811,
}, selectBar)
corner(selectCut, 8); mkStroke(selectCut, curThem.Ac, 1.2, 0.2)

local selectCopy = create("TextButton", {
    Size = UDim2.fromOffset(34, 34),
    Position = UDim2.new(1, -118, 0.5, -17),
    BackgroundColor3 = curThem.Sa, BorderSizePixel = 0,
    Text = "📋", TextColor3 = curThem.Tx,
    Font = Enum.Font.GothamBold, TextSize = 14,
    AutoButtonColor = false, ZIndex = 811,
}, selectBar)
corner(selectCopy, 8); mkStroke(selectCopy, curThem.Ac, 1.2, 0.2)

local selectAll = create("TextButton", {
    Size = UDim2.fromOffset(34, 34),
    Position = UDim2.new(1, -156, 0.5, -17),
    BackgroundColor3 = curThem.Sa, BorderSizePixel = 0,
    Text = "✅", TextColor3 = curThem.Tx,
    Font = Enum.Font.GothamBold, TextSize = 14,
    AutoButtonColor = false, ZIndex = 811,
}, selectBar)
corner(selectAll, 8); mkStroke(selectAll, curThem.Ac, 1.2, 0.2)

        -- File list
        local listHolder = create("Frame", {
            Size = UDim2.new(1, -16, 1, -130),
            Position = UDim2.new(0, 8, 0, 58),
            BackgroundColor3 = curThem.Su,
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            ClipsDescendants = true, ZIndex = 805,
        }, win)
        corner(listHolder, 12); mkStroke(listHolder, curThem.Aa, 1.2, 0.3)

        local fileList = create("ScrollingFrame", {
            Size = UDim2.new(1, -8, 1, -8),
            Position = UDim2.new(0, 4, 0, 4),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            ScrollBarThickness = 5,
            ScrollBarImageColor3 = curThem.Ac,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ZIndex = 806,
        }, listHolder)
        FM.fileList = fileList
        create("UIListLayout", {
            Padding = UDim.new(0, 6),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }, fileList)
        padding(fileList, 4, 4, 4, 4)

        local emptyLbl = create("TextLabel", {
            Size = UDim2.new(1, -20, 0, 60),
            Position = UDim2.new(0, 10, 0, 80),
            BackgroundTransparency = 1,
            Text = "📂\nEmpty folder",
            TextColor3 = curThem.Mu,
            Font = Enum.Font.Gotham, TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Center,
            Visible = false, ZIndex = 806,
        }, listHolder)

        -- Status bar
        local statusBar = create("Frame", {
            Size = UDim2.new(1, -16, 0, 30),
            Position = UDim2.new(0, 8, 1, -36),
            BackgroundColor3 = curThem.Su,
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0, ZIndex = 805,
        }, win)
        corner(statusBar, 8); mkStroke(statusBar, curThem.Ac, 1, 0.4)

        local statusLbl = create("TextLabel", {
            Size = UDim2.new(1, -16, 1, 0),
            Position = UDim2.new(0, 8, 0, 0),
            BackgroundTransparency = 1,
            Text = "0 items", TextColor3 = curThem.Mu,
            Font = Enum.Font.Gotham, TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            ZIndex = 806,
        }, statusBar)

        -- FAB
local fab = create("TextButton", {
    Size = UDim2.fromOffset(52, 52),
    Position = UDim2.new(1, -64, 1, -128),
    BackgroundColor3 = curThem.Ac, BorderSizePixel = 0,
    Text = "+", TextColor3 = Color3.new(1,1,1),
    Font = Enum.Font.GothamBold, TextSize = 28,
    AutoButtonColor = false, ZIndex = 815,
}, win)
corner(fab, 26); mkStroke(fab, curThem.Aa, 2, 0)
FM.fabBtn = fab

        -- Clipboard bar
        local cbBar = create("Frame", {
            Size = UDim2.fromOffset(130, 52),
            Position = UDim2.new(1, -146, 1, -100),
            BackgroundColor3 = curThem.Su,
            BorderSizePixel = 0, Visible = false, ZIndex = 815,
        }, win)
        corner(cbBar, 26); chromaStroke(cbBar)
        FM.clipboardBar = cbBar

        local cbPaste = create("TextButton", {
            Size = UDim2.fromOffset(60, 44),
            Position = UDim2.new(0, 4, 0.5, -22),
            BackgroundColor3 = curThem.Sc, BorderSizePixel = 0,
            Text = "📋 Paste", TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamBold, TextSize = 11,
            AutoButtonColor = false, ZIndex = 816,
        }, cbBar)
        corner(cbPaste, 20); mkStroke(cbPaste, curThem.Ac, 1.2, 0.2)

        local cbCancel = create("TextButton", {
            Size = UDim2.fromOffset(56, 44),
            Position = UDim2.new(1, -60, 0.5, -22),
            BackgroundColor3 = curThem.Da, BorderSizePixel = 0,
            Text = "✖", TextColor3 = curThem.Tx,
            Font = Enum.Font.GothamBold, TextSize = 16,
            AutoButtonColor = false, ZIndex = 816,
        }, cbBar)
        corner(cbCancel, 20)

        -- ═══════════════════════════════════════════════════════
        -- MENU / DIALOG BUILDERS
        -- ═══════════════════════════════════════════════════════
        local makeMenu = function(anchorX, anchorY, items, width)
            closeAllPopups()
            width = width or 200
            local itemH = 34
            local paddingTop = 4
            local totalH = (#items * itemH) + (paddingTop * 2)

            local menu = create("Frame", {
                Size = UDim2.fromOffset(width, totalH),
                Position = UDim2.fromOffset(anchorX, anchorY),
                BackgroundColor3 = curThem.Su,
                BorderSizePixel = 0, ZIndex = 850,
            }, win)
            corner(menu, 10); chromaStroke(menu)
            reg(menu, "BackgroundColor3", curThem.Su, false)

            menu.BackgroundTransparency = 1
            TS:Create(menu, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()

            local winSize = win.AbsoluteSize
            local finalX = anchorX
            local finalY = anchorY
            if anchorX + width > winSize.X - 8 then finalX = winSize.X - width - 8 end
            if anchorY + totalH > winSize.Y - 8 then finalY = winSize.Y - totalH - 8 end
            if finalX < 8 then finalX = 8 end
            if finalY < 8 then finalY = 8 end
            menu.Position = UDim2.fromOffset(finalX, finalY)

            create("UIListLayout", {
                Padding = UDim.new(0, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }, menu)
            padding(menu, 4, 4, paddingTop, paddingTop)

            for i, item in ipairs(items) do
                local b = create("TextButton", {
                    Size = UDim2.new(1, 0, 0, itemH),
                    BackgroundColor3 = curThem.Sa,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Text = "  " .. item.label,
                    TextColor3 = item.color or curThem.Tx,
                    Font = Enum.Font.Gotham, TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutoButtonColor = false,
                    LayoutOrder = i, ZIndex = 851,
                }, menu)
                corner(b, 6)

                -- Hover feedback
                track(b.MouseEnter:Connect(function()
                    if b.Parent then
                        TS:Create(b, TweenInfo.new(0.1), {
                            BackgroundTransparency = 0.4,
                            BackgroundColor3 = curThem.Ac,
                        }):Play()
                    end
                end))
                track(b.MouseLeave:Connect(function()
                    if b.Parent then
                        TS:Create(b, TweenInfo.new(0.1), {
                            BackgroundTransparency = 1,
                            BackgroundColor3 = curThem.Sa,
                        }):Play()
                    end
                end))

                -- ✅ MouseButton1Click for mobile reliability
                local clickConn = b.MouseButton1Click:Connect(function()
                    local cb = item.cb
                    closeAllPopups()
                    if cb then pcall(cb) end
                end)
                track(clickConn)
            end

            -- Outside click detection
            local openedAt = tick()
            local outsideConn = UIS.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 and
                   input.UserInputType ~= Enum.UserInputType.Touch then return end
                if tick() - openedAt < 0.15 then return end
                if not menu or not menu.Parent then
                    if outsideConn then outsideConn:Disconnect() end
                    return
                end
                local pos = input.Position
                local ap = menu.AbsolutePosition
                local as = menu.AbsoluteSize
                local inMenu = pos.X >= ap.X and pos.X <= ap.X + as.X and
                               pos.Y >= ap.Y and pos.Y <= ap.Y + as.Y
                if not inMenu then closeAllPopups() end
            end)
            track(outsideConn)

            registerPopup(menu, {outsideConn})
            return menu
        end

        local makeDialog = function(title, contentBuilder, buttons)
            closeAllPopups()
            local dW = math.min(340, winW - 40)

            local dlg = create("Frame", {
                Size = UDim2.fromOffset(dW, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = curThem.Su,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                ZIndex = 860,
            }, win)
            corner(dlg, 14); chromaStroke(dlg)
            reg(dlg, "BackgroundColor3", curThem.Su, false)
            padding(dlg, 16, 16, 14, 14)

            dlg.BackgroundTransparency = 1
            TS:Create(dlg, TweenInfo.new(0.18), {BackgroundTransparency = 0}):Play()

            create("UIListLayout", {
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }, dlg)

            create("TextLabel", {
                Size = UDim2.new(1, 0, 0, 24),
                BackgroundTransparency = 1,
                Text = title, TextColor3 = curThem.Aa,
                Font = Enum.Font.GothamBold, TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1, ZIndex = 861,
            }, dlg)

            if contentBuilder then
                local contentFrame = create("Frame", {
                    Size = UDim2.new(1, 0, 0, 0),
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    LayoutOrder = 2, ZIndex = 861,
                }, dlg)
                contentBuilder(contentFrame)
            end

            local btnRow = create("Frame", {
                Size = UDim2.new(1, 0, 0, 38),
                BackgroundTransparency = 1,
                LayoutOrder = 3, ZIndex = 861,
            }, dlg)

            create("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
            }, btnRow)

            for i, btn in ipairs(buttons) do
                local b = create("TextButton", {
                    Size = UDim2.fromOffset(btn.width or 90, 36),
                    BackgroundColor3 = btn.color or curThem.Sa,
                    BorderSizePixel = 0,
                    Text = btn.label or "OK",
                    TextColor3 = curThem.Tx,
                    Font = Enum.Font.GothamSemibold, TextSize = 11,
                    AutoButtonColor = false,
                    LayoutOrder = i, ZIndex = 862,
                }, btnRow)
                corner(b, 8); mkStroke(b, curThem.Ac, 1.2, 0.2)

                track(b.MouseEnter:Connect(function()
                    if b.Parent then
                        TS:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = curThem.Ac}):Play()
                    end
                end))
                track(b.MouseLeave:Connect(function()
                    if b.Parent then
                        TS:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = btn.color or curThem.Sa}):Play()
                    end
                end))

                track(b.MouseButton1Click:Connect(function()
                    local cb = btn.cb
                    closeAllPopups()
                    if cb then pcall(cb) end
                end))
            end

            registerPopup(dlg, {})
            return dlg
        end

        -- ═══════════════════════════════════════════════════════
        -- HIDDEN MANAGER (now safe — after makeDialog)
        -- ═══════════════════════════════════════════════════════
        local showHiddenManager = function()
            closeAllPopups()

            local dW = math.min(400, winW - 30)
            local dH = math.min(440, winH - 60)

            local mgr = create("Frame", {
                Size = UDim2.fromOffset(dW, dH),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = curThem.Su,
                BorderSizePixel = 0, ZIndex = 860,
            }, win)
            corner(mgr, 14); chromaStroke(mgr)
            reg(mgr, "BackgroundColor3", curThem.Su, false)
            padding(mgr, 14, 14, 12, 12)
            registerPopup(mgr, {})

            mgr.BackgroundTransparency = 1
            TS:Create(mgr, TweenInfo.new(0.18), {BackgroundTransparency = 0}):Play()

            create("TextLabel", {
                Size = UDim2.new(1, -40, 0, 24),
                BackgroundTransparency = 1,
                Text = "⚙️ Hidden Items Manager",
                TextColor3 = curThem.Aa,
                Font = Enum.Font.GothamBold, TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 861,
            }, mgr)

            local closeX = create("TextButton", {
                Size = UDim2.fromOffset(28, 28),
                Position = UDim2.new(1, -28, 0, 0),
                BackgroundColor3 = curThem.Da, BorderSizePixel = 0,
                Text = "×", TextColor3 = curThem.Tx,
                Font = Enum.Font.GothamBold, TextSize = 17,
                AutoButtonColor = false, ZIndex = 862,
            }, mgr)
            corner(closeX, 8)
            closeX.MouseButton1Click:Connect(function() closeAllPopups() end)

            create("TextLabel", {
                Size = UDim2.new(1, 0, 0, 18),
                Position = UDim2.new(0, 0, 0, 28),
                BackgroundTransparency = 1,
                Text = "Tap to toggle Hidden / Visible:",
                TextColor3 = curThem.Mu,
                Font = Enum.Font.Gotham, TextSize = 10,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 861,
            }, mgr)

            local scroll = create("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, -100),
                Position = UDim2.new(0, 0, 0, 52),
                BackgroundColor3 = curThem.Bg,
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                ScrollBarThickness = 5,
                ScrollBarImageColor3 = curThem.Ac,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ZIndex = 861,
            }, mgr)
            corner(scroll, 10); mkStroke(scroll, curThem.Ac, 1, 0.3)
            padding(scroll, 6, 6, 6, 6)
            create("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, scroll)

            local list = scanDir(getCurrentDir(), false)

            if #list == 0 then
                create("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 40),
                    BackgroundTransparency = 1,
                    Text = "Empty folder",
                    TextColor3 = curThem.Mu,
                    Font = Enum.Font.Gotham, TextSize = 11, ZIndex = 862,
                }, scroll)
            end

            for i, item in ipairs(list) do
                local isHiddenItem = FM.hideList[item.path] == true

                local row = create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 44),
                    BackgroundColor3 = isHiddenItem and curThem.Da or curThem.Sa,
                    BackgroundTransparency = isHiddenItem and 0.4 or 0.1,
                    BorderSizePixel = 0, Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = i, ZIndex = 862,
                }, scroll)
                corner(row, 8)
                mkStroke(row, isHiddenItem and curThem.Da or curThem.Ac, 1.2, 0.2)

                create("TextLabel", {
                    Size = UDim2.fromOffset(30, 30),
                    Position = UDim2.new(0, 8, 0.5, -15),
                    BackgroundTransparency = 1,
                    Text = item.isFolder and "📁" or "📄",
                    Font = Enum.Font.GothamBold, TextSize = 18, ZIndex = 863,
                }, row)

                create("TextLabel", {
                    Size = UDim2.new(1, -110, 1, 0),
                    Position = UDim2.new(0, 46, 0, 0),
                    BackgroundTransparency = 1,
                    Text = item.name, TextColor3 = curThem.Tx,
                    Font = Enum.Font.Gotham, TextSize = 11,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 863,
                }, row)

                local statusLbl = create("TextLabel", {
                    Size = UDim2.fromOffset(70, 28),
                    Position = UDim2.new(1, -74, 0.5, -14),
                    BackgroundTransparency = 1,
                    Text = isHiddenItem and "🙈 Hidden" or "👁 Visible",
                    TextColor3 = isHiddenItem and curThem.Da or curThem.Sc,
                    Font = Enum.Font.GothamBold, TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextYAlignment = Enum.TextYAlignment.Center, ZIndex = 863,
                }, row)

                row.MouseButton1Click:Connect(function()
                    if FM.hideList[item.path] then
                        FM.hideList[item.path] = nil
                    else
                        FM.hideList[item.path] = true
                    end
                    saveHideList(FM.hideList)
                    local nowHidden = FM.hideList[item.path] == true
                    row.BackgroundColor3 = nowHidden and curThem.Da or curThem.Sa
                    row.BackgroundTransparency = nowHidden and 0.4 or 0.1
                    statusLbl.Text = nowHidden and "🙈 Hidden" or "👁 Visible"
                    statusLbl.TextColor3 = nowHidden and curThem.Da or curThem.Sc
                end)
            end

            local resetBtn = create("TextButton", {
                Size = UDim2.new(0.48, 0, 0, 34),
                Position = UDim2.new(0, 0, 1, -40),
                BackgroundColor3 = curThem.Sa, BorderSizePixel = 0,
                Text = "↺ Reset All", TextColor3 = curThem.Tx,
                Font = Enum.Font.GothamSemibold, TextSize = 11,
                AutoButtonColor = false, ZIndex = 862,
            }, mgr)
            corner(resetBtn, 8); mkStroke(resetBtn, curThem.Ac, 1.2, 0.2)
            resetBtn.MouseButton1Click:Connect(function()
                FM.hideList = {}
                saveHideList(FM.hideList)
                notify("Hidden items reset", "success")
                closeAllPopups()
                refresh()
            end)

            local doneBtn = create("TextButton", {
                Size = UDim2.new(0.48, 0, 0, 34),
                Position = UDim2.new(0.52, 0, 1, -40),
                BackgroundColor3 = curThem.Sc, BorderSizePixel = 0,
                Text = "✓ Done", TextColor3 = curThem.Tx,
                Font = Enum.Font.GothamSemibold, TextSize = 11,
                AutoButtonColor = false, ZIndex = 862,
            }, mgr)
            corner(doneBtn, 8); mkStroke(doneBtn, curThem.Ac, 1.2, 0.2)
            doneBtn.MouseButton1Click:Connect(function()
                closeAllPopups()
                refresh()
            end)
        end

        -- ═══════════════════════════════════════════════════════
        -- DIALOGS
        -- ═══════════════════════════════════════════════════════
        local showInfo = function(item)
            makeDialog("ℹ️ File Info", function(content)
                local function row(label, value)
                    local r = create("Frame", {
                        Size = UDim2.new(1, 0, 0, 22),
                        BackgroundTransparency = 1, ZIndex = 862,
                    }, content)
                    create("TextLabel", {
                        Size = UDim2.new(0, 70, 1, 0),
                        BackgroundTransparency = 1,
                        Text = label, TextColor3 = curThem.Mu,
                        Font = Enum.Font.Gotham, TextSize = 11,
                        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 862,
                    }, r)
                    create("TextLabel", {
                        Size = UDim2.new(1, -74, 1, 0),
                        Position = UDim2.new(0, 74, 0, 0),
                        BackgroundTransparency = 1,
                        Text = value, TextColor3 = curThem.Tx,
                        Font = Enum.Font.Code, TextSize = 11,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 862,
                    }, r)
                    create("UIListLayout", {
                        Padding = UDim.new(0, 4),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }, content)
                end

                row("Name:", item.name)
                row("Type:", item.type)
                row("Size:", item.isFolder and "—" or fmtSize(item.size))
                row("Path:", item.path)
            end, {
                { label = "Close", width = 100, cb = function() end }
            })
        end

        local showEditor = function(item)
            closeAllPopups()
            local eW = math.min(520, winW - 30)
            local eH = math.min(480, winH - 60)

            local editor = create("Frame", {
                Size = UDim2.fromOffset(eW, eH),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = curThem.Su,
                BorderSizePixel = 0, ZIndex = 870,
            }, win)
            corner(editor, 14); chromaStroke(editor)
            reg(editor, "BackgroundColor3", curThem.Su, false)
            registerPopup(editor, {})
            padding(editor, 14, 14, 12, 12)

            editor.BackgroundTransparency = 1
            TS:Create(editor, TweenInfo.new(0.18), {BackgroundTransparency = 0}):Play()

            create("TextLabel", {
                Size = UDim2.new(1, -40, 0, 24),
                BackgroundTransparency = 1,
                Text = "📝 " .. item.name,
                TextColor3 = curThem.Aa,
                Font = Enum.Font.GothamBold, TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 871,
            }, editor)

            local closeX = create("TextButton", {
                Size = UDim2.fromOffset(28, 28),
                Position = UDim2.new(1, -28, 0, 0),
                BackgroundColor3 = curThem.Da, BorderSizePixel = 0,
                Text = "×", TextColor3 = curThem.Tx,
                Font = Enum.Font.GothamBold, TextSize = 17,
                AutoButtonColor = false, ZIndex = 872,
            }, editor)
            corner(closeX, 8)
            closeX.MouseButton1Click:Connect(function() closeAllPopups() end)

            local codeHolder = create("Frame", {
                Size = UDim2.new(1, 0, 1, -100),
                Position = UDim2.new(0, 0, 0, 34),
                BackgroundColor3 = curThem.Bg,
                BorderSizePixel = 0, ZIndex = 871,
            }, editor)
            corner(codeHolder, 10); mkStroke(codeHolder, curThem.Ac, 1.2, 0.2)

            local codeScroll = create("ScrollingFrame", {
                Size = UDim2.new(1, -12, 1, -12),
                Position = UDim2.new(0, 6, 0, 6),
                BackgroundTransparency = 1, BorderSizePixel = 0,
                ScrollBarThickness = 5,
                ScrollBarImageColor3 = curThem.Ac,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.XY,
                ZIndex = 872,
            }, codeHolder)

            local codeBox = create("TextBox", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = "",
                TextColor3 = curThem.Sc,
                Font = Enum.Font.Code, TextSize = 12,
                MultiLine = true, ClearTextOnFocus = false,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                AutomaticSize = Enum.AutomaticSize.XY, ZIndex = 873,
            }, codeScroll)

            pcall(function() codeBox.Text = readfile(item.path) end)

            local btnRow = create("Frame", {
                Size = UDim2.new(1, 0, 0, 40),
                Position = UDim2.new(0, 0, 1, -40),
                BackgroundTransparency = 1, ZIndex = 871,
            }, editor)
            create("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }, btnRow)

            local function mkBtn(txt, w, col, cb)
                local b = create("TextButton", {
                    Size = UDim2.fromOffset(w, 36),
                    BackgroundColor3 = col or curThem.Sa,
                    BorderSizePixel = 0,
                    Text = txt, TextColor3 = curThem.Tx,
                    Font = Enum.Font.GothamSemibold, TextSize = 11,
                    AutoButtonColor = false, ZIndex = 872,
                }, btnRow)
                corner(b, 8); mkStroke(b, curThem.Ac, 1.2, 0.2)
                b.MouseButton1Click:Connect(function() pcall(cb) end)
                return b
            end

            mkBtn("💾 Save", 80, curThem.Sc, function()
    local ok = pcall(function() writefile(item.path, codeBox.Text) end)
    if ok then
        notify("💾 Saved: "..item.name, "success")
        task.wait(0.05)
        refresh()
    else
        notify("❌ Save failed", "error")
    end
end)

            mkBtn("📋 Copy", 80, nil, function()
                pcall(function() setclipboard(codeBox.Text) end)
                notify("📋 Copied", "success")
            end)

            if isScriptFile(item.name) then
                mkBtn("▶ Run", 80, curThem.Sc, function()
                    local ok, err = pcall(function() loadstring(codeBox.Text)() end)
                    if ok then notify("⚡ Executed", "success")
                    else notify("❌ "..tostring(err):sub(1,60), "error") end
                end)
            end
        end

        local showRenameDialog = function(item)
            local inputRef = nil
            local snapName = item.name
            local snapPath = item.path
            local snapIsFolder = item.isFolder

            makeDialog("✏️ Rename", function(content)
                local input = create("TextBox", {
                    Size = UDim2.new(1, 0, 0, 38),
                    BackgroundColor3 = curThem.Sa,
                    BorderSizePixel = 0,
                    Text = snapName, TextColor3 = curThem.Tx,
                    Font = Enum.Font.Gotham, TextSize = 12,
                    ClearTextOnFocus = false,
                    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 862,
                }, content)
                corner(input, 8); padding(input, 10, 10, 0, 0)
                mkStroke(input, curThem.Ac, 1.2, 0.2)
                inputRef = input
                task.defer(function() pcall(function() input:CaptureFocus() end) end)
            end, {
                { label = "Cancel", width = 90, cb = function() end },
                { label = "Rename", width = 90, color = curThem.Sc, cb = function()
                    if not inputRef then return end
                    local newName = sanitizeName(inputRef.Text)
                    if newName == "" then notify("❌ Invalid name", "warn"); return end
                    if newName == snapName then return end

                    local dir = snapPath:match("^(.*)/[^/]+$") or ""
                    local newPath = dir .. "/" .. newName

                    if isfile(newPath) or isfolder(newPath) then
                        notify("❌ Name already exists", "warn"); return
                    end

                    local ok, err
                    if snapIsFolder then
                        ok, err = pcall(function()
                            local function copyFolderRec(src, dest)
                                if not isfolder(dest) then makefolder(dest) end
                                local raw = {}
                                pcall(function() raw = listfiles(src) end)
                                for _, p in pairs(raw) do
                                    local n = getFileName(p)
                                    local isD = false
                                    pcall(function() isD = isfolder(p) end)
                                    if isD then
                                        copyFolderRec(p, dest .. "/" .. n)
                                    else
                                        writefile(dest .. "/" .. n, readfile(p))
                                    end
                                end
                            end
                            copyFolderRec(snapPath, newPath)
                            local function delFolderRec(src)
                                local raw = {}
                                pcall(function() raw = listfiles(src) end)
                                for _, p in pairs(raw) do
                                    local isD = false
                                    pcall(function() isD = isfolder(p) end)
                                    if isD then delFolderRec(p)
                                    else pcall(function() delfile(p) end) end
                                end
                                pcall(function() delfolder(src) end)
                            end
                            delFolderRec(snapPath)
                        end)
                    else
                        ok, err = pcall(function()
                            local content = readfile(snapPath)
                            writefile(newPath, content)
                            delfile(snapPath)
                        end)
                    end

                    if not ok then
                        notify("❌ Rename failed: "..tostring(err):sub(1,40), "error")
                        return
                    end

                    notify("✏️ Renamed: "..snapName.." → "..newName, "success")
                    task.wait(0.05)
                    refresh()
                end },
            })
        end

        local showDeleteConfirm = function(items)
            local count = #items
            local msg = count == 1 and ('Delete "'..items[1].name..'" permanently?') or ("Delete "..count.." items permanently?")
            local itemsSnapshot = {}
            for _, it in ipairs(items) do
                table.insert(itemsSnapshot, { name = it.name, path = it.path, isFolder = it.isFolder })
            end

            makeDialog("🗑️ Confirm Delete", function(content)
                create("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 40),
                    BackgroundTransparency = 1,
                    Text = msg .. "\nThis cannot be undone!",
                    TextColor3 = curThem.Tx,
                    Font = Enum.Font.Gotham, TextSize = 12,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 862,
                }, content)
            end, {
                { label = "Cancel", width = 90, cb = function() end },
                { label = "Delete", width = 90, color = curThem.Da, cb = function()
                    local deleted, failed = 0, 0
                    for _, it in ipairs(itemsSnapshot) do
                        local ok = pcall(function() deleteItem(it.path) end)
                        if ok then deleted = deleted + 1 else failed = failed + 1 end
                    end
                    if failed > 0 then
    notify("⚠️ "..deleted.." deleted, "..failed.." failed", "warn")
else
    notify("🗑️ Deleted "..deleted.." item(s)", "success")
end
FM.selected = {}
FM.multiMode = false
if updateSelectBar then pcall(updateSelectBar) end
-- Force instant refresh
task.wait(0.05)
refresh()
                end },
            })
        end

        local showCreateDialog = function(isFolder)
            local inputRef = nil
            makeDialog(isFolder and "📁 New Folder" or "📄 New File", function(content)
                local input = create("TextBox", {
                    Size = UDim2.new(1, 0, 0, 38),
                    BackgroundColor3 = curThem.Sa,
                    BorderSizePixel = 0,
                    Text = isFolder and "NewFolder" or "script.lua",
                    TextColor3 = curThem.Tx,
                    Font = Enum.Font.Gotham, TextSize = 12,
                    ClearTextOnFocus = false,
                    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 862,
                }, content)
                corner(input, 8); padding(input, 10, 10, 0, 0)
                mkStroke(input, curThem.Ac, 1.2, 0.2)
                inputRef = input
                task.defer(function() pcall(function() input:CaptureFocus() end) end)
            end, {
                { label = "Cancel", width = 90, cb = function() end },
                { label = "Create", width = 90, color = curThem.Sc, cb = function()
                    if not inputRef then return end
                    local name = sanitizeName(inputRef.Text)
                    if name == "" then notify("❌ Invalid name", "warn"); return end

                    local dir = getCurrentDir()
                    ensureDir(dir)
                    local newPath = dir .. "/" .. name

                    if isfile(newPath) or isfolder(newPath) then
                        notify("❌ Already exists", "warn"); return
                    end

                    if isFolder then
                        pcall(function() makefolder(newPath) end)
                        notify("📁 Created: "..name, "success")
                    else
                        pcall(function() writefile(newPath, "") end)
                        notify("📄 Created: "..name, "success")
                    end
                    task.wait(0.05)
                    refresh()
                end },
            })
        end

        -- Context menu
        local showContextMenu = function(item, anchorX, anchorY)
    local items = {}

    if item.isFolder then
        table.insert(items, { label = "📂 Open", cb = function()
            table.insert(FM.path, item.name)
            refresh()
        end})
    else
        local ext = getExt(item.name)
        local isLua = (ext == "lua")
        
        if isLua then
            table.insert(items, { label = "▶ Run Manually", cb = function()
                local ok, content = pcall(readfile, item.path)
                if ok and content then
                    local runOk, err = pcall(function() loadstring(content)() end)
                    if runOk then notify("⚡ Executed: "..item.name, "success")
                    else notify("❌ Error: "..tostring(err):sub(1,50), "error") end
                end
            end})
            table.insert(items, { label = "✏️ Edit", cb = function() showEditor(item) end })

            -- FEATURE: SET AS AUTORUN
            table.insert(items, { 
                label = (item.name == "AutoRun.lua" and "✅ AutoRun: ACTIVE" or "⚙️ Set as AutoRun"), 
                color = curThem.Aa, 
                cb = function()
                    local oldPath = getCurrentDir().."/AutoRun.lua"
                    if isfile(oldPath) then pcall(delfile, oldPath) end
                    pcall(function() writefile(getCurrentDir().."/AutoRun.lua", readfile(item.path)) end)
                    notify("✅ Set as AutoRun: "..item.name, "success")
                    refresh()
                end
            })
        elseif ext == "txt" then
            table.insert(items, { label = "🎵 Play / Add to Playlist", cb = function()
                local ok, content = pcall(readfile, item.path)
                if ok and content then
                    local okJson, data = pcall(function() return HS:JSONDecode(content) end)
                    if okJson and data and data.result and data.result.id then
                        table.insert(Settings.musicTracks, {id=tostring(data.result.id), name=item.name, fav=false})
                        saveSettings()
                        if R.refreshMusicList then pcall(R.refreshMusicList) end
                        notify("🎵 Added: "..item.name, "success")
                    else notify("❌ Invalid music format", "error") end
                end
            end})
            table.insert(items, { label = "✏️ View Code", cb = function() showEditor(item) end })
        else
            table.insert(items, { label = "✏️ Edit", cb = function() showEditor(item) end })
        end
        
        table.insert(items, { label = "📋 Copy", cb = function()
            FM.clipboard = { mode = "copy", paths = { item.path } }
            updateClipboardBar()
            notify("📋 Copied: "..item.name, "info")
        end})
        table.insert(items, { label = "✂️ Cut", cb = function()
            FM.clipboard = { mode = "cut", paths = { item.path } }
            updateClipboardBar()
            notify("✂️ Cut: "..item.name, "info")
        end})
    end

    table.insert(items, { label = "✏️ Rename", cb = function() showRenameDialog(item) end })
    table.insert(items, { label = "ℹ️ Info", cb = function() showInfo(item) end })
    table.insert(items, { label = "🗑️ Delete", color = curThem.Da, cb = function()
        showDeleteConfirm({ item })
    end})

    makeMenu(anchorX, anchorY, items, 180)
end

        -- ═══════════════════════════════════════════════════════
        -- MULTI-SELECT / CLIPBOARD
        -- ═══════════════════════════════════════════════════════
        local updateSelectBar = function()
            local count = 0
            for _ in pairs(FM.selected) do count = count + 1 end

            if FM.multiMode then
                selectBar.Visible = true
                searchBar.Visible = false
                listHolder.Position = UDim2.new(0, 8, 0, 108)
                listHolder.Size = UDim2.new(1, -16, 1, -180)
                selectCount.Text = count.." selected"
            else
                selectBar.Visible = false
                listHolder.Position = UDim2.new(0, 8, 0, 58)
                listHolder.Size = UDim2.new(1, -16, 1, -130)
            end
        end

        local enterMultiSelect = function(item)
            FM.multiMode = true
            FM.selected[item.path] = true
            updateSelectBar()
            refresh()
        end

        local exitMultiSelect = function()
            FM.multiMode = false
            FM.selected = {}
            updateSelectBar()
            refresh()
        end

        updateClipboardBar = function()
            if FM.clipboard and #FM.clipboard.paths > 0 then
                FM.clipboardBar.Visible = true
                FM.fabBtn.Visible = false
            else
                FM.clipboardBar.Visible = false
                FM.fabBtn.Visible = not FM.multiMode
            end
        end

        cbPaste.MouseButton1Click:Connect(function()
            if not FM.clipboard then return end
            local destDir = getCurrentDir()
            ensureDir(destDir)
            local count = 0
            local errors = 0
            for _, srcPath in ipairs(FM.clipboard.paths) do
                local ok = pcall(function()
                    if FM.clipboard.mode == "copy" then
                        copyItem(srcPath, destDir)
                    else
                        moveItem(srcPath, destDir)
                    end
                end)
                if ok then count = count + 1 else errors = errors + 1 end
            end
            if errors > 0 then
                notify("⚠️ "..count.." pasted, "..errors.." failed", "warn")
            else
                notify("📋 Pasted "..count.." item(s)", "success")
            end
            FM.clipboard = nil
            updateClipboardBar()
            task.wait(0.05)
            refresh()
        end)

        cbCancel.MouseButton1Click:Connect(function()
            FM.clipboard = nil
            updateClipboardBar()
            notify("Clipboard cleared", "info")
        end)

        -- ═══════════════════════════════════════════════════════
        -- REFRESH / RENDER
        -- ═══════════════════════════════════════════════════════
        refresh = function()
            for _, c in ipairs(fileList:GetChildren()) do
                if c:IsA("TextButton") or c:IsA("Frame") then c:Destroy() end
            end

            local dir = getCurrentDir()
            ensureDir(dir)

            -- Breadcrumb
            for _, c in ipairs(bcScroll:GetChildren()) do
                if c:IsA("TextButton") or c:IsA("TextLabel") then c:Destroy() end
            end

            local function addCrumb(text, targetPath, isLast)
                local b = create("TextButton", {
                    Size = UDim2.fromOffset(0, 28),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundColor3 = isLast and curThem.Ac or curThem.Sa,
                    BorderSizePixel = 0,
                    Text = text,
                    TextColor3 = isLast and Color3.new(1,1,1) or curThem.Tx,
                    Font = Enum.Font.GothamSemibold, TextSize = 11,
                    AutoButtonColor = false, ZIndex = 805,
                }, bcScroll)
                corner(b, 6)
                padding(b, 8, 8, 0, 0)
                if not isLast then
                    b.MouseButton1Click:Connect(function()
                        FM.path = targetPath
                        refresh()
                    end)
                end
            end

            local rootName = "📁 "..(game.PlaceId and tostring(game.PlaceId) or "Root")
            if #FM.path == 0 then
                addCrumb(rootName, {}, true)
            else
                addCrumb(rootName, {}, false)
                for i, seg in ipairs(FM.path) do
                    local newPath = {}
                    for j = 1, i do table.insert(newPath, FM.path[j]) end
                    addCrumb("› "..seg, newPath, i == #FM.path)
                end
            end

            local files = scanDir(dir, false)
            local totalSize = 0
            local itemCount = 0

            if FM.searching and FM.searchQuery ~= "" then
                local q = FM.searchQuery:lower()
                local recursive = scanDir(dir, true)
                local filtered = {}
                for _, f in ipairs(recursive) do
                    if f.name:lower():find(q, 1, true) then
                        table.insert(filtered, f)
                    end
                end
                files = filtered
            end

            for i, item in ipairs(files) do
                local isSelected = FM.selected[item.path] == true

                local row = create("TextButton", {
                    Size = UDim2.new(1, -4, 0, 54),
                    BackgroundColor3 = isSelected and curThem.Ac or curThem.Sa,
                    BackgroundTransparency = isSelected and 0.2 or 0.15,
                    BorderSizePixel = 0, Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = i, ZIndex = 807,
                }, fileList)
                corner(row, 10)
                if isSelected then
                    mkStroke(row, curThem.Aa, 2, 0)
                end

                local icon = create("TextButton", {
                    Size = UDim2.fromOffset(40, 40),
                    Position = UDim2.new(0, 8, 0.5, -20),
                    BackgroundColor3 = item.isFolder and curThem.Wa or curThem.Aa,
                    BackgroundTransparency = 0.7,
                    BorderSizePixel = 0,
                    Text = item.isFolder and "📁" or "📄",
                    TextColor3 = curThem.Tx,
                    Font = Enum.Font.GothamBold, TextSize = 20,
                    AutoButtonColor = false, ZIndex = 808,
                }, row)
                corner(icon, 8)

                icon.MouseButton1Click:Connect(function()
                    if not FM.multiMode then
                        enterMultiSelect(item)
                    else
                        if FM.selected[item.path] then
                            FM.selected[item.path] = nil
                        else
                            FM.selected[item.path] = true
                        end
                        updateSelectBar()
                        refresh()
                    end
                end)

                create("TextLabel", {
                    Size = UDim2.new(1, -180, 0, 20),
                    Position = UDim2.new(0, 56, 0, 8),
                    BackgroundTransparency = 1,
                    Text = item.name, TextColor3 = curThem.Tx,
                    Font = Enum.Font.GothamSemibold, TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 808,
                }, row)

                create("TextLabel", {
                    Size = UDim2.new(1, -180, 0, 16),
                    Position = UDim2.new(0, 56, 0, 28),
                    BackgroundTransparency = 1,
                    Text = item.isFolder and (item.type) or (item.type.." · "..fmtSize(item.size)),
                    TextColor3 = curThem.Mu,
                    Font = Enum.Font.Gotham, TextSize = 10,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center, ZIndex = 808,
                }, row)

                if item.isFolder then
                    create("TextLabel", {
                        Size = UDim2.fromOffset(24, 24),
                        Position = UDim2.new(1, -32, 0.5, -12),
                        BackgroundTransparency = 1,
                        Text = "›", TextColor3 = curThem.Mu,
                        Font = Enum.Font.GothamBold, TextSize = 18, ZIndex = 808,
                    }, row)
                end

                if isSelected then
                    create("TextLabel", {
                        Size = UDim2.fromOffset(24, 24),
                        Position = UDim2.new(1, -60, 0.5, -12),
                        BackgroundTransparency = 1,
                        Text = "✅", TextColor3 = curThem.Sc,
                        Font = Enum.Font.GothamBold, TextSize = 14, ZIndex = 808,
                    }, row)
                end

                -- Long-press detection
                local pressStart = nil
                local longPressFired = false
                local longPressThreshold = 0.5

                track(row.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or
                       input.UserInputType == Enum.UserInputType.Touch then
                        pressStart = tick()
                        longPressFired = false
                    end
                end))

                track(row.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or
                       input.UserInputType == Enum.UserInputType.Touch then
                        if pressStart and (tick() - pressStart) >= longPressThreshold then
                            longPressFired = true
                            if not FM.multiMode then
                                enterMultiSelect(item)
                            else
                                if FM.selected[item.path] then
                                    FM.selected[item.path] = nil
                                else
                                    FM.selected[item.path] = true
                                end
                                updateSelectBar()
                                refresh()
                            end
                        end
                        pressStart = nil
                    end
                end))

row.MouseButton1Click:Connect(function()
    if longPressFired then
        longPressFired = false
        return
    end
    if FM.multiMode then
        if FM.selected[item.path] then FM.selected[item.path] = nil
        else FM.selected[item.path] = true end
        updateSelectBar()
        refresh()
    else
        if item.isFolder then
            table.insert(FM.path, item.name)
            refresh()
        else
            -- Laging Context Menu, walang auto-run sa click
            local rowAbs = row.AbsolutePosition
            local winAbs = win.AbsolutePosition
            showContextMenu(item, rowAbs.X - winAbs.X + 20, rowAbs.Y - winAbs.Y + 20)
        end
    end
end)

                itemCount = itemCount + 1
                if not item.isFolder then totalSize = totalSize + item.size end
            end

            if #files == 0 then
                emptyLbl.Visible = true
                emptyLbl.Text = FM.searching and "🔍\nNo results found" or "📂\nEmpty folder"
            else
                emptyLbl.Visible = false
            end

            if FM.searching and FM.searchQuery ~= "" then
                statusLbl.Text = "🔍 "..itemCount.." results · "..fmtSize(totalSize)
            else
                statusLbl.Text = itemCount.." items · "..fmtSize(totalSize)
            end
        end

        -- ═══════════════════════════════════════════════════════
        -- EVENT HANDLERS
        -- ═══════════════════════════════════════════════════════
backBtn.MouseButton1Click:Connect(function()
    if FM.multiMode then
        exitMultiSelect()
    elseif FM.searching then
        FM.searching = false
        FM.searchQuery = ""
        searchBar.Visible = false
        searchInput.Text = ""
        listHolder.Position = UDim2.new(0, 8, 0, 58)
        listHolder.Size = UDim2.new(1, -16, 1, -130)
        refresh()
    elseif #FM.path > 0 then
        table.remove(FM.path)
        refresh()
    else
        -- Exit FM: ibalik yung main GUI
        closeAllPopups()
        if win and win.Parent then win:Destroy() end
        if Header then Header.Visible = true end
        if Nav then Nav.Visible = true end
        if Cont then Cont.Visible = true end
        -- Ibalik sa Overview page
        showPage("Overview")
    end
end)

        searchBtn.MouseButton1Click:Connect(function()
            if FM.multiMode then exitMultiSelect() end
            FM.searching = not FM.searching
            searchBar.Visible = FM.searching
            if FM.searching then
                listHolder.Position = UDim2.new(0, 8, 0, 108)
                listHolder.Size = UDim2.new(1, -16, 1, -180)
                pcall(function() searchInput:CaptureFocus() end)
            else
                FM.searchQuery = ""
                searchInput.Text = ""
                listHolder.Position = UDim2.new(0, 8, 0, 58)
                listHolder.Size = UDim2.new(1, -16, 1, -130)
                refresh()
            end
        end)

        searchClose.MouseButton1Click:Connect(function()
            FM.searching = false
            FM.searchQuery = ""
            searchInput.Text = ""
            searchBar.Visible = false
            listHolder.Position = UDim2.new(0, 8, 0, 58)
            listHolder.Size = UDim2.new(1, -16, 1, -130)
            refresh()
        end)

        local searchDebounce = 0
        searchInput:GetPropertyChangedSignal("Text"):Connect(function()
            searchDebounce = searchDebounce + 1
            local myId = searchDebounce
            local txt = searchInput.Text
            task.delay(0.3, function()
                if myId == searchDebounce then
                    FM.searchQuery = txt
                    refresh()
                end
            end)
        end)

        menuBtn.MouseButton1Click:Connect(function()
            if #activePopups > 0 then
                closeAllPopups()
                return
            end

            local menuItems = {
                { label = "📁 New Folder", cb = function() showCreateDialog(true) end },
                { label = "📄 New File", cb = function() showCreateDialog(false) end },
                { label = (FM.showHidden and "🙈 Hide Hidden Files" or "👁 Show Hidden Files"), cb = function()
                    FM.showHidden = not FM.showHidden
                    refresh()
                end },
                { label = "⚙️ Manage Hidden...", cb = function() showHiddenManager() end },
            }
            if FM.clipboard then
                table.insert(menuItems, { label = "📋 Paste ("..#FM.clipboard.paths..")", color = curThem.Sc, cb = function()
                    cbPaste:Activate()
                end })
            end
                -- I-align sa ilalim ng Menu (⋮) button
    local menuW = 180
    local posX = menuBtn.AbsolutePosition.X - menuW + menuBtn.AbsoluteSize.X
    local posY = menuBtn.AbsolutePosition.Y + menuBtn.AbsoluteSize.Y + 72

    -- Gumawa ng menu direkta sa SG (walang auto-adjust)
    local menu = create("Frame", {
        Size = UDim2.fromOffset(menuW, (#menuItems * 34) + 8),
        Position = UDim2.fromOffset(posX, posY),
        BackgroundColor3 = curThem.Su,
        BorderSizePixel = 0, ZIndex = 850,
    }, SG)
    corner(menu, 10); chromaStroke(menu)
    reg(menu, "BackgroundColor3", curThem.Su, false)

    create("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder}, menu)
    padding(menu, 4, 4, 4, 4)

    for i, item in ipairs(menuItems) do
        local b = create("TextButton", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = curThem.Sa,
            BorderSizePixel = 0,
            Text = "  " .. item.label,
            TextColor3 = item.color or curThem.Tx,
            Font = Enum.Font.Gotham, TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutoButtonColor = false,
            LayoutOrder = i, ZIndex = 851,
        }, menu)
        corner(b, 6)
        b.MouseButton1Click:Connect(function()
            closeAllPopups()
            pcall(item.cb)
        end)
    end

    registerPopup(menu, {})
    
    -- Click outside to close
    local openedAt = tick()
    local conn = UIS.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and
           input.UserInputType ~= Enum.UserInputType.Touch then return end
        if tick() - openedAt < 0.15 then return end
        if not menu or not menu.Parent then
            if conn then conn:Disconnect() end
            return
        end
        local pos = input.Position
        local ap = menu.AbsolutePosition
        local as = menu.AbsoluteSize
        if not (pos.X >= ap.X and pos.X <= ap.X + as.X and
                pos.Y >= ap.Y and pos.Y <= ap.Y + as.Y) then
            closeAllPopups()
        end
    end)
    table.insert(popupConnections, conn)
end)
fab.MouseButton1Click:Connect(function()
    closeAllPopups()
    
    -- Kunin ang absolute position ng FAB button
    local btnAbs = fab.AbsolutePosition
    local btnSize = fab.AbsoluteSize
    local menuW = 150
    
    -- I-parent sa SG (ScreenGui) para walang scale issues
    local menu = create("Frame", {
        Size = UDim2.fromOffset(menuW, 76),
        Position = UDim2.fromOffset(
            btnAbs.X - menuW - 4,  -- Kaliwa ng button
            btnAbs.Y + 22
        ),
        BackgroundColor3 = curThem.Su,
        BorderSizePixel = 0, ZIndex = 850,
    }, SG)
    corner(menu, 10); chromaStroke(menu)
    reg(menu, "BackgroundColor3", curThem.Su, false)

    create("UIListLayout", {Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder}, menu)
    padding(menu, 4, 4, 4, 4)

    local items = {
        {label = "📁 New Folder", cb = function() showCreateDialog(true) end},
        {label = "📄 New File", cb = function() showCreateDialog(false) end},
    }

    for i, item in ipairs(items) do
        local b = create("TextButton", {
            Size = UDim2.new(1, 0, 0, 32),
            BackgroundColor3 = curThem.Sa,
            BorderSizePixel = 0,
            Text = "  " .. item.label,
            TextColor3 = curThem.Tx,
            Font = Enum.Font.Gotham, TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutoButtonColor = false,
            LayoutOrder = i, ZIndex = 851,
        }, menu)
        corner(b, 6)
        b.MouseButton1Click:Connect(function()
            closeAllPopups()
            pcall(item.cb)
        end)
    end

    registerPopup(menu, {})
    
    local openedAt = tick()
    local conn = UIS.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and
           input.UserInputType ~= Enum.UserInputType.Touch then return end
        if tick() - openedAt < 0.15 then return end
        if not menu or not menu.Parent then
            if conn then conn:Disconnect() end
            return
        end
        local pos = input.Position
        local ap = menu.AbsolutePosition
        local as = menu.AbsoluteSize
        if not (pos.X >= ap.X and pos.X <= ap.X + as.X and
                pos.Y >= ap.Y and pos.Y <= ap.Y + as.Y) then
            closeAllPopups()
        end
    end)
    table.insert(popupConnections, conn)
end)
        selectCancel.MouseButton1Click:Connect(function() exitMultiSelect() end)

        selectAll.MouseButton1Click:Connect(function()
            local files = scanDir(getCurrentDir(), false)
            for _, f in ipairs(files) do
                FM.selected[f.path] = true
            end
            updateSelectBar()
            refresh()
        end)

        selectCopy.MouseButton1Click:Connect(function()
            local paths = {}
            for p, _ in pairs(FM.selected) do table.insert(paths, p) end
            if #paths == 0 then notify("Nothing selected", "warn"); return end
            FM.clipboard = { mode = "copy", paths = paths }
            exitMultiSelect()
            updateClipboardBar()
            notify("📋 Copied "..#paths.." item(s)", "info")
        end)

        selectCut.MouseButton1Click:Connect(function()
            local paths = {}
            for p, _ in pairs(FM.selected) do table.insert(paths, p) end
            if #paths == 0 then notify("Nothing selected", "warn"); return end
            FM.clipboard = { mode = "cut", paths = paths }
            exitMultiSelect()
            updateClipboardBar()
            notify("✂️ Cut "..#paths.." item(s)", "info")
        end)

        selectDel.MouseButton1Click:Connect(function()
            local items = {}
            local files = scanDir(getCurrentDir(), false)
            for _, f in ipairs(files) do
                if FM.selected[f.path] then
                    table.insert(items, f)
                end
            end
            if #items == 0 then notify("Nothing selected", "warn"); return end
            showDeleteConfirm(items)
        end)

        -- ═══════════════════════════════════════════════════════
        -- AUTO REFRESH (instant, checks every 0.3s)
        -- ═══════════════════════════════════════════════════════
        local autoRefreshConn = nil
        local lastSig = ""
        local lastCheck = 0

        autoRefreshConn = RS.Heartbeat:Connect(function()
            if not win or not win.Parent then
                if autoRefreshConn then autoRefreshConn:Disconnect() end
                return
            end
            local now = tick()
            if now - lastCheck < 0.3 then return end
            lastCheck = now

            local dir = getCurrentDir()
            local raw = {}
            pcall(function() raw = listfiles(dir) end)
            local sig = tostring(#raw)
            for _, p in ipairs(raw) do
                local n = getFileName(p)
                local sz = 0
                local isD = false
                pcall(function() isD = isfolder(p) end)
                if not isD then
                    pcall(function() sz = #readfile(p) end)
                end
                sig = sig .. "|" .. n .. ":" .. sz
            end

            if lastSig ~= "" and lastSig ~= sig then
                if #activePopups == 0 and not FM.searching then
                    refresh()
                end
            end
            lastSig = sig
        end)

        -- ═══════════════════════════════════════════════════════
        -- INITIAL RENDER
        -- ═══════════════════════════════════════════════════════
        updateClipboardBar()
        refresh()

        -- Cleanup on close
        win.Destroying:Connect(function()
            if autoRefreshConn then
                pcall(function() autoRefreshConn:Disconnect() end)
                autoRefreshConn = nil
            end
            closeAllPopups()
        end)
    end
end

--==============================================================
-- CHEATS PAGE
--==============================================================
do
    local Cp = panel(P.Cheats,"CheatsPanel",UDim2.new(1,-6,0,220),UDim2.new())
    padding(Cp,18,18,16,16)
    label(Cp,"REMOTE CHEAT UTILITIES",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(Cp,"Negate/multiply numeric args on outgoing remotes.",UDim2.new(1,0,0,36),UDim2.new(0,0,0,30),12,curThem.Mu).TextWrapped=true

    local cpRow1 = create("Frame",{Size=UDim2.new(1,0,0,48),Position=UDim2.new(0,0,0,80),BackgroundTransparency=1},Cp)
    create("UIListLayout",{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},cpRow1)
    pBtn(cpRow1,"Negate Args",UDim2.new(0.32,0,0,48),UDim2.new(),function()
        S.negOn = not S.negOn; notify("Negate: "..(S.negOn and "ON" or "OFF"),"info")
    end).LayoutOrder=1
    pBtn(cpRow1,"Multiply x9999",UDim2.new(0.32,0,0,48),UDim2.new(),function()
        S.mulOn = not S.mulOn; notify("Multiply: "..(S.mulOn and "ON" or "OFF"),"info")
    end).LayoutOrder=2
    pBtn(cpRow1,"Scan Rewards",UDim2.new(0.32,0,0,48),UDim2.new(),function()
        local found = 0
        local tg = {"Reward","Claim","Cash","Money","Collect","Buy","Purchase"}
        for _,v in pairs(RStorage:GetDescendants()) do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                for _,k in pairs(tg) do
                    if v.Name:match(k) then
                        if R.addLog then R.addLog(v,{"[SCAN]"},true) end
                        found=found+1
                    end
                end
            end
        end
        notify("Found "..found,"success")
    end).LayoutOrder=3

    -- Arg Modifier
    local modP = panel(P.Cheats,"ModPanel",UDim2.new(1,-6,0,140),UDim2.new())
    padding(modP,18,18,12,12)
    label(modP,"ARG MODIFIER",UDim2.new(1,0,0,22),UDim2.new(),13,curThem.Aa)
    label(modP,"Replace / negate outgoing arg values.",UDim2.new(1,0,0,18),UDim2.new(0,0,0,26),11,curThem.Mu).TextWrapped=true

    local modRow = create("Frame",{Size=UDim2.new(1,0,0,42),Position=UDim2.new(0,0,0,62),BackgroundTransparency=1},modP)
    create("UIListLayout",{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},modRow)

    local mT = create("TextBox",{Size=UDim2.new(0,130,0,38),BackgroundColor3=curThem.Sa,BorderSizePixel=0,PlaceholderText="Find",Text="",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},modRow)
    corner(mT,8); mkStroke(mT,curThem.Ac,1.5,0.15); reg(mT,"BackgroundColor3",curThem.Sa,false); mT.LayoutOrder=1
    local mR = create("TextBox",{Size=UDim2.new(0,130,0,38),BackgroundColor3=curThem.Sa,BorderSizePixel=0,PlaceholderText="Set",Text="",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},modRow)
    corner(mR,8); mkStroke(mR,curThem.Ac,1.5,0.15); reg(mR,"BackgroundColor3",curThem.Sa,false); mR.LayoutOrder=2

    R.bMod = pBtn(modRow,"MOD: OFF",UDim2.new(0,110,0,38),UDim2.new(),nil); R.bMod.LayoutOrder=3
    R.bNeg = pBtn(modRow,"NEG: OFF",UDim2.new(0,110,0,38),UDim2.new(),nil); R.bNeg.LayoutOrder=4

    mT:GetPropertyChangedSignal("Text"):Connect(function() S.cT = mT.Text end)
    mR:GetPropertyChangedSignal("Text"):Connect(function() S.cR = mR.Text end)
    R.bMod.Activated:Connect(function() S.modOn = not S.modOn; R.bMod.Text = S.modOn and "MOD: ON" or "MOD: OFF" end)
    R.bNeg.Activated:Connect(function() S.negOn = not S.negOn; R.bNeg.Text = S.negOn and "NEG: ON" or "NEG: OFF" end)

    -- Sequence Controls
    local SeqP = panel(P.Cheats,"SeqPanel",UDim2.new(1,-6,0,150),UDim2.new())
    padding(SeqP,18,18,16,16)
    label(SeqP,"SEQUENCE CONTROLS",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)

    local seqRow = create("Frame",{Size=UDim2.new(1,0,0,80),Position=UDim2.new(0,0,0,42),BackgroundTransparency=1},SeqP)
    create("UIListLayout",{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},seqRow)

    local playW = create("Frame",{Size=UDim2.new(0.31,0,0,80),BackgroundTransparency=1},seqRow)
    playW.LayoutOrder = 1
    create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Play Seq",TextColor3=curThem.Mu,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left},playW)
    R.bPlay = create("TextButton",{Size=UDim2.new(0.62,0,0,40),Position=UDim2.new(0,0,0,24),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="Play",TextColor3=curThem.Tx,Font=Enum.Font.GothamSemibold,TextSize=12,AutoButtonColor=false},playW)
    corner(R.bPlay,8); mkStroke(R.bPlay,curThem.Sc,1.5,0.15); reg(R.bPlay,"BackgroundColor3",curThem.Sa,false); reg(R.bPlay,"TextColor3",curThem.Tx,true)
    R.SeqSpd = create("TextBox",{Size=UDim2.new(0.34,0,0,40),Position=UDim2.new(0.66,0,0,24),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="0.1",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},playW)
    corner(R.SeqSpd,8); mkStroke(R.SeqSpd,curThem.Ac,1.5,0.15); reg(R.SeqSpd,"BackgroundColor3",curThem.Sa,false)

    local recW = create("Frame",{Size=UDim2.new(0.31,0,0,80),BackgroundTransparency=1},seqRow)
    recW.LayoutOrder = 2
    create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Record Seq",TextColor3=curThem.Mu,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left},recW)
    R.bRec = create("TextButton",{Size=UDim2.new(0.62,0,0,40),Position=UDim2.new(0,0,0,24),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="Record",TextColor3=curThem.Tx,Font=Enum.Font.GothamSemibold,TextSize=12,AutoButtonColor=false},recW)
    corner(R.bRec,8); mkStroke(R.bRec,curThem.Wa,1.5,0.15); reg(R.bRec,"BackgroundColor3",curThem.Sa,false); reg(R.bRec,"TextColor3",curThem.Tx,true)
    R.RecSpd = create("TextBox",{Size=UDim2.new(0.34,0,0,40),Position=UDim2.new(0.66,0,0,24),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="0.1",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false},recW)
    corner(R.RecSpd,8); mkStroke(R.RecSpd,curThem.Ac,1.5,0.15); reg(R.RecSpd,"BackgroundColor3",curThem.Sa,false)

    local infoW = create("Frame",{Size=UDim2.new(0.31,0,0,80),BackgroundTransparency=1},seqRow)
    infoW.LayoutOrder = 3
    create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,22),Text="Recorded",TextColor3=curThem.Mu,Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left},infoW)
    R.recInfo = create("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,0,40),Position=UDim2.new(0,0,0,24),Text="0 actions",TextColor3=curThem.Aa,Font=Enum.Font.Gotham,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center},infoW)

    R.bPlay.Activated:Connect(function()
        if #S.recSeq==0 then notify("Nothing recorded","warn"); return end
        S.play = not S.play; R.bPlay.Text = S.play and "STOP" or "Play"
        if S.play then
            task.spawn(function()
                while S.play and getgenv().YinetsuUIActive do
                    for _,it in ipairs(S.recSeq) do
                        if not S.play then break end
                        pcall(function()
                            if it.remote and it.remote.Parent then
                                if it.remote.ClassName=="RemoteEvent" then it.remote:FireServer(unpack(it.args))
                                else it.remote:InvokeServer(unpack(it.args)) end
                            end
                        end)
                        task.wait(tonumber(R.SeqSpd.Text) or 0.1)
                    end
                end
            end)
        end
    end)

    R.bRec.Activated:Connect(function()
        S.rec = not S.rec; R.bRec.Text = S.rec and "STOP" or "Record"
        if S.rec then S.recSeq = {}; R.recInfo.Text = "0 actions" end
    end)

    -- Character Cheats
    local CharP = panel(P.Cheats,"CharPanel",UDim2.new(1,-6,0,290),UDim2.new())
    padding(CharP,18,18,16,16)
    label(CharP,"CHARACTER CHEATS",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(CharP,"Local character modifications.",UDim2.new(1,0,0,18),UDim2.new(0,0,0,26),11,curThem.Mu).TextWrapped=true

    local charRow = create("Frame",{Size=UDim2.new(1,0,0,44),Position=UDim2.new(0,0,0,54),BackgroundTransparency=1},CharP)
    create("UIListLayout",{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},charRow)
    R.bFly = pBtn(charRow,"Fly: OFF",UDim2.new(0.32,0,0,44),UDim2.new(),nil); R.bFly.LayoutOrder=1
    R.bNoclip = pBtn(charRow,"Noclip: OFF",UDim2.new(0.32,0,0,44),UDim2.new(),nil); R.bNoclip.LayoutOrder=2
    R.bFullbright = pBtn(charRow,"Fullbright: OFF",UDim2.new(0.32,0,0,44),UDim2.new(),nil); R.bFullbright.LayoutOrder=3

    -- Speed / Jump labels
    label(CharP,"Speed",UDim2.new(0.48,0,0,22),UDim2.new(0,0,0,112),11,curThem.Mu)
    label(CharP,"Jump",UDim2.new(0.48,0,0,22),UDim2.new(0.52,0,0,112),11,curThem.Mu)

    -- Speed / Jump input boxes
    R.SpeedBox = create("TextBox",{
        Size=UDim2.new(0.48,0,0,42),Position=UDim2.new(0,0,0,136),
        BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="16",
        TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=13,
        ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,
    },CharP)
    corner(R.SpeedBox,8); padding(R.SpeedBox,12,12,0,0); mkStroke(R.SpeedBox,curThem.Ac,1.5,0.15); reg(R.SpeedBox,"BackgroundColor3",curThem.Sa,false)

    R.JumpBox = create("TextBox",{
        Size=UDim2.new(0.48,0,0,42),Position=UDim2.new(0.52,0,0,136),
        BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text="50",
        TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=13,
        ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,
    },CharP)
    corner(R.JumpBox,8); padding(R.JumpBox,12,12,0,0); mkStroke(R.JumpBox,curThem.Ac,1.5,0.15); reg(R.JumpBox,"BackgroundColor3",curThem.Sa,false)

    -- Apply Speed / Apply Jump buttons
    R.bApplySpeed = pBtn(CharP,"Apply Speed",UDim2.new(0.48,0,0,42),UDim2.new(0,0,0,184),nil)
    R.bApplyJump = pBtn(CharP,"Apply Jump",UDim2.new(0.48,0,0,42),UDim2.new(0.52,0,0,184),nil)

    local function getHum()
        local c = LP.Character
        return c and c:FindFirstChildOfClass("Humanoid")
    end

    R.bApplySpeed.Activated:Connect(function()
        local h = getHum(); if not h then return end
        h.WalkSpeed = tonumber(R.SpeedBox.Text) or 16
        notify("Speed: "..h.WalkSpeed,"success")
    end)
    R.bApplyJump.Activated:Connect(function()
        local h = getHum(); if not h then return end
        h.UseJumpPower = true
        h.JumpPower = tonumber(R.JumpBox.Text) or 50
        notify("Jump: "..h.JumpPower,"success")
    end)

-- MOBILE FLY: Camera-follow + ControlModule input + speed control
R.FlyControls = create("Frame",{
    Size=UDim2.new(0,280,0,110),
    Position=UDim2.new(0.5,-140,0,100),
    BackgroundColor3=curThem.Su,
    BackgroundTransparency=0.15,
    BorderSizePixel=0,
    Visible=false,
    ZIndex=180,
},SG)
corner(R.FlyControls,12)
chromaStroke(R.FlyControls)
reg(R.FlyControls,"BackgroundColor3",curThem.Su,false)
padding(R.FlyControls,12,12,8,8)

create("TextLabel",{
    BackgroundTransparency=1,
    Size=UDim2.new(1,0,0,22),
    Position=UDim2.new(0,0,0,0),
    Text="FLY: ON",
    TextColor3=curThem.Aa,
    Font=Enum.Font.GothamBold,
    TextSize=13,
    ZIndex=181,
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Center,
},R.FlyControls)

create("TextLabel",{
    BackgroundTransparency=1,
    Size=UDim2.new(0.35,0,0,32),
    Position=UDim2.new(0,0,0,26),
    Text="Fly Speed",
    TextColor3=curThem.Mu,
    Font=Enum.Font.Gotham,
    TextSize=11,
    ZIndex=181,
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Center,
},R.FlyControls)

R.flySpdBox = create("TextBox",{
    Size=UDim2.new(0.62,0,0,32),
    Position=UDim2.new(0.38,0,0,26),
    BackgroundColor3=curThem.Sa,
    BorderSizePixel=0,
    Text="60",
    TextColor3=curThem.Tx,
    Font=Enum.Font.Gotham,
    TextSize=13,
    ClearTextOnFocus=false,
    TextXAlignment=Enum.TextXAlignment.Left,
    ZIndex=181,
},R.FlyControls)
corner(R.flySpdBox,8); padding(R.flySpdBox,10,10,0,0); mkStroke(R.flySpdBox,curThem.Ac,1.5,0.15); reg(R.flySpdBox,"BackgroundColor3",curThem.Sa,false)

create("TextLabel",{
    BackgroundTransparency=1,
    Size=UDim2.new(1,0,0,22),
    Position=UDim2.new(0,0,0,62),
    Text="Drag joystick • Tilt camera for up/down",
    TextColor3=curThem.Mu,
    Font=Enum.Font.Gotham,
    TextSize=10,
    ZIndex=181,
    TextXAlignment=Enum.TextXAlignment.Left,
    TextYAlignment=Enum.TextYAlignment.Center,
},R.FlyControls)

draggable(R.FlyControls)

-- Get ControlModule (PlayerScripts.PlayerModule.ControlModule)
local yinetsuControlModule = nil
pcall(function()
    local ps = LP:WaitForChild("PlayerScripts", 10)
    if ps then
        local pm = ps:WaitForChild("PlayerModule", 10)
        if pm then
            local cm = pm:WaitForChild("ControlModule", 10)
            if cm then
                yinetsuControlModule = require(cm)
            end
        end
    end
end)

R.bFly.Activated:Connect(function()
    S.fly = not S.fly
    R.bFly.Text = S.fly and "Fly: ON" or "Fly: OFF"
    R.FlyControls.Visible = S.fly
    local c = LP.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local h = getHum()
    if not hrp or not h then return end

    if S.fly then
        local bv = Instance.new("BodyVelocity",hrp)
        bv.Name = "YinetsuFly"
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.new(0, 0, 0)

        local bg = Instance.new("BodyGyro", hrp)
        bg.Name = "YinetsuFlyGyro"
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 90000
        bg.D = 500
        bg.CFrame = hrp.CFrame

        S.flyConn = RS.RenderStepped:Connect(function()
            if not hrp.Parent or not S.fly then return end
            if not bv.Parent or not bg.Parent then return end
            local cam = workspace.CurrentCamera
            if not cam then return end

            -- Character follows camera orientation
            bg.CFrame = cam.CFrame

            -- Read joystick via ControlModule (works even with PlatformStand)
            local mv = Vector3.new()
            if yinetsuControlModule then
                pcall(function()
                    mv = yinetsuControlModule:GetMoveVector()
                end)
            end
            -- Fallback
            if mv.Magnitude < 0.05 then
                pcall(function() mv = UIS:GetMoveVector() end)
            end

            -- Speed from textbox
            local spd = tonumber(R.flySpdBox.Text) or 60
            spd = math.clamp(spd, 5, 500)

            -- Build velocity (FULL 3D camera-relative)
            local vel = Vector3.new()
            if mv.Magnitude > 0.05 then
                vel = (cam.CFrame.RightVector * mv.X) - (cam.CFrame.LookVector * mv.Z)
            end

            bv.Velocity = vel.Magnitude > 0 and (vel.Unit * spd) or Vector3.new(0, 0, 0)
        end)

        h.PlatformStand = true
        notify("Fly ON — move camera + joystick","success")
    else
        if S.flyConn then S.flyConn:Disconnect(); S.flyConn = nil end
        local bv = hrp:FindFirstChild("YinetsuFly"); if bv then bv:Destroy() end
        local bg = hrp:FindFirstChild("YinetsuFlyGyro"); if bg then bg:Destroy() end
        h.PlatformStand = false
        notify("Fly OFF","info")
    end
end)

    R.bNoclip.Activated:Connect(function()
        S.noclip = not S.noclip
        R.bNoclip.Text = S.noclip and "Noclip: ON" or "Noclip: OFF"
        if S.noclip then
            S.noclipConn = RS.Stepped:Connect(function()
                local c = LP.Character; if not c then return end
                for _,v in pairs(c:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end)
            notify("Noclip ON","success")
        else
            if S.noclipConn then S.noclipConn:Disconnect(); S.noclipConn = nil end
            local c = LP.Character
            if c then
                for _,v in pairs(c:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then v.CanCollide = true end
                end
            end
            notify("Noclip OFF","info")
        end
    end)

    R.bFullbright.Activated:Connect(function()
        S.fullbright = not S.fullbright
        R.bFullbright.Text = S.fullbright and "Fullbright: ON" or "Fullbright: OFF"
        if S.fullbright then
            S.oL.Brightness=LG.Brightness; S.oL.ClockTime=LG.ClockTime; S.oL.FogEnd=LG.FogEnd
            LG.Brightness=5; LG.ClockTime=14; LG.FogEnd=100000
            notify("Fullbright ON","success")
        else
            LG.Brightness=S.oL.Brightness or 2; LG.ClockTime=S.oL.ClockTime or 14; LG.FogEnd=S.oL.FogEnd or 100000
            notify("Fullbright OFF","info")
        end
    end)

    -- Utility Cheats
local UtilCP = panel(P.Cheats,"UtilCheatPanel",UDim2.new(1,-6,0,180),UDim2.new())
padding(UtilCP,18,18,16,16)
label(UtilCP,"UTILITY CHEATS",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)

local utilRow = create("Frame",{Size=UDim2.new(1,0,0,44),Position=UDim2.new(0,0,0,42),BackgroundTransparency=1},UtilCP)
create("UIListLayout",{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},utilRow)
R.bAntiFling = pBtn(utilRow,"Anti-Fling: OFF",UDim2.new(0.32,0,0,44),UDim2.new(),nil); R.bAntiFling.LayoutOrder=1
R.bRejoinDeath = pBtn(utilRow,"Rejoin Death: OFF",UDim2.new(0.32,0,0,44),UDim2.new(),nil); R.bRejoinDeath.LayoutOrder=2
R.bAutoClick = pBtn(utilRow,"Auto-Click: OFF",UDim2.new(0.32,0,0,44),UDim2.new(),nil); R.bAutoClick.LayoutOrder=3

R.bAntiFling.Activated:Connect(function()
    S.antiFling = not S.antiFling
    R.bAntiFling.Text = S.antiFling and "Anti-Fling: ON" or "Anti-Fling: OFF"
    if S.antiFling then
        S.charConn = RS.Heartbeat:Connect(function()
            local c = LP.Character; if not c then return end
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then
                local av = hrp:FindFirstChild("YinetsuAntiFling")
                if not av then
                    av = Instance.new("BodyAngularVelocity", hrp)
                    av.Name = "YinetsuAntiFling"
                    av.MaxTorque = Vector3.new(0,0,0)
                    av.AngularVelocity = Vector3.new(0,0,0)
                end
            end
        end)
        notify("Anti-Fling ON","success")
    else
        if S.charConn then S.charConn:Disconnect(); S.charConn = nil end
        notify("Anti-Fling OFF","info")
    end
end)

R.bRejoinDeath.Activated:Connect(function()
    S.rejoinDeath = not S.rejoinDeath
    R.bRejoinDeath.Text = S.rejoinDeath and "Rejoin Death: ON" or "Rejoin Death: OFF"
end)

-- ========== AUTO-CLICKER SYSTEM ==========
S.acRunning = false
S.acStartTime = 0
S.acCircles = {}

R.ACApp = create("Frame",{
    Name="ACApp",
    Size=UDim2.new(0,230,0,190),
    Position=UDim2.new(1,-244,0.5,-95),
    BackgroundColor3=curThem.Su,
    BackgroundTransparency=0.02,
    BorderSizePixel=0,
    Visible=false,
    ZIndex=260,
},SG)
corner(R.ACApp,14)
chromaStroke(R.ACApp)
reg(R.ACApp,"BackgroundColor3",curThem.Su,false)
padding(R.ACApp,12,12,10,10)
draggable(R.ACApp)

create("TextLabel",{
    BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),
    Text="AUTO-CLICKER",
    TextColor3=curThem.Aa,
    Font=Enum.Font.GothamBold,TextSize=13,
    ZIndex=261,TextXAlignment=Enum.TextXAlignment.Center,
},R.ACApp)

R.acTimer = create("TextLabel",{
    BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),
    Position=UDim2.new(0,0,0,22),
    Text="00:00.0",
    TextColor3=curThem.Tx,
    Font=Enum.Font.GothamBold,TextSize=22,
    ZIndex=261,TextXAlignment=Enum.TextXAlignment.Center,
},R.ACApp)

create("TextLabel",{
    BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),
    Position=UDim2.new(0,0,0,54),
    Text="Drag circles • +/− adjust speed",
    TextColor3=curThem.Mu,
    Font=Enum.Font.Gotham,TextSize=10,
    ZIndex=261,TextXAlignment=Enum.TextXAlignment.Center,
},R.ACApp)

R.acStartStop = pBtn(R.ACApp,"START",UDim2.new(1,0,0,36),UDim2.new(0,0,0,76),nil)
R.acStartStop.ZIndex = 261
R.acAdd = pBtn(R.ACApp,"+ Add Circle",UDim2.new(0.48,0,0,32),UDim2.new(0,0,0,118),nil)
R.acAdd.ZIndex = 261
R.acRemove = pBtn(R.ACApp,"− Remove",UDim2.new(0.48,0,0,32),UDim2.new(0.52,0,0,118),nil)
R.acRemove.ZIndex = 261

local function addClickCircle(pos, interval)
    if #S.acCircles >= 10 then notify("Max 10 circles","warn"); return end
    interval = interval or 0.1

    local circle = create("Frame",{
        Size=UDim2.fromOffset(80,80),
        Position=pos or UDim2.new(0.5,-40,0.5,-40),
        BackgroundTransparency=0.55,
        BackgroundColor3=curThem.Ac,
        BorderSizePixel=0,
        Visible=true,
        ZIndex=240,
    },SG)
    corner(circle,40)
    mkStroke(circle,curThem.Ac,3,0)

    create("Frame",{
        Size=UDim2.new(0.5,0,0,2),
        Position=UDim2.new(0.25,0,0.5,-1),
        BackgroundColor3=Color3.new(1,1,1),
        BorderSizePixel=0,ZIndex=241,
    },circle)
    create("Frame",{
        Size=UDim2.new(0,2,0.5,0),
        Position=UDim2.new(0.5,-1,0.25,0),
        BackgroundColor3=Color3.new(1,1,1),
        BorderSizePixel=0,ZIndex=241,
    },circle)

    local intervalLbl = create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,0,0.3,0),
        Position=UDim2.new(0,0,0.6,0),
        Text=tostring(math.floor(interval*1000)),
        TextColor3=Color3.new(1,1,1),
        Font=Enum.Font.GothamBold,TextSize=13,
        ZIndex=242,TextXAlignment=Enum.TextXAlignment.Center,
    },circle)

    local minusBtn = create("TextButton",{
        Size=UDim2.fromOffset(26,26),
        Position=UDim2.new(0,-12,1,-14),
        BackgroundColor3=curThem.Da,
        BorderSizePixel=0,Text="−",
        TextColor3=Color3.new(1,1,1),
        Font=Enum.Font.GothamBold,TextSize=16,
        AutoButtonColor=false,ZIndex=243,
    },circle)
    corner(minusBtn,13); mkStroke(minusBtn,curThem.Ac,1.5,0.2)

    local plusBtn = create("TextButton",{
        Size=UDim2.fromOffset(26,26),
        Position=UDim2.new(1,-14,1,-14),
        BackgroundColor3=curThem.Sc,
        BorderSizePixel=0,Text="+",
        TextColor3=Color3.new(1,1,1),
        Font=Enum.Font.GothamBold,TextSize=16,
        AutoButtonColor=false,ZIndex=243,
    },circle)
    corner(plusBtn,13); mkStroke(plusBtn,curThem.Ac,1.5,0.2)

    local d, ds, sp = false, nil, nil
    track(circle.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            local px, py = i.Position.X, i.Position.Y
            local mp = minusBtn.AbsolutePosition; local ms = minusBtn.AbsoluteSize
            local pp = plusBtn.AbsolutePosition;  local ps = plusBtn.AbsoluteSize
            local onMinus = px >= mp.X and px <= mp.X+ms.X and py >= mp.Y and py <= mp.Y+ms.Y
            local onPlus  = px >= pp.X and px <= pp.X+ps.X and py >= pp.Y and py <= pp.Y+ps.Y
            if onMinus or onPlus then return end
            d=true; ds=i.Position; sp=circle.Position
        end
    end))
    track(UIS.InputChanged:Connect(function(i)
        if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local dl = i.Position - ds
            circle.Position = UDim2.new(sp.X.Scale,sp.X.Offset+dl.X,sp.Y.Scale,sp.Y.Offset+dl.Y)
        end
    end))
    track(UIS.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d=false end
    end))

    local data = {frame=circle, interval=interval, lastClick=0, lbl=intervalLbl}
    table.insert(S.acCircles, data)

    minusBtn.Activated:Connect(function()
        data.interval = math.min(data.interval * 1.5, 5)
        data.lbl.Text = tostring(math.floor(data.interval * 1000))
    end)
    plusBtn.Activated:Connect(function()
        data.interval = math.max(data.interval / 1.5, 0.01)
        data.lbl.Text = tostring(math.floor(data.interval * 1000))
    end)
end

R.acAdd.Activated:Connect(function()
    addClickCircle(nil, 0.1)
end)
R.addCircleFromSave = function(pos, interval)
    addClickCircle(pos, interval)
end

R.acRemove.Activated:Connect(function()
    if #S.acCircles == 0 then return end
    local last = table.remove(S.acCircles)
    if last and last.frame then last.frame:Destroy() end
end)

R.acStartStop.Activated:Connect(function()
    S.acRunning = not S.acRunning
    if S.acRunning then
        R.acStartStop.Text = "STOP"
        R.acStartStop.BackgroundColor3 = curThem.Da
        S.acStartTime = os.clock()

        task.spawn(function()
            while S.acRunning and getgenv().YinetsuUIActive do
                local el = os.clock() - S.acStartTime
                R.acTimer.Text = string.format("%02d:%04.1f", math.floor(el/60), el%60)
                task.wait(0.1)
            end
        end)

        task.spawn(function()
            while S.acRunning and getgenv().YinetsuUIActive do
                local now = os.clock()
                for _, c in ipairs(S.acCircles) do
                    if c.frame and c.frame.Parent then
                        if now - c.lastClick >= c.interval then
                            c.lastClick = now
                            pcall(function()
                                local ap = c.frame.AbsolutePosition
                                local as = c.frame.AbsoluteSize
                                VU:ClickButton1(Vector2.new(ap.X + as.X/2, ap.Y + as.Y/2))
                            end)
                        end
                    end
                end
                task.wait(0.01)
            end
        end)
    else
        R.acStartStop.Text = "START"
        R.acStartStop.BackgroundColor3 = curThem.Sc
        R.acTimer.Text = "00:00.0"
    end
end)

R.bAutoClick.Activated:Connect(function()
    S.autoClick = not S.autoClick
    R.bAutoClick.Text = S.autoClick and "Auto-Click: ON" or "Auto-Click: OFF"
    R.ACApp.Visible = S.autoClick
    if S.autoClick then
        if #S.acCircles == 0 then
            addClickCircle(nil, 0.1)
        end
        for _, c in ipairs(S.acCircles) do
            if c.frame then c.frame.Visible = true end
        end
        notify("Auto-Clicker ON","success")
    else
        S.acRunning = false
        R.acStartStop.Text = "START"
        R.acStartStop.BackgroundColor3 = curThem.Sc
        R.acTimer.Text = "00:00.0"
        for _, c in ipairs(S.acCircles) do
            if c.frame then c.frame.Visible = false end
        end
    end
end)

    -- Teleport
    local TPP = panel(P.Cheats,"TeleportPanel",UDim2.new(1,-6,0,170),UDim2.new())
    padding(TPP,18,18,16,16)
    label(TPP,"TELEPORT",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(TPP,"Teleport to players or save/load position.",UDim2.new(1,0,0,18),UDim2.new(0,0,0,26),11,curThem.Mu).TextWrapped=true

    R.TPPlayerBox = create("TextBox",{
        Size=UDim2.new(0.55,0,0,38),Position=UDim2.new(0,0,0,54),
        BackgroundColor3=curThem.Sa,BorderSizePixel=0,
        PlaceholderText="Player name...",Text="",TextColor3=curThem.Tx,
        Font=Enum.Font.Gotham,TextSize=12,ClearTextOnFocus=false,
        TextXAlignment=Enum.TextXAlignment.Left,
    },TPP)
    corner(R.TPPlayerBox,8); padding(R.TPPlayerBox,12,12,0,0); mkStroke(R.TPPlayerBox,curThem.Ac,1.5,0.15); reg(R.TPPlayerBox,"BackgroundColor3",curThem.Sa,false)

    pBtn(TPP,"TP to Player",UDim2.new(0.42,0,0,38),UDim2.new(0.58,0,0,54),function()
        local n = R.TPPlayerBox.Text:lower()
        local t
        for _,p in ipairs(PL:GetPlayers()) do
            if p~=LP and p.Name:lower():find(n,1,true) then t=p; break end
        end
        if not t or not t.Character then notify("Player not found","warn"); return end
        local hrp = t.Character:FindFirstChild("HumanoidRootPart")
        local mhrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp and mhrp then
            mhrp.CFrame = hrp.CFrame + Vector3.new(0,3,0)
            notify("TP to "..t.Name,"success")
        end
    end)

    local tpRow = create("Frame",{Size=UDim2.new(1,0,0,42),Position=UDim2.new(0,0,0,108),BackgroundTransparency=1},TPP)
    create("UIListLayout",{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center},tpRow)
    pBtn(tpRow,"Save Position",UDim2.new(0.48,0,0,42),UDim2.new(),function()
        local c = LP.Character; local h = c and c:FindFirstChild("HumanoidRootPart")
        if h then S.savedPos = h.CFrame; notify("Saved","success") end
    end).LayoutOrder=1
    pBtn(tpRow,"Load Position",UDim2.new(0.48,0,0,42),UDim2.new(),function()
        if not S.savedPos then notify("Nothing saved","warn"); return end
        local c = LP.Character; local h = c and c:FindFirstChild("HumanoidRootPart")
        if h then h.CFrame = S.savedPos; notify("Teleported","success") end
    end).LayoutOrder=2
end

--==============================================================
-- UTILITIES
--==============================================================
do
    local Up = panel(P.Utilities,"UtilPanel",UDim2.new(1,-6,0,230),UDim2.new())
    padding(Up,18,18,16,16)
    label(Up,"SERVER UTILITIES",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(Up,"Rejoin or use standard public matchmaking.",UDim2.new(1,0,0,24),UDim2.new(0,0,0,30),12,curThem.Mu).TextWrapped=true
    R.TPStat = label(Up,"Ready",UDim2.new(1,0,0,24),UDim2.new(0,0,0,62),12,curThem.Sc)

    pBtn(Up,"Rejoin Server",UDim2.new(0.32,0,0,48),UDim2.new(0,0,0,96),function()
        if S.tp then return end; S.tp = true
        R.TPStat.Text="Requesting rejoin..."; R.TPStat.TextColor3=curThem.Wa
        local ok = pcall(function() TPS:Teleport(game.PlaceId,LP) end)
        if not ok then S.tp=false; R.TPStat.Text="Failed"; R.TPStat.TextColor3=curThem.Da end
    end)
pBtn(Up,"Server Hop",UDim2.new(0.32,0,0,48),UDim2.new(0.34,0,0,96),function()
    if S.tp then return end
    R.TPStat.Text="Smart hopping..."; R.TPStat.TextColor3=curThem.Wa
if _G.YinetsuActions and _G.YinetsuActions.server_hop_smart then
    local ok, res = pcall(_G.YinetsuActions.server_hop_smart.run)
        R.TPStat.Text = ok and "Hop initiated" or "Hop failed"
        R.TPStat.TextColor3 = ok and curThem.Sc or curThem.Da
    else
        S.tp = true
        pcall(function() TPS:Teleport(game.PlaceId,LP) end)
    end
end)
    pBtn(Up,"Copy Place ID",UDim2.new(0.32,0,0,48),UDim2.new(0.68,0,0,96),function()
        setclipboard(tostring(game.PlaceId)); notify("Copied","success")
    end)

    local Fp = panel(P.Utilities,"FPSPanel",UDim2.new(1,-6,0,170),UDim2.new())
    padding(Fp,18,18,16,16)
    label(Fp,"LOCAL FPS BOOSTER",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(Fp,"Adjusts local lighting and disables post-effects.",UDim2.new(1,0,0,36),UDim2.new(0,0,0,30),12,curThem.Mu).TextWrapped=true

R.setFPSBoost = function(e)
    if e==S.fpsBoost then return end
    S.fpsBoost = e
    if e then
        S.oE = {}
        S.oL.GlobalShadows=LG.GlobalShadows; S.oL.FogEnd=LG.FogEnd; S.oL.Brightness=LG.Brightness
        for _,d in ipairs(LG:GetDescendants()) do
            if d:IsA("PostEffect") and d.Enabled then
                S.oE[d]=true
                d.Enabled=false
            end
        end
        LG.GlobalShadows=false; LG.FogEnd=100000; LG.Brightness=math.max(LG.Brightness,2)
        notify("FPS Boost ON","success")
    else
        LG.GlobalShadows=S.oL.GlobalShadows; LG.FogEnd=S.oL.FogEnd; LG.Brightness=S.oL.Brightness
        for k,v in pairs(S.oE) do if k and k.Parent then k.Enabled=v end end
        S.oE = {}
        notify("FPS Boost OFF","info")
    end
end

    R.bFPS = pBtn(Fp,"Enable FPS Booster",UDim2.new(1,0,0,48),UDim2.new(0,0,0,80),function()
        R.setFPSBoost(not S.fpsBoost)
        R.bFPS.Text = S.fpsBoost and "Disable FPS Booster" or "Enable FPS Booster"
    end)
end

--==============================================================
-- THEMES
--==============================================================
do
    local Tp = panel(P.Theme,"ThemePanel",UDim2.new(1,-6,0,100),UDim2.new())
    padding(Tp,18,18,16,16)
    label(Tp,"APPEARANCE",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    R.ThemeStat = label(Tp,"Current: "..curName,UDim2.new(1,0,0,24),UDim2.new(0,0,0,30),12,curThem.Mu)
    label(Tp,"15 themes available. Click to apply.",UDim2.new(1,0,0,24),UDim2.new(0,0,0,54),11,curThem.Mu)

    R.ThemeGrid = create("Frame",{Size=UDim2.new(1,-6,0,340),BackgroundTransparency=1},P.Theme)
    create("UIGridLayout",{CellSize=UDim2.new(0.32,0,0,54),CellPadding=UDim2.new(0,10,0,10),SortOrder=Enum.SortOrder.LayoutOrder},R.ThemeGrid)

    local SL = panel(P.Theme,"SaveLoad",UDim2.new(1,-6,0,200),UDim2.new())
    padding(SL,18,18,16,16)
    label(SL,"PRESETS",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(SL,"Save or load ALL current settings.",UDim2.new(1,0,0,36),UDim2.new(0,0,0,30),11,curThem.Mu).TextWrapped=true

    pBtn(SL,"Save All Settings",UDim2.new(0.32,0,0,48),UDim2.new(0,0,0,80),function()
        Settings.theme = curName
        saveSettings()
        notify("Saved: "..curName,"success")
    end)
    pBtn(SL,"Load Saved",UDim2.new(0.32,0,0,48),UDim2.new(0.34,0,0,80),function()
        if isfile(cfg.Path) then
            local ok, dt = pcall(function() return HS:JSONDecode(readfile(cfg.Path)) end)
            if ok and dt then
                for k,v in pairs(dt) do Settings[k]=v end
                if Themes[Settings.theme] then _G.__yinetsu_applyTheme(Settings.theme, true) end
                if MainSC then MainSC.Scale = Settings.guiScale end
                notify("Loaded: "..tostring(Settings.theme),"success")
            end
        else notify("No saved file","warn") end
    end)
    pBtn(SL,"Reset Defaults",UDim2.new(0.32,0,0,48),UDim2.new(0.68,0,0,80),function()
    Settings.theme="Cyberpunk"; Settings.animateColors=true; Settings.animationSpeed=0.8
    Settings.animationIntensity=0.4; Settings.guiScale=0.8
    saveSettings()
    _G.__yinetsu_applyTheme("Cyberpunk", true)
    if MainSC then MainSC.Scale = Settings.guiScale end
    notify("Defaults restored","info")
   end)
end

--==============================================================
-- MUSIC TAB
--==============================================================
do
    -- ═══ NOW PLAYING PANEL ═══
    local npPanel = panel(P.Music,"NowPlayingPanel",UDim2.new(1,-6,0,275),UDim2.new())
    padding(npPanel,18,18,14,14)
    label(npPanel,"NOW PLAYING",UDim2.new(1,0,0,22),UDim2.new(),13,curThem.Aa)

    R.musicNowTitle = label(npPanel,"— No track —",UDim2.new(1,0,0,24),UDim2.new(0,0,0,28),15,curThem.Tx)
    R.musicNowTitle.Font = Enum.Font.GothamBold

    -- Progress bar
    R.musicProgFrame = create("Frame",{
        Size=UDim2.new(1,0,0,10),Position=UDim2.new(0,0,0,62),
        BackgroundColor3=curThem.Sa,BorderSizePixel=0,
    },npPanel)
    corner(R.musicProgFrame,5); mkStroke(R.musicProgFrame,curThem.Ac,1.5,0.15)
    reg(R.musicProgFrame,"BackgroundColor3",curThem.Sa,false)

    R.musicProgFill = create("Frame",{
        Size=UDim2.new(0,0,1,0),BackgroundColor3=curThem.Ac,BorderSizePixel=0,
    },R.musicProgFrame)
    corner(R.musicProgFill,5); reg(R.musicProgFill,"BackgroundColor3",curThem.Ac,true)

    -- Seek click/tap
    track(R.musicProgFrame.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            if R.musicSound and R.musicSound.TimeLength > 0 then
                local rel = math.clamp((input.Position.X - R.musicProgFrame.AbsolutePosition.X) / R.musicProgFrame.AbsoluteSize.X, 0, 1)
                R.musicSound.TimePosition = rel * R.musicSound.TimeLength
            end
        end
    end))

    R.musicTimeLbl = label(npPanel,"0:00 / 0:00",UDim2.new(1,0,0,18),UDim2.new(0,0,0,78),11,curThem.Mu)
    R.musicTimeLbl.TextXAlignment = Enum.TextXAlignment.Right

    -- Controls row
    R.musicCtrlsRow = create("Frame",{
        Size=UDim2.new(1,0,0,50),Position=UDim2.new(0,0,0,106),BackgroundTransparency=1,
    },npPanel)
    create("UIListLayout",{
        Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,
    },R.musicCtrlsRow)

    R.mBtnPrev = pBtn(R.musicCtrlsRow,"⏮ Prev",UDim2.new(0.23,0,0,46),UDim2.new(),function()
        R.prevTrack()
    end)
    R.mBtnPrev.LayoutOrder = 1

    R.mBtnPlayPause = pBtn(R.musicCtrlsRow,"▶ Play",UDim2.new(0.23,0,0,46),UDim2.new(),function()
        if R.musicSound and R.musicSound.IsPlaying then
            R.pauseMusic()
            R.mBtnPlayPause.Text = "▶ Play"
        else
            R.playMusic()
            R.mBtnPlayPause.Text = "⏸ Pause"
        end
    end)
    R.mBtnPlayPause.LayoutOrder = 2

    R.mBtnNext = pBtn(R.musicCtrlsRow,"Next ⏭",UDim2.new(0.23,0,0,46),UDim2.new(),function()
        R.nextTrack()
    end)
    R.mBtnNext.LayoutOrder = 3

    R.mBtnStop = pBtn(R.musicCtrlsRow,"⏹ Stop",UDim2.new(0.23,0,0,46),UDim2.new(),function()
        R.stopMusic()
        R.mBtnPlayPause.Text = "▶ Play"
    end)
    R.mBtnStop.LayoutOrder = 4

    -- Mode buttons row
    R.musicModesRow = create("Frame",{
        Size=UDim2.new(1,0,0,38),Position=UDim2.new(0,0,0,166),BackgroundTransparency=1,
    },npPanel)
    create("UIListLayout",{
        Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,
    },R.musicModesRow)

    R.mBtnShuffle = pBtn(R.musicModesRow,"🔀 Shuffle: ON",UDim2.new(0.33,0,0,38),UDim2.new(),function()
    Settings.musicShuffle = not Settings.musicShuffle
    R.mBtnShuffle.Text = "🔀 Shuffle: "..(Settings.musicShuffle and "ON" or "OFF")
    S.shuffleHistory = {}
    saveSettings()
    if _G.addSysLog then pcall(_G.addSysLog,"Shuffle: "..(Settings.musicShuffle and "ON" or "OFF"),"MUSIC") end
end)
    R.mBtnShuffle.LayoutOrder = 1
    if not Settings.musicShuffle then R.mBtnShuffle.Text = "🔀 Shuffle: OFF" end

    R.mBtnFavOnly = pBtn(R.musicModesRow,"⭐ Favs Only",UDim2.new(0.33,0,0,38),UDim2.new(),function()
    Settings.musicFavoritesOnly = not Settings.musicFavoritesOnly
    R.mBtnFavOnly.Text = "⭐ Favs: "..(Settings.musicFavoritesOnly and "ON" or "OFF")
    saveSettings()
    if _G.addSysLog then pcall(_G.addSysLog,"Favs Only: "..(Settings.musicFavoritesOnly and "ON" or "OFF"),"MUSIC") end
end)
    R.mBtnFavOnly.LayoutOrder = 2
    R.mBtnFavOnly.Text = "⭐ Favs: "..(Settings.musicFavoritesOnly and "ON" or "OFF")

    R.mBtnRepeat = pBtn(R.musicModesRow,"🔁 Repeat: All",UDim2.new(0.33,0,0,38),UDim2.new(),function()
    local modes = {"all","one","off"}
    local names = {all="All", one="One", off="Off"}
    local i = 1
    for idx, m in ipairs(modes) do if m == Settings.musicRepeat then i = idx end end
    i = (i % #modes) + 1
    Settings.musicRepeat = modes[i]
    R.mBtnRepeat.Text = "🔁 Repeat: "..names[Settings.musicRepeat]
    saveSettings()
    if _G.addSysLog then pcall(_G.addSysLog,"Repeat: "..names[Settings.musicRepeat],"MUSIC") end
end)
    R.mBtnRepeat.LayoutOrder = 3
R.mBtnRepeat.Text = "🔁 Repeat: "..({all="All", one="One", off="Off"})[Settings.musicRepeat]

-- ═══ VOLUME SLIDER ═══
label(npPanel,"Volume",UDim2.new(0.15,0,0,20),UDim2.new(0,0,0,212),11,curThem.Mu)

R.musicVolSliderTab = create("Frame",{
    Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,232),
    BackgroundColor3=curThem.Sa,BorderSizePixel=0,
},npPanel)
corner(R.musicVolSliderTab,9); mkStroke(R.musicVolSliderTab,curThem.Ac,1.5,0.15)
reg(R.musicVolSliderTab,"BackgroundColor3",curThem.Sa,false)

R.musicVolFillTab = create("Frame",{
    Size=UDim2.new(Settings.musicVolume or 0.5,0,1,0),
    BackgroundColor3=curThem.Ac,BorderSizePixel=0,
},R.musicVolSliderTab)
corner(R.musicVolFillTab,9); reg(R.musicVolFillTab,"BackgroundColor3",curThem.Ac,true)

R.musicVolKnobTab = create("Frame",{
    Size=UDim2.fromOffset(20,20),
    Position=UDim2.new(Settings.musicVolume or 0.5,-10,0.5,-10),
    BackgroundColor3=curThem.Tx,BorderSizePixel=0,ZIndex=2,
},R.musicVolSliderTab)
corner(R.musicVolKnobTab,10); mkStroke(R.musicVolKnobTab,curThem.Ac,2,0)
reg(R.musicVolKnobTab,"BackgroundColor3",curThem.Tx,false)

R.musicVolLabelTab = create("TextLabel",{
    BackgroundTransparency=1,
    Size=UDim2.new(1,0,1,0),
    Text=string.format("%.2f", Settings.musicVolume or 0.5),
    TextColor3=curThem.Tx,
    Font=Enum.Font.GothamBold,
    TextSize=11,
    ZIndex=3,
},R.musicVolSliderTab)
reg(R.musicVolLabelTab,"TextColor3",curThem.Tx,true)

local volDragTab = false
local function updateVolTab(mouseX)
    local absPos = R.musicVolSliderTab.AbsolutePosition
    local absSize = R.musicVolSliderTab.AbsoluteSize
    local rel = math.clamp((mouseX - absPos.X) / absSize.X, 0, 1)
    Settings.musicVolume = rel
    R.musicVolFillTab.Size = UDim2.new(rel,0,1,0)
    R.musicVolKnobTab.Position = UDim2.new(rel,-10,0.5,-10)
    R.musicVolLabelTab.Text = string.format("%.2f",rel)
    if R.musicSound then R.musicSound.Volume = rel end
    saveSettings()
end
track(R.musicVolSliderTab.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        volDragTab = true; updateVolTab(input.Position.X)
    end
end))
track(UIS.InputChanged:Connect(function(input)
    if volDragTab and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        updateVolTab(input.Position.X)
    end
end))
track(UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        volDragTab = false
    end
end))

    -- ═══ PLAYLIST PANEL ═══
    local plPanel = panel(P.Music,"PlaylistPanel",UDim2.new(1,-6,0,420),UDim2.new())
    padding(plPanel,14,14,12,12)
    label(plPanel,"PLAYLIST",UDim2.new(1,0,0,22),UDim2.new(),13,curThem.Aa)

    -- Add track row
    local addRow = create("Frame",{
        Size=UDim2.new(1,0,0,38),Position=UDim2.new(0,0,0,30),BackgroundTransparency=1,
    },plPanel)
    create("UIListLayout",{
        Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,
    },addRow)

    R.musicAddId = create("TextBox",{
    Size=UDim2.new(0.48,0,0,38),BackgroundColor3=curThem.Sa,BorderSizePixel=0,
        PlaceholderText="Paste audio ID...",PlaceholderColor3=curThem.Mu,
        Text="",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,
        ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,
    },addRow)
    corner(R.musicAddId,8); padding(R.musicAddId,10,10,0,0)
    mkStroke(R.musicAddId,curThem.Ac,1.5,0.15); reg(R.musicAddId,"BackgroundColor3",curThem.Sa,false)
    R.musicAddId.LayoutOrder = 1

    R.musicAddName = create("TextBox",{
    Size=UDim2.new(0.22,0,0,38),BackgroundColor3=curThem.Sa,BorderSizePixel=0,
        PlaceholderText="Name",PlaceholderColor3=curThem.Mu,
        Text="",TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,
        ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left,
    },addRow)
    corner(R.musicAddName,8); padding(R.musicAddName,10,10,0,0)
    mkStroke(R.musicAddName,curThem.Ac,1.5,0.15); reg(R.musicAddName,"BackgroundColor3",curThem.Sa,false)
    R.musicAddName.LayoutOrder = 2

    R.musicAddBtn = pBtn(addRow,"+ Add",UDim2.new(0.18,-2,0,38),UDim2.new(),function()
        local rawId = tostring(R.musicAddId.Text or ""):gsub("[^%d]", "")
        local nm = tostring(R.musicAddName.Text or "")
        if rawId == "" then notify("Invalid ID","warn"); return end
        if nm == "" then nm = rawId end
        table.insert(Settings.musicTracks, {id=rawId, name=nm, fav=false})
        saveSettings()
        R.musicAddId.Text = ""; R.musicAddName.Text = ""
        if R.refreshMusicList then R.refreshMusicList() end
        notify("Added: "..nm,"success")
    end)
    R.musicAddBtn.LayoutOrder = 3

-- Reset button
R.musicResetBtn = pBtn(addRow,"↺",UDim2.new(0.10,0,0,38),UDim2.new(),function()
    -- Confirmation
    local c = create("Frame",{
        Size=UDim2.new(0,260,0,120),
        Position=UDim2.fromScale(0.5,0.5),
        AnchorPoint=Vector2.new(0.5,0.5),
        BackgroundColor3=curThem.Su,
        BorderSizePixel=0,ZIndex=500,
    },SG)
    corner(c,12); chromaStroke(c)
    reg(c,"BackgroundColor3",curThem.Su,false)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-20,0,28),
        Position=UDim2.new(0,10,0,14),
        Text="Restore 11 default tracks?",
        TextColor3=curThem.Tx,Font=Enum.Font.GothamBold,
        TextSize=14,TextWrapped=true,ZIndex=501,
    },c)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-20,0,20),
        Position=UDim2.new(0,10,0,44),
        Text="ALL DISPLAY TRACKS WILL BE RESTORE",
        TextColor3=curThem.Mu,Font=Enum.Font.Gotham,
        TextSize=11,ZIndex=501,
    },c)

    local yBtn = pBtn(c,"Reset",UDim2.new(0.45,0,0,34),UDim2.new(0.03,0,0,76),function()
    local seedIds = {
        {"127635921273625", "Shiawase (G2961 Remix)"},
        {"5409360995",      "Shiawase (Tidal Wave VIP)"},
        {"81457346687617",  "Funk Azulejo"},
        {"139266399633943", "Lost Phonk"},
        {"101101342670886", "Dark City Lights Phonk"},
        {"119181820374358", "Cursed Slowdown"},
        {"93316204367148",  "SIUU PHONK"},
        {"81654436561725",  "Flamewall"},
        {"118241465317467", "CINEMATIC PHONK HORIZON"},
        {"86517694279595",  "WHAT THE PHONK?"},
        {"103415930328599", "ELECTRIC PHANTOM"},
    }
    Settings.musicTracks = {}
    for _, tr in ipairs(seedIds) do
        table.insert(Settings.musicTracks, {id=tr[1], name=tr[2], fav=false})
    end
    Settings.musicIndex = 1
    saveSettings()
    R.refreshMusicList()
    notify("Tracks restored","success")
    c:Destroy()
end)
    yBtn.ZIndex = 501

    local nBtn = pBtn(c,"Cancel",UDim2.new(0.45,0,0,34),UDim2.new(0.52,0,0,76),function()
        c:Destroy()
    end)
    nBtn.ZIndex = 501
end)
R.musicResetBtn.LayoutOrder = 4

-- Track list (scrollable)
    
    R.musicListScroll = create("ScrollingFrame",{
        Size=UDim2.new(1,0,1,-80),Position=UDim2.new(0,0,0,76),
        BackgroundColor3=curThem.Bg,BorderSizePixel=0,
        ScrollBarThickness=5,ScrollBarImageColor3=curThem.Ac,
        CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
    },plPanel)
    corner(R.musicListScroll,10); padding(R.musicListScroll,8,8,8,8)
    mkStroke(R.musicListScroll,curThem.Aa,1.5,0.15); reg(R.musicListScroll,"BackgroundColor3",curThem.Bg,false)
    create("UIListLayout",{
        Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,
    },R.musicListScroll)

    -- Refresh function
    R.refreshMusicList = function()
        for _, c in ipairs(R.musicListScroll:GetChildren()) do
            if c:IsA("Frame") then c:Destroy() end
        end
        for i, t in ipairs(Settings.musicTracks) do
local isCurrent = (i == Settings.musicIndex)
local row = create("Frame",{
    Size=UDim2.new(1,-4,0,42),
    BackgroundColor3=isCurrent and curThem.Ac or curThem.Sa,
    BorderSizePixel=0,LayoutOrder = i,
},R.musicListScroll)
corner(row,8)
reg(row,"BackgroundColor3", isCurrent and curThem.Ac or curThem.Sa, false) -- Naka-base na sa tamang kulay

            local num = create("TextLabel",{
                BackgroundTransparency=1,Size=UDim2.fromOffset(28,42),
                Position=UDim2.new(0,4,0,0),Text=tostring(i),
                TextColor3=curThem.Mu,Font=Enum.Font.GothamBold,TextSize=11,
            },row)
            reg(num,"TextColor3",curThem.Mu,true)

            -- Show ID by default; if a custom name exists (not "Track N"), show "ID — Name"
local disp = t.id or "?"
if t.name and t.name ~= "" and not t.name:match("^Track %d+$") then
    disp = t.id.." — "..t.name
end
local nameLbl = create("TextButton",{
    BackgroundTransparency=1,Size=UDim2.new(1,-130,1,0),
    Position=UDim2.new(0,32,0,0),Text=disp,
    TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=12,
    TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,
},row)
            reg(nameLbl,"TextColor3",curThem.Tx,true)

            nameLbl.Activated:Connect(function()
    Settings.musicIndex = i
    S.shuffleHistory = {[i] = true}
    R.applyMusic()
    R.playMusic()
    R.mBtnPlayPause.Text = "⏸ Pause"
    saveSettings()
    R.refreshMusicList()
    local label = t.id or "?"
    if t.name and t.name ~= "" and t.name ~= t.id then label = t.name end
    notify("▶ Playing: "..label,"success")
    if _G.addSysLog then pcall(_G.addSysLog,"Track selected: "..label,"MUSIC") end
end)

            local favBtn = create("TextButton",{
                Size=UDim2.fromOffset(30,30),Position=UDim2.new(1,-102,0,6),
                BackgroundColor3=t.fav and curThem.Wa or curThem.Sa,
                BorderSizePixel=0,Text=t.fav and "★" or "☆",
                TextColor3=t.fav and curThem.Tx or curThem.Mu,
                Font=Enum.Font.GothamBold,TextSize=16,AutoButtonColor=false,
            },row)
corner(favBtn,8); mkStroke(favBtn,curThem.Ac,1.2,0.2)
-- Tinanggal yung reg() para hindi mag-pulse/pumula nang sabay-sabay

            favBtn.Activated:Connect(function()
    t.fav = not t.fav
    favBtn.Text = t.fav and "★" or "☆"
    favBtn.BackgroundColor3 = t.fav and curThem.Wa or curThem.Sa
    favBtn.TextColor3 = t.fav and curThem.Tx or curThem.Mu
    saveSettings()
    if _G.addSysLog then
        pcall(_G.addSysLog,(t.fav and "★ Favorited: " or "☆ Unfavorited: ")..(t.id or "?"),"MUSIC")
    end
end)

            local delBtn = create("TextButton",{
                Size=UDim2.fromOffset(30,30),Position=UDim2.new(1,-66,0,6),
                BackgroundColor3=curThem.Da,BorderSizePixel=0,Text="×",
                TextColor3=curThem.Tx,Font=Enum.Font.GothamBold,TextSize=18,AutoButtonColor=false,
            },row)
corner(delBtn,8); mkStroke(delBtn,curThem.Ac,1.2,0.2)
-- Tinanggal yung reg() para hindi mag-pulse/pumula nang sabay-sabay

            delBtn.Activated:Connect(function()
    -- Confirmation popup
    local confirm = create("Frame",{
        Size=UDim2.new(0,260,0,120),
        Position=UDim2.fromScale(0.5,0.5),
        AnchorPoint=Vector2.new(0.5,0.5),
        BackgroundColor3=curThem.Su,
        BorderSizePixel=0,ZIndex=500,
    },SG)
    corner(confirm,12); chromaStroke(confirm)
    reg(confirm,"BackgroundColor3",curThem.Su,false)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-20,0,28),
        Position=UDim2.new(0,10,0,14),
        Text="Delete \""..(t.name or t.id).."\"?",
        TextColor3=curThem.Tx,Font=Enum.Font.GothamBold,
        TextSize=14,TextWrapped=true,ZIndex=501,
    },confirm)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-20,0,20),
        Position=UDim2.new(0,10,0,44),
        Text="YOU CANNOT UNDO THIS!",
        TextColor3=curThem.Mu,Font=Enum.Font.Gotham,
        TextSize=11,ZIndex=501,
    },confirm)

    local yesBtn = pBtn(confirm,"Delete",UDim2.new(0.45,0,0,34),UDim2.new(0.03,0,0,76),function()
        table.remove(Settings.musicTracks, i)
        if Settings.musicIndex > #Settings.musicTracks then
            Settings.musicIndex = math.max(1, #Settings.musicTracks)
        end
        saveSettings()
        R.refreshMusicList()
        notify("Removed","info")
        confirm:Destroy()
    end)
    yesBtn.ZIndex = 501

    local noBtn = pBtn(confirm,"Cancel",UDim2.new(0.45,0,0,34),UDim2.new(0.52,0,0,76),function()
        confirm:Destroy()
    end)
    noBtn.ZIndex = 501
 end)
   end
 end
 
    R.refreshMusicList()

    -- ═══ Progress updater ═══
    task.spawn(function()
        while getgenv().YinetsuUIActive and SG.Parent do
            if R.musicSound and R.musicNowTitle then
                local t = Settings.musicTracks[Settings.musicIndex]
                if t then
                    R.musicNowTitle.Text = t.name or t.id
                else
                    R.musicNowTitle.Text = "— No track —"
                end

                if R.musicSound.TimeLength > 0 then
                    local pos = R.musicSound.TimePosition
                    local dur = R.musicSound.TimeLength
                    R.musicProgFill.Size = UDim2.new(pos/dur, 0, 1, 0)
                    local function fmt(s)
                        s = math.max(0, math.floor(s))
                        return string.format("%d:%02d", math.floor(s/60), s%60)
                    end
                    R.musicTimeLbl.Text = fmt(pos).." / "..fmt(dur)
                end

if R.mBtnPlayPause and R.mBtnPlayPause.Parent then
    if R.musicSound.IsPlaying then
        R.mBtnPlayPause.Text = "⏸ Pause"
    elseif R.musicSound.IsPaused then
        R.mBtnPlayPause.Text = "▶ Play"
    else
        R.mBtnPlayPause.Text = "▶ Play"
    end
end
            end
            task.wait(0.2)
        end
    end)
end

--==============================================================
-- SOCIAL TAB
--==============================================================
do
    local sp = panel(P.Social,"SocialPanel",UDim2.new(1,-6,0,440),UDim2.new())
    padding(sp,18,18,16,16)
    label(sp,"SOCIAL LINKS",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)
    label(sp,"Follow and connect with us!",UDim2.new(1,0,0,20),UDim2.new(0,0,0,30),11,curThem.Mu)

    local YOUTUBE_URL = "https://youtube.com/@yinetsu?si=9QWyONQPsv9pMbsk"
    local DISCORD_URL = "https://discord.gg/KmqttW8uR"

    local function openLink(url, name)
        -- Confirmation popup
        local popup = create("Frame",{
            Size=UDim2.new(0,300,0,160),
            Position=UDim2.fromScale(0.5,0.5),
            AnchorPoint=Vector2.new(0.5,0.5),
            BackgroundColor3=curThem.Su,
            BorderSizePixel=0,ZIndex=500,
        },SG)
        corner(popup,14); chromaStroke(popup)
        reg(popup,"BackgroundColor3",curThem.Su,false)

        create("TextLabel",{
            BackgroundTransparency=1,
            Size=UDim2.new(1,-20,0,26),
            Position=UDim2.new(0,10,0,16),
            Text="Copy "..name.." link?",
            TextColor3=curThem.Aa,Font=Enum.Font.GothamBold,
            TextSize=16,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=501,
        },popup)

        create("TextLabel",{
            BackgroundTransparency=1,
            Size=UDim2.new(1,-20,0,40),
            Position=UDim2.new(0,10,0,48),
            Text="The link will be copied to your clipboard.\nPaste it in your browser to open.",
            TextColor3=curThem.Mu,Font=Enum.Font.Gotham,
            TextSize=11,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,
            TextYAlignment=Enum.TextYAlignment.Top,ZIndex=501,
        },popup)

        local yesBtn = pBtn(popup,"Yes, Copy",UDim2.new(0.45,0,0,38),UDim2.new(0.03,0,0,98),function()
            popup:Destroy()
            pcall(function() setclipboard(url) end)
            notify("📋 "..name.." link copied!","success")
            if _G.addSysLog then pcall(_G.addSysLog,"Copied "..name.." link","SOCIAL") end
        end)
        yesBtn.ZIndex = 501

        local noBtn = pBtn(popup,"Cancel",UDim2.new(0.45,0,0,38),UDim2.new(0.52,0,0,98),function()
            popup:Destroy()
        end)
        noBtn.ZIndex = 501
    end

    -- ═══ YOUTUBE BUTTON ═══
    local ytBtn = create("TextButton",{
        Size=UDim2.new(1,0,0,84),Position=UDim2.new(0,0,0,64),
        BackgroundColor3=curThem.Sa,BorderSizePixel=0,
        Text="",AutoButtonColor=false,
    },sp)
    corner(ytBtn,12); mkStroke(ytBtn,curThem.Ac,1.5,0.15)
    reg(ytBtn,"BackgroundColor3",curThem.Sa,false)

create("ImageLabel",{
    Size=UDim2.fromOffset(56,56),Position=UDim2.new(0,14,0.5,-28),
    BackgroundTransparency=1,
    Image="rbxthumb://type=Asset&id=78360918752775&w=150&h=150",
    ScaleType=Enum.ScaleType.Fit,
},ytBtn)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-90,0,26),
        Position=UDim2.new(0,82,0,18),
        Text="YouTube",
        TextColor3=curThem.Tx,Font=Enum.Font.GothamBold,
        TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
    },ytBtn)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-90,0,20),
        Position=UDim2.new(0,82,0,44),
        Text="@yinetsu — Subscribe!",
        TextColor3=curThem.Mu,Font=Enum.Font.Gotham,
        TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
    },ytBtn)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.fromOffset(30,30),
        Position=UDim2.new(1,-40,0.5,-15),
        Text="↗",
        TextColor3=curThem.Aa,Font=Enum.Font.GothamBold,
        TextSize=20,TextXAlignment=Enum.TextXAlignment.Center,
    },ytBtn)

    track(ytBtn.Activated:Connect(function()
        openLink(YOUTUBE_URL, "YouTube")
    end))

    -- ═══ DISCORD BUTTON ═══
    local dcBtn = create("TextButton",{
        Size=UDim2.new(1,0,0,84),Position=UDim2.new(0,0,0,160),
        BackgroundColor3=curThem.Sa,BorderSizePixel=0,
        Text="",AutoButtonColor=false,
    },sp)
    corner(dcBtn,12); mkStroke(dcBtn,curThem.Ac,1.5,0.15)
    reg(dcBtn,"BackgroundColor3",curThem.Sa,false)

create("ImageLabel",{
    Size=UDim2.fromOffset(56,56),Position=UDim2.new(0,14,0.5,-28),
    BackgroundTransparency=1,
    Image="rbxthumb://type=Asset&id=8248378219&w=150&h=150",
    ScaleType=Enum.ScaleType.Fit,
},dcBtn)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-90,0,26),
        Position=UDim2.new(0,82,0,18),
        Text="Discord",
        TextColor3=curThem.Tx,Font=Enum.Font.GothamBold,
        TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
    },dcBtn)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.new(1,-90,0,20),
        Position=UDim2.new(0,82,0,44),
        Text="Join our community!",
        TextColor3=curThem.Mu,Font=Enum.Font.Gotham,
        TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
    },dcBtn)

    create("TextLabel",{
        BackgroundTransparency=1,
        Size=UDim2.fromOffset(30,30),
        Position=UDim2.new(1,-40,0.5,-15),
        Text="↗",
        TextColor3=curThem.Aa,Font=Enum.Font.GothamBold,
        TextSize=20,TextXAlignment=Enum.TextXAlignment.Center,
    },dcBtn)

    track(dcBtn.Activated:Connect(function()
        openLink(DISCORD_URL, "Discord")
    end))

    -- ═══ COPY ALL ═══
    pBtn(sp,"📋 Copy All Links",UDim2.new(1,0,0,48),UDim2.new(0,0,0,262),function()
        setclipboard("YouTube: "..YOUTUBE_URL.."\nDiscord: "..DISCORD_URL)
        notify("📋 All links copied!","success")
        if _G.addSysLog then pcall(_G.addSysLog,"Copied all social links","SOCIAL") end
    end)

    -- ═══ ABOUT ═══
    local infoP = panel(P.Social,"InfoPanel",UDim2.new(1,-6,0,130),UDim2.new())
    padding(infoP,18,18,14,14)
    label(infoP,"ABOUT",UDim2.new(1,0,0,22),UDim2.new(),13,curThem.Aa)
    label(infoP,"Yinetsu [Remote Spy]",UDim2.new(1,0,0,22),UDim2.new(0,0,0,30),13,curThem.Tx).Font=Enum.Font.GothamBold
    label(infoP,"Thanks for using! Follow for updates.",UDim2.new(1,0,0,20),UDim2.new(0,0,0,56),11,curThem.Mu)
    label(infoP,"Made with ❤️ by Yinetsu",UDim2.new(1,0,0,20),UDim2.new(0,0,0,80),11,curThem.Aa)
end

--==============================================================
-- PERFORMANCE
--==============================================================
do
    local Pp = panel(P.Perf,"PerfPanel",UDim2.new(1,-6,0,340),UDim2.new())
    padding(Pp,18,18,16,16)
    label(Pp,"LIVE PERFORMANCE",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)

    local function metric(parent,t,y)
        label(parent,t,UDim2.new(0.57,0,0,34),UDim2.new(0,0,0,y),13,curThem.Mu)
        local v = label(parent,"--",UDim2.new(0.43,0,0,34),UDim2.new(0.57,0,0,y),14,curThem.Tx)
        v.Font = Enum.Font.GothamSemibold
        return v
    end

    R.FPS = metric(Pp,"Frame rate",46)
    R.Ping = metric(Pp,"Ping",84)
    R.Mem = metric(Pp,"Lua memory",122)
    R.Clock = metric(Pp,"Session clock",160)
    R.Rems = metric(Pp,"Logged remotes",198)
    R.Place = metric(Pp,"Place ID",236)
    R.Players = metric(Pp,"Players",274)
end

--==============================================================
-- SETTINGS
--==============================================================
do
    local StP = panel(P.Settings,"SettingsPanel",UDim2.new(1,-6,0,320),UDim2.new())
    padding(StP,18,18,16,16)
    label(StP,"GUI SETTINGS",UDim2.new(1,0,0,24),UDim2.new(),14,curThem.Aa)

    label(StP,"GUI Scale (0.7 – 1.5)",UDim2.new(1,0,0,22),UDim2.new(0,0,0,42),12,curThem.Mu)
    R.gsBox = create("TextBox",{Size=UDim2.new(0.32,0,0,44),Position=UDim2.new(0,0,0,68),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text=tostring(Settings.guiScale),TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=13,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},StP)
    corner(R.gsBox,10); padding(R.gsBox,12,12,0,0); mkStroke(R.gsBox,curThem.Ac,1.5,0.15); reg(R.gsBox,"BackgroundColor3",curThem.Sa,false)
    R.gsBox:GetPropertyChangedSignal("Text"):Connect(function()
    local v = tonumber(R.gsBox.Text)
    if v then
        v = math.clamp(v,0.7,1.5); Settings.guiScale = v
        if MainSC then MainSC.Scale = v end
        saveSettings()
    end
end)
R.gsBox.FocusLost:Connect(function()
    if _G.addSysLog then pcall(_G.addSysLog,"GUI Scale: "..tostring(Settings.guiScale),"SETTINGS") end
end)

    R.animTog = pBtn(StP,Settings.animateColors and "Color Animation: ON" or "Color Animation: OFF",UDim2.new(0.32,0,0,44),UDim2.new(0,0,0,124),function()
        Settings.animateColors = not Settings.animateColors
        R.animTog.Text = Settings.animateColors and "Color Animation: ON" or "Color Animation: OFF"
        saveSettings(); notify("Animation: "..(Settings.animateColors and "ON" or "OFF"),"info")
    end)

    label(StP,"Animation Speed",UDim2.new(1,0,0,22),UDim2.new(0,0,0,180),12,curThem.Mu)
    R.spdBox = create("TextBox",{Size=UDim2.new(0.32,0,0,44),Position=UDim2.new(0,0,0,206),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text=tostring(Settings.animationSpeed),TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=13,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},StP)
    corner(R.spdBox,10); padding(R.spdBox,12,12,0,0); mkStroke(R.spdBox,curThem.Ac,1.5,0.15); reg(R.spdBox,"BackgroundColor3",curThem.Sa,false)
    R.spdBox:GetPropertyChangedSignal("Text"):Connect(function()
    local v = tonumber(R.spdBox.Text)
    if v then Settings.animationSpeed = math.clamp(v,0.05,3); saveSettings() end
end)
R.spdBox.FocusLost:Connect(function()
    if _G.addSysLog then pcall(_G.addSysLog,"Anim Speed: "..tostring(Settings.animationSpeed),"SETTINGS") end
end)

    label(StP,"Intensity",UDim2.new(1,0,0,22),UDim2.new(0.36,0,0,180),12,curThem.Mu)
    R.intBox = create("TextBox",{Size=UDim2.new(0.32,0,0,44),Position=UDim2.new(0.34,0,0,206),BackgroundColor3=curThem.Sa,BorderSizePixel=0,Text=tostring(Settings.animationIntensity),TextColor3=curThem.Tx,Font=Enum.Font.Gotham,TextSize=13,ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},StP)
    corner(R.intBox,10); padding(R.intBox,12,12,0,0); mkStroke(R.intBox,curThem.Ac,1.5,0.15); reg(R.intBox,"BackgroundColor3",curThem.Sa,false)
    R.intBox:GetPropertyChangedSignal("Text"):Connect(function()
    local v = tonumber(R.intBox.Text)
    if v then Settings.animationIntensity = math.clamp(v,0.005,0.4); saveSettings() end
end)
R.intBox.FocusLost:Connect(function()
    if _G.addSysLog then pcall(_G.addSysLog,"Intensity: "..tostring(Settings.animationIntensity),"SETTINGS") end
end)
    
    -- ========= SYSTEM LOG PANEL =========
    local Dp = panel(P.Settings,"LogPanel",UDim2.new(1,-6,0,400),UDim2.new())
    padding(Dp,14,14,12,12)
    label(Dp,"SYSTEM LOG",UDim2.new(1,0,0,24),UDim2.new(),13,curThem.Aa)

    R.DiagSearch = create("TextBox",{Size=UDim2.new(1,0,0,40),Position=UDim2.new(0,0,0,34),BackgroundColor3=curThem.Sa,BorderSizePixel=0,PlaceholderText="Search diagnostics...",PlaceholderColor3=curThem.Mu,Text="",TextColor3=curThem.Tx,ClearTextOnFocus=false,Font=Enum.Font.Gotham,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left},Dp)
    corner(R.DiagSearch,10); padding(R.DiagSearch,12,12,0,0); mkStroke(R.DiagSearch,curThem.Ac,1.5,0.15); reg(R.DiagSearch,"BackgroundColor3",curThem.Sa,false)

    R.LogScroll = create("ScrollingFrame",{Size=UDim2.new(1,0,1,-94),Position=UDim2.new(0,0,0,84),BackgroundColor3=curThem.Bg,BorderSizePixel=0,ScrollBarThickness=5,ScrollBarImageColor3=curThem.Ac,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y},Dp)
    corner(R.LogScroll,10); padding(R.LogScroll,10,10,10,10); mkStroke(R.LogScroll,curThem.Aa,1.5,0.15); reg(R.LogScroll,"BackgroundColor3",curThem.Bg,false)

    R.LogView = create("TextLabel",{Size=UDim2.new(1,-4,0,0),BackgroundTransparency=1,Text="",TextColor3=curThem.Tx,Font=Enum.Font.Code,TextSize=11,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,AutomaticSize=Enum.AutomaticSize.Y},R.LogScroll)
    reg(R.LogView,"TextColor3",curThem.Tx,true)

    local function refLog()
        local q = string.lower(R.DiagSearch.Text or "")
        local ln = {}
        for _,e in ipairs(S.sysLog) do
            local l = string.format("[%s] [%s] %s",e.Time,e.Cat,e.Msg)
            if q=="" or string.find(string.lower(l),q,1,true) then table.insert(ln,l) end
        end
        R.LogView.Text = table.concat(ln,"\n")
    end

    R.DiagSearch:GetPropertyChangedSignal("Text"):Connect(refLog)
_G.__refSysLog = refLog

    pBtn(P.Settings,"UNLOAD YINETSU",UDim2.new(1,-6,0,54),UDim2.new(),function()
Settings.animateColors = false
getgenv().YinetsuUIActive = false
if R.stopMusic then pcall(R.stopMusic) end
if R.musicSound and R.musicSound.Parent then R.musicSound:Destroy() end
    if S.flyConn then S.flyConn:Disconnect() S.flyConn = nil end
    if S.noclipConn then S.noclipConn:Disconnect() S.noclipConn = nil end
    local c = LP.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if hrp then
            local a = hrp:FindFirstChild("YinetsuFly"); if a then a:Destroy() end
            local b = hrp:FindFirstChild("YinetsuFlyGyro"); if b then b:Destroy() end
            local d = hrp:FindFirstChild("YinetsuAntiFling"); if d then d:Destroy() end
        end
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.PlatformStand = false end
    end
    if S.fpsBoost and R.setFPSBoost then R.setFPSBoost(false) end
    for _,conn in ipairs(C) do
        pcall(function() conn:Disconnect() end)
    end
    if FUI then FUI:Destroy() end
    if SG then SG:Destroy() end
    end)
end

--==============================================================
-- REMOTE LOG
--==============================================================
do
    local function nameCol(n)
        local l = n:lower()
        if l:match("ban") or l:match("kick") or l:match("detect") or l:match("admin") then
            return Color3.fromRGB(255,80,100)
        end
        local h = 0
        for i=1,#n do h = string.byte(n,i) + (h*31) end
        return Color3.fromHSV((math.abs(h)%100)/100,0.55,0.85)
    end

    R.addLog = function(remote, args, isLoaded)
        if not getgenv().YinetsuUIActive then return end
        if not R.RemScroll or not R.RemScroll.Parent then return end
        if S.blk[remote] or S.blkName[remote.Name] then return end
        if S.rec then
            table.insert(S.recSeq,{remote=remote,args=args})
            if #S.recSeq > 100 then table.remove(S.recSeq,1) end
            if R.recInfo and R.recInfo.Parent then R.recInfo.Text = #S.recSeq.." actions" end
        end
        if S.snip then
            for _,v in pairs(R.RemScroll:GetChildren()) do
                if v:IsA("TextButton") then v:Destroy() end
            end
            S.logs={}; S.queue={}; S.snip = false; R.bSniper.Text = "Sniper"
        end
        if S.spamBlock then
            S.spamCount[remote] = (S.spamCount[remote] or 0) + 1
            if S.spamCount[remote] > 20 then S.blkName[remote.Name] = true; return end
            task.delay(1,function() S.spamCount[remote]=0 end)
        end

        while #S.queue >= S.MAX do
            local o = table.remove(S.queue,1)
            local e = S.logs[o]
            if e and e.btn and e.btn.Parent then e.btn:Destroy() end
            S.logs[o] = nil
        end

        local argStr = v2s(args)
        local key = remote.Name.."|"..argStr
        local genCode = string.format("local args = %s\ngame:GetService(\"ReplicatedStorage\").%s:%s(unpack(args))",argStr,remote.Name,(remote.ClassName=="RemoteEvent" and "FireServer" or "InvokeServer"))

        if S.logs[key] then
            local e = S.logs[key]; e.count = e.count + 1
            if e.btn and e.btn.Parent then
                e.btn.Text = " "..remote.Name.." (x"..e.count..")"
                e.btn.LayoutOrder = S.layoutN
            end
            S.layoutN = S.layoutN - 1
            return
        end

        local b = create("TextButton",{
            Name=remote.Name,LayoutOrder=S.layoutN,Size=UDim2.new(1,-4,0,34),
            Text=" "..remote.Name..(isLoaded and " [LOADED]" or ""),
            BackgroundColor3=nameCol(remote.Name),TextColor3=Color3.new(1,1,1),
            Font=Enum.Font.Gotham,TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,
            AutoButtonColor=false,
        },R.RemScroll)
        corner(b,8); S.layoutN = S.layoutN - 1

        local origCol = b.BackgroundColor3
        S.logs[key] = {btn=b,count=1,origCol=origCol,code=genCode,remote=remote,args=args}
        table.insert(S.queue,key)
        pcall(function() R.RemCount.Text = tostring(#S.queue).." remotes" end)

        b.MouseButton1Click:Connect(function()
            if S.multiMode then
                local idx
                for i,v in ipairs(S.multi) do if v.key==key then idx=i break end end
                if idx then table.remove(S.multi,idx); b.BackgroundColor3 = origCol
                else
                    table.insert(S.multi,{remote=remote,args=args,key=key})
                    b.BackgroundColor3 = curThem.Sc
                end
            else
                S.selR = remote; S.selA = args
                R.CodeView.Text = genCode
                if R.EdBox and R.EdBox.Parent then R.EdBox.Text = beautify(args) end
                if R.spamTgt and R.spamTgt.Parent then R.spamTgt.Text = remote.Name end
            end
        end)
    end
    _G.__yinetsu_addLog = R.addLog

    R.SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
        local s = R.SearchBar.Text:lower()
        for _,e in pairs(S.logs) do
            if e.btn and e.btn.Parent then
                e.btn.Visible = (s=="" or string.find(e.btn.Name:lower(),s,1,true))
            end
        end
    end)

    R.bClear.Activated:Connect(function()
        for _,v in pairs(R.RemScroll:GetChildren()) do
            if v:IsA("TextButton") then v:Destroy() end
        end
        S.logs={}; S.queue={}; S.layoutN=999999999
        R.RemCount.Text = "0 remotes"; notify("Cleared","success")
    end)

    R.bSniper.Activated:Connect(function()
        S.snip = not S.snip
        R.bSniper.Text = S.snip and "Sniper: ON" or "Sniper"
        if S.snip then
            for _,v in pairs(R.RemScroll:GetChildren()) do
                if v:IsA("TextButton") then v:Destroy() end
            end
            S.logs={}; S.queue={}
        end
    end)

    R.bScanAll.Activated:Connect(function()
        local filter = R.SearchBar.Text:lower()
        local cnt = 0; local scanned = {}
        local function scan(inst)
            for _,v in pairs(inst:GetDescendants()) do
                if (v:IsA("RemoteEvent") or v:IsA("RemoteFunction")) and not scanned[v] then
                    scanned[v] = true
                    if filter=="" or v.Name:lower():find(filter,1,true) then
                        R.addLog(v,{"[AUTO SCAN]"},true); cnt = cnt + 1
                    end
                end
            end
        end
        scan(RStorage); scan(workspace); scan(PL)
        notify("Scanned "..cnt,"success")
    end)

    R.bCopyAll.Activated:Connect(function()
        local a = {}
        for k,_ in pairs(S.logs) do table.insert(a,k) end
        setclipboard(table.concat(a,"\n"))
        notify("Copied "..#a,"success")
    end)
end

--==============================================================
-- HOOK + INIT
--==============================================================
do
    pcall(function()
        S.hook = hookmetamethod(game,"__namecall",function(self, ...)
            local m = getnamecallmethod()
            if getgenv().YinetsuExecuted and not checkcaller() and (m=="FireServer" or m=="InvokeServer") then
                if S.blk[self] or S.blkName[self.Name] then
                    if m=="InvokeServer" then return coroutine.yield() end
                    return nil
                end
                local n = self.Name:lower()
                if n=="update" or n=="motion" or n=="idle" or n=="move" or n=="mousemove" then return nil end
                local args = {...}
                local mod = false
                if S.modOn or S.negOn or S.mulOn then
                    local ts = (S.cT ~= "")
                    for i,v in ipairs(args) do
                        local vt = type(v)
                        if S.modOn and ts and tostring(v)==S.cT then
                            if vt=="number" then
                                local n2 = tonumber(S.cR); if n2 then args[i]=n2; mod=true end
                            elseif vt=="boolean" then
                                if S.cR:lower()=="true" then args[i]=true; mod=true
                                elseif S.cR:lower()=="false" then args[i]=false; mod=true end
                            else args[i]=S.cR; mod=true end
                        end
                        if type(args[i])=="number" then
                            if S.negOn and args[i]>0 then args[i]=-math.abs(args[i]); mod=true end
                            if S.mulOn then args[i]=args[i]*999999; mod=true end
                        end
                    end
                end
                table.insert(S.sched,{remote=self,args=args})
                if mod then return S.hook(self,unpack(args)) end
            end
            return S.hook(self, ...)
        end)
    end)

    track(RS.Heartbeat:Connect(function()
        while #S.sched>0 do
            local d = table.remove(S.sched,1)
            pcall(function() _G.__yinetsu_addLog(d.remote,d.args,false) end)
        end
    end))

    -- Character events
    local function onChar(char)
        char:WaitForChild("Humanoid",5)
        if S.rejoinDeath then
            local h = char:FindFirstChildOfClass("Humanoid")
            if h then
                h.Died:Connect(function()
                    if S.rejoinDeath then
                        task.wait(1)
                        pcall(function() TPS:Teleport(game.PlaceId,LP) end)
                    end
                end)
            end
        end
    end
    if LP.Character then onChar(LP.Character) end
    LP.CharacterAdded:Connect(onChar)

    -- APPLY THEME (no auto-save — saveSettings ONLY on explicit Save button)
    local function applyTheme(name, silent)
        local t = Themes[name]; if not t then return end
        curName = name; curThem = t
        -- NOTE: does NOT call saveSettings. Silent param kept for compatibility.

        local ti = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        for _,it in ipairs(A) do
            if it.inst and it.inst.Parent then
                local tg = it.base
                if it.prop == "BackgroundColor3" then
                    if it.inst == Main or it.inst.Name=="LogScroll" or it.inst.Name=="CodeContainer" or it.inst.Name=="RemScroll" or it.inst==LF or it.inst.Name=="edH" then tg = t.Bg
                    elseif it.inst == Header or it.inst == Nav or it.inst == R.headerCover or (it.inst.Name and it.inst.Name:match("Panel$")) or it.inst==LC or it.inst==FileMenu or it.inst==CtxFrame then tg = t.Su
                    else tg = t.Sa end
                    it.base = tg
                    TS:Create(it.inst,ti,{[it.prop]=tg}):Play()
                elseif it.prop == "TextColor3" then
                    it.base = t.Tx
                    TS:Create(it.inst,ti,{[it.prop]=t.Tx}):Play()
                elseif it.prop == "Color" then
                    it.base = t.Ac
                    TS:Create(it.inst,ti,{[it.prop]=t.Ac}):Play()
                end
            end
        end

        for _,it in ipairs(R.chStrokes) do
            if it.Stroke and it.Stroke.Parent then
                it.Stroke.Color = t.Ac
                if it.Gradient then
                    it.Gradient.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0,t.Ac),
                        ColorSequenceKeypoint.new(0.5,t.Aa),
                        ColorSequenceKeypoint.new(1,t.Ac),
                    })
                end
            end
        end

        TS:Create(TB,ti,{BackgroundColor3=t.Bg}):Play()
        TS:Create(TB,ti,{TextColor3=t.Tx}):Play()
        TS:Create(TBS,ti,{Color=t.Ac}):Play()

        if R.ThemeStat then R.ThemeStat.Text = "Current: "..name end
    end
    _G.__yinetsu_applyTheme = applyTheme

    for i,n in ipairs(themeOrder) do
        local b = pBtn(R.ThemeGrid,n,UDim2.new(),UDim2.new(),function()
            applyTheme(n); notify("Theme: "..n,"success")
        end)
        b.LayoutOrder = i
    end

    -- Animation + FPS
    track(RS.RenderStepped:Connect(function(dt)
        S.cnt = S.cnt + 1
        local now = os.clock()
        if now - S.lastFPS >= 1 then
            S.fps = S.cnt / (now - S.lastFPS); S.cnt = 0; S.lastFPS = now
        end

        for _,it in ipairs(R.chStrokes) do
            if it.Gradient and it.Gradient.Parent then
                it.Gradient.Rotation = (it.Gradient.Rotation + 0.8) % 360
            end
        end

        if Settings.animateColors then
            S.hue = (S.hue + dt * Settings.animationSpeed) % 1
            for _,it in ipairs(A) do
                if it.anim and it.inst and it.inst.Parent then
                    pcall(function()
                        local h,s,v = Color3.toHSV(it.base)
                        local sh = math.sin(S.hue * math.pi * 2) * Settings.animationIntensity
                        it.inst[it.prop] = Color3.fromHSV((h+sh)%1,s,v)
                    end)
                end
            end
        end
    end))

    -- Monitor
    local function readPing()
        local ok, r = pcall(function()
            local n = ST:FindFirstChild("Network"); if not n then return nil end
            local ss = n:FindFirstChild("ServerStatsItem"); if not ss then return nil end
            local p = ss:FindFirstChild("Data Ping"); if p then return p:GetValueString() end
        end)
        return (ok and r) and tostring(r) or "N/A"
    end

    local function fmtT(s)
        s = math.max(0,math.floor(s))
        return string.format("%02d:%02d:%02d",math.floor(s/3600),math.floor((s%3600)/60),s%60)
    end

    task.spawn(function()
        while getgenv().YinetsuUIActive and SG.Parent do
            local el = os.clock() - S.start
            local mem = "N/A"
            local ok, r = pcall(function() return ST:GetTotalMemoryUsageMb() end)
            if ok and type(r)=="number" then mem = string.format("%.1f MB",r) end

            if R.FPS then
                R.FPS.Text = string.format("%.0f FPS",S.fps)
                R.Ping.Text = readPing(); R.Mem.Text = mem; R.Clock.Text = fmtT(el)
                R.Rems.Text = tostring(#S.queue); R.Place.Text = tostring(game.PlaceId)
                R.Players.Text = tostring(#PL:GetPlayers())
            end
            if R.HomeFPS then R.HomeFPS.Text = string.format("%.0f",S.fps) end
            if R.SessClock then R.SessClock.Text = "Session: "..fmtT(el) end
            task.wait(0.5)
        end
    end)

    -- Responsive
local function resp()
    local cam = workspace.CurrentCamera; if not cam then return end
    local vp = cam.ViewportSize
    local cmp = vp.X < 780
    
    local targetW = math.clamp(vp.X-30,cfg.MinW,cfg.W)
    local targetH = math.clamp(vp.Y-50,cfg.MinH,cfg.H)
    
    Nav.Size = UDim2.new(0,cmp and 130 or 180,1,-112)
    Cont.Position = UDim2.new(0,cmp and 156 or 208,0,98)
    Cont.Size = UDim2.new(1,cmp and -170 or -222,1,-112)
    
    S.expandedSize = UDim2.new(0, targetW, 0, targetH)
    
    -- ETO YUNG FIX: Hindi papakialaman ang size kung naka-hide.
    if not S.min then
        Main.Size = S.expandedSize
    end
end

    if workspace.CurrentCamera then track(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(resp)) end

    TB.Activated:Connect(function() Main.Visible = not Main.Visible end)

    task.spawn(function()
        while getgenv().YinetsuUIActive and task.wait(120) do
            pcall(function()
                VU:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                task.wait(0.2)
                VU:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end)

    track(SG.Destroying:Connect(function()
    getgenv().YinetsuUIActive = false
    if R.stopMusic then pcall(R.stopMusic) end
    if R.musicSound and R.musicSound.Parent then pcall(function() R.musicSound:Destroy() end) end
    if S.fpsBoost and R.setFPSBoost then pcall(function() R.setFPSBoost(false) end) end
        if S.flyConn then S.flyConn:Disconnect() end
        if S.noclipConn then S.noclipConn:Disconnect() end
        if S.autoClickConn then pcall(function() task.cancel(S.autoClickConn) end) end
        for _,c in ipairs(C) do pcall(function() c:Disconnect() end) end
    end))

_G.addSysLog("Yinetsu [Remote Spy] initialized.","SYSTEM")
_G.addSysLog("Player: "..LP.Name,"SYSTEM")
_G.addSysLog("Place ID: "..tostring(game.PlaceId),"SYSTEM")
    
    -- ============ MUSIC SYSTEM INIT (PLAYLIST VERSION) ============
R.musicSound = Instance.new("Sound", game:GetService("SoundService"))
R.musicSound.Name = "YinetsuMusic"
R.musicSound.Looped = false
R.musicSound.Volume = Settings.musicVolume or 0.5

local function getActiveList()
    local list = {}
    for i, t in ipairs(Settings.musicTracks or {}) do
        if not Settings.musicFavoritesOnly or t.fav then
            table.insert(list, i)
        end
    end
    if #list == 0 then
        for i = 1, #(Settings.musicTracks or {}) do table.insert(list, i) end
    end
    return list
end

S.suppressEnded = false

function R.applyMusic()
    if not R.musicSound then return end
    -- Cancel any pending un-suppress
    S.suppressEnded = true
    local t = Settings.musicTracks[Settings.musicIndex]
    if not t or not t.id or t.id == "" then
        S.suppressEnded = true
        R.musicSound:Stop()
        task.delay(0.2, function() S.suppressEnded = false end)
        S.musicPlaying = false
        return
    end
    S.suppressEnded = true
    R.musicSound:Stop()
    R.musicSound.TimePosition = 0
    local id = tostring(t.id)
    if not id:match("rbxassetid://") then id = "rbxassetid://" .. id end
    R.musicSound.SoundId = id
    R.musicSound.Volume = Settings.musicVolume or 0.5
    task.delay(0.2, function() S.suppressEnded = false end)
end

function R.playMusic()
    if not R.musicSound or not R.musicSound.SoundId or R.musicSound.SoundId == "" then
        notify("No music ID set","warn"); return
    end
    if R.musicSound.IsPaused then
        R.musicSound:Resume()
        if _G.addSysLog then pcall(_G.addSysLog,"Music resumed","MUSIC") end
    elseif not R.musicSound.IsPlaying then
        R.musicSound:Play()
        local t = Settings.musicTracks[Settings.musicIndex]
        if _G.addSysLog then pcall(_G.addSysLog,"▶ Playing: "..((t and t.id) or "?"),"MUSIC") end
    end
    S.musicPlaying = true
end

function R.pauseMusic()
    if R.musicSound and R.musicSound.IsPlaying then
        R.musicSound:Pause()
        S.musicPlaying = false
        if _G.addSysLog then pcall(_G.addSysLog,"⏸ Music paused","MUSIC") end
    end
end

function R.stopMusic()
    if R.musicSound then
        R.musicSound:Stop()
        S.musicPlaying = false
        if _G.addSysLog then pcall(_G.addSysLog,"⏹ Music stopped","MUSIC") end
    end
end

function R.nextTrack()
    local active = getActiveList()
    if #active == 0 then return end
    local curPos = 1
    for i, idx in ipairs(active) do if idx == Settings.musicIndex then curPos = i end end

    if Settings.musicShuffle and #active > 1 then
        if not S.shuffleHistory then S.shuffleHistory = {} end

        -- Mark current as played
        S.shuffleHistory[Settings.musicIndex] = true

        -- Build list of unplayed
        local unplayed = {}
        for _, idx in ipairs(active) do
            if not S.shuffleHistory[idx] then
                table.insert(unplayed, idx)
            end
        end

        -- If all played, reset but exclude current
        if #unplayed == 0 then
            S.shuffleHistory = {}
            for _, idx in ipairs(active) do
                if idx ~= Settings.musicIndex then
                    table.insert(unplayed, idx)
                end
            end
        end

        if #unplayed == 0 then return end
        Settings.musicIndex = unplayed[math.random(1, #unplayed)]
    else
        Settings.musicIndex = active[(curPos % #active) + 1]
    end

    R.applyMusic(); R.playMusic()
    if R.refreshMusicList then pcall(R.refreshMusicList) end
    saveSettings()
    local t = Settings.musicTracks[Settings.musicIndex]
    local label = "?"
    if t then
        if t.name and t.name ~= "" and t.name ~= t.id then label = t.name
        else label = t.id end
    end
    notify("⏭ Next: "..label,"info")
    if _G.addSysLog then pcall(_G.addSysLog,"⏭ Next track → "..label,"MUSIC") end
end

function R.prevTrack()
    local active = getActiveList()
    if #active == 0 then return end
    local curPos = 1
    for i, idx in ipairs(active) do if idx == Settings.musicIndex then curPos = i end end

    if Settings.musicShuffle and #active > 1 then
        local newPos
        repeat newPos = math.random(1, #active) until newPos ~= curPos
        Settings.musicIndex = active[newPos]
    else
        Settings.musicIndex = active[((curPos - 2) % #active) + 1]
    end

    R.applyMusic(); R.playMusic()
    if R.refreshMusicList then pcall(R.refreshMusicList) end
    saveSettings()
    local t = Settings.musicTracks[Settings.musicIndex]
    local label = "?"
    if t then
        if t.name and t.name ~= "" and t.name ~= t.id then label = t.name
        else label = t.id end
    end
    notify("⏮ Prev: "..label,"info")
    if _G.addSysLog then pcall(_G.addSysLog,"⏮ Prev track → "..label,"MUSIC") end
end

R.musicSound.Ended:Connect(function()
    if S.suppressEnded then return end
    if not S.musicPlaying or not getgenv().YinetsuUIActive then return end
    if Settings.musicRepeat == "one" then
        R.musicSound.TimePosition = 0
        R.musicSound:Play()
    elseif Settings.musicRepeat == "all" then
        task.defer(function() R.nextTrack() end)
    else
        S.musicPlaying = false
    end
end)

-- Auto-start on load
if #(Settings.musicTracks or {}) > 0 then
    if Settings.musicShuffle and #Settings.musicTracks > 1 then
        Settings.musicIndex = math.random(1, #Settings.musicTracks)
    end
    R.applyMusic()
    task.defer(function()
        task.wait(1.5)
        R.playMusic()
        S.musicPlaying = true
    end)
end
applyTheme(curName, true)
resp()

-- Force refresh the list AGAIN after shuffle assigns the index
if R.refreshMusicList then pcall(R.refreshMusicList) end

-- Extra safety to ensure the render loop starts correctly
task.delay(0.5, function()
    if R.refreshMusicList then pcall(R.refreshMusicList) end
end)

-- Show Overview page WITHOUT triggering highlight
for k,v in pairs(Pages) do v.Visible = (k=="Overview") end
for _,c in ipairs(NavS:GetChildren()) do
    if c:IsA("TextButton") then
        c.BackgroundColor3 = curThem.Bg
    end
end

-- Signal na tapos na i-load yung buong GUI. Mag-hihintay lang ng 0.3 seconds para mag-render yung 100%.
guiLoaded = true 
task.wait(0.3)

if LF and LF.Parent then
    TS:Create(LF,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()
    task.wait(0.3); LF:Destroy()
end

Main.Visible = true
TS:Create(MainSC,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale = Settings.guiScale}):Play()

task.wait(0.6)
notify("Yinetsu [Remote Spy] loaded","success")
    print("[YINETSU] Loaded.")

    -- AUTO-RUN SCRIPT KAPAG NAG-LOAD ANG YINETSU
    task.spawn(function()
        task.wait(2) 
        local rootGameId = tostring(game.GameId)
        local autoPath = "Yinetsu_Logs/"..rootGameId.."/AutoRun.lua"
        
        if isfile(autoPath) then
            local ok, content = pcall(readfile, autoPath)
            if ok and content and content ~= "" then
                local runOk, err = pcall(function() loadstring(content)() end)
                if runOk then
                    notify("⚡ Auto-Run Executed!", "success")
                    if _G.addSysLog then pcall(_G.addSysLog, "Startup AutoRun executed successfully.", "SYSTEM") end
                else
                    notify("❌ Auto-Run Failed", "error")
                    if _G.addSysLog then pcall(_G.addSysLog, "AutoRun Error: "..tostring(err), "ERROR") end
                end
            end
        end
    end)
end