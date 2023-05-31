#!/var/www/lab_app/bin/python

from flask import Flask
from flask import render_template, request
import RPi.GPIO as GPIO
import time

app = Flask(__name__)

en_r = 8
mr1 = 18
mr2 = 23
ml1 = 24
ml2 = 25
en_l = 7

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(en_r, GPIO.OUT)
GPIO.setup(en_l, GPIO.OUT)
GPIO.setup(mr1, GPIO.OUT)
GPIO.setup(mr2, GPIO.OUT)
GPIO.setup(ml1, GPIO.OUT)
GPIO.setup(ml2, GPIO.OUT)
GPIO.output(en_r, True)
GPIO.output(mr1, False)
GPIO.output(mr2, False)
GPIO.output(ml1, False)
GPIO.output(ml2, False)
GPIO.output(en_l, True)
print("Done")

a=1
@app.route("/")
def index():
    return render_template('robot.html')

@app.route('/left_side')
def left_side():
    data1="LEFT"
    GPIO.output(mr1 , False)
    GPIO.output(mr2 , True)
    GPIO.output(ml1 , False)
    GPIO.output(ml2 , False)
    return 'true'

@app.route('/right_side')
def right_side():
   data1="RIGHT"
   GPIO.output(mr1 , False)
   GPIO.output(mr2 , False)
   GPIO.output(ml1 , False)
   GPIO.output(ml2 , True)
   return 'true'

@app.route('/up_side')
def up_side():
   data1="FORWARD"
   GPIO.output(mr1 , False)
   GPIO.output(mr2 , True)
   GPIO.output(ml1 , False)
   GPIO.output(ml2 , True)
   return 'true'

@app.route('/down_side')
def down_side():
   data1="BACK"
   GPIO.output(mr1 , True)
   GPIO.output(mr2 , False)
   GPIO.output(ml1 , True)
   GPIO.output(ml2 , False)
   return 'true'

@app.route('/stop')
def stop():
   data1="STOP"
   GPIO.output(mr1 , False)
   GPIO.output(mr2 , False)
   GPIO.output(ml1 , False)
   GPIO.output(ml2 , False)
   return  'true'

if __name__ == "__main__":
 print("Start")
 app.run(host='192.168.15.100',port=5010) 
