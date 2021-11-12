import serial

arduino_port = "/dev/ttyUSB0" #serial port of Arduino
baud = 9600 #arduino MEGA runs at 9600 baud
fileName="earthquake_data2.txt" #name of the CSV file generated

ser = serial.Serial(arduino_port, baud)
print("Connected to Arduino port:" + arduino_port)
file = open(fileName, "w")
print("Created file")

samples = 300
line = 1
while line <= samples:
    data=ser.readline()
    s=data.decode('UTF-8')
    print(s)
    file.write(s)
    line = line+1

print("Data collection complete!")
file.close()
