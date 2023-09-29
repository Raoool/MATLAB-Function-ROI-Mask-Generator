MATLAB Function: ROI Mask Generator
Author: Rahul Shah

Description
This MATLAB function, ROI_Mask, is designed to create a Region of Interest (ROI) mask based on mapping coordinates. 
It takes the four corner mapping coordinates of a region and generates a binary mask that can be applied to an image. 
This function is particularly useful when working with geospatial data and extracting specific regions of interest from images.

Usage
To use this function, you need to provide the following inputs:

Upper_Left_Latitude: Latitude of the upper-left corner of the region.
Upper_Right_Latitude: Latitude of the upper-right corner of the region.
Lower_Right_Latitude: Latitude of the lower-right corner of the region.
Lower_Left_Latitude: Latitude of the lower-left corner of the region.
Upper_Right_Longitude: Longitude of the upper-right corner of the region.
Lower_Right_Longitude: Longitude of the lower-right corner of the region.
Lower_Left_Longitude: Longitude of the lower-left corner of the region.
Upper_Left_Longitude: Longitude of the upper-left corner of the region.
R: Mapping Reference from the image.
Image_DN: The image to which the ROI mask will be applied. It is used to determine the size of the output mask.
The function calculates the ROI mask based on the input coordinates and returns it as a binary image.

Example
Here's an example of how to use this function:

%Assigning Mapping coordinate CREATING ROI

%P45R40 : Crater Lake Target: Water
Upper_Left_Latitude =  572359.8193; Upper_Left_Longitude = 4755507.2900;
Upper_Right_Latitude = 573982.0679; Upper_Right_Longitude = 4755507.2900;
Lower_Right_Latitude = 573982.0679; Lower_Right_Longitude = 4754423.3057;
Lower_Left_Latitude = 572359.8193; Lower_Left_Longitude = 4754423.3057;

[Image_DN,R] = geotiffread(Your_image_name); 
ROI = ROI_Mask(Upper_Left_Latitude, Upper_Right_Latitude, Lower_Right_Latitude, Lower_Left_Latitude,...
                Upper_Right_Longitude, Lower_Right_Longitude, Lower_Left_Longitude, Upper_Left_Longitude,R,Image_DN);

disp('ROI Created');
