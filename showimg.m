function  showimg(path)
cd(path)
folder = dir(fullfile(pwd, '*.jpg')); 
for i=1:size(folder,1)
    img=imread(folder(i).name);
    imshow(img)
end
end