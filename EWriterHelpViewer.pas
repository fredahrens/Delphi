unit EWriterHelpViewer;

{
  very simple and basic implementation of support EWriter help files
  © 2022 ZeeBORN GmbH

  so far only display of help topics via ContextID does work
  all other items are still //TODO

  updated: 09.11.2022
}

interface

uses
  Windows, Sysutils, Classes, HelpIntfs, Forms, dialogs, ShellAPI;

type
  TEWriterHelpViewer = class(TInterfacedObject, ICustomHelpViewer,
    IExtendedHelpViewer)
  private
    TEWriterHelpSelector: Integer;
    FHelpManager: IHelpManager;
  public
    function GetViewerName: string;
    function UnderstandsKeyword(const HelpString: String): Integer;
    function UnderstandsTopic(const Topic: string): Boolean;
    procedure DisplayTopic(const Topic: string);
    function UnderstandsContext(const ContextID: THelpContext;
      const HelpFileName: string): Boolean;
    procedure DisplayHelpByContext(const ContextID: THelpContext;
      const HelpFileName: string);
    function GetHelpStrings(const HelpString: String): TStringList;
    function CanShowTableOfContents: Boolean;
    procedure ShowHelp(const HelpString: String);
    procedure ShowTableOfContents;
    procedure NotifyID(const ViewerID: Integer);
    procedure SoftShutDown;
    procedure ShutDown;
    property HelpManager: IHelpManager read FHelpManager write FHelpManager;
    property ViewerID: Integer read TEWriterHelpSelector;
  end;

  TEWriterHelpSelector = class(TInterfacedObject, IHelpSelector)
  public
    function SelectKeyword(Keywords: TStrings): Integer;
    function TableOfContents(Contents: TStrings): Integer;
  end;

const

  HELP_VIEWER_NAME = 'EWriter Help Viewer';

implementation

function TEWriterHelpViewer.CanShowTableOfContents: Boolean;
begin
  Result := True
end;

procedure TEWriterHelpViewer.DisplayHelpByContext(const ContextID: THelpContext;
  const HelpFileName: string);
var
  Context: String;
begin
  Context := IntToStr(ContextID);
  ShellExecute(0, nil, PChar(HelpFileName), PChar(Context), nil, SW_NORMAL);
end;

procedure TEWriterHelpViewer.DisplayTopic(const Topic: string);
begin
  // TODO
end;

function TEWriterHelpViewer.GetHelpStrings(const HelpString: String)
  : TStringList;
begin
  Result := TStringList.Create;
  Result.Add(HelpString);
end;

function TEWriterHelpViewer.GetViewerName: string;
begin
  Result := HELP_VIEWER_NAME;
end;

procedure TEWriterHelpViewer.NotifyID(const ViewerID: Integer);
begin
  TEWriterHelpSelector := ViewerID;
end;

procedure TEWriterHelpViewer.ShowHelp(const HelpString: String);
begin
  // TODO
end;

procedure TEWriterHelpViewer.ShowTableOfContents;
begin
  // TODO
end;

procedure TEWriterHelpViewer.ShutDown;
begin
  // TODO
end;

procedure TEWriterHelpViewer.SoftShutDown;
begin
  // TODO
end;

function TEWriterHelpViewer.UnderstandsContext(const ContextID: THelpContext;
  const HelpFileName: string): Boolean;
begin
  Result := True;
end;

function TEWriterHelpViewer.UnderstandsKeyword(const HelpString
  : String): Integer;
begin
  Result := 1;
end;

function TEWriterHelpViewer.UnderstandsTopic(const Topic: string): Boolean;
begin
  // TODO
  result := False;
end;

function TEWriterHelpSelector.SelectKeyword(Keywords: TStrings): Integer;
begin
  Result := 1
end;

function TEWriterHelpSelector.TableOfContents(Contents: TStrings): Integer;
begin
  Result := Contents.IndexOf(HELP_VIEWER_NAME);
end;

var
  HelpViewer: TEWriterHelpViewer;

initialization

HelpViewer := TEWriterHelpViewer.Create;
HelpIntfs.RegisterViewer(HelpViewer, HelpViewer.FHelpManager);
(HelpViewer.FHelpManager as IHelpSystem).AssignHelpSelector
  (TEWriterHelpSelector.Create);

end.
