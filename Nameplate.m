nameplate=imread('nameplate1.png'); 
figure(1)
imshow(nameplate);
title('INPUT IMAGE')
nameplate=rgb2gray(nameplate); 
threshold = graythresh(nameplate);
nameplate =~im2bw(nameplate,threshold); 
nameplate = bwareaopen(nameplate,30); 
pause(1)
figure(2)
imshow(~nameplate); 
title('INPUT IMAGE CONVERTED TO BINARY')
[L Ne]=bwlabel(nameplate);
propied=regionprops(L,'BoundingBox');
hold on
%%Plot Bounding Box
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%Image segmentation
for n=1:(Ne)
  [r,c] = find(L==n);
  n10=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-1)
  [r,c] = find(L==n);
  n9=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-2)
  [r,c] = find(L==n);
  n8=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-3)
  [r,c] = find(L==n);
  n7=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-4)
  [r,c] = find(L==n);
  n6=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-5)
  [r,c] = find(L==n);
  n5=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-6)
  [r,c] = find(L==n);
  n4=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-7)
  [r,c] = find(L==n);
  n3=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-8)
  [r,c] = find(L==n);
  n2=nameplate(min(r):max(r),min(c):max(c));
end
for n=1:(Ne-9)
  [r,c] = find(L==n);
  n1=nameplate(min(r):max(r),min(c):max(c));
end
n1 = ~n1;
n2 = ~n2;
n3 = ~n3;
n4 = ~n4;
n5 = ~n5;
n6 = ~n6;
n7 = ~n7;
n8 = ~n8;
n9 = ~n9;
n10 = ~n10;
pause(1)
figure(3)
imshow(n1)
pause(1)
imshow(n2)
pause(1)
imshow(n3)
pause(1)
imshow(n4)
pause(1)
imshow(n5)
pause(1)
imshow(n6)
pause(1)
imshow(n7)
pause(1)
imshow(n8)
pause(1)
imshow(n9)
pause(1)
imshow(n10)
pause(1)
word=[ ];
re=nameplate;
fid = fopen('text.txt', 'wt');
load templates
global templates
num_letras=size(templates,2);
while 1
    [fl re]=lines(re);
    imgn=fl;
    [L Ne] = bwlabel(imgn);    
    for n=1:Ne
        [r,c] = find(L==n);
        n1=imgn(min(r):max(r),min(c):max(c)); 
        img_r=imresize(n1,[42 24]); 
        letter=read_letter(img_r,num_letras); 
        word=[word letter];
    end
    fprintf(fid,'%s\n',word);
    word=[ ];
    if isempty(re)   
        break       
    end    
end
fclose(fid);
winopen('text.txt')