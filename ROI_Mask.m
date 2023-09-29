%% Function to Create ROI using Mapping Coordinates:
%  Author: Rahul Shah

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inupt: Four Corner Moapping Co-ordinate
% R = Mapping Reference from Image
% Image_DN = Image that you read using GeoTiFF Function, its used to have
% size of image for creating a ROI mask of Image size

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ROI = ROI_Mask(Upper_Left_Latitude, Upper_Right_Latitude, Lower_Right_Latitude, Lower_Left_Latitude,...
    Upper_Right_Longitude, Lower_Right_Longitude, Lower_Left_Longitude, Upper_Left_Longitude,R,Image_DN)

            ROI_X = [Upper_Left_Latitude, Upper_Right_Latitude, Lower_Right_Latitude, Lower_Left_Latitude, Upper_Left_Latitude];
            ROI_Y = [Upper_Left_Longitude, Upper_Right_Longitude, Lower_Right_Longitude, Lower_Left_Longitude, Upper_Left_Longitude];
            
            [xIntrinsic,yIntrinsic] = worldToIntrinsic(R,ROI_X,ROI_Y); %converting mapping coordinate to pixel coordinate
            xIntrinsic = round(xIntrinsic);
            yIntrinsic = round(yIntrinsic);
            [img_row,img_col] = size(Image_DN);
            ROI = poly2mask(xIntrinsic, yIntrinsic, img_row, img_col);%converting ROI polygon to region mask
            clear Upper_Left_Lattitude Upper_Left_Longitude Upper_Right_Lattitude Upper_Right_Longitude Lower_Right_Lattitude Lower_Right_Longitude Lower_Left_Lattitude Lower_Left_Longitude
            clear ROI_X ROI_Y xIntrinsic yIntrinsic img_row img_col
            
end
