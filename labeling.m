function [retval] = labeling (folder)
audio_files=dir(fullfile(folder,'*.wav'))
eps = 25;
for k=3:numel(audio_files)
  file_address = strcat(folder, '/', audio_files(k).name);
  tmp = peak_frq(file_address);
  if(tmp > 122 - eps && tmp < 122 + eps) 
    printf("%s peak = %d therefore male voice\n", audio_files(k).name, tmp(1,1)); 
  elseif(tmp > 212 - eps && tmp < 212 + eps) 
    printf("%s peak = %d therefore female voice\n", audio_files(k).name, tmp(1,1));
  end 
end
endfunction