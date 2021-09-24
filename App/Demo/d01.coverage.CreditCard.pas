unit d01.coverage.CreditCard;

interface

uses
  DateUtils;

type
  TCreditCard = class

  public
    constructor Create(expDate: TDateTime);
    function IsExpired(): Boolean;

  end;

implementation
  var
    expirationDate: TDateTime;

constructor TCreditCard.Create(expDate: TDateTime);
begin
  expirationDate := expDate;
end;

function TCreditCard.IsExpired(): Boolean;
var
  today: TDateTime;
  localExpDate: TDateTime;

begin
  localExpDate := TTimeZone.Local.ToLocalTime(expirationDate);
  today := today;
  if (CompareDate(today, localExpDate) < 0)
    then
      Result := True
    else
      Result := False
end;

end.


