function out = read_all_T1rho()
%Function for combining T1rho files into a .mat file based on
%list of subjects and sessions provided in SCANS variable
% Author: Joe Shaffer
% Date: 2018

%DATA_DIR='/Volumes/mrrcdata/BD_TMS_TIMING/derivatives/AAL_RESULTS/';
DATA_DIR='/Volumes/mrrcdata/Bipolar_R01/derivatives/T1rho';

matx = 193;
maty = 229;
matz = 193;

%Because Control data is stored in the SCZ directories, you must provide
%this location as well and the index for where in the list the controls.
%When combining the TMS dataset, you will want to switch this to a very
%high value so that it isn't used
%start
CTRL_DIR = '/Volumes/mrrcdata/SCZ_TMS_TIMING/derivatives/T1rho/';
%ctrl_index = 26;
ctrl_index = 1000;


%BD vs HC Edit the SCANS list to run this script

Outprefix='BDvHC';

SCANS = {'23517001','2017111012153T';
'23517002','201712083T';
'23517002','2017120813453T';
'23517003','2017122712303T';
'23517003','201712273T';
'23517004','2018010509303T';
'23517004','201801053T';
'23517005','2018011813003T';
'23517005','201801183T';
'23517006','2018012610303T';
'23517006','201801263T';
'23517007','2018013113003T';
'23517007','201801313T';
'23517008','2018020114453T';
'23517008','201802013T';
'23517009','201802083T';
'23517009','2018020812003T';
'23517010','201802093T';
'23517010','2018020909303T';
'23517011','2018021312303T';
'23517011','201802133T';
'23517012','2018022211003T';
'23517012','201802223T';
'23517013','2018022711003T';
'23517013','201802273T';
'23517014','2018031612003T';
'23517014','201803163T';
'23517015','2018040408303T';
'23517015','201804043T';
'23517016','2018040909353T';
'23517016','201804093T';
'23517017','201806263T';
'23517017','2018041217003T';
'23517017','201804123T';
'23517017','2018062617003T';
'23517017','201809103T';
'23517018','2018043011453T';
'23517018','201804303T';
'23517019','201805013T';
'23517019','2018050114153T';
'23517020','201808243T';
'23517020','2018050310153T';
'23517020','2018082408003T';
'23517021','2018050710453T';
'23517021','201805073T';
'23517021','2018080809003T';
'23517022','2018051412003T';
'23517022','201805143T';
'23517023','201895243T';
'23517023','2018052409003T';
'23517024','201805313T';
'23517025','2018061211303T';
'23517025','201806123T';
'23517026','201806193T';
'23517026','2018061914053T';
%'23517027','2018120608453T'; %113x113 matrix issue, needs to be rerun
'23517027','2018062114403T';
'23517027','201806213T';
'23517028','2018062210553T';
'23517028','201806223T';
'23517029','201806253T';
'23517030','2018062710303T';
'23517030','201806273T';
'23517030','201806283T';
'23517031','2018062811003T';
%'23517032','2018070316003T'; % Unknown reason for failure
'23517033','201807063T';
'23517034','201807103T';
'23517034','2018071017003T';
'23517035','2018071111003T';
'23517035','201807113T';
'23517036','2018073110353T';
'23517036','2018110710103T';
'23517038','2018080709403T';
'23517040','2018081014103T';
'23517041','2018082808003T';
'23517041','2018111408003T';
'23517042','201808313T';
'23517043','2018090409003T';
'23517044','2018090713453T';
'23517045','2018091814303T';
'23517046','201810041003T';
'23517047','2018101610003T';
'23517048','2018102508453T';
'23517049','2018110509303T';
'23517050','2018111911153T';
'23517051','2018112011403T';
'23517052','2018121811003T';
'23517052','2019040410303T';
'23517053','2018122712403T';
'23517054','2019010810003T';
'23517055','201901113T';
'23517056','2019011410303T';
%'23517056','2019053114303T'; Unknown reason for failure
'23517057','201902083T';
'23517058','2019021514003T';
'23517059','2019051408453T';
'23517059','2019022013153T';
%'23517060','2019022813453T'; Second 3T session containing only DTI
'23517060','2019022810303T';
'23517061','2019030410003T';
'23517061','2019052409303T';
'23517062','2019030611003T';
'23517063','201903073T';
'23517064','2019031510003T';
'23517065','201903253T';
'23517066','2019032610003T';
'23517067','2019040311003T';
%'23517068','2019042413003T'; 4 1.8 mb REST runs in scan?
'23517069','2019042910303T';
'23517070','2019043008303T';
'23517071','2019051309003T';
'23517072','2019060510003T';
'23517073','201906243T';
'23517075','2019082909003T';
'23517076','2019083010303T';
'23517077','201909113T';
%'23517078','201909123T'; Incomplete session
'23517079','2019091612303T';
'23517080','2019100716153T';
'23517081','2019100811103T';
'23517082','2019101113053T';
'23517083','2019101610303T';
'23517085','2019102810003T';
'23517086','20191023108003T';
'23517087','2019110810303T';
'23517088','2020022010303T';
'23517089','202002263T';
'23517090','2020022712003T';
'23517091','202003053T';
'23517092','2020030612003T';
'23517093','202003103T';
'23517094','202007093T';
'23517096','202007293T';
'23517098','2020081413203T';
'23517099','202009033T';
'23517100','2020090409153T';
'23517101','2020091510003T';
'23517102','2020100108353T';
'23517103','2020100909053T';
'23517500','201802203T';
'23517500','2018022009303T';
'23517501','2018022116453T';
'23517501','201802213T';
'23517502','2018022614303T';
'23517502','201802263T';
'23517503','2018030109303T';
'23517503','201803013T';
'23517504','201803053T';
'23517504','2018030502453T';
'23517505','2018030609003T';
'23517505','201803063T';
'23517506','201803123T';
'23517506','2018031215403T';
'23517507','2018030617003T';
'23517507','201803063T';
'23517508','2018030915403T';
'23517508','201803093T';
'23517509','201803123T';
'23517509','2018031211403T';
'23517510','201803203T';
'23517510','2018032013503T';
'23517511','2018032016503T';
'23517511','201803203T';
'23517512','201803293T';
'23517512','2018032914003T';
'23517513','2018040314353T';
'23517513','201804033T';
'23517514','2018041110203T';
'23517514','201804113T';
'23517515','201804183T';
'23517515','2018041814003T';
'23517516','201805293T';
'23517517','2018061109003T';
'23517517','201906113T';
'23517518','201806133T';
'23517519','2018062011003T';
'23517519','201906203T';
'23517520','2018082708403T';
'23517521','2018082909003T';
'23517522','2018091313503T';
'23517523','201809253T';
'23517524','2018092712303T';
'23517525','2018100313003T';
'23517526','2018101510303T';
'23517527','2018110715003T';
'23517528','2018110916003T';
'23517529','2018112717003T';
'23517530','2018112813003T';
'23517531','2018113014003T';
'23517532','2018121010003T';
'23517533','2019021110453T';
'23517534','2019021410303T';
'23517535','2019021912003T';
'23517536','2019030113303T';
'23517537','2019031110403T';
'23517538','2019031316303T';
'23517539','2019041213303T';
'23517540','2019050111003T';
'23517541','2019050810003T';
'23517542','2019070510303T';
'23517543','2019070916303T';
'23517544','2019071515453T';
'23517545','2019071810153T';
'23517546','2019071909303T';
'23517547','2019072209003T';
'23517548','2019072409003T';
'23517549','2019072514053T';
'23517550','2019072910003T';
'23517551','201908013T';
'23517552','2019080714453T';
'23517553','2019091711303T';
'23517554','2019102216353T';
'23517555','2019111514303T';
'23517556','202010053T';
'23517557','2020100610153T';
'23517558','202010143T';
'23517559','2020101609453T';
'23517560','2020102914503T';
'23517562','202011123T';
'23517563','202011133T';
'23517564','202011163T';
'23517565','202011203T';
'23517566','202011233T';
'23517567','202011243T'};


temp = length(SCANS);

imgData=zeros(matx, maty, matz, temp);
mask=zeros(matx, maty, matz);

for i = 1:temp
    
    
    if i >= ctrl_index
        dirname = strcat(CTRL_DIR,'/sub-',SCANS(i,1), '/ses-', SCANS(i,2),'/sub-', SCANS(i,1), '_ses-', SCANS(i,2), '_acq-SLa50SLb10BrainVentMasked_STANDARD_T1rho.nii.gz');
       
    else
        dirname = strcat(DATA_DIR,'/sub-',SCANS(i,1), '/ses-', SCANS(i,2),'/sub-', SCANS(i,1), '_ses-', SCANS(i,2), '_acq-SLa50SLb10BrainVentMasked_STANDARD_T1rho.nii.gz');
  
    end
    disp(dirname);
    
    dirname=char(dirname);
    data=load_nii(dirname);
    
    %size(data.img)
    
    %Save 3d image into structure with all subject images
    imgData(:,:,:,i) = data.img;
    
    %Add to count in mask for all non-zero voxels in image
    for x = 1:matx
        for y = 1:maty
            for z = 1:matz
                
                if(data.img(x,y,z) > 0)
                    mask(x,y,z) = mask(x,y,z) + 1;
                    
                end
                
            end
        end
    end
end


    for x = 1:matx
        for y = 1:maty
            for z = 1:matz
               
                val = mask(x,y,z)/temp;
                if(val > 0.95)
                    mask(x,y,z) = 1;
                else
                    mask(x,y,z) = 0;
                end
                
            end
        end
    end

    outname = strcat(DATA_DIR, '/', Outprefix,'_Data-', date, '-0.95Mask.mat');
    save(outname, 'mask', '-v7.3');

    outname = strcat(DATA_DIR, '/', Outprefix, '_Data-', date, '-0.95Mask.nii.gz');
    nif = make_nii(mask);
    nif.hdr.hist = data.hdr.hist;
    save_nii(nif, outname);



outname = strcat(DATA_DIR,'/', Outprefix, '_Data-', date, '.mat');
disp(outname);
save(outname,'imgData', '-v7.3');

outname = strcat(DATA_DIR,'/', Outprefix, '_SessionList-', date, '.xls');
disp(outname);

T = array2table(SCANS, 'VariableNames', {'Subject', 'SessionID'});
writetable(T, outname);

%out = imgData;
out = 1;
end
