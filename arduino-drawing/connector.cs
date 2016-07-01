using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.IO;
using System.IO.Ports;
using System.Windows;

namespace arduino_drawing
{
    class connector
    {
        //Arduino connector class

        private SerialPort serial = new SerialPort();
        public String port { get; set; }
        public StreamReader gcodeFile;

        private List<Point> _pointsList = new List<Point>();
        private List<String> _command = new List<String>();

        public bool connected = false;

        public List<Point> PointList
        {
            get { return _pointsList; }
            set { _pointsList = value; }
        }
        public List<String> Command
        {
            get { return _command; }
            set { _command = value; }
        }


        public String Data
        {
            get { return data; }
            set { data = value; }
        }

        private String data;
        private bool _receivedData = false;

        public String connect()
        {
            serial = new SerialPort(port,115200);

            if (!serial.IsOpen)
            {
                serial.Open();
                connected = true;
            
                serial.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived);

                
              
            }

            return "Serial Port is Open";

        }
        public void printpre(String s)
        {
            if (serial.IsOpen)
            {
                if (s[0] != 'S')
                {
                    serial.WriteLine("TART");
                }
                else
                {
                    serial.WriteLine(s);
                }
            }
        }
        private void port_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            
            data = serial.ReadLine();
            if (data.Contains("DONE"))
            {
               
                _receivedData = true;
            }
            else
            {
                _receivedData = false;
            }

        }

        private Double mm_in(Double mm)
        {
            return 0.0393701 * mm;
        }


        public void Parsegcode()
        {

            Boolean isruning = false;
            string line = "INPUT TEXT FROM ARDUINO";
            _command.Add("H");
            Point p = new Point(-1, -1);
            _pointsList.Add(p);
            while (line != null)
            {
                if (line.Contains("M84") && (isruning) ) { break; }
                if (line[0].ToString() != ";")
                {
                    
                    if (line.Contains(";"))
                    {
                        // Delete comment
                        int l = line.IndexOf(";");
                        line = line.Substring(0, l);
                    }
                    string[] s = line.Split(' ');
                    if (s[0] == "G28")
                    {
                        // Start Adding to position list
                        isruning = true;
                        _command.Add("S");
                        p = new Point(-1, -1);
                        _pointsList.Add(p);
                    }
                    else if( (s[0] == "G00") &&(!isruning))
                    {
                        Double x = Math.Round(Double.Parse(s[1].Substring(1)), 2);
                        Double y = Math.Round(Double.Parse(s[2].Substring(1)), 2);
                        p = new Point(x, y);
                        _pointsList.Add(p);

                        isruning = true;
                        _command.Add("S");
                        p = new Point(-1, -1);
                        _pointsList.Add(p);
                        
                    }
                    else if (isruning)
                    {
                        if (s[0]== "G00")
                        {
                            Double x = Math.Round(Double.Parse(s[1].Substring(1)), 2);
                            Double y = Math.Round(Double.Parse(s[2].Substring(1)), 2);
                            p = new Point(x, y);
                            _pointsList.Add(p);

                        }

                        
                        else if (s[0] == "M107")
                        {
                            string g = gcodeFile.ReadLine();
                            string[] sl = g.Split(' ');
                            Double x = Math.Round(Double.Parse(sl[1].Substring(1)), 2);
                            Double y = Math.Round(Double.Parse(sl[2].Substring(1)), 2);
                            p = new Point(x, y);
                            _pointsList.Add(p);
                            p = new Point(-1, -1);
                            _pointsList.Add(p);
                            _command.Add("T");
                            isruning = false;
                        }

                    }

                }
                line = gcodeFile.ReadLine();

            }
            if ((_pointsList.LastOrDefault()== new Point(-1, -1)) && (Command.LastOrDefault()=="S"))
            {
                _pointsList.RemoveAt(_pointsList.Count - 1);
                Command.RemoveAt(Command.Count - 1);
            }
            _command.Add("E");
            p = new Point(-1, -1);
            _pointsList.Add(p);


            Point temppoint = _pointsList[1];
            _pointsList[1] = _pointsList[2];
            _pointsList[2] = temppoint;
        }

        public void SendPos(String x, String y)
        {
            if (serial.IsOpen)
            {
                serial.WriteLine('P'+x+ "," + y);
                Console.WriteLine('P' + x + "," + y);
            }
        }

        public void ReceiveArd()
        {
            while (true)
            {
                if (_receivedData)
                {
                    Console.WriteLine("Receive:" +data );
                    _receivedData = false;
                    break;
                }
            }

        }

        public void SendCom(String command)
        {
            if (serial.IsOpen)
            {
                serial.WriteLine('C'+command);
                Console.WriteLine("Send: C" + command);
            }
        }



        public void closeSerial()
        {
            if (serial.IsOpen)
            {
                serial.Close();
                connected = false;
            }
        }



    }
}



