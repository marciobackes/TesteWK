unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Json, REST.Utils,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  REST.Response.Adapter, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, System.Types, StrUtils, Vcl.ExtCtrls, uPessoa;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonInserir: TButton;
    ButtonDeletar: TButton;
    Memo: TMemo;
    ButtonUpdate: TButton;
    OpenDialog1: TOpenDialog;
    ButtonInserirLote: TButton;
    FDMemTable: TFDMemTable;
    DataSource: TDataSource;
    EditIdPessoa: TDBEdit;
    EditPrimeiroNome: TDBEdit;
    EditSegundoNome: TDBEdit;
    EditDocumento: TDBEdit;
    ComboBoxNatureza: TComboBox;
    EditCep: TDBEdit;
    DBNavigator1: TDBNavigator;
    FDMemTableidpessoa: TIntegerField;
    FDMemTableflnatureza: TIntegerField;
    FDMemTabledsdocumento: TStringField;
    FDMemTablenmprimeiro: TStringField;
    FDMemTablenmsegundo: TStringField;
    FDMemTabledscep: TStringField;
    FDMemTabledsuf: TStringField;
    FDMemTablenmcidade: TStringField;
    FDMemTablenmbairro: TStringField;
    FDMemTablenmlogradouro: TStringField;
    FDMemTabledscomplemento: TStringField;
    EditUF: TDBEdit;
    Label7: TLabel;
    EditCidade: TDBEdit;
    Label8: TLabel;
    EditBairro: TDBEdit;
    Label9: TLabel;
    EditLogradouro: TDBEdit;
    Label10: TLabel;
    EditComplemento: TDBEdit;
    Label11: TLabel;
    ButtonAtualizar: TButton;
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonDeletarClick(Sender: TObject);
    procedure ComboBoxNaturezaChange(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonInserirLoteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FDMemTableAfterScroll(DataSet: TDataSet);
    procedure ButtonAtualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEditMask;
    procedure LimparCampos;
    function CarregarArquivoLote: TJSONArray;
    procedure Validar;
    procedure Inserir;
    procedure Deletar;
    procedure Update;
    procedure InserirLote(AArray: TJSONArray);
    procedure CarregarPessoa(IdPessoa: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonAtualizarClick(Sender: TObject);
begin
  CarregarPessoa('0');
end;

procedure TForm1.ButtonDeletarClick(Sender: TObject);
begin
  Deletar;
  CarregarPessoa('0');
end;

procedure TForm1.ButtonInserirClick(Sender: TObject);
begin
  Validar;
  Inserir;
  CarregarPessoa('0');
end;

procedure TForm1.ButtonInserirLoteClick(Sender: TObject);
begin
  InserirLote(CarregarArquivoLote);
end;

procedure TForm1.ButtonUpdateClick(Sender: TObject);
begin
  Validar;
  Update;
  CarregarPessoa('0');
end;

function TForm1.CarregarArquivoLote: TJSONArray;
const
  INDEX_ID = 0;
  INDEX_NATUREZA = 1;
  INDEX_DOCUMENTO = 2;
  INDEX_PRIMEIRO_NOME = 3;
  INDEX_SEGUNDO_NOME = 4;
  INDEX_CEP = 5;
var
  LCaminho: string;
  LArquivo: TStringList;
  LLinha: TStringDynArray;
  LJSONObject: TJSONObject;
  LIndex: Integer;
begin
  if OpenDialog1.Execute then
    LCaminho := OpenDialog1.FileName;

  Result := TJSONArray.Create;

  if not LCaminho.IsEmpty then
  begin
    LArquivo := TStringList.Create;
    try
      LArquivo.LoadFromFile(LCaminho);

      if LArquivo.Count > 0 then
      begin
        if LArquivo[0].Trim <> EmptyStr then
        begin
          LLinha := SplitString(LArquivo[0], ';');
          if (LLinha = nil) or (High(LLinha) + 1 < 6) then
            raise Exception.Create('Arquivo inv�lido. Layout esperado: IdPessoa;Natureza;Documento;PrimeiroNome;SegundoNome;Cep;')
          else
          begin
            for LIndex := 0 to Pred(LArquivo.Count) do
            begin
              if LArquivo[LIndex].Trim <> EmptyStr then
              begin
                LLinha := SplitString(LArquivo[LIndex], ';');
                if (LLinha = nil) or (High(LLinha) + 1 > 5) then
                begin
                  LJSONObject := TJSONObject.Create;
                  LJSONObject.AddPair('idpessoa', LLinha[INDEX_ID]);
                  LJSONObject.AddPair('flnatureza', LLinha[INDEX_NATUREZA]);
                  LJSONObject.AddPair('dsdocumento', LLinha[INDEX_DOCUMENTO].Replace('.', '').Replace('/', '').Replace('-', ''));
                  LJSONObject.AddPair('nmprimeiro', LLinha[INDEX_PRIMEIRO_NOME]);
                  LJSONObject.AddPair('nmsegundo', LLinha[INDEX_SEGUNDO_NOME]);
                  LJSONObject.AddPair('dscep', LLinha[INDEX_CEP].Replace('.', '').Replace('-', ''));

                  Result.AddElement(LJSONObject);
                end;
              end;
            end;
          end;
        end;
      end;
    finally
      LArquivo.Free;
    end;
  end;
end;

procedure TForm1.CarregarPessoa(IdPessoa: string);
begin
  TPessoa.GetInstancia.Table := FDMemTable;
  TPessoa.GetInstancia.Pessoa();
end;

procedure TForm1.ComboBoxNaturezaChange(Sender: TObject);
begin
  SetEditMask;
end;

procedure TForm1.Deletar;
var
  LRetorno: string;
begin
  if EditIdPessoa.Text = EmptyStr then
    raise Exception.Create('Informe o campo ID Pessoa.');

  LRetorno := TPessoa.GetInstancia.Deletar(EditIdPessoa.Text);

  Memo.Lines.Clear;
  Memo.Lines.Append(LRetorno);
  
  LimparCampos;
end;

procedure TForm1.FDMemTableAfterScroll(DataSet: TDataSet);
begin
  ComboBoxNatureza.ItemIndex := FDMemTableflnatureza.AsInteger;
  SetEditMask;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  CarregarPessoa('0');
end;

procedure TForm1.Inserir;
var
  LObject: TJSONObject;
  LRetorno: string;
begin
  LObject := TJSONObject.Create;
  LObject.AddPair('idpessoa', EditIdPessoa.Text);
  LObject.AddPair('flnatureza', ComboBoxNatureza.ItemIndex.ToString);
  LObject.AddPair('dsdocumento', EditDocumento.Text);
  LObject.AddPair('nmprimeiro', EditPrimeiroNome.Text);
  LObject.AddPair('nmsegundo', EditSegundoNome.Text);
  LObject.AddPair('dscep', EditCEP.Text);

  LRetorno := TPessoa.GetInstancia.Inserir(LObject);

  Memo.Lines.Clear;
  Memo.Lines.Append(LRetorno);
 
  LimparCampos;
end;

procedure TForm1.InserirLote(AArray: TJSONArray);
var
  LRetorno: string;
begin
  LRetorno := TPessoa.GetInstancia.InserirLote(AArray);

  Memo.Lines.Clear;
  Memo.Lines.Append(LRetorno);

  LimparCampos;
end;

procedure TForm1.LimparCampos;
begin
  EditIdPessoa.Clear;
  ComboBoxNatureza.ItemIndex := -1;
  EditPrimeiroNome.Clear;
  EditSegundoNome.Clear;
  EditDocumento.Clear;
  EditCep.Clear;
end;

procedure TForm1.SetEditMask;
begin
  if ComboBoxNatureza.ItemIndex = 0 then
    FDMemTabledsdocumento.EditMask := '999.999.999-99;0'
  else
    FDMemTabledsdocumento.EditMask := '99.999.999/9999-99;0'
end;

procedure TForm1.Update;
var
  LObject: TJSONObject;
  LRetorno: string;
begin
  LObject := TJSONObject.Create;
  LObject.AddPair('idpessoa', EditIdPessoa.Text);
  LObject.AddPair('flnatureza', ComboBoxNatureza.ItemIndex.ToString);
  LObject.AddPair('dsdocumento', EditDocumento.Text);
  LObject.AddPair('nmprimeiro', EditPrimeiroNome.Text);
  LObject.AddPair('nmsegundo', EditSegundoNome.Text);
  LObject.AddPair('dscep', EditCEP.Text);

  LRetorno := TPessoa.GetInstancia.Update(LObject);

  Memo.Lines.Clear;
  Memo.Lines.Append(LRetorno);

  LimparCampos;
end;

procedure TForm1.Validar;
begin
  if EditIdPessoa.Text = EmptyStr then
    raise Exception.Create('Informe o id da pessoa.');
  if (Length(EditDocumento.Text) <> 11) and (Length(EditDocumento.Text) <> 14) then
    raise Exception.Create('Documento inv�lido.');
  if Length(EditCEP.Text) <> 8 then
    raise Exception.Create('CEP inv�lido.');
end;

end.
