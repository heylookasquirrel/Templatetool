Add-Type -AssemblyName System.Windows.Forms

$windowHeight = 600;
$windowWidth = 1000;
$sidebarSize = 210;

# This base64 string holds the bytes that make up the orange 'G' icon (just an example for a 32x32 pixel image)
$iconBase64      = 'iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAM1UlEQVR4nO2be2wc13XGf/vmPsh9aElKlKgVLVktubZMW1JsSVXEqA6EoKrrApECA03rBm0EqE6LBAWCJgUsFwkgFY2DtIZTJwLqwmmRWkVRG0YEN5G9CiNTikSZtDWkbEmkaUl8iPt+c5/9Y2dWw+XM7HJJGSnqDxjszJ07d+757jn3nnPmLnyK/9/QrW5zfjfQzCEhsvxDiKykxyskwL8dqD0+acyKv9PAaeC7IGQafXiZBNQXWKfTRfUGQ8JoMiUtLZaM1WZbsLU6Cq0uZ6nN7So7PR6Dc43H6PK4LW0et7XN7bK3Op1tiVgsbjOVUuH5UCY8H1oI3wkWwvOhYiQU1sXCUX0iljCmkylLNpO15nM5R7FYbC2Xyy6Vji4Ao8BJ4L+gGIar5RUQ4D8ESMciWKzW8S5fd7Bv+8M8+OgOb5aW3sbaVMYX9j3QcN07d4IzRr3eMHN7JvzGq6/NvfXGzz8DWGuqlYE48AwIP6ltow4BSwU3ms3jDo83uOd3966KwPWwbdsW1rtbGq6fz+UXxkaFGye//8+ha2Mf+svlspuKnDEUSNAgwH8IeFW6srs9Qz0P7+TxJw/uWqYM9xQ7Ht5Ke5tZ8V65XC6nk6nE1//ka+9P3fhoj1j8FAg/leqoEHBX+N9UwZXgbLXyyIObMBt0Jb1er5fK47F4+BtP/+XVmxNTu8WiwyCcAnUCXgUO2d2eoT9/7rnfeMGVYDToWdfhpMe3FrvFAMBXnvjjodtTN3cBp0A4DKBf+qh/A6LN9zy88xPr8GqjUCxxcybCL8+Pc/rsFW5Hsuz7g4NL6ikQQDeATq+f+b+g9o3ivfeuK5YbFco2ABhNphCwbqUvFsYn5rPxeCQdiyRTsWgmHYsUMvEY2WTSmMukWwoLC62lYsGtNxgjRoslYbbasi0OR8Ha5sTmdBvtTpfV5nQ7Wtra3P7e+9pX0pfXXvmPJWWqBJht9sRyGh99d2wqOjczH52dTsXvzOpS0Ygtl0m3l4pFH1C348VCvr1YyLOQSpII3lGs87a4BHt9PXT2bPHu3L2j4SX4F//9xlAqEpY0+pRUrkRAN4C11Zmr1+iNj+8wefnXQ5PvXkRs3KdSdU48ZmXnczXla4FOhaNaXsjleqOz00Rnp7l+4RwXXzs14u32Rdf3Pejas39vf+1Lz701OHJ77P1o8OaUK5dJy4QXNAnYAODweOrJz+TlXw9deetN+TxxHbi29FdQNsDFeE/79lI3PJdJ909/OM70h+OMvvlGlQyZ0LWkVGd/CRoEeJW9Cxkm370oa3gxs6sPYRgYvnvtHwD2AQPAgJyMGgTE4ywIgdqbqibgWONt1erOxXcujS+2qXspvBKEABXBnqshQ0IAFaHlUCIAAId7zRqtB+cmrwfF0+FPXvhayMlYHlQJSEZCIbhfdRkMTk1Kp8NqderDvwmQDp/sfFNNxY/EIwc4ZeVXgDPAZRAWmumBEgE3gQ3JUFBzGUyGg17xdJkELLbdBh/apFL+JeDvgCL408Ag8Pcg/LLR3igRcAsgGQ5qLoMOjzcYnZ2GZWWBKjGGvESn198yWVqCLY7WpMPtKbS2dxrb2jscrd5279NP7Wfq2kTwxtVryY+uTRYMeh3tne0Gl9tlfG94dGH04og3lUjeD1iANuD3Koc/DPwNFH+slgiRoEFAWFMUr6+H5RFwV3iz1Va7fm9QeuKyMM22bQ9sWP/bD/BUTU7gD//oi5TL5XKpVCpmM9nEO2/96upL//CiORGLPwR4gJfA8C3ouw/GSmq9UjMBMomY5jLY2bPFe/3COYDt4O8DYUxDeLsk/AP7DwwtJ8aQfHjdQ1voci0mQafT6QwGg9HusLd+/okDOz//xAHi0Xj0b//im+9/cOXq7wA+0E1A32YYKyq1rxQM3QLIpVOay+DO3Tt69UbjDUnCOnLYxN9UswHW6Oh1Tp+9Uo3sbkeyivXaXG2uf/y3H+59+Wf/Pg2UqJDwY+gzKNVXNYFCPq+5DAJYW9vupCLhzUBfnap2AJ1Ol5XOVwJJKyTX0WDQs3vHViyGcs5kMpkB1q1ft/7LR//0V6+8+C+ii64zAUu0QEkDbgKUS6V1ly+pxJAinO2d0tLTmAbodA2nq5eDYrHE4IWr/OKdD8xvn/+ASCoPQM/999mBvNazCgQIt4AxgPCtj+e1HvZs2GgRTxvTAL2+qbV6Ocgu5Dl/6QNOn73C4JnBGKCZUVVzhASgL3z7pmaHPes3doin/sr6rup22gH0TRAgj+i0Ij8lzKd10gB1gqA4aagRMAYQuzNrUbkPwCM7t20+/5+2ETHq2kfFHVWCDUBvMNYNsS++c2l8bvJ6MDg1STIc9BZyuaqwSpHf2i2/1b+5Og6LIRsgVWhpANlEvG4iw9vti4oR2ADqvnhFAwyGglZbgnBj7txP/1UpyREQjwFqIr+urb2Bzc8cHajXTzUoTYIgakCxUNjy6olj4xPTIdUG1vc9KH2eGhDT6UqwAxhMJs0JKR2LSN7XDPAj4AiwA4TPgfBc5ZfPAcekZ2Tz0BKEb3+snFqSQYUAQUD08dPphaBynQr27N/bb3d7hsRLNQJsAAajSdEZkZCKRqT4YxqEIyD8SMwDyPsWoEIQRrN5XMuvCN/6WJpzVJ00NQ0AkYBMutKGlhbI0ueHxGCnFnYAo8ms6pICJCMhqcMzWvUQ3W+Hx6s6OBPTIWLzc5J2CGr16hKQzxe8GnUAePzJg7vMVtuIeLlPoYoNwGg2awYm6WhE0pDpOq/cDpV4RAuZRFyaBJvXgFKp3Hvh5R+MgLYWeLt9UfF0QOF2ZQ6oR0AsKrmrGhrgP4RIQGfPFtXBCd2cGi8VCpvFy2Y0QBhGXNaSyUxUvV4FdSZDO4DJ0qL5NXohlZRUVksDDkHlm6VaWnxiOoTws1PyjFVTGgAiAdlMTm0jQhV1JkMbgMli0SQgv5CVAjAVDah+rq/72U6au6iTsKlHwFmAYrHU34gZ1EyGchIqk6ClRfN9xXxeysWraUB19OtFlbK5ayUEVJONDZnB408e3CXTgqOyW5IGKIakjaGx0Z+YDnHh5R+MlEplyTxWpAGgYAZaWtC373Fpi8oA+J8VzyUNUE3CAhhMJskR6lK4fRQaG33ZYAWW+hGL0QgBVTN4/fhXRupV3rN/b3/X1t6AeHlM9AvESdBi0nrWZGmRHKGabLT/WcTVRUbwEkgDIxusgFpdCQ0QcNcMwFU1Ay0tOPzM0QGZX/AsVRNo0UyzWewOaeaSaYB/ANH17draG6gXCZ47+fxQsViS6pzVqguNaQBUCbDXXQ0kPHSguhlhAMkEzBZNAmxOl+QIiRrgfxZ4GyqJ1MMaQY80IPFYWio6Ve+rEDROgMikof/140ekSU5TC2pMYROA0WLWTE7YXG5pkuwC/9uII2+22kaOnjihOvJSP86dfH4ony8s+QSuhQYJEAJ3G+xQtcFa1JgCRrNFkwCHe43kCB1EtPmurb0BLeHlqBn91SQAgBcrP4b+My8cD0iFWloAcPTEiaomGE0mm1Zdu8tdzUSbrbaRnU8e1lR7+fubGX2AZazL8x9BB8BAPlfYFL0+OrKh/7G1AO5WTbnwf2bnpqKldaStvbPb41RPCkfjmdLE8HlH19bewNPf/tZjG3t8a7XalZM/+vP/yVH5IHKqkjtoDMt0TObPQscAsCm3UJi8f/dnuwEiiUxdEjb2+NZGYim0CEhkCw5nx9qRL3zpi4810ptIopJkPv297wwVi6VtYvFhmNdM5srRhGfWkQYOlUql7uDVy0MbH9nVDfW1ANAUXrpfb9QlSKN/5oXjgWw2t1csPgxC3aVPjuXMASIEcTcIRMKJhrzD1Ybc7lPJ7IBYfKyZfQpNEADACajkCt78/ncHazt2LyG9Y/gnL9wIBePyHSrL3hwBTZkAwPwMdMwAv18slnxzwqVB347dPmhsPmgW8pGfm41INi+IydKmsILobH4YOrqA7dlszpeYfH+866FH22H1SZiYDlUnvDMvHA/EoinJ5gUQGv+DgQJW4T9D/kuIKaqu9WvGd3z5a9UszX1ddb+vaqLWpE5/7zs1a/3iLW/NYJX+NHWXBJfbMfjZI38tjVBTJNQK/vrxI0M6XVdHuVyWcnzHmrX5Wqziv8bukmCxmAYPfP3be+V3GyGiVvBzJ58fisfSyEYdZHv9VwOr/be5l4CvAuj1unG3pzW658++sSh5UUuE0sqhIvgpKiOvsRNl+VhlAgD8XwVekq4MBv1Ii9UcdTisrkef/ivFoObSK/80nk4vBDPpBfL5gleWzoJ7vAv1HhAA4r7eb1KTHZaTAZXUVTaTc8kSGHJ8Attv7xkBEpa1J3B48aGdy1st3GMC5FDczwsN7un9FJ/i3uB/ATl4QdxNXyg5AAAAAElFTkSuQmCC'
$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage       = [System.Drawing.Image]::FromStream($stream, $true)


# This base64 string holds the bytes that make up the orange 'G' icon (just an example for a 32x32 pixel image)
$creditsBase64      = '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'
$creditsBytes       = [Convert]::FromBase64String($creditsBase64)
$Cstream          = New-Object IO.MemoryStream($creditsBytes, 0, $creditsBytes.Length)
$Cstream.Write($iconBytes, 0, $iconBytes.Length);
$CreditsImage       = [System.Drawing.Image]::FromStream($Cstream, $true)

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
$Form.Icon       = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())

$credits = new-object Windows.Forms.PictureBox
$credits.Width =  199
$credits.Height =  32
$credits.Location = New-Object System.Drawing.Size(0,($windowHeight - 64)) 
$credits.Image = $CreditsImage;
$form.Controls.Add($credits)


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