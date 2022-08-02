object FormGroup: TFormGroup
  Left = 0
  Top = 0
  Caption = 'Group'
  ClientHeight = 441
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 57
    Align = alTop
    TabOrder = 0
    object LabeledEditGroupName: TLabeledEdit
      Left = 12
      Top = 23
      Width = 173
      Height = 23
      EditLabel.Width = 66
      EditLabel.Height = 15
      EditLabel.Caption = 'Group name'
      EditLabel.Color = clGrayText
      EditLabel.ParentColor = False
      TabOrder = 0
      Text = ''
    end
    object ButtonSave: TButton
      Left = 216
      Top = 22
      Width = 129
      Height = 25
      Caption = 'Save Group'
      TabOrder = 1
      OnClick = ButtonSaveClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 366
    Height = 228
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    object ListBoxWidgets: TListBox
      Left = 6
      Top = 6
      Width = 350
      Height = 212
      Align = alClient
      ItemHeight = 15
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 285
    Width = 366
    Height = 137
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 0
      Width = 132
      Height = 15
      Caption = 'Widgets out of the goup:'
    end
    object ComboBoxWidgets: TComboBox
      Left = 12
      Top = 19
      Width = 173
      Height = 23
      TabOrder = 0
      Text = 'Add Widgets'
    end
    object ButtonAddWidget: TButton
      Left = 216
      Top = 17
      Width = 129
      Height = 25
      Caption = 'Add Widget to Group'
      TabOrder = 1
      OnClick = ButtonAddWidgetClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 422
    Width = 366
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <>
    ParentBiDiMode = False
    SimplePanel = True
  end
end
