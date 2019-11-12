function Period = PhaseSlope(x1,y1)
% Using Hilbert we find intantaneus phase
% we fit a line on phase and measure its slope
% the slope be considered as frequency
% size(x1)= 1 :
% size(y1)= 1 : 

z = hilbert(y1);
phase=(unwrap(angle(z)));


%Trying to fit a line
coeffs = polyfit(x1, phase, 1);
% Get fitted values
fittedX = linspace(min(x1), max(x1), length(x1));
fittedY = polyval(coeffs, fittedX);
Slop=diff(fittedY)./(diff(fittedX));

% Plot the fitted line
plot(x1,phase,'ob',fittedX, fittedY,'r-','LineWidth', 2)
% finding frequency
instfreq=(1/(2*pi))*mean(Slop); 
% finding period
Period=1/ instfreq;
end

