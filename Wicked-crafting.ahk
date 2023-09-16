#SingleInstance Force
#Requires AutoHotkey v2.0

; Made by Prometheu52, Enjoy :)

FirstCardX := Integer(A_ScreenWidth * 0.46875)
FirstCardY := Integer(A_ScreenHeight * 0.298611)
SRow := 1
SCol := 1
ERow := 1
ECol := 1
Moves := []

CardOffsetX := Integer(450)
CardOffsetY := Integer(130)

MyGui := Gui("+Resize","Wicked Crafting",)
MyGui.Add("Text",,"Source Row: ")
MyGui.AddEdit()
MyGui.AddUpDown("Range1-5 Wrap", 1).OnEvent("Change", SRowChanged)

MyGui.Add("Text",,"Source Col: ")
MyGui.AddEdit()
MyGui.AddUpDown("Range1-5 Wrap", 1).OnEvent("Change", SColChanged)

MyGui.Add("Text",,"-------------------------------------------------")

MyGui.Add("Text",,"Ending Row: ")
MyGui.AddEdit()
MyGui.AddUpDown("Range1-5 Wrap", 1).OnEvent("Change", ERowChanged)
MyGui.Add("Text",,"Ending Col: ")
MyGui.AddEdit()
MyGui.AddUpDown("Range1-5 Wrap", 1).OnEvent("Change", EColChanged)

MyGui.AddButton("Default w80", "Debug").OnEvent("Click", ButtonClick)

MyGui.Add("Text",,"-------------------------------------------------")

MyGui.Add("Text",,"Input field")
MovesRaw := MyGui.AddEdit("r1 Limit10 Uppercase -WantReturn")
MyGui.AddButton("Default w40 x+10", "OK").OnEvent("Click", ReadInMoves)


#Hotif WinActive("Destiny 2")
^1::{
	MyGui.Show()
	MyGui.Move(,,320, 400)
}

#Hotif WinActive("Destiny 2")
F2::{
	CPS := Integer(12)
	INTERVAL := Integer(1000) / CPS

	SMoveX := ((SCol -1) * CardOffsetX) + FirstCardX
	SMoveY := ((SRow -1) * CardOffsetY) + FirstCardY

	EMoveX := ((ECol -1) * CardOffsetX) + FirstCardX
	EMoveY := ((ERow -1) * CardOffsetY) + FirstCardY

	MouseMove SMoveX, SMoveY
	Sleep 100
	Click

	loop Moves.Length {
		Send StrLower(Moves[A_Index])
		Sleep 60
	}

	MouseMove EMoveX, EMoveY, 50
	;Sleep 10
	Loop CPS {
		Sleep INTERVAL
		Click
	}
}

^F2::{
	ExitApp
}



ReadInMoves(*) {
	global
	Moves := []
	loop Parse MovesRaw.Text {
		Moves.Push(A_LoopField)
	}
}

SRowChanged(obj, info) {
	global
	SRow := obj.Value
}

SColChanged(obj, info) {
	global
	SCol := obj.value
}

ERowChanged(obj, info) {
	global
	ERow := obj.value
}

EColChanged(obj, info) {
	global
	ECol := obj.value
}

ButtonClick(obj, info) {
	MsgBox Format("Source: Row: {1} Col: {2} | End: Row: {3} Col: {4}", SRow, SCol, ERow, ECol)
	MsgBox Join("->", Moves*)
}

Join(sep, params*) {
    for index,param in params
        str .= param . sep
    return SubStr(str, 1, -StrLen(sep))
}
