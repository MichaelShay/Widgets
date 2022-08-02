unit FormWidgetsGroups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles,
  Widget,
  FormGroups, Vcl.ComCtrls;

type
  TFormWidgetsGroup = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    ButtonAddGroup: TButton;
    LabelGroupName: TLabel;
    EditGroupName: TEdit;
    Splitter2: TSplitter;
    ListBoxGroups: TListBox;
    StaticText1: TStaticText;
    ButtonSave: TButton;
    StatusBar: TStatusBar;
    StaticText2: TStaticText;
    procedure ButtonAddGroupClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ListBoxGroupsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBoxGroupsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  FormWidgetsGroup: TFormWidgetsGroup;
  iniFile:TextFile;
  oneWidget:TWidget;

implementation

{$R *.dfm}

procedure TFormWidgetsGroup.ButtonAddGroupClick(Sender: TObject);

Var strItem:string;
begin
    strItem := Trim(EditGroupName.Text);
  if ListBoxGroups.Items.IndexOf(strItem) < 0 then
      ListBoxGroups.Items.Add(EditGroupName.text);

end;

procedure TFormWidgetsGroup.ButtonSaveClick(Sender: TObject);
begin

  ListBoxGroups.Items[ ListBoxGroups.itemindex ] :=
    EditGroupName.Text;
end;

procedure TFormWidgetsGroup.FormShow(Sender: TObject);
begin
  StatusBar.SimpleText:=TWidget.loadGroupIni(ListBoxGroups);
end;

procedure TFormWidgetsGroup.ListBoxGroupsClick(Sender: TObject);
begin
  StaticText2.Enabled:=true;
end;

procedure TFormWidgetsGroup.ListBoxGroupsDblClick(Sender: TObject);
begin

  FormGroup.Show((Sender as TListBox).Items.Strings[(Sender as TListBox).ItemIndex]);
  StatusBar.SimpleText:=TWidget.loadGroupIni(ListBoxGroups);

end;

end.
