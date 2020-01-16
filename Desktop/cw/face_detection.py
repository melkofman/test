#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 21:43:51 2020

@author: melanie
"""

import dlib
from skimage import io
from scipy.spatial import distance
#import cv2 as cv
from matplotlib import pyplot as plt
import matplotlib.patches as patches

import DB_images

sp = dlib.shape_predictor('shape_predictor_68_face_landmarks.dat')
#This object is a tool that takes in an image region containing some object and outputs
#a set of point locations that define the pose of the object. 

facerec = dlib.face_recognition_model_v1('dlib_face_recognition_resnet_model_v1.dat')
#This object maps human faces into 128D vectors where pictures of the same person
#are mapped near to each other and pictures of different people are mapped
#far apart. The constructor loads the face recognition
#model from a file

detector = dlib.get_frontal_face_detector()
#Returns the default face detector

img = io.imread('/Users/melanie/Desktop/ex.jpg')
#reads image

#w = dlib.image_window()

dets = detector(img, 1)

#print (dets) rectangles[[(339, 96) (468, 225)]]

cp = img.copy()
for k, d in enumerate(dets):
    print("Detection {}: Left: {} Top: {} R: {} B: {} ".format(k, d.left(), d.top(), d.right(), d.bottom()))
    #cv.rectangle(cp,(d.left(),d.top()),(d.right(),d.bottom()),(0,255,0),2)
    #cv.imshow("myImage",cp)         
    #cv.waitKey(0)
    shape = sp(img, d)


    width = d.right() - d.left()
    height = d.top() - d.bottom()
    
    rect = patches.Rectangle((d.left(), d.bottom()), width, height, fill = False)
    fig,ax = plt.subplots(1)
    ax.add_patch(rect)
    
    plt.imshow(img)
    plt.xticks([]), plt.yticks([])
    plt.show()
    
    
#     win1
#     win1.clear_overlay()
#     win1.add_overlay(d)
#     win1.add_overlay(shape)

#для дальнейшего сравнения 2х фото надо извлечь дескрипторы(набор из 128 чисел) из обеих фоток

faced = facerec.compute_face_descriptor(img, shape)
i = 0
for q in DB_images.FC:
    dist = distance.euclidean(faced, DB_images.FC[q])
    if (dist < 0.6):
        img_sec = io.imread(q)
        plt.xticks([]), plt.yticks([])
        plt.imshow(img_sec)
        
        #fig, axes = plt.subplots(1, 2)
        #axes[0].imshow(img)
        #axes[1].imshow(q)
        i = i + 1
    
if (i == 0):
    print ('No face in Data Base YOLO')


