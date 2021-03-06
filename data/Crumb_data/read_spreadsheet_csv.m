function [TextColumn,Variables,EFTPC] = read_spreadsheet_csv(filename)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [AMIODARONE,VARNAME2,VARNAME3,VARNAME4,VARNAME5,VARNAME6,VARNAME7,VARNAME8,VARNAME9,VARNAME10,VARNAME11,VARNAME12,VARNAME13,VARNAME14,VARNAME15,VARNAME16,VARNAME17,VARNAME18,VARNAME19,VARNAME20,VARNAME21,EFTPC,VARNAME23]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [AMIODARONE,VARNAME2,VARNAME3,VARNAME4,VARNAME5,VARNAME6,VARNAME7,VARNAME8,VARNAME9,VARNAME10,VARNAME11,VARNAME12,VARNAME13,VARNAME14,VARNAME15,VARNAME16,VARNAME17,VARNAME18,VARNAME19,VARNAME20,VARNAME21,EFTPC,VARNAME23]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [Amiodarone,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,EFTPC,VarName23] = importfile('Spreadsheet_of_data.csv',1, 260);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/05/04 11:40:24

%% Initialize variables.
delimiter = ',';
startRow = 1;
endRow = inf;


%% Format string for each line of text:
%   column1: text (%s)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: double (%f)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
%   column21: double (%f)
%	column22: text (%s)
%   column23: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Allocate imported array to column variable names
TextColumn = dataArray{:, 1};
Variables = dataArray{:, 2};
for i=3:21
    %fprintf('Size Variables = %g x %g, dataArray{:,%i} = %g x %g\n',size(Variables,1),size(Variables,2),i,size(dataArray{:,i},1),size(dataArray{:,i},2))
    Variables = [Variables dataArray{:, i}];
end
EFTPC = dataArray{:, 23};


