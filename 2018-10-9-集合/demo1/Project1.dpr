program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.TypInfo, System.SysUtils;
{最标准的集合定义方式}

type
  TMySet = set of Char;

  TMySet1 = set of'a'..'z';

  Int = Integer;

type
  {定义一个枚举}
  TColors = (RED,GREEN,BLUE);
type
  TSetColors = set of TColors;
  TSetColors1 = set of RED..BLUE;
var
  {相当于简写}
  TMySet2: set of 1..2;
  MSet: TMySet;
{type:主要作用是让用户(程序员)可以自定义类型}
  index: Int;
  sc: TSetColors;
procedure ListSet();
begin
  {遍历集合元素:无序的}
  for index := Ord(Low(TColors)) to Ord(High(TColors)) do
  begin
    Writeln(GetEnumName(TypeInfo(TColors),index));
  end;

end;
begin
  MSet:= ['z','x'];


  Readln;
end.

