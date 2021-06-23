% P_out = ICOADS_read(yr,mon,var,ref)
% 
% var: a string or a cell list of strings
%       The function will omit 'CX_' when reading data
% ref: 'SST' or 'NMAT' or 'None'(shortcut '-')  -->  default: 'SST'
%
% Last updata: 2021-06-16
% 
% 
% Useage need to further subset data, e.g., only using bucket measurements:
% 
% var = {'C0_SST','C0_LON','C0_LAT','C0_YR','SI_Std'}; 
% Data = ICOADS_read(1930,4,var,'SST');
% l_use = Data.SI_Std == 0;
% [Data_use,var_list] = ICOADS_subset(Data,l_use);
% 
% 
% In addition to standard ICOADS outputs, below are a list of variables 
% That are also frequently used by the LME analysis
% 
% UTC:           Universial Time (hours since 0001-01-01 00:00)
% YR/MO/DY:      Year/Month/Day
% LCL:           Local time
% LCL_int:       Local time rounded to the nearest integer
% UID:           Universial ID aved as a double number rather than a string
% CTY_CRT:       Corrected country information
% OI_CLIM:       SST climatology
% SI_Std:        SST method without inference
% SI_K12:        SST method inferred following Kennedy et al. (2012b)
% ERA_CLIM:      Air temperature climatology
% NMAT:          Nighttime marine air tempearutres corrected for WWII
% QC_FINAL_SST:  QC of SST after using flags and buddy check
% QC_FINAL_NMAT: QC of NMAT after using flags and buddy check and Kent13
% ID_Kent:       ID of tracked ships from Carrela17


function P_out = ICOADS_read(yr,mon,var,ref)

    if ~exist('ref','var'),    ref = 'SST';    end
    if isempty(ref),           ref = 'SST';    end
    if strcmp(ref,'-'),        ref = 'None';   end
    
    if ~exist('var','var')
        var = {'C0_LON','C0_LAT','C0_UTC','SI_Std','C1_DCK','C0_CTY_CRT',...
               'C1_PT','C0_SST','C0_OI_CLIM','C98_UID'};
    end
    
    var_out  = var;  % name of variables in outputs
    var_look = var;  % name of variables when loading files (look up)

    % Longitude and Latitude are stored in lower case in NC files
    if ~iscell(var_look)
        if ismember(var_look,{'LON','LAT'}),  var_look = lower(var_look);  end
        if ismember(var_look,{'C0_LON'}),     var_look = 'lon';  end
        if ismember(var_look,{'C0_LAT'}),     var_look = 'lat';  end
    else
        for ct_var = 1:numel(var_look)
            if ismember(var_look{ct_var},{'LON','LAT'})
                var_look{ct_var} = lower(var_look{ct_var});  
            end
            if ismember(var_look{ct_var},{'C0_LON'})     
                var_look{ct_var} = 'lon';  
            end
            if ismember(var_look{ct_var},{'C0_LAT'})     
                var_look{ct_var} = 'lat';  
            end
        end
    end
    
    % Read data from target files
    if ~iscell(var)
        eval(['P_out.',var_out,' = ICOADS_NC_function_read(yr,mon,''',var_look,''');']);
    else
        for ct_var = 1:numel(var)
            var_out_temp = var_out{ct_var};
            var_look_temp = var_look{ct_var};
            eval(['P_out.',var_out_temp,...
                ' = ICOADS_NC_function_read(yr,mon,''',var_look_temp,''');']);
        end
    end
    
    % Read quality control flags
    if strcmp(ref,'SST')
        l_use = ICOADS_NC_function_read(yr,mon,'QC_FINAL_SST') == 1;
    elseif strcmp(ref,'NMAT')
        l_use = ICOADS_NC_function_read(yr,mon,'QC_FINAL_NMAT') == 1;
    elseif strcmp(ref,'None')
        l_use = true(size(out));
    end
    
    % Subset data for outputs
    [P_out,~] = ICOADS_subset(P_out,l_use);
    var_list = fieldnames(P_out);

    % remove generic IDs that are not useful for the analysis
    if any(ismember(var_list,{'C0_ID','ID'}))
        
        bad_ID_list = ['0120     ';'SHIP     ';'PLAT     '; 'RIGG     '; 
                       'MASKST   ';'1        ';'58       '; '7        ';
                       'MASKSTID '];

        try
            temp = P_out.C0_ID;
            l = ismember(temp,bad_ID_list,'rows');
            P_out.C0_ID(l,:) = 32;
        catch
            temp = P_out.ID;
            l = ismember(temp,bad_ID_list,'rows');
            P_out.ID(l,:) = 32;
        end
    end
end
    
    