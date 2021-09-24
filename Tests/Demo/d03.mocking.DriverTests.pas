unit d03.mocking.DriverTests;

interface

uses
  DUnitX.TestFramework,
  d03.mocking.ManualMock, d03.mocking.Driver, d03.mocking.Car;

type

  [TestFixture]
  TDriverTests_ManualMock = class

  public
    [Test]
    procedure cannot_drive_a_running_car();
  end;

implementation

procedure TDriverTests_ManualMock.cannot_drive_a_running_car;
var
  mockRunningCar : TMockRunningCar;
  driver : TDriver;
begin
  mockRunningCar := TMockRunningCar.Create();
  driver := TDriver.Create(mockRunningCar);
  Assert.IsFalse(driver.CanDrive());
end;

end.
