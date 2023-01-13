function [outputimage]=partial_1d(I,dir,sigma)
    %purpose: to compute the partial derivative of input images in x or y
    %input:
    % I: input image
    % dir: 'x' for partial in x; 'y' for partial in y
    % sigma: gaussian sigma
    
    %Output: 
    % outputimage: partial derivative image
    
    
    %get gaussian
    G=apply_gaussian(I,sigma);
    [ Gmag_out, phase_out ] = AmpPhaseDFT( G );
    %computs I_x
    if dir=='x'
        Gxmag_out=zeros(size(Gmag_out));
        phase_out=phase_out+pi/2;
        phase_out(1,1)=0;
        phase_out(1,65)=0;
        phase_out(65,65)=0;
        phase_out(65,1)=0;
        for k=1:65
            Gxmag_out(:,k)=2*pi*((k-1)/128).*Gmag_out(:,k);
        end
        for k=66:128
            Gxmag_out(:,k)=2*pi*(((k-1)-128)/128).*Gmag_out(:,k);
        end
        outputimage = ReconfromAmpPhase(Gxmag_out,phase_out);
    end
    %compute I_y
    if dir=='y'
        Gymag_out=zeros(size(Gmag_out));
        phase_out=phase_out+pi/2;
        phase_out(1,1)=0;
        phase_out(1,65)=0;
        phase_out(65,65)=0;
        phase_out(65,1)=0;
        for j=1:65
            Gymag_out(j,:)=2*pi*((j-1)/128).*Gmag_out(j,:);
        end
        outputimage= ReconfromAmpPhase(Gymag_out,phase_out);
    end
end


