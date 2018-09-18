%%IMORT IMAGES
bmp=imread('mountains-bmp.bmp');
gif=imread('mountains-gif.gif');
jpg=imread('mountains-jpg.jpg');
png=imread('mountains-png.png'); 
tiff=imread('mountains-tiff.tiff');

%%TRANSFORM TO GRAY PICTURES
bmp_gray=rgb2gray(bmp);
jpg_gray=rgb2gray(jpg);
png_gray=rgb2gray(png);
tiff_gray=rgb2gray(tiff);

%%HISTOGRAMS
subplot(3,2,1)
bar(imhist(bmp_gray))
title('BMP')
subplot(3,2,2)
bar(imhist(gif))
title('GIF')
subplot(3,2,3)
bar(imhist(jpg_gray))
title('JPG')
subplot(3,2,4)
bar(imhist(png_gray))
title('PNG')
subplot(3,2,5)
bar(imhist(tiff_gray))
title('tiff')

%%HISTOGRAM EQUALIZATION
%%COUNT NO. OF PIXELS of BMP FILE
E=zeros(5,256); 
for i=1:537
   for j=1:960
    for c=0:255   
        if c==bmp_gray(i,j)
            n_bmp=E(1,c+1);
            n_bmp=n_bmp+1;
            E(1,c+1)=n_bmp;
            break;
        end 
    end    
   end
end

%%CUMULATIVE DISTRIBUTION FUNCTION (CDF) of BMP FILE
cdf_bmp=zeros(1,256);
b=0;
   for j=1:256
       cdf_bmp(1,j)=E(1,j);
       cdf_bmp(1,j)=cdf_bmp(1,j)+b; 
       b=cdf_bmp(1,j);
   end

%%EQUALIZED
EQ_bmp=zeros(1,256);
s=537*970;
min_bmp=min(cdf_bmp);
for j=1:256
   EQ_bmp(1,j)=floor(((cdf_bmp(1,j)-min_bmp)/(s-min_bmp))*255);
end

%%TRANSFORM TO MARTRIX PICTURE of BMP FILE
new_bmp=zeros(537,960);
for i=1:537
   for j=1:960
      P_bmp=bmp_gray(i,j);
      new_bmp(i,j)=EQ_bmp(1,P_bmp+1);
   end
end

%%COUNT NO. OF PIXELS of GIF FILE
for i=1:537
   for j=1:960
    for c=0:255   
        if c==gif(i,j)
            n_gif=E(2,c+1);
            n_gif=n_gif+1;
            E(2,c+1)=n_gif;
            break;
        end 
    end    
   end
end

%%CUMULATIVE DISTRIBUTION FUNCTION (CDF) of GIF FILE
cdf_gif=zeros(1,256);
b=0;
   for j=1:256
       cdf_gif(1,j)=E(2,j);
       cdf_gif(1,j)=cdf_gif(1,j)+b; 
       b=cdf_gif(1,j);
   end

%%EQUALIZED
EQ_gif=zeros(1,256);
min_gif=min(cdf_gif);
for j=1:256
   EQ_gif(1,j)=floor(((cdf_gif(1,j)-min_gif)/(s-min_gif))*255);
end

%%TRANSFORM TO MARTRIX PICTURE of GIF FILE
new_gif=zeros(537,960);
for i=1:537
   for j=1:960
      P_gif=gif(i,j);
      new_gif(i,j)=EQ_gif(1,P_gif+1);
   end
end

%%COUNT NO. OF PIXELS of JPG FILE 
for i=1:537
   for j=1:960
    for c=0:255   
        if c==jpg_gray(i,j)
            n_jpg=E(3,c+1);
            n_jpg=n_jpg+1;
            E(3,c+1)=n_jpg;
            break;
        end 
    end    
   end
end

%%CUMULATIVE DISTRIBUTION FUNCTION (CDF) of JPG FILE
cdf_jpg=zeros(1,256);
b=0;
   for j=1:256
       cdf_jpg(1,j)=E(3,j);
       cdf_jpg(1,j)=cdf_jpg(1,j)+b; 
       b=cdf_jpg(1,j);
   end

%%EQUALIZED
EQ_jpg=zeros(1,256);
min_jpg=min(cdf_jpg);
for j=1:256
   EQ_jpg(1,j)=floor(((cdf_jpg(1,j)-min_jpg)/(s-min_jpg))*255);
end

%%TRANSFORM TO MARTRIX PICTURE of JPG FILE
new_jpg=zeros(537,960);
for i=1:537
   for j=1:960
      P_jpg=jpg_gray(i,j);
      new_jpg(i,j)=EQ_jpg(1,P_jpg+1);
   end
end


%%COUNT NO. OF PIXELS of PNG FILE 
for i=1:537
   for j=1:960
    for c=0:255   
        if c==png_gray(i,j)
            n_png=E(4,c+1);
            n_png=n_png+1;
            E(4,c+1)=n_png;
            break;
        end 
    end    
   end
end

%%CUMULATIVE DISTRIBUTION FUNCTION (CDF) of PNG FILE
cdf_png=zeros(1,256);
b=0;
   for j=1:256
       cdf_png(1,j)=E(4,j);
       cdf_png(1,j)=cdf_png(1,j)+b; 
       b=cdf_png(1,j);
   end

%%EQUALIZED
EQ_png=zeros(1,256);
min_png=min(cdf_png);
for j=1:256
   EQ_png(1,j)=floor(((cdf_png(1,j)-min_png)/(s-min_png))*255);
end

%%TRANSFORM TO MARTRIX PICTURE of PNG FILE
new_png=zeros(537,960);
for i=1:537
   for j=1:960
      P_png=png_gray(i,j);
      new_png(i,j)=EQ_png(1,P_png+1);
   end
end


%%COUNT NO. OF PIXELS of TIFF FILE 
for i=1:537
   for j=1:960
    for c=0:255   
        if c==tiff_gray(i,j)
            n_tiff=E(5,c+1);
            n_tiff=n_tiff+1;
            E(5,c+1)=n_tiff;
            break;
        end 
    end    
   end
end

%%CUMULATIVE DISTRIBUTION FUNCTION (CDF) of TIFF FILE
cdf_tiff=zeros(1,256);
b=0;
   for j=1:256
       cdf_tiff(1,j)=E(5,j);
       cdf_tiff(1,j)=cdf_tiff(1,j)+b; 
       b=cdf_tiff(1,j);
   end

%%EQUALIZED
EQ_tiff=zeros(1,256);
min_tiff=min(cdf_tiff);
for j=1:256
   EQ_tiff(1,j)=floor(((cdf_tiff(1,j)-min_tiff)/(s-min_tiff))*255);
end

%%TRANSFORM TO MARTRIX PICTURE of TIFF FILE
new_tiff=zeros(537,960);
for i=1:537
   for j=1:960
      P_tiff=tiff_gray(i,j);
      new_tiff(i,j)=EQ_tiff(1,P_tiff+1);
   end
end
figure
%%CUMULATIVE BAR
subplot(3,2,1)
bar(cdf_bmp)
title('BMP')
subplot(3,2,2)
bar(cdf_gif)
title('GIF')
subplot(3,2,3)
bar(cdf_jpg)
title('JPG')
subplot(3,2,4)
bar(cdf_png)
title('PNG')
subplot(3,2,5)
bar(cdf_tiff)
title('tiff')

figure
%%ORIGINAL GRAY PICTURE
subplot(3,2,1)
imshow(bmp_gray)
title('BMP')
subplot(3,2,2)
imshow(gif)
title('GIF')
subplot(3,2,3)
imshow(jpg_gray)
title('JPG')
subplot(3,2,4)
imshow(png_gray)
title('PNG')
subplot(3,2,5)
imshow(tiff_gray)
title('tiff')

bmp_new=uint8(new_bmp); %%FROM DOUBLE TO UINT8
gif_new=uint8(new_gif); 
jpg_new=uint8(new_jpg); 
png_new=uint8(new_png);
tiff_new=uint8(new_tiff); 

figure
%%NEW GRAY PICTURE
subplot(3,2,1)
imshow(bmp_new)
title('BMP')
subplot(3,2,2)
imshow(gif_new)
title('GIF')
subplot(3,2,3)
imshow(jpg_new)
title('JPG')
subplot(3,2,4)
imshow(png_new)
title('PNG')
subplot(3,2,5)
imshow(tiff_new)
title('tiff')
