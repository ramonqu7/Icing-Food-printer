using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.IO;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using System.Runtime.InteropServices;
using System.Globalization;
using System.Diagnostics;

namespace arduino_drawing
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();

        }


        
        private StreamReader gcodeFile = new StreamReader("E:/arduino-drawing/arduino-drawing/upload/example.gcode");
        private connector con = new connector();


        private List<Point> PointsList = new List<Point>();
        private List<String> Command = new List<String>();

        private Stopwatch timer = new Stopwatch();
        private int pointnumber = 0;
        private TimeSpan CurrentTimeSpan = new TimeSpan();

        private Point currentP_p = new Point();
        private bool isdrawing_p;
        private Point p_p = new Point();

        private void import_Click(object sender, RoutedEventArgs e)
        {
            Dispatcher.Invoke((Action)(() => progress.Text=""));
            Dispatcher.Invoke((Action)(() => textBlock.Text = ""));

            // Create OpenFileDialog 
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog();



            // Set filter for file extension and default file extension 
            dlg.DefaultExt = ".gcode";
            dlg.Filter = "Gcode Files (*.gcode)|*.gcode";


            // Display OpenFileDialog by calling ShowDialog method 
            Nullable<bool> result = dlg.ShowDialog();


            // Get the selected file name and display in a TextBox 
            if (result == true)
            {
                // Open document 
                string filename = dlg.FileName;
                gcodeFile = new StreamReader(filename);
                Dispatcher.Invoke((Action)(() => textBlock.Text = filename));
                Dispatcher.Invoke((Action)(() => progress.Text += filename+" Import Sucessfully\n"));
                prepare_file();
            }
        }

        private void clear_Click(object sender, RoutedEventArgs e)
        {
            gcodeFile = null;
            canvas.Children.Clear();
            PointsList.Clear();
            Command.Clear();
            con.closeSerial();
        }

        private void prepare_file()
        {
            canvas.Children.Clear();
            PointsList.Clear();
            Command.Clear();
            con.gcodeFile = gcodeFile;
            con.port = portNumber.Text;
            con.Parsegcode();
            PointsList = con.PointList;
            Command = con.Command;
            Dispatcher.Invoke((Action)(() => progress.Text += "Number of Point: "+PointsList.Count.ToString()+"\n"));
            drawgcode();

                // Draw lines

            
        }


        private void drawgcode()
        {
            Point currentP = new Point(0, 0);
            int commandid = 0;
            bool isdrawing = false;
            foreach (Point p in PointsList)
            {
                if ((p.X == -1)&&(p.Y == -1))
                {
                    if (Command[commandid] == "S")
                    {
                        isdrawing = true;
                        commandid += 1;
                    }
                    else if (Command[commandid] == "T")
                    {
                        isdrawing = false;
                        commandid += 1;
                    }
                    else
                    {
                        commandid += 1;
                    }

                }
                else
                {
                    if (((isdrawing)&&(currentP.X !=-1))&&(currentP.X!=0))
                    {
                        Line line = new Line();
                        line.Stroke = Brushes.Black;
                        line.X1 = currentP.X;
                        line.Y1 = currentP.Y;
                        line.X2 = p.X;
                        line.Y2 = p.Y;
                        currentP.X = p.X;
                        currentP.Y = p.Y;
                        canvas.Children.Add(line);


                    }
                    else
                    {
                        currentP.X = p.X;
                        currentP.Y = p.Y;

                    }



                }



             }
            
        }





        private void print_Click(object sender, RoutedEventArgs e)
        {
            ThreadPool.QueueUserWorkItem((o) =>
            {
                Dispatcher.Invoke((Action)(() =>
                {
                    
                    CurrentTimeSpan = new TimeSpan(0, 0, 0, 0, 0);
                    timer.Start();
                    
                    progress.Text += "Serial Port open successfully! Ready to Load and print!\n";

                    canvas.Visibility = Visibility.Hidden;
                    ProgressBar.Visibility = Visibility.Visible;
                    ProgressNumber.Visibility = Visibility.Visible;
                    printing.Visibility = Visibility.Visible;
                    pointnumber = 1;
                }
            ));
                con.closeSerial();
                String s = con.connect();
                con.printpre("READYTOGO");
                Dispatcher.Invoke((Action)(() => progress.Text += s + "\nPrinter is ready to print\n"));
                Stopwatch servotime = new Stopwatch();
                if (s == "Serial Port is Open")
                {


                    Point currentP = new Point(0, 0);
                    int commandid = 0;
                    foreach (Point p in PointsList)
                    {
                        if ((p.X == -1))
                        {
                            if (Command[commandid] == "S")
                            {
                                commandid += 1;
                                con.SendCom("S103");
                                isdrawing_p = true;
                                if (!servotime.IsRunning)
                                {
                                    servotime.Start();
                                }
                            }
                            else if (Command[commandid] == "T")
                            {
                                commandid += 1;
                                con.SendCom("T");
                                isdrawing_p = false;
                                servotime.Stop();
                               }
                            else if (Command[commandid] == "H")
                            {
                                commandid += 1;
                                con.SendCom("H");
                            }
                            else if (Command[commandid] == "E")
                            {
                                commandid += 1;

                                TimeSpan ts = servotime.Elapsed;

                                con.SendCom("E"+ts.TotalMilliseconds.ToString());
                            }


                        }
                        else
                        {

                            p_p = p;
                            con.SendPos(p.X.ToString(), p.Y.ToString());
                            currentP.X = p.X;
                            currentP.Y = p.Y;
                            Dispatcher.Invoke((Action)(() =>{
                                if (((isdrawing_p) && (currentP_p.X != -1)) && (currentP_p.X != 0))
                                {
                                    Line line = new Line();
                                    line.Stroke = Brushes.Black;
                                    line.X1 = currentP_p.X;
                                    line.Y1 = currentP_p.Y;
                                    line.X2 = p_p.X;
                                    line.Y2 = p_p.Y;
                                    printing.Children.Add(line);
                                    currentP_p.X = p_p.X;
                                    currentP_p.Y = p_p.Y;

                                }
                                else
                                {
                                    currentP_p.X = p_p.X;
                                    currentP_p.Y = p_p.Y;

                                }

                            }));


                        }

                        con.ReceiveArd();

                        Dispatcher.Invoke((Action)(() =>
                        {
                            int Pointsnumber = PointsList.Count - pointnumber;
                            int progressvalue = (int)((double)pointnumber / (double)PointsList.Count * 100);
                            
                            ProgressBar.Value = progressvalue;
                            ProgressNumber.Text = "Printing\n"+progressvalue.ToString() + "%";

                            TimeSpan ts = timer.Elapsed;
                            
                            TimeSpan pointpertime =(ts - CurrentTimeSpan);
                            CurrentTimeSpan = ts;
                            

                            String currentTime = String.Format("{0:00 Hr }:{1:00 Min }:{2:00 s }.{3:00 ms}",
                                ts.Hours, ts.Minutes, ts.Seconds, ts.Milliseconds / 10);
                            Double totalsecond = pointpertime.TotalSeconds * Pointsnumber;
                            String tempTime =  String.Format("{0:00 Min} : {1:00 s }", (int)(totalsecond/60),(int)(totalsecond%60) );

                            TimerRemain.Text = "Print Time: " + currentTime+" Time Remain: "+tempTime;

                            progress.Text += "Point "+pointnumber.ToString()+" "+con.Data + "\n";

                            pointnumber += 1;
                            
                        }));
                    }
                    Dispatcher.Invoke((Action)(() => {
                        progress.Text += "Printing Completed";
                        timer.Stop();

                        }));
                }
             });
        }

        private void load_Click(object sender, RoutedEventArgs e)
        {
            con.port = portNumber.Text;
            con.connect();
            con.printpre("SL");
            con.ReceiveArd();
            con.closeSerial();
        }

        private void reload_Click(object sender, RoutedEventArgs e)
        {
            con.port = portNumber.Text;
            con.connect();
            con.printpre("SR");
            con.ReceiveArd();
            con.closeSerial();
        }

        private void MoveTo_Click(object sender, RoutedEventArgs e)
        {
            con.port = portNumber.Text;
            if (con.connected == false) {con.connect(); }
            
            con.printpre("READYTOGO");
            con.SendPos(Xpos.Text, Ypos.Text);
            con.ReceiveArd();


        }
    }
}
