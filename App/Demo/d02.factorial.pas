unit d02.factorial;

interface

type
  TFactorial = class
  public
    Function Calculate(N: integer): integer;
  end;

implementation

Function TFactorial.Calculate(N: integer): integer;
Begin

  If N = 1 then
    Result := 1

  else
    Result := N * Calculate(N - 1);

end;

end.
