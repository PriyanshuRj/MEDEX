import keras_ocr
from matplotlib import pyplot as plt
pipeline = keras_ocr.pipeline.Pipeline()
image_path = 'images/38.jpg'
images = [
    keras_ocr.tools.read(url) for url in [
        image_path
    ]
]
prediction_groups = pipeline.recognize(images)
fig, axs = plt.subplots(nrows=len(images), figsize=(10,10))
for  image, predictions in zip(images, prediction_groups):
    keras_ocr.tools.drawAnnotations(image=image, predictions=predictions, ax=axs)
    plt.show()
    for i in predictions:
        print(i[0])




