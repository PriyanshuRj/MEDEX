import keras_ocr
import pandas as pd

dataset = pd.read_csv("Database.csv")
dataset_front = pd.read_csv("Database_front.csv")
code = dataset.iloc[:, 1]
name = dataset.iloc[:, 0]


def tensor_main(image_path):
    pipeline = keras_ocr.pipeline.Pipeline()
    images = [keras_ocr.tools.read(path) for path in [image_path]]
    prediction_groups = pipeline.recognize(images)
    for image, predictions in zip(images, prediction_groups):
        keras_ocr.tools.drawAnnotations(image=image, predictions=predictions)
        text_array = []

        for i in predictions:
            if(len(i[0])>=1) :
                text_array.append(i[0])
        med_name, rf, use = search_dataBase(text_array)
        return med_name, rf, use


def search_dataBase(array):
    for j in range(len(name)):
        name_array = name[j].split()
        if(len(name_array) == 1):
            for i in range(len(array)):
                if array[i] == name[j]:
                    return dataset_front.iloc[j, 2], "Real Medicine", dataset_front.iloc[j, 0]
        else :
            for i in range(len(array)):
                if array[i] == name_array[0] :
                    if i < len(array)-1 and array[i + 1] == name_array[1]:
                        return dataset_front.iloc[j, 2], "Real Medicine", dataset_front.iloc[j, 0]

                    elif i >0 and  array[i-1] == name_array[1]:
                        return dataset_front.iloc[j, 2], "Real Medicine", dataset_front.iloc[j, 0]
    return None, "Fake Medicine", None





image_path = 'images/37.jpg'
medicine_name, rf, use = tensor_main(image_path)
print(medicine_name, rf, use)