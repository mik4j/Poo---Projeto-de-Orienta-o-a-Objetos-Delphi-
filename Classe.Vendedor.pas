unit Classe.Vendedor;

interface

uses Classe.pessoa;

type
  Tvendedor = class(TPessoa)
  private
    FComissao: Currency;
    procedure SetComissao(const Value: Currency);
  Public
    Property Comissao: Currency read FComissao write SetComissao;
    function CalcularSalario: Currency; Override;
  end;

implementation

{ Tvendedor }

function Tvendedor.CalcularSalario: Currency;
begin
  Result := Salario + Comissao;
end;

procedure Tvendedor.SetComissao(const Value: Currency);
begin
  FComissao := Value;
end;

end.
