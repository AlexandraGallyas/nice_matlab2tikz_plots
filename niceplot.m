

mylinestyles = {'-','--',':','-.'};

% Not the most beautiful colors and NOT colorblind-friendly; also, bad for 
% grayscale printing, but that is why I always use different linestyles and 
% markers!
mycolors = {... 
    [0.494,0.184,0.556],... % purple
    [0.000,0.000,0.000],... % black
    [0.301,0.745,0.933],... % cian
    [0.929,0.694,0.125],... % yellow-ish
    [0.85,0.100,0.1000],... % red
    [0.466,0.674,0.188],... % green-ish
    [0.635,0.078,0.184],... % brown/dark red
    [0.000,0.000,1.000],... % blue
    [0.500,0.500,0.500],... % grey
    [0.000,1.000,0.000]};   % green

% There exists more markers, but these are the most distinct ones.
mymarkers = {'none','o','+','x','s','d','^','p'};

x = linspace(0,1,20);

figure(1)
for ii = 1:8
    y = sin(2*pi*x + 2*pi/8*(ii-1)); % sinusoid with different phase
    plot(x,y,'LineStyle',mylinestyles{mod(ii-1,length(mylinestyles))+1},...
        'Color',mycolors{mod(ii-1,length(mycolors))+1},...
        'Marker',mymarkers{mod(ii-1,length(mymarkers))+1},'LineWidth',2,...
        'DisplayName',['$\sin(2\pi x+2\pi\frac{' num2str(ii-1) '}{8})$']);
    % The mod(a,m) is so that it cycles through when the list runs out.
    % You may also want to specify markersize and whether the markers are
    % solid or have filling, etc. Search for matlab plot options.
    hold on; % Overlay plots. Add it after plotting the first plot.
end
hold off;
grid on;
box on; % toghether with the last of the extraAxisOptions makes a thick box
axis([min(x) max(x) -1.2 1.2]) % [min_x max_x min_y max_y]
legend('Interpreter','none','Location','east','EdgeColor','k') 
xlabel('$x$','Color','k','Interpreter','none');
ylabel('$f(x)$','Color','k','Interpreter','none');
% The 'Interpreter','none' option is so that in the latex file matlab2tikz
% writes the expressions exactly as typed here.

myextracode = {'\usepackage{times}',... % to match font of IEEE papers
    '\tikzset{every picture/.append style={line join=round,line cap=round,}}',...
    '\tikzstyle{solid}=[dash pattern=]',...
    '\tikzstyle{dotted}=[dash pattern=on 0.0\pgflinewidth off 2.5\pgflinewidth]',...
    '\tikzstyle{dashed}=[dash pattern=on 4.0\pgflinewidth off 3.0\pgflinewidth]',...
    '\tikzstyle{dashdotted}=[dash pattern=on 0.0\pgflinewidth off 2.0\pgflinewidth on 3.0\pgflinewidth off 2.0\pgflinewidth]',...
    '\pgfplotsset{every tick label/.append style={font=\Large}}',...
    '\pgfplotsset{every axis legend/.append style={font=\large}}',...
    '\pgfplotsset{every axis label/.append style={font=\Large}}'};
% myextracode has extra options to be added in the tex file before 
% \begin{tikzpicture}: font, round cap lines, dash pattern definitions,
% label sizes.

myextraaxisoptions = {'legend style={nodes={scale=0.8},draw=black,thick}',...
    'every outer y axis line/.append style={black,very thick}'};
% myextraaxisoptions contains extra options to be added inside at the end 
% begin{axis}[here there are automatically generated options, and 
% myextraaxisoptions will go at the end so they will override any
% automatically generated options] 

cleanfigure; % not sure if this is necessary
matlab2tikz('./niceplot.tex',... % directory/name of tex file to be saved
    'standalone',true,'showInfo',false,...
    'extraCode',myextracode,... % add extra code defined above
    'height','5cm','width','8.4133cm',... % makes a 5x8 plot, no idea why
    'parseStrings',false,... % this goes together with 'Interpreter','none'
    'extraAxisOptions',myextraaxisoptions);

% tikz is more flexible than matlab, and you can define your own
% linestyles. Having added round cap commands in the preamble, my favorite
% settings for lines are (but to use linestyles other than solid, dotted,
% dashed and dashdotted the only way I know of is manually changing it in
% the tex file)
% \tikzstyle{solid}=                   [dash pattern=]
% \tikzstyle{dotted}=                  [dash pattern=on 0.0\pgflinewidth off 2.5\pgflinewidth]
% \tikzstyle{densely dotted}=          [dash pattern=on 0.0\pgflinewidth off 1.5\pgflinewidth]
% \tikzstyle{loosely dotted}=          [dash pattern=on 0.0\pgflinewidth off 3.0\pgflinewidth]
% \tikzstyle{dashed}=                  [dash pattern=on 4.0\pgflinewidth off 3.0\pgflinewidth]
% \tikzstyle{densely dashed}=          [dash pattern=on 3.0\pgflinewidth off 1.0\pgflinewidth]
% \tikzstyle{loosely dashed}=          [dash pattern=on 3.0\pgflinewidth off 4.0\pgflinewidth]
% \tikzstyle{dashdotted}=              [dash pattern=on 0.0\pgflinewidth off 2.0\pgflinewidth on 3.0\pgflinewidth off 2.0\pgflinewidth]
% \tikzstyle{densely dashdotted}=      [dash pattern=on 0.0\pgflinewidth off 1.0\pgflinewidth on 3.0\pgflinewidth off 1.0\pgflinewidth]
% \tikzstyle{loosely dashdotted}=      [dash pattern=on 3.0\pgflinewidth off 4.0\pgflinewidth on 0.0\pgflinewidth off 4.0\pgflinewidth]
