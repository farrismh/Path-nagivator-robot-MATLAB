clc
clear all
%register a predefined path 
path = [2.00 1.00;
 1.25 1.75;
 5.25 8.25;
 7.25 8.75;
 11.75 10.75;
 12.00 10.00];

%set initial robot location and goal 
robotInitialLocation = path(1,:);
robotGoal = path(end,:);

%the robot orientation is the angle between the robot heading
%and the positive X-axis, measured counterclockwise
initialOrientation = 0;

%Define the current pose for the robot [x y theta]
robotCurrentPose = [robotInitialLocation initialOrientation]';

% differentialDriveKinematics creates a differential-drive vehicle model to
% simulate simplified vehicle dynamics. This model approximates a vehicle 
% with a single fixed axle and wheels separated by a specified track width.
% The wheels can be driven independently. Vehicle speed and heading is
% defined from the axle center. The state of the vehicle is defined as a
% three-element vector, [x y theta], with a global xy-position, specified 
% in meters, and a vehicle heading, theta, specified in radians. 
robot = differentialDriveKinematics("TrackWidth", 1, "VehicleInputs", "VehicleSpeedHeadingRate");

%Visualize the desired path
figure
plot(path(:,1), path(:,2),'k--d')
xlim([0 15])
ylim([0 15])

% Based on the path defined above and a robot motion model, you need a path following controller to
% drive the robot along the path.
controller = controllerPurePursuit;































