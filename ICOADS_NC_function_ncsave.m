function ICOADS_NC_function_ncsave(file_save,var_name,data,type)

    N_meas = size(data,1);
    
    if ~exist('type','var'),   type = 'double';    end
    if isempty(type),          type = 'double';    end
    
    if size(data,2) == 1
        nccreate(file_save,var_name,'Dimensions', {'obs',N_meas},...
             'Datatype',type,'FillValue','disable','Format','netcdf4');
    else
        nccreate(file_save,var_name,'Dimensions', {'obs',N_meas,[var_name,'_len'],size(data,2)},...
             'Datatype',type,'FillValue','disable','Format','netcdf4');
    end
    ncwrite(file_save,var_name,data);

end