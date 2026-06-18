--[[
    Gamesense
     
    -> Kind of got bored idk what to do with life
]]

if getgenv().Loaded then 
    getgenv().Library:Unload()
end 

getgenv().Loaded = true 

-- Variables 
    -- Services
    local InputService, HttpService, GuiService, RunService, Stats, CoreGui, TweenService, SoundService, Workspace, Players = game:GetService("UserInputService"), game:GetService("HttpService"), game:GetService("GuiService"), game:GetService("RunService"), game:GetService("Stats"), game:GetService("CoreGui"), game:GetService("TweenService"), game:GetService("SoundService"), game:GetService("Workspace"), game:GetService("Players")
    local Camera, lp, gui_offset = Workspace.CurrentCamera, Players.LocalPlayer, GuiService:GetGuiInset().Y
    local mouse = lp:GetMouse()

    -- Data types
    local vec2, vec3, dim2, dim, rect, dim_offset = Vector2.new, Vector3.new, UDim2.new, UDim.new, Rect.new, UDim2.fromOffset

    -- Extra data types
    local color, rgb, hex, hsv, rgbseq, rgbkey, numseq, numkey = Color3.new, Color3.fromRGB, Color3.fromHex, Color3.fromHSV, ColorSequence.new, ColorSequenceKeypoint.new, NumberSequence.new, NumberSequenceKeypoint.new
-- 

-- Library init
    getgenv().Library = {
        Directory = "gamesense",
        Folders = {
            "/fonts",
            "/configs",
        },
        Flags = {},
        ConfigFlags = {},
        Connections = {},   
        Notifications = {Notifs = {}},
        OpenElement = {}; -- type: table or userdata
        EasingStyle = Enum.EasingStyle.Quint;
        TweeningSpeed = 0.25
    }

    local themes = {
        preset = {
            inline = rgb(50, 50, 50);
            gradient = rgb(40, 40, 40);
            outline = rgb(20, 20, 20);
            accent = rgb(50, 119, 186);
            background = rgb(30, 30, 30);
            text_color = rgb(239, 239, 239);
            text_outline = rgb(0, 0, 0);
            tab_background = rgb(26, 26, 26);
        },
        utility = {},
        gradients = {
            Selected = {};
            Deselected = {};
        },
    }

    for theme,color in themes.preset do 
        themes.utility[theme] = {
            BackgroundColor3 = {}; 	
            TextColor3 = {};
            ImageColor3 = {};
            ScrollBarImageColor3 = {};
            Color = {};
        }
    end 

    local Keys = {
        [Enum.KeyCode.LeftShift] = "LS",
        [Enum.KeyCode.RightShift] = "RS",
        [Enum.KeyCode.LeftControl] = "LC",
        [Enum.KeyCode.RightControl] = "RC",
        [Enum.KeyCode.Insert] = "INS",
        [Enum.KeyCode.Backspace] = "BS",
        [Enum.KeyCode.Return] = "Ent",
        [Enum.KeyCode.LeftAlt] = "LA",
        [Enum.KeyCode.RightAlt] = "RA",
        [Enum.KeyCode.CapsLock] = "CAPS",
        [Enum.KeyCode.One] = "1",
        [Enum.KeyCode.Two] = "2",
        [Enum.KeyCode.Three] = "3",
        [Enum.KeyCode.Four] = "4",
        [Enum.KeyCode.Five] = "5",
        [Enum.KeyCode.Six] = "6",
        [Enum.KeyCode.Seven] = "7",
        [Enum.KeyCode.Eight] = "8",
        [Enum.KeyCode.Nine] = "9",
        [Enum.KeyCode.Zero] = "0",
        [Enum.KeyCode.KeypadOne] = "Num1",
        [Enum.KeyCode.KeypadTwo] = "Num2",
        [Enum.KeyCode.KeypadThree] = "Num3",
        [Enum.KeyCode.KeypadFour] = "Num4",
        [Enum.KeyCode.KeypadFive] = "Num5",
        [Enum.KeyCode.KeypadSix] = "Num6",
        [Enum.KeyCode.KeypadSeven] = "Num7",
        [Enum.KeyCode.KeypadEight] = "Num8",
        [Enum.KeyCode.KeypadNine] = "Num9",
        [Enum.KeyCode.KeypadZero] = "Num0",
        [Enum.KeyCode.Minus] = "-",
        [Enum.KeyCode.Equals] = "=",
        [Enum.KeyCode.Tilde] = "~",
        [Enum.KeyCode.LeftBracket] = "[",
        [Enum.KeyCode.RightBracket] = "]",
        [Enum.KeyCode.RightParenthesis] = ")",
        [Enum.KeyCode.LeftParenthesis] = "(",
        [Enum.KeyCode.Semicolon] = ",",
        [Enum.KeyCode.Quote] = "'",
        [Enum.KeyCode.BackSlash] = "\\",
        [Enum.KeyCode.Comma] = ",",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Slash] = "/",
        [Enum.KeyCode.Asterisk] = "*",
        [Enum.KeyCode.Plus] = "+",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Backquote] = "`",
        [Enum.UserInputType.MouseButton1] = "MB1",
        [Enum.UserInputType.MouseButton2] = "MB2",
        [Enum.UserInputType.MouseButton3] = "MB3",
        [Enum.KeyCode.Escape] = "ESC",
        [Enum.KeyCode.Space] = "SPC",
    }
        
    Library.__index = Library

    for _,path in Library.Folders do 
        makefolder(Library.Directory .. path)
    end

    local Flags = Library.Flags 
    local ConfigFlags = Library.ConfigFlags
    local Notifications = Library.Notifications 

    local Fonts = {}; do
        function RegisterFont(Name, Weight, Style, Asset)
            if not isfile(Asset.Id) then
                writefile(Asset.Id, Asset.Font)
            end

            if isfile(Name .. ".font") then
                delfile(Name .. ".font")
            end

            local Data = {
                name = Name,
                faces = {
                    {
                        name = "Normal",
                        weight = Weight,
                        style = Style,
                        assetId = getcustomasset(Asset.Id),
                    },
                },
            }

            writefile(Name .. ".font", HttpService:JSONEncode(Data))

            return getcustomasset(Name .. ".font");
        end
        
        local Verdana = RegisterFont("Verawdawdawdwaddana", 400, "Normal", {
            Id = "Verdanawdawdwada.ttf",
            Font = game:HttpGet("https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/fs-tahoma-8px.ttf"),
        })

        Library.Font = Font.new(Verdana, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
    end
--

-- Library functions 
    -- Misc functions
        function Library:GetTransparency(obj)
            if obj:IsA("Frame") then
                return {"BackgroundTransparency"}
            elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                return { "BackgroundTransparency", "ImageTransparency" }
            elseif obj:IsA("ScrollingFrame") then
                return { "BackgroundTransparency", "ScrollBarImageTransparency" }
            elseif obj:IsA("TextBox") then
                return { "TextTransparency", "BackgroundTransparency" }
            elseif obj:IsA("UIStroke") then 
                return { "Transparency" }
            end
        
            return nil
        end

        function Library:Tween(Object, Properties, Info)
            local tween = TweenService:Create(Object, Info or TweenInfo.new(Library.TweeningSpeed, Library.EasingStyle, Enum.EasingDirection.InOut, 0, false, 0), Properties)
            tween:Play()
            
            return tween
        end

        function Library:Fade(obj, prop, vis, speed)
            if not (obj and prop) then
                return
            end

            local OldTransparency = obj[prop]
            obj[prop] = vis and 1 or OldTransparency

            local Tween = Library:Tween(obj, { [prop] = vis and OldTransparency or 1 }, TweenInfo.new(speed or Library.TweeningSpeed, Library.EasingStyle, Enum.EasingDirection.InOut, 0, false, 0))

            Library:Connection(Tween.Completed, function()
                if not vis then
                    task.wait()
                    obj[prop] = OldTransparency
                end
            end)

            return Tween
        end

        function Library:Resizify(Parent)
            local Resizing = Library:Create("TextButton", {
                Position = dim2(1, -10, 1, -10);
                BorderColor3 = rgb(0, 0, 0);
                Size = dim2(0, 10, 0, 10);
                BorderSizePixel = 0;
                BackgroundColor3 = rgb(255, 255, 255);
                Parent = Parent;
                BackgroundTransparency = 1; 
                Text = ""
            })
        
            local IsResizing = false 
            local Size 
            local InputLost 
            local ParentSize = Parent.Size  
            
            Resizing.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    IsResizing = true
                    InputLost = input.Position
                    Size = Parent.Size
                end
            end)
        
            Resizing.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    IsResizing = false
                end
            end)
        
            Library:Connection(InputService.InputChanged, function(input, game_event) 
                if IsResizing and input.UserInputType == Enum.UserInputType.MouseMovement then            
                    Parent.Size = dim2(
                        Size.X.Scale,
                        math.clamp(Size.X.Offset + (input.Position.X - InputLost.X), ParentSize.X.Offset, Camera.ViewportSize.X), 
                        Size.Y.Scale, 
                        math.clamp(Size.Y.Offset + (input.Position.Y - InputLost.Y), ParentSize.Y.Offset, Camera.ViewportSize.Y)
                    )
                end
            end)
        end
        
        function Library:Hovering(Object)
            if type(Object) == "table" then 
                local Pass = false;

                for _,obj in Object do 
                    if Library:Hovering(obj) then 
                        Pass = true
                        return Pass
                    end 
                end 
            else 
                local y_cond = Object.AbsolutePosition.Y <= mouse.Y and mouse.Y <= Object.AbsolutePosition.Y + Object.AbsoluteSize.Y
                local x_cond = Object.AbsolutePosition.X <= mouse.X and mouse.X <= Object.AbsolutePosition.X + Object.AbsoluteSize.X
    
                return (y_cond and x_cond)
            end 
        end  

        function Library:Draggify(Parent)
            local Dragging = false 
            local IntialSize = Parent.Position
            local InitialPosition 

            Parent.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                    InitialPosition = Input.Position
                    InitialSize = Parent.Position
                end
            end)

            Parent.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)

            Library:Connection(InputService.InputChanged, function(Input, game_event) 
                if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
                    local Horizontal = Camera.ViewportSize.X
                    local Vertical = Camera.ViewportSize.Y

                    local NewPosition = dim2(
                        0,
                        math.clamp(
                            InitialSize.X.Offset + (Input.Position.X - InitialPosition.X),
                            0,
                            Horizontal - Parent.Size.X.Offset
                        ),
                        0,
                        math.clamp(
                            InitialSize.Y.Offset + (Input.Position.Y - InitialPosition.Y),
                            0,
                            Vertical - Parent.Size.Y.Offset
                        )
                    )

                    Parent.Position = NewPosition
                end
            end)
        end 

        function Library:Convert(str)
            local Values = {}

            for Value in string.gmatch(str, "[^,]+") do
                table.insert(Values, tonumber(Value))
            end

            if #Values == 4 then              
                return unpack(Values)
            else
                return
            end
        end
        
        function Library:Lerp(start, finish, t)
            t = t or 1 / 8

            return start * (1 - t) + finish * t
        end

        function Library:ConvertEnum(enum)
            local EnumParts = {}
            
            for part in string.gmatch(enum, "[%w_]+") do
                insert(EnumParts, part)
            end
        
            local EnumTable = Enum

            for i = 2, #EnumParts do
                local EnumItem = EnumTable[EnumParts[i]]
        
                EnumTable = EnumItem
            end
            
            return EnumTable
        end

        function Library:ConvertHex(color, alpha)
            local r = math.floor(color.R * 255)
            local g = math.floor(color.G * 255)
            local b = math.floor(color.B * 255)
            local a = alpha and math.floor(alpha * 255) or 255
            return string.format("#%02X%02X%02X%02X", r, g, b, a)
        end

        function Library:ConvertFromHex(color)
            color = color:gsub("#", "")
            local r = tonumber(color:sub(1, 2), 16) / 255
            local g = tonumber(color:sub(3, 4), 16) / 255
            local b = tonumber(color:sub(5, 6), 16) / 255
            local a = tonumber(color:sub(7, 8), 16) and tonumber(color:sub(7, 8), 16) / 255 or 1
            return Color3.new(r, g, b), a
        end

        local ConfigHolder;
        function Library:UpdateConfigList() 
            if not ConfigHolder then 
                print("no exist :(")
                return 
            end
            
            local List = {}
            
            for _,file in listfiles(Library.Directory .. "/configs") do
                local Name = file:gsub(Library.Directory .. "/configs\\", ""):gsub(".cfg", ""):gsub(Library.Directory .. "\\configs\\", "")
                List[#List + 1] = Name
            end

            for _,v in List do 
                print(_,v)
            end 

            ConfigHolder.RefreshOptions(List)
        end

        function Library:Keypicker(properties) 
            local Cfg = {
                Name = properties.Name or "Color", 
                Flag = properties.Flag or properties.Name or "Colorpicker",
                Callback = properties.Callback or function() end,

                Color = properties.Color or color(1, 1, 1), -- Default to white color if not provided
                Alpha = properties.Alpha or properties.Transparency or 0,
                
                Mode = properties.Mode or "Keypicker"; -- Animation

                -- Other
                Open = false, 
                Items = {};
            }

            local DraggingSat = false 
            local DraggingHue = false 
            local DraggingAlpha = false 

            local h, s, v = Cfg.Color:ToHSV() 
            local a = Cfg.Alpha 

            Flags[Cfg.Flag] = {Color = Cfg.Color, Transparency = Cfg.Alpha}
            
            local Items = Cfg.Items; do 
                -- Component
                    Items.ColorpickerObject = Library:Create( "TextButton" , {
                        Active = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        AutoButtonColor = false;
                        Name = "\0";
                        Parent = self.Items.Components;
                        Size = dim2(0, 17, 0, 9);
                        Selectable = false;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.InnerObject = Library:Create( "Frame" , {
                        Parent = Items.ColorpickerObject;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIGradient" , {
                        Rotation = 90;
                        Parent = Items.Inner;
                        Color = rgbseq{rgbkey(0, rgb(255, 255, 255)), rgbkey(1, rgb(208, 208, 208))}
                    });
                --
                
                -- Colorpicker
                    Items.Colorpicker = Library:Create( "TextButton" , {
                        Active = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        AutoButtonColor = false;
                        Parent = Library.Items;
                        Visible = false;
                        Name = "\0";
                        Position = dim2(0, 800, 0, 54);
                        Size = dim2(0, 180, 0, 175);
                        Selectable = false;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.Inline = Library:Create( "Frame" , {
                        Parent = Items.Colorpicker;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(35, 35, 35)
                    });
                    
                    Items._ = Library:Create( "UIPadding" , {
                        PaddingTop = dim(0, 3);
                        Name = "\0";
                        PaddingBottom = dim(0, 3);
                        Parent = Items.Inline;
                        PaddingRight = dim(0, 3);
                        PaddingLeft = dim(0, 3)
                    });
                    
                    Items.SatVal = Library:Create( "Frame" , {
                        Name = "\0";
                        Parent = Items.Inline;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -20, 1, -15);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.Inner = Library:Create( "Frame" , {
                        Parent = Items.SatVal;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 221, 255)
                    });
                    
                    Items.SatValPicker = Library:Create( "Frame" , {
                        Name = "\0";
                        Parent = Items.Inner;
                        AnchorPoint = vec2(0.5, 0.5);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 4, 0, 4);
                        BorderSizePixel = 0;
                        ZIndex = 10000;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.InlinePicker = Library:Create( "Frame" , {
                        Parent = Items.SatValPicker;
                        Name = "\0";
                        BackgroundTransparency = 0.15000000596046448;
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 2, 0, 2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Items.Saturation = Library:Create( "Frame" , {
                        Parent = Items.Inner;
                        Name = "\0";
                        Size = dim2(1, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 2;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIGradient" , {
                        Rotation = 270;
                        Transparency = numseq{numkey(0, 0), numkey(1, 1)};
                        Parent = Items.Saturation;
                        Color = rgbseq{rgbkey(0, rgb(0, 0, 0)), rgbkey(1, rgb(0, 0, 0))}
                    });
                    
                    Items.Val = Library:Create( "TextButton" , {
                        Active = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        AutoButtonColor = false;
                        Rotation = 180;
                        Name = "\0";
                        Parent = Items.Inner;
                        Size = dim2(1, 0, 1, 0);
                        Selectable = false;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIGradient" , {
                        Parent = Items.Val;
                        Transparency = numseq{numkey(0, 0), numkey(1, 1)}
                    });
                    
                    Items.Alpha = Library:Create( "TextButton" , {
                        Active = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        AutoButtonColor = false;
                        Parent = Items.Inline;
                        Name = "\0";
                        Position = dim2(0, 0, 1, -12);
                        Size = dim2(1, -20, 0, 12);
                        Selectable = false;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.AlphaInline = Library:Create( "Frame" , {
                        Parent = Items.Alpha;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 221, 255)
                    });
                    
                    Items.AlphaPicker = Library:Create( "Frame" , {
                        BorderMode = Enum.BorderMode.Inset;
                        BorderColor3 = rgb(12, 12, 12);
                        Parent = Items.AlphaInline;
                        BackgroundTransparency = 0.25;
                        Position = dim2(1, 1, 0, 1);
                        Name = "\0";
                        Size = dim2(0, 2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIStroke" , {
                        Parent = Items.AlphaPicker;
                        LineJoinMode = Enum.LineJoinMode.Miter
                    });
                    
                    Items.Hue = Library:Create( "TextButton" , {
                        Active = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        AutoButtonColor = false;
                        Parent = Items.Inline;
                        Name = "\0";
                        Position = dim2(1, -17, 0, 0);
                        Size = dim2(0, 17, 1, -15);
                        Selectable = false;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.HueInline = Library:Create( "Frame" , {
                        Parent = Items.Hue;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIGradient" , {
                        Rotation = 270;
                        Parent = Items.HueInline;
                        Color = rgbseq{rgbkey(0, rgb(255, 0, 0)), rgbkey(0.17, rgb(255, 255, 0)), rgbkey(0.33, rgb(0, 255, 0)), rgbkey(0.5, rgb(0, 255, 255)), rgbkey(0.67, rgb(0, 0, 255)), rgbkey(0.83, rgb(255, 0, 255)), rgbkey(1, rgb(255, 0, 0))}
                    });
                    
                    Items.HuePicker = Library:Create( "Frame" , {
                        BorderMode = Enum.BorderMode.Inset;
                        BorderColor3 = rgb(12, 12, 12);
                        Parent = Items.HueInline;
                        BackgroundTransparency = 0.25;
                        Position = dim2(0, 1, 1, 1);
                        Name = "\0";
                        Size = dim2(1, -2, 0, 2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIStroke" , {
                        Parent = Items.HuePicker;
                        LineJoinMode = Enum.LineJoinMode.Miter
                    });
                -- 
            end;
            
            function Cfg.SetVisible(bool)
                Items.Colorpicker.Visible = bool
                Items.Colorpicker.Parent = bool and Library.Items or Library.Other
                Items.Colorpicker.Position = dim2(0, Items.ColorpickerObject.AbsolutePosition.X, 0, Items.ColorpickerObject.AbsolutePosition.Y + 74)
            end
            
            function Cfg.Set(color, alpha)
                if type(color) == "boolean" then 
                    return
                end 

                if color then 
                    h, s, v = color:ToHSV()
                end
                
                if alpha then 
                    a = alpha
                end 
                
                local Color = hsv(1 - h, 1 - s, v)

                Items.SatValPicker.Position = dim2(s, 0, 1 - v, 0)
                Items.AlphaPicker.Position = dim2(a, -1, 0, 1)
                Items.HuePicker.Position = dim2(0, 1, h, -1)
                
                Items.Inner.BackgroundColor3 = hsv(1 - h, 1, 1)
                Items.AlphaInline.BackgroundColor3 = hsv(1 - h, 1, 1)
                Items.InnerObject.BackgroundColor3 = Color

                Flags[Cfg.Flag] = {
                    Color = Color;
                    Transparency = a 
                }

                Cfg.Callback(Color, a)
            end

            function Cfg.UpdateColor() 
                local Mouse = InputService:GetMouseLocation()
                local offset = vec2(Mouse.X, Mouse.Y - gui_offset) 
                
                if DraggingSat then	
                    s = math.clamp((offset - Items.Val.AbsolutePosition).X / Items.Val.AbsoluteSize.X, 0, 1)
                    v = 1 - math.clamp((offset - Items.Val.AbsolutePosition).Y / Items.Val.AbsoluteSize.Y, 0, 1)
                elseif DraggingHue then
                    h = math.clamp((offset - Items.Hue.AbsolutePosition).Y / Items.Hue.AbsoluteSize.Y, 0, 1)
                elseif DraggingAlpha then
                    a = math.clamp((offset - Items.Alpha.AbsolutePosition).X / Items.Alpha.AbsoluteSize.X, 0, 1)
                end

                Cfg.Set()
            end

            Items.ColorpickerObject.MouseButton1Click:Connect(function()
                Cfg.Open = not Cfg.Open
                Cfg.SetVisible(Cfg.Open)            
            end)

            InputService.InputChanged:Connect(function(input)
                if (DraggingSat or DraggingHue or DraggingAlpha) and input.UserInputType == Enum.UserInputType.MouseMovement then
                    Cfg.UpdateColor() 
                end
            end)

            Library:Connection(InputService.InputEnded, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    DraggingSat = false
                    DraggingHue = false
                    DraggingAlpha = false   

                    if not Library:Hovering({Items.ColorpickerObject, Items.Colorpicker}) then 
                        Cfg.SetVisible(false)
                        Cfg.Open = false
                    end 
                end
            end)  
            
            Library:Connection(InputService.InputBegan, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Library:Hovering({Items.ColorpickerObject, Items.Colorpicker}) then 
                        Cfg.SetVisible(false)
                        Cfg.Open = false
                    end 
                end
            end)   

            Items.Alpha.MouseButton1Down:Connect(function()
                DraggingAlpha = true 
            end)
            
            Items.Hue.MouseButton1Down:Connect(function()
                DraggingHue = true 
            end)
            
            Items.Val.MouseButton1Down:Connect(function()
                DraggingSat = true  
            end)

            Cfg.Set(Cfg.Color, Cfg.Alpha)
            ConfigFlags[Cfg.Flag] = Cfg.Set

            return setmetatable(Cfg, Library)
        end 

        function Library:GetConfig()
            local Config = {}
            
            for Idx, Value in Flags do
                if type(Value) == "table" and Value.key then
                    Config[Idx] = {active = Value.Active, mode = Value.Mode, key = tostring(Value.Key)}
                elseif type(Value) == "table" and Value["Transparency"] and Value["Color"] then
                    Config[Idx] = {Transparency = Value["Transparency"], Color = Value["Color"]:ToHex()}
                else
                    Config[Idx] = Value
                end
            end 

            return HttpService:JSONEncode(Config)
        end

        function Library:LoadConfig(JSON) 
            local Config = HttpService:JSONDecode(JSON)
            
            for Idx, Value in Config do                
                if Idx == "config_name_list" then 
                    continue 
                end

                local Function = ConfigFlags[Idx]

                if Function then 
                    if type(Value) == "table" and Value["Transparency"] and Value["Color"] then
                        Function(hex(Value["Color"]), Value["Transparency"])
                    elseif type(Value) == "table" and Value["Active"] then 
                        Function(Value)
                    else
                        Function(Value)
                    end
                end 
            end 
        end 
        
        function Library:Round(num, float) 
            local Multiplier = 1 / (float or 1)
            return math.floor(num * Multiplier + 0.5) / Multiplier
        end

        function Library:Themify(instance, theme, property)
            table.insert(themes.utility[theme][property], instance)
        end

        function Library:SaveGradient(instance, theme) -- instance, tabfill or background, color
            table.insert(themes.gradients[theme], instance)
        end

        --[[
            gradients = {
            Selected = {};
            Deselected = {};
        },
        gradient_preset = {
            Selected = rgbseq{rgbkey(0, themes.preset.inline), rgbkey(1, themes.preset.gradient)};
            Deselected = rgbseq{rgbkey(0, themes.preset.gradient), rgbkey(1, themes.preset.background)};
        },
        ]]

        function Library:RefreshTheme(theme, color)
            for property,instances in themes.utility[theme] do 
                for _,object in instances do
                    if object[property] == themes.preset[theme] then 
                        object[property] = color 
                    end
                end 
            end

            themes.preset[theme] = color 
        end 

        function Library:Connection(signal, callback)
            local connection = signal:Connect(callback)
            
            table.insert(Library.Connections, connection)

            return connection 
        end

        function Library:CloseElement() 
            local IsMulti = typeof(Library.OpenElement)

            if not Library.OpenElement then 
                return 
            end

            for i = 1, #Library.OpenElement do
                local Data = Library.OpenElement[i]

                if Data.Ignore then 
                    continue 
                end 

                Data.SetVisible(false)
                Data.Open = false
            end

            Library.OpenElement = {}
		end

        function Library:Create(instance, options)
            local ins = Instance.new(instance) 

            for prop, value in options do
                ins[prop] = value
            end

            if ins == "TextButton" then 
                ins["AutoButtonColor"] = false 
                ins["Text"] = ""
            end 
            
            return ins 
        end

        function Library:Unload() 
            if Library.Items then 
                Library.Items:Destroy()
            end

            if Library.Other then 
                Library.Other:Destroy()
            end
            
            for _,connection in Library.Connections do 
                connection:Disconnect() 
                connection = nil 
            end

            getgenv().Library = nil 
        end
    --
    
    -- Library element functions
        function Library:Window(properties)
            local Cfg = {
                Name = properties.Name or "nebula";
                Size = properties.Size or dim2(0, 660, 0, 674);
                TabInfo;
                Tweening = false;
                Items = {};
            }
            
            Library.Items = Library:Create( "ScreenGui" , {
                Parent = CoreGui;
                Name = "\0";
                Enabled = true;
                ZIndexBehavior = Enum.ZIndexBehavior.Global;
                IgnoreGuiInset = true;
            });
            
            Library.Other = Library:Create( "ScreenGui" , {
                Parent = CoreGui;
                Name = "\0";
                Enabled = false;
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                IgnoreGuiInset = true;
            }); 

            local Items = Cfg.Items; do
                -- Window
                    Items.Window = Library:Create( "Frame" , {
                        Parent = Library.Items;
                        Name = "\0";
                        Visible = false;
                        Position = dim2(0.5, -Cfg.Size.X.Offset / 2, 0.5, -Cfg.Size.Y.Offset / 2);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = Cfg.Size;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    }); Items.Window.Position = dim2(0, Items.Window.AbsolutePosition.X, 0, Items.Window.AbsolutePosition.Y);
                    
                    Items.Inline = Library:Create( "Frame" , {
                        Parent = Items.Window;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(61, 61, 61)
                    });
                    
                    Items.Hollow = Library:Create( "Frame" , {
                        Parent = Items.Inline;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(43, 43, 43)
                    });
                    
                    Items.Inline = Library:Create( "Frame" , {
                        Parent = Items.Hollow;
                        Name = "\0";
                        Position = dim2(0, 3, 0, 3);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -6, 1, -6);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(61, 61, 61)
                    });
                    
                    Items.InnerPage = Library:Create( "Frame" , {
                        Parent = Items.Inline;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Library:Create( "ImageLabel" , {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = Items.InnerPage;
                        Size = dim2(1, -2, 0, 2);
                        Image = "rbxassetid://8508019876";
                        BackgroundTransparency = 1;
                        Position = dim2(0, 1, 0, 1);
                        ZIndex = 3;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.Fillbar = Library:Create( "Frame" , {
                        Parent = Items.ImageLabel;
                        Size = dim2(1, 0, 0, 1);
                        Name = "\0";
                        Position = dim2(0, 0, 0, -1);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 3;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.AccentBar = Library:Create( "Frame" , {
                        Parent = Items.ImageLabel;
                        Size = dim2(1, 0, 0, 1);
                        Name = "\0";
                        Position = dim2(0, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 3;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(6, 6, 6)
                    });
                    
                    Items.Outline = Library:Create( "Frame" , {
                        Name = "\0";
                        Parent = Items.InnerPage;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 75, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(40, 40, 40)
                    });
                    
                    Items.Inline = Library:Create( "Frame" , {
                        Parent = Items.Outline;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.Background = Library:Create( "Frame" , {
                        Parent = Items.Inline;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Library:Create( "UIListLayout" , {
                        Parent = Items.Background;
                        Padding = dim(0, 4)
                    });
                    
                    Library:Create( "UIPadding" , {
                        Parent = Items.Background;
                        PaddingTop = dim(0, 9);
                        PaddingLeft = dim(0, -2)
                    });
                    
                    Items.Fill = Library:Create( "Frame" , {
                        Name = "\0";
                        Parent = Items.Outline;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 1);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.FillTwo = Library:Create( "Frame" , {
                        Parent = Items.Outline;
                        Name = "\0";
                        Size = dim2(0, 2, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 2;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.FillThree = Library:Create( "Frame" , {
                        Parent = Items.Outline;
                        Size = dim2(1, -2, 0, 5);
                        Name = "\0";
                        Position = dim2(0, 0, 1, -5);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 2;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.FillFive = Library:Create( "Frame" , {
                        Parent = Items.Outline;
                        Name = "\0";
                        Position = dim2(1, -2, 0, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 1, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.PageHolder = Library:Create( "Frame" , {
                        Parent = Items.InnerPage;
                        Name = "\0";
                        Position = dim2(0, 75, 0, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -75, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "ImageLabel" , {
                        ImageColor3 = rgb(12, 12, 12);
                        ScaleType = Enum.ScaleType.Tile;
                        BorderColor3 = rgb(0, 0, 0);
                        Image = "rbxassetid://8547666218";
                        TileSize = dim2(0, 8, 0, 8);
                        Parent = Items.PageHolder;
                        Size = dim2(1, 0, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(20, 20, 20)
                    });                    
                --
            end

            do -- Other
                Library:Draggify(Items.Window)
                Library:Resizify(Items.Window)
            end

            function Cfg.ToggleMenu(bool) 
                if Cfg.Tweening then 
                    return 
                end 

                Cfg.Tweening = true 

                if bool then 
                    Items.Window.Visible = true
                end

                local Children = Items.Window:GetDescendants()
                table.insert(Children, Items.Window)

                local Tween;
                for _,obj in Children do
                    local Index = Library:GetTransparency(obj)

                    if not Index then 
                        continue 
                    end

                    if type(Index) == "table" then
                        for _,prop in Index do
                            Tween = Library:Fade(obj, prop, bool)
                        end
                    else
                        Tween = Library:Fade(obj, Index, bool)
                    end
                end

                Library:Connection(Tween.Completed, function()
                    Cfg.Tweening = false
                    Items.Window.Visible = bool
                end)
            end
            
            return setmetatable(Cfg, Library)
        end 

        function Library:Tab(properties)
            local Cfg = {
                Items = {};
                Icon = properties.Icon or properties.icon or "rbxassetid://8547236654"
            }

            local Items = Cfg.Items; do 
                -- Tab buttons 
                    Items.ButtonHolder = Library:Create( "TextButton" , {
                        Parent = self.Items.Background;
                        Text = "";
                        AutoButtonColor = true;
                        BackgroundTransparency = 1;
                        Name = "\0";
                        Active = true;
                        ZIndex = 5;
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 0, 70);
                        Position = dim2(0, -2, 0, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.Outline = Library:Create( "Frame" , {
                        Parent = Items.ButtonHolder;
                        Name = "\0";
                        Size = dim2(1, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 3;
                        Visible = false;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                    
                    Items.Inline = Library:Create( "Frame" , {
                        Parent = Items.Outline;
                        Size = dim2(1, 1, 1, -2);
                        ZIndex = 3;
                        Name = "\0";
                        Position = dim2(0, 0, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(40, 40, 40)
                    });
                    
                    Items.Background = Library:Create( "Frame" , {
                        Parent = Items.Inline;
                        Size = dim2(1, 0, 1, -2);
                        ZIndex = 3;
                        Name = "\0";
                        Position = dim2(0, 0, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(20, 20, 20)
                    });
                    
                    Items.Pattern = Library:Create( "ImageLabel" , {
                        ImageColor3 = rgb(12, 12, 12);
                        ScaleType = Enum.ScaleType.Tile;
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 4;
                        Parent = Items.Background;
                        Name = "\0";
                        TileSize = dim2(0, 8, 0, 8);
                        Image = "rbxassetid://8547666218";
                        BackgroundTransparency = 1;
                        Size = dim2(1, 2, 1, 0);
                        Position = dim2(0, -1, 0, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });

                    Items.Filler = Library:Create( "Frame" , {
                        Parent = Items.Background;
                        Name = "\0";
                        ZIndex = 3;
                        Position = dim2(1, 0, 0, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 2, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(20, 20, 20)
                    });
                    
                    Items.Icon = Library:Create( "ImageLabel" , {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = Items.ButtonHolder;
                        Name = "\0";
                        ImageColor3 = rgb(100, 100, 100);
                        Size = dim2(0, 50, 0, 50);
                        AnchorPoint = vec2(0.5, 0.5);
                        Image = Cfg.Icon;
                        BackgroundTransparency = 1;
                        Position = dim2(0.5, 0, 0.5, 0);
                        ZIndex = 4;
                        BorderSizePixel = 0;
                    });
                    
                    Items.Shade = Library:Create( "ImageLabel" , {
                        ImageColor3 = rgb(0, 0, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = Items.ButtonHolder;
                        Name = "\0";
                        Size = dim2(0, 50, 0, 50);
                        AnchorPoint = vec2(0.5, 0.5);
                        Image = Cfg.Icon;
                        BackgroundTransparency = 1;
                        Position = dim2(0.5, 1, 0.5, 1);
                        ZIndex = 3;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });

                    Items.Button = Library:Create( "TextButton" , {
                        Parent = Items.ButtonHolder;
                        Name = "\0";
                        BackgroundTransparency = 1;
                        Size = dim2(1, 0, 1, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        ZIndex = 3;
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(0, 0, 0)
                    });
                -- 
                
                -- Page directory 
                    Items.Page = Library:Create( "Frame" , {
                        Parent = self.Items.PageHolder;
                        BackgroundTransparency = 1;
                        Name = "\0";
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, 0, 1, 0);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIListLayout" , {
                        FillDirection = Enum.FillDirection.Horizontal;
                        HorizontalFlex = Enum.UIFlexAlignment.Fill;
                        Parent = Items.Page;
                        Padding = dim(0, 20);
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        VerticalFlex = Enum.UIFlexAlignment.Fill
                    });
                    
                    Library:Create( "UIPadding" , {
                        PaddingTop = dim(0, 20);
                        PaddingBottom = dim(0, 20);
                        Parent = Items.Page;
                        PaddingRight = dim(0, 20);
                        PaddingLeft = dim(0, 20)
                    });
                    
                    Items.Left = Library:Create( "Frame" , {
                        Parent = Items.Page;
                        BackgroundTransparency = 1;
                        Name = "\0";
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 100, 0, 100);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });

                    Library:Create( "UIListLayout" , {
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        VerticalFlex = Cfg.RightFill and Enum.UIFlexAlignment.Fill or Enum.UIFlexAlignment.None;
                        Parent = Items.Left;
                        Padding = dim(0, 19);
                    });
                    
                    Items.Right = Library:Create( "Frame" , {
                        Parent = Items.Page;
                        BackgroundTransparency = 1;
                        Name = "\0";
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(0, 100, 0, 100);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });

                    Library:Create( "UIListLayout" , {
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        VerticalFlex = Cfg.LeftFill and Enum.UIFlexAlignment.Fill or Enum.UIFlexAlignment.None;
                        Parent = Items.Right;
                        Padding = dim(0, 19);
                    });
                -- 
            end 

            function Cfg.OpenTab() 
                local Tab = self.TabInfo
                
                if Tab then
                    Tab.Page.Visible = false
                    Tab.Page.Parent = Library.Other
                    
                    Tab.Icon.ImageColor3 = rgb(100, 100, 100)
                    Tab.Outline.Visible = false
                end

                Items.Icon.ImageColor3 = rgb(255, 255, 255)
                Items.Outline.Visible = true
                Items.Page.Parent = self.Items.PageHolder
                Items.Page.Visible = true
                
                self.TabInfo = Cfg.Items
            end

            Items.ButtonHolder.MouseButton1Down:Connect(function()
                print("clicked")
                Cfg.OpenTab()
            end)
            
            if not self.TabInfo then
                Cfg.OpenTab()
            end

            return setmetatable(Cfg, Library)
        end

        function Library:Section(properties)
            local Cfg = {
                Name = properties.name or properties.Name or "Section"; 
                Side = properties.side or properties.Side or "Left";

                -- Fill settings 
                Size = properties.size or properties.Size or 1;
                
                -- Other
                Items = {};
            };
            
            local Items = Cfg.Items; do
                Items.Outline = Library:Create( "Frame" , {
                    Name = "\0";
                    Parent = self.Items[Cfg.Side];
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, 0, Cfg.Size, 0);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(12, 12, 12)
                });
                
                Items.Inline = Library:Create( "Frame" , {
                    Parent = Items.Outline;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(40, 40, 40)
                });
                
                Items.Background = Library:Create( "Frame" , {
                    Parent = Items.Inline;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(23, 23, 23)
                });
                
                Items.Title = Library:Create( "TextLabel" , {
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                    TextColor3 = rgb(255, 255, 255);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = Cfg.Name;
                    Parent = Items.Background;
                    Name = "\0";
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundTransparency = 1;
                    Position = dim2(0, 9, 0, -9);
                    BorderSizePixel = 0;
                    ZIndex = 4;
                    TextSize = 13;
                    BackgroundColor3 = rgb(255, 255, 255)
                });

                Items.Shade = Library:Create( "TextLabel" , {
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                    TextColor3 = rgb(0, 0, 0);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = Cfg.Name;
                    Parent = Items.Background;
                    Name = "\0";
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundTransparency = 1;
                    Position = dim2(0, 13, 0, -8);
                    BorderSizePixel = 0;
                    ZIndex = 3;
                    TextSize = 13;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "Frame" , {
                    Parent = Items.Title;
                    Position = dim2(0, 2, 0.5, 0);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, 5, 0, 2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(23, 23, 23)
                });
                
                Items.ScrollbarFill = Library:Create( "Frame" , {
                    Visible = false;
                    BorderColor3 = rgb(0, 0, 0);
                    AnchorPoint = vec2(1, 0);
                    Name = "\0";
                    Position = dim2(1, 0, 0, 0);
                    Parent = Items.Background;
                    Size = dim2(0, 6, 1, 0);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(45, 45, 45)
                });
                
                Items.Holder = Library:Create( "ScrollingFrame" , {
                    Active = true;
                    AutomaticCanvasSize = Enum.AutomaticSize.Y;
                    ZIndex = 2;
                    BorderSizePixel = 0;
                    CanvasSize = dim2(0, 0, 0, 0);
                    ScrollBarImageColor3 = rgb(65, 65, 65);
                    MidImage = "rbxassetid://74268315755026";
                    BorderColor3 = rgb(0, 0, 0);
                    ScrollBarThickness = 4;
                    Parent = Items.Background;
                    Name = "\0";
                    BackgroundTransparency = 1;
                    Position = dim2(0, 0, 0, 1);
                    Size = dim2(1, -1, 1, -1);
                    BottomImage = "rbxassetid://74268315755026";
                    TopImage = "rbxassetid://74268315755026";
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Elements = Library:Create( "Frame" , {
                    BorderColor3 = rgb(0, 0, 0);
                    Parent = Items.Holder;
                    Name = "\0";
                    BackgroundTransparency = 1;
                    Position = dim2(0, 20, 0, 19);
                    Size = dim2(1, -42, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.Y;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIListLayout" , {
                    Parent = Items.Elements;
                    Padding = dim(0, 8);
                    SortOrder = Enum.SortOrder.LayoutOrder
                });
                
                Items.Gradient = Library:Create( "Frame" , {
                    BorderColor3 = rgb(0, 0, 0);
                    AnchorPoint = vec2(0, 1);
                    Parent = Items.Background;
                    Name = "\0";
                    Position = dim2(0, 0, 1, 0);
                    Size = dim2(1, -6, 0, 20);
                    ZIndex = 2;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIGradient" , {
                    Rotation = -90;
                    Transparency = numseq{numkey(0, 0), numkey(0.502, 0.4937499761581421), numkey(1, 1)};
                    Parent = Items.Gradient;
                    Color = rgbseq{rgbkey(0, rgb(23, 23, 23)), rgbkey(1, rgb(23, 23, 23))}
                });
                
                Items.Up = Library:Create( "ImageLabel" , {
                    BorderColor3 = rgb(0, 0, 0);
                    Parent = Items.Background;
                    Name = "\0";
                    Size = dim2(0, 5, 0, 4);
                    AnchorPoint = vec2(1, 0.5);
                    Visible = false;
                    Image = "rbxassetid://83504953088675";
                    BackgroundTransparency = 1;
                    Position = dim2(1, -10, 1, -8);
                    ZIndex = 5;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Down = Library:Create( "ImageLabel" , {
                    Parent = Items.Background;
                    BorderColor3 = rgb(0, 0, 0);
                    Name = "\0";
                    Rotation = 180;
                    Size = dim2(0, 5, 0, 4);
                    Visible = false;
                    AnchorPoint = vec2(1, 0.5);
                    Image = "rbxassetid://83504953088675";
                    BackgroundTransparency = 1;
                    Position = dim2(1, -10, 0, 8);
                    ZIndex = 5;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Elements:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    Items.ScrollbarFill = Items.Holder.AbsoluteSize.Y < Items.Holder.AbsoluteSize.Y and true or false    
                end)
            end 

            return setmetatable(Cfg, Library)
        end  

        function Library:Toggle(properties) 
            local Cfg = {
                Name = properties.Name or "Toggle";
                Flag = properties.Flag or properties.Name or "Toggle";
                Enabled = properties.Default or false;
                Callback = properties.Callback or function() end;

                -- Sub / Group Section
                Folding = properties.Folding or false;
                Collapsable = properties.Collapsing or true;

                Items = {};
            }

            local Items = Cfg.Items; do 
                Items.Toggle = Library:Create( "TextButton" , {
                    Active = false;
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "";
                    AutoButtonColor = false;
                    Parent = self.Items.Elements;
                    BackgroundTransparency = 1;
                    Name = "\0";
                    Size = dim2(1, 0, 0, 8);
                    Selectable = false;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Components = Library:Create( "Frame" , {
                    Parent = Items.Toggle;
                    Name = "\0";
                    Position = dim2(1, 0, 0, 0);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(0, 0, 1, 0);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIListLayout" , {
                    FillDirection = Enum.FillDirection.Horizontal;
                    HorizontalAlignment = Enum.HorizontalAlignment.Right;
                    Parent = Items.Components;
                    Padding = dim(0, 3);
                    SortOrder = Enum.SortOrder.LayoutOrder
                });
                
                Items.Title = Library:Create( "TextLabel" , {
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    TextColor3 = rgb(205, 205, 205);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = Cfg.Name;
                    Parent = Items.Toggle;
                    Name = "\0";
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundTransparency = 1;
                    Position = dim2(0, 19, 0, -4);
                    BorderSizePixel = 0;
                    ZIndex = 2;
                    TextSize = 13;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Holder = Library:Create( "Frame" , {
                    Name = "\0";
                    Parent = Items.Toggle;
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(0, 8, 0, 8);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(12, 12, 12)
                });
                
                Items.Accent = Library:Create( "Frame" , {
                    Parent = Items.Holder;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundTransparency = 1;
                    ZIndex = 2;
                    BackgroundColor3 = themes.preset.accent 
                }); Library:Themify(Items.Accent, "accent", "BackgroundColor3")
                
                Library:Create( "UIGradient" , {
                    Rotation = 90;
                    Parent = Items.Accent;
                    Color = rgbseq{rgbkey(0, rgb(255, 255, 255)), rgbkey(1, rgb(170, 170, 170))}
                });
                
                Items.Background = Library:Create( "Frame" , {
                    BorderColor3 = rgb(0, 0, 0);
                    Parent = Items.Holder;
                    Position = dim2(0, 1, 0, 1);
                    Name = "\0";
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIGradient" , {
                    Rotation = 90;
                    Parent = Items.Background;
                    Color = rgbseq{rgbkey(0, rgb(85, 85, 85)), rgbkey(1, rgb(60, 60, 60))}
                });                
            end;
            
            function Cfg.Set(bool)
                Flags[Cfg.Flag] = bool

                Cfg.Callback(bool)

                Library:Tween(Items.Accent, {BackgroundTransparency = bool and 0 or 1})
            end 
            
            Items.Toggle.MouseButton1Click:Connect(function()
                Cfg.Enabled = not Cfg.Enabled
                Cfg.Set(Cfg.Enabled)
            end)

            Cfg.Set(Cfg.Enabled)

            ConfigFlags[Cfg.Flag] = Cfg.Set

            return setmetatable(Cfg, Library)
        end 
        
        function Library:Slider(properties) 
            local Cfg = {
                Name = properties.Name or nil,
                Suffix = properties.Suffix or "",
                Flag = properties.Flag or properties.Name or "Slider",
                Callback = properties.Callback or function() end, 

                -- Value Settings
                Min = properties.Min or 0,
                Max = properties.Max or 100,
                Intervals = properties.Decimal or 1,
                Value = properties.Default or 10, 

                -- Other
                Dragging = false,
                Items = {}
            } 

            local Items = Cfg.Items; do
                Items.Slider = Library:Create( "TextButton" , {
                    Active = false;
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "";
                    AutoButtonColor = false;
                    Parent = self.Items.Elements;
                    Name = "\0";
                    BackgroundTransparency = 1;
                    Size = dim2(1, 0, 0, 8);
                    Selectable = false;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                if Cfg.Name then                                            
                    Items.Title = Library:Create( "TextLabel" , {
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        TextColor3 = rgb(205, 205, 205);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = Cfg.Name;
                        Parent = Items.Slider;
                        Name = "\0";
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 21, 0, -2);
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextSize = 13;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                end
                
                Items.Holder = Library:Create( "TextButton" , {
                    Parent = Items.Slider;
                    AutoButtonColor = false;
                    Text = "";
                    Name = "\0";
                    Position = dim2(0, 20, 0, Cfg.Name and 14 or 0);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -55, 0, 7);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(12, 12, 12)
                });
                
                Items.Background = Library:Create( "Frame" , {
                    Parent = Items.Holder;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIGradient" , {
                    Rotation = 90;
                    Parent = Items.Background;
                    Color = rgbseq{rgbkey(0, rgb(52, 52, 52)), rgbkey(1, rgb(68, 68, 68))}
                });
                
                Items.Plus = Library:Create( "TextButton" , {
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    TextColor3 = rgb(205, 205, 205);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "+";
                    Parent = Items.Holder;
                    Name = "\0";
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundTransparency = 1;
                    Position = dim2(1, 5, 0, -3);
                    BorderSizePixel = 0;
                    ZIndex = 2;
                    TextSize = 12;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Minus = Library:Create( "TextButton" , {
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    TextColor3 = rgb(205, 205, 205);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "-";
                    Parent = Items.Holder;
                    Name = "\0";
                    AnchorPoint = vec2(1, 0);
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundTransparency = 1;
                    Position = dim2(0, -3, 0, -3);
                    BorderSizePixel = 0;
                    ZIndex = 2;
                    TextSize = 12;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Accent = Library:Create( "Frame" , {
                    Parent = Items.Holder;
                    Size = dim2(0.5, -2, 1, -2);
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    ZIndex = 2;
                    BorderSizePixel = 0;
                    BackgroundColor3 = themes.preset.accent
                }); Library:Themify(Items.Accent, "accent", "BackgroundColor3")
                
                Library:Create( "UIGradient" , {
                    Rotation = 90;
                    Parent = Items.Accent;
                    Color = rgbseq{rgbkey(0, rgb(255, 255, 255)), rgbkey(1, rgb(170, 170, 170))}
                });
                
                Items.Value = Library:Create( "TextBox" , {
                    Parent = Items.Accent;
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
                    Name = "\0";
                    TextColor3 = rgb(205, 205, 205);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "100%";
                    AutomaticSize = Enum.AutomaticSize.XY;
                    Selectable = false;
                    AnchorPoint = vec2(0.5, 0);
                    BorderSizePixel = 0;
                    BackgroundTransparency = 1;
                    Position = dim2(1, 0, 0.10000000149011612, 0);
                    Active = false;
                    ZIndex = 2;
                    TextSize = 13;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIStroke" , {
                    Parent = Items.Value;
                    Transparency = 0.5
                });                                         
            end 

            function Cfg.Set(value)
                Cfg.Value = math.clamp(Library:Round(value, Cfg.Intervals), Cfg.Min, Cfg.Max)

                Items.Accent.Size = dim2((Cfg.Value - Cfg.Min) / (Cfg.Max - Cfg.Min), Cfg.Value == Cfg.Min and 0 or -2, 1, -2)
                Items.Value.Text = tostring(Cfg.Value) .. Cfg.Suffix

                Flags[Cfg.Flag] = Cfg.Value
                Cfg.Callback(Flags[Cfg.Flag])
            end
            
            Items.Holder.MouseButton1Down:Connect(function()
                Cfg.Dragging = true 
            end)

            Items.Minus.MouseButton1Down:Connect(function()
                Cfg.Value -= Cfg.Intervals

                Cfg.Set(Cfg.Value)
            end)

            Items.Plus.MouseButton1Down:Connect(function()
                Cfg.Value += Cfg.Intervals

                Cfg.Set(Cfg.Value)
            end)

            Library:Connection(InputService.InputChanged, function(input)
                if Cfg.Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then 
                    local Size = (input.Position.X - Items.Holder.AbsolutePosition.X) / Items.Holder.AbsoluteSize.X
                    local Value = ((Cfg.Max - Cfg.Min) * Size) + Cfg.Min
                    Cfg.Set(Value)
                end
            end)

            Library:Connection(InputService.InputEnded, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Cfg.Dragging = false
                end 
            end)

            Items.Value.Focused:Connect(function()
                Library:Tween(Items.Value, {TextColor3 = themes.preset.accent})
            end)

            Items.Value.FocusLost:Connect(function()
                Library:Tween(Items.Value, {TextColor3 = rgb(205, 205, 205)})
                Cfg.Set(Items.Value.Text)
            end)

            Cfg.Set(Cfg.Value)
            ConfigFlags[Cfg.Flag] = Cfg.Set

            return setmetatable(Cfg, Library)
        end 

        function Library:Dropdown(properties) 
            local Cfg = {
                Name = properties.Name or nil;
                Flag = properties.Flag or properties.Name or "Dropdown";
                Options = properties.Options or {""};
                Callback = properties.Callback or function() end;
                Multi = properties.Multi or false;
                Scrolling = properties.Scrolling or false;

                -- Ignore these 
                Open = false;
                OptionInstances = {};
                MultiItems = {};
                Items = {};
                Tweening = false;
                Ignore = properties.Ignore or false;
            }   

            Cfg.Default = properties.Default or (Cfg.Multi and {Cfg.Items[1]}) or Cfg.Items[1] or "None"
            Flags[Cfg.Flag] = Cfg.Default
            
            local Items = Cfg.Items; do 
                -- Element
                    Items.Dropdown = Library:Create( "TextButton" , {
                        Active = false;
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "";
                        AutoButtonColor = false;
                        Parent = self.Items.Elements;
                        Name = "\0";
                        BackgroundTransparency = 1;
                        Size = dim2(1, 0, 0, 8);
                        Selectable = false;
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.Y;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Items.Title = Library:Create( "TextLabel" , {
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        TextColor3 = rgb(205, 205, 205);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = Cfg.Name;
                        Parent = Items.Dropdown;
                        Name = "\0";
                        AutomaticSize = Enum.AutomaticSize.XY;
                        BackgroundTransparency = 1;
                        Position = dim2(0, 20, 0, -2);
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextSize = 13;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Items.Outline = Library:Create( "TextButton" , {
                        Parent = Items.Dropdown;
                        Text = "";
                        AutoButtonColor = false;
                        Name = "\0";
                        Position = dim2(0, 20, 0, 13);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -55, 0, 20);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.Accent = Library:Create( "Frame" , {
                        Parent = Items.Outline;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Items.DropdownGradient = Library:Create( "UIGradient" , {
                        Rotation = 90;
                        Parent = Items.Accent;
                        Color = rgbseq{rgbkey(0, rgb(31, 31, 31)), rgbkey(1, rgb(36, 36, 36))}
                    });
                    
                    Items.InnerText = Library:Create( "TextLabel" , {
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        TextColor3 = rgb(205, 205, 205);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "-";
                        Parent = Items.Accent;
                        Name = "\0";
                        AutomaticSize = Enum.AutomaticSize.XY;
                        Size = dim2(1, 0, 1, 0);
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextSize = 13;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIPadding" , {
                        PaddingLeft = dim(0, 5);
                        Parent = Items.InnerText
                    });
                    
                    Items.Arrow = Library:Create( "ImageLabel" , {
                        BorderColor3 = rgb(0, 0, 0);
                        Parent = Items.Accent;
                        AnchorPoint = vec2(1, 0.5);
                        Image = "rbxassetid://83504953088675";
                        BackgroundTransparency = 1;
                        Position = dim2(1, -5, 0.5, 0);
                        Size = dim2(0, 5, 0, 4);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                -- 
                
                -- Element Holder
                    Items.DropdownElements = Library:Create( "Frame" , {
                        Parent = Library.Items;
                        Size = dim2(0, 132, 0, 47);
                        Name = "\0";
                        Visible = false;
                        Position = dim2(0.6994267702102661, 0, 0.370685338973999, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        ZIndex = 4;
                        AutomaticSize = Enum.AutomaticSize.Y;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });
                    
                    Items.DropdownHolder = Library:Create( "Frame" , {
                        Parent = Items.DropdownElements;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        ZIndex = 4;
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(35, 35, 35)
                    });
                    
                    Library:Create( "UIPadding" , {
                        PaddingBottom = dim(0, 1);
                        Parent = Items.DropdownHolder
                    });

                    Library:Create( "UIListLayout" , {
                        Parent = Items.DropdownHolder;
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });
                -- 
            end 

            function Cfg.RenderOption(text)
                local Button = Library:Create( "TextButton" , {
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    TextColor3 = rgb(205, 205, 205);
                    AutoButtonColor = false;
                    BorderColor3 = rgb(0, 0, 0);
                    Text = text;
                    Parent = Items.DropdownHolder;
                    ClipsDescendants = true;
                    AutomaticSize = Enum.AutomaticSize.Y;
                    Size = dim2(1, 0, 0, 0);
                    Name = "\0";
                    TextXAlignment = Enum.TextXAlignment.Left;
                    BorderSizePixel = 0;
                    ZIndex = 4;
                    TextSize = 13;
                    BackgroundColor3 = rgb(26, 26, 26)
                });
                
                Library:Create( "UIPadding" , {
                    PaddingTop = dim(0, 5);
                    PaddingBottom = dim(0, 5);
                    Parent = Button;
                    PaddingRight = dim(0, 5);
                    PaddingLeft = dim(0, 5)
                });

                table.insert(Cfg.OptionInstances, Button)

                return Button
            end
            
            function Cfg.SetVisible(bool)
                if Library.OpenElement ~= Cfg then 
                    Library:CloseElement(Cfg)
                end

                Items.DropdownElements.Position = dim2(0, Items.Outline.AbsolutePosition.X, 0, Items.Outline.AbsolutePosition.Y + 80)
				Items.DropdownElements.Size = dim_offset(Items.Outline.AbsoluteSize.X + 1, 0)
                Items.DropdownElements.Visible = bool
                Items.DropdownElements.Parent = bool and Library.Items or Library.Other 

                Items.DropdownGradient.Color = bool and rgbseq{rgbkey(0, rgb(41, 41, 41)), rgbkey(1, rgb(46, 46, 46))} or rgbseq{rgbkey(0, rgb(31, 31, 31)), rgbkey(1, rgb(36, 36, 36))}

                Items.Arrow.Rotation = bool and 180 or 0
                
                Library.OpenElement = Cfg
            end
            
            function Cfg.Set(value)
                local Selected = {}
                local IsTable = type(value) == "table"

                for _,option in Cfg.OptionInstances do 
                    if option.Text == value or (IsTable and table.find(value, option.Text)) then 
                        table.insert(Selected, option.Text)
                        Cfg.MultiItems = Selected
                        option.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
                        option.TextColor3 = themes.preset.accent
                        option.BackgroundTransparency = 1
                    else
                        option.TextColor3 = rgb(205, 205, 205)
                        option.BackgroundTransparency = 0
                        option.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    end
                end

                Items.InnerText.Text = if IsTable then table.concat(Selected, ", ") else Selected[1] or ""
                Flags[Cfg.Flag] = if IsTable then Selected else Selected[1]
                
                Cfg.Callback(Flags[Cfg.Flag]) 
            end
            
            function Cfg.RefreshOptions(options) 
                for _,option in Cfg.OptionInstances do 
                    option:Destroy() 
                end
                
                Cfg.OptionInstances = {} 

                for _,option in options do
                    local Button = Cfg.RenderOption(option)
                    
                    Button.MouseButton1Down:Connect(function()
                        if Cfg.Multi then 
                            local Selected = table.find(Cfg.MultiItems, Button.Text)
                            
                            if Selected then 
                                table.remove(Cfg.MultiItems, Selected)
                            else
                                table.insert(Cfg.MultiItems, Button.Text)
                            end
                            
                            Cfg.Set(Cfg.MultiItems) 				
                        else 
                            Cfg.SetVisible(false)
                            Cfg.Open = false
                            
                            Cfg.Set(Button.Text)
                        end
                    end)
                end
            end

            Items.Outline.MouseButton1Click:Connect(function()
                Cfg.Open = not Cfg.Open 

                Cfg.SetVisible(Cfg.Open)
            end)

            Library:Connection(InputService.InputBegan, function(input, game_event)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not Library:Hovering({Items.DropdownElements, Items.Dropdown}) then
                        Cfg.SetVisible(false)
                        Cfg.Open = false
                    end 
                end 
            end)

            Flags[Cfg.Flag] = {} 
            ConfigFlags[Cfg.Flag] = Cfg.Set
            
            Cfg.RefreshOptions(Cfg.Options)
            Cfg.Set(Cfg.Default)
                
            return setmetatable(Cfg, Library)
        end

        function Library:Label(properties)
            local Cfg = {
                Name = properties.Name or "Label",

                -- Other
                Items = {};
            }

            local Items = Cfg.Items; do 
                Items.Label = Library:Create( "Frame" , {
                    Parent = self.Items.Elements;
                    Name = "\0";
                    BackgroundTransparency = 1;
                    Size = dim2(1, 0, 0, 8);
                    BorderColor3 = rgb(0, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.Y;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Title = Library:Create( "TextLabel" , {
                    TextWrapped = true;
                    Parent = Items.Label;
                    ZIndex = 2;
                    TextSize = 13;
                    Size = dim2(1, -55, 0, 0);
                    RichText = true;
                    TextColor3 = rgb(205, 205, 205);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = Cfg.Name;
                    Name = "\0";
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    BackgroundTransparency = 1;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    Position = dim2(0, 21, 0, -2);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.Y;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Components = Library:Create( "Frame" , {
                    Parent = Items.Label;
                    Name = "\0";
                    Position = dim2(1, 0, 0, 0);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(0, 0, 1, 0);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIListLayout" , {
                    FillDirection = Enum.FillDirection.Horizontal;
                    HorizontalAlignment = Enum.HorizontalAlignment.Right;
                    Parent = Items.Components;
                    Padding = dim(0, 3);
                    SortOrder = Enum.SortOrder.LayoutOrder
                });                
            end 

            function Cfg.Set(Text)
                Items.Name.Text = Text
            end 

            return setmetatable(Cfg, Library)
        end
        
        function Library:Colorpicker(properties) 
            local Cfg = {
                Name = properties.Name or "Color", 
                Flag = properties.Flag or properties.Name or "Colorpicker",
                Callback = properties.Callback or function() end,

                Color = properties.Color or color(1, 1, 1), -- Default to white color if not provided
                Alpha = properties.Alpha or properties.Transparency or 0,
                
                -- Other
                Open = false;
                Mode = properties.Mode or "Animation";
                Items = {};
            }

            local Picker = self:Keypicker(Cfg)

            local Items = Picker.Items; do
                Cfg.Items = Items
                Cfg.Set = Picker.Set
            end;
            
            Cfg.Set(Cfg.Color, Cfg.Alpha)
            ConfigFlags[Cfg.Flag] = Cfg.Set

            return setmetatable(Cfg, Library)
        end 

        function Library:Textbox(properties) 
            local Cfg = {
                Name = properties.Name;
                PlaceHolder = properties.PlaceHolder or properties.PlaceHolderText or properties.Holder or properties.HolderText or "Type here...";
                Default = properties.Default or "";
                Flag = properties.Flag or properties.Name or "TextBox";
                Callback = properties.Callback or function() end;
                Clear = properties.ClearTextOnFocus or false;

                Items = {};
            }

            Flags[Cfg.Flag] = Cfg.default

            local Items = Cfg.Items; do 
                Items.List = Library:Create( "TextButton" , {
                    Active = false;
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "";
                    AutoButtonColor = false;
                    Parent = self.Items.Elements;
                    Name = "\0";
                    BackgroundTransparency = 1;
                    Size = dim2(1, 0, 0, 10);
                    Selectable = false;
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.Y;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Textbox = Library:Create( "Frame" , {
                    Parent = Items.List;
                    Size = dim2(1, -55, 0, 20);
                    Name = "\0";
                    Position = dim2(0, 20, 0, -1);
                    BorderColor3 = rgb(0, 0, 0);
                    ZIndex = 2;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(13, 13, 13)
                });
                
                Items.Inline = Library:Create( "Frame" , {
                    Parent = Items.Textbox;
                    Size = dim2(1, -2, 1, -2);
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    ZIndex = 2;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(53, 53, 53)
                });
                
                Items.ExtraInline = Library:Create( "Frame" , {
                    Parent = Items.Inline;
                    Size = dim2(1, -2, 1, -2);
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    ZIndex = 2;
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(17, 17, 17)
                });
                
                Items.Background = Library:Create( "TextBox" , {
                    Parent = Items.ExtraInline;
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                    BorderSizePixel = 0;
                    ClipsDescendants = true;
                    ClearTextOnFocus = Cfg.Clear;
                    TextColor3 = rgb(205, 205, 205);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "";
                    CursorPosition = -1;
                    TextStrokeTransparency = 1;
                    Size = dim2(1, -2, 1, -2);
                    Selectable = false;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    Active = false;
                    ZIndex = 2;
                    TextSize = 13;
                    BackgroundColor3 = rgb(26, 26, 26)
                });
                
                -- if Cfg.Name then 
                --     Items.Title = Library:Create( "TextLabel" , {
                --         FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                --         TextColor3 = rgb(205, 205, 205);
                --         BorderColor3 = rgb(0, 0, 0);
                --         Text = Cfg.Name;
                --         Parent = Items.List;
                --         Name = "\0";
                --         AutomaticSize = Enum.AutomaticSize.XY;
                --         BackgroundTransparency = 1;
                --         Position = dim2(0, 20, 0, -2);
                --         BorderSizePixel = 0;
                --         ZIndex = 2;
                --         TextSize = 13;
                --         BackgroundColor3 = rgb(255, 255, 255)
                --     });

                --     Items.Textbox.Position = dim2(0, 20, 0, 13)
                -- end 
            end 


            
            function Cfg.Set(text) 
                Flags[Cfg.Flag] = text

                Items.Background.Text = text

                Cfg.Callback(text)
            end 

            Items.Background.Focused:Connect(function()
                Library:Tween(Items.Background, {TextColor3 = themes.preset.accent})
                Items.Background.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            end)

            Items.Background.FocusLost:Connect(function()
                Library:Tween(Items.Background, {TextColor3 = rgb(205, 205, 205)})
                Items.Background.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            end)

            Items.Background:GetPropertyChangedSignal("Text"):Connect(function()
                Cfg.Set(Items.Background.Text) 
            end) 

            if Cfg.Default then 
                Cfg.Set(Cfg.Default) 
            end

            ConfigFlags[Cfg.Flag] = Cfg.Set

            return setmetatable(Cfg, Library)
        end

        function Library:Keybind(properties) 
            local Cfg = {
                Flag = properties.Flag or properties.Name;
                Callback = properties.Callback or function() end;
                Name = properties.Name or nil; 

                Key = properties.Key or nil;
                Mode = properties.Mode or "Toggle";
                Active = properties.Default or false; 
                
                Show = properties.ShowInList or true;

                Open = false;
                Binding;
                Ignore = false;

                Items = {}
            }

            Flags[Cfg.Flag] = {
                Mode = Cfg.Mode,
                Key = Cfg.Key, 
                Active = Cfg.Active
            }

            local Items = Cfg.Items; do 
                -- Component
                    Items.Keybind = Library:Create( "TextButton" , {
                        Parent = Items.game.StarterGui.Skeet.Main.Window.Inline.Hollow.Inline.InnerPage.PageHolder.Page.Page.Column.Outline.Inline.Background.Holder.Elements.Dropdown.Components;
                        FontFace = Font.new("rbxassetid://12187371840", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        Name = "\0";
                        TextColor3 = rgb(111, 111, 111);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "[T]";
                        AutomaticSize = Enum.AutomaticSize.XY;
                        Selectable = false;
                        AnchorPoint = vec2(0.5, 0);
                        BorderSizePixel = 0;
                        BackgroundTransparency = 1;
                        Position = dim2(1, 0, 0.10000000149011612, 0);
                        Active = false;
                        ZIndex = 2;
                        TextSize = 9;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIStroke" , {
                        Color = rgb(20, 20, 20);
                        LineJoinMode = Enum.LineJoinMode.Miter;
                        Parent = Items.Keybind
                    });
                -- 
                
                -- Mode Holder
                    Items.KeybindOutline = Library:Create( "Frame" , {
                        Parent = Library.Items;
                        Visible = false;
                        Size = dim2(0, 100, 0, 22);
                        Name = "\0";
                        Position = dim2(0.8264937996864319, 0, 0.33450964093208313, 0);
                        BorderColor3 = rgb(0, 0, 0);
                        BorderSizePixel = 0;
                        AutomaticSize = Enum.AutomaticSize.Y;
                        BackgroundColor3 = rgb(12, 12, 12)
                    });

                    Items.Inline = Library:Create( "Frame" , {
                        Parent = Items.KeybindOutline;
                        Name = "\0";
                        Position = dim2(0, 1, 0, 1);
                        BorderColor3 = rgb(0, 0, 0);
                        Size = dim2(1, -2, 1, -2);
                        BorderSizePixel = 0;
                        BackgroundColor3 = rgb(35, 35, 35)
                    });
                    
                    Library:Create( "UIListLayout" , {
                        Parent = Items.Inline;
                        SortOrder = Enum.SortOrder.LayoutOrder
                    });
                    
                    Items.Toggle = Library:Create( "TextButton" , {
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        TextColor3 = rgb(205, 205, 205);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "Toggle";
                        Parent = Items.Inline;
                        ClipsDescendants = true;
                        AutomaticSize = Enum.AutomaticSize.Y;
                        Size = dim2(1, 0, 0, 0);
                        Name = "\0";
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextSize = 13;
                        BackgroundColor3 = rgb(26, 26, 26)
                    });
                    
                    Library:Create( "UIPadding" , {
                        PaddingTop = dim(0, 5);
                        PaddingBottom = dim(0, 5);
                        Parent = Items.Toggle;
                        PaddingRight = dim(0, 5);
                        PaddingLeft = dim(0, 5)
                    });
                    
                    Items.Hold = Library:Create( "TextButton" , {
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
                        TextColor3 = rgb(205, 205, 205);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "Hold";
                        Parent = Items.Inline;
                        ClipsDescendants = true;
                        AutomaticSize = Enum.AutomaticSize.Y;
                        Size = dim2(1, 0, 0, 0);
                        Name = "\0";
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextSize = 13;
                        BackgroundColor3 = rgb(26, 26, 26)
                    });
                    
                    Library:Create( "UIPadding" , {
                        PaddingTop = dim(0, 5);
                        PaddingBottom = dim(0, 5);
                        Parent = Items.Hold;
                        PaddingRight = dim(0, 5);
                        PaddingLeft = dim(0, 5)
                    });
                    
                    Items.Always = Library:Create( "TextButton" , {
                        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
                        Parent = Items.Inline;
                        TextColor3 = rgb(142, 181, 39);
                        BorderColor3 = rgb(0, 0, 0);
                        Text = "Always";
                        Name = "\0";
                        AutomaticSize = Enum.AutomaticSize.Y;
                        Size = dim2(1, 0, 0, 0);
                        ClipsDescendants = true;
                        BackgroundTransparency = 1;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        BorderSizePixel = 0;
                        ZIndex = 2;
                        TextSize = 13;
                        BackgroundColor3 = rgb(255, 255, 255)
                    });
                    
                    Library:Create( "UIPadding" , {
                        PaddingTop = dim(0, 5);
                        PaddingBottom = dim(0, 5);
                        Parent = Items.Always;
                        PaddingRight = dim(0, 5);
                        PaddingLeft = dim(0, 5)
                    });

                    for _,mode in {"Always", "Toggle", "Hold"} do 
                        Items[mode].TextColor3 = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                        Items[mode].BackgroundTransparency = 0;
                        Items[mode].TextColor3 = rgb(205, 205, 205)

                        Items[mode].MouseButton1Click:Connect(function()
                            for _,extra in {"Always", "Toggle", "Hold"} do
                                Items[extra].TextColor3 = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                                Items[extra].BackgroundTransparency = 0;
                                Items[extra].TextColor3 = rgb(205, 205, 205)
                            end 

                            Items[mode].TextColor3 = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                            Items[mode].BackgroundTransparency = 1;
                            Items[mode].TextColor3 = themes.preset.accent

                            Cfg.Set(mode)
                        end)
                    end 
                --
            end 

            function Cfg.SetMode(mode) 
                Cfg.Mode = mode 

                if mode == "Always" then
                    Cfg.Set(true)
                elseif mode == "Hold" then
                    Cfg.Set(false)
                end

                Flags[Cfg.Flag].Mode = mode
            end

            function Cfg.Set(input)
                if type(input) == "boolean" then 
                    Cfg.Active = input

                    if Cfg.Mode == "Always" then 
                        Cfg.Active = true
                    end
                elseif tostring(input):find("Enum") then 
                    input = input.Name == "Escape" and "NONE" or input
                    
                    Cfg.Key = input or "NONE"	
                elseif table.find({"Toggle", "Hold", "Always"}, input) then 
                    if input == "Always" then 
                        Cfg.Active = true 
                    end 

                    Cfg.Mode = input
                    Cfg.SetMode(Cfg.Mode) 
                elseif type(input) == "table" then
                    input.Key = type(input.Key) == "string" and input.Key ~= "NONE" and Library:ConvertEnum(input.key) or input.Key
                    input.Key = input.Key == Enum.KeyCode.Escape and "NONE" or input.Key

                    Cfg.Key = input.Key or "NONE"
                    Cfg.Mode = input.Mode or "Toggle"

                    if input.Active then
                        Cfg.Active = input.Active
                    end

                    Cfg.SetMode(Cfg.Mode) 
                end 

                Cfg.Callback(Cfg.Active)

                local text = (tostring(Cfg.Key) ~= "Enums" and (Keys[Cfg.Key] or tostring(Cfg.Key):gsub("Enum.", "")) or nil)
                local __text = text and tostring(text):gsub("KeyCode.", ""):gsub("UserInputType.", "")

                Items.Key.Text = __text

                if Items.Keybinds then
                    Items.Keybinds.TextTransparency = 1
                    Library:Tween(Items.Keybinds, {TextTransparency = 0})

                    Items.KeybindsStroke.Transparency = 1
                    Library:Tween(Items.KeybindsStroke, {Transparency = 0})

                    Items.Keybinds.Visible = Cfg.Active
                    Items.Keybinds.Text = string.format("[%s]: %s", __text, Cfg.Name or Cfg.Flag or "Key")
                end 

                Flags[Cfg.Flag] = {
                    mode = Cfg.Mode,
                    key = Cfg.Key, 
                    active = Cfg.Active
                }
            end
            
            function Cfg.SetVisible(bool)
                Items.Fade.BackgroundTransparency = 0
                Library:Tween(Items.Fade, {BackgroundTransparency = 1})

                Items.KeybindOutline.Visible = bool 
                Items.KeybindOutline.Position = dim2(0, Items.KeybindOutline.AbsolutePosition.X + 2, 0, Items.KeybindOutline.AbsolutePosition.Y + 74)
            end

            Items.KeybindOutline.MouseButton1Down:Connect(function()
                task.wait()
                Items.Key.Text = "..."	

                Cfg.Binding = Library:Connection(InputService.InputBegan, function(keycode, game_event)  
                    Cfg.Set(keycode.KeyCode ~= Enum.KeyCode.Unknown and keycode.KeyCode or keycode.UserInputType)
                    
                    Cfg.Binding:Disconnect() 
                    Cfg.Binding = nil
                end)
            end)

            Items.KeybindOutline.MouseButton2Down:Connect(function()
                Cfg.Open = not Cfg.Open 

                Cfg.SetVisible(Cfg.Open)
            end)

            Library:Connection(InputService.InputBegan, function(input, game_event) 
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not (Library:Hovering(Items.Dropdown.Items.DropdownElements) or Library:Hovering(Items.ModeHolder)) then 
                        Items.Dropdown.SetVisible(false)
                        Items.Dropdown.Visible = false

                        Cfg.SetVisible(false)
                        Cfg.Open = false;
                    end 
                end 
                
                if not game_event then
                    local selected_key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType

                    if selected_key == Cfg.Key then 
                        if Cfg.Mode == "Toggle" then 
                            Cfg.Active = not Cfg.Active
                            Cfg.Set(Cfg.Active)
                        elseif Cfg.Mode == "Hold" then 
                            Cfg.Set(true)
                        end
                    end
                end
            end)    

            Library:Connection(InputService.InputEnded, function(input, game_event) 
                if game_event then 
                    return 
                end 

                local selected_key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType
    
                if selected_key == Cfg.Key then
                    if Cfg.Mode == "Hold" then 
                        Cfg.Set(false)
                    end
                end
            end)
            
            Cfg.Set({Mode = Cfg.Mode, Active = Cfg.Active, Key = Cfg.Key})           
            ConfigFlags[Cfg.Flag] = Cfg.Set
            Items.Dropdown.Set(Cfg.Mode)

            return setmetatable(Cfg, Library)
        end
        
        function Library:Button(properties) 
            local Cfg = {
                Name = properties.Name or "TextBox",
                Callback = properties.Callback or function() end,
                 
                -- Other
                Items = {};
            }
            
            local Items = Cfg.Items; do 
                Items.Button = Library:Create( "TextButton" , {
                    FontFace = Library.Font;
                    TextColor3 = rgb(0, 0, 0);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = "";
                    Parent = self.Items.GroupElements or self.Items.Elements;
                    Name = "\0";
                    BackgroundTransparency = 1;
                    Size = dim2(1, 0, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.Y;
                    TextSize = 14;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Items.Outline = Library:Create( "Frame" , {
                    Name = "\0";
                    Parent = Items.Button;
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, 0, 0, 18);
                    BorderSizePixel = 0;
                    BackgroundColor3 = themes.preset.outline
                });	Library:Themify(Items.Outline, "outline", "BackgroundColor3")
                
                Items.Inline = Library:Create( "Frame" , {
                    Parent = Items.Outline;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = themes.preset.inline
                });	Library:Themify(Items.Inline, "inline", "BackgroundColor3")
                
                Items.Background = Library:Create( "Frame" , {
                    Parent = Items.Inline;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -2, 1, -2);
                    BorderSizePixel = 0;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                local gradient = Library:Create( "UIGradient" , {
                    Rotation = 90;
                    Parent = Items.Background;
                    Color = rgbseq{rgbkey(0, themes.preset.inline), rgbkey(1, themes.preset.gradient)}
                }); Library:SaveGradient(gradient, "Selected");
                
                Items.Name = Library:Create( "TextLabel" , {
                    FontFace = Library.Font;
                    TextColor3 = themes.preset.text_color;
                    BorderColor3 = rgb(0, 0, 0);
                    Text = Cfg.Name;
                    Parent = Items.Background;
                    Name = "\0";
                    Size = dim2(1, 0, 1, 0);
                    BackgroundTransparency = 1;
                    Position = dim2(0, 3, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.XY;
                    TextSize = 12;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIStroke" , {
                    Parent = Items.Name;
                    LineJoinMode = Enum.LineJoinMode.Miter
                });                                  
            end 

            Items.Button.MouseButton1Click:Connect(function()
                Items.Name.TextColor3 = rgb(255, 255, 255)
                Library:Tween(Items.Name, {TextColor3 = themes.preset.text_color})
                
                Cfg.Callback()
            end)
            
            return setmetatable(Cfg, Library)
        end

        function Library:Configs(window) 
            local Text;
            local ConfigText; 

            local Tab = window:Tab({Name = "Settings"})

            local Section = Tab:Section({Name = "Main", Side = "Left"})
            ConfigHolder = Section:Dropdown({Name = "Configs", Options = {"Report", "This", "Error", "To", "Finobe"}, Callback = function(option) if Text then Text.Set(option) end end, Flag = "config_Name_list"}); Library:UpdateConfigList()
            window.Tweening = true
            Text = Section:Textbox({Name = "Config Name:", Flag = "config_Name_text", Callback = function(text)
                ConfigText = text
            end})
            window.Tweening = false
            Section:Button({Name = "Save", Callback = function() 
                writefile(Library.Directory .. "/configs/" .. ConfigText .. ".cfg", Library:GetConfig())
                Library:UpdateConfigList()
                Notifications:Create({Name = "Saved Config (" ..  Library.Directory .. "/configs/" .. ConfigText .. ".cfg" .. ")"}) 
            end})

            Section:Button({Name = "Load", Callback = function() 
                Library:LoadConfig(readfile(Library.Directory .. "/configs/" .. ConfigText .. ".cfg"))  
                Library:UpdateConfigList() 
                Notifications:Create({Name = "Loaded Config (" ..  Library.Directory .. "/configs/" .. ConfigText .. ".cfg" .. ")"}) 
            end})

            Section:Button({Name = "Delete", Callback = function() 
                delfile(Library.Directory .. "/configs/" .. ConfigText .. ".cfg")  
                Library:UpdateConfigList() 
                Notifications:Create({Name = "Deleted Config (" ..  Library.Directory .. "/configs/" .. ConfigText .. ".cfg" .. ")"}) 
            end})

            window.Tweening = true
            Section:Label({Name = "Menu Bind"}):Keybind({Name = "Menu Bind", ShowInList = false, Callback = function(bool) 
                if window.Tweening then
                    return 
                end 

                window.ToggleMenu(bool) 
            end, Default = true})

            delay(2, function() window.Tweening = false end)

            local Section = Tab:Section({Name = "Other", Side = "Right"})
            Section:Toggle({Name = "Watermark", Flag = "Watermark", Callback = window.ToggleWatermark})
            Section:Toggle({Name = "Keybind List", Flag = "KeybindList", Callback = window.ToggleKeybindList})
            Section:Toggle({Name = "Toggle Status", Flag = "Status", Callback = window.ToggleStatus})
            Section:Textbox({Name = "Custom Menu Name", Callback = window.ChangeTitle, Default = window.Name, Placeholder = "Title name here..."})
            Section:Textbox({Name = "Custom Watermark Name", Callback = window.ChangeWatermarkTitle, Default = window.Name .. ".lua", Placeholder = "Title name here..."})
            Section:Dropdown({Name = "Tweening Style", Options = {"Linear", "Sine", "Back", "Quad", "Quart", "Quint", "Bounce", "Elastic", "Exponential", "Circular", "Cubic"}, Flag = "LibraryEasingStyle", Default = "Quint", Callback = function(Option)
                Library.EasingStyle = Enum.EasingStyle[Option]
            end});
            Section:Slider({Name = "Tweening Speed", Min = 0, Max = 10, Decimal = 0.01, Suffix = "s", Default = 0.25, Flag = "TweeningSpeed", Callback = function(int)
                Library.TweeningSpeed = int
            end})

            Section:Label({Name = "Inline"}):Colorpicker({Flag = "Inline", Callback = function(color, alpha) 
                Library:RefreshTheme("inline", color) 

                for _,seq in themes.gradients.Selected do 
                    seq.Color = rgbseq{rgbkey(0, themes.preset.inline), rgbkey(1, themes.preset.gradient)}
                end 
            end, Color = themes.preset.inline})

            Section:Label({Name = "Gradient"}):Colorpicker({Flag = "Gradient", Callback = function(color, alpha) 
                Library:RefreshTheme("gradient", color)

                for _,seq in themes.gradients.Selected do 
                    seq.Color = rgbseq{rgbkey(0, themes.preset.inline), rgbkey(1, themes.preset.gradient)}
                end

                for _,seq in themes.gradients.Deselected do 
                    seq.Color = rgbseq{rgbkey(0, themes.preset.gradient), rgbkey(1, themes.preset.background)}
                end
            end, Color = themes.preset.gradient})
            
            Section:Label({Name = "Outline"}):Colorpicker({Flag = "Outline", Callback = function(color, alpha) 
                Library:RefreshTheme("outline", color) 
            end, Color = themes.preset.outline})
            
            Section:Label({Name = "Accent"}):Colorpicker({Flag = "Accent", Callback = function(color, alpha) 
                Library:RefreshTheme("accent", color) 
            end, Color = themes.preset.accent})
            
            Section:Label({Name = "Background"}):Colorpicker({Flag = "Background", Callback = function(color, alpha) 
                Library:RefreshTheme("background", color) 

                for _,seq in themes.gradients.Deselected do 
                    seq.Color = rgbseq{rgbkey(0, themes.preset.gradient), rgbkey(1, themes.preset.background)}
                end
            end, Color = themes.preset.background})
            
            Section:Label({Name = "Text Color"}):Colorpicker({Flag = "Text Color", Callback = function(color, alpha) 
                Library:RefreshTheme("text_color", color) 
            end, Color = themes.preset.text_color})
            
            Section:Label({Name = "Text Outline"}):Colorpicker({Flag = "Text Outline", Callback = function(color, alpha) 
                Library:RefreshTheme("text_outline", color) 
            end, Color = themes.preset.text_outline})
            
            Section:Label({Name = "Background"}):Colorpicker({Flag = "Background", Callback = function(color, alpha) 
                Library:RefreshTheme("tab_background", color) 
            end, Color = themes.preset.tab_background})
            
            

        end
    --

    -- Notification Library
        -- IGNORE: , TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        function Notifications:RefreshNotifications() 
            local offset = 50
            
            for i, v in Notifications.Notifs do
                local Position = vec2(20, offset)
                Library:Tween(v, {Position = dim_offset(Position.X, Position.Y)})
                offset += (v.AbsoluteSize.Y + 10)
            end

            return offset
        end
        
        function Notifications:FadeNotifs(path, is_fading)
            local fading = is_fading and 1 or 0 
            
            Library:Tween(path, {BackgroundTransparency = fading})

            for _, instance in path:GetDescendants() do 
                if not instance:IsA("GuiObject") then 
                    if instance:IsA("UIStroke") then
                        Library:Tween(instance, {Transparency = fading})
                    end
        
                    continue
                end 
        
                if instance:IsA("TextLabel") then
                    Library:Tween(instance, {TextTransparency = fading})
                elseif instance:IsA("Frame") then
                    Library:Tween(instance, {BackgroundTransparency = instance.Transparency and 0.6 and is_fading and 1 or 0.6})
                end
            end
        end 
        
        function Notifications:Create(properties)
            local Cfg = {
                Name = properties.Name or "This is a title!";
                Lifetime = properties.LifeTime or 3;
                
                Items = {};
                outline;
            }

            local Items = Cfg.Items; do 
                Items.Outline = Library:Create( "Frame" , {
                    Parent = Library.Items;
                    Size = dim2(0, 0, 0, 18);
                    Name = "\0";
                    AnchorPoint = vec2(1, 0);
                    Position = dim2(0, 7, 0, 46);
                    BorderColor3 = rgb(0, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundColor3 = rgb(52, 52, 52)
                });
                
                Items.Inline = Library:Create( "Frame" , {
                    Parent = Items.Outline;
                    Name = "\0";
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    BorderSizePixel = 0;
                    AutomaticSize = Enum.AutomaticSize.XY;
                    BackgroundColor3 = rgb(5, 5, 5)
                });
                
                Library:Create( "UIPadding" , {
                    PaddingTop = dim(0, 7);
                    PaddingBottom = dim(0, 6);
                    Parent = Items.Inline;
                    PaddingRight = dim(0, 8);
                    PaddingLeft = dim(0, 4)
                });
                
                Items.Text = Library:Create( "TextLabel" , {
                    FontFace = Library.Font;
                    Parent = Items.Inline;
                    TextColor3 = rgb(255, 255, 255);
                    BorderColor3 = rgb(0, 0, 0);
                    Text = Cfg.Name;
                    Name = "\0";
                    AutomaticSize = Enum.AutomaticSize.XY;
                    Size = dim2(1, -4, 1, 0);
                    Position = dim2(0, 4, 0, -2);
                    BackgroundTransparency = 1;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    BorderSizePixel = 0;
                    ZIndex = 2;
                    TextSize = 12;
                    BackgroundColor3 = rgb(255, 255, 255)
                });
                
                Library:Create( "UIPadding" , {
                    PaddingBottom = dim(0, 1);
                    PaddingRight = dim(0, 1);
                    Parent = Items.Outline
                });
                
                Items.AccentLine = Library:Create( "Frame" , {
                    Parent = Items.Outline;
                    Name = "\0";
                    Position = dim2(0, 2, 1, -1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(1, -1, 0, 1);
                    BorderSizePixel = 0;
                    ZIndex = 100;
                    BackgroundColor3 = themes.preset.accent
                });	Library:Themify(Items.AccentLine, "accent", "BackgroundColor3")
                
                Items.Accent = Library:Create( "Frame" , {
                    Parent = Items.Outline;
                    Name = "\0";
                    ZIndex = 100;
                    Position = dim2(0, 1, 0, 1);
                    BorderColor3 = rgb(0, 0, 0);
                    Size = dim2(0, 1, 1, -1);
                    BorderSizePixel = 0;
                    BackgroundColor3 = themes.preset.accent
                });	Library:Themify(Items.Accent, "accent", "BackgroundColor3")                    
            end 
            
            local index = #Notifications.Notifs + 1
            Notifications.Notifs[index] = Items.Outline

            -- Notifications:FadeNotifs(Items.Outline, false)
            
            local offset = Notifications:RefreshNotifications()

            Items.Outline.Position = dim_offset(20, offset)

            Library:Tween(Items.Outline, {AnchorPoint = vec2(0, 0)})
            Library:Tween(Items.AccentLine, {Size = dim2(0, -2, 0, 1)}, TweenInfo.new(Cfg.Lifetime, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0))

            print(Items.AccentLine.BackgroundTransparency)
            task.spawn(function()
                task.wait(Cfg.Lifetime)
                Notifications.Notifs[index] = nil
                Notifications:FadeNotifs(Items.Outline, true)
                Library:Tween(Items.Outline, {AnchorPoint = vec2(1, 0)})
                task.wait(1)
                Items.Outline:Destroy() 
            end)
        end
    --
-- 

local Window = Library:Window({})

local Tabs = {
    Rage = Window:Tab({Icon = "rbxassetid://8547236654"}),
    Aiming = Window:Tab({Icon = "rbxassetid://8547249956"}),
    Lighting = Window:Tab({Icon = "rbxassetid://8547254518"}),
    Settings = Window:Tab({Icon = "rbxassetid://8547256547"}),
    Skins = Window:Tab({Icon = "rbxassetid://8547258459"}),
    Saving = Window:Tab({Icon = "rbxassetid://107672994153530"}),
    Lua = Window:Tab({Icon = "rbxassetid://83653738255058"}),
}

-- Tabs.Players:PlayerList({}) -- Tabs.Players.GetPriority(player.Name)
local Section = Tabs.Rage:Section({Name = "Anti-aimbot angles", Side = "Left"})

local Toggle = Section:Toggle({Name = "Enabled"})
Toggle:Colorpicker({})

Section:Dropdown({Name = "Pitch", Options = {"None", "Up", "Down"}})
Section:Dropdown({Name = "Yaw base", Options = {"At targets", "Forward", "Backward"}})
Section:Dropdown({Name = "Yaw", Options = {"Static", "Jitter", "Spin"}})

Section:Slider({Callback = function(int) print(int) end, Default = -3})
Section:Textbox({Name = "Hi", Callback = function(a)
    print(a)
end})
Window.ToggleMenu(true)

-- Toggle:Dropdown({Name = "Hello!", Options = {"This is option1", "2", "3"}, Multi = true})

-- for i = 1, 5 do 
--     Toggle = Toggle:Toggle({Name = "Group", Folding = true})
--     Toggle:Toggle({Name = "Toggle"})
--     Toggle:Slider({Name = "Slider", Callback = function(int) print(int) end})
--     Toggle:Dropdown({Name = "Hello!", Options = {"1", "2", "3"}})
-- end


-- local Tab1, Tab2, Tab3 = Tabs.Combat:MultiSection({Tabs = {"Hi", "Hello", "Sick"}, Side = "Right", Size = 1})
-- for _,tab in {Tab1, Tab2, Tab3} do 
--     tab:Toggle({Name = "Toggle"})
--     tab:Slider({Name = "Slider", Callback = function(int) print(int) end})
--     tab:Dropdown({Name = "Hello!", Options = {"1", "2", "3"}})

--     local Toggle = tab:Toggle({Name = "Group", Folding = true})
--     Toggle:Toggle({Name = "Toggle"})
--     Toggle:Slider({Name = "Slider", Callback = function(int) print(int) end})
--     Toggle:Dropdown({Name = "Hello!", Options = {"1", "2", "3"}})

--     for i = 1, 5 do 
--         Toggle = Toggle:Toggle({Name = "Group", Folding = true})
--         Toggle:Toggle({Name = "Toggle"})
--         Toggle:Slider({Name = "Slider", Callback = function(int) print(int) end})
--         Toggle:Dropdown({Name = "Hello!", Options = {"1", "2", "3"}})
--         Toggle:Textbox({Name = "Textbox", Default = "hELLO!", Callback = function(Text) print(Text) end})
--     end
-- end


-- Library:Configs(Window)

-- for index, value in themes.preset do 
--     pcall(function()
--         Library:RefreshTheme(index, value)
--     end)
-- end
