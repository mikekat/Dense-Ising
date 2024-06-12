%% Section 3
% Initialization of digits
load("mnist.mat");
image (training.images(:,:,1)*255);
image (rescale(training.images(:,:,1),0,255));
count = 100
ind0 = 0
ind1 = 0
ind2 = 0
ind3 = 0
ind4 =0
ind5 = 0
ind6 = 0
ind7 = 0
ind8 = 0
ind9 = 0
for i=1:count
if training.labels(i) == 0
ind0 = ind0 + 1
digit0(:,:,ind0) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 1
ind1 = ind1 + 1
digit1(:,:,ind1) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 2
ind2 = ind2 + 1
digit2(:,:,ind2) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 3
ind3 = ind3 + 1
digit3(:,:,ind3) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 4
ind4 = ind4 + 1
digit4(:,:,ind4) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 5
ind5 = ind5 + 1
digit5(:,:,ind5) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 6
ind6 = ind6 + 1
digit6(:,:,ind6) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 7
ind7 = ind7 + 1
digit7(:,:,ind7) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 8
ind8 = ind8 + 1
digit8(:,:,ind8) = im2bw(training.images(:,:,i))
elseif training.labels(i) == 9
ind9 = ind9 + 1
digit9(:,:,ind9) = im2bw(training.images(:,:,i))
end
end
