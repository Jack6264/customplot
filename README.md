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
