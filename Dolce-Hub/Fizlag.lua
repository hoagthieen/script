repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Remove old GUI
pcall(function()
    if getgenv().kc then getgenv().kc:Destroy() end
end)

local blur = Instance.new("BlurEffect")
blur.Name = "FixLag_Blur"
blur.Size = 0
blur.Parent = Lighting

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FixLagConfirm_" .. math.random(1000, 9999)
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
getgenv().kc = ScreenGui

-- Main Frame
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 320, 0, 180)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BackgroundTransparency = 0.1
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = Main

local Border = Instance.new("UIStroke")
Border.Thickness = 1.5
Border.Color = Color3.fromRGB(220, 220, 220)
Border.Transparency = 0.4
Border.Parent = Main

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 32)
Title.Position = UDim2.new(0.5, 0, 0, 18)
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "FIX LAG"
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = Main

-- Underline
local Underline = Instance.new("Frame")
Underline.Size = UDim2.new(0, 70, 0, 1)
Underline.Position = UDim2.new(0.5, 0, 0, 52)
Underline.AnchorPoint = Vector2.new(0.5, 0)
Underline.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
Underline.BorderSizePixel = 0
Underline.Parent = Main

-- Question
local Question = Instance.new("TextLabel")
Question.Size = UDim2.new(1, -40, 0, 30)
Question.Position = UDim2.new(0.5, 0, 0, 70)
Question.AnchorPoint = Vector2.new(0.5, 0)
Question.BackgroundTransparency = 1
Question.Font = Enum.Font.Gotham
Question.Text = "Do you want to enable Fix Lag?"
Question.TextSize = 15
Question.TextColor3 = Color3.fromRGB(210, 210, 210)
Question.Parent = Main

-- Yes Button
local YesBtn = Instance.new("TextButton")
YesBtn.Name = "Yes"
YesBtn.Size = UDim2.new(0, 120, 0, 36)
YesBtn.Position = UDim2.new(0, 28, 1, -52)
YesBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.Text = "YES"
YesBtn.TextSize = 14
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextColor3 = Color3.fromRGB(12, 12, 12)
YesBtn.AutoButtonColor = false
YesBtn.Parent = Main

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 8)
YesCorner.Parent = YesBtn

-- No Button
local NoBtn = Instance.new("TextButton")
NoBtn.Name = "No"
NoBtn.Size = UDim2.new(0, 120, 0, 36)
NoBtn.Position = UDim2.new(1, -148, 1, -52)
NoBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
NoBtn.Text = "NO"
NoBtn.TextSize = 14
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
NoBtn.AutoButtonColor = false
NoBtn.Parent = Main

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 8)
NoCorner.Parent = NoBtn

local NoStroke = Instance.new("UIStroke")
NoStroke.Thickness = 1
NoStroke.Color = Color3.fromRGB(180, 180, 180)
NoStroke.Transparency = 0.5
NoStroke.Parent = NoBtn

-- Hover
YesBtn.MouseEnter:Connect(function()
    TweenService:Create(YesBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(230, 230, 230)}):Play()
end)
YesBtn.MouseLeave:Connect(function()
    TweenService:Create(YesBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)

NoBtn.MouseEnter:Connect(function()
    TweenService:Create(NoBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
end)
NoBtn.MouseLeave:Connect(function()
    TweenService:Create(NoBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
end)

-- Animation in
Main.Size = UDim2.new(0, 0, 0, 0)
Main.BackgroundTransparency = 1
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 180),
    BackgroundTransparency = 0.1
}):Play()
TweenService:Create(blur, TweenInfo.new(0.4), {Size = 12}):Play()

-- Result
local confirmed = false
local finished = false

YesBtn.MouseButton1Click:Connect(function()
    confirmed = true
    finished = true
    TweenService:Create(Main, TweenInfo.new(0.25), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(blur, TweenInfo.new(0.25), {Size = 0}):Play()
    task.wait(0.3)
    ScreenGui:Destroy()
    blur:Destroy()
end)

NoBtn.MouseButton1Click:Connect(function()
    confirmed = false
    finished = true
    TweenService:Create(Main, TweenInfo.new(0.25), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(blur, TweenInfo.new(0.25), {Size = 0}):Play()
    task.wait(0.3)
    ScreenGui:Destroy()
    blur:Destroy()
end)

-- Wait for choice
repeat task.wait() until finished

if not confirmed then
    return -- User chose NO
end
--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

([[This file was protected with Xhider Obfuscator]]):gsub(".+",function(c)_Sr9gr5b=c end)return(function()local o,C do local c=math.floor local E=string.char local Q=string.byte local function P(E,Q)local P=0x0 for r=0x0,0x7,0x1 do local f=E/0x2+Q/0x2 if f~=c(f)then P=P+0x2^r end E=c(E/0x2)Q=c(Q/0x2)end return P end local r={0x85;0x64;0x60;0x7F}local function f(E,P)local r={}local f=0x1 local w=#E while f<=w do local P=0x0 local u=0x5 if f+0x4>w then u=(w-f)+0x1 for c=0x1,u,0x1 do P=P*0x55+(Q(E,(f+c)-0x1)-0x21)end for c=u+0x1,0x5,0x1 do P=P*0x55+0x54 end else for c=0x0,0x4,0x1 do P=P*0x55+(Q(E,f+c)-0x21)end end local q=c(P/0x1000000)%0x100 local D=c(P/0x10000)%0x100 local d=c(P/0x100)%0x100 local g=P%0x100 r[#r+0x1]=q r[#r+0x1]=D r[#r+0x1]=d r[#r+0x1]=g f=f+(u==0x5 and 0x5 or u)end for c=0x1,P,0x1 do r[#r]=nil end return r end local w=([=[XHD:X(5Ufd0p<iV#gr:i'\A&p-]H$l4=+=nGrc"ndQ9LV*##!i;jQuap&%Wp'1U+l5"q]@"7>['H2X8@"7EpA70n;A70oI#S.L@D0008LLaeAKk/haKd'oSKk+S@O(;XJMI^+ERq,oVU1@Y]a^ee/h.0oCi+-5Fnml-X"Ctni$=mOo&nGC",@k23.V)q:7q?"W6=aJR<FfKe?"@>mB4PD"C1L_%H":<4J7W,<P%A$NUh*q`WF]Ie`FWG,cXgL6h.9uDi+6;GlXaIRs(,Sf%qT-u*+`N-2.^0F7qH(X8S):Z?"IDn=CkliD.R+)I:Zf9JnAD?\Ro6!gLaiCmq,sWnRc0Y"D2%k%;'!t&8#="-Y?b9-tZk:4D%uN4(_lM9P.[^=(Yii?=mSpD.[1*EFrU.L1anDNFuXKRqH,YZtEcr_.R/*e7W0=dq<'<g1OfCm:TgVoOhQ]s(>_h#%q=n$>3arEb8\]YiY]FTF#+uKOeJcd29^aoRKmjLLaeq7$rGTj_aX]KKQMW=1ce]a,ZJ;3g#&bLLafUKOeI\S0o8OKOeIr8Tal9=f`JuOCV`pOCVahL1F\eH(iUL<rU%-JRi/`fH3[X>5,b$J7N&j/su7^X"[0%KOi#kK4JA\ZH5u"KOf<t699)AKObmj8dOHp5#9\29+'8%/u#SA?CJW90V-eZ:s!=PQ:*L[+K#gCFWpht!N>bW@/ikKqc7U)Jn/6p&=f[<OR6VLNFZE&LsUbnNR!HPN+?<%h&R7M=Y=rhO(;W(I49R`9@fN$NauN'!R>p/+Q2Xi.XZ*bkolReLLafULLad_7'k;*5Xk]%'6d*>M.C"G1<=,J=J9Q6=cpAKQ9!flLLafUL1F[^;JiN"gcApo,)OdO*)^A"DMZ&tLLafUJRi.YYHP:sCAZGLLh'ngdNN.kJRi/`pn7d_hX_ek6Q'FdP<"TXKOi/oMe$4dABT_`KOgK@Nq]X2KOg4:<I!D=0cf;W:J8m_=<"kK$(?QDBk:\BLLae`1m=]:KOeJ\MI^+cl3fALLLad_$pg3Dbr?60LLah`N+?;t_Je+5nO6G86tB[>R,b3BLLagdga'G#Q"4:*p&,f\PLt'7KOi>tP[n0m&SI!WKOdhJB<HO9KOh?Z,ITsH&lPmM+s>/g+CnkMot0LbLLagdeJ>9WQXjL,;kgJI['=f1KOiQ%P[n0mnJ7MJKOheeFf$D>KOe2V9RUhdB/$@'%kZ0d+CnkMqbKVULLagd-5HHKQ=OC+"M4lil'-5EKOekgP[n0mFa-1-KOemh!s+A:KOgaIAOgNC0fT8@^S)K%3b2V4/mFI6LLakaO^qjiOCVao?'t_`O^qi$1-gkiP@S&&$,Ekd%+oWkP%7sq]SI#eSRc+0oN5/YNp*"/JRi8\LLaegLLaksJ%8b7HrXCBG4;mNF&fg*_M7e\3b2XP&22:(6tB]$LLah`O(;W"YrIMEEG/T7Y%:uTG\fF:LLagdiVAS*S7H$1k%oY$,+$1&KOb7VP[n0m:=;SeKOcT'ZrP-%KOc*pD&/@C,N(`&R(`qcO_%oj`u1qRLLagd-]eb,T4D?4\.?I.#k^.4KOiH"P[n0mLp3Q.KOepiU0iQ/KOjSDM(]WOnff['8`<r4O_%ojCp"PLLLagdIrTM!Sn)63%_7#>d3SbJKOh?XP[n0mEpQrbKOcf-O5#EFKOcL&$B>I#n0mJ;QdgpNO_%ojqI'Z*LLagdMD'1DR:K^.!K0q/.aBEtKOf:sP[n0mY\N:UKOh>X>e<8WKOjnMendWZ?AZ//?n2@;O_%ojr+s!@LLagd/P%=\Qt0U-."`Gi\)EV.KOd9:P[n0m(OGu7KOdG?n0Yg(KOeYc<Gg5ms8;_!n8d#9XCYcR^&`YXLLakaRq,oYk;@B$3-:CTP%7sqE(!EjSRc+0in)oK']M$HJRi8\LLaegLLaks)&DGf*h,-\r0;dD9[C]3@tU4GXCYenmrP4!Y%;":LLah`NFZDuoNIMckjoWK!+fOP25)(eLLagdSmcH*RUfg/<\PiOn?I&jKObpiP[n0m]-(Y?KOc)n.$R$RKOjMB2BV[#nDZIGPGO^*lXaHoiSPrWLLagdGF54sV.<u:eU6`8B,,1;KObF[P[n0m>NilYKOi%loGDl0KOe/UZWHO$a3Ka`#'-7llXaHo:>i@PLLagd@<G;7Uh!l9mfmjbmt-GQKOg17P[n0mo3462KOeI\LTpd6KOgaI'a.KCR<6NfU\93qlXaHoj[eF-LLagdW*X,,Vds2<-)i-@lKU^lKOeM]P[n0m;0%6DKOj[EJJMnSKOh'R\gZ<?3CQ#8*f$OK#%_0V)8B4JLLakaRq,oY_pE*:[WLGtP%7sqhD$ROSRc+0D)+!57*#%tJRi8\LLaegLLaksF81aH1+id&\@*^q#Vg_\V;?Jn#%_2rai*=;!+fQ6LLah`Jn/6jQ3fHTaiI.53b;\5Ad6GSLLagdRg<,dVIX);::E:9NWnM"KOg=;P[n0m0*Ma>KOci.R=676KOfh/PluJA+o>lh9i'Y(/S/<[X>^]dLLagd;,=0]Tk%Q6['PtJn:![ZKOgF>P[n0m"HNW?KOcu2RhUG0KOiN&;jcZR8Hu5$F^VL43+ZJ3fTTpCLLakaTk%Q$TO_FL+iAGmP%7sqrUQtYSRc+0Sb[m%QZPKgJRi8\LLaegLLaksa_76s_>^j618X.F<d33M1@;qS3+ZLOn1q">3b;]pLLah`NauN!?qY$9K>YnjCh6ug22+VtLLagdj4lniNauP#Q\]5)bY&l1KOgRBP[n0m'Br6IKOfd,K;fUAKOgaI*tuFs)%+>gkBmXp@V&p]HWtEaLLakaUL[bL2VVa]G`c@'P%7sqlG`4^SRc+0O:VodbZ3PrJRi8\LLaegLLakso!,CM90X5a/?dV9fGeJWomR`R@V&s$2q&F9Ch7"<l3f]-kBg<,m:9T9N;^,RJRi/``e$TO/B)LsU1@Z7G6_F*\e_s7KOhfeX^kh1kuPm]KOcZ)VDIJmKOdHA#4XlaLa+cMAKf`sXCP_7JRi/3h<f9RY@M$@-[G>a0;@p<*'j;NY@^SdKOeqiY%1q2J=%J8KOi:s`ISr`KOjA>Q4e]Z+):-+O):hcLh'ngC8!/RLLaeqmTgd`K@R,$bt'ij]OkQALLae`J(J55KOeJ\MI^+cOTlo0LLad_c#@:Z:820eWFTD3O\^)`5Vh/cW+9;2e51e^I'56"KOeJn:g($SA6;KrAt+lhPdg.PX(5V.W+9;2muj"$/H+Y*LLaeqPbU.gQ]nkL=9<PNP<8A9Ef1T2@"^,7*[fXm+R*O1p(e;QQ1b`PF1a6]])@dfQY'V:ZUmHYL1F\^M.BuqBM,L7GB?#+11jo.N4]kh`b",!JRi/`B$\gs8Mi,kWaoM?`RV?Im*f%lKOj\EX^kh1@&R_oKOk'P(%^)6KOhQ`Ch,eK\B%%?(^N@X%:$oCLLafUKOeI\(1tO]KOeJ\[:E[8Zt*R>_'j)h[q&kJV09B5;g*&K[U`d9[U`d9[U`dKS./9G9BF`r4S'V$01t"=nQf4lKOeJ\Z".74Y[h.:IZj#eZXdGF\Q2`MWHfM[KOeJ\Z=I@5Y[h.:8o/74ZXdGF`Xbc_IrV*VKOeJ\]jtN@Zt*R>W)"(s[q&kJ<:1po0TSPj[U`d9[U`d9[U`dK@:.=3$];Hc"Gpl#='I[(/aXORKOeJ\]OYE?^LU^khA7Z;KOeJ\^1:WAZt*R>3$<+/[q&kJeW\YMT'WeR[U`d9[U`d9[U`dK+d0CfQhrb6_"3n"Zs$WPKVPE?KOeJ\\R]*<Zt*R>KM)WA[q&kJ[KdT4dg![Z[U`d9[U`d9[U`dKdo*F%FrG[unAM/1%tH,K#Q5..KOeJ\\7B!;Zt*R>ik4iP[q&kJo_ERmP<cXJ[U`d9[U`d9[U`dK1K8#=8mV%['JS'EBm\kZT8B\GKOeJ\]4>:ToM-GHmCDK86EEUO11jo9ULK9N;5kc(c_'\UY@TAW\n#1SEj)>Z_-s[?`FN?^'oK47W\"(<`+36]_+rf*abO`'a(/Q`"d1V[.;VnP`aiH_GFR/&Kchk8_.6pZ"RF)Iqft0(FM6D[.PmumLLafUKOeI\ncFrLKOeJ\JRi/`YDZeY^gpgS(QJLtk$,K(J-[bbEb8\n.n$e8L1F\e]hC?K?h79fJRi/`$NYrSbkA<3_dm/X6P2')4QZ.iKOb4UK4JA\/%)>3KOdnL^SZ21KOjPC\S@[Q0!s*1pC"[dG2''hISKiLa?A,=n+VgE"t9/r<q\YI.@@OT*k/]6A)p!QEb8]$'l)`XJ7N&;o`kL2l"+:QKk+S6Kk+R)l3.;!nJ2ECiacSLKk(E0kQ,'uKk+R-nIQ6?^Iq?5j;/LKiuLl9ob:1naU'mtb$7b>pB;@_Jn/8=bn(R"_>t@#NFZFHd/b'ln.l09KkXqEKe`rCn-'4]irTB(nJ>SZKk+REj;&F<Kl(4IKerf>nI5R6i"odKKk+RBmN#\XKk+ROn-BFcpC.?DnRQ0[Kk(Z3r=E@VKk+RNi"..Pp'1a5i<9]!p17]_Kk+S<Kk+REj;&GZL1F\AbSMFPJ7N&;cjC'jlXX[YKk)AKp&QigpCL_VKk+RHj:DJ(lidfIJRi/<^^:ehKkXqEKf9GPl4=4Sklh_.lj$pEKk+R!j9?#2KjnG>KaeM#i"d#VMI^+EeHHQnlj!q;^^1;TnGs8PJ7N&;ed2j$i+-POKk)J7o`u':ljF;QNFZFHeeA,omK`t)Kj\;<Kd$g4i+-JMKk)JAj9?#2iFH_RKk)A@l3e%^irTB(nRQBaKk)A@n.m;firK5iKm$jRKcgO0nI.&g_[Qb_i?8CCi!0sGLh'nCee&BDj;empirTB(nRQ3\Kk)GIjol0CJn/8=d/b'ln.l1WKk+S@KjnG>Kerf>i!L0JNauOId/amgec?Bilj!]DO(;XJ_>t?%i"d(DjoJjcKk+RPirTB(nJ=GPlk][CklDE(ecug'oajAWV)K,/joH,(it2\5r'UZ'p&tL2huH#lQt0TSV$.M@i"-Q/W^I".irK5ip.@S$i"-S<lN7f-^LUu,Kk)bRp(m`Hi+-DKKk(`(lj=GVNFZFHnI$!<pC.TLKk=_BKjI#oNFZFHaUJIknI5sFKkt.HKd%$E`X<1dpLIlcKk)D>kmJ+tKk"M?K`VkukVaeOKUZA!Kk+eFKk)MAiZSdNKj\;<Ka@bfm:9aWKk(GriW3G2Kk+ROl2rgMj;&GZJn/8=`!HJ\i!L0JO(;XJ`tesum19aGp(q.`Kk+S@P[n0O`X<1dpGW?nit+F<l4=X@k[\R\Kk)D>kmJ+Tm0s7-g+X$JKkb"FKe!lGi<p/*`!HJ\i!L0JNFZFHaq5=$lj<n)K_YsY+_N"#g7?eXf;)n?Fm'cTojhHXa0hDQ]h1IQL*`>(f9K0^KkDU/7f48e@3f6*Kk+REklh/-bQ)$'Kk+R-nIQ6?^Iq?>ljsF0k=PgfkY!`G_$pkjc3t4!W\G2'kt;X1nk0T6itkK-hus5lWX/\AlUs&Nl3[bZj9naIoaNMb^^:/Ti;k22r$DRYJ7N&;kl:klompX]J*%.?%>/2!J+*dV*p*t]=])local u=f(string.sub(w,0x5),0x1)local q={}o=setmetatable({},{__index=q;__metatable=nil})function C(c)local Q=q if not Q[c]then local f=c+0x1 local w=((P(u[f],r[0x1])+P(u[f+0x1],r[0x2])*0x100)+P(u[f+0x2],r[0x3])*0x10000)+P(u[f+0x3],r[0x4])*0x1000000 f=f+0x4 local q={}for c=0x1,w,0x1 do local Q=(c-0x1)%0x4+0x1 q[c]=E(P(u[(f+c)-0x1],r[Q]))end Q[c]=table.concat(q)end return c end end if _Sr9gr5b~=o[C(0x0)]then return end local c,E,Q,P,r,f,w,u,q,D,d,g,I,N,Z,m,b,O,j,h,M,X j=string[o[C(0x32)]]Z=function()Q=O(0x1,0x3)h={}for c=0x0,Q-0x1,0x1 do h[c+0x1]=O(N+c*0x3,0x3)end N=N+Q*0x3 b=O(N,0x3)for c=0x0,b-0x1,0x1 do u[c+0x1]=O((N+0x3)+c*0x4,0x4)end N=(N+b*0x4)+0x6 m=O(N-0x3,0x3)f=N+m*0x4 end M=function(Q,r,D,d)local g={[0x0]=d}local I={}local Z=0x0 local m,b,j,M,U,W b=N+(Q-0x1)*0x4 m=P[b]while true do j=true while m==0xA8 do if Z>0x0 then M=I[Z]else M=nil end I=I[0x0]Z=I[o[C(0x3A)]]+0x1 I[Z]=M Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xEC do I=I[0x0]Z=I[o[C(0x3A)]]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xFD do I[Z+0x1]=false Z=Z+0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xDB do M=g for c=0x1,P[b+0x3],0x1 do M=M[0x0]end I[Z+0x1]=M[O(b+0x1,0x2)]Z=Z+0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xE1 do Z=Z-0x1 I[Z],I[Z+0x1]={I[Z](w(I[Z+0x1]))},nil Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x55 do Z=Z+0x1 I[Z]=E(h[O(b+0x1,0x3)],D,g)Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x2A do I[Z-0x1]=I[Z-0x1]..I[Z]I[Z]=nil Z=Z-0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xD2 do M=g for c=0x1,P[b+0x3],0x1 do M=M[0x0]end M[O(b+0x1,0x2)]=I[Z]I[Z]=nil Z=Z-0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x6B do g={[0x0]=g}Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x6F do I={[0x0]=I[0x0]}Z=0x0 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xBC do I[Z+0x1]=I[Z]Z=Z+0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xE2 do I[Z]=I[Z-0x1][I[Z]]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x22 do I[Z]=not I[Z]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xDC do I[Z]=D[I[Z]]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x38 do Z=Z-0x1 I[Z+0x1]=nil Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x4A do if I[Z]then Q=O(b+0x1,0x3)-0x1 end I[Z]=nil Z=Z-0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x7D do Z=Z-0x1 I[Z],I[Z+0x1]=I[Z][I[Z+0x1]],nil Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x60 do return{}end while m==0x98 do M=g for c=0x1,P[b+0x3],0x1 do M=M[0x0]end M[O(b+0x1,0x2)]=I[Z-0x1][I[Z]]I[Z]=nil Z=Z-0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x11 do M,I[Z]=I[Z],nil for c,E in ipairs(M)do I[Z]=E Z=Z+0x1 end Z=Z-0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x64 do Z=Z-0x2 I[Z][I[Z+0x1]]=I[Z+0x2]I[Z+0x1],I[Z+0x2]=nil,nil Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xA2 do M=O(b+0x1,0x2)I[Z],I[Z-M]=I[Z-M],I[Z]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x9 do I[Z]=#I[Z]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x20 do I[Z]=I[Z][0x1]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x56 do Z=Z+0x1 I[Z]={}Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x12 do I[Z+0x1]=nil Z=Z+0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x2F do M=I[Z]U={M[0x1](M[0x2],M[0x3])}if U[0x1]~=nil then M[0x3]=U[0x1]Z=Z+0x1 I[Z]=U g={[0x0]=g}Q=Q+0x1 end Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x96 do I[o[C(0x3A)]]=Z Z=0x0 I={[0x0]=I}Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xE3 do W=O(b+0x1,0x3)Z=Z+0x1 I[Z]=q[W]if not I[Z]then M=u[W]+f U=P[M]if U==0x0 then U=O(M+0x1,0x4)I[Z]=o[C(0x3F)]for c=0x1,U,0x1 do I[Z]=I[Z]..X(P[(M+c)+0x4])end elseif U==0x3 then I[Z]=c(M+0x1)elseif U==0x1 then I[Z]=O(M+0x1,0x4)elseif U==0x2 then I[Z]=-O(M+0x1,0x4)end q[W]=I[Z]end Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x30 do Q=O(b+0x1,0x3)-0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xD1 do M={}for c,E in ipairs(I)do M[c]=E end Z=0x1 I={[0x0]=I[0x0],[0x1]=M}Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x34 do I[o[C(0x3A)]]=Z I={[0x0]=I,[0x1]=I[Z]}Z=0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0x77 do I[Z+0x1]=true Z=Z+0x1 Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end while m==0xA5 do g=g[0x0]Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]j=false end if j then Q=Q+0x1 b=N+(Q-0x1)*0x4 m=P[b]end end end D=math[o[C(0x43)]]d=function()P=I(P)Z()return(E(h[0x1],g()))()end O=function(c,E)local Q=0x0 local r=0x1 for E=0x0,E-0x1,0x1 do Q=Q+P[c+E]*r r=r*0x100 end return Q end h={}P=o[C(0x4C)]g=getfenv or function()return _ENV end u={}q={}c=function(c)local E={}for Q=0x0,0x7,0x1 do E[Q+0x1]=P[c+Q]end local Q=0x1 local f=E[0x2]%0x10 for c=0x3,0x8,0x1 do f=f*0x100+E[c]end if E[0x1]>0x7F then Q=-1 end local w=(E[0x1]%0x80)*0x10+D(E[0x2]/0x10)if w==0x0 then return 0x0 end f=(r(f,-52)+0x1)*Q return r(f,w-0x3FF)end r=math[o[C(0x1138)]]N=0x4 X=string[o[C(0x1141)]]E=function(c,E,Q)return function(...)return w(M(c,{...},E,Q))end end I=function(c)local E={}for Q=0x1,#c,0x1 do E[Q]=j(c,Q)end return E end w=table and table[o[C(0x1149)]]or unpack return d()end)()
