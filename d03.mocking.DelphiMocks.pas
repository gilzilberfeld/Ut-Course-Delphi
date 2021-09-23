unit d03.mocking.DelphiMocks;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  d03.mocking.Driver, d03.mocking.Car;

type

  [TestFixture]
  TDriverTests_DelphiMock = class

  public
    [Test]
    procedure a_running_car();

  end;

implementation

procedure TDriverTests_DelphiMock.a_running_car;
var
  mockRunningCar: TMock<ICar>;
  Driver: TDriver;
begin
  mockRunningCar := TMock<ICar>.Create();
  mockRunningCar.Setup.WillReturn(true).When.IsRunning();
  driver := TDriver.Create(mockRunningCar);
  Assert.IsFalse(Driver.CanDrive());
end;

end.
