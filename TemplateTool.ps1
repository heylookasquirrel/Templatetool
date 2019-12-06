Add-Type -AssemblyName System.Windows.Forms

$windowHeight = 600;
$windowWidth = 1000;
$sidebarSize = 210;



[System.Collections.Arraylist]$lines = @(@{
    lines = ""
})

[System.Collections.Arraylist]$values = @()

$database = 
@{
    name = "Example 1"
    description = "This is a description"
    instructions = 
    "Do step one",
    "Then step two",
    "Completed"
},
@{
    name = "Example 2"
    description = "This is a description"
    instructions = 
    "Do step one",
    "Then step atre",
    "Completed"

}

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

Function CreateDropdown{
    Param  ($x, $y, $sx, $sy, $items)

    $Template = New-Object System.Windows.Forms.ComboBox
    $Template.Location = New-Object System.Drawing.Size($x, $y)
    $Template.Size = New-Object System.Drawing.Size($sx, $sy)
    $Template.Font = New-Object System.Drawing.Font("Arial", 16)
    $items.forEach({
        $Template.Items.Add($_)
    })
    $Template.SelectedItem = $Template.Items[0]
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
    Param ($flag=0)

    $i = 0 #lines loop
    $e = 0 #Values loop


    if($flag){
        #if flag is set, update values in the lines variable
        $values.ForEach({ 
            if( -NOT ($e -eq ($lines.count))){
                $lines[$e].text = $_.text
            }
            #Removes UI links from form
            $form.Controls.Remove($_)
            $e += 1;
        })
    }
    #clears UI objects
    $values.RemoveRange(0,$values.Count)
    $lines.ForEach({
        $temp = CreateInput ($sidebarSize + 480) (120 + ($i * 40))  ($windowWidth - ($sidebarSize + 500)) 40
        $temp.Text = $_.text
        $i += 1;
        $values.Add($temp)
    }) 

}

Function LoadLines{
    Param ($Object)
    $e = 0

    $values.ForEach({ 
        #Removes UI links from form
        $form.Controls.Remove($_)
        $e += 1;
    })

    $Lines.RemoveRange(0,$lines.Count)
   
    $Object.ForEach({
        
        $Lines.Add(@{
            text = $_
        })
    })
    CreateLines 
}

Function AddLine{
    if($lines.count -eq 10){
        return
    }
    write-host $lines[0]
    $lines.add(@{
        text = ""
    })
    CreateLines 1
}

Function RemoveLine{
    if($lines.count -eq 0){
        return
    }
    $lines.removeAt(($lines.Count-1))
    CreateLines 1
}


$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Template Tool"
$Form.Size = New-Object System.Drawing.Size($windowWidth,$windowHeight)
$Form.FormBorderStyle = "FixedSingle"


CreateText "Created By: Jacob Gonzalez" 0 ($windowHeight - 50) 142 30 7 "Black" "#525967";

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


$dropdownItems1 = "Los Angeles","Colorado","New York"
$dropdownItems2 = 0,1,2,3,4,5,6,7,8,9

$dropdown1 = CreateDropdown ($sidebarSize + 150) 20 ($windowWidth - ($sidebarSize + 470)) 40 $dropdownItems1
CreateText "Input" ($sidebarSize + 10) 22 100 30 14 "Black" "#4D95DC";
$dropdown2 = CreateDropdown ($sidebarSize + 580) 20 ($windowWidth - ($sidebarSize + 750)) 40 $dropdownItems2
CreateText "Input" ($sidebarSize + 470) 22 100 30 14 "Black" "#4D95DC";
$dropdown3 = CreateDropdown ($sidebarSize + 710) 20 ($windowWidth - ($sidebarSize + 750)) 40 $dropdownItems2
CreateText "Input" ($sidebarSize + 620) 22 100 30 14 "Black" "#4D95DC";

CreateLines 

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
$database.ForEach( {
    $buffer = New-Object System.Windows.Forms.ListViewItem($_.name)
    $buffer.SubItems.Add($_.description)
    $List.Items.AddRange(($buffer))
})

$Button1.Add_Click({
     
        $buffer = "Input" + ": " + $dropdown2.selecteditem + "`n" 
        $buffer += "Input" + ": " + $dropdown3.selecteditem + "`n"     
        $buffer += "Input 1" + ": " + $input1.text + "`n"
        $buffer += "Input 2" + ": " + $input2.text + "`n"
        $buffer += "Input 3" + ": " + $input3.text + "`n" 
        $buffer += "Input 4" + ": " + $dropdown1.selecteditem + "`n`n" 
        If($List.SelectedIndices -eq "null"){
            $buffer += "Empty"
        }
        
        $values.forEach({
            
            $buffer += "-" + $_.text + "`n"
         
        })

        If($Option1.Checked){
            $buffer +=  "`n" + $Label4.Text + ": " + $input4.text + "`n"
            $buffer += $Label5.Text + ": " + $input5.text + "`n"
            $buffer += $Label6.Text + ": " + $input6.text + "`n"
        }

        Set-Clipboard -Value $buffer
    })

$Button2.Add_Click({
        $buffer = "/Offerra "
        $buffer += $address.text
        Start-Process -FilePath "C:\Windows\System32\msra.exe" -Args $buffer
        
})

$Button3.Add_Click({
        AddLine
})

$Button4.Add_Click({
        RemoveLine
})

$List.Add_Click({
    LoadLines $database[$List.SelectedIndices].instructions
})





#Render code

CreateSymbol "@" 5 24 30 20 18 "White" "#464C58";
CreateText "Template Tool" 28 10 174 50 18 "White" "#464C58";

$Form.Controls.Add($List)
CreatePanel 0 0 $sidebarSize 70 "#464C58";
CreatePanel 0 0 $sidebarSize $windowHeight "#525967"; 
CreatePanel 0 0 $windowWidth 70 "#4D95DC"; 

#Copy Button





$Form.ShowDialog()