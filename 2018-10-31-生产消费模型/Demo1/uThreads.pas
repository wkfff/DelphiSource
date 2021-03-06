unit uThreads;

interface

uses
  System.Classes, System.sysutils, uProduct;

type
  //生产线程类
  TManufactureThread = class(TThread)
  private
    { Private declarations }
    FProduct: TProduct;
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
    constructor Create(Product: TProduct); overload;
  end;
  //消费线程类

  TConsumeThread = class(TThread)
  private
    { Private declarations }
    FProduct: TProduct;
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
    constructor Create(Product: TProduct); overload;
  end;

implementation

uses
  Unit1;

//有参构造

constructor TManufactureThread.Create(Product: TProduct);
begin
  inherited Create(False);
  Self.FProduct := Product;
end;

//启动生产线程的代码
procedure TManufactureThread.Execute;
begin
  while True do
  begin
    //临界区开始
    System.TMonitor.Enter(Self.FProduct);
    //当为false时表示没有产品
    if not Self.FProduct.IsConsume then
    begin
      Self.FProduct.Id := Self.FProduct.Id + 1;
      form1.mmo1.lines.add('生产线程ID：' + self.threadid.tostring + ',当前的产品编号：' + self.fproduct.id.tostring);
      Self.Sleep(500);
      //生产完成之后表示有产品
      Self.FProduct.IsConsume := True;
    end;
    //通知消费线程进行消费
    System.TMonitor.Pulse(Self.FProduct);
    System.TMonitor.Wait(Self.FProduct, INFINITE);
    //退出临界区
    System.TMonitor.Exit(Self.FProduct);
  end;
end;

{ TConsumeThread }
//启动消费线程的代码
constructor TConsumeThread.Create(Product: TProduct);
begin
  //不挂起，立即执行
  inherited Create(False);
  Self.FProduct := Product;
end;

constructor TConsumeThread.Create;
begin
  //挂起
  inherited Create(True);
end;
//消费线程的执行

procedure TConsumeThread.Execute;
begin
  inherited;
  while True do
  begin
    //临界区开始
    System.TMonitor.Enter(Self.FProduct);
    //当为false时表示没有产品  有产品时进行消费
    if Self.FProduct.IsConsume then
    begin
      form1.mmo1.lines.add('消费线程ID：' + self.threadid.tostring + ',当前的产品编号：' + self.fproduct.id.tostring);
      Self.Sleep(500);
      //消费产品后，改为false
      Self.FProduct.IsConsume := False;
    end;
    //通知生产线程进行生产
    System.TMonitor.Pulse(Self.FProduct);
    //让线程处于等待状态
    System.TMonitor.Wait(Self.FProduct, INFINITE);
    //退出临界区
    System.TMonitor.Exit(Self.FProduct);
  end;
end;

//空参构造
constructor TManufactureThread.Create;
begin
  //true表示线程创建完成之后挂起，在调用start之后才会继续线程
  inherited Create(True);
end;

end.

