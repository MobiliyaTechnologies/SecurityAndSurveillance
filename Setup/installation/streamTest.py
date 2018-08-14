import cv2

addIPofCameraHere = "ip_address"

url ="rtsp://"+addIPofCameraHere+"/onvif1"
streamingUrl = "uridecodebin uri=" + url + " ! videoconvert ! videoscale ! appsink"

camera = cv2.VideoCapture(streamingUrl)
if camera.isOpened():
    print "Camera Streaming working Fine!"
    camera.release()
