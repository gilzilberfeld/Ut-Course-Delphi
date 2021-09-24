program App;

uses
  Vcl.Forms,
  d01.coverage.Calculator in 'App\Demo\d01.coverage.Calculator.pas',
  d01.coverage.CreditCard in 'App\Demo\d01.coverage.CreditCard.pas',
  d02.factorial in 'App\Demo\d02.factorial.pas',
  ex.CalculatorDisplay in 'App\Exe\ex.CalculatorDisplay.pas',
  d03.mocking.acmode in 'App\Demo\d03.mocking.acmode.pas',
  d03.mocking.AirCondition in 'App\Demo\d03.mocking.AirCondition.pas',
  d03.mocking.Car in 'App\Demo\d03.mocking.Car.pas',
  d03.mocking.Driver in 'App\Demo\d03.mocking.Driver.pas',
  ex.Operations in 'App\Exe\ex.Operations.pas',
  d04.tdd.FizzBuzz in 'App\Demo\d04.tdd.FizzBuzz.pas',
  ex.tdd.Diamond in 'App\Exe\ex.tdd.Diamond.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
