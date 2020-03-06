unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm8 }

  TForm8 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  Form8: TForm8;
  Form1: TForm;
  sec, min, heur : integer;
  H, M, F : TextFile;

implementation

{$R *.lfm}

{ TForm8 }



procedure Formcondition(var X:TForm8);
begin
     if X.Height = 36 then
     begin
          X.RadioButton1.Enabled:=False;
          X.RadioButton2.Enabled:=False;
          X.ComboBox1.Enabled:=False;
          X.ComboBox2.Enabled:=False;
          X.Button1.Enabled:=False;
          X.Edit1.Enabled:=False;
          X.CheckBox2.Enabled:=False;
          X.CheckBox1.Enabled:=False;
     end
     else
     begin
          X.RadioButton1.Enabled:=True;
          X.RadioButton2.Enabled:=True;
          X.ComboBox1.Enabled:=True;
          X.ComboBox2.Enabled:=True;
          X.Edit1.Enabled:=True;
          X.CheckBox2.Enabled:=True;
          X.CheckBox1.Enabled:=True;
     end;
end;

procedure maka(var X:TForm8); //inserer le temps dans les variables
var
  i, L, prix, j: integer;
begin
     heur:=0;
     sec:=0;
     if X.RadioButton1.Checked then
     begin
          heur:=0;
          sec:=0;
          min:=StrToInt(X.ComboBox1.Text);
          L:=StrToInt(X.ComboBox1.Text);
          For i:=0 to min do
          begin
               if min > 60 then
               begin
                    min:=min-60;
                    heur:=heur+1;
               end;
          end;
     end
     else
     begin
          min:=0;
          sec:=0;
          heur:=StrToInt(X.ComboBox2.Text);
          L:=0;
          For i := 1 to heur do
          begin
               L := L+60;
          end;
     end;

     X.ComboBox1.Caption:='';
     X.ComboBox2.Caption:='';

     //Insertion dans here.txt
     prix:=0;
     AssignFile(F, 'Here.txt');
     Append(F);
     if L = 0 then
     begin
          prix:=prix+0;
     end
     else if L = 49 then
     begin
          prix:=6500;
          writeln(F, IntToStr(L)+'mn   '+IntToStr(prix)+'fmg');
     end
     else
     begin
           j:=0;
           while j < L do
           begin
                 j:=j+4;
                 prix:=prix+500;
                 if prix = 6500 then
                 begin
                      prix:=prix+500;
                 end;
           end;
           writeln(F, IntToStr(L)+'mn   '+IntToStr(prix)+'fmg');
     end;
     CloseFile(F);

end;

procedure combobox(); //ajout des items combobox
var
  i,j:integer;
begin
     Form8.ComboBox1.Clear;
     Form8.ComboBox2.Clear;

     AssignFile(M, 'min.txt');
     AssignFile(H, 'heure.txt');

     Reset(M);
     Reset(H);

     while not EOF(M) do
     begin
          readln(M, i);
          Form8.ComboBox1.Items.Add(IntToStr(i));
     end;

     while not EOF(H) do
     begin
          readln(H, j);
          Form8.ComboBox2.Items.Add(IntToStr(j));
     end;

     CloseFile(M);
     CloseFile(H);
end;

procedure manoratra(var X:TForm8); //changer le label du temps
begin
     X.Label1.Caption:=IntToStr(sec);
     X.Label2.Caption:=IntToStr(min);
     X.Label3.Caption:=IntToStr(heur);
end;

procedure TForm8.Button1Click(Sender: TObject);
begin

     maka(Self);
     manoratra(Self);
     Timer1.Enabled:=True;
     Button1.Enabled:=False;
     RadioButton1.Checked:=True;
     If CheckBox1.Checked = False then
     begin
          Self.Height:=36;
     end;

end;

procedure TForm8.CheckBox1Change(Sender: TObject);
begin
     if CheckBox1.Checked then
     begin
          Self.BorderStyle:=bsDialog;
          Self.Image1.Enabled:=False;
     end
     else
     begin
          Self.BorderStyle:=bsNone;
          Self.Image1.Enabled:=True;
          Self.Height:=36;
          Formcondition(Form8);
     end;
end;

procedure TForm8.CheckBox2Change(Sender: TObject);
begin
     if CheckBox2.Checked then
     begin
          Edit1.Visible:=True;
          Self.Color:=clRed;
     end
     else
     begin
          Edit1.Visible:=False;
          Self.Color:=clBlue;
     end;
end;

procedure TForm8.ComboBox1Change(Sender: TObject);
begin
     if ComboBox1.Caption = '' then
     begin
          if ComboBox2.Caption = '' then
          begin
               Self.Button1.Enabled:=False;
          end
          else
          begin
               Self.Button1.Enabled:=True;
          end;
     end
     else
     begin
          Self.Button1.Enabled:=True;
     end;
end;

procedure TForm8.ComboBox2Change(Sender: TObject);
begin
     if ComboBox2.Caption = '' then
     begin
          Self.Button1.Enabled:=False;
          if ComboBox1.Caption = '' then
          begin
               Self.Button1.Enabled:=False;
          end
          else
          begin
               Self.Button1.Enabled:=true;
          end;
     end
     else
     begin
          Self.Button1.Enabled:=True;
     end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
     RadioButton1.Checked:=True;
     combobox();
end;

procedure TForm8.Image1DblClick(Sender: TObject);
begin
     if Self.Height = 36 then
     begin
          Self.Height := 300;
     end
     else
     begin
          Self.Height := 36;
     end;
     Formcondition(Form8);
end;

procedure TForm8.RadioButton1Change(Sender: TObject);
begin
     if RadioButton1.Checked then
     begin
          ComboBox1.Visible:=True;
          ComboBox2.Visible:=False;
          ComboBox2.Caption:='';
     end
     else
     begin
          ComboBox1.Visible:=False;
          ComboBox2.Visible:=True;
          ComboBox1.Caption:='';
     end;
     Button1.Enabled:=False;
end;

procedure TForm8.Timer1Timer(Sender: TObject);
var
  a, b: Integer;
begin
     sec:=sec-1;

     if sec <= 0 then
     begin
          if min > 0 then
          begin
               min:=min-1;
               sec:=sec+60;
          end
          else
          begin
               if heur > 0 then
               begin
                    heur:=heur-1;
                    min:=min+59;
                    sec:=sec+60;
               end
               else
               begin
                    Timer1.Enabled:=False;

                    a := Random(1200);
                    b := Random(400);

                    ShowMessagePos('------ '+Self.Caption+' ------', a, b);

                    if Self.CheckBox2.Checked then
                    begin
                         ShowMessage(Edit1.Caption + 'fmg mbola ts voaloha');
                         Self.CheckBox2.Checked:=False;
                    end;
               end;
          end;
     end;

     manoratra(Form8);
end;

procedure TForm8.Timer2Timer(Sender: TObject);
begin
     if CheckBox3.Checked then
     begin
          CheckBox3.Checked:=False;
          combobox();
     end;
end;

end.

