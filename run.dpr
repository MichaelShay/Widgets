program run;

{$APPTYPE CONSOLE}

{$R *.res}

uses
   Windows, Messages, SysUtils, Classes//, Graphics, Controls, Forms, Dialogs, StdCtrls
   ;

type
  TRun = procedure() stdcall;


  // This declares start() as a procedure which should be found externally, in the dll
procedure start01();  stdcall; external 'IncrediBuildLib.dll';







procedure start() ;
var
   i,j,k: integer;
   Handle: THandle;
   rrun: TRun;

begin
// This calls the DLL directly through the Win API.
// More code, more control.

   // Load the library
   //Handle := LoadLibrary('D:\uses\dev\Delphi\incrediBuild\DLL\IncrediBuildLib.dll');
   Handle := LoadLibrary('IncrediBuildLib.dll');

   // If succesful ...

   if Handle <> 0 then
      begin

      // Assign function Max from the DLL to the
      // function variable mmax

      @rrun := GetProcAddress(Handle, 'run');

      // If successful

      if @rrun <> nil then
         begin
            rrun();

         end;

      // Unload library
      FreeLibrary(Handle);
   end;

end;


begin
  try
    start();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
