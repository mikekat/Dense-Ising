downloadFolder = 'C:\Users\ising\Downloads\Ising_PhaseTransition-2024\Ising_PhaseTransition-2023\DenseIsing';

url = "https://github.com/brendenlake/omniglot/raw/master/python";

urlTrain = url + "/images_background.zip";
urlTest = url + "/images_evaluation.zip";

filenameTrain = fullfile(downloadFolder,"images_background.zip");
filenameTest = fullfile(downloadFolder,"images_evaluation.zip");

dataFolderTrain = fullfile(downloadFolder,"images_background");
dataFolderTest = fullfile(downloadFolder,"images_evaluation");

if ~exist(dataFolderTrain,"dir")
    fprintf("Downloading Omniglot training data set (4.5 MB)... ")
    websave(filenameTrain,urlTrain);
    unzip(filenameTrain,downloadFolder);
    fprintf("Done.\n")
end

if ~exist(dataFolderTest,"dir")
    fprintf("Downloading Omniglot test data (3.2 MB)... ")
    websave(filenameTest,urlTest);
    unzip(filenameTest,downloadFolder);
    fprintf("Done.\n")
end
%%
%
% Demo of how to load and use the dataset
%

% Parameters
nletter_per_alpha = 20; % number of letters of each alphabet to show

% Load the dataset
if ~exist('D','var')
    load('data_background','drawings','images','names','timing');
    D = Dataset(drawings,images,names,timing);
end

nrow = ceil(sqrt(nletter_per_alpha));
ncol = nrow;
nalpha = numel(D.images);

% for each alphabet
for a=1:nalpha 
    msg = ['Alphabet ',D.names{a},' ',num2str(a),' of ',num2str(nalpha)];
    fprintf(1,[msg,'\n']); 
    
    figure(1);
    clf
    for r=1:nletter_per_alpha % for each replication
       item = D.get('all',a,1,r); % get image 'r' of first character in alphabet 'a'
       
       % display the motor plotted on the image
       subplot(nrow,ncol,r);
       
       % switch between these two lines to show either image vs. motor data
       plot_motor_on_image(item.image,item.drawing,true,1); 
%        plot_image_only(item.image);
    end
    
    % keyboard prompt
    str = input('  press <enter> to continue (''q'' to quit) : ','s');
    if str == 'q'
       break 
    end
end
%%
%
% Demo of how to load and use the dataset
%

% Parameters
nletter_per_alpha = 20; % number of letters of each alphabet to show

% Load the dataset
if ~exist('D','var')
    load('data_background','drawings','images','names','timing');
    D = Dataset(drawings,images,names,timing);
end

nrow = ceil(sqrt(nletter_per_alpha));
ncol = nrow;
nalpha = numel(D.images);

% for each alphabet
for a=1:nalpha 
    msg = ['Alphabet ',D.names{a},' ',num2str(a),' of ',num2str(nalpha)];
    fprintf(1,[msg,'\n']); 
    
    figure(1);
    clf
    for r=1:nletter_per_alpha % for each replication
       item = D.get('all',a,1,r); % get image 'r' of first character in alphabet 'a'
       
       % display the motor plotted on the image
       subplot(nrow,ncol,r);
       
       % switch between these two lines to show either image vs. motor data
       plot_motor_on_image(item.image,item.drawing,true,1); 
%        plot_image_only(item.image);
    end
    
    % keyboard prompt
    str = input('  press <enter> to continue (''q'' to quit) : ','s');
    if str == 'q'
       break 
    end
end
%%
figure;image(item.image,'CDataMapping','scaled')
colorbar
%%
A_letter = [];
for a =1:nalpha 
    for  r=1:nletter_per_alpha
        item = D.get('all',a,1,r);
        letter = imresize(item.image,[xeff,yeff]);
        A_letter = horzcat(A_letter,letter);
    end
end 
%%
k=19;
figure;image(A_letter(:,(k-1)*yeff +1 :k*yeff),'CDataMapping','scaled')
colorbar
%%
k=45;
l=50;
figure;image(A_letter(:,(k-1)*yeff +1 :l*yeff),'CDataMapping','scaled')
colorbar
%%
figure;image(A_letter,'CDataMapping','scaled')
colorbar