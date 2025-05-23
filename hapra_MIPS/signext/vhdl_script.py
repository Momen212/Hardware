# Python Script zum ausfuehren mehrerer Dateien
# Beispiel: python vhdl_script.py test_file.vhdl adder.vhdl adder_tb.vhdl

import subprocess
from subprocess import Popen
import os
import sys
 
def runVHDL(files, pathDir):
    for file in files:                                                                          #Ueberpruefung der einzelen Dateien
        isInPath = False                                                                        #Prueft ob Datei im Verzeichnis ist
        for name in pathDir:
            if name == file:
                isInPath = True
                
        if isInPath == True:
            print("\nRunning " + file+"\n")
            try:                                                                                    #Syntax-Check 
                output = subprocess.check_output(["ghdl", "-s", file], stderr=subprocess.STDOUT)
                print(["Syntax-Check OK\n","Syntax-Check Warnings\n\n"+str(output)[2:-1]+"\n"][str(output)[2:-1] != ""])
            except subprocess.CalledProcessError as e:
                print ("Syntax-check not OK \n")
                print(e.output)
                return 1
            try:                                                                                    #Analysis
                output = subprocess.check_output(["ghdl", "-a", file], stderr=subprocess.STDOUT)
                print(["Analysis OK\n","Analysis Warnings\n\n"+str(output)[2:-1]+"\n"][str(output)[2:-1] != ""])
            except subprocess.CalledProcessError as e:
                print ("Analysis not OK\n")
                print(e.output)
                return 1
            try:                                                                                    #Build
                file = file[:-5]
                output = subprocess.check_output(["ghdl", "-e", file], stderr=subprocess.STDOUT)
                print(["Build OK\n","Build Warnings\n\n"+str(output)[2:-1]+"\n"][str(output)[2:-1] != ""])
            except subprocess.CalledProcessError as e:
                print ("Build failed\n")
                print(e.output)
                return 1
            try:                                                                                    #VCD-Dump in testbench.vcd
                output = subprocess.check_output(["ghdl", "-r", file, "--vcd=testbench.vcd"], stderr=subprocess.STDOUT)    #aeltere testbench.vcd werden ueberschrieben
                print(["VCD-Dump OK\n","VCD-Dump Warnings\n\n"+str(output)[2:-1]+"\n"][str(output)[2:-1] != ""])
            except subprocess.CalledProcessError as e:
                print ("VCD-Dump failed \n")
                print(e.output)
                return 1
        elif isInPath == False:
            print (file + " could not be found \n")
            return 1
    return 0

def main():
    if(len(sys.argv) > 1):
        cmd = sys.argv[1:] # Falls der Command in der Textabgabe angegeben ist
    else:
        cmd = [] # Hier die Bausteine in der richtigen Reihenfolge als Liste von Strings eingeben, z.B. ["andgate.vhdl","andgate_tb.vhdl"]
    if len(cmd) == 0:
        print("Command is empty")
        return  
    pathDir = os.listdir('./')
    success = runVHDL(cmd,pathDir)
    if not success:
        try:
            print("Starting GTKWave\n")
            process=Popen("gtkwave testbench.vcd", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)            #oeffnet GTKWave fuer die Datei mit der Endung _tb (letzte Datei die uebergeben wurde)
            process.wait()
        except subprocess.CalledProcessError:                                                                               
            print("Starting GTKWave failed")
    else:
        print("See error messages above")


if __name__ == "__main__":
    main()

