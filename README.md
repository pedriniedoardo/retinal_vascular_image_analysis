# retinal_vascular_image_analysis
macros used to perform image analysis of retina sections

# usage
Use fiji distribution of imageJ.  
Use single channel grayscale images as input (as example see 00_single_channel_images).  
The macro is intended to process all the images in one run. Therefore is recommended to place all the images in one folder, use the file name to label the experimental setup.

### run *01_mask_area_proportion.ijm*.
- use as input the single channel images.
- set as output the folder for the masks.
- set as output the folder for the quantification of the masks (csv files).

the macro perform preprocessing of the image, produce a mask of the original image and measure the area occupied by vessels (as example see in 01_mask and 01_csv).

### run *02_mask_line.ijm*.
- use as input the masks produced from the previuos step.
- set as output the folder for the lines.
- set as output the folder for the quantification of the lines (csv files).

the macro intercepts the masks with 3 vertical lines in difined positions. This allows to quantify the directionality of the vessels (as example see in 02_line_images and 02_csv_lines).
