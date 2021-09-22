unit d03.mocking.Driver;

interface

uses d03.mocking.Car, d03.mocking.AirCondition, d03.mocking.acmode;

type
   TDriver = class
   constructor Create(newCar: ICar);
   function CanDrive() : Boolean;
   procedure Drive();
   end;

var
  car : ICar;

implementation

constructor TDriver.Create(newCar: ICar);
begin
    car := newCar;
end;

function TDriver.CanDrive: Boolean;
begin
  Result := not car.IsRunning();
end;

procedure TDriver.Drive;
var
  ac : TAirCondition;
begin
  ac.Create(AcOn);
  car.SetAC(ac);
  car.Start();
end;

end.
