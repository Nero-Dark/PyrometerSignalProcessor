object MainForm: TMainForm
  Left = 480
  Top = 154
  BorderStyle = bsSizeToolWin
  Caption = 'Pyrometer Signal Processor'
  ClientHeight = 797
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Chart2: TChart
    Left = 8
    Top = 271
    Width = 1002
    Height = 249
    Cursor = crCross
    Legend.CheckBoxes = True
    Legend.LegendStyle = lsSeries
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.LabelsFormat.Font.Color = clWhite
    BottomAxis.Title.Caption = 'Time (mks)'
    BottomAxis.Title.Font.Color = clWhite
    LeftAxis.LabelsFormat.Font.Color = clWhite
    LeftAxis.Title.Caption = 'Signal (V)'
    LeftAxis.Title.Font.Color = clWhite
    RightAxis.Title.Caption = 'Temperature (K)'
    View3D = False
    Color = clBlack
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      44
      15
      44)
    ColorPaletteIndex = 13
    object RefSignalSeries: TLineSeries
      SeriesColor = clAqua
      Title = 'RefSignalSeries'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object MainSignalSeries: TLineSeries
      SeriesColor = clLime
      Title = 'MainSignalSeries'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object AverSignalSeries: TLineSeries
      Marks.Emboss.Clip = True
      Marks.Font.Color = 352321535
      Marks.Frame.Color = clWhite
      Marks.Frame.Visible = False
      Marks.Shadow.Clip = True
      Marks.Transparent = True
      Marks.Visible = True
      Marks.BackColor = clBlack
      Marks.Callout.ArrowHead = ahLine
      Marks.Callout.ArrowHeadSize = 6
      Marks.Callout.Length = 17
      Marks.Clip = True
      Marks.Color = clBlack
      SeriesColor = clYellow
      Title = 'AverSingnalSeries'
      Brush.BackColor = clDefault
      Pointer.Brush.Color = clYellow
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 489
    Height = 265
    Caption = 'Options'
    TabOrder = 1
    object Chart1: TChart
      Left = 133
      Top = 124
      Width = 344
      Height = 134
      Legend.Visible = False
      Title.Font.Color = clWhite
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      BottomAxis.LabelsFormat.Font.Color = clWhite
      BottomAxis.Title.Caption = 'Time (mks)'
      BottomAxis.Title.Font.Color = clWhite
      LeftAxis.LabelsFormat.Font.Color = clWhite
      LeftAxis.Title.Caption = 'Signal (V)'
      LeftAxis.Title.Font.Color = clWhite
      View3D = False
      Color = clBlack
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object DCRefSeries: TLineSeries
        SeriesColor = clAqua
        Title = 'DCSeries1'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object DCMainSeries: TLineSeries
        SeriesColor = clLime
        Title = 'DCSeries2'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 3
      Top = 201
      Width = 52
      Height = 57
      Caption = 'PIF'
      ItemIndex = 1
      Items.Strings = (
        '4/1'
        '4/2')
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 61
      Top = 201
      Width = 66
      Height = 57
      Caption = 'Frequency'
      ItemIndex = 0
      Items.Strings = (
        '200 kHz'
        '1 MHz')
      TabOrder = 2
      OnClick = RadioGroup2Click
    end
    object GroupBox2: TGroupBox
      Left = 314
      Top = 13
      Width = 163
      Height = 76
      Caption = 'Referense Signal Options'
      TabOrder = 3
      object Label11: TLabel
        Left = 7
        Top = 25
        Width = 90
        Height = 16
        Caption = 'Switch level (V)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object SwitchValueEdit: TEdit
        Left = 103
        Top = 20
        Width = 50
        Height = 21
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 7
        Top = 50
        Width = 57
        Height = 15
        BiDiMode = bdRightToLeft
        Caption = 'Manual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 13
      Width = 185
      Height = 105
      Caption = 'Calculation Options'
      TabOrder = 4
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 108
        Height = 16
        Caption = 'Dots on half period'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 47
        Width = 47
        Height = 16
        Caption = 'First dot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 74
        Width = 87
        Height = 16
        Caption = 'Amount of dots'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object AmountDotsEdit: TEdit
        Left = 130
        Top = 73
        Width = 50
        Height = 21
        TabOrder = 0
      end
      object FirstDotEdit: TEdit
        Left = 130
        Top = 46
        Width = 50
        Height = 21
        TabOrder = 1
      end
      object HalfPerDotsEdit: TEdit
        Left = 130
        Top = 19
        Width = 50
        Height = 21
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 3
      Top = 124
      Width = 124
      Height = 71
      Caption = 'Koeff Options'
      TabOrder = 5
      object Label5: TLabel
        Left = 9
        Top = 20
        Width = 30
        Height = 16
        Caption = 'From'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 24
        Top = 47
        Width = 15
        Height = 16
        Caption = 'To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object KRangeToEdit: TEdit
        Left = 61
        Top = 46
        Width = 50
        Height = 21
        TabOrder = 0
        Text = '10'
      end
      object KRangeFromEdit: TEdit
        Left = 61
        Top = 19
        Width = 50
        Height = 21
        TabOrder = 1
        Text = '2,5'
      end
    end
    object GroupBox5: TGroupBox
      Left = 194
      Top = 13
      Width = 114
      Height = 105
      Caption = 'Dark Voltage Options'
      TabOrder = 6
      object Label9: TLabel
        Left = 3
        Top = 20
        Width = 36
        Height = 16
        Caption = 'For U:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 3
        Top = 47
        Width = 36
        Height = 16
        Caption = 'For D:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 3
        Top = 76
        Width = 54
        Height = 16
        Caption = 'Signal UP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DCUEdit: TEdit
        Left = 61
        Top = 19
        Width = 50
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object DCDEdit: TEdit
        Left = 61
        Top = 46
        Width = 50
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object SignalUpEdit: TEdit
        Left = 61
        Top = 73
        Width = 50
        Height = 21
        TabOrder = 2
      end
    end
    object CalcBtn: TButton
      Left = 402
      Top = 95
      Width = 75
      Height = 25
      Caption = 'Calculate'
      Enabled = False
      TabOrder = 7
      OnClick = CalcBtnClick
    end
    object ResetBtn: TButton
      Left = 321
      Top = 95
      Width = 75
      Height = 25
      Caption = 'Reset All'
      Enabled = False
      TabOrder = 8
      OnClick = ResetBtnClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 778
    Width = 1018
    Height = 19
    Panels = <>
  end
  object StringGrid1: TStringGrid
    Left = 503
    Top = 8
    Width = 507
    Height = 257
    ColCount = 6
    DefaultColWidth = 83
    FixedCols = 0
    RowCount = 10
    TabOrder = 3
  end
  object Chart3: TChart
    Left = 8
    Top = 526
    Width = 1002
    Height = 249
    Cursor = crCross
    Legend.CheckBoxes = True
    Legend.LegendStyle = lsSeries
    Legend.Visible = False
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.LabelsFormat.Font.Color = clWhite
    BottomAxis.Title.Caption = 'Time (mks)'
    BottomAxis.Title.Font.Color = clWhite
    LeftAxis.LabelsFormat.Font.Color = clWhite
    LeftAxis.Title.Caption = 'Temperature (K)'
    LeftAxis.Title.Font.Color = clWhite
    RightAxis.Title.Caption = 'Temperature (K)'
    View3D = False
    Color = clBlack
    TabOrder = 4
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      44
      15
      44)
    ColorPaletteIndex = 13
    object TUpSeries: TLineSeries
      SeriesColor = clRed
      Title = 'TUpSeries'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object TDownSeries: TLineSeries
      SeriesColor = clBlue
      Title = 'TDownSeries'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object TAverageSeries: TLineSeries
      SeriesColor = clLime
      Title = 'TAverageSeries'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object MainMenu1: TMainMenu
    Left = 976
    Top = 8
    object Main1: TMenuItem
      Caption = 'Main'
      object LoadFile1: TMenuItem
        Caption = 'Load File'
        OnClick = LoadFile1Click
      end
      object SaveFile1: TMenuItem
        Caption = 'Save File'
        OnClick = SaveFile1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Manual1: TMenuItem
        Caption = 'Manual'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Aboutprogram1: TMenuItem
        Caption = 'About program'
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 976
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    Left = 976
    Top = 104
  end
end
