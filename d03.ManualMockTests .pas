unit d03.ManualMockTests;

interface

uses
  DUnitX.TestFramework, d03.mocking.Driver, d03.mocking.Car;

implementation


type

  [TestFixture]
  TDriverTests = class
  public
    [Test]
    procedure calculations();
  end;

implementation

procedure TFactorialTests.calculations;
var
  Driver: TDriver;
begin
  Assert.AreEqual(1, calc.Calculate(1));
  Assert.AreEqual(2, calc.Calculate(2));
  Assert.AreEqual(6, calc.Calculate(3));
  Assert.AreEqual(3628800, calc.Calculate(10));
end;

initialization

TDUnitX.RegisterTestFixture(TFactorialTests);

end.
