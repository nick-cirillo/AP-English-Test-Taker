fprintf('\nExtracting features from data...\n');

filename = 'featureSetCV.txt';
%filename = 'testFeatureSet.txt';


fid = fopen(filename);
tline = fgetl(fid);

i = 0;
j = 1;
z = zeros(1, 6786);
Xarray = {z z z}; %array will later become matrix through cell2mat
yCV = zeros(1);
totaltext = [''];

while ischar(tline)
  totaltext = [totaltext ' ' tline];
  if strfind(tline, "|") > 0 || strfind(tline, ">>>") > 0
    
    fintext = featurize(totaltext)';
    %j
    if i == 0
      
      for k = 0:4
        Xarray{j + k, 1} = fintext; %add features for PASSAGE to cell array
      endfor 
      
    else if i == 1
      
      for k = 0:4
        Xarray{j + k, 2} = fintext; %add features for QUESTION to cell array
      endfor
      
    else if i < 7 && i > 1
      
      Xarray{j + (i - 2), 3} = fintext; %add features for ANSWER to cell array. j + i allows each to be different
      
    else if i == 7
      yCV(j:j+4, 1) = zeros(5, 1);
      convline = remSyms(totaltext); % removes | from string, ie '01000|' -> '01000'
      sol = str2double(convline); %converts ie '01000' to 01000
      if sol == 10000
        yCV(j, 1) = 1;
        'A'
      else if sol == 1000
        yCV(j+1, 1) = 1;
        'B'
      else if sol == 100
        yCV(j+2, 1) = 1;
        'C'
      else if sol == 10
        yCV(j+3, 1) = 1;
        'D'
      else if sol == 1
        yCV(j+4, 1) = 1;
        'E'
      endif  
      endif  
      endif
      endif 
      endif 
      i = -1;
      j += 5;
    endif
    endif
    endif
    endif
      
    
    
  totaltext = [''];
  i += 1;
  %i
  endif

  tline = fgetl(fid);
end
fclose(fid);

XCV = cell2mat(Xarray);
