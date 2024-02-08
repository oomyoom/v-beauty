import os
import numpy as np

os.environ["TF_CPP_MIN_LOG_LEVEL"] = '2'
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
import cv2 as cv
import mediapipe as mp
import time

class FaceMeshDetector():
    def __init__(self,staticMode=False,maxFaces=1,minDetectionCon=0.4,minTrackCon=0.4):
        self.staticMode=staticMode
        self.maxFaces=maxFaces
        self.minDetectionCon=minDetectionCon
        self.minTrackCon=minTrackCon
        self.mpDraw = mp.solutions.drawing_utils
        self.mpFaceMesh = mp.solutions.face_mesh
        self.faceMesh = self.mpFaceMesh.FaceMesh(max_num_faces=2)
        self.drawSpec = self.mpDraw.DrawingSpec(thickness=1, circle_radius=2)
        self.blue =0
        self.green = 0
        self.red = 255
        self.color = (self.blue,self.green,self.red)




    def findFaceMesh(self,img,draw=True):
        self.imgRGB = cv.cvtColor(img, cv.COLOR_BGR2RGB)
        self.img_show = cv.resize(self.imgRGB, (1920, 1080))
        self.results = self.faceMesh.process(self.imgRGB)
        self.liparr = [61, 146, 146, 91, 91, 181, 181, 84, 84, 17, 17, 314, 314, 405, 405, 321,
             321, 375, 375, 291, 61, 185, 185, 40, 40, 39, 39, 37, 37, 0, 0, 267, 267,
             269, 269, 270, 270, 409, 409, 291, 78, 95, 95, 88, 88, 178, 178, 87, 87, 14,
             14, 317, 317, 402, 402, 318, 318, 324, 324, 308, 78, 191, 191, 80, 80, 81,]

        faces = []
        if self.results.multi_face_landmarks:
            for faceLms in self.results.multi_face_landmarks:
                # self.mpDraw.draw_landmarks(self.img_show,faceLms,self.mpFaceMesh.FACEMESH_CONTOURS)
                face=[]
                for id,lm in enumerate(faceLms.landmark):
                    ih, iw, ic = self.img_show.shape
                    x, y = int(lm.x*iw), int(lm.y*ih)
                    # cv.putText(self.img_show , str(id),(x,y),cv.FONT_HERSHEY_PLAIN, 0.7, (0, 255, 0), 1)
                    face.append([x,y])
                faces.append(face)
        return self.img_show,faces
    def crop(self,img,landmarks,color,alpha=0.6):

        points = np.array(landmarks)
        mask = np.zeros_like(img)
        cv.fillPoly(mask,[points],self.color)

        return mask
    def crop_cheek(self,img,landmarks,color,alpha=0.9):

        points = np.array(landmarks)
        mask = np.zeros_like(img)
        cv.polylines(mask,[points],isClosed=True,color=color,thickness=100)
        cv.fillPoly(mask,[points],self.color)

        return mask

def main():
    image = cv.imread('pic_face_1.jpg')
    pTime = 0
    detector = FaceMeshDetector()
    cheek_left = [143, 116, 123, 147, 213, 192, 214, 212, 216, 206, 203, 129, 209, 217, 114, 128, 233, 232, 231, 230, 229, 228, 31, 226, 35, 143]
    center = 50


    if image is not None:
        img, faces = detector.findFaceMesh(image)
        img = cv.cvtColor(img, cv.COLOR_RGB2BGR)

        mouth_coordinates = [faces[0][center]]
        coordinates = [faces[0][pt] for pt in cheek_left if pt < len(faces[0])]
        center_cordination = [mouth_coordinates[0][0],mouth_coordinates[0][1]]

        mouthmask = detector.crop_cheek(img, coordinates, color=detector.color)
        mouthmask = cv.circle(mouthmask,center_cordination,50,detector.color,thickness=cv.FILLED)
        inverse_mouthmask = cv.bitwise_not(mouthmask)
        inverse_mouthmask = cv.cvtColor(inverse_mouthmask, cv.COLOR_BGR2GRAY)
        brightness_value = np.full_like(img, 100, dtype=np.uint8)
        brightened_img = cv.add(img, brightness_value)
        brightened_img = cv.cvtColor(brightened_img, cv.COLOR_RGB2GRAY)
        brightened_img = cv.cvtColor(brightened_img, cv.COLOR_RGB2BGR)
        mouth_region = cv.bitwise_and(brightened_img, mouthmask)
        blur = cv.GaussianBlur(mouth_region, (7, 7), 10)
        combined_img = cv.addWeighted(img, 1, blur, 0.9, 3)



        image = cv.cvtColor(img,cv.COLOR_RGB2BGR)


        cv.imshow('mouth_region',mouth_region)
        cv.imshow('combined_img', combined_img)
        cv.waitKey(0)


if __name__ == "__main__":
    main()
