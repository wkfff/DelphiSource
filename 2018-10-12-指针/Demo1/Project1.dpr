program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

{*------------------------------------------------------------------------------
  1、什么是指针
    一个存储了内存地址的变量
  2、为什么使用指针
    效率高
  3、指针怎么使用

    类型指针
      具有明确的数据类型

    无类型指针
      没有数据类型，可以指向任何地址

    @ 获取地址
    ^ 定义指针
-------------------------------------------------------------------------------}
type
  {声明一个函数类型的指针}
  TFunctionParameter = function(const value:Integer):string;
//函数-实例1
function One(const value: Integer):string;
begin
  Result:= IntToStr(value);
end;

{这里才是函数指针的真正使用}
function DynamicFunction(f:TFunctionParameter;const value: Integer):string;
begin
  Result:= f(value);
end;

var
  {整数型变量}
  I:Integer;
  //定义一个整数类型的指针
  PInt1: ^Integer;
  //利用系统封装好的类型指针
  PInt2:PInteger;
  //无类型指针
  Void: Pointer;
begin
  I:=100;
  Writeln(Integer(@I).ToHexString);
  //004258B8
  PInt1:= Pointer($004258B8);
  Writeln(PInt1^);
  //初始化，分配内存空间
  New(PInt2);
  PInt2^ := 100;
  Writeln(Integer(PInt2).ToHexString);
  //释放
  Dispose(PInt2);
  //通过这种方式能够分配一个指定大小的空间给指针
  GetMem(Void,1024);
  FreeMem(Void);
  Writeln(DynamicFunction(One,100));
  Readln;

end.
