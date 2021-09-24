program Tests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  d02.FactorialTests in 'Tests\Demo\d02.FactorialTests.pas',
  d03.mocking.ManualMock in 'Tests\Demo\d03.mocking.ManualMock.pas',
  d03.mocking.DriverTests in 'Tests\Demo\d03.mocking.DriverTests.pas',
  d03.mocking.DelphiMocks in 'Tests\Demo\d03.mocking.DelphiMocks.pas',
  Delphi.Mocks.When in 'Mocks\Delphi.Mocks.When.pas',
  Delphi.Mocks in 'Mocks\Delphi.Mocks.pas',
  Delphi.Mocks.AutoMock in 'Mocks\Delphi.Mocks.AutoMock.pas',
  Delphi.Mocks.Expectation in 'Mocks\Delphi.Mocks.Expectation.pas',
  Delphi.Mocks.Behavior in 'Mocks\Delphi.Mocks.Behavior.pas',
  Delphi.Mocks.Helpers in 'Mocks\Delphi.Mocks.Helpers.pas',
  Delphi.Mocks.Proxy in 'Mocks\Delphi.Mocks.Proxy.pas',
  Delphi.Mocks.Proxy.TypeInfo in 'Mocks\Delphi.Mocks.Proxy.TypeInfo.pas',
  Delphi.Mocks.ReturnTypePatch in 'Mocks\Delphi.Mocks.ReturnTypePatch.pas',
  Delphi.Mocks.Utils in 'Mocks\Delphi.Mocks.Utils.pas',
  Delphi.Mocks.Validation in 'Mocks\Delphi.Mocks.Validation.pas',
  Delphi.Mocks.WeakReference in 'Mocks\Delphi.Mocks.WeakReference.pas',
  Delphi.Mocks.Interfaces in 'Mocks\Delphi.Mocks.Interfaces.pas',
  Delphi.Mocks.MethodData in 'Mocks\Delphi.Mocks.MethodData.pas',
  Delphi.Mocks.ObjectProxy in 'Mocks\Delphi.Mocks.ObjectProxy.pas',
  Delphi.Mocks.ParamMatcher in 'Mocks\Delphi.Mocks.ParamMatcher.pas';

{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
