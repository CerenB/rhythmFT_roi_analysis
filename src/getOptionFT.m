% (C) Copyright 2019 CPP BIDS SPM-pipeline developpers

function opt = getOptionFT()
  % returns a structure that contains the options chosen by the user to run
  % decoding with cosmo-mvpa.

  if nargin < 1
    opt = [];
  end

  % suject to run in each group
  opt.subjects = {'005'};
%                 % suject to run in each group
%   opt.subjects = {'001','002', '003', '004', '005', '006',...
%                   '007', '008', '009', '010', '011', ...
%                   '012', '013', '014','015', '016', '017', ...
%                   '018', '019', '020', '021', '023'};


    
  % Uncomment the lines below to run preprocessing
  % - don't use realign and unwarp
  opt.realign.useUnwarp = true;

  % we stay in native space (that of the T1)
  opt.space = 'individual'; % 'individual', 'MNI'

  % The directory where the data are located
  opt.dataDir = fullfile(fileparts(mfilename('fullpath')), ...
                         '..', '..', '..', 'raw');
  opt.derivativesDir = fullfile(opt.dataDir, '..', 'derivatives', 'cpp_spm');

%   opt.pathOutput = fullfile(opt.dataDir, '..', 'derivatives', 'cosmoMvpa');

%   % multivariate
%   opt.model.file = fullfile(fileparts(mfilename('fullpath')), '..', ...
%                             'model', 'model-RhythmBlockDecoding1_smdl.json');

  % task to analyze
  opt.taskName = 'RhythmFT';

  opt.parallelize.do = false;
  opt.parallelize.nbWorkers = 1;
  opt.parallelize.killOnExit = true;

  
  opt.funcFWHM = 2;
  
  %% DO NOT TOUCH
  opt = checkOptions(opt);
  saveOptions(opt);

  
  

end
