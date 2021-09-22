unit d03.mocking.ManualMock;

interface

uses
  d03.mocking.Car, d03.mocking.AirCondition;

type

  TMockRunningCar = class(TInterfacedObject, ICar)
    procedure Start;
    Procedure SetAC(ac: TAirCondition);
    function IsRunning: Boolean;
  end;

implementation

function TMockRunningCar.IsRunning: Boolean;
begin
  Result := true;
end;

procedure TMockRunningCar.Start;
begin
end;

procedure TMockRunningCar.SetAC(ac: TAirCondition);
begin
end;

end.
