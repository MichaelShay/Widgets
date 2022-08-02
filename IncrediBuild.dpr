program IncrediBuild;

uses
  Vcl.Forms,
  FormWidgets in 'FormWidgets.pas' {FormWidget},
  Widget in 'Widget.pas',
  FormWidgetsGroups in 'FormWidgetsGroups.pas' {FormWidgetsGroup},
  FormGroups in 'FormGroups.pas' {FormGroup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormWidget, FormWidget);
  Application.CreateForm(TFormWidgetsGroup, FormWidgetsGroup);
  Application.CreateForm(TFormGroup, FormGroup);
  Application.Run;
end.
