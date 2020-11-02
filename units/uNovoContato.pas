unit uNovoContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, uContatosDAO;

type
  TformNovo = class(TForm)
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    editNome: TEdit;
    editTelefone: TEdit;
    editEmail: TEdit;
    btnSalvar: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNovo: TformNovo;
  contatos : TContatosDAO;

implementation

{$R *.dfm}

uses uDataModule, uPrincipal;

procedure TformNovo.btnSalvarClick(Sender: TObject);
begin

  if(editNome.Text = '') or (editTelefone.Text = '') then begin
    showMessage('Existem campos obrigatórios que não foram preenchidos!');
    abort;
  end;
  contatos.contatoId := formPrincipal.queryListagem
    .FieldByName('contatoId').AsInteger;
  contatos.nome := editNome.Text;
  contatos.telefone := editTelefone.Text;
  contatos.email := editEmail.Text;

  if(formPrincipal.status = 'novo') then begin
    if(not contatos.inserir) then
      showMessage('Ops! houve um erro ao salvar!')
    else begin
      close;
      formPrincipal.btnTodos.Click;
    end;
  end

  else if formPrincipal.status = 'editar' then begin
    if(not contatos.atualizar) then
      showMessage('Ops! houve um erro ao atualizar!')
    else begin
      close;
      formPrincipal.btnTodos.Click;
    end;
  end;

end;

procedure TformNovo.FormCreate(Sender: TObject);
begin
  contatos := TContatosDAO.create(dtm.dbConnection);
  if(formPrincipal.status = 'novo') then begin
    self.Caption := 'Novo Contato';
  end

  else if formPrincipal.status = 'editar' then begin
    self.Caption := 'Editar Contato';
    editNome.Text := formPrincipal.queryListagem.FieldByName('nome').AsString;
    editTelefone.Text := formPrincipal.queryListagem.FieldByName('telefone').AsString;
    editEmail.Text := formPrincipal.queryListagem.FieldByName('email').AsString;
  end
end;

end.
