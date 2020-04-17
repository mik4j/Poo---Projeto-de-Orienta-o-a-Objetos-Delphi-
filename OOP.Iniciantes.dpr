program OOP.Iniciantes;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {FCadastro},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Classe.Vendedor in 'Classe.Vendedor.pas',
  Classe.Administrativo in 'Classe.Administrativo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCadastro, FCadastro);
  Application.Run;
end.
