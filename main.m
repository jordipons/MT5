% CSV ORDER:
% ID,USER,INITtime,time,song,melodySlider,bassDrumsSlider,hamonicSlider,melodyOffset,bassdrumsOffset,harmonicOffset,repetitions,numbChannels,melodyRelative,bassDrumsRelative,harmonicRelative

clc;clear all;close all;

csvPath='./csv/JordiSunday/';

% ERROR CODE: 100000000
error_code=100000000;

% save terminal output
d=[date num2str(int16(clock))];
d=strcat('./results/',d);
diary(d)
diary on;

% find all the files in csvPath
dirData = dir(csvPath);
dirIndex = [dirData.isdir];
csvFiles = {dirData(~dirIndex).name}';
num_csvFiles=size(csvFiles,1);

% inicialize data
relBassDrums=[];
relMelody=[];
relHarmonic=[];
CSValues{1}='ID';
CSValues{2}='USER';
CSValues{3}='INITtime';
CSValues{4}='time';
CSValues{5}='song';
CSValues{6}='melodySlider';
CSValues{7}='bassDrumsSlider';
CSValues{8}='hamonicSlider';
CSValues{9}='melodyOffset';
CSValues{10}='bassdrumsOffset';
CSValues{11}='harmonicOffset';
CSValues{12}='repetitions';
CSValues{13}='numbChannels';
CSValues{14}='melodyRelative';
CSValues{15}='bassDrumsRelative';
CSValues{16}='harmonicRelative';

%'ID','USER','INITtime','time','song','melodySlider','bassDrumsSlider','hamonicSlider',
%'melodyOffset','bassdrumsOffset','harmonicOffset','repetitions',
%'numbChannels','melodyRelative','bassDrumsRelative','harmonicRelative'

for i=1:num_csvFiles;
    % load csv
    ftoread=[csvPath csvFiles{i}];
    fid = fopen(ftoread);
    fgetl(fid);
    fvalues=[];
    fvalues = textscan(fid, '%f32 %s %s %s %s %f32 %f32 %f32 %f32 %f32 %f32 %f32 %f32', 'Delimiter',','); 
    fclose(fid);
    
    % total contribution
    melody=fvalues{6}+fvalues{9};
    bassdrums=fvalues{7}+fvalues{10};
    if fvalues{8}~=error_code
        harmonic=fvalues{8}+fvalues{11};
    else
        harmonic=error_code;
    end
    
    % relative gains
    relBassDrums=[relBassDrums bassdrums-melody];
    relMelody=[relMelody melody-melody];
    if fvalues{8}~=error_code
        relHarmonic=[relHarmonic harmonic-melody];
    else
        relHarmonic=[relHarmonic error_code];
    end
    
    % save relative gains
    fvalues{length(fvalues)+1}=relMelody(end);
    fvalues{length(fvalues)+1}=relBassDrums(end);
    if fvalues{8}~=error_code
        fvalues{length(fvalues)+1}=relHarmonic(end);
    else
        fvalues{length(fvalues)+1}=error_code;
    end

    CSValues=[CSValues; fvalues];

    %%%% DISPLAY %%%%%
    disp('-----------------------------------')
    disp(ftoread)
    disp('-----------------------------------')
    disp('METADATA:')
    disp(fvalues{1})
    disp(fvalues{2})
    disp(fvalues{5})
    disp(fvalues{4})    
    disp(fvalues{12})
    disp('GAINS:')
    disp('Slider (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
    disp(fvalues{6})
    disp(fvalues{7})
    disp(fvalues{8})
    disp('Offset (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
    disp(fvalues{9})
    disp(fvalues{10})
    disp(fvalues{11})
    disp('Absolutes (slider+offset) (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
    disp(melody)
    disp(bassdrums)
    disp(harmonic)
    disp('Relatives (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
    disp(relMelody(end))
    disp(relBassDrums(end))
    disp(relHarmonic(end)) 
    
end

% export in a csv
cell2csv(strcat(d,'.csv'), CSValues, ',')

%     disp('-----------------------------------')
%     disp('STATISTICS')
%     disp('-----------------------------------')
% 
% disp('[MEAN] Relatives (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
% disp(mean(relMelody))
% disp(mean(relBassDrums))
% disp(mean(relHarmonic))
% 
% disp('[VAR] Relatives (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
% disp(var(relMelody))
% disp(var(relBassDrums))
% disp(var(relHarmonic))
% 
% disp('[STD] Relatives (1st: melody. 2nd: bassdrums. 3rd: harmonic.)')
% disp(std(relMelody))
% disp(std(relBassDrums))
% disp(std(relHarmonic))

diary off;
