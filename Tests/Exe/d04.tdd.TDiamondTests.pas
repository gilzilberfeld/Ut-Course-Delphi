unit d04.tdd.TDiamondTests;

interface

uses
  DUnitX.TestFramework,
  d04.tdd.FizzBuzz;

type
  [TestFixture]
  TDiamondTests = class
  public
  end;

implementation

initialization
  TDUnitX.RegisterTestFixture(TDiamondTests);

end.
