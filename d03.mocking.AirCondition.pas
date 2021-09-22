unit d03.mocking.AirCondition;

interface

uses
  d03.mocking.ACmode;

type
  TAirCondition = class
  public
    constructor Create(newMode: TACMode);
    Function GetACMode(): TACMode;
  end;

var
  mode: TACMode;

implementation

constructor TAirCondition.Create(newMode: TACMode);
begin
  mode := newMode
end;

function TAirCondition.GetACMode: TACMode;
begin
  Result := mode
end;

end.
