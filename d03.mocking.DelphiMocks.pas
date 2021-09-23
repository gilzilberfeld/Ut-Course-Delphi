unit d03.mocking.DelphiMocks;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  d03.mocking.Driver, d03.mocking.Car, d03.mocking.AirCondition, d03.mocking.ACmode;

type

  [TestFixture]
  TDriverTests_DelphiMock = class

  public
    [Test]
    procedure cannot_drive_a_running_car;
    [Test]
    procedure AC_is_set_before_we_drive;

    [Setup]
    procedure Setup();

    [TearDown]
    procedure TearDown();
  end;

implementation

var
  mockRunningCar: TMock<ICar>;
  Driver: TDriver;

procedure TDriverTests_DelphiMock.Setup();
begin
  mockRunningCar := TMock<ICar>.Create();
  Driver := TDriver.Create(mockRunningCar);
end;

procedure TDriverTests_DelphiMock.TearDown();
begin
  mockRunningCar.Free;
  Driver.Free;
end;

procedure TDriverTests_DelphiMock.cannot_drive_a_running_car;
begin
  mockRunningCar.Setup.WillReturn(true).When.IsRunning();
  Assert.IsFalse(Driver.CanDrive());
end;

procedure TDriverTests_DelphiMock.AC_is_set_before_we_drive;
begin
  mockRunningCar.Setup.Expect.AtLeastOnce.When.SetAC(It(0).IsAny<TAirCondition>);
  Driver.Drive;
  mockRunningCar.Verify();
end;

end.
