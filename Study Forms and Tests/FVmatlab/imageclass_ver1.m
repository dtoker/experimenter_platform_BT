
clear all;

% this is the prompt/input screen part

prompt = {'Subject number','Screen'};
def={'1','0'};
answer = inputdlg(prompt, 'Experimental setup information',1,def);
[subNum, Screen_no] = deal(answer{:});
Screen_no=str2num(Screen_no); %#ok<ST2NM>
subNum=str2num(subNum); %#ok<ST2NM>
% num_trials = 30;
% rule_num = [1 2 6 9];
ListenChar(2);
HideCursor;
%%%%%%%%%


picDir = 'C:\Documents and Settings\Lab\My Documents\Matlab\Emmas Picture Classification Task\vision_task_images_v3\vision_task_images';
stimDir = ['C:\Documents and Settings\Lab\My Documents\Matlab\Emmas Picture Classification Task\vision task\sub' num2str(subNum) 'stimlist.xlsx'];
stimlist = xlsread(stimDir);

Background=[10 10 10];
Background2=[127 127 127];
Green=[0 205 0];
Red=[255 0 0];

center=[512 368 640 496];
shift=30;

T1=[448 30 704 286];
Y13=[30 718 126 814];
RY13=Y13+[-5 -5 5 5];
Y14=Y13+[96+shift 0 96+shift 0];
RY14=Y14+[-5 -5 5 5];
Y15=Y14+[96+shift 0 96+shift 0];
RY15=Y15+[-5 -5 5 5];
Y16=Y15+[96+shift 0 96+shift 0];
RY16=Y16+[-5 -5 5 5];
Y9=Y13-[0 96+shift 0 96+shift];
RY9=Y9+[-5 -5 5 5];
Y10=Y9+[96+shift 0 96+shift 0];
RY10=Y10+[-5 -5 5 5];
Y11=Y10+[96+shift 0 96+shift 0];
RY11=Y11+[-5 -5 5 5];
Y12=Y11+[96+shift 0 96+shift 0];
RY12=Y12+[-5 -5 5 5];
Y5=Y9-[0 96+shift 0 96+shift];
RY5=Y5+[-5 -5 5 5];
Y6=Y5+[96+shift 0 96+shift 0];
RY6=Y6+[-5 -5 5 5];
Y7=Y6+[96+shift 0 96+shift 0];
RY7=Y7+[-5 -5 5 5];
Y8=Y7+[96+shift 0 96+shift 0];
RY8=Y8+[-5 -5 5 5];
Y1=Y5-[0 96+shift 0 96+shift];
RY1=Y1+[-5 -5 5 5];
Y2=Y1+[96+shift 0 96+shift 0];
RY2=Y2+[-5 -5 5 5];
Y3=Y2+[96+shift 0 96+shift 0];
RY3=Y3+[-5 -5 5 5];
Y4=Y3+[96+shift 0 96+shift 0];
RY4=Y4+[-5 -5 5 5];
N13=[1026 718 1122 814];
RN13=N13+[-5 -5 5 5];
N14=N13-[96+shift 0 96+shift 0];
RN14=N14+[-5 -5 5 5];
N15=N14-[96+shift 0 96+shift 0];
RN15=N15+[-5 -5 5 5];
N16=N15-[96+shift 0 96+shift 0];
RN16=N16+[-5 -5 5 5];
N9=N13-[0 96+shift 0 96+shift];
RN9=N9+[-5 -5 5 5];
N10=N9-[96+shift 0 96+shift 0];
RN10=N10+[-5 -5 5 5];
N11=N10-[96+shift 0 96+shift 0];
RN11=N11+[-5 -5 5 5];
N12=N11-[96+shift 0 96+shift 0];
RN12=N12+[-5 -5 5 5];
N5=N9-[0 96+shift 0 96+shift];
RN5=N5+[-5 -5 5 5];
N6=N5-[96+shift 0 96+shift 0];
RN6=N6+[-5 -5 5 5];
N7=N6-[96+shift 0 96+shift 0];
RN7=N7+[-5 -5 5 5];
N8=N7-[96+shift 0 96+shift 0];
RN8=N8+[-5 -5 5 5];
N1=N5-[0 96+shift 0 96+shift];
RN1=N1+[-5 -5 5 5];
N2=N1-[96+shift 0 96+shift 0];
RN2=N2+[-5 -5 5 5];
N3=N2-[96+shift 0 96+shift 0];
RN3=N3+[-5 -5 5 5];
N4=N3-[96+shift 0 96+shift 0];
RN4=N4+[-5 -5 5 5];
rect1=[0 325 1152 335];
rect2=[563 335 591 864];
% 
% %Screen('PutImage', windowPtr, imageArray [,rect])
% % Copy the matrix "imageArray" to a window, slowly. "rect" is in window
% % coordinates. The whole image is copied to "rect", scaling if necessary. The rect
% % default is the imageArray's rect, centered in the window. The orientation of the
% % array in the window is identical to that of Matlab's numerical array displays in
% % the Command Window. The first pixel is in the upper left, and the rows are
% % horizontal.
% % RectLeft=1, RectTop=2,
% % RectRight=3, RectBottom=4.
%  
%     SCREEN(window,'PutImage',test_jpg2);   %put image
%     centertext2(window,'____',color,0,64);  %put some lines offset in  x y
%     centertext2(window,'____',color,0,-141);
%     Screen(window,'Flip');

window=Screen(Screen_no,'OpenWindow',Background2); %use 0 screen number is you have 1 screen

Screen('TextFont',window, 'Geneva');
Screen('TextSize',window, 45);
Screen('TextStyle', window, 1); 
CenterText2(window,['Press the v key if the picture belongs in Category 1'],Background,0,-20);
CenterText2(window,['Press the n key if the picture belongs in Category 2'],Background,0,20);
CenterText2(window,['Press the space bar to begin.'],Background,0,90);
Screen('Flip',window);

KbWait;
Screen('Flip',window);
% Stimulus presentation loop
n = 1;
t=1;
count=1;
yescount=0;
nocount=0;
while n < 920  %change for total number of stimuli per stimlist
 
    if stimlist(n,2) < 10
        currentgif1 = imread([picDir '\' num2str(stimlist(n,1)) '\sample_' num2str(stimlist(n,3)) '_000' num2str(stimlist(n,2)) '.gif']); 
    elseif stimlist(n,2) <100
        currentgif1 = imread([picDir '\' num2str(stimlist(n,1)) '\sample_' num2str(stimlist(n,3)) '_00' num2str(stimlist(n,2)) '.gif']);
    else
        currentgif1 = imread([picDir '\' num2str(stimlist(n,1)) '\sample_' num2str(stimlist(n,3)) '_0' num2str(stimlist(n,2)) '.gif']);
    end;
    currentgif1=currentgif1*255;
    currentgif2 = imresize(currentgif1,[256 256],'bicubic');
    currentgif3 = imresize(currentgif1,[96 96],'bicubic');
    
    %data(rule num, stim onset time, response key, response time, response correct 0/1 n/y, stimulus number, stimulus in/not in rule)
    data(count,1)=stimlist(n,1);
    
    Screen(window,'PutImage',currentgif2,T1);
    CenterText2(window,['Category 1'],Background,-352,402);
    CenterText2(window,['Category 2'],Background,352,402);
    Screen('FillRect',window,Background,rect1);
    Screen('FillRect',window,Background,rect2);
    if yescount==17
        Screen('FillRect',window,Red,RY1);
    elseif yescount==18
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
    elseif yescount==19
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
    elseif yescount==20
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
    elseif yescount==21
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
    elseif yescount==22
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
    elseif yescount==23
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
    elseif yescount==24
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
    elseif yescount==25
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
    elseif yescount==26
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
    elseif yescount==27
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
    elseif yescount==28
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
    elseif yescount==29
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
    elseif yescount==30
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
        Screen('FillRect',window,Red,RY14);
    elseif yescount==31
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
        Screen('FillRect',window,Red,RY14);
        Screen('FillRect',window,Red,RY15);
    elseif yescount>=32
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
        Screen('FillRect',window,Red,RY14);
        Screen('FillRect',window,Red,RY15);
        Screen('FillRect',window,Red,RY16);
    end;
    
    if nocount==17
        Screen('FillRect',window,Red,RN1);
    elseif nocount==18
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
    elseif nocount==19
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
    elseif nocount==20
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
    elseif nocount==21
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
    elseif nocount==22
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
    elseif nocount==23
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
    elseif nocount==24
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
    elseif nocount==25
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
    elseif nocount==26
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
    elseif nocount==27
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
    elseif nocount==28
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
    elseif nocount==29
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
    elseif nocount==30
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
        Screen('FillRect',window,Red,RN14);
    elseif nocount==31
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
        Screen('FillRect',window,Red,RN14);
        Screen('FillRect',window,Red,RN15);
    elseif nocount>=32
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
        Screen('FillRect',window,Red,RN14);
        Screen('FillRect',window,Red,RN15);
        Screen('FillRect',window,Red,RN16);
    end;
        
    if yescount==1
       Screen(window,'PutImage',Y1gif,Y1);
    elseif yescount==2
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);
    elseif yescount==3
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);
    elseif yescount==4
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
    elseif yescount==5
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
    elseif yescount==6
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
    elseif yescount==7
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
    elseif yescount==8
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
    elseif yescount==9
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
    elseif yescount==10
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
    elseif yescount==11
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
    elseif yescount==12
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
    elseif yescount==13
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
    elseif yescount==14
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
        Screen(window,'PutImage',Y14gif,Y14);
    elseif yescount==15
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
        Screen(window,'PutImage',Y14gif,Y14);
        Screen(window,'PutImage',Y15gif,Y15);
    elseif yescount>=16
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
        Screen(window,'PutImage',Y14gif,Y14);
        Screen(window,'PutImage',Y15gif,Y15);
        Screen(window,'PutImage',Y16gif,Y16);
    end;
    if nocount==1
        Screen(window,'PutImage',N1gif,N1);
    elseif nocount==2
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);
    elseif nocount==3
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);
    elseif nocount==4
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
    elseif nocount==5
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
    elseif nocount==6
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
   elseif nocount==7
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
    elseif nocount==8
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
    elseif nocount==9
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
    elseif nocount==10
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
    elseif nocount==11
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
    elseif nocount==12
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
    elseif nocount==13
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
    elseif nocount==14
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
        Screen(window,'PutImage',N14gif,N14);
    elseif nocount==15
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
        Screen(window,'PutImage',N14gif,N14);
        Screen(window,'PutImage',N15gif,N15);
    elseif nocount>=16
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
        Screen(window,'PutImage',N14gif,N14);
        Screen(window,'PutImage',N15gif,N15);
        Screen(window,'PutImage',N16gif,N16);
    end;
    Screen('Flip',window);  %flip stim on
    data(count,2)=GetSecs;  %stim onset time

    % keyboard response collection loop  
    resp=0;
    while resp==0,
        keyIsDown=0; %#ok<NASGU>
        [keyIsDown, secs, keyCode] = KbCheck;
        if keyIsDown==1;
            response_temp=(find(keyCode));
            data(count,3)=response_temp(1);
            data(count,4)=secs;
            keyIsDown=0;
            FlushEvents('KeyDown');  
            if data(count,3)==86 || data(count,3)==78
                resp=1;
            end;
            if data(count,3)==55    %'7'=quit
                ListenChar(0);
                ShowCursor;
                clear mex;
            end;
        end
    end;
    Screen('Flip',window);    %flip stim off
    clear KbWait;

    if (data(count,3)==86 && stimlist(n,3)==1) || (data(count,3)==78 && stimlist(n,3)==0)
        correct=1;
    else correct=0;
    end;
    
    % based on the value of correct, give some feedback
    if(correct==1)
        CenterText2(window,['Correct!'],Green,0,-10*shift);
      else
        CenterText2(window,['Incorrect!'],Red,0,-10*shift);
    end;
    CenterText2(window,['Category 1'],Background,-352,402);
    CenterText2(window,['Category 2'],Background,352,402);
    Screen('FillRect',window,Background,rect1);
    Screen('FillRect',window,Background,rect2);
    %move current picture to correct side of screen
    if stimlist(n,3)==1
        if yescount==0 || yescount==16 || yescount==32
            Y1gif = currentgif3;
        elseif yescount==1 || yescount==17 || yescount==33
            Y2gif=currentgif3;
        elseif yescount==2 || yescount==18 || yescount==34
            Y3gif=currentgif3;
        elseif yescount==3 || yescount==19 || yescount==35
            Y4gif=currentgif3;
        elseif yescount==4 || yescount==20
            Y5gif=currentgif3;
        elseif yescount == 5 || yescount==21
            Y6gif=currentgif3;
        elseif yescount==6 || yescount==22
            Y7gif=currentgif3;
        elseif yescount==7 || yescount==23
            Y8gif=currentgif3;
        elseif yescount==8 || yescount==24
            Y9gif=currentgif3;
        elseif yescount==9 || yescount==25
            Y10gif=currentgif3;
        elseif yescount==10 || yescount==26
            Y11gif=currentgif3;
        elseif yescount==11 || yescount==27
            Y12gif=currentgif3;
        elseif yescount==12 || yescount==28
            Y13gif=currentgif3;
        elseif yescount==13 || yescount==29
            Y14gif=currentgif3;
        elseif yescount==14 || yescount==30
            Y15gif=currentgif3;
        elseif yescount==15 || yescount==31
            Y16gif=currentgif3;
        end;
        yescount = yescount+1;
    else
        if nocount==0 || nocount==16 || nocount==32
            N1gif=currentgif3;
        elseif nocount==1 || nocount==17 || nocount==33
            N2gif=currentgif3;
        elseif nocount==2 || nocount==18 || nocount==34
            N3gif=currentgif3;
        elseif nocount==3 || nocount==19 || nocount==35
            N4gif=currentgif3;
        elseif nocount==4 || nocount==20
            N5gif=currentgif3;
        elseif nocount==5 || nocount==21
            N6gif=currentgif3;
        elseif nocount==6 || nocount==22
            N7gif=currentgif3;
        elseif nocount==7 || nocount==23
            N8gif=currentgif3;
        elseif nocount==8 || nocount==24
            N9gif=currentgif3;
        elseif nocount==9 || nocount==25
            N10gif=currentgif3;
        elseif nocount==10 || nocount==26
            N11gif=currentgif3;
        elseif nocount==11 || nocount==27
            N12gif=currentgif3;
        elseif nocount==12 || nocount==28
            N13gif=currentgif3;
        elseif nocount==13 || nocount==29
            N14gif=currentgif3;
        elseif nocount==14 || nocount==30
            N15gif=currentgif3;
        elseif nocount==15 || nocount==31
            N16gif=currentgif3;
        end;
        nocount = nocount+1;
    end;
    
    if yescount==17
        Screen('FillRect',window,Red,RY1);
    elseif yescount==18
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
    elseif yescount==19
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
    elseif yescount==20
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
    elseif yescount==21
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
    elseif yescount==22
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
    elseif yescount==23
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
    elseif yescount==24
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
    elseif yescount==25
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
    elseif yescount==26
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
    elseif yescount==27
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
    elseif yescount==28
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
    elseif yescount==29
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
    elseif yescount==30
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
        Screen('FillRect',window,Red,RY14);
    elseif yescount==31
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
        Screen('FillRect',window,Red,RY14);
        Screen('FillRect',window,Red,RY15);
    elseif yescount>=32
        Screen('FillRect',window,Red,RY1);
        Screen('FillRect',window,Red,RY2);
        Screen('FillRect',window,Red,RY3);
        Screen('FillRect',window,Red,RY4);
        Screen('FillRect',window,Red,RY5);
        Screen('FillRect',window,Red,RY6);
        Screen('FillRect',window,Red,RY7);
        Screen('FillRect',window,Red,RY8);
        Screen('FillRect',window,Red,RY9);
        Screen('FillRect',window,Red,RY10);
        Screen('FillRect',window,Red,RY11);
        Screen('FillRect',window,Red,RY12);
        Screen('FillRect',window,Red,RY13);
        Screen('FillRect',window,Red,RY14);
        Screen('FillRect',window,Red,RY15);
        Screen('FillRect',window,Red,RY16);
    end;
    
    if nocount==17
        Screen('FillRect',window,Red,RN1);
    elseif nocount==18
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
    elseif nocount==19
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
    elseif nocount==20
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
    elseif nocount==21
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
    elseif nocount==22
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
    elseif nocount==23
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
    elseif nocount==24
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
    elseif nocount==25
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
    elseif nocount==26
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
    elseif nocount==27
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
    elseif nocount==28
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
    elseif nocount==29
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
    elseif nocount==30
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
        Screen('FillRect',window,Red,RN14);
    elseif nocount==31
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
        Screen('FillRect',window,Red,RN14);
        Screen('FillRect',window,Red,RN15);
    elseif nocount>=32
        Screen('FillRect',window,Red,RN1);
        Screen('FillRect',window,Red,RN2);
        Screen('FillRect',window,Red,RN3);
        Screen('FillRect',window,Red,RN4);
        Screen('FillRect',window,Red,RN5);
        Screen('FillRect',window,Red,RN6);
        Screen('FillRect',window,Red,RN7);
        Screen('FillRect',window,Red,RN8);
        Screen('FillRect',window,Red,RN9);
        Screen('FillRect',window,Red,RN10);
        Screen('FillRect',window,Red,RN11);
        Screen('FillRect',window,Red,RN12);
        Screen('FillRect',window,Red,RN13);
        Screen('FillRect',window,Red,RN14);
        Screen('FillRect',window,Red,RN15);
        Screen('FillRect',window,Red,RN16);
    end;
    
    if yescount==1
       Screen(window,'PutImage',Y1gif,Y1);
    elseif yescount==2
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);
    elseif yescount==3
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);
    elseif yescount==4
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
    elseif yescount==5
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
    elseif yescount==6
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
    elseif yescount==7
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
    elseif yescount==8
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
    elseif yescount==9
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
    elseif yescount==10
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
    elseif yescount==11
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
    elseif yescount==12
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
    elseif yescount==13
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
    elseif yescount==14
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
        Screen(window,'PutImage',Y14gif,Y14);
    elseif yescount==15
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
        Screen(window,'PutImage',Y14gif,Y14);
        Screen(window,'PutImage',Y15gif,Y15);
    elseif yescount>=16
        Screen(window,'PutImage',Y1gif,Y1);    
        Screen(window,'PutImage',Y2gif,Y2);    
        Screen(window,'PutImage',Y3gif,Y3);    
        Screen(window,'PutImage',Y4gif,Y4);
        Screen(window,'PutImage',Y5gif,Y5);
        Screen(window,'PutImage',Y6gif,Y6);
        Screen(window,'PutImage',Y7gif,Y7);
        Screen(window,'PutImage',Y8gif,Y8);
        Screen(window,'PutImage',Y9gif,Y9);
        Screen(window,'PutImage',Y10gif,Y10);
        Screen(window,'PutImage',Y11gif,Y11);
        Screen(window,'PutImage',Y12gif,Y12);
        Screen(window,'PutImage',Y13gif,Y13);
        Screen(window,'PutImage',Y14gif,Y14);
        Screen(window,'PutImage',Y15gif,Y15);
        Screen(window,'PutImage',Y16gif,Y16);
    end;
    if nocount==1
        Screen(window,'PutImage',N1gif,N1);
    elseif nocount==2
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);
    elseif nocount==3
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);
    elseif nocount==4
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
    elseif nocount==5
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
    elseif nocount==6
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
   elseif nocount==7
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
    elseif nocount==8
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
    elseif nocount==9
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
    elseif nocount==10
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
    elseif nocount==11
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
    elseif nocount==12
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
    elseif nocount==13
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
    elseif nocount==14
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
        Screen(window,'PutImage',N14gif,N14);
    elseif nocount==15
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
        Screen(window,'PutImage',N14gif,N14);
        Screen(window,'PutImage',N15gif,N15);
    elseif nocount>=16
        Screen(window,'PutImage',N1gif,N1);    
        Screen(window,'PutImage',N2gif,N2);    
        Screen(window,'PutImage',N3gif,N3);    
        Screen(window,'PutImage',N4gif,N4);
        Screen(window,'PutImage',N5gif,N5);
        Screen(window,'PutImage',N6gif,N6);
        Screen(window,'PutImage',N7gif,N7);
        Screen(window,'PutImage',N8gif,N8);
        Screen(window,'PutImage',N9gif,N9);
        Screen(window,'PutImage',N10gif,N10);
        Screen(window,'PutImage',N11gif,N11);
        Screen(window,'PutImage',N12gif,N12);
        Screen(window,'PutImage',N13gif,N13);
        Screen(window,'PutImage',N14gif,N14);
        Screen(window,'PutImage',N15gif,N15);
        Screen(window,'PutImage',N16gif,N16);
    end;
    Screen('Flip',window);
    data(count,5)=correct;
    data(count,6)=stimlist(n,2);
    data(count,7)=stimlist(n,3);
    
    if t > 7 && (data(count,5)==1 && data(count-1, 5)==1 && data(count-2,5)==1 && data(count-3,5)==1 && data(count-4,5)==1 && data(count-5,5)==1 && data(count-6,5)==1)
        yescount=0;                %end trial loop, enough correct, go to next rule
        nocount=0;
        t=0;
        WaitSecs(.5);
        if n < 881
            CenterText2(window,['Great Job!'],Background,0,-20);
            CenterText2(window,['New Set of Categories, Press Spacebar to Continue'],Background,0,20);
            Screen('Flip',window);
            KbWait;
            ListenChar(0);
        else
            CenterText2(window,['Great Job!'],Background,0,-20);
            CenterText2(window,['The study is over, press the spacebar to exit.'],Background,0,20);
            Screen('Flip',window);
            KbWait;
            ListenChar(0);
            ShowCursor;
        end;
        if n < 40
            n=40;
        elseif n < 80
            n=80;
        elseif n < 120
            n=120;
        elseif n < 160
            n=160;
        elseif n < 200
            n=200;
        elseif n < 240
            n=240;
        elseif n < 280
            n=280;
        elseif n < 320
            n=320;
        elseif n < 360
            n=360;
        elseif n < 400
            n=400;
        elseif n < 440
            n=440;
        elseif n < 480
            n=480;
        elseif n < 520
            n=520;
        elseif n < 560
            n=560;
        elseif n < 600
            n=600;
        elseif n < 640
            n=640;
        elseif n < 680
            n=680;
        elseif n < 720
            n=720;
        elseif n < 760
            n=760;
        elseif n < 800
            n=800;
        elseif n < 840
            n=840;
        elseif n < 880;
            n=880;
        elseif n < 920
            n=920;
        end;
        
    elseif t==35
        yescount=0;
        nocount=0;
        t=0;
        WaitSecs(.5);
        if n < 881
            CenterText2(window,['Good Try, but Now Its Time to Move On'],Background,0,-20);
            CenterText2(window,['New Set of Categories, Press Spacebar to Continue'],Background,0,20);
            Screen('Flip',window)
            KbWait;
        else
            CenterText2(window,['Good Try, but Now Its Time to Move On'],Background,0,-20);
            CenterText2(window,['The study is over, press the spacebar to exit.'],Background,0,20);
            Screen('Flip',window)
            KbWait;
            ListenChar(0);
            ShowCursor;
        end;
        if n < 40
            n=40;
        elseif n < 80
            n=80;
        elseif n < 120
            n=120;
        elseif n < 160
            n=160;
        elseif n < 200
            n=200;
        elseif n < 240
            n=240;
        elseif n < 280
            n=280;
        elseif n < 320
            n=320;
        elseif n < 360
            n=360;
        elseif n < 400
            n=400;
        elseif n < 440
            n=440;
        elseif n < 480
            n=480;
        elseif n < 520
            n=520;
        elseif n < 560
            n=560;
        elseif n < 600
            n=600;
        elseif n < 640
            n=640;
        elseif n < 680
            n=680;
        elseif n < 720
            n=720;
        elseif n < 760
            n=760;
        elseif n < 800
            n=800;
        elseif n < 840
            n=840;
        elseif n < 880;
            n=880;
        elseif n < 920
            n=920;
        end;
        
    end;
    n = n + 1;
    t = t + 1;
    count = count+1;
    WaitSecs(.9);   %ITI
end;

filename = ['C:\Documents and Settings\Lab\My Documents\Matlab\Emmas Picture Classification Task\vision task\data\imgclassver1_' num2str(subNum)];
save(filename, 'data');
dlmwrite(['C:\Documents and Settings\Lab\My Documents\Matlab\Emmas Picture Classification Task\vision task\data\imgclassver1_' num2str(subNum) '.txt'],data,'delimiter','\t','precision',10);
ListenChar(0);
ShowCursor;
clear mex;

