{
  By Micheli Fernandes dos santos
  Email: micheli.fernandes.santos@outlook.com
} unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Pessoa,
  Classe.Administrativo, Classe.Vendedor;

type
  TEnumFuncao = (tpAdministrativo, tpVendedor, tpFuncionario);

type
  TFCadastro = class(TForm)
    lblFuncao: TLabel;
    cbFuncao: TComboBox;
    lblNome: TLabel;
    edtNome: TEdit;
    lblSalario: TLabel;
    edtSalario: TEdit;
    lblBonus: TLabel;
    edtBonus: TEdit;
    btnCadasrar: TButton;
    btnanterior: TButton;
    btnproximo: TButton;
    mmCalculo: TMemo;
    btnCalcular: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCadasrarClick(Sender: TObject);
    procedure btnanteriorClick(Sender: TObject);
    procedure btnproximoClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure cbFuncaoChange(Sender: TObject);
  private
    { Private declarations }
    procedure fnc_IncluirAdministrativo;
    procedure fnc_IncluirVendedor;
    procedure fnc_IncluirFuncionario;
    procedure fnc_ExibirDados(Pos: Integer);
  public
    { Public declarations }
    Funcionario: Array [-1 .. 100] of TPessoa;
    QtdFunc: Integer;
    RegAtual: Integer;
  end;

var
  FCadastro: TFCadastro;

implementation

{$R *.dfm}

procedure TFCadastro.btnanteriorClick(Sender: TObject);
begin
  if RegAtual = -1 then
  begin
    btnanterior.Enabled := False;
    exit;
  end
  else if RegAtual >= 0 then
  begin
    RegAtual := RegAtual - 1;
    fnc_ExibirDados(RegAtual);
  end
end;

procedure TFCadastro.btnCadasrarClick(Sender: TObject);
begin
  try
    case TEnumFuncao(cbFuncao.ItemIndex) of
      tpAdministrativo:
        begin
          fnc_IncluirAdministrativo
        end;
      tpVendedor:
        begin
          fnc_IncluirVendedor;
        end;
      tpFuncionario:
        begin
          fnc_IncluirFuncionario;
        end;
    end;
    Inc(QtdFunc);
    ShowMessage('Funcionario Cadastrado Com sucesso!');
    fnc_ExibirDados(-1);
  Except
    raise Exception.Create('Error ao cadastrar funcionario');
  end;

end;

procedure TFCadastro.btnCalcularClick(Sender: TObject);
var
  Total: Currency;
  I: Integer;
begin
  Total := 0;
  for I := 0 to QtdFunc - 1 do
  begin
    Total := Total + Funcionario[I].CalcularSalario;
  end;

  mmCalculo.Lines.Add('Sua Folha Salarial é de: R$ ' + CurrToStr(Total));
end;

procedure TFCadastro.btnproximoClick(Sender: TObject);
begin
  if RegAtual >= QtdFunc - 1 then
  begin
    btnproximo.Enabled := False;
    exit;
  end
  else
  begin
    Inc(RegAtual);
    fnc_ExibirDados(RegAtual);
  end
end;

procedure TFCadastro.cbFuncaoChange(Sender: TObject);
begin
  if TEnumFuncao(cbFuncao.ItemIndex) = tpFuncionario then
  begin
    edtBonus.Enabled := False;
  end
  else
    edtBonus.Enabled := True;
end;

procedure TFCadastro.FormCreate(Sender: TObject);
begin
  QtdFunc := 0;
  RegAtual := -1;

  btnanterior.Enabled := False;
  btnproximo.Enabled := False;

  //Cadastra o Funcionario Vazio
  Funcionario[RegAtual] := TAdministrativo.Create;
  Funcionario[RegAtual].Nome := ' ';
  Funcionario[RegAtual].Salario := 1;
  TAdministrativo(Funcionario[RegAtual]).Bonus := 0;
  fnc_ExibirDados(RegAtual);
end;

procedure TFCadastro.fnc_ExibirDados(Pos: Integer);
begin
  edtNome.Text := Funcionario[Pos].Nome;
  edtSalario.Text := CurrToStr(Funcionario[Pos].Salario);

  if Funcionario[Pos].ClassName = 'TAdministrativo' then
  begin
    edtBonus.Enabled := True;
    edtBonus.Text := CurrToStr(TAdministrativo(Funcionario[Pos]).Bonus);
    cbFuncao.ItemIndex := Integer(tpAdministrativo);
  end
  else if Funcionario[Pos].ClassName = 'Tvendedor' then
  begin
    edtBonus.Enabled := True;
    edtBonus.Text := CurrToStr(TVendedor(Funcionario[Pos]).Comissao);
    cbFuncao.ItemIndex := Integer(tpVendedor);
  end
  else if Funcionario[Pos].ClassName = 'TPessoa' then
  begin
    edtBonus.Enabled := False;
    edtBonus.Text := '';
    cbFuncao.ItemIndex := Integer(tpFuncionario);
  end;
  if QtdFunc >= 1 then
  begin
    btnanterior.Enabled := True;
    btnproximo.Enabled := True;
  end;

end;

procedure TFCadastro.fnc_IncluirAdministrativo;
begin
  Funcionario[QtdFunc] := TAdministrativo.Create;
  TAdministrativo(Funcionario[QtdFunc]).Bonus := StrtoCurr(edtBonus.Text);
  TAdministrativo(Funcionario[QtdFunc]).Nome := edtNome.Text;
  TAdministrativo(Funcionario[QtdFunc]).Salario := StrtoCurr(edtSalario.Text);
end;

procedure TFCadastro.fnc_IncluirVendedor;
begin
  Funcionario[QtdFunc] := TVendedor.Create;
  TVendedor(Funcionario[QtdFunc]).Comissao := StrtoCurr(edtBonus.Text);
  TVendedor(Funcionario[QtdFunc]).Nome := edtNome.Text;
  TVendedor(Funcionario[QtdFunc]).Salario := StrtoCurr(edtSalario.Text);
end;

procedure TFCadastro.fnc_IncluirFuncionario;
begin
  Funcionario[QtdFunc] := TPessoa.Create;
  Funcionario[QtdFunc].Nome := edtNome.Text;
  Funcionario[QtdFunc].Salario := StrtoCurr(edtSalario.Text);
end;

end.
