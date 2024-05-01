---
layout: post
title: AR/VR Course Project Summary
tags: AR VR Course_Project
---
# AR/VR Course Project Summary
## Plan Overview
![jira timeline](https://github.com/sockzhi/sockzhi.github.io/blob/master/photos/2024-05-01_AR_VR/ar_mixology_assistant_2024-05-01_05.22pm.png?raw=true)
## Weekly update:
### week 4.19
* [How to install and use opencv on MacOS](https://blog.binaryzhi.com/2024/03/30/install-opencv-xcode15.html)
* Read papers [Artificial intelligence to estimate wine volume from single-view images](https://www.sciencedirect.com/science/article/pii/S240584402201845X), 
[See the Glass Half Full: Reasoning about Liquid Containers, their Volume and Content](https://arxiv.org/abs/1701.02718)
* Create project [github repo](https://github.com/mihane-ichinose/mixartest/tree/UIkit)
* Training regression CNN model  [code](https://github.com/sockzhi/vol_measure)
* UI development

### week 4.26

* Migrate CNN tensorflow model to coreml model [script](https://github.com/mihane-ichinose/mixartest/blob/UIkit/covert_h52mlmodel.py)

* Migrate YOLOv8 to IOS
  install ultralytics first 

  ```shell
  pip install ultralytics
  ```
  in python 

  ```python
  model = YOLO('yolov8n-seg.pt')
  model.export(format='coreml')
  ```
* UI improvement
![UI](https://github.com/sockzhi/sockzhi.github.io/blob/master/photos/2024-05-01_AR_VR/Screenshot%202024-05-01%20191435.png?raw=true)
![UI2](https://github.com/sockzhi/sockzhi.github.io/blob/master/photos/2024-05-01_AR_VR/Screenshot%202024-05-01%20191503.png?raw=true)
* Make poster![Poster](https://github.com/sockzhi/sockzhi.github.io/blob/master/photos/2024-05-01_AR_VR/Screenshot%202024-05-01%20183728.png?raw=true)

### week 5.1
* Demo (click photo to watch)
[![Alternate Text](https://github.com/sockzhi/sockzhi.github.io/blob/master/photos/2024-05-01_AR_VR/IMG_4334.png?raw=true)](https://github.com/sockzhi/sockzhi.github.io/raw/master/videos/IMG_4715.MOV "Link Title")