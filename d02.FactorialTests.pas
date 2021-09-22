unit d02.FactorialTests;

interface

uses
  DUnitX.TestFramework, d02.factorial;

type

  [TestFixture]
  TFactorialTests = class
  public
    [Test]
    procedure calculations();
  end;

implementation

procedure TFactorialTests.calculations;
var
  calc: TFactorial;
begin
  Assert.AreEqual(1, calc.Calculate(1));
  Assert.AreEqual(2, calc.Calculate(2));
  Assert.AreEqual(6, calc.Calculate(3));
  Assert.AreEqual(3628800, calc.Calculate(10));
end;

initialization

TDUnitX.RegisterTestFixture(TFactorialTests);

end.
