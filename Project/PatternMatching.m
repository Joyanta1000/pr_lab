clc();
clear all;
close all;

ImageRead = imread('D:\Last Semester\PR\PR lab\Project\new (times new roman)\1_candidate.jpg');
%ImageShow = imshow(ImageRead);

ImageR = imread('D:\Last Semester\PR\PR lab\Project\new (times new roman)\Template_1.jpg');
%ImageS = imshow(ImageR);

c = rgb2gray(ImageRead);
ct = rgb2gray(ImageR);

t = graythresh(c);
ty = graythresh(ct);

bil = im2bw(c, t);
b = not(bil);
imshow(b);
bit = im2bw(ct, ty);
bi = not(bit);
figure(), imshow(bi);
%c1 = 1/100*sum{[b(10)-mean(b)]*[bi(10)-mean(bi)]}/(sqrt(var(b)*var(bi)));


%ist way to normalize
c = normxcorr2(b,bi);
figure, surf(c), shading flat;
%ist way to normalize

%lm = mean(b);
%lm1 = mean(bi);

%for v = max(lm)
   %disp(v)
        %I1 = ((v-(min(lm)))*1)/(max(lm)-min(lm));
%end
%for v2 = max(lm1)
   %disp(v)
        %I2 = ((v2-(min(lm1)))*1)/(max(lm1)-min(lm1));
%end

%2nd way to normalize
candidate_image_normalized = (b-min(b(:)))/(max(b(:))-min(b(:)));
template_image_normalized = (bi-min(bi(:)))/(max(bi(:))-min(bi(:)));
two_images_normalized = normxcorr2(candidate_image_normalized,template_image_normalized);
%2nd way to normalize

%3rd way to normalize
x = b;
y = bi;
sum = 0;
next = 0;
next_y = 0;
nex = 0;
nex_y = 0;
sum_of_nex = 0;
sum_of_nex_y = 0;

for n = 1 : length(x)

  for k = 1 : x(n)
    next = k;
  end
  for k_1 = 1 : y(n)
    next_y = k_1;
  end
  
  multiply = next * next_y;
  
  sum = sum + multiply;
end


for n = 1 : length(x)

  for k = 1 : x(n)
    nex = k*k;
  end
  for k_1 = 1 : y(n)
    nex_y = k_1 * k_1;
  end
  sum_of_nex = sum_of_nex+nex;
  sum_of_nex_y = sum_of_nex_y + nex_y;
end

ino = sum_of_nex * sum_of_nex_y;
norm_den = sqrt(ino);

norm_corr = sum / norm_den;
%3rd way to normalize