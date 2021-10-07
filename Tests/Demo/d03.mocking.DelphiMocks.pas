unit d03.mocking.DelphiMocks;

interface

uses
  SysUtils,
  Rtti,
  DUnitX.TestFramework,
  Delphi.Mocks,
  d03.mocking.Driver, d03.mocking.Car, d03.mocking.AirCondition,
  d03.mocking.ACmode;

type

  [TestFixture]
  TDriverTests_DelphiMock = class

  public
    [Test]
    procedure cannot_drive_a_running_car;
    [Test]
    procedure AC_is_set_before_we_drive;

    [Test]
    procedure AC_is_set_on_before_we_drive;

    [Test]
    procedure check_raising_exception;

    [Test]
    procedure custom_execution;

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
  mockRunningCar.Setup.Expect.AtLeastOnce.When.SetAC
    (It(0).IsAny<TAirCondition>);
  Driver.Drive;
  mockRunningCar.Verify();
end;

procedure TDriverTests_DelphiMock.AC_is_set_on_before_we_drive;
var
  dummyAC: TAirCondition;
begin
  dummyAC := TAirCondition.Create(AcOn);

  mockRunningCar.Setup.Expect.AtLeastOnce.When.SetAC(
    It(0).AreSameFieldsAndPropertiedThat(dummyAC));

  Driver.Drive;
  mockRunningCar.Verify;
end;

procedure TDriverTests_DelphiMock.check_raising_exception;
begin
  mockRunningCar.Setup.WillRaise(Exception, 'ss').When.Start;
  Assert.WillRaise(procedure
    begin
      mockRunningCar.Instance.Start;
    end
  )
end;

procedure TDriverTests_DelphiMock.custom_execution;
var
  num : Integer;
begin
     num := 0;
     mockRunningCar.Setup.WillExecute(function (const args : TArray<TValue>; const returnType : TRttiType) : TValue
     begin
       num := 3;
     end
     ).When.Start;

     mockRunningCar.Instance.Start;
     Assert.AreEqual(3, num);
end;
end.
