unit WebModuleUnit1;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1HelloWorldAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1EditAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1SubmitAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  strict private
    FClickCounter: integer;
    function RandomEmoji: string;
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  System.IOUtils,
  System.Character,
  HTMLTemplates,
  Math,
  System.NetEncoding;

{$R *.dfm}

procedure TWebModule1.WebModule1EditAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  var lResponse := Request.ContentFields.Values['edit'];
  Response.Content := string.Format(HTMLTemplates.cEdit, [lResponse]);
end;

procedure TWebModule1.WebModule1HelloWorldAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  inc(FClickCounter, 1);
  Response.Content := 'Hello World!' + RandomEmoji() + ' - Clicks: ' + FClickCounter.ToString;
end;

procedure TWebModule1.WebModule1SubmitAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  // sanitizing the received value avoids Cross-site scripting (XSS) - https://en.wikipedia.org/wiki/Cross-site_scripting
  var lResponse := TNetEncoding.HTML.Encode(Request.ContentFields.Values['edit']);
  Response.Content := string.Format(HTMLTemplates.cSubmit, [lResponse, lResponse]);
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  FClickCounter := 0;
  Response.Content := HTMLTemplates.HTML;
end;

function TWebModule1.RandomEmoji: string;
begin
  var lRandomNumber := RandomRange(128512, 128592);
  Result := Char.ConvertFromUtf32(lRandomNumber);
end;

end.
