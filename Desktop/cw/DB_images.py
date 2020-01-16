#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 21:44:34 2020

@author: melanie
"""

from skimage import io
import dlib

sp = dlib.shape_predictor('shape_predictor_68_face_landmarks.dat')
facerec = dlib.face_recognition_model_v1('dlib_face_recognition_resnet_model_v1.dat')
detector = dlib.get_frontal_face_detector()

#IMG = tuple()

# def im_read(im, path):
#     im = io.imread(path)
    
path1 = '/Users/melanie/Desktop/s.jpg'
path2 = '/Users/melanie/Desktop/ex.jpg'
path3 = '/Users/melanie/Desktop/t1.jpg'

img1 = io.imread('/Users/melanie/Desktop/s.jpg')
img2 = io.imread('/Users/melanie/Desktop/ex.jpg')
img3 = io.imread('/Users/melanie/Desktop/t1.jpg')

IMG = [img1, img2, img3]
#DETS = []

#проходить по IMG и сразу dets 

# for i in IMG:
#     c = -1
#     DETS[c+1] = detector(i, 1)    out of range ????


dets1 = detector(img1, 1)
dets2 = detector(img2, 1)
dets3 = detector(img3, 1)

DETS = [dets1, dets2, dets3]

for k, d in enumerate(dets1):
    print("Detection {}: Left: {} Top: {} R: {} B: {} ".format(k, d.left(), d.top(), d.right(), d.bottom()))
    shape1 = sp(img1, d)



for k, d in enumerate(dets2):
    print("Detection {}: Left: {} Top: {} R: {} B: {} ".format(k, d.left(), d.top(), d.right(), d.bottom()))
    shape2 = sp(img2, d)
    
for k, d in enumerate(dets3):
    print("Detection {}: Left: {} Top: {} R: {} B: {} ".format(k, d.left(), d.top(), d.right(), d.bottom()))
    shape3 = sp(img3, d)

    

faced_img1 = facerec.compute_face_descriptor(img1, shape1)
faced_img2 = facerec.compute_face_descriptor(img2, shape2)
faced_img3 = facerec.compute_face_descriptor(img3, shape3)


FC = {path1:faced_img1, path2:faced_img2, path3:faced_img3}

#FC = {faced_img1, faced_img2, faced_img3}




