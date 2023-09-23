clear all;
close all;
load possible_classes.mat
load possible_vals.mat
load tsrtrain.mat
load rgbforlanes.mat
strell = strel(ones(5,5));
%%

 
%% Read images:
%same color touching b1c81faa-3df17267.png'
%i=3393, i=4836, i=8840, 10776, 12986, 17680, 19739, 23935, 24820
% different colors joining case b1d0a191-06deb55d.png
% i=10941, i=13151, i=14945, i=16453, i=23803, i=41459, i=42432,
% i=43693, i=44854, i=49096, 
%img = imread('b1d0a191-06deb55d.png');
%To Check 'b5479087-2e92b8f5.jpg'
hh=[10941,13151,14945,16453,23803,41459,42432,43693,44854,49096] ;
num_of_fill = 0;
sizz = size(tsrtraincsv);
for i=120228:sizz(1)
    files = dir(fullfile('*.png'));%change the file format if it is not bmp
    xx=struct2cell(files);
    xx=cell2mat(xx(1,:));
    dummy_img = uint8(zeros(720,1280,3)); 
    %i=hh(hhi);
    next_iter = false;
    region_found = false;       
   
   file_name_alone = char(table2array(tsrtraincsv (i,4)));
   
   if not(contains(xx,strcat(file_name_alone(1:18),'png'))) 
       %disp('Image Not Available')
       continue
       
   end
   disp('Image Number is')
   disp(i)
   %file_name = strcat('images_for_fill\val\',file_name_alone(1:18),'png');
   %file_name = 'val_raw\good_ones_02-12-2022\b1c81faa-3df17267.png'
   img = imread(strcat(file_name_alone(1:18),'png'));
   bw = imbinarize(rgb2gray(img));
   %imtool(bw)
   %imtool(img)   
   %imshow(img)
   %hold on
   raw_row = floor(double(table2array(tsrtraincsv (i,3))));
   raw_col = floor(double(table2array(tsrtraincsv (i,2))));
   if raw_row==0
       raw_row=1;
   end
   if raw_col==0
       raw_col=1;
   end
   if raw_col==1281
       raw_col=1280;
   end
   if raw_row==721
       raw_row=720;
   end
  
   index = sub2ind(size(bw),raw_row,raw_col);
   [Iadj , Radj, Nfound ] = neighbourND(index, size(bw));
   [rows,cols] = ind2sub(size(bw),Iadj');
   rows = [raw_row;rows];
   cols = [raw_col;cols];
   ceil_floor_row_col = [rows,cols];
   %ceil_floor_row_col = [ceil(raw_row),ceil(raw_col);floor(raw_row),floor(raw_col);ceil(raw_row),floor(raw_col);floor(raw_row),ceil(raw_col)];
   %imshow(img)
   %hold on
   for j = 1:length(ceil_floor_row_col)
       region_select = bwselect(bw,ceil_floor_row_col(j,2),ceil_floor_row_col(j,1));
       
       
       %plot(ceil_floor_row_col(j,2),ceil_floor_row_col(j,1), 'r*')
       %plot(a(3,1),a(3,2),'r*')
       if isempty(find(region_select)) 
           disp('broken')
           continue
       else 
           
           disp('taken')
           %disp(j)
           region_found = true;
           break
       end
   end
   if not(region_found)
           raw_row = ceil(double(table2array(tsrtraincsv (i,3))));
           raw_col = ceil(double(table2array(tsrtraincsv (i,2))));
           if raw_row==0
               raw_row=1;
           end
           if raw_col==0
               raw_col=1;
           end
          if raw_col==1281
               raw_col=1280;
           end
           if raw_row==721
               raw_row=720;
           end
           index = sub2ind(size(bw),raw_row,raw_col);
           [Iadj , Radj, Nfound ] = neighbourND(index, size(bw));
           [rows,cols] = ind2sub(size(bw),Iadj');
           rows = [raw_row;rows];
           cols = [raw_col;cols];
           ceil_floor_row_col = [rows,cols];
           %ceil_floor_row_col = [ceil(raw_row),ceil(raw_col);floor(raw_row),floor(raw_col);ceil(raw_row),floor(raw_col);floor(raw_row),ceil(raw_col)];
           %imshow(img)
           %hold on
           for j = 1:length(ceil_floor_row_col)
               region_select = bwselect(bw,ceil_floor_row_col(j,2),ceil_floor_row_col(j,1));
               
               
               plot(ceil_floor_row_col(j,2),ceil_floor_row_col(j,1), 'r*')
               %plot(a(3,1),a(3,2),'r*')
               if isempty(find(region_select)) 
                   disp('broken')
                   continue
               else 
                   
                   %disp('taken')
                   disp(j)
                   region_found = true;
                   break
               end
           end
   end


   %imtool(region_select)
   class_name = char(table2array(tsrtraincsv (i,1)));
   class_ind = find(possible_classes==class_name);
   select_mask = logical(dummy_img);
   for k = 1:3
        select_mask(:,:,k) = region_select;
   end
   select_mask = img.*uint8(select_mask);
   %imtool(select_mask)
       
   
   if (length(unique(select_mask(:,:,1)))>2) && (length(unique(select_mask(:,:,2)))>2) && (length(unique(select_mask(:,:,3)))>2)
        select_mask_gray = rgb2gray(select_mask);
        
        uniq_gray = unique(select_mask_gray);
        if any(uniq_gray==85) && any(uniq_gray==172)
           select_mask_gray(select_mask_gray==172)=85;
        end
        uniq_gray = unique(select_mask_gray);
        %imtool(select_mask_gray)
        for kk = 2:length(uniq_gray)
            
            class_name = strtrim(char(table2array(tsrtraincsv (i,1))));
            [gr,gc]=find(table2array(rgbforlanes)==class_name);
            sub_region_select = select_mask_gray==uniq_gray(kk);
             
          if possible_vals(4,gr) == unique(select_mask_gray(sub_region_select))                              
            %imtool(sub_region_select)
            cc = bwconncomp(sub_region_select,8);
            lab_mat = labelmatrix(cc);
            regprops = regionprops(lab_mat,'EulerNumber');
            num_of_fill = num_of_fill+1;
            euler_num = cat(1,regprops.EulerNumber);
            if length(euler_num)~=1 
                movefile(strcat(file_name_alone(1:18),'png'),strcat('bad_ones\',strcat(file_name_alone(1:18),'png')))
                
                next_iter = true;
                break
            end
           if regprops.EulerNumber<=0
               sub_region_select = imdilate(sub_region_select,strell);
               sub_region_select = imfill(sub_region_select,'holes');
           else
               sub_region_select = imdilate(sub_region_select,strell);
               sub_region_select = imdilate(sub_region_select,strell);
           end
           %imtool(sub_region_select)
          
           [r,c] = find(sub_region_select);
           
                      if  strcmp(class_name,strtrim(char(table2array(rgbforlanes(gr,1))))) 
                           disp(class_name)
                           
                           for l =1:length(r)
                           dummy_img(r(l),c(l),:)=reshape(uint8(table2array(rgbforlanes(gr,4:6))),[1,1,3]);
                           end
                           res_files = dir(fullfile('results','*.png'));%change the file format if it is not bmp
                           yy=struct2cell(res_files);
                           yy=cell2mat(yy(1,:));
                           
                           if isempty(yy) 
                       %imtool(dummy_img)
                               imwrite(dummy_img,strcat('results/result_',strcat(file_name_alone(1:18),'png')));
                           elseif not(contains(yy,strcat('result_',strcat(file_name_alone(1:18),'png')))) 
                                imwrite(dummy_img,strcat('results/result_',strcat(file_name_alone(1:18),'png')));
                                        
                           else 
                            
                               existing_img = imread(strcat('results/result_',strcat(file_name_alone(1:18),'png')));
                                for l =1:length(r)
                                    existing_img(r(l),c(l),:) = 0;
                                end
                               dummy_img = dummy_img+existing_img;
                               %imtool(dummy_img)
                               imwrite(dummy_img,strcat('results/result_',strcat(file_name_alone(1:18),'png')));
        
                           end
                           
                           
                       end
                   
                   
          end
        end 
        next_iter = true;
   end

   if next_iter
        continue
   end

   cc = bwconncomp(region_select,8);
   lab_mat = labelmatrix(cc);
   regprops = regionprops(lab_mat,'EulerNumber');
   num_of_fill = num_of_fill+1;
   euler_num = cat(1,regprops.EulerNumber);
   if length(euler_num)~=1
       movefile(strcat(file_name_alone(1:18),'png'),strcat('bad_ones\',strcat(file_name_alone(1:18),'png')))
       
       continue
   end
   if regprops.EulerNumber<=0
       region_select = imdilate(region_select,strell);
       region_select = imdilate(region_select,strell);
       region_select = imfill(region_select,'holes');
    else
       region_select = imdilate(region_select,strell);
       region_select = imdilate(region_select,strell);
   end
  %imtool(region_select)
          
   [r,c] = find(region_select);
   class_name = strtrim(char(table2array(tsrtraincsv (i,1))));
   [gr,gc]=find(table2array(rgbforlanes)==class_name);
          
               if  strcmp(class_name,strtrim(char(table2array(rgbforlanes(gr,1))))) 
                   disp(class_name)
                   disp(k)
                   for l =1:length(r)
                   dummy_img(r(l),c(l),:)=reshape(uint8(table2array(rgbforlanes(gr,4:6))),[1,1,3]);
                   end
                   res_files = dir(fullfile('results','*.png'));%change the file format if it is not bmp
                   yy=struct2cell(res_files);
                   yy=cell2mat(yy(1,:));
                  
                   if isempty(yy) 
                       %imtool(dummy_img)
                       imwrite(dummy_img,strcat('results/result_',strcat(file_name_alone(1:18),'png')));
                   elseif not(contains(yy,strcat('result_',strcat(file_name_alone(1:18),'png')))) 
                        imwrite(dummy_img,strcat('results/result_',strcat(file_name_alone(1:18),'png')));
                   else 
                    
                       existing_img = imread(strcat('results/result_',strcat(file_name_alone(1:18),'png')));
                       %imtool(existing_img)
                       for l =1:length(r)
                            existing_img(r(l),c(l),:) = 0;
                       end
                       dummy_img = dummy_img+existing_img;
                       %imtool(dummy_img)
                       imwrite(dummy_img,strcat('results/result_',strcat(file_name_alone(1:18),'png')));

                   end
                   
               end
           
           
end     
 


