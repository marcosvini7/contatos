unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataModule
  , uNovoContato, uContatosDAO;

type
  TformPrincipal = class(TForm)
    Panel1: TPanel;
    gridContatos: TDBGrid;
    btnNovo: TBitBtn;
    queryListagem: TFDQuery;
    dtsListagem: TDataSource;
    editPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    queryListagemcontatoId: TFDAutoIncField;
    queryListagemnome: TWideStringField;
    queryListagemtelefone: TWideStringField;
    queryListagememail: TWideStringField;
    btnTodos: TBitBtn;
    btnEditar: TBitBtn;
    btnApagar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure gridContatosTitleClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure editPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure gridContatosDblClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    status : string;
  end;

var
  formPrincipal: TformPrincipal;
  contatos : TContatosDAO;
implementation

{$R *.dfm}

procedure TformPrincipal.btnApagarClick(Sender: TObject);
begin
  if(queryListagem.FieldByName('nome').asString <> EmptyStr) then begin
    contatos.contatoId := queryListagem.FieldByName('contatoId').AsInteger;
    if(messageDlg('Deseja apagar o contato?' + #13 + #13 +
      'Nome: ' + queryListagem.FieldByName('nome').AsString
      + #13 + 'Telefone: ' + queryListagem.FieldByName('telefone').AsString
      + #13 + 'E-mail: ' + queryListagem.FieldByName('email').AsString,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        if(contatos.apagar) then
          btnTodos.Click
        else
          showMessage('Ops! houve um erro ao apagar este contato!');
    end;
  end;

end;

procedure TformPrincipal.btnEditarClick(Sender: TObject);
begin
  if(queryListagem.FieldByName('nome').AsString <> EmptyStr) then begin
    status := 'editar';
    formNovo := TformNovo.Create(self);
    formNovo.ShowModal;
    formNovo.Release;
  end;
end;

procedure TformPrincipal.btnNovoClick(Sender: TObject);
begin
  status := 'novo';
  formNovo := TformNovo.Create(self);
  formNovo.showModal;
  formNovo.Release;
end;

procedure TformPrincipal.btnPesquisarClick(Sender: TObject);
var nome : string;
begin
  if(editPesquisa.Text <> '') then begin
    queryListagem.Active := false;
    queryListagem.SQL.Clear;
    nome := editPesquisa.Text;
    queryListagem.SQL.Add('select * from contatos where nome'
      + ' like ''%' + nome + '%''');
    queryListagem.Active := true;
  end;
end;

procedure TformPrincipal.btnTodosClick(Sender: TObject);
begin
  queryListagem.Active := false;
  queryListagem.SQL.Clear;
  queryListagem.SQL.Add('select * from contatos');
  queryListagem.Active := true;
end;

procedure TformPrincipal.editPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key = vk_return) then
    btnPesquisar.Click;
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
  status := 'novo';
  dtm := Tdtm.Create(self);
  contatos := TContatosDAO.create(dtm.dbConnection);
  queryListagem.Connection := dtm.dbConnection;
  queryListagem.Active := true;
  dtsListagem.DataSet := queryListagem;
  gridContatos.DataSource := dtsListagem;
end;

procedure TformPrincipal.gridContatosDblClick(Sender: TObject);
begin
  btnEditar.Click;
end;

procedure TformPrincipal.gridContatosTitleClick(Column: TColumn);
begin
  queryListagem.IndexFieldNames := column.FieldName;
end;

end.
