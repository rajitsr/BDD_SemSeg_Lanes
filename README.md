# BDD_SemSeg_Lanes

Here we provide the download and pre-processing instructions for the BDD_SemSeg_Lanes dataset, that is released through our paper: BDD_SemSeg_Lanes - A Manifold Driving Dataset for Lane Detection and Classification for Autonomous Vehicles. It uses BDD100K dataset as a baseline. We have also provided the codes for conversion. 

[click here](**##Main Features**)
-76000 annotated images
-10 lane classes e.g., Parallel_dashed_double, Parallel_dashed_single

Download the dataset in a folder "dataset" and arrange the data in the following structure: Do NOT combine the training and validation dataset. (labels and the images are to be put in separate folders)
├── dataset
│   ├── images
│   │   ├── train
│   │   ├── val
│   │   ├── test
│   ├── labels
│   │   ├── train
│   │   ├── val
