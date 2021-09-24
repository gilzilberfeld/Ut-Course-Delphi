unit d04.tdd.FizzBuzzTests;

interface

uses
  DUnitX.TestFramework,
  d04.tdd.FizzBuzz;

type
  [TestFixture]
  TFizzBuzzTests = class
  public
  end;

implementation

initialization
  TDUnitX.RegisterTestFixture(TFizzBuzzTests);

end.
