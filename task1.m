clc
close all
clearvars
%% initial parameters
load('images_raiven');
[Beep,fs_beep] = audioread('beep.mp3');
%% key properties
upKey = KbName('b');
downKey = KbName('y');
leftKey = KbName('w');
rightKey = KbName('e');
%%
Screen('Preference', 'SkipSyncTests', 1);
PsychDefaultSetup(2);
screens = Screen('Screens');
screenNumber = max(screens);
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;
AssertOpenGL;
% [window, windowRect] = PsychImaging('OpenWindow', screenNumber, white,[0 100 700 500]);
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, white);
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
HideCursor()
%%
InitializePsychSound(1);
nrchannels = 2;
freq = 44100;
waitForDeviceStart = 1;
pahandle = PsychPortAudio('Open', [], 1, 1, [], nrchannels);
PsychPortAudio('Volume', pahandle, 0.5);
startCue = 0;
%% draw fixation
[xCenter, yCenter] = RectCenter(windowRect);
fixCrossDimPix = 40;
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];
lineWidthPix = 4;
%%
Screen('FillRect', window, black);
string_text='Are you ready?\n\n(Press any key to start the experiment)';
DrawFormattedText(window, string_text,'center', screenYpixels * 0.5 ,white);
Screen('Flip', window);
KbWait;
%%
PsychPortAudio('FillBuffer', pahandle, Beep');
PsychPortAudio('Start', pahandle, 1, startCue, waitForDeviceStart);
WaitSecs(2)
%%
Screen('FillRect', window, [1 1 1]);
for i=1:5 %:size(images_raiven,2)
    T1 = GetSecs;
    imageTexture = Screen('MakeTexture', window, images_raiven{1,i});
    Screen('DrawTexture', window, imageTexture, [], [], 0)
    Screen('Flip', window);
    Screen('FillRect', window, [1 1 1]);

        T=0; keyIsDown=0; K(i)=0;
        while T<5 && ~K(i)
            T2 = GetSecs;
            T=T2-T1;
            [keyIsDown,secs, keyCode] = KbCheck;
            if keyIsDown==1
                r_time(i)=GetSecs;
                WaitSecs(1)
                if keyCode(upKey)
                    K(i)=1;
                elseif keyCode(downKey)
                    K(i)=2;
                elseif keyCode(leftKey)
                    K(i)=3;
                elseif keyCode(rightKey)
                    K(i)=4;
                end
            end
        end
    % WaitSecs(2)
    Screen('DrawLines', window, allCoords,...
        lineWidthPix, black, [xCenter yCenter], 2);
    Screen('Flip', window);
    WaitSecs(2)
end
%%
sca