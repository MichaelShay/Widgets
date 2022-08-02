unit FormGroups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Widget, Vcl.ComCtrls;

type
  TFormGroup = class(TForm)
    Panel1: TPanel;
    LabeledEditGroupName: TLabeledEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    ListBoxWidgets: TListBox;
    ComboBoxWidgets: TComboBox;
    Label1: TLabel;
    ButtonAddWidget: TButton;
    ButtonSave: TButton;
    StatusBar: TStatusBar;
    procedure ButtonAddWidgetClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
 private
    FgroupName: string;
  public
    constructor Create(AOwner: TComponent; const groupName: string);
    procedure Show(groupName: string);

  end;

var
  FormGroup: TFormGroup;

implementation

{$R *.dfm}

{ TFormGroup }

procedure TFormGroup.ButtonAddWidgetClick(Sender: TObject);
begin
  ListBoxWidgets.AddItem( ComboBoxWidgets.Text,nil);
end;

procedure TFormGroup.ButtonSaveClick(Sender: TObject);
begin
  TWidget.SaveGroupWidgetsIni(ListBoxWidgets,LabeledEditGroupName.Text);
end;

constructor TFormGroup.Create(AOwner: TComponent; const groupName: string);
var
    MyButton:TMyButton;

begin
  inherited Create(AOwner);
  FgroupName := groupName;

  MyButton:=TMyButton.Create(self);
  StatusBar.SimpleText:=TWidget.loadGroupIni(ListBoxWidgets);
end;

procedure TFormGroup.Show( groupName: string);
var
    w:TWidget;
begin
  groupName:=TWidget.TrimChar(groupName,'=');

  LabeledEditGroupName.Text:=groupName;
  w:=TWidget.Create(self);
  StatusBar.SimpleText:=TWidget.loadGroupWidgetsIni(ListBoxWidgets, groupName);
  StatusBar.SimpleText:=w.loadWidgetsNamesIni(self, ComboBoxWidgets);

  inherited ShowModal;

  StatusBar.SimpleText:=TWidget.loadGroupWidgetsIni(ListBoxWidgets, groupName);
  StatusBar.SimpleText:=w.loadWidgetsNamesIni(self, ComboBoxWidgets);
end;

end.
