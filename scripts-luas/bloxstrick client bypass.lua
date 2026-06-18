-- bloxstrike full client bypass, made by absolute_dev
-- i only tampered the ban table, i dont know if there will be any detections besides it
-- i will not update that for public after it will be patched

-- fixing your ac vulnerabilities, doing custom commisions or bypasses, discord: absolute_dev

local whitelist = {"Namecall Detected!"} -- Bad sanity check phrases)))

--local function is_sanity_check(value)

--end
local function tamper_table(ban_table, ban_index)
    local expected = ban_table[ban_index]
    table.insert(whitelist, expected);
    local sanity_value
    ban_table[ban_index] = nil
    
    setrawmetatable(ban_table, {
        __newindex = function(self, key, value)
            if key == ban_index then
                print("New Index Attempt:", value, typeof(value))
                                                
                if table.find(whitelist, value) or (value:match("[^%d]%d+") ~= nil and rawlen(value) == 4) then
                    sanity_value = value
                    print("Sanity Check Passed:", value)
                    if value == expected then
                        print("Sanity check is expected")
                    end
                else
                    print("Blocked:", value)
                end
                
                return
            end
            
            rawset(self, key, value)
        end,
        __index = function(self, key)
            print("Index Attempt:", key)
            
            if key == ban_index then
                if sanity_value then
                    print("Sanity Index Attempt")
                    local cache = sanity_value;
                    sanity_value = nil
                    return cache
                end
                return expected 
            end
        end
    })
    
    return true
end

local bypass = false;
local expected_index = 2;

for _, tbl in getgc(true) do
    if type(tbl) ~= "table" then
        continue
    end

    if getrawmetatable(tbl) then
        continue
    end
    
    local ban_table, ban_index
    for i, v in tbl do
        if type(v) == "number" and rawequal(v, expected_index) then
            ban_index = v;
        end

        if rawequal(v, tbl) then
            ban_table = v;
        end
    end

    local ban_string = rawget(tbl, ban_index);
    if ban_table and ban_index and ban_string and typeof(ban_string) == "string"
    and rawlen(ban_string) == 4 then
        local suc = tamper_table(ban_table, ban_index);
        if suc then
            bypass = true;
        end
    end
end

if not bypass then
    game:GetService("Players").LocalPlayer:Kick("fail")
end
--[[
local bypass2 = false;

local ingame_rs = game:GetService("ReplicatedStorage")
local old; old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod();
    local traceback = debug.traceback();

    if self == ingame_rs and method == "GetDescendants" and traceback:find("ReplicatedFirst") then
        return {}
    end

    if method == "FireServer" and self:IsA("BaseRemoteEvent") and traceback:find("ReplicatedFirst") then
        return
    end

    return old(self, ...);
end)

bypass2 = true;

if not bypass2 then
    game:GetService("Players").LocalPlayer:Kick("fail 2")
end]]
