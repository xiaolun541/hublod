local p=game:GetService("Players")
local l=p.LocalPlayer
local g=l:WaitForChild("PlayerGui")

-- 全局预定义密钥，远程脚本全局可读取，解决No key found
_G.script_key = "KM4WswDyf7"
-- 白名单用户名
local w={"xiaolun19","jhxdgu0","KM4WswDyf7"}

-- Base64解码函数不变
local function d(s)
    local c="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    s=s:gsub("[^"..c.."]","")
    local o,i="",1
    repeat
        local a,b,m,n=c:find(s:sub(i,i,i))-1,c:find(s:sub(i+1,i+1))-1,c:find(s:sub(i+2,i+2))-1,c:find(s:sub(i+3,i+3))-1
        o=o..string.char(bit32.lshift(a,2)+bit32.rshift(b,4))..(m~=64 and string.char(bit32.lshift(bit32.band(b,15),4)+bit32.rshift(m,2))or"")..(n~=64 and string.char(bit32.lshift(bit32.band(m,3),6)+n)or"")
        i=i+4
    until i>#s
    return o
end
local rawLink=d"aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0thcGNsYW50eWxlci93ZnIvcmVmcy9oZWFkcy9tYWluL3JhZGlhbnRodWI="

-- 验证弹窗UI完整构建
local ui=Instance.new("ScreenGui")
ui.Name="NameCheckAuth"
ui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
