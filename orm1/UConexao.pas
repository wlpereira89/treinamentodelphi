unit UConexao;

interface

uses
  Generics.Collections, Classes,
  System.SysUtils,
  Aurelius.Commands.Listeners,
  Aurelius.Drivers.Interfaces,
  Aurelius.Engine.AbstractManager,
  Aurelius.Engine.ObjectManager,
  Aurelius.Engine.DatabaseManager,
  Aurelius.Drivers.SQLite,
  Aurelius.Sql.SQLite;

type
  TGerenciadorConexao = class sealed
  private
  class var
    FInstancia: TGerenciadorConexao;
    FDBConnection: IDBConnection;
    // procedure Destruir;
    function GetConexao: IDBConnection;
    function CriarConexao: IDBConnection;
  public
    class function GetInstancia: TGerenciadorConexao;
    // function Conectado: Boolean;
    property Conexao: IDBConnection read GetConexao;
  end;

const
  EnderecoBanco =
    'C:\Users\Naiane\Documents\Embarcadero\Studio\Projects\orm1\db.s3db';

implementation

function TGerenciadorConexao.CriarConexao: IDBConnection;
begin
  if FDBConnection <> nil then
    Exit(FDBConnection);
  if FDBConnection = nil then
    FDBConnection := TSQLiteNativeConnectionAdapter.Create(EnderecoBanco);
  Result := FDBConnection;
end;

function TGerenciadorConexao.GetConexao: IDBConnection;
begin
  Result := CriarConexao;
  if not Result.IsConnected then
    Result.Connect;
  if Result = nil then
    raise Exception.Create('Houve um erro ao criar a conexão!');
end;

class function TGerenciadorConexao.GetInstancia: TGerenciadorConexao;
begin
  if FInstancia = nil then
    FInstancia := TGerenciadorConexao.Create;
  Result := FInstancia;
end;

initialization

finalization

if TGerenciadorConexao.FDBConnection <> nil then
begin
  TGerenciadorConexao.FDBConnection.Disconnect;
  TGerenciadorConexao.FDBConnection := nil;
end;
if TGerenciadorConexao.FInstancia <> nil then
begin
  TGerenciadorConexao.FInstancia.Free;
  TGerenciadorConexao.FInstancia := nil;
end;

end.
