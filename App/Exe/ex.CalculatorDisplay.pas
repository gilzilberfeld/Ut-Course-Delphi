unit ex.CalculatorDisplay;

interface

uses
  ex.Operations, SysUtils;

type
  TCalculatorDisplay = class
  public
    procedure Press(key: string);
    Function GetDisplay(): string;
  end;

var
  display: string;
  lastArgument: Integer;
  res: Integer;
  newArgument: Boolean = false;
  shouldReset: Boolean = false;
  lastOperation: TOperationType;
//end

implementation

procedure TCalculatorDisplay.Press(key: string);
var
  currentArgument : Integer;
begin
  if (CompareStr(key, 'C') = 0) then
    display := ''
  else
    if (CompareStr(key, '+') = 0) then
      begin
        lastOperation := Plus;
        lastArgument := strtoint(display);
        newArgument := true
      end
    else
      begin
      if (CompareStr(key, '/') = 0) then
        begin
          lastOperation := Divide;
          lastArgument := strtoint(display);
          newArgument := true;
        end
      else
        begin
        if (CompareStr(key, '=') = 0) then
          begin
          currentArgument := strtoint(display);
          if (lastOperation = Plus) then
            display := inttostr (lastArgument+currentArgument);
          if (lastOperation = Divide) and (currentArgument = 0) then
            display := 'Division By Zero Error';
          shouldReset := true;
          end
        else
          begin
          if shouldReset then
            display :='';
            shouldReset := false;
          if newArgument then
            display :='';
            shouldReset := false;
          display := display + key;
          end
      end

    end
end;

function TCalculatorDisplay.GetDisplay(): string;
begin
  if (CompareStr(display, EmptyStr) = 0) then
    Result := '0'
  else
    Result := display
end;

end.
