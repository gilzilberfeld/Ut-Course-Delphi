program App;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form2},
  d01.coverage.Calculator in 'd01.coverage.Calculator.pas',
  d01.coverage.CreditCard in 'd01.coverage.CreditCard.pas',
  d02.factorial in 'd02.factorial.pas',
  ex.CalculatorDisplay in 'ex.CalculatorDisplay.pas',
  ex.Operations in 'ex.Operations.pas',
  d03.mocking.acmode in 'd03.mocking.acmode.pas',
  d03.mocking.AirCondition in 'd03.mocking.AirCondition.pas',
  d03.mocking.Car in 'd03.mocking.Car.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
