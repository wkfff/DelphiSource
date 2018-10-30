unit Unit1;

interface

uses
  System.JSON, System.Generics.Collections, Unit2, System.JSON.Serializers,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    btn1: TBitBtn;
    mmo1: TMemo;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  UserJson: string;
  Serializer: TJsonSerializer;
  Student: TStudent;
begin
  //�ַ������͵�JSON����
  UserJson := '{"FName":"С��","FAge":25}';
  Serializer := TJsonSerializer.Create;
  //���л�  ��һ������ת������һ��JSON����

  //�����л�
  Student := Serializer.Deserialize<TStudent>(UserJson);
  mmo1.Clear;
  mmo1.Lines.Add('�����л���' + Student.Name + ',' + Student.Age.ToString);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  UserJson: string;
  Serializer: TJsonSerializer;
  Student: TStudent;
begin
  //����ʵ�������
  Student := TStudent.Create;
  Student.Name := 'С��';
  Student.Age := 30;
  //�������л�����
  Serializer := TJsonSerializer.Create;
  //���л�
  UserJson := Serializer.Serialize<TStudent>(Student);
  mmo1.Clear;
  mmo1.Lines.Add('���л���' + UserJson);
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  UserJson: string;
  Student: TStudent;
  List: TList<TStudent>;
  Serializer: TJsonSerializer;
begin
  //����ʵ�������
  List := TList<TStudent>.Create;
  List.Add(TStudent.Create('С��', 30));
  List.Add(TStudent.Create('��Ǿ', 18));
  //�������л�����
  Serializer := TJsonSerializer.Create;
  mmo1.Clear;
  mmo1.Lines.Add('���л���' + Serializer.Serialize<TList<TStudent>>(List));

end;

procedure TForm1.btn4Click(Sender: TObject);
var
  UserJson: string;
  Student: TStudent;
  List: TList<TStudent>;
  Serializer: TJsonSerializer;
begin
  UserJson := '{"FListHelper":{"FCount":2},"FItems":[{"FName":"С��","FAge":30},{"FName":"��Ǿ","FAge":18}],"FComparer":{}}';
  //�������л�����
  Serializer := TJsonSerializer.Create;
  List := TList<TStudent>.Create;
  List := Serializer.Deserialize<TList<TStudent>>(UserJson);
  mmo1.Clear;
  for Student in List do
  begin
    mmo1.Lines.Add('�����л���' + Student.Name + ',' + Student.Age.ToString);
  end;
  mem
end;

end.
