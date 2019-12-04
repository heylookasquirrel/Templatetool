Add-Type -AssemblyName System.Windows.Forms

$windowHeight = 600;
$windowWidth = 1000;
$sidebarSize = 210;

Function CreateCheckbox{
    Param  ( $x, $y)

    $Checkbox = New-Object System.Windows.Forms.CheckBox
    $Checkbox.Location = New-Object System.Drawing.Size($x,$y)

    $Form.Controls.Add($Checkbox)
    return $Checkbox
}

Function CreateText{
    Param  ($text, $x, $y, $sx, $sy, $height, [string]$color="black", $color2)

    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = $text
    $Label.ForeColor = $color
    $Label.BackColor = $color2
    $Label.TextAlign = "MiddleCenter"
    $Label.Size = New-Object System.Drawing.Size($sx,$sy)
    $Label.Font = New-Object System.Drawing.Font("Arial", $height, [Drawing.FontStyle]::Bold)
    $Label.Location = New-Object System.Drawing.Size($x,$y)

    $Form.Controls.Add($Label)
}

Function CreateText{
    Param  ($text, $x, $y, $sx, $sy, $height, [string]$color="black", $color2)

    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = $text
    $Label.ForeColor = $color
    $Label.BackColor = $color2
    $Label.TextAlign = "MiddleCenter"
    $Label.Size = New-Object System.Drawing.Size($sx,$sy)
    $Label.Font = New-Object System.Drawing.Font("Arial", $height, [Drawing.FontStyle]::Bold)
    $Label.Location = New-Object System.Drawing.Size($x,$y)

    $Form.Controls.Add($Label)
}

Function CreateSymbol{
    Param  ($text, $x, $y, $sx, $sy, $height, [string]$color="black", $color2)

    $Label = New-Object System.Windows.Forms.Label
    $Label.Text = $text
    $Label.ForeColor = $color
    $Label.BackColor = $color2
    $Label.TextAlign = "MiddleCenter"
    $Label.Size = New-Object System.Drawing.Size($sx,$sy)
    $Label.Font = New-Object System.Drawing.Font("Webdings", $height, [Drawing.FontStyle]::Bold)
    $Label.Location = New-Object System.Drawing.Size($x,$y)

    $Form.Controls.Add($Label)
}


Function CreatePanel{
    Param  ($x, $y, $sx, $sy,[string]$color)

    $Panel = New-Object system.Windows.Forms.Panel
    $Panel.Location = New-Object System.Drawing.Size($x, $y)
    $Panel.Size = New-Object System.Drawing.Size($sx, $sy)
    $Panel.BorderStyle = "none"
    $Panel.BackColor = $color
    $Form.Controls.Add($Panel)
}

Function CreateInput{
    Param  ($x, $y, $sx, $sy)

    $Template = New-Object System.Windows.Forms.Textbox
    $Template.Location = New-Object System.Drawing.Size($x, $y)
    $Template.Size = New-Object System.Drawing.Size($sx, $sy)
    $Template.Font = New-Object System.Drawing.Font("Arial", 16)
    $Form.Controls.Add($Template)

    return $Template

}

Function CreateButton{
    Param  ($text, $x, $y, $sx, $sy)

    $Button = New-Object System.Windows.Forms.Button
    $Button.Text = $text
    $Button.Size = New-Object System.Drawing.Size($sx, $sy)
    $Button.Location = New-Object System.Drawing.Size($x,$y)
    $Button.Font = New-Object System.Drawing.Font("Arial", 16, [Drawing.FontStyle]::Bold)
    $Button.ForeColor = "white"
    $Button.BackColor = "#1BB697"
    $Button.FlatStyle = "Flat"
    $Form.Controls.Add($Button)

    return $Button
}

Function MoveObject{
    Param ($object, $x, $y)
    $tx = $object.location.x + $x
    $ty = $object.location.y + $y

    $object.location = New-Object System.Drawing.Size($tx, $ty)

}

Function CreateLines{
    Param ($point)
    Clear-Variable $point
    [System.Collections.ArrayList]$object = @()
    $i = 0
    $lines.ForEach({
        $temp = CreateInput ($sidebarSize + 480) (120 + ($i * 40))  ($windowWidth - ($sidebarSize + 500)) 40
        $i = $i + 1;
        $Object.Add($temp)
    })
    return $object
}

Function RedrawLines{
    
}

Function AddLine{
    Write-Host $values
    $lines.Add(@{
        text = "line"
    })
    CreateLines
}

Function RemoveLine{
     
}



$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Template Tool"
$Form.Size = New-Object System.Drawing.Size($windowWidth,$windowHeight)
$Form.FormBorderStyle = "FixedSingle"


#UI drawing and assignment
$Button1 = CreateButton "Copy" ($sidebarSize + 10) ($windowHeight - 80) 80 40
$Button2 = CreateButton "Remote" (10) (80) 190 40
$Button3 = CreateButton "+" (700) (80) 30 30
$Button4 = CreateButton "-" (750) (80) 30 30
$Address = CreateInput (10) (130) 190 40

$input1 = CreateInput ($sidebarSize + 150) 80 ($windowWidth - ($sidebarSize + 470)) 40
CreateText "Input 1" ($sidebarSize + 10) 76 130 40 12 "Black" "#F0F0F0";
$input2 = CreateInput ($sidebarSize + 150) 120 ($windowWidth - ($sidebarSize + 470)) 40
CreateText "Input 2" ($sidebarSize + 10) 116 130 40 12 "Black" "#F0F0F0";
$input3 = CreateInput ($sidebarSize + 150) 160 ($windowWidth - ($sidebarSize + 470)) 40
CreateText "Input 3" ($sidebarSize + 10) 156 130 40 12 "Black" "#F0F0F0";

$input4 = CreateInput ($sidebarSize + 150) 380 ($windowWidth - ($sidebarSize + 470)) 40
CreateText "Input 4" ($sidebarSize + 10) 376 130 40 12 "Black" "#F0F0F0";
$input5 = CreateInput ($sidebarSize + 150) 420 ($windowWidth - ($sidebarSize + 470)) 40
CreateText "Input 5" ($sidebarSize + 10) 416 130 40 12 "Black" "#F0F0F0";
$input6 = CreateInput ($sidebarSize + 150) 460 ($windowWidth - ($sidebarSize + 470)) 40
CreateText "Input 6" ($sidebarSize + 10) 456 130 40 12 "Black" "#F0F0F0";

CreateText "Input" ($sidebarSize + 120) ($windowHeight - 70) 50 20 12 "Black" "#F0F0F0";
$option1 = CreateCheckbox ($sidebarSize + 100) ($windowHeight - 72)

[System.Collections.ArrayList]$lines = @{
    text = "line2"
},
@{
    text = "line"
},
@{
    text = "line2"
}

[System.Collections.ArrayList]$values = CreateLines 

#List object
$List = New-Object System.Windows.Forms.ListView
$List.Size = New-Object System.Drawing.Size(($windowWidth - ($sidebarSize + 330)), 170)
$List.Location = New-Object System.Drawing.Size(($sidebarSize + 10), 200)
$List.FullRowSelect = "true";
$List.View = 'Details'
$List.Columns.Add('Issue')
$List.Columns.Add('Description')
$List.HideSelection = "false";
$List.BackColor = "white"
$List.Columns[0].Width = 100
$List.Columns[1].Width = 500
$List.MultiSelect = "false"

#populate list
$object.ForEach( {
    $buffer = New-Object System.Windows.Forms.ListViewItem($_.name)
    $buffer.SubItems.Add($_.description)
    $List.Items.AddRange(($buffer))
})

$Button1.Add_Click({
        AddLine
        $buffer = $Label1.Text + ": " + $input1.text + "`n"
        $buffer += $Label2.Text + ": " + $input2.text + "`n"
        $buffer += $Label3.Text + ": " + $input3.text + "`n"
        If($List.SelectedIndices -eq "null"){
            $buffer += "Empty"
        }
        $buffer += $object[$List.SelectedIndices].instructions
        $List.SelectedIndices
        If($Option1.Checked){
            $buffer +=  "`n" + $Label4.Text + ": " + $input4.text + "`n"
            $buffer += $Label5.Text + ": " + $input5.text + "`n"
            $buffer += $Label6.Text + ": " + $input6.text + "`n"
        }

        Set-Clipboard -Value $buffer
    })

$Button2.Add_Click({
        $buffer = "/Offerra " + "test"
        Start-Process -FilePath "C:\Windows\System32\msra.exe" -Args $buffer
        
})

$Button3.Add_Click({
        AddLine
})

$Button4.Add_Click({
        RemoveLine
})





#Render code

CreateSymbol "@" 5 24 30 20 18 "White" "#464C58";
CreateText "Template Tool" 28 10 174 50 18 "White" "#464C58";

$Form.Controls.Add($List)
CreatePanel 0 0 $sidebarSize 70 "#464C58";
CreatePanel 0 0 $sidebarSize $windowHeight "#525967"; 
CreatePanel 0 0 $windowWidth 70 "#4D95DC"; 

#Copy Button

$object = 
@{
    name = "Example 1"
    description = "Jacob"
    instructions = "
-Do this
-Do that
-Solved
"
},
@{
    name = "Example 2"
    description = "Gonzalez"
    instructions = "
-Do this
-Do that
-Solved22
"
},
@{
    name = "Example 2"
    description = "Gonzalez"
    instructions = "
-Do this
-Do that
-Solved33
"
}



$Form.ShowDialog()