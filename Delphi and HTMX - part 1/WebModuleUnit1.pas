unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1HelloWorldAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1EditAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1SubmitAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  System.IOUtils;

{$R *.dfm}

procedure TWebModule1.WebModule1EditAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
const
  cEdit = '''
    <form hx-post="/submit" hx-swap="outerHTML">
      <input type="text" name="edit" value="%s"/>
      <button>Submit</button>
    </form>
  ''';
var
  lResponse: string;
begin
  lResponse := Request.ContentFields.Values['edit'];
  Response.Content := string.Format(cEdit, [lResponse]);
end;

procedure TWebModule1.WebModule1HelloWorldAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Hello World!';
end;

procedure TWebModule1.WebModule1SubmitAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
const
  cSubmit = '''
    <form hx-get="/edit" hx-swap="outerHTML">
      <input type="text" name="edit" value="%s" readonly/>
      <button>Edit</button>
      <label>%s</label>
    </form>
  ''';
var
  lResponse: string;
begin
  lResponse := Request.ContentFields.Values['edit'];
  Response.Content := string.Format(cSubmit, [lResponse, lResponse]);
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  var templatesPath := 'index.html';
  Response.Content := TFile.ReadAllText(templatesPath);
end;

end.
