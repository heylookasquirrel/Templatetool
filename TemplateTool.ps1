Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Template Tool"
$Form.Size = New-Object System.Drawing.Size(400,500)
$Form.FormBorderStyle = "FixedDialog"

$About = New-Object System.Windows.Forms.Label
$About.Text = "Written by: Jacob Gonzalez"
$About.Location = New-Object System.Drawing.Size(5,454)
$About.Size = New-Object System.Drawing.Size(300,20)

#Normal Inputs
$Label1 = New-Object System.Windows.Forms.Label
$Label1.Text = "Input1"
$Label1.Location = New-Object System.Drawing.Size(10,24)
$Template1 = New-Object System.Windows.Forms.Textbox
$Template1.Location = New-Object System.Drawing.Size(56,20)
$Template1.Size = New-Object System.Drawing.Size(300,20)

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "Input2"
$Label2.Location = New-Object System.Drawing.Size(10,54)
$Template2 = New-Object System.Windows.Forms.Textbox
$Template2.Location = New-Object System.Drawing.Size(56,50)
$Template2.Size = New-Object System.Drawing.Size(300,20)

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = "Input3"
$Label3.Location = New-Object System.Drawing.Size(10,84)
$Template3 = New-Object System.Windows.Forms.Textbox
$Template3.Location = New-Object System.Drawing.Size(56,80)
$Template3.Size = New-Object System.Drawing.Size(300,20)

#Copy Button
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Text = "Copy"
$Button1.Size = New-Object System.Drawing.Size(60,30)
$Button1.Location = New-Object System.Drawing.Size(310,420)

#Screenshare Button
$Button2 = New-Object System.Windows.Forms.Button
$Button2.Text = "Screenshare"
$Button2.Size = New-Object System.Drawing.Size(100,30)
$Button2.Location = New-Object System.Drawing.Size(10,420)
$Address = New-Object System.Windows.Forms.Textbox
$Address.Location = New-Object System.Drawing.Size(120,425)
$Address.Size = New-Object System.Drawing.Size(70,20)

#List object
$List = New-Object System.Windows.Forms.ListView
$List.Size = New-Object System.Drawing.Size(360,114)
$List.Location = New-Object System.Drawing.Size(10,114)
$List.MultiColumn = "true";
$List.FullRowSelect = "true";
$List.View = 'Details'
$List.Columns.Add('Issue')
$List.Columns.Add('Description')
$List.VerticalScrollbar = "true";
$List.FormattingEnabled = "true";
$List.ScrollAlwaysVisible = "true";
$List.HideSelection = "false";
$List.BackColor = "white"
$List.Columns[0].Width = 100
$List.Columns[1].Width = 500

#populate list
$object.ForEach( {
    $buffer = New-Object System.Windows.Forms.ListViewItem($_.name)
    $buffer.SubItems.Add($_.description)
    $List.Items.AddRange(($buffer))
})

#Other Inputs
$Label4 = New-Object System.Windows.Forms.Label
$Label4.Text = "Input4"
$Label4.Location = New-Object System.Drawing.Size(10,254)
$Template4 = New-Object System.Windows.Forms.Textbox
$Template4.Location = New-Object System.Drawing.Size(56,250)
$Template4.Size = New-Object System.Drawing.Size(300,20)

$Label5 = New-Object System.Windows.Forms.Label
$Label5.Text = "Input5"
$Label5.Location = New-Object System.Drawing.Size(10,286)
$Template5 = New-Object System.Windows.Forms.Textbox
$Template5.Location = New-Object System.Drawing.Size(56,280)
$Template5.Size = New-Object System.Drawing.Size(300,20)

$Label6 = New-Object System.Windows.Forms.Label
$Label6.Text = "Input6"
$Label6.Location = New-Object System.Drawing.Size(10,314)
$Template6 = New-Object System.Windows.Forms.Textbox
$Template6.Location = New-Object System.Drawing.Size(56,310)
$Template6.Size = New-Object System.Drawing.Size(300,20)

$Label7 = New-Object System.Windows.Forms.Label
$Label7.Text = "Input6"
$Label7.Location = New-Object System.Drawing.Size(235,427)
$Option1 = New-Object System.Windows.Forms.CheckBox
$Option1.Location = New-Object System.Drawing.Size(280,422)

$Button1.Add_Click({
        $buffer = $Label1.Text + ": " + $Template1.text + "`n"
        $buffer += $Label2.Text + ": " + $Template2.text + "`n"
        $buffer += $Label3.Text + ": " + $Template3.text + "`n"

        If($List.SelectedIndices -eq "null"){
            $buffer += "Empty"
        }
        $buffer += $object[$List.SelectedIndices].instructions
        $List.SelectedIndices
        If($Option1.Checked){
            $buffer +=  "`n" + $Label4.Text + ": " + $Template4.text + "`n"
            $buffer += $Label5.Text + ": " + $Template5.text + "`n"
            $buffer += $Label6.Text + ": " + $Template6.text + "`n"
        }

        Set-Clipboard -Value $buffer
    })

$Button2.Add_Click({
        $buffer = "/Offerra " + "test"
        Start-Process -FilePath "C:\Windows\System32\msra.exe" -Args $buffer
        
    })

#Render to form
$Form.Controls.Add($Button1)
$Form.Controls.Add($Button2)
$Form.Controls.Add($Address)
$Form.Controls.Add($About)

$Form.Controls.Add($Template1)
$Form.Controls.Add($Label1)
$Form.Controls.Add($Template2)
$Form.Controls.Add($Label2)
$Form.Controls.Add($Template3)
$Form.Controls.Add($Label3)
$Form.Controls.Add($List)

$Form.Controls.Add($Template4)
$Form.Controls.Add($Label4)
$Form.Controls.Add($Template5)
$Form.Controls.Add($Label5)
$Form.Controls.Add($Template6)
$Form.Controls.Add($Label6)


$Form.Controls.Add($Option1)
$Form.Controls.Add($Label7)


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
-Solved
"
},
@{
    name = "Example 2"
    description = "Gonzalez"
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
-Solved
"
},
@{
    name = "Example 2"
    description = "Gonzalez"
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
-Solved
"
},


$Form.ShowDialog()