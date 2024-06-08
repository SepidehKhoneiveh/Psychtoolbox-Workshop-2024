% Clear the workspace and the screen
sca;
close all;
clear;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if available
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% Set the initial position of the mouse to the center of the screen
SetMouse(xCenter, yCenter, window);

% Enable alpha blending for anti-aliasing
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% Loop until a mouse button is clicked
while true
    % Get the current position of the mouse
    [mx, my, buttons] = GetMouse(window);
    
    % Check if any mouse button is clicked
    if any(buttons)
        break;
    end
    
    % Draw a white dot at the current mouse position
    Screen('DrawDots', window, [mx my], 10, white, [], 2);

    % Flip to the screen
    Screen('Flip', window);
end

% Clear the screen
sca;
