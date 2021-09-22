unit d03.mocking.Car;

interface

uses SysUtils, d03.mocking.AirCondition;

type
ICar = interface(IInterface)
    Function IsRunning: Boolean;
    Procedure SetAC(ac: TAirCondition);
    procedure Start();
end;

//
//type
//  TCar = class (TInterfacedObject, ICar)
//  public
//    Function IsRunning: Boolean;
//    Procedure SetAC(ac: TAirCondition);
//    procedure Start();
//  end;
//
//implementation
//
//Function TCar.IsRunning: Boolean;
//begin
//  raise Exception.Create('Not Implemented');
//end;
//
//procedure TCar.SetAC(ac: TAirCondition);
//begin
//  raise Exception.Create('Not Implemented');
//end;
//
//procedure TCar.Start;
//begin
//  raise Exception.Create('Not Implemented');
//end;
//
implementation

end.
