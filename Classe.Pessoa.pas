unit Classe.Pessoa;

interface

uses System.SysUtils;

type
  TPessoa = class
  private
    FSalario: Currency;
    FNome: String;
    procedure SetNome(const Value: String);
    procedure SetSalario(const Value: Currency);
  Public
    property Nome: String read FNome write SetNome;
    property Salario: Currency read FSalario write SetSalario;
    function CalcularSalario: currency; virtual;
  end;

implementation

{ TPessoa }

function TPessoa.CalcularSalario: currency;
begin
  Result:=Salario;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('Nome não pode ser vazio!');
  FNome := Value;
end;

procedure TPessoa.SetSalario(const Value: Currency);
begin
  if Value <= 0 then
    raise Exception.Create('Salario não pode ser menor ou igual a zero!');
  FSalario := Value;
end;

end.
