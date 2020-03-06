unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin

     if Self.ComboBox1.Caption = Form2.Caption then
     begin
          if Form2.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form2.Color:=Random(color);
                    end
                    else
                    begin
                         Form2.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form3.Caption then
     begin
          if Form3.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form3.Color:=Random(color);
                    end
                    else
                    begin
                         Form3.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form4.Caption then
     begin
          if Form4.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form4.Color:=Random(color);
                    end
                    else
                    begin
                         Form4.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form5.Caption then
     begin
          if Form5.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form5.Color:=Random(color);
                    end
                    else
                    begin
                         Form5.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form6.Caption then
     begin
          if Form6.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form6.Color:=Random(color);
                    end
                    else
                    begin
                         Form6.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form7.Caption then
     begin
          if Form7.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form7.Color:=Random(color);
                    end
                    else
                    begin
                         Form7.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form8.Caption then
     begin
          if Form8.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form8.Color:=Random(color);
                    end
                    else
                    begin
                         Form8.Color:=clBlue;
                    end;
               end;
          end;
     end
     else if Self.ComboBox1.Caption = Form9.Caption then
     begin
          if Form9.CheckBox2.Checked = False then
          begin
               if CheckBox2.Checked then
               begin
                    if CheckBox1.Checked then
                    begin
                         Form9.Color:=Random(color);
                    end
                    else
                    begin
                         Form9.Color:=clBlue;
                    end;
               end;
          end;
     end
     else
     begin

     end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     Self.Hide;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  H, M :TextFile;
  i:integer;
begin
     if Edit2.Caption = '' then
     begin

     end
     else
     begin
           i:=StrToInt(Edit2.Caption);
           AssignFile(M, 'min.txt');
           AssignFile(H, 'heure.txt');

           append(M);
           append(H);

           if RadioButton1.Checked then
           begin
                writeln(M, IntToStr(i));
                ShowMessage(IntToStr(i)+'mn a été ajouter');
           end
           else
           begin
                writeln(H, IntToStr(i));
                ShowMessage(IntToStr(i)+'h a été ajouter');
           end;

           Edit2.Caption:='';

           CloseFile(M);
           CloseFile(H);

           Form2.CheckBox3.Checked:=true;
           Form3.CheckBox3.Checked:=true;
           Form4.CheckBox3.Checked:=true;
           Form5.CheckBox3.Checked:=true;
           Form6.CheckBox3.Checked:=true;
           Form7.CheckBox3.Checked:=true;
           Form8.CheckBox3.Checked:=true;
           Form9.CheckBox3.Checked:=true;
     end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     Button1.Click;

     Self.Hide;

     RadioButton1.Checked:=True;
     Edit2.Caption:='';

     ComboBox1.Caption:='';

     CheckBox1.Checked:=False;
     CheckBox2.Checked:=False;
end;

procedure TForm1.FormHide(Sender: TObject);
begin
     ComboBox1.Caption:='';

     CheckBox1.Checked:=False;
     CheckBox2.Checked:=False;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
     RadioButton1.Checked:=true;

     Self.ComboBox1.Clear;

     Self.ComboBox1.Items.Add(Form2.Caption);
     Self.ComboBox1.Items.Add(Form3.Caption);
     Self.ComboBox1.Items.Add(Form4.Caption);
     Self.ComboBox1.Items.Add(Form5.Caption);
     Self.ComboBox1.Items.Add(Form6.Caption);
     Self.ComboBox1.Items.Add(Form7.Caption);
     Self.ComboBox1.Items.Add(Form8.Caption);
     Self.ComboBox1.Items.Add(Form9.Caption);
end;

end.

