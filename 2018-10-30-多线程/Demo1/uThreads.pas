unit uThreads;

interface

uses
  System.SysUtils, System.Classes;

type
  TWork = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure Operation;
  end;

implementation

uses
  MultipleThread;
{ TWork }

procedure TWork.Execute;
begin
  Operation;
end;

procedure TWork.Operation;
var
  Num: Integer;
begin
  for Num := 1 to 1000000 do
  begin
    if FreeOnTerminate then
      Exit;
    Form1.lb2.Caption := Num.ToString;
    TThread.Sleep(50);
  end

end;

end.

