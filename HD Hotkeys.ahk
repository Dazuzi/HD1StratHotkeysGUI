/*
Helldivers Stratagem AutoHotkey v2 script with GUI
Version 1.0

https://github.com/Dazuzi/HD1StratHotkeysGUI
*/

;@Ahk2Exe-SetName Helldivers Stratagem Hotkeys
;@Ahk2Exe-SetDescription Helldivers Stratagem AutoHotkey v2 script with GUI
;@Ahk2Exe-SetFileVersion 1.0.0.0

#Requires Autohotkey v2
#SingleInstance Force
#NoTrayIcon

StratagemArray	:= [{Category:"No Stratagem", Name:"No Stratagem", Icon:"No Stratagem.png", Throwable:False, Keys:[]},																	;1 = Up, 2 = Down, 3 = Left & 4 = Right
{Category:"Supply: Support",			Name:"Resupply",						TTSName:"Resupply",						Icon:"Resupply.png",						Throwable:True,	Keys:[2, 2, 1, 4]},
{Category:"Supply: Support",			Name:"REP-80",							TTSName:"REP 80",						Icon:"REP-80.png",							Throwable:True,	Keys:[2, 2, 3, 4, 2]},
{Category:"Supply: Backpacks",			Name:"AD-289 Angel",					TTSName:"Angel",						Icon:"AD-289 Angel.png",					Throwable:True,	Keys:[2, 1, 3, 3, 4, 2]},
{Category:"Supply: Backpacks",			Name:"AD-334 Guard Dog",				TTSName:"Guard Dog",					Icon:"AD-334 Guard Dog.png",				Throwable:True,	Keys:[2, 1, 3, 1, 4, 2]},
{Category:"Supply: Backpacks",			Name:"LIFT-850 Jump Pack",				TTSName:"Jump Pack",					Icon:"LIFT-850 Jump Pack.png",				Throwable:True,	Keys:[2, 1, 1, 2, 1]},
{Category:"Supply: Backpacks",			Name:"Resupply Pack",					TTSName:"Resupply Pack",				Icon:"Resupply Pack.png",					Throwable:True,	Keys:[2, 1, 2, 2, 4]},
{Category:"Supply: Backpacks",			Name:"SH-20 Shield Generator Pack",		TTSName:"Shield Generator Pack",		Icon:"SH-20 Shield Generator Pack.png",		Throwable:True,	Keys:[2, 1, 3, 4, 3, 4]},
{Category:"Supply: Backpacks",			Name:"SH-32 Directional Kinetic Shield",TTSName:"Directional Kinetic Shield",	Icon:"SH-32 Directional Kinetic Shield.png",Throwable:True,	Keys:[2, 1, 3, 4, 3, 2]},
{Category:"Supply: Secondary Weapons",	Name:"AC-22 Dum-Dum",					TTSName:"Dum-Dum",						Icon:"AC-22 Dum-Dum.png",					Throwable:True,	Keys:[2, 3, 2, 1, 1, 4]},
{Category:"Supply: Secondary Weapons",	Name:"EAT-17",							TTSName:"E A T 17",						Icon:"EAT-17.png",							Throwable:True,	Keys:[2, 3, 4, 1, 2]},
{Category:"Supply: Secondary Weapons",	Name:"FLAM-40 Incinerator",				TTSName:"Incinerator",					Icon:"FLAM-40 Incinerator.png",				Throwable:True,	Keys:[2, 3, 2, 4, 3]},
{Category:"Supply: Secondary Weapons",	Name:"LAS-98 Laser Cannon",				TTSName:"Laser Cannon",					Icon:"LAS-98 Laser Cannon.png",				Throwable:True,	Keys:[2, 3, 2, 1, 3]},
{Category:"Supply: Secondary Weapons",	Name:"M-25 Rumbler",					TTSName:"Rumbler",						Icon:"M-25 Rumbler.png",					Throwable:True,	Keys:[2, 3, 1, 3, 3]},
{Category:"Supply: Secondary Weapons",	Name:"MG-94 Machine Gun",				TTSName:"M G 94 Machine Gun",			Icon:"MG-94 Machine Gun.png",				Throwable:True,	Keys:[2, 3, 2, 1, 4]},
{Category:"Supply: Secondary Weapons",	Name:"MGX-42 Machine Gun",				TTSName:"MGX-42 Machine Gun",			Icon:"MGX-42 Machine Gun.png",				Throwable:True,	Keys:[2, 3, 2, 1, 1, 3]},
{Category:"Supply: Secondary Weapons",	Name:"MLS-4X Commando",					TTSName:"Commando",						Icon:"MLS-4X Commando.png",					Throwable:True,	Keys:[2, 3, 1, 2, 4]},
{Category:"Supply: Secondary Weapons",	Name:"Obliterator Grenade Launcher",	TTSName:"Obliterator Grenade Launcher",	Icon:"Obliterator Grenade Launcher.png",	Throwable:True,	Keys:[2, 3, 1, 3, 2]},
{Category:"Supply: Secondary Weapons",	Name:"REC-6 Demolisher",				TTSName:"Demolisher",					Icon:"REC-6 Demolisher.png",				Throwable:True,	Keys:[2, 3, 4, 1, 1]},
{Category:"Supply: Secondary Weapons",	Name:"RL-112 Recoilless Rifle",			TTSName:"Recoilless Rifle",				Icon:"RL-112 Recoilless Rifle.png",			Throwable:True,	Keys:[2, 3, 4, 4, 3]},
{Category:"Supply: Secondary Weapons",	Name:"TOX-13 Avenger",					TTSName:"Avenger",						Icon:"TOX-13 Avenger.png",					Throwable:True,	Keys:[2, 3, 2, 4, 4]},
{Category:"Supply: Vehicles",			Name:"EXO-44 Walker Exosuit",			TTSName:"Walker Exosuit",				Icon:"EXO-44 Walker Exosuit.png",			Throwable:True,	Keys:[2, 4, 1, 3, 2, 2]},
{Category:"Supply: Vehicles",			Name:"EXO-48 Obsidian Exosuit",			TTSName:"Obsidian Exosuit",				Icon:"EXO-48 Obsidian Exosuit.png",			Throwable:True,	Keys:[2, 4, 1, 3, 2, 3]},
{Category:"Supply: Vehicles",			Name:"EXO-51 Lumberer Exosuit",			TTSName:"Lumberer Exosuit",				Icon:"EXO-51 Lumberer Exosuit.png",			Throwable:True,	Keys:[2, 4, 1, 3, 2, 4]},
{Category:"Supply: Vehicles",			Name:"M5 APC",							TTSName:"APC",							Icon:"M5 APC.png",							Throwable:True,	Keys:[2, 4, 2, 3, 3, 4]},
{Category:"Supply: Vehicles",			Name:"M5-32 HAV",						TTSName:"HAV",							Icon:"M5-32 HAV.png",						Throwable:True,	Keys:[2, 4, 2, 3, 1, 2]},
{Category:"Supply: Vehicles",			Name:"TD-110 Bastion",					TTSName:"Bastion",						Icon:"TD-110 Bastion.png",					Throwable:True,	Keys:[2, 4, 2, 3, 1, 4]},
{Category:"Supply: Vehicles",			Name:"MC-109 Hammer Motorcycle",		TTSName:"Hammer Motorcycle",			Icon:"MC-109 Hammer Motorcycle.png",		Throwable:True,	Keys:[2, 4, 2, 3, 3, 1]},
{Category:"Defensive",					Name:"A/AC-6 Tesla Tower",				TTSName:"Tesla Tower",					Icon:"AAC-6 Tesla Tower.png",				Throwable:True,	Keys:[3, 2, 2, 1, 4, 3]},
{Category:"Defensive",					Name:"A/GL-8 Launcher Turret",			TTSName:"Launcher Turret",				Icon:"AGL-8 Launcher Turret.png",			Throwable:True,	Keys:[3, 2, 1, 4, 4, 2]},
{Category:"Defensive",					Name:"A/MG-11 Minigun Turret",			TTSName:"Minigun Turret",				Icon:"AMG-11 Minigun Turret.png",			Throwable:True,	Keys:[3, 2, 1, 4, 3]},
{Category:"Defensive",					Name:"A/RX-34 Railcannon Turret",		TTSName:"Railcannon Turret",			Icon:"ARX-34 Railcannon Turret.png",		Throwable:True,	Keys:[3, 2, 1, 3, 4]},
{Category:"Defensive",					Name:"Airdropped Anti-Personnel Mines",	TTSName:"Anti-Personnel Mines",			Icon:"Airdropped Anti-Personnel Mines.png",	Throwable:True,	Keys:[3, 4, 2, 1]},
{Category:"Defensive",					Name:"Airdropped Stun Mines",			TTSName:"Stun Mines",					Icon:"Airdropped Stun Mines.png",			Throwable:True,	Keys:[3, 4, 1, 2]},
{Category:"Defensive",					Name:"Anti-Personnel Barrier",			TTSName:"Anti-Personnel Barrier",		Icon:"Anti-Personnel Barrier.png",			Throwable:True,	Keys:[3, 4, 2, 2, 4]},
{Category:"Defensive",					Name:"AT-47 Anti-Tank Emplacement",		TTSName:"Anti-Tank Emplacement",		Icon:"AT-47 Anti-Tank Emplacement.png",		Throwable:True,	Keys:[3, 3, 1, 1, 4, 3]},
{Category:"Defensive",					Name:"Distractor Beacon",				TTSName:"Distractor Beacon",			Icon:"Distractor Beacon.png",				Throwable:True,	Keys:[3, 2, 4]},
{Category:"Defensive",					Name:"Humblebee UAV drone",				TTSName:"Humblebee UAV drone",			Icon:"Humblebee UAV drone.png",				Throwable:True,	Keys:[3, 1, 4]},
{Category:"Defensive",					Name:"Thunderer Smoke Round",			TTSName:"Thunderer Smoke Round",		Icon:"Thunderer Smoke Round.png",			Throwable:True,	Keys:[4, 2, 1, 1, 2]},
{Category:"Offensive",					Name:"Airstrike",						TTSName:"Airstrike",					Icon:"Airstrike.png",						Throwable:True,	Keys:[4, 1, 2, 4, 3]},
{Category:"Offensive",					Name:"Close Air Support",				TTSName:"Close Air Support",			Icon:"Close Air Support.png",				Throwable:True,	Keys:[4, 4, 2, 3]},
{Category:"Offensive",					Name:"Heavy Strafing Run",				TTSName:"Heavy Strafing Run",			Icon:"Heavy Strafing Run.png",				Throwable:True,	Keys:[4, 4, 2, 1]},
{Category:"Offensive",					Name:"Incendiary Bombs",				TTSName:"Incendiary Bombs",				Icon:"Incendiary Bombs.png",				Throwable:True,	Keys:[4, 1, 3, 4]},
{Category:"Offensive",					Name:"Missile Barrage",					TTSName:"Missile Barrage",				Icon:"Missile Barrage.png",					Throwable:True,	Keys:[4, 2, 2, 2, 3, 2]},
{Category:"Offensive",					Name:"Orbital Laser Strike",			TTSName:"Orbital Laser Strike",			Icon:"Orbital Laser Strike.png",			Throwable:True,	Keys:[4, 1, 3, 1, 4, 3]},
{Category:"Offensive",					Name:"Railcannon Strike",				TTSName:"Railcannon Strike",			Icon:"Railcannon Strike.png",				Throwable:True,	Keys:[4, 2, 1, 2, 3]},
{Category:"Offensive",					Name:"Shredder Missile Strike",			TTSName:"Shredder Missile Strike",		Icon:"Shredder Missile Strike.png",			Throwable:True,	Keys:[4, 3, 4, 3, 2, 2, 4]},
{Category:"Offensive",					Name:"Sledge Precision Artillery",		TTSName:"Sledge Precision Artillery",	Icon:"Sledge Precision Artillery.png",		Throwable:True,	Keys:[4, 1, 3, 1, 2, 4]},
{Category:"Offensive",					Name:"Static Field Conductors",			TTSName:"Static Field Conductors",		Icon:"Static Field Conductors.png",			Throwable:True,	Keys:[4, 1, 3, 2]},
{Category:"Offensive",					Name:"Strafing Run",					TTSName:"Strafing Run",					Icon:"Strafing Run.png",					Throwable:True,	Keys:[4, 4, 1]},
{Category:"Offensive",					Name:"Thunderer Barrage",				TTSName:"Thunderer Barrage",			Icon:"Thunderer Barrage.png",				Throwable:True,	Keys:[4, 2, 1, 1, 3, 2]},
{Category:"Offensive",					Name:"Vindicator Dive Bomb",			TTSName:"Vindicator Dive Bomb",			Icon:"Vindicator Dive Bomb.png",			Throwable:True,	Keys:[4, 4, 4]},
{Category:"Special",					Name:"Emergency Beacon",				TTSName:"Emergency Beacon",				Icon:"Emergency Beacon.png",				Throwable:True,	Keys:[1, 2, 4, 1]},
{Category:"Special",					Name:"ME-1 Sniffer Metal Detector",		TTSName:"Sniffer Metal Detector",		Icon:"ME-1 Sniffer Metal Detector.png",		Throwable:True,	Keys:[2, 2, 4, 1]},
{Category:"Special",					Name:"NUX-223 Hellbomb",				TTSName:"Hellbomb",						Icon:"NUX-223 Hellbomb.png",				Throwable:True,	Keys:[1, 3, 4, 2, 1, 2]},
{Category:"Special",					Name:"Reinforce",						TTSName:"Reinforce",					Icon:"Reinforce.png",						Throwable:True,	Keys:[1, 2, 4, 3, 1]}]

ConstructGUI

ConstructGUI() {
	Try TraySetIcon("resources\HD.png")
	HotkeyGUI := Gui()
	HotkeyGUI.Title := "Helldivers Stratagem Hotkeys"
	HotkeyGUI.BackColor := "171717"
	HotkeyGUI.SetFont("cBABABA")
	Try HotkeyGUI.Add("Picture", "w776 h-1", "resources\HD Banner.png")
	Tab := HotkeyGUI.Add("Tab3", "Background383333 cE1CB00", [" Hotkeys ", " Settings ", " About "])
	Tab.SetFont("s10")

	Tab.UseTab(1)
	ButtonArray := Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	IconArray := Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	HotkeyGUI.Add("Text", "Section w180", "Numlock")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadDiv")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadMult")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadSub")
	ButtonArray[1] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[1].OnEvent("Click", ShowStratagemMenu.Bind(1))
	ButtonArray[2] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[2].OnEvent("Click", ShowStratagemMenu.Bind(2))
	ButtonArray[3] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[3].OnEvent("Click", ShowStratagemMenu.Bind(3))
	ButtonArray[4] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[4].OnEvent("Click", ShowStratagemMenu.Bind(4))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad7 / NumpadHome")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad8 / NumpadUp")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad9 / NumpadPgUp")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadAdd")
	ButtonArray[5] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[5].OnEvent("Click", ShowStratagemMenu.Bind(5))
	ButtonArray[6] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[6].OnEvent("Click", ShowStratagemMenu.Bind(6))
	ButtonArray[7] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[7].OnEvent("Click", ShowStratagemMenu.Bind(7))
	ButtonArray[8] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[8].OnEvent("Click", ShowStratagemMenu.Bind(8))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad4 / NumpadLeft")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad5 / NumpadClear")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad6 / NumpadRight")
	ButtonArray[9] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[9].OnEvent("Click", ShowStratagemMenu.Bind(9))
	ButtonArray[10] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[10].OnEvent("Click", ShowStratagemMenu.Bind(10))
	ButtonArray[11] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[11].OnEvent("Click", ShowStratagemMenu.Bind(11))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad1 / NumpadEnd")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad2 / NumpadDown")
	HotkeyGUI.Add("Text", "x+m wp", "Numpad3 / NumpadPgDn")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadEnter")
	ButtonArray[12] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[12].OnEvent("Click", ShowStratagemMenu.Bind(12))
	ButtonArray[13] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[13].OnEvent("Click", ShowStratagemMenu.Bind(13))
	ButtonArray[14] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[14].OnEvent("Click", ShowStratagemMenu.Bind(14))
	ButtonArray[15] := HotkeyGUI.Add("Button", "x+m wp hp left background383333")
	ButtonArray[15].OnEvent("Click", ShowStratagemMenu.Bind(15))
	HotkeyGUI.Add("Text", "xs y+10 w180", "Numpad0 / NumpadIns")
	HotkeyGUI.Add("Text", "x+m wp")
	HotkeyGUI.Add("Text", "x+m wp", "NumpadDot / NumpadDel")
	ButtonArray[16] := HotkeyGUI.Add("Button", "xs w180 h54 left background383333")
	ButtonArray[16].OnEvent("Click", ShowStratagemMenu.Bind(16))
	HotkeyGUI.Add("Text", "x+m wp h58")
	ButtonArray[17] := HotkeyGUI.Add("Button", "x+m wp h54 left background383333")
	ButtonArray[17].OnEvent("Click", ShowStratagemMenu.Bind(17))

	Tab.UseTab(2)
	HotkeyGUI.Add("Text", "Section y+10", "Minimum press/click delay")
	HotkeyGUI.Add("Edit", "ys yp-3 Limit3 Number w75 Background4B4B4B cBABABA").OnEvent("Change", ChangeSetting.Bind("MinimumDelay"))
	Global MinimumDelay := HotkeyGUI.Add("UpDown", "vMinUpDown Range0-999", IniRead("HD Config.ini", "Settings", "MinimumDelay", "40"))
	MinimumDelay.OnEvent("Change", ChangeSetting.Bind("MinimumDelay"))
	HotkeyGUI.Add("Text", "ys", "milliseconds (Default: 40)")
	HotkeyGUI.Add("Text", "xs", "If the macro is failing to input the stratagem properly, try increasing this value.")
	HotkeyGUI.Add("Text", "xs y+30", "Stratagem keys:")
	HotkeyGUI.Add("Text", "Section", "Open stratagem list")
	Global StratagemKey := HotkeyGUI.Add("DropDownList", "ys yp-4 Background4B4B4B cBABABA", ["Alt", "Control", "Shift"])
	StratagemKey.OnEvent("Change", ChangeKey.Bind("StratagemKey", "Control"))
	StratagemKey.Value := IniRead("HD Config.ini", "Settings", "StratagemKey", 2)
	HotkeyGUI.Add("Text", "ys", "Note: input type has to be set to `"HOLD`" in game.")
	HotkeyGUI.Add("Text", "Section xs y+15 w90", "Up")
	UpKey := HotkeyGUI.Add("Hotkey", "vUpKey ys yp-4 Limit190", IniRead("HD Config.ini", "Settings", "UpKey", "w"))
	UpKey.OnEvent("Change", ChangeKey.Bind("UpKey", "w"))
	HotkeyGUI.Add("Text", "Section xs y+11 w90", "Down")
	DownKey := HotkeyGUI.Add("Hotkey", "vDownKey ys yp-4 Limit190", IniRead("HD Config.ini", "Settings", "DownKey", "s"))
	DownKey.OnEvent("Change", ChangeKey.Bind("DownKey", "s"))
	HotkeyGUI.Add("Text", "Section xs y+11 w90", "Left")
	LeftKey := HotkeyGUI.Add("Hotkey", "vLeftKey ys yp-4 Limit190", IniRead("HD Config.ini", "Settings", "LeftKey", "a"))
	LeftKey.OnEvent("Change", ChangeKey.Bind("LeftKey", "a"))
	HotkeyGUI.Add("Text", "Section xs y+11 w90", "Right")
	RightKey := HotkeyGUI.Add("Hotkey", "vRightKey ys yp-4 Limit190", IniRead("HD Config.ini", "Settings", "RightKey", "d"))
	RightKey.OnEvent("Change", ChangeKey.Bind("RightKey", "d"))

	Global KeyArray := Array(UpKey.Value, DownKey.Value, LeftKey.Value, RightKey.Value)
	Try {
		Global SAPI := ComObject("SAPI.SpVoice")
		SAPI.Rate := 1
		SAPI.Volume := 100
		Voices := Array()
		For Voice in SAPI.GetVoices
			Voices.Push(Voice.GetDescription)
		Global TextToSpeech := HotkeyGUI.Add("CheckBox", "vTextToSpeech Section xs y+30", "Read out loud activated stratagem's name")
		TextToSpeech.OnEvent("Click", ChangeSetting.Bind("TextToSpeech"))
		TextToSpeech.Value := IniRead("HD Config.ini", "Settings", "TextToSpeech", 0)
		HotkeyGUI.Add("Text", "Section y+15 xp+18", "Voice")
		Voice := HotkeyGUI.Add("DropDownList", "ys yp-4 w300 Background4B4B4B cBABABA", Voices)
		Voice.OnEvent("Change", ChangeVoice.Bind("Voice"))
		Voice.Value := IniRead("HD Config.ini", "Settings", "Voice", 1)
		If !TextToSpeech.Value
			Voice.Enabled := False
	}
	AutoThrowTooltips := HotkeyGUI.Add("CheckBox", "vAutoThrowTooltips Section xm+12 y+30", "Show `"Throw Automatically`" help tips")
	AutoThrowTooltips.OnEvent("Click", ChangeSetting.Bind("AutoThrowTooltips"))
	AutoThrowTooltips.Value := IniRead("HD Config.ini", "Settings", "AutoThrowTooltips", 1)

	Tab.UseTab(3)
	HotkeyGUI.Add("Text", "Section h18 w400", "Helldivers Stratagem AutoHotkey v2 script with GUI").SetFont("bold s10")
	HotkeyGUI.Add("Text", "xs", "Version 1.0")
	HotkeyGUI.Add("Link", "xs y+20", '<a href="https://github.com/Dazuzi/HD1StratHotkeysGUI">https://github.com/Dazuzi/HD1StratHotkeysGUI</a>')

	Tab.UseTab()
	ProfileArray := Array("Default")
	Try {
		Loop Parse, IniRead("HD Config.ini", "Profiles"), "`n" {
			Profile := StrSplit(A_LoopField, "=")[1]
			If Profile != "Default"
				ProfileArray.Push(Profile)
		}
	}
	HotkeyGUI.Add("Text", "Section y+11", "Profile")
	ActiveProfile := HotkeyGUI.Add("DropDownList", "ys w180 yp-4 Background4B4B4B cBABABA", ProfileArray)
	ActiveProfile.OnEvent("Change", LoadProfile)
	ActiveProfile.Focus
	Try ActiveProfile.Text := IniRead("HD Config.ini", "Settings", "ActiveProfile", "Default")
	Catch
		ActiveProfile.Text := "Default"
	HotkeyGUI.Add("Button", "ys yp-1 w80 Background171717", "Add profile").OnEvent("Click", AddProfileClick)
	DeleteProfile := HotkeyGUI.Add("Button", "ys yp-1 w80 Background171717", "Delete profile")
	DeleteProfile.OnEvent("Click", DeleteProfileClick)
	LoadProfile

	HotkeyGUI.OnEvent("Close", (*) => ExitApp())
	HotkeyGUI.Show

	ModifyButton(ButtonHandle, Index) {
		ButtonArray[Index].Text := " " StratagemArray[HotkeyArray[Index]].Name
		If HotkeyArray[Index + 17]
			ButtonHandle.SetFont("italic")
		Else
			ButtonHandle.SetFont("")
		IL_Destroy(IconArray[Index])
		IconSize := 54 * A_ScreenDPI / 96
		ButtonImageList := Buffer(A_PtrSize + 20)
		Try {
			NewImageList := DllCall("ImageList_Create", "Int", IconSize, "Int", IconSize, "UInt", 0x21, "Int", 1, "Int", 1)
			NumPut("Ptr", NewImageList, "UInt", -2, "UInt", 0, "UInt", 0, "UInt", 0, "UInt", 0, ButtonImageList, 0)
			SendMessage(BCM_SETIMAGELIST := 5634, 0, ButtonImageList, ButtonHandle.Hwnd)
			IL_Add(NewImageList, "resources\" StratagemArray[HotkeyArray[Index]].Icon, 1)
			IconArray[Index] := NewImageList
		}
	}

	ShowStratagemMenu(HotkeyID, ButtonID, *) {
		If !StratagemArray[HotkeyArray[HotkeyID]].Throwable
			StratagemMenu.Disable("Throw Automatically")
		Else If HotkeyArray[HotkeyID + 17]
			StratagemMenu.Check("Throw Automatically")
		Global MenuIDs := Array(HotkeyID,ButtonID)
		Stratagem := StratagemArray[HotkeyArray[HotkeyID]]
		Category := StratagemArray[HotkeyArray[HotkeyID]].Category
		Switch Category {
			Case "No Stratagem":SelectedMenu := StratagemMenu
			Case "Supply: Support":SelectedMenu := SupplySupportSubmenu
			Case "Supply: Backpacks":SelectedMenu := SupplyBackpacksSubmenu
			Case "Supply: Secondary Weapons":SelectedMenu := SupplySecondaryWeaponsSubmenu
			Case "Supply: Vehicles":SelectedMenu := SupplyVehiclesSubmenu
			Case "Defensive":SelectedMenu := DefensiveSubmenu
			Case "Offensive":SelectedMenu := OffensiveSubmenu
			Case "Special":SelectedMenu := SpecialSubmenu
		}
		SelectedMenu.Check(StratagemMenuName(Stratagem))
		ControlGetPos &x, &y,, &h, ButtonID
		StratagemMenu.Show(x, y + h)
		StratagemMenu.Enable("Throw Automatically")
		StratagemMenu.Uncheck("Throw Automatically")
		SelectedMenu.Uncheck(StratagemMenuName(Stratagem))
	}

	StratagemMenuHandler(Index, *) {
		AutothrowIndex := MenuIDs[1] + 17
		If Index = 0 {
			If HotkeyArray[AutothrowIndex] {
				HotkeyArray[AutothrowIndex] := 0
				MenuIDs[2].SetFont("")
			}
			Else {
				HotkeyArray[AutothrowIndex] := 1
				MenuIDs[2].SetFont("italic")
				If AutoThrowTooltips.Value {
					ControlGetPos &x, &y,, &h, MenuIDs[2]
					ToolTip("Note: you must have FIRE key bound to Right Mouse Button.", x, y - 25)
					SetTimer () => ToolTip(), -5000
				}
			}
		}
		Else {
			If !StratagemArray[Index].Throwable && HotkeyArray[AutothrowIndex] {
				HotkeyArray[AutothrowIndex] := 0
				MenuIDs[2].SetFont("")
				If AutoThrowTooltips.Value {
					ControlGetPos &x, &y,, &h, MenuIDs[2]
					If (Index > 1)
						ToolTip(StratagemArray[Index].Name " cannot be thrown, autothrow disabled.", x, y - 25)
					Else
						ToolTip("Autothrow disabled.", x, y - 25)
					SetTimer () => ToolTip(), -5000
				}
			}
			HotkeyArray[MenuIDs[1]] := Index
			ModifyButton(MenuIDs[2], MenuIDs[1])
			If TextToSpeech.Value
				Try SAPI.Speak(StratagemArray[Index].TTSName, 1)
		}
		SaveActiveProfile
	}

	ChangeSetting(SettingName, ControlID, *) {
		IniWrite ControlID.Value, "HD Config.ini", "Settings", SettingName
		If TextToSpeech.Value
			Voice.Enabled := True
		Else
			Voice.Enabled := False
	}

	ChangeKey(SettingName, DefaultKey, ControlID, *) {
		ControlID.Value := StrReplace(ControlID.Value, "^!")
		If ControlID.Value = ""
			ControlID.Value := DefaultKey
		IniWrite ControlID.Value, "HD Config.ini", "Settings", SettingName
		KeyArray := Array(UpKey.Value, DownKey.Value, LeftKey.Value, RightKey.Value)
	}

	ChangeVoice(SettingName, ControlID, *) {
		IniWrite ControlID.Value, "HD Config.ini", "Settings", SettingName
		SAPI.Voice := SAPI.GetVoices().Item(ControlID.Value - 1)
		If TextToSpeech.Value
			SAPI.Speak(ControlID.Text, 1)
	}

	SaveActiveProfile() {
		Stratagems := ""
		For Stratagem in HotkeyArray
			Stratagems := Stratagems " " Stratagem
		IniWrite LTrim(Stratagems), "HD Config.ini", "Profiles", ActiveProfile.Text
	}

	LoadProfile(*) {
		If ActiveProfile.Text = "Default"
			DeleteProfile.Enabled := False
		Else
			DeleteProfile.Enabled := True
		Global HotkeyArray := StrSplit(IniRead("HD Config.ini", "Profiles", ActiveProfile.Text, "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"), " ")
		ModifyButton(ButtonArray[1], 1)
		ModifyButton(ButtonArray[2], 2)
		ModifyButton(ButtonArray[3], 3)
		ModifyButton(ButtonArray[4], 4)
		ModifyButton(ButtonArray[5], 5)
		ModifyButton(ButtonArray[6], 6)
		ModifyButton(ButtonArray[7], 7)
		ModifyButton(ButtonArray[8], 8)
		ModifyButton(ButtonArray[9], 9)
		ModifyButton(ButtonArray[10], 10)
		ModifyButton(ButtonArray[11], 11)
		ModifyButton(ButtonArray[12], 12)
		ModifyButton(ButtonArray[13], 13)
		ModifyButton(ButtonArray[14], 14)
		ModifyButton(ButtonArray[15], 15)
		ModifyButton(ButtonArray[16], 16)
		ModifyButton(ButtonArray[17], 17)
		IniWrite ActiveProfile.Text, "HD Config.ini", "Settings", "ActiveProfile"
	}

	AddProfileClick(*) {
		NewProfile := Object
		NewProfile.Value := "MyNewProfile"
		TryAgain:
		NewProfile := InputBox("Enter an alphanumeric name for a new profile:", "Helldivers Stratagem Hotkeys", "h100", NewProfile.Value)
		If (NewProfile.Result = "Cancel")
			Return
		Else If StrLen(NewProfile.Value) > 64 {
			If MsgBox("The profile name can be a maximum of 64 characters long, please try again.", "Helldivers Stratagem Hotkeys", "RC IconX 8192") = "Retry"
				Goto TryAgain
			Return
		}
		If ProfileExists(NewProfile.Value) > 0 {
			If MsgBox("A profile called `"" NewProfile.Value "`" already exists, please try again.", "Helldivers Stratagem Hotkeys", "RC IconX 8192") = "Retry"
				Goto TryAgain
			Return
		}
		Else If IsAlnum(NewProfile.Value) {
			ProfileArray.Push(NewProfile.Value)
			ActiveProfile.Add(Array(NewProfile.Value))
			ActiveProfile.Text := NewProfile.Value
			SaveActiveProfile
			LoadProfile
		}
		Else If MsgBox("The profile name can only contain letters and numbers, please try again.", "Helldivers Stratagem Hotkeys", "RC IconX 8192") = "Retry"
			Goto TryAgain
	}

	ProfileExists(ProfileName) {
		For Profile in ProfileArray {
			If Profile = ProfileName
				Return A_Index
		}
		Return 0
	}

	DeleteProfileClick(*) {
		If MsgBox("Do you really want to delete `"" ActiveProfile.Text "`" profile?", "Helldivers Stratagem Hotkeys", "YN Icon? 8192") = "No"
			Return
		IniDelete "HD Config.ini", "Profiles", ActiveProfile.Text
		ProfileArray.RemoveAt(ProfileExists(ActiveProfile.Text))
		ActiveProfile.Delete(ActiveProfile.Value)
		ActiveProfile.Value := 1
		LoadProfile
	}

	StratagemMenu := Menu()
	SupplySupportSubmenu := Menu()
	SupplyBackpacksSubmenu := Menu()
	SupplySecondaryWeaponsSubmenu := Menu()
	SupplyVehiclesSubmenu := Menu()
	DefensiveSubmenu := Menu()
	OffensiveSubmenu := Menu()
	SpecialSubmenu := Menu()
	StratagemMenu.Add("Throw automatically", StratagemMenuHandler.Bind(0))
	Try StratagemMenu.SetIcon("Throw automatically", "resources\Throw.png",,28)
	StratagemMenu.Add
	For Stratagem in StratagemArray {
		Switch Stratagem.Category {
			Case "No Stratagem":AddMenuItem(StratagemMenu, Stratagem)
			Case "Supply: Support":AddMenuItem(SupplySupportSubmenu, Stratagem)
			Case "Supply: Backpacks":AddMenuItem(SupplyBackpacksSubmenu, Stratagem)
			Case "Supply: Secondary Weapons":AddMenuItem(SupplySecondaryWeaponsSubmenu, Stratagem)
			Case "Supply: Vehicles":AddMenuItem(SupplyVehiclesSubmenu, Stratagem)
			Case "Defensive":AddMenuItem(DefensiveSubmenu, Stratagem)
			Case "Offensive":AddMenuItem(OffensiveSubmenu, Stratagem)
			Case "Special":AddMenuItem(SpecialSubmenu, Stratagem)
		}
	}
	StratagemMenu.Add("Supply: Support", SupplySupportSubmenu)
	Try StratagemMenu.SetIcon("Supply: Support", "resources\Resupply.png",,28)
	StratagemMenu.Add("Supply: Backpacks", SupplyBackpacksSubmenu)
	Try StratagemMenu.SetIcon("Supply: Backpacks", "resources\AD-289 Angel.png",,28)
	StratagemMenu.Add("Supply: Secondary Weapons", SupplySecondaryWeaponsSubmenu)
	Try StratagemMenu.SetIcon("Supply: Secondary Weapons", "resources\AC-22 Dum-Dum.png",,28)
	StratagemMenu.Add("Supply: Vehicles", SupplyVehiclesSubmenu)
	Try StratagemMenu.SetIcon("Supply: Vehicles", "resources\EXO-44 Walker Exosuit.png",,28)
	StratagemMenu.Add("Defensive", DefensiveSubmenu)
	Try StratagemMenu.SetIcon("Defensive", "resources\AAC-6 Tesla Tower.png",,28)
	StratagemMenu.Add("Offensive", OffensiveSubmenu)
	Try StratagemMenu.SetIcon("Offensive", "resources\Airstrike.png",,28)
	StratagemMenu.Add("Special", SpecialSubmenu)
	Try StratagemMenu.SetIcon("Special", "resources\Emergency Beacon.png",,28)
	StratagemMenu.SetColor("BABABA", true)

	AddMenuItem(Submenu, Stratagem) {
		MenuItemName := StratagemMenuName(Stratagem)
		Submenu.Add(MenuItemName, StratagemMenuHandler.Bind(A_Index))
		Try Submenu.SetIcon(MenuItemName, "resources\" Stratagem.Icon,,28)
	}

	StratagemMenuName(Stratagem) {
		if Stratagem.Keys.Length < 1
			Return MenuItemName := Stratagem.Name
		MenuItemName := Stratagem.Name "	"
		For Key in Stratagem.Keys {
			Switch Key {
				Case 1: MenuItemName := MenuItemName " 🡅"
				Case 2: MenuItemName := MenuItemName " 🡇"
				Case 3: MenuItemName := MenuItemName " 🡄"
				Case 4: MenuItemName := MenuItemName " 🡆"
			}
		}
		Return MenuItemName
	}
}

#HotIf (WinActive("Helldivers")) && (HotkeyArray[1] > 1)
NumLock::PlayKeys(1)

#HotIf (WinActive("Helldivers")) && (HotkeyArray[2] > 1)
NumpadDiv::PlayKeys(2)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[3] > 1)
NumpadMult::PlayKeys(3)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[4] > 1)
NumpadSub::PlayKeys(4)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[5] > 1)
Numpad7::
NumpadHome::PlayKeys(5)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[6] > 1)
Numpad8::
NumpadUp::PlayKeys(6)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[7] > 1)
Numpad9::
NumpadPgUp::PlayKeys(7)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[8] > 1)
NumpadAdd::PlayKeys(8)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[9] > 1)
Numpad4::
NumpadLeft::PlayKeys(9)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[10] > 1)
Numpad5::
NumpadClear::PlayKeys(10)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[11] > 1)
Numpad6::
NumpadRight::PlayKeys(11)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[12] > 1)
Numpad1::
NumpadEnd::PlayKeys(12)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[13] > 1)
Numpad2::
NumpadDown::PlayKeys(13)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[14] > 1)
Numpad3::
NumpadPgDn::PlayKeys(14)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[15] > 1)
NumpadEnter::PlayKeys(15)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[16] > 1)
Numpad0::
NumpadIns::PlayKeys(16)
#HotIf

#HotIf (WinActive("Helldivers")) && (HotkeyArray[17] > 1)
NumpadDot::
NumpadDel::PlayKeys(17)
#HotIf

PlayKeys(HotkeyID) {
	StratagemID := HotkeyArray[HotkeyID]
	If TextToSpeech.Value
		Try SAPI.Speak(StratagemArray[StratagemID].TTSName, 1)
	Keys := StratagemArray[StratagemID].Keys
	MinDelay := MinimumDelay.Value
	MaxDelay := MinDelay*2
	Send "{" StratagemKey.Text " down}"
	Sleep Random(MinDelay, MaxDelay)
	For Key in Keys {
		Send "{" KeyArray[Key] " down}"
		Sleep Random(MinDelay, MaxDelay)
		Send "{" KeyArray[Key] " up}"
		Sleep Random(MinDelay, MaxDelay)
	}
	Send "{" StratagemKey.Text " up}"
	If HotkeyArray[HotkeyID + 17] {
		Sleep Random(MinDelay, MaxDelay)
		MouseClick "Left",,,,, "Down"
		Sleep Random(MinDelay, MaxDelay)
		MouseClick "Left",,,,, "Up"
	}
}