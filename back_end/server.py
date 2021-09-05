from flask import Flask, jsonify, request
import numpy
import cv2
import base64
import logging
from fun_code import main as infer_medicine
from fun_tensor import tensor_main as infer_tensor
from fun_code import read_img
import werkzeug


# path = "images/38.jpg"
# authentic, med_name, med_description = infer_medicine(path)

# if med_name ==None:
#     med_description, authentic, med_name  = infer_tensor(path)
# print(authentic, med_name, med_description)

log = logging.getLogger(__name__)

logging.basicConfig(level=logging.DEBUG)

app = Flask(__name__)



@app.route("/", methods=["POST"])
def predict_medicine():
    """
    Return prediction about medicine in image.

    Request Format:
    Multipart Form Request with image to run inference sent with key "image"

    Response Format:
    JSON Response
    {
        "authentic" : <bool>,
        "name" : <medicine name text>
        "description" : <text description about the medicine>
    }
    """

    # read image file string data
    # filestr = request.files["medicine_image"].read()
    # filestr = request.files['image']
    imagefile = request.files['image']
    filename = werkzeug.utils.secure_filename(imagefile.filename)
    print("\nReceived image File name : " + imagefile.filename)
    imagefile.save(filename)

    # convert image string data to numpy array
    # npimg = numpy.fromstring(filestr, numpy.uint8)

    # convert numpy array to image
    # img = cv2.imdecode(npimg, cv2.IMREAD_UNCHANGED)

    # Run inference tasks here
    authentic, med_name, med_description = infer_medicine(path)
    if med_name == None:
        med_description, authentic, med_name = infer_tensor(path)
    print(authentic, med_name, med_description)
    return jsonify(
        {
            "authentic": authentic,
            "name": med_name,
            "description": med_description,
        }
    )

app.run(host="192.168.2.12", port=5000)