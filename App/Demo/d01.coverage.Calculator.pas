unit d01.coverage.Calculator;

interface

type
  TCalculator = class

  public
    function Calculate(i, j: Integer): Integer;
  end;


implementation

function TCalculator.Calculate(i, j: Integer): Integer;
begin
   Calculate := i+j;
end;
end.
