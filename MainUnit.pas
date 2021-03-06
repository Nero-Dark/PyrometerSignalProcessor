unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.ExtCtrls,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.Grids, VCLTee.TeeFunci;

type
  TMainForm = class(TForm)
    Chart2: TChart;
    GroupBox1: TGroupBox;
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Chart1: TChart;
    DCRefSeries: TLineSeries;
    DCMainSeries: TLineSeries;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RefSignalSeries: TLineSeries;
    MainSignalSeries: TLineSeries;
    AverSignalSeries: TLineSeries;
    StringGrid1: TStringGrid;
    Main1: TMenuItem;
    LoadFile1: TMenuItem;
    SaveFile1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    Manual1: TMenuItem;
    N2: TMenuItem;
    Aboutprogram1: TMenuItem;
    Chart3: TChart;
    TUpSeries: TLineSeries;
    TDownSeries: TLineSeries;
    TAverageSeries: TLineSeries;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    SwitchValueEdit: TEdit;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    AmountDotsEdit: TEdit;
    FirstDotEdit: TEdit;
    HalfPerDotsEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    KRangeToEdit: TEdit;
    KRangeFromEdit: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    DCUEdit: TEdit;
    Label10: TLabel;
    DCDEdit: TEdit;
    CalcBtn: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    SignalUpEdit: TEdit;
    ResetBtn: TButton;
    procedure LoadFile1Click(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
    procedure CalcBtnClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SaveFile1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  data: array of array of extended;
  TempU,TempD,TempA, TUEnd,TDEnd: array[0..1,0..5000] of extended;
  uplevel,DCUp,DCDown,switch_lvl:extended;
  dcbool: boolean;

implementation

{$R *.dfm}

function PIF41_200KHz(k:extended):extended;
begin
  result:=-3391.18029*(1-exp(-k/3.13791))+(-16200500*(1-exp(-k/0.31408)))+16205400;
end;
function PIF41_1MHz(k:extended):extended;
begin
  result:=-135454.94069*(1-exp(-k/0.48696))+(-10884.07562*(1-exp(-k/1.19072)))+147793.45883;
end;

function PIF42_200KHz(k:extended):extended;
begin
  result:=-135454.94069*(1-exp(-k/0.48696))+(-10884.07562*(1-exp(-k/1.19072)))+147793.45883;
end;
function PIF42_1MHz(k:extended):extended;
begin
  result:=-135454.94069*(1-exp(-k/0.48696))+(-10884.07562*(1-exp(-k/1.19072)))+147793.45883;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Stringgrid1.ColCount:=5;
  StringGrid1.ColWidths[0]:=75;
  StringGrid1.ColWidths[1]:=110;
  StringGrid1.ColWidths[2]:=75;
  StringGrid1.ColWidths[3]:=110;
  StringGrid1.ColWidths[4]:=129;
  Stringgrid1.Cells[0,0]:= 'Time Up:';
  Stringgrid1.Cells[1,0]:= 'Temperature Up:';
  Stringgrid1.Cells[2,0]:= 'Time Down:';
  Stringgrid1.Cells[3,0]:= 'Temperature Down:';
  Stringgrid1.Cells[4,0]:= 'Average temperature:';
end;

procedure TMainForm.LoadFile1Click(Sender: TObject);
var filename,s1,s2:string;
    LoadedFile: TextFile;
    i,j,k:integer;
    separator: char;
    startTime, endTime:TDateTime;
begin
  if OpenDialog1.Execute then
    begin
      filename:=OpenDialog1.FileName;
      startTime:=Time;
      AssignFile(LoadedFile, filename);
      Reset(LoadedFile);
    end
  else
    exit;

  RefSignalSeries.Clear;
  DCRefSeries.Clear;
  DCMainSeries.Clear;
  MainSignalSeries.Clear;
  AverSignalSeries.Clear;
  dcbool:=false;

  i:=0; j:=0; k:=0;
  separator:= #9;

//  ???? ?????? ????? ? ?????? ? ?????? (??????)
  while not eof(LoadedFile) do
    begin
      readln (loadedfile, s1);
      while s1<>'' do
      if  pos(separator, s1)<>0 then
        begin
          SetLength(data, 3, k+1);
          s2 := copy(s1,1,pos(separator, s1)-1);
          delete (s1, 1, pos(separator, S1));
          s2:= StringReplace(s2,'.',',',[rfReplaceAll, rfIgnoreCase]);
          s2:= StringReplace(s2,'E','e',[rfReplaceAll, rfIgnoreCase]);
          s2:= StringReplace(s2,' ','',[rfReplaceAll, rfIgnoreCase]);
          data[j,i]:= strtofloat(s2);
          j:=j+1;
        end
      else
        begin
          s2 := copy(s1,1,length(s1));
          delete (s1, 1, length(s1));
          s2:= StringReplace(s2,'.',',',[rfReplaceAll, rfIgnoreCase]);
          s2:= StringReplace(s2,'E','e',[rfReplaceAll, rfIgnoreCase]);
          s2:= StringReplace(s2,' ','',[rfReplaceAll, rfIgnoreCase]);
          data[j,i]:=strtofloat(s2);
          j:=0;
        end;
        i:=i+1;
        k:=k+1;
    end;  //(?????)
  closefile(loadedfile);

  switch_lvl:=0;
  for i:=0 to 9999 do
    switch_lvl:=switch_lvl + data[2,i];
  switch_lvl:=switch_lvl/10000;
  SwitchValueEdit.Text:=FloatToStr(switch_lvl);

  i:=0;
  j:=0;
  k:=0;

  while True do
    begin
      if ((data[2,i] < switch_lvl) and (data[2,i+1] > switch_lvl)) or
         ((data[2,i] > switch_lvl) and (data[2,i+1] < switch_lvl)) then
         break;
      Inc(i);
    end;

  while data[0,i]<0 do
    begin
      if data[2,i]< switch_lvl then
        begin
          DCUp:=DCUp+data[1,i];
          Inc(j);
        end;
      if data[2,i]> switch_lvl then
        begin
          DCDown:=DCDown+data[1,i];
          Inc(k);
        end;
      Inc(i);
    end;

  DCUp:=DCUp/j;
  DCDown:=DCDown/k;
  DCUEdit.Text:=FloattoStr(DCUp);
  DCDEdit.Text:=FloattoStr(DCDown);

  SignalUpEdit.Text:=FloatToStr(4-DCUp);

  i:=0;
  while data[0,i]<0 do
    begin
      DCMainSeries.AddXY(data[0,i]*1000000,data[1,i]);
      DCRefSeries.AddXY(data[0,i]*1000000,data[2,i]);
      Inc(i);
    end;

  while i <> length(data[0])-1 do
    begin
      MainSignalSeries.AddXY(data[0,i]*1000000,data[1,i]);
      RefSignalSeries.AddXY(data[0,i]*1000000,data[2,i]);
      inc(i);
    end;

  i:=0;
  j:=0;
  while True do
    begin
      if ((data[2,i] < switch_lvl) and (data[2,i+1] > switch_lvl)) then
         break;
      Inc(i);
    end;

  while i <> Length(data[0]) do
    begin
      Inc(j);
      if ((data[2,i] > switch_lvl) and (data[2,i+1] < switch_lvl)) then
        break;
      Inc(i);
    end;


  HalfPerDotsEdit.Text:=IntToStr(j-1);
  FirstDotEdit.Text:=FloatToStr((j-1)/100*24);
  AmountDotsEdit.Text:=FloatToStr((j-1)/100*64);


  ResetBtn.Enabled:=true;
  CalcBtn.Enabled:=true;
end;

procedure TMainForm.CalcBtnClick(Sender: TObject);
var i,j,k: integer;
    KRangeD,KRangeU,UpLvl: double;
    HalfPeriodTime,HalfPeriodSignal,HalfPeriodRef:extended;
    tempdata: array of array of extended;
begin
  AverSignalSeries.Clear;
  TUpSeries.Clear;
  TDownSeries.Clear;
  TAverageSeries.Clear;

  fillchar(TempU,sizeof(TempU),0);
  fillchar(TempD,sizeof(TempD),0);
  fillchar(TempA,sizeof(TempA),0);
  fillchar(TUEnd,sizeof(TUEnd),0);
  fillchar(TDEnd,sizeof(TDEnd),0);

  KRangeD:=StrToFloat(KRangeFromEdit.Text);
  KRangeU:=StrToFloat(KRangeToEdit.Text);
  UpLvl:=StrToFloat(SignalUpEdit.Text);

  setlength(tempdata,3,length(TempU[1]));
  i:=0;
  j:=0;
  k:=0;
  while data[0,i]<>0 do
    inc(i);


  HalfPeriodTime:=0;
  HalfPeriodSignal:=0;
  HalfPeriodRef:=0;
  while i < length(data[0]) do
    begin
      if ((data[2,i] < switch_lvl) and (data[2,i+1] > switch_lvl)) or
         ((data[2,i] > switch_lvl) and (data[2,i+1] < switch_lvl)) then
        begin
          i:=i+StrToInt(FirstDotEdit.Text);
          j:=i;
          while StrToInt(AmountDotsEdit.Text)> j-i do
            begin
              HalfPeriodTime:=HalfPeriodTime + data[0,j];
              HalfPeriodSignal:=HalfPeriodSignal + data[1,j];
              HalfPeriodRef:=HalfPeriodRef + data[2,j];
              inc(j)
            end;
          tempdata[0,k]:=HalfPeriodTime/StrToInt(AmountDotsEdit.Text);
          tempdata[1,k]:=HalfPeriodSignal/StrToInt(AmountDotsEdit.Text);
          tempdata[2,k]:=HalfPeriodRef/StrToInt(AmountDotsEdit.Text);
          HalfPeriodTime:=0;
          HalfPeriodSignal:=0;
          HalfPeriodRef:=0;
          inc(k);
        end;
      inc(i);
    end;

  for i := 0 to length(tempdata[0])-1 do
    if tempdata[0,i] <> 0 then
      AverSignalSeries.AddXY(tempdata[0,i]*1000000,tempdata[1,i]);


  i:=0;
  while tempdata[0,i]<>0 do
    inc(i);
  SetLength(tempdata,3,i);
  j:=0;
  for I := 1 to Length(tempdata[0])-4 do
    begin
      if tempdata[2,1]<switch_lvl then
        begin
          TempD[0,j]:=tempdata[0,i];
          TempD[1,j]:=tempdata[1,i]/((tempdata[1,i-1]+tempdata[1,i+1])/2);
          TempU[0,j]:=tempdata[0,i+1];
          TempU[1,j]:=((tempdata[1,i]+tempdata[1,i+2])/2)/tempdata[1,i+1];
          inc(j);
        end
      else
        begin
          TempU[0,j]:=tempdata[0,i];
          TempU[1,j]:=((tempdata[1,i-1]+tempdata[1,i+1])/2)/tempdata[1,i];
          TempD[0,j]:=tempdata[0,i+1];
          TempD[1,j]:=tempdata[1,i+1]/((tempdata[1,i]+tempdata[1,i+2])/2);
          inc(j);
        end;
    end;

  j:=0;
  k:=0;
  for I := 0 to Length(TempU[0]) do
    begin
      if (RadioGroup1.ItemIndex = 1) and (RadioGroup2.ItemIndex = 0) then
        begin
          if (TempU[1,i]>KRangeD) and (TempU[1,i]<KRangeU) and (TempU[1,i] < UpLvl) then
            begin
              TUEnd[0,j]:=TempU[0,i];
              TUEnd[1,j]:=-135454.94069*(1-exp(-TempU[1,i]/0.48696))+(-10884.07562*(1-exp(-TempU[1,i]/1.19072)))+147793.45883;
              inc(j)
            end;
          if (TempD[1,i]>KRangeD) and (TempD[1,i]<KRangeU) and (TempD[1,i] <> 0) then
            begin
              TDEnd[0,k]:=TempD[0,i];
              TDEnd[1,k]:=-135454.94069*(1-exp(-TempD[1,i]/0.48696))+(-10884.07562*(1-exp(-TempD[1,i]/1.19072)))+147793.45883;
              inc(k);
            end;
        end;
    end;

  j:=0;
  for i := 0 to Length(TUEnd[0])-1 do
        begin
          if TUEnd[1,i] <> 0 then
            TUpSeries.AddXY(TUEnd[0,i]*1000000,TUEnd[1,i]);
          if TDEnd[1,i] <> 0 then
            TDownSeries.AddXY(TDEnd[0,i]*1000000,TDEnd[1,i]);

          if (TUEnd[1,i] <> 0) and (TDEnd[1,i] <> 0) then
            begin
              TempA[0,j]:=(TUEnd[0,i]+TDEnd[0,i])/2;
              TempA[1,j]:=(TUEnd[1,i]+TDEnd[1,i])/2;
            end;

          if TempA[1,j] <> 0 then
            TAverageSeries.AddXY(TempA[0,j]*1000000,TempA[1,j]);
          inc(j);
        end;
   for i := 1 to Length(TUEnd[0])-2 do
    begin
      StringGrid1.RowCount:=Length(TUEnd[0]);
      if TUEnd[1,i] <> 0 then
        begin
          StringGrid1.Cells[0,i]:=FloatToStr(TUEnd[0,i]);
          StringGrid1.Cells[1,i]:=FloatToStr(TUEnd[1,i]);
        end;
      if TDEnd[1,i] <> 0 then
        begin
          StringGrid1.Cells[2,i]:=FloatToStr(TDEnd[0,i]);
          StringGrid1.Cells[3,i]:=FloatToStr(TDEnd[1,i]);
        end;
      if TempA[1,i] <> 0 then
        StringGrid1.Cells[4,i]:=FloatToStr(TempA[1,i]);
    end;

end;

procedure TMainForm.ResetBtnClick(Sender: TObject);
begin
  RefSignalSeries.Clear;
  DCRefSeries.Clear;
  DCMainSeries.Clear;
  MainSignalSeries.Clear;
  AverSignalSeries.Clear;
  TUpSeries.Clear;
  TDownSeries.Clear;
  TAverageSeries.Clear;
  dcbool:=false;

  setlength(data,0,0);

  fillchar(TempU,sizeof(TempU),0);
  fillchar(TempD,sizeof(TempD),0);
  fillchar(TempA,sizeof(TempA),0);
  fillchar(TUEnd,sizeof(TUEnd),0);
  fillchar(TDEnd,sizeof(TDEnd),0);

  HalfPerDotsEdit.Text:='';
  FirstDotEdit.Text:='';
  AmountDotsEdit.Text:='';
  DCUEdit.Text:='';
  DCDEdit.Text:='';
  SignalUpEdit.Text:='';
  SwitchValueEdit.Text:='';

  ResetBtn.Enabled:=False;
  CalcBtn.Enabled:=False;
end;

procedure TMainForm.Savefile1Click(Sender: TObject);
var savefile : textfile;
    i : integer;
    savefilename: string;
    temptxt: string;

begin
  //  ?????????? ????? ?????????? (??????)
  SaveDialog1.Execute;
  savefilename:=savedialog1.FileName;
  temptxt:=copy(savefilename,length(savefilename)-3,4);
  if temptxt <> '.txt' then
    savefilename := savefilename+'.txt';
  assignfile (savefile,savefilename);
  rewrite(savefile);
 for i:=0 to length(TDEnd[1])-1 do
  begin
    if (TDEnd[1,i]<>0) and (TUEnd[1,i+1]<>0) then
      writeln(savefile, floattostr(TDEnd[0,i])+ #9 +floattostr(TDEnd[1,i])
                    +#9 + FloatToStr(TUEnd[0,i+1]) + #9 +floattostr(TUEnd[1,i+1])
                    +#9 + FloatToStr(TempA[0,i+1]) + #9 +floattostr(TempA[1,i+1]));
  end;
 closefile(savefile);
 // (?????)
end;

procedure TMainForm.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 1 then
    MessageDlg('There is no calibration equation for the given frequency',mtWarning,[mbOk], 0);
end;

procedure TMainForm.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 1 then
    MessageDlg('There is no calibration equation for the given frequency',mtWarning,[mbOk], 0);
end;


end.
