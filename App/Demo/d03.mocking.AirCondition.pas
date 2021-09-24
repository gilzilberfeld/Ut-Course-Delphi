unit d03.mocking.AirCondition;

interface

uses
  d03.mocking.ACmode;

type
  TAirCondition = class
  private
    mode: TACMode;
  public
    constructor Create(newMode: TACMode);
    Function GetACMode(): TACMode;
  end;


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
