import os
import sys
import time
from os.path import expanduser
 
def remove(path):
    #delete the files satisfying criteria
    if os.path.isdir(path):
        print "Directory"
    else:
        try:
            if os.path.exists(path):
                os.remove(path)
        except OSError:
            print ("Unable to remove file: %s" % path)

def cleanup(path,lifetime):
    #Delete files older than lifetime seconds from now
    time_in_secs = time.time() - lifetime
    for root, dirs, files in os.walk(path, topdown=False):
	for file_ in files:
		full_path = os.path.join(root, file_)	
		stat = os.stat(full_path)
		if stat.st_mtime <= time_in_secs:
		    remove(full_path)

if __name__ == "__main__":
    #path of the folder 
    home = expanduser("~")
    path =home + r'/ComputeEngine/darknet/Cameras'
    #define lifetime of files
    lifetime=10
    cleanup(path,lifetime)
