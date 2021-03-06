unit Classe.Administrativo;

interface

Uses Classe.Pessoa;

Type
  TAdministrativo = class(TPessoa)
  private
    FBonus: Currency;
    procedure SetBonus(const Value: Currency);
  Public
    property Bonus: Currency read FBonus write SetBonus;
    function CalcularSalario: Currency; Override;
  end;

implementation

{ TAdministrativo }

function TAdministrativo.CalcularSalario: Currency;
begin
  Result:= Salario+Bonus;
end;

procedure TAdministrativo.SetBonus(const Value: Currency);
begin
  FBonus := Value;
end;

end.
