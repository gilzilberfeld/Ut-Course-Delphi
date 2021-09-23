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
    procedure cannot_drive_a_running_car();

    [Setup]
    procedure Setup();

    [TearDown]
    procedure TearDown();
  end;

implementation

var
  mockRunningCar: TMock<ICar>;
  driver: TDriver;

procedure TDriverTests_DelphiMock.Setup();
begin
  mockRunningCar := TMock<ICar>.Create();
  driver := TDriver.Create(mockRunningCar);
end;

procedure TDriverTests_DelphiMock.TearDown();
begin
  mockRunningCar.Free;
  driver.Free;
end;

procedure TDriverTests_DelphiMock.cannot_drive_a_running_car;
begin
  mockRunningCar.Setup.WillReturn(true).When.IsRunning();
  Assert.IsFalse(driver.CanDrive());
end;

end.
