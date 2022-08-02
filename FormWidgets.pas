unit FormWidgets;
 {
This visual system demonstrates a widget library.
The library does:
1.	Built-in widgets: Button, Label, Image.
2.	An ability to instantiate widgets by their types of names (e.g., config file)
3.	An ability to extend it with new user-defined widgets (i.e., not part of your library)
4.	Grouping (ability to create groups that can contain widgets and groups) - e.g., dialog window with tabs that switch contents of the window
5.	Attach/detach widgets to/from a group.
 }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  RTTI, Vcl.ComCtrls, IniFiles,
  Widget,
  FormWidgetsGroups;

type
  TFormWidget = class(TForm)
    Panel00: TPanel;
    StatusBar: TStatusBar;
    Panel2: TPanel;
    ListBoxTypes: TListBox;
    ButtonWidget: TButton;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    Groups1: TMenuItem;
    ScrollBoxWidgets: TScrollBox;
    procedure ButtonWidgetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Groups1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBoxTypesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWidget: TFormWidget;

implementation

{$R *.dfm}



procedure TFormWidget.ButtonWidgetClick(Sender: TObject);
var
  widg:TWidget;
  strStat:String;
begin
  if ListBoxTypes.ItemIndex>=0 then
      widg:=TWidget.Create(ScrollBoxWidgets, ListBoxTypes.Items.Strings[ListBoxTypes.ItemIndex], strStat);
  StatusBar.SimpleText:=strStat;
end;


procedure TFormWidget.FormClose(Sender: TObject; var Action: TCloseAction);
var
    Ini: TIniFile;
    I: Integer;

   stringListGroups: TStringList;
   stringListWidgets: TStringList;
begin
   try
      Ini := TIniFile.Create( iniFileName );
      //Save the last window state
      Ini.WriteInteger( 'Form', 'Top', Top);
      Ini.WriteInteger( 'Form', 'Left', Left);

      Ini.WriteBool( 'Form', 'InitMax', WindowState = wsMaximized );
   finally
     Ini.Free;
   end;

end;

procedure TFormWidget.FormCreate(Sender: TObject);
var
    MyButton:TMyButton;
    MyLabel:TMyLabel;
    w:TWidget;
    Ini : TIniFile;
begin
  MyButton:=TMyButton.Create(ScrollBoxWidgets);
  MyLabel:=TMyLabel.Create(ScrollBoxWidgets);
  w:=TWidget.Create(ScrollBoxWidgets);

  w.CreateTypesList(ListBoxTypes);
  w.loadWidgetsIni(ScrollBoxWidgets, ListBoxTypes);



   try
      Ini := TIniFile.Create( iniFileName );

     //Initionalize the last window state
     Top     := Ini.ReadInteger( 'Form', 'Top', 100 );
     Left    := Ini.ReadInteger( 'Form', 'Left', 100 );

     if Ini.ReadBool( 'Form', 'InitMax', false ) then
       WindowState := wsMaximized
     else
       WindowState := wsNormal;

   finally
     Ini.Free;
   end;

end;

procedure TFormWidget.Groups1Click(Sender: TObject);
begin
    if FormWidgetsGroup=nil then
      FormWidgetsGroup:=TFormWidgetsGroup.Create(self);
    FormWidgetsGroup.Show;
end;

procedure TFormWidget.ListBoxTypesClick(Sender: TObject);
begin
  ButtonWidget.Enabled:=true;
end;

end.
