% Clear the workspace
clear all;
clc;

% Create a queue for keyboard input
KbQueueCreate;

% Start the queue
KbQueueStart;

% Wait for a key press
disp('Press any key to continue...');
while true
    [pressed, firstPress] = KbQueueCheck;
    if pressed
        % Find the key that was pressed
        keys = find(firstPress);
        % Display which key was pressed
        disp(['You pressed: ' KbName(keys)]);
        break;
    end
end

% Stop the queue
KbQueueStop;
