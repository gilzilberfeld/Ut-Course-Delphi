unit Unit1;

interface

uses
  System.SysUtils, System.Classes;

type
  ILife = interface
    ['{BDC73295-9F45-4BEC-B726-77DEC9B9EAAC}']
    function GetAnswer: Integer;
  end;

  TComponentA = class(TInterfacedObject, ILife)
    function GetAnswer: Integer;
  end;


implementation


function TComponentA.GetAnswer: Integer;
begin
  Result := 42;
end;


end.
