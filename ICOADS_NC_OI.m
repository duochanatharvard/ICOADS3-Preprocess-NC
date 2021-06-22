% Input / Output management
%
% Last update: 2021-06-14

function output = ICOADS_NC_OI(input)

    if strcmp(input,'home')
        % Set the home directory, should be where the data are saved
        output = ['/n/home10/dchan/kuang_dss/ICOADS3_NC/'];

    elseif  strcmp(input,'nc_files')
        output = [ICOADS_NC_OI('home'),'ICOADS_01_nc_files/'];

    elseif  strcmp(input,'pre_QC')
        output = [ICOADS_NC_OI('home'),'ICOADS_02_pre_QC/'];

    elseif  strcmp(input,'WM')
        output = [ICOADS_NC_OI('home'),'ICOADS_03_WM/'];

    elseif  strcmp(input,'QCed')
        output = [ICOADS_NC_OI('home'),'ICOADS_QCed/'];

    elseif  strcmp(input,'Kent_load')
        output = [ICOADS_NC_OI('home'),'Ship_track_from_Liz/'];
        
    elseif  strcmp(input,'Kent_save')
        output = [ICOADS_NC_OI('home'),'ICOADS_Tracks_Kent/'];

    elseif  strcmp(input,'Mis')
        output = [ICOADS_NC_OI('home'),'ICOADS_Mis/'];
    end
end
