object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 458
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 32
    Top = 32
    Width = 39
    Height = 13
    Caption = #22995#21517#65306
  end
  object lbSex: TLabel
    Left = 32
    Top = 168
    Width = 39
    Height = 13
    Caption = #24615#21035#65306
  end
  object lbAge: TLabel
    Left = 32
    Top = 96
    Width = 39
    Height = 13
    Caption = #24180#40836#65306
  end
  object lbHobby: TLabel
    Left = 32
    Top = 216
    Width = 39
    Height = 13
    Caption = #29233#22909#65306
  end
  object lbAddress: TLabel
    Left = 32
    Top = 280
    Width = 39
    Height = 13
    Caption = #20303#22336#65306
  end
  object edtName: TEdit
    Left = 104
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtAge: TEdit
    Left = 104
    Top = 93
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cbbAddress: TComboBox
    Left = 104
    Top = 277
    Width = 121
    Height = 21
    TabOrder = 2
    Items.Strings = (
      #21271#20140#28023#28096)
  end
  object btnSave: TBitBtn
    Left = 56
    Top = 384
    Width = 75
    Height = 25
    Caption = 'btnSave'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object rgSex: TRadioGroup
    Left = 96
    Top = 144
    Width = 185
    Height = 57
    Caption = 'rgSex'
    ItemIndex = 0
    Items.Strings = (
      #30007
      #22899)
    TabOrder = 4
  end
  object chkListenMusic: TCheckBox
    Left = 96
    Top = 216
    Width = 49
    Height = 17
    Caption = #21548#27468
    TabOrder = 5
  end
  object chkPlayGame: TCheckBox
    Left = 200
    Top = 215
    Width = 65
    Height = 17
    Caption = #29609#28216#25103
    TabOrder = 6
  end
end
