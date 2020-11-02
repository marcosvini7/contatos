unit uContatosDAO;

interface
  uses
    System.classes, vcl.controls, vcl.extctrls, vcl.dialogs,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
    FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB
    , FireDAC.Comp.Client, System.SysUtils, firedac.dapt
    ,firedac.stan.param;
  type
    TContatosDAO = class

  private
    connection : TFDConnection;
    FcontatoId : integer;
    Fnome : string;
    Ftelefone : string;
    femail : string;
    function getContatoId: integer;
    function getEmail: string;
    function getNome: string;
    function getTelefone: string;
    procedure setContatoId(const Value: integer);
    procedure setEmail(const Value: string);
    procedure setNome(const Value: string);
    procedure setTelefone(const Value: string);

  public
    constructor create(connection : TFDConnection);
    function inserir : boolean;
    function atualizar : boolean;
    function apagar : boolean;

  published
    property contatoId : integer read getContatoId write setContatoId;
    property nome : string read getNome write setNome;
    property telefone : string read getTelefone write setTelefone;
    property email : string read getEmail write setEmail;
  end;

implementation

{ TContatosDAO }

{$region 'METODOS'}

function TContatosDAO.inserir: boolean;
var query : TFDQuery;
begin
  try
    Result := true;
    query := TFDQuery.Create(nil);
    query.Connection := connection;
    query.SQL.Clear;
    query.SQL.Add('insert into contatos(nome, telefone, email)'
      + ' values(:nome, :telefone, :email)');
    query.ParamByName('nome').AsString := nome;
    query.ParamByName('telefone').AsString := telefone;
    query.ParamByName('email').AsString := email;
    try
      query.ExecSQL;
    except
      Result := false;
    end;
  finally
    if(Assigned(query)) then
      freeAndNil(query);
  end;

end;

function TContatosDAO.apagar: boolean;
var query : TFDQuery;
begin
  try
    Result := true;
    query := TFDQuery.Create(nil);
    query.Connection := connection;
    query.SQL.Clear;
    query.SQL.Add('delete  from contatos where contatoId = :contatoId');
    query.ParamByName('contatoId').AsInteger := contatoId;

    try
      query.ExecSQL;
    except
      Result := false;
    end;
  finally
    if(Assigned(query)) then
      freeAndNil(query);
  end;

end;

function TContatosDAO.atualizar: boolean;
var query : TFDQuery;
begin
  try
    Result := true;
    query := TFDQuery.Create(nil);
    query.Connection := connection;
    query.SQL.Clear;
    query.SQL.Add('update contatos set nome = :nome,'
      + 'telefone = :telefone, email = :email where'
      + ' contatoId = :contatoId');
    query.ParamByName('contatoId').AsInteger := contatoId;
    query.ParamByName('nome').AsString := nome;
    query.ParamByName('telefone').AsString := telefone;
    query.ParamByName('email').AsString := email;
    try
      query.ExecSQL;
    except
      Result := false;
    end;
  finally
    if(Assigned(query)) then
      freeAndNil(query);
  end;
end;

{$endregion}

{$region 'GETS SETS AND CONSTRUCTOR'}

constructor TContatosDAO.create(connection: TFDConnection);
begin
  self.connection := connection;
end;

function TContatosDAO.getContatoId: integer;
begin
  Result := FcontatoId;
end;

function TContatosDAO.getEmail: string;
begin
  Result := Femail;
end;

function TContatosDAO.getNome: string;
begin
   Result := Fnome;
end;

function TContatosDAO.getTelefone: string;
begin
   Result := Ftelefone;
end;

procedure TContatosDAO.setContatoId(const Value: integer);
begin
  FcontatoId := value;
end;

procedure TContatosDAO.setEmail(const Value: string);
begin
  Femail := value;
end;

procedure TContatosDAO.setNome(const Value: string);
begin
   Fnome := value;
end;

procedure TContatosDAO.setTelefone(const Value: string);
begin
    Ftelefone := value;
end;

{$endregion}

end.
