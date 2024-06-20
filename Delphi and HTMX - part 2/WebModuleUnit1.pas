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
  System.IOUtils,
  HTMLTemplates;

{$R *.dfm}

procedure TWebModule1.WebModule1EditAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  lResponse: string;
begin
  lResponse := Request.ContentFields.Values['edit'];
  Response.Content := string.Format(HTMLTemplates.cEdit, [lResponse]);
end;

procedure TWebModule1.WebModule1HelloWorldAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'Hello World!🌍';
end;

procedure TWebModule1.WebModule1SubmitAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  lResponse: string;
begin
  lResponse := Request.ContentFields.Values['edit'];
  Response.Content := string.Format(HTMLTemplates.cSubmit, [lResponse, lResponse]);
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := HTMLTemplates.HTML;
end;

end.
