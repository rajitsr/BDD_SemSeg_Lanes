# SemSeg_Lanes

Here we provide the download and pre-processing instructions for the SemSeg_Lanes dataset, which is released through our paper: SemSeg_Lanes - A Manifold Driving Dataset for Lane Detection and Classification for Autonomous Vehicles. It uses the BDD100K dataset as a baseline. We have also provided the codes for conversion. 

## Main Features
-76000 annotated images
-11 lane classes e.g., Parallel_dashed_double, Parallel_dashed_single

## Attribution
BDD_SemSeg_Lanes is built upon [BDD100K](https://arxiv.org/abs/1805.04687) Dataset

If you use the SemSeg_Lanes dataset, please cite it using the following:

    @ARTICLE {BDD_SemSeg_Lanes,
    author = {Rajalakshmi TS, R Senthilnathan},
    journal = {},
    title = {SemSeg_Lanes - A Manifold Driving Dataset for Lane Detection and Classification for Autonomous Vehicles},
    year = {},
    volume = {},
    number = {},
    ISSN = {},
    pages = {},
    keywords = {autonomous driving; lane classification; real-time segmentation; deep learning},
    doi = {},
    publisher = {},
    address = {},
    month = {}
    }

## Download
Upon request, the dataset will be made available. 
You can download the Train-Val-set videos and annotations from our [Google Drive Folder](https://drive.google.com/drive/folders/1f-FgSjEyKFtVl6bh4zCESebYNLGUGXJ8?usp=sharing)

The directory should look like this

Download the dataset in a folder "dataset" and arrange the data in the following structure: Do NOT combine the training and validation dataset. (labels and the images are to be put in separate folders)

    ├── dataset
    │   ├── images
    │   │   ├── train
    │   │   ├── val
    │   │   ├── test
    │   ├── labels
    │   │   ├── train
    │   │   ├── val
    │   │   ├── test}

## Sample annotations
![image](https://github.com/rajitsr/BDD_SemSeg_Lanes/assets/67737942/10c1bb5e-9c92-46b0-a37e-1226ec2378fb)

[![Sample annotation](annotation_sample.png)](https://drive.google.com/file/d/1GKPcgUVFgBdHzjd-GU3hpLp7DnR_xXlD/view?usp=sharing)

## Evaluation

Using the Paddleseg framework, the proposed architecture was trained using our dataset and the following was the inference obtained
[![inference_result](inference_result.png)](https://drive.google.com/file/d/17WX0eiKi1nLrB3-khpHwwt3SFDOnNPou/view?usp=sharing)
    
