%August 19, 2010 - Emma Wampler
%Script to run WM Task previously coded in Presentation by Keisuke Fukuda

clear all;

% this is the prompt/input screen part - taken from Mike Esterman
prompt = {'Subject number'};
def={'1'};
answer = inputdlg(prompt, 'Experimental setup information',1,def);
[subNum] = deal(answer{:});
%Screen_no=str2num(Screen_no); %#ok<ST2NM>
%subNum=str2num(subNum); %#ok<ST2NM>
ListenChar(2);
HideCursor;
%%%%%%%%%

Screen('Preference', 'SkipSyncTests', 1);
window=Screen('OpenWindow',0,[127 127 127]);
screenrect = Screen(window,'Rect'); % get the size of the display screen
[center_x,center_y]=RectCenter(screenrect); %find coordinates of the center of the screen

fontsize = 25; %fontsize
fixationsize = 15;
Screen('TextFont', window, 'Monaco');	% force fixed-width font we want
Screen('TextSize', window, fontsize);		% force fontsize we want
Screen('TextStyle', window, 0);

HideCursor();
ListenChar(2);

cur_dir = cd;
data = strcat(cur_dir, '\data');
filename = ['WMTask_' num2str(subNum)];

%old trial_duration = 500;
trial_duration = 0.2;
%old mask_duration = 200;
mask_duration = 0.9;
%test_duration = 2;

numConditions = 6;
numTrialsperCondition = 20;
numTrials = numConditions * numTrialsperCondition;



% Conditions: 40 = 4 squares, target will not match 
%             41 = 4 squares, target will match
%             60 = 6 squares, target will not match, 61 = 6 squares, target 
% will match, 80 = 8 squares, target will not match, 81 = 8 squares, target
% will match
ConditionArray(1, 1:numTrials) = 1;
counter = 1;
for i=1:numConditions
    for x=1:numTrialsperCondition
        switch i
            case 1
                ConditionArray(counter) = 40;
            case 2
                ConditionArray(counter) = 41;
            case 3
                ConditionArray(counter) = 60;
            case 4
                ConditionArray(counter) = 61;
            case 5
                ConditionArray(counter) = 80;
            case 6
                ConditionArray(counter) = 81;
        end;
        counter = counter + 1;
    end;
end;
ConditionArray = Shuffle(ConditionArray);

% Set up square positions
upperright = {[center_x+25.0, center_y-25.0],[center_x+25.0, center_y-75.0],[center_x+25.0, center_y-125.0],[center_x+75.0, center_y-25.0],[center_x+75.0, center_y-75.0],[center_x+75.0, center_y-125.0],[center_x+125.0, center_y-25.0],[center_x+125.0, center_y-75.0],[center_x+125.0, center_y-125.0]};
upperleft = {[center_x-25.0, center_y-25.0],[center_x-25.0, center_y-75.0],[center_x-25.0, center_y-125.0],[center_x-75.0, center_y-25.0],[center_x-75.0, center_y-75.0],[center_x-75.0, center_y-125.0],[center_x-125.0, center_y-25.0],[center_x-125.0, center_y-75.0],[center_x-125.0, center_y-125.0]};
lowerleft = {[center_x-25.0, center_y+25.0],[center_x-25.0, center_y+75.0],[center_x-25.0, center_y+125.0],[center_x-75.0, center_y+25.0],[center_x-75.0, center_y+75.0],[center_x-75.0, center_y+125.0],[center_x-125.0, center_y+25.0],[center_x-125.0, center_y+75.0],[center_x-125.0, center_y+125.0]};
lowerright = {[center_x+25.0, center_y+25.0],[center_x+25.0, center_y+75.0],[center_x+25.0, center_y+125.0],[center_x+75.0, center_y+25.0],[center_x+75.0, center_y+75.0],[center_x+75.0, center_y+125.0],[center_x+125.0, center_y+25.0],[center_x+125.0, center_y+75.0],[center_x+125.0, center_y+125.0]};

%colors
black = [0 0 0];
white = [255 255 255];
red = [255 0 0];
cyan = [0 255 255];
yellow = [255 255 0];
green = [0 255 0];
blue = [0 0 255];
orange = [255 128 0];
brown = [145 72 0];
purple = [255 0 255];

boxsize = 32;
colors = {black red cyan yellow green blue orange brown purple};

%data collection - Header
trialdata{1,1}= 'Match?';
trialdata{1,2}= 'Num Boxes?';
trialdata{1,3}= 'Test Item Onset Time';
trialdata{1,4}= 'Response Time';
trialdata{1,5}= 'Response Key';
trialdata{1,6}= 'Response Correct?';

%Instruction Screen
CenterText2(window,['You will see 4, 6, or 8 colored squares'],black,0,-140);
CenterText2(window,['appear briefly on the screen.'],black,0,-60);
CenterText2(window,['Then you will see one colored square appear.'],black,0,-20);
CenterText2(window,['Press YES if the single colored square matches'],black,0,20);
CenterText2(window,['the color of the square that was in that position.'],black,0,60);
CenterText2(window,['Press NO if it does not match.'],black,0,100);
CenterText2(window,['Press the space bar to begin'],black,0,140);
Screen('Flip',window);

KbWait;
Screen('Flip',window);

for i=1:numTrials
    upperright = Shuffle(upperright);
    upperleft = Shuffle(upperleft);
    lowerleft = Shuffle(lowerleft);
    lowerright = Shuffle(lowerright);
    colors = Shuffle(colors);

    Screen('TextSize', window, fixationsize);
    CenterText2(window,['+'],white);
    Screen('Flip',window);
    WaitSecs(0.5);

    if ConditionArray(i) == 40
        boxnum = 4;
        match = 0;
        trialdata{i+1,1} = 'No Match';
        trialdata{i+1,2} = '4';
    elseif ConditionArray(i) == 41
        boxnum = 4;
        match = 1;
        trialdata{i+1,1} = 'Match';
        trialdata{i+1,2} = '4';
    elseif ConditionArray(i) == 60
        boxnum = 6;
        match = 0;
        trialdata{i+1,1} = 'No Match';
        trialdata{i+1,2} = '6';
    elseif ConditionArray(i) == 61
        boxnum = 6;
        match = 1;
        trialdata{i+1,1} = 'Match';
        trialdata{i+1,2} = '6';
    elseif ConditionArray(i) == 80
        boxnum = 8;
        match = 0;
        trialdata{i+1,1} = 'No Match';
        trialdata{i+1,2} = '8';
    else
        boxnum = 8;
        match = 1;
        trialdata{i+1,1} = 'Match';
        trialdata{i+1,2} = '8';
    end;

    for y=1:boxnum
        squarepositions{y} = [0 0];
    end;

    for y=1:boxnum
        squarecolors{y} = [0 0 0];
    end;

    %setting up the memory array of squares
    for x=1:boxnum
        squarecolors{x} = colors{x};
        switch rem(x,4)
            case 0
                squarepositions{x} = upperright{x};
            case 1
                squarepositions{x} = upperleft{x};
            case 2
                squarepositions{x} = lowerleft{x};
            case 3
                squarepositions{x} = lowerright{x};
        end;
    end;

    %setting the test item
    if match == 1
        y = Randi(boxnum);
        testcolor = colors{y};
        testpositions = squarepositions{y};
    else
        testcolor = colors{boxnum+1};
        testpositions = squarepositions{y};
    end;

    %put the memory array up on the screen L T R B
    CenterText2(window,['+'],white);
    for x=1:boxnum
        color = squarecolors{x};
        centercoord = squarepositions{x};
        left = centercoord(1) - (0.5 * boxsize);
        top = centercoord(2) - (0.5 * boxsize);
        right = centercoord(1) + (0.5 * boxsize);
        bottom = centercoord(2) + (0.5 * boxsize);
        coord = [left top right bottom];
        Screen('FillRect', window, color, coord);
    end;

    [VBLTimestamp StimulusOnsetTime FlipTimestamp Missed Beampos] = Screen('Flip', window); %flip array on
    trialdata{i+1,3} = num2str(StimulusOnsetTime);
    WaitSecs(trial_duration); %this must be the trial duration
    CenterText2(window,['+'],white);
    Screen('Flip', window); %flip array off
    WaitSecs(mask_duration); %this must be the trial duration

    %Put test item up and wait for response
    CenterText2(window,['+'],white);
    left = testpositions(1) - (0.5 * boxsize);
    top = testpositions(2) - (0.5 * boxsize);
    right = testpositions(1) + (0.5 * boxsize);
    bottom = testpositions(2) + (0.5 * boxsize);
    pos = [left top right bottom];
    Screen('FillRect', window, testcolor, pos);
    Screen('Flip', window);
    %WaitSecs(test_duration);    
    %CenterText2(window,['+'],white);
    %Screen('Flip', window); %flip array off
    
    %Response Collection
    resp=0;
    while resp==0,
        keyIsDown=0; %#ok<NASGU>
        [keyIsDown, secs, keyCode] = KbCheck;
        if keyIsDown==1;
            response_temp=(find(keyCode));
            response_temp = response_temp(1);
            trialdata{i+1,4}=num2str(secs);
            keyIsDown=0;
            FlushEvents('KeyDown');
            %90 = Z, 77 = M
            %37 = LeftArrow, 39 = RightArrow
            if response_temp == 37 || response_temp == 39
                resp=1;
                if response_temp == 37
                    trialdata{i+1,5} = 'Z';
                else
                    trialdata{i+1,5} = 'M';
                end;
            end;
            if response_temp == 55   %'7'=quit
                resp=1;
                %Save everything to a .mat file, in case of emergency
                cd(data);
                filename=['WMTask_',num2str(subNum)];
                save([filename 'mat']);

                ListenChar(0);
                ShowCursor;
                Screen('CloseAll');
                cd ..
                return;
            end;
        end;

        if match == 0
            if trialdata{i+1,5} == 'Z'
                trialdata{i+1,6} = 'Incorrect';
            else
                trialdata{i+1,6} = 'Correct';
            end;
        else
            if trialdata{i+1,5} == 'Z'
                trialdata{i+1,6} = 'Correct';
            else
                trialdata{i+1,6} = 'Incorrect';
            end;
        end;
    end;

    Screen('Flip',window);    %flip stim off

end;

K4_denominator = 0;
K4_nominator = 0;
K6_denominator = 0;
K6_nominator = 0;
K8_denominator = 0;
K8_nominator = 0;
K4_ACC = 0;
K6_ACC = 0;
K8_ACC = 0;
K4 = 0;
K6 = 0;
K8 = 0;

for z=2:size(trialdata,1)
    switch trialdata{z,2}
        case '4'
            K4_denominator = K4_denominator + 1;
            if strcmp(trialdata{z,6},'Correct')
                K4_nominator = K4_nominator + 1;
            end;
        case '6'
            K6_denominator = K6_denominator + 1;
            if strcmp(trialdata{z,6},'Correct')
                K6_nominator = K6_nominator + 1;
            end;
        case '8'
            K8_denominator = K8_denominator + 1;
            if strcmp(trialdata{z,6},'Correct')
                K8_nominator = K8_nominator + 1;
            end;
    end;
end;

K4_ACC = K4_nominator / K4_denominator;
K6_ACC = K6_nominator / K6_denominator;
K8_ACC = K8_nominator / K8_denominator;

K4 = 4 * ((2 * K4_ACC) - 1)
K6 = 6 * ((2 * K6_ACC) - 1)
K8 = 8 * ((2 * K8_ACC) - 1)

%Save everything to a .mat file, in case of emergency
cd(data);
filename=sprintf('WMTask_%s.',subNum); %defined above --> subj id, etc...
save([filename 'mat']);

%save everything to a tab-delineated text file for actual analysis purposes
%edited from Stacy Cho
savefile=fopen([filename 'txt'],'w');

fprintf(savefile,'K4 = %f\n',K4);
fprintf(savefile,'K6 = %f\n',K6);
fprintf(savefile,'K8 = %f\n',K8);

for i=1:(size(trialdata,1))
    fprintf('\n');
    fprintf(savefile,'\n');    
    for j=1:(size(trialdata,2))
        trialdata{i,j};
        fprintf('%s ',trialdata{i,j});
        fprintf(savefile,'%s ',trialdata{i,j});
    end;
end;
fclose(savefile);
cd(cur_dir);
ListenChar(0);
ShowCursor;
Screen('CloseAll');
return;
