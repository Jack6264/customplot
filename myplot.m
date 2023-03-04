function[varargout] =  myplot(x,y,varargin)

    %|=================================================================================================|
    %|                                          myplot(x,y)                                            |
    %|=================================================================================================|
    %| x,y ------> Data Points of plot                                                                 |
    %| x is a row vector                                                                               |
    %| y can be any vector of size(x) or any Matrix but one of dimension should be equal to size(x)    |
    %|=================================================================================================|
    %|                                   myplot(x,y,Extra_inputs)                                      |
    %|===================== Extra Inputs - Optional inputs=============================================|
    %|                                                                                                 |
    %|                              #1 -- Extra Input(string array)                                    |
    %| "XL" --------> Parameter used to define X-label                                                 |
    %|           eg: myplot(x,y,"XL","x-label")                                                        |
    %|                                                                                                 |
    %|                              #2 -- Extra Input(string)                                          |
    %| "YL" --------> Parameter used to define Y-label                                                 |
    %|           eg: myplot(x,y,"YL","y-label")                                                        |
    %|                                                                                                 |
    %|                              #3 -- Extra Input(string)                                          |
    %| "TL" --------> Parameter used to define Fig title                                               |
    %|           eg: myplot(x,y,"TL","Title")                                                          |
    %|                                                                                                 |
    %|                              #4 -- Extra Input(Integer)                                         |
    %| "Mark" -------> Parameter used to enable/disable marker                                         |
    %|           If mark = 0(default); this option will disable the marker                             |
    %|           If mark = 1; this option will enable the marker                                       |
    %|           eg: myplot(x,y,"Mark",1)                                                              |
    %|                                                                                                 |
    %|                              #5 -- Extra Input(Integer)                                         |
    %| "LW" --------> Parameter used to control the linewidth of the plot                              |
    %|           Lw = 1.5 (default)                                                                    |
    %|           eg: myplot(x,y,"LW",3)                                                                |
    %|                                                                                                 |
    %|                              #6 -- Extra Input(Integer)                                         |
    %| "LS" --------> Parameter used to enable/disable different Linestyle                             |
    %|           If LS = 0(default); this option will disable the Linestyle                            |
    %|           If LS = 1; this option will enable the Linestyle                                      |
    %|           eg: myplot(x,y,"LS",1)                                                                |
    %|                                                                                                 |
    %|                              #7 -- Extra Input(Integer)                                         |
    %| "SPF" -------> Parameter used to save plot figure with default name.                            |
    %|           SPF = 0 (default)                                                                     |
    %|           If SPF = 1; Then, this function to save the plot in .fig and .tiff files              |
    %|           If SPF = 2; Then, this function to save the plot in .fig format                       |
    %|           If SPF = 3; Then, this function to save the plot in .tiff format                      |
    %|           eg: myplot(x,y,"SPF",1)                                                               |
    %|                                                                                                 |
    %|                              #8 -- Extra Input(string)                                          |
    %| "Figname" --------> String array which contains name of the plot                                |
    %|           Figname = "picture_file" (default)                                                    |
    %|           eg: myplot(x,y,"SPF",1,"Figname","test_file")                                         |
    %|                                                                                                 |
    %|                              #9 -- Extra Input(Integer)                                         |
    %| "lgnd"  --------> Parameter used to enable/disable legend                                       |
    %|           If lgnd = 0(default); this option will disable the legend                             |
    %|           If lgnd = 1; this option will enable the legend                                       |
    %|           eg: myplot(x,y,"lgnd",1)                                                              |
    %|                                                                                                 |
    %|                              #10 -- Extra Input(String)                                         |
    %| "CMark"  --------> Parameter used to define valid custom marker                                 |
    %|           valid markers = {'o','s','d','^','v','>','<','h','x','*','+','.'};                    |
    %|           If CMark = ''(default); this option will follow the default marker                    |
    %|           eg: myplot(x,y,"Mark",1,"CMark","*")                                                  |
    %|                                                                                                 |
    %|=================================================================================================|
  

    default_Xlabel = '';
    default_Ylabel = '';
    default_Title = '';
    default_marker = 0;
    default_Cmark = '';
    default_legend = 0;
    default_LineW = 2.5;
    default_LineS = 0;
    default_Fontsize = 30;
    axis_linewidth = 1.25;
    plot_linewidth = 3.5;
    axis_font = 25;
    default_SPF = 0;
    default_Figname = 'picture_file';



    markers = {'o','s','d','^','v','>','<','h','x','*','+','.'};
    Line_style = {'-',':','-.'};
    color_code = {[0 0 1],[1 0 0],[0 1 0],[1 1 0],[1 0 1],[0 0 1],[1 0.5 0],[0.5 1 0],[0.5 0 1],[1 0 0.5],[0 1 0.5],[0 0.5 1]};
   
    
    validString = @(x) ischar(x) || isstring(x);
    validNum = @(x) isnumeric(x) && isscalar(x);
    validMark = @(x) any(validatestring(x,markers));


    param = inputParser;
    addRequired(param,'x',@isnumeric);
    addRequired(param,'y',@isnumeric);
    addParameter(param,'XL',default_Xlabel,validString);
    addParameter(param,'YL',default_Ylabel,validString);
    addParameter(param,'TL',default_Title,validString);
    addParameter(param,'LW',default_LineW,validNum);
    addParameter(param,'LS',default_LineS,validNum);
    addParameter(param,'FS',default_Fontsize,validNum);
    addParameter(param,'Mark',default_marker,validNum);
    addParameter(param,'CMark',default_Cmark,validMark);
    addParameter(param,'Lgnd',default_legend,validNum);
    addParameter(param,'SPF',default_SPF,validNum);
    addParameter(param,'Figname',default_Figname,validString);

 
      
    param.KeepUnmatched = false;
    parse(param,x,y,varargin{:});
    
    Xdata = param.Results.x;
    Ydata = zeros(min(size(param.Results.y)),max(size(param.Results.y)));

    for yi = 1:min(size(param.Results.y))
        Ydata(yi,:) = param.Results.y(yi,:);
    end

    f = figure("WindowState","maximized");
    ax = axes(f);
    p = plot(Xdata,Ydata);

    size_var = length(p);

    xlabel(param.Results.XL,'FontSize',param.Results.FS,'FontWeight','bold','Interpreter','latex')
    ylabel(param.Results.YL,'FontSize',param.Results.FS,'FontWeight','bold','Interpreter','latex')
    title(param.Results.TL,'FontSize',param.Results.FS+7.5,'FontWeight','bold','Interpreter','latex')

    ylim([min(Ydata(:)) 1.15*max(Ydata(:))]);
    xlim([min(Xdata(:)) 1.15*max(Xdata(:))]);

 

    if(max(Xdata(:))<=1)
        xticks(round(linspace(min(Xdata(:)),max(Xdata(:)),5),6))
    else
        xticks(round(linspace(min(Xdata(:)),max(Xdata(:)),5),1))
    end

    if(max(Ydata(:))<=1)
        yticks(round(linspace(min(Ydata(:)),max(Ydata(:)),5),6))
    else
        yticks(round(linspace(min(Ydata(:)),max(Ydata(:)),5),1))
    end

    %check for custom Marker
    temp_mark = double(strcmp(param.Results.CMark,markers));

    for i = 1:min(size_var)
 
        p(i).LineWidth = param.Results.LW;
        
        %%% Marker
        if(param.Results.Mark==1)

            if(norm(temp_mark)==1)

                p(i).Marker = param.Results.CMark;

            else

                if(rem(i,13) == 0)
                    p(i).Marker = 'p';
                else
                    p(i).Marker = markers(mod(i,13));            
                end
            end
            
            p(i).MarkerIndices = round(linspace(1,length(Xdata),15));
            p(i).MarkerSize = plot_linewidth + 7.5;

        end
        
        %%% Linestyle
        if(param.Results.LS==1)
            if(rem(i,4)==0)
                p(i).LineStyle = '--';
            else
                p(i).LineStyle = Line_style(mod(i,4));
            end
        end
        
        %%% Color
        if(rem(i,13) == 0)
            p(i).Color = [0 0 0];
        else
            p(i).Color = color_code{mod(i,13)};
        end


    end

    if(param.Results.Lgnd == 1)
        legend(ax,"Location","best","FontSize",param.Results.FS-10,'Box','off',"Interpreter","latex")
    end


    ax.LineWidth = axis_linewidth ;
    ax.Box = "on";
    ax.FontSize = axis_font;
    ax.TickLabelInterpreter='latex';
    set(ax, 'color', 'none');
    axis tight

    if(param.Results.SPF==1)
        savefig(f,param.Results.Figname+".fig","compact")
        print(f,param.Results.Figname+".tiff",'-dtiff','-r300')
    elseif(param.Results.SPF==2)
        savefig(f,param.Results.Figname+".fig","compact")
    elseif(param.Results.SPF==3)
        print(f,param.Results.Figname+".tiff",'-dtiff','-r300')
    end


    if(nargout>0 && nargout<=1)
        varargout{1} = p;
    elseif(nargout>1)
        error('Too many output arguments')
    end

end
