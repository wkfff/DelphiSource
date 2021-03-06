unit DaoUnit;

interface

uses
  System.Generics.Collections, Unit2, Winapi.Messages, Vcl.Dialogs;

type
  TDao = class
  public

      //添加        该方法调用时不需要创建对象
    class procedure Add(Student: TStudent);
    //查询
    class function ListStu(): TDictionary<string, TStudent>;
    //清空
    class procedure Clear;
  end;

implementation
//初始化容器类

var
  Students: TDictionary<string, TStudent>;

{ TDao }

class procedure TDao.Add(Student: TStudent);
begin
  if not Students.ContainsKey(Student.Id) then
    Students.Add(Student.Id, Student)
  else
    ShowMessage('该信息已经存在');

end;

class procedure TDao.Clear;
begin
  Students.Clear;
end;

class function TDao.ListStu: TDictionary<string, TStudent>;
begin

  Result := Students;
end;

initialization
  Students := TDictionary<string, TStudent>.Create();

end.

