unit d03.mocking.Car;

interface

uses SysUtils, d03.mocking.AirCondition;

type
ICar = interface(IInterface)
    Function IsRunning: Boolean;
    Procedure SetAC(ac: TAirCondition);
    procedure Start();
end;

implementation

end.
