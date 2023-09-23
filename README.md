# BDD_SemSeg_Lanes

Here we provide the download and pre-processing instructions for the BDD_SemSeg_Lanes dataset, that is released through our paper: BDD_SemSeg_Lanes - A Manifold Driving Dataset for Lane Detection and Classification for Autonomous Vehicles. It uses BDD100K dataset as a baseline. We have also provided the codes for conversion. 

## Main Features
-76000 annotated images
-10 lane classes e.g., Parallel_dashed_double, Parallel_dashed_single

## Attribution
BDD_SemSeg_Lanes is built upon [BDD100K](https://arxiv.org/abs/1805.04687) Dataset

If you use BDD_SemSeg_Lanes dataset, please cite it using the following:

    @ARTICLE {BDD_SemSeg_Lanes,
    author = {Rajalakshmi TS, R Senthilnathan},
    journal = {Journal of Advanced Transportation},
    title = {BDD_SemSeg_Lanes - A Manifold Driving Dataset for Lane Detection and Classification for Autonomous Vehicles},
    year = {},
    volume = {},
    number = {},
    issn = {},
    pages = {},
    keywords = {autonomous driving; lane classification; real-time segmentation; deep learning},
    doi = {},
    publisher = {Hindawi},
    address = {},
    month = {}
    }

## Download
you can download the Train-Val-set videos and annotations from our [Google Drive Folder](https://drive.google.com/drive/folders/1f-FgSjEyKFtVl6bh4zCESebYNLGUGXJ8?usp=sharing)

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

![Sample annotation](/assets/images/annotation_sample.png)

    
