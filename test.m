clc
close all
clearvars
%% for loop
% Initialize an array to store the results
squares = zeros(1, 10);

% Use a for loop to compute the squares of the first 10 positive integers
for i = 1:10
    squares(i) = i^2;
end

% Display the results
disp('The squares of the first 10 positive integers are:');
disp(squares);


%% example 2
cd ('D:\psychtoolbox workshop\data')
data=xlsread('second trigger.xlsx');
for i = 1:120
    data_round(i) = round(data(i)); % Round the data
end
%% example 3

load('images_raiven.mat')
for i=1:5 %size(images_raiven,2)
    figure
    imshow(images_raiven{1,i})
    pause(2)
end
%% random play
vectorLength=10;
randomVector = randi([1, 10], 1, vectorLength);
for i=1:10 %size(images_raiven,2)
    figure
    imshow(images_raiven{1,randomVector(i)})
    pause(2)
end

%% while loop
% Initialize variables
sumValue = 0;
i = 1;

% Use a while loop to sum the numbers from 1 to 10
while i <= 10
    sumValue = sumValue + i;
    i = i + 1;
end

% Display the result
disp('The sum of numbers from 1 to 10 is:');
disp(sumValue);
%% example 2

% Display a message to the user
disp('Press the Enter key to continue...');

% Wait for the user to press the Enter key
while true
    userInput = input('', 's');
    if isempty(userInput)
        break;
    end
end

% Key was pressed
disp('Enter key was pressed! Continuing execution...');

%% if else
for i = 1:120
    data_round(i) = round(data(i)); % Round the data
    if data_round(i) >= 2
        data_f(i) = 1; % Mark as 1 if the condition is met
    else
        data_f(i) = 0; % Mark as 0 if the condition is not met
    end
end
%% example 2
vectorLength=10;
randomVector = randi([1, 10], 1, vectorLength);
cd ('D:\psychtoolbox workshop\data')
RT=xlsread('second trigger.xlsx');
load('images_raiven.mat');
RT=RT(1:10);
while true
    userInput = input('', 's');
    if isempty(userInput)
        for i=1:length(RT)
            figure
            imshow(images_raiven{1,randomVector(i)})
            if i==10
                pause(5)
            else
                pause(RT(i))
            end
        end
    end
end
%%
path='D:\psychtoolbox workshop\data\images';
cd(path)
folder = dir(fullfile(pwd, '*.jpg')); 
for i=1:size(folder,1)
    imread(folder.name(i))
    imshow(img)
end
%%
path='D:\psychtoolbox workshop\data\images';
showimg(path)
%% 
imresize 
sum 
mean 
rng('shuffle');