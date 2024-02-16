import base64
import io

from flask_cors import CORS
import numpy as np
import cv2 as cv
from face_mesh_detector import FaceMeshDetector
from flask import Flask,request,jsonify,send_file


app = Flask(__name__)
detector = FaceMeshDetector()
detector.color = (255, 0, 255)

def process_image(image,type):

    if image is not None:
        if(type =='lipstick'):
            img,faces=detector.findFaceMesh(image)
            img = cv.cvtColor(img,cv.COLOR_RGB2BGR)
            coordinates = [faces[0][pt] for pt in detector.liparr if pt < len(faces[0])]
            mouthmask = detector.cropMouth(img, coordinates,color=detector.color)
            inverse_mouthmask = cv.bitwise_not(mouthmask)
            inverse_mouthmask = cv.cvtColor(inverse_mouthmask, cv.COLOR_BGR2GRAY)
            brightness_value = np.full_like(img, 100, dtype=np.uint8)
            brightened_img = cv.add(img, brightness_value)
            brightened_img = cv.cvtColor(brightened_img,cv.COLOR_RGB2GRAY)
            brightened_img = cv.cvtColor(brightened_img, cv.COLOR_RGB2BGR)
            mouth_region = cv.bitwise_and(brightened_img, mouthmask)
            blur = cv.GaussianBlur(mouth_region, (7, 7), 10)
            combined_img = cv.addWeighted(img,1,blur,0.5,2)
            return combined_img
        elif(type=='brush'):
            img, faces = detector.findFaceMesh(image)
            img = cv.cvtColor(img, cv.COLOR_RGB2BGR)
            coordinates = [faces[0][detector.lcheek_center]]
            center_cordination = [coordinates[0][0], coordinates[0][1]]
            mask = detector.crop(img, coordinates, color=detector.color)
            mask = cv.circle(mask, center_cordination, 50, detector.color, thickness=cv.FILLED)
            inverse_mouthmask = cv.bitwise_not(mask)
            inverse_mouthmask = cv.cvtColor(inverse_mouthmask, cv.COLOR_BGR2GRAY)
            brightness_value = np.full_like(img, 100, dtype=np.uint8)
            brightened_img = cv.add(img, brightness_value)
            brightened_img = cv.cvtColor(brightened_img, cv.COLOR_RGB2GRAY)
            brightened_img = cv.cvtColor(brightened_img, cv.COLOR_RGB2BGR)
            mouth_region = cv.bitwise_and(brightened_img, mask)
            blur = cv.GaussianBlur(mouth_region, (7, 7), 10)
            combined_img = cv.addWeighted(img, 1, blur, 0.5, 2)
            return combined_img
@app.route('/process_image',methods=['POST'])
def process_image_api():

    if 'image' not in request.files:
        return jsonify({'error' : 'NO image providered'}),400
    image_file = request.files['image']
    image =cv.imdecode(np.frombuffer(image_file.read(),np.uint8),cv.IMREAD_UNCHANGED)
    processed_image = process_image(image,type='lipstick')
    _, img_encoded = cv.imencode('.jpg',processed_image)
    # img_encoded = img_encoded.tobytes()
    # return send_file(
    #     io.BytesIO(img_encoded),
    #     mimetype='image/jpeg',
    #     as_attachment=True,
    #     download_name='processed_image.jpg'
    #
    # )
    img_base64 = base64.b64encode(img_encoded).decode('utf-8')

    return jsonify({'processed_image': img_base64})

if __name__ == "__main__":
    app.run(host='0.0.0.0',port = 5000,debug=False)
    CORS(app)
