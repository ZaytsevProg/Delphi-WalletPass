object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PKPASS_DEMO'
  ClientHeight = 945
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PC_Main: TPageControl
    Left = 0
    Top = 0
    Width = 509
    Height = 945
    Cursor = crHandPoint
    ActivePage = TAB_PKPASS
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object TAB_PKPASS: TTabSheet
      Caption = 'PKPASS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      object Label1: TLabel
        Left = 3
        Top = 16
        Width = 63
        Height = 16
        Caption = 'Pass Json'
      end
      object Label2: TLabel
        Left = 3
        Top = 72
        Width = 104
        Height = 16
        Caption = 'background.png'
      end
      object SB_PKCS12: TSpeedButton
        Left = 461
        Top = 731
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_PKCS12Click
      end
      object Label11: TLabel
        Left = 3
        Top = 770
        Width = 146
        Height = 16
        Caption = 'Certificate WWDR PEM'
      end
      object SB_WWDR: TSpeedButton
        Left = 461
        Top = 784
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_WWDRClick
      end
      object Label3: TLabel
        Left = 3
        Top = 124
        Width = 129
        Height = 16
        Caption = 'background@2x.png'
      end
      object Label5: TLabel
        Left = 3
        Top = 176
        Width = 54
        Height = 16
        Caption = 'icon.png'
      end
      object Label6: TLabel
        Left = 3
        Top = 232
        Width = 79
        Height = 16
        Caption = 'icon@2x.png'
      end
      object Label7: TLabel
        Left = 3
        Top = 346
        Width = 55
        Height = 16
        Caption = 'logo.png'
      end
      object Label8: TLabel
        Left = 3
        Top = 400
        Width = 80
        Height = 16
        Caption = 'logo@2x.png'
      end
      object Label10: TLabel
        Left = 3
        Top = 454
        Width = 58
        Height = 16
        Caption = 'strip.png'
      end
      object Label12: TLabel
        Left = 3
        Top = 508
        Width = 83
        Height = 16
        Caption = 'strip@2x.png'
      end
      object Label13: TLabel
        Left = 3
        Top = 562
        Width = 91
        Height = 16
        Caption = 'thumbnail.png'
      end
      object Label14: TLabel
        Left = 3
        Top = 717
        Width = 120
        Height = 16
        Caption = 'Certificate PKCS12'
      end
      object SB_background: TSpeedButton
        Left = 461
        Top = 90
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_backgroundClick
      end
      object SB_background2x: TSpeedButton
        Left = 461
        Top = 138
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_background2xClick
      end
      object SB_icon: TSpeedButton
        Left = 461
        Top = 194
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_iconClick
      end
      object SB_icon2x: TSpeedButton
        Left = 461
        Top = 250
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_icon2xClick
      end
      object SB_logo: TSpeedButton
        Left = 461
        Top = 362
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_logoClick
      end
      object SB_logo2x: TSpeedButton
        Left = 461
        Top = 418
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_logo2xClick
      end
      object SB_strip: TSpeedButton
        Left = 461
        Top = 468
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_stripClick
      end
      object SB_strip2x: TSpeedButton
        Left = 461
        Top = 524
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_strip2xClick
      end
      object SB_thumbnail: TSpeedButton
        Left = 461
        Top = 580
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_thumbnailClick
      end
      object SB_thumbnail2x: TSpeedButton
        Left = 461
        Top = 630
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_thumbnail2xClick
      end
      object Label15: TLabel
        Left = 3
        Top = 616
        Width = 116
        Height = 16
        Caption = 'thumbnail@2x.png'
      end
      object SB_Pass_Json: TSpeedButton
        Left = 461
        Top = 34
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_Pass_JsonClick
      end
      object Label16: TLabel
        Left = 93
        Top = 695
        Width = 115
        Height = 16
        Caption = 'PKCS12 Password'
      end
      object Label18: TLabel
        Left = 3
        Top = 286
        Width = 79
        Height = 16
        Caption = 'icon@3x.png'
      end
      object SB_icon3x: TSpeedButton
        Left = 461
        Top = 300
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_icon3xClick
      end
      object B_CREATE_PKPASS: TButton
        Left = 3
        Top = 844
        Width = 278
        Height = 41
        Cursor = crHandPoint
        Caption = 'CREATE_PKPASS'
        TabOrder = 0
        OnClick = B_CREATE_PKPASSClick
      end
      object E_PKCS12: TEdit
        Left = 3
        Top = 731
        Width = 460
        Height = 24
        TabOrder = 1
      end
      object CB_WWDR: TCheckBox
        Left = 214
        Top = 670
        Width = 139
        Height = 17
        Cursor = crHandPoint
        Caption = 'PKCS12 + WWDR'
        TabOrder = 2
        OnClick = CB_WWDRClick
      end
      object E_WWDR: TEdit
        Left = 3
        Top = 784
        Width = 460
        Height = 24
        TabOrder = 3
      end
      object E_background: TEdit
        Left = 3
        Top = 90
        Width = 460
        Height = 24
        TabOrder = 4
      end
      object E_background2x: TEdit
        Left = 3
        Top = 138
        Width = 460
        Height = 24
        TabOrder = 5
      end
      object E_icon: TEdit
        Left = 3
        Top = 194
        Width = 460
        Height = 24
        TabOrder = 6
      end
      object E_icon2x: TEdit
        Left = 3
        Top = 250
        Width = 460
        Height = 24
        TabOrder = 7
      end
      object E_logo: TEdit
        Left = 3
        Top = 362
        Width = 460
        Height = 24
        TabOrder = 8
      end
      object E_logo2x: TEdit
        Left = 3
        Top = 418
        Width = 460
        Height = 24
        TabOrder = 9
      end
      object E_strip: TEdit
        Left = 3
        Top = 468
        Width = 460
        Height = 24
        TabOrder = 10
      end
      object E_strip2x: TEdit
        Left = 3
        Top = 524
        Width = 460
        Height = 24
        TabOrder = 11
      end
      object E_thumbnail: TEdit
        Left = 3
        Top = 584
        Width = 460
        Height = 24
        TabOrder = 12
      end
      object E_thumbnail2x: TEdit
        Left = 3
        Top = 630
        Width = 460
        Height = 24
        TabOrder = 13
      end
      object E_Pass_Json: TEdit
        Left = 3
        Top = 34
        Width = 460
        Height = 24
        TabOrder = 14
      end
      object E_Password: TEdit
        Left = 214
        Top = 693
        Width = 249
        Height = 24
        PasswordChar = '*'
        TabOrder = 15
      end
      object E_icon3x: TEdit
        Left = 3
        Top = 300
        Width = 460
        Height = 24
        TabOrder = 16
      end
      object CB_TYPE_PKPASS: TComboBox
        Left = 160
        Top = 0
        Width = 145
        Height = 24
        Cursor = crHandPoint
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 17
        Text = 'Boarding'
        Items.Strings = (
          'Boarding'
          'Coupon'
          'Event'
          'Generic'
          'StoreCard')
      end
    end
    object TAB_APN: TTabSheet
      Caption = 'APN'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 3
        Top = 72
        Width = 196
        Height = 16
        Caption = 'Certificate (in PKCS12 Format)'
      end
      object Label9: TLabel
        Left = 3
        Top = 134
        Width = 247
        Height = 16
        Caption = 'Save APN PEM Certificate to Directory'
      end
      object SB_Certificate_PKCS12: TSpeedButton
        Left = 461
        Top = 88
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_Certificate_PKCS12Click
      end
      object SB_APN: TSpeedButton
        Left = 461
        Top = 148
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_APNClick
      end
      object Label17: TLabel
        Left = 3
        Top = 32
        Width = 115
        Height = 16
        Caption = 'PKCS12 Password'
      end
      object SB_CERT_PEM: TSpeedButton
        Left = 461
        Top = 280
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_CERT_PEMClick
      end
      object E_Certificate_PKCS12: TEdit
        Left = 3
        Top = 88
        Width = 460
        Height = 24
        TabOrder = 0
      end
      object E_Save_APN: TEdit
        Left = 3
        Top = 148
        Width = 460
        Height = 24
        TabOrder = 1
      end
      object B_CREATE_APN: TButton
        Left = 3
        Top = 192
        Width = 217
        Height = 41
        Cursor = crHandPoint
        Caption = 'CREATE_APN'
        TabOrder = 2
        OnClick = B_CREATE_APNClick
      end
      object E_Password1: TEdit
        Left = 124
        Top = 29
        Width = 249
        Height = 24
        PasswordChar = '*'
        TabOrder = 3
      end
      object M_CERT_ATTRIBUTES: TMemo
        Left = 3
        Top = 310
        Width = 481
        Height = 161
        Lines.Strings = (
          'M_CERT_ATTRIBUTES')
        ScrollBars = ssBoth
        TabOrder = 4
      end
      object B_GET_ATTRIBUTES_PKCS12: TButton
        Left = 3
        Top = 488
        Width = 196
        Height = 41
        Cursor = crHandPoint
        Caption = 'GET_ATTRIBUTES_PKCS12'
        TabOrder = 5
        OnClick = B_GET_ATTRIBUTES_PKCS12Click
      end
      object E_CERT_PEM: TEdit
        Left = 3
        Top = 280
        Width = 460
        Height = 24
        TabOrder = 6
      end
      object B_GET_ATTRIBUTES_PEM: TButton
        Left = 211
        Top = 488
        Width = 196
        Height = 41
        Cursor = crHandPoint
        Caption = 'GET_ATTRIBUTES_PEM'
        TabOrder = 7
        OnClick = B_GET_ATTRIBUTES_PEMClick
      end
    end
    object TAB_ConvertCert: TTabSheet
      Caption = 'Convert Pem To P12 '
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label19: TLabel
        Left = 3
        Top = 24
        Width = 174
        Height = 16
        Caption = 'Certificate (in PEM Format)'
      end
      object SB_Certificate: TSpeedButton
        Left = 461
        Top = 46
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_CertificateClick
      end
      object SB_PrivateKey: TSpeedButton
        Left = 461
        Top = 108
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_PrivateKeyClick
      end
      object Label20: TLabel
        Left = 3
        Top = 86
        Width = 181
        Height = 16
        Caption = 'Private Key (in PEM Format)'
      end
      object Label21: TLabel
        Left = 3
        Top = 160
        Width = 196
        Height = 16
        Caption = 'CA Certificate (in PEM Format)'
      end
      object SB_CERT_CA: TSpeedButton
        Left = 461
        Top = 182
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_CERT_CAClick
      end
      object Label22: TLabel
        Left = 3
        Top = 240
        Width = 63
        Height = 16
        Caption = 'Password'
      end
      object Label23: TLabel
        Left = 222
        Top = 240
        Width = 89
        Height = 16
        Caption = 'Friendly Name'
      end
      object Label24: TLabel
        Left = 3
        Top = 328
        Width = 239
        Height = 16
        Caption = 'Save PKCS12 Certificate to Directory'
      end
      object SB_Save_PKCS12: TSpeedButton
        Left = 461
        Top = 350
        Width = 23
        Height = 24
        Cursor = crHandPoint
        Caption = '...'
        OnClick = SB_Save_PKCS12Click
      end
      object E_Certificate: TEdit
        Left = 3
        Top = 46
        Width = 460
        Height = 24
        TabOrder = 0
      end
      object E_PrivateKey: TEdit
        Left = 3
        Top = 108
        Width = 460
        Height = 24
        TabOrder = 1
      end
      object E_CERT_CA: TEdit
        Left = 3
        Top = 182
        Width = 460
        Height = 24
        TabOrder = 2
      end
      object E_Password2: TEdit
        Left = 3
        Top = 262
        Width = 194
        Height = 24
        PasswordChar = '*'
        TabOrder = 3
      end
      object E_Friendly_Name: TEdit
        Left = 222
        Top = 262
        Width = 241
        Height = 24
        TabOrder = 4
      end
      object E_Save_PKCS12: TEdit
        Left = 3
        Top = 350
        Width = 460
        Height = 24
        TabOrder = 5
      end
      object B_CONVERT_PEM_To_PKCS12: TButton
        Left = 3
        Top = 408
        Width = 196
        Height = 41
        Cursor = crHandPoint
        Caption = 'CONVERT_PEM_To_PKCS12'
        TabOrder = 6
        OnClick = B_CONVERT_PEM_To_PKCS12Click
      end
    end
    object TAB_CERT_REQUEST: TTabSheet
      Caption = 'CERT REQUEST'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label25: TLabel
        Left = 54
        Top = 24
        Width = 98
        Height = 16
        Caption = 'Common Name:'
      end
      object Label26: TLabel
        Left = 65
        Top = 54
        Width = 87
        Height = 16
        Caption = 'Organization:'
      end
      object Label27: TLabel
        Left = 25
        Top = 84
        Width = 127
        Height = 16
        Caption = 'Organizational Unit:'
      end
      object Label28: TLabel
        Left = 92
        Top = 114
        Width = 60
        Height = 16
        Caption = 'Location:'
      end
      object Label30: TLabel
        Left = 95
        Top = 174
        Width = 57
        Height = 16
        Caption = 'Country:'
      end
      object Label31: TLabel
        Left = 57
        Top = 208
        Width = 95
        Height = 16
        Caption = 'Email Address:'
      end
      object Label32: TLabel
        Left = 89
        Top = 238
        Width = 63
        Height = 16
        Caption = 'Alt Name:'
      end
      object Label29: TLabel
        Left = 111
        Top = 144
        Width = 41
        Height = 16
        Caption = 'State:'
      end
      object Label33: TLabel
        Left = 37
        Top = 268
        Width = 115
        Height = 16
        Caption = 'Private Key Type:'
      end
      object Label34: TLabel
        Left = 39
        Top = 298
        Width = 113
        Height = 16
        Caption = 'Digest Algorithm:'
      end
      object B_CREATE_CERT_REQUEST: TButton
        Left = 158
        Top = 360
        Width = 241
        Height = 41
        Cursor = crHandPoint
        Caption = 'CREATE_CERT_REQUEST'
        TabOrder = 0
        OnClick = B_CREATE_CERT_REQUESTClick
      end
      object E_CommonName: TEdit
        Left = 158
        Top = 21
        Width = 241
        Height = 24
        TabOrder = 1
      end
      object E_Organization: TEdit
        Left = 158
        Top = 51
        Width = 241
        Height = 24
        TabOrder = 2
      end
      object E_OrgUnit: TEdit
        Left = 158
        Top = 81
        Width = 241
        Height = 24
        TabOrder = 3
      end
      object E_Locality: TEdit
        Left = 158
        Top = 111
        Width = 241
        Height = 24
        TabOrder = 4
      end
      object E_State: TEdit
        Left = 158
        Top = 141
        Width = 241
        Height = 24
        TabOrder = 5
      end
      object E_Country: TEdit
        Left = 158
        Top = 171
        Width = 241
        Height = 24
        TabOrder = 6
      end
      object E_EmailAddress: TEdit
        Left = 158
        Top = 205
        Width = 241
        Height = 24
        TabOrder = 7
      end
      object E_Alt_Name: TEdit
        Left = 158
        Top = 235
        Width = 241
        Height = 24
        Hint = 'EMAIL: URI: IP: DNS: RID:'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object CB_RSA_BITS: TComboBox
        Left = 158
        Top = 265
        Width = 131
        Height = 24
        Cursor = crHandPoint
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 9
        Text = '1024 - bit RSA'
        Items.Strings = (
          '1024 - bit RSA'
          '2048 - bit RSA'
          '4096 - bit RSA')
      end
      object CB_DIGEST_ALG: TComboBox
        Left = 158
        Top = 295
        Width = 131
        Height = 24
        Cursor = crHandPoint
        Style = csDropDownList
        ItemIndex = 3
        TabOrder = 10
        Text = 'SHA-256'
        Items.Strings = (
          'MD5'
          'SHA-1'
          'SHA-224'
          'SHA-256'
          'SHA-384'
          'SHA-512')
      end
    end
  end
  object Dialog: TOpenDialog
    Left = 447
    Top = 1
  end
end
