brake=0.1;%��ʼ������
for i=1:80
    %�ó���ǳ���ʱ�������Ҫ������ܼ������ݣ����Ȳ���
    sim('calibration');
    v_temp(:,i)=vx.data;
    a_temp(:,i)=ax.data;
    brake_temp(:,i)=ones(length(vx.data),1)*brake;
    brake=brake+0.1;
    
end


%�ϲ�,һ��Ҫת���������ٺϲ�������ᵼ�ºϲ�ʧ��
vbr=v_temp(:,1)';
abr=a_temp(:,1)';
br=brake_temp(:,1)';
for i=2:80
    vbr=[vbr,v_temp(:,i)'];
    abr=[abr,a_temp(:,i)'];
    br=[br,brake_temp(:,i)'];
end
% 
%���
F=scatteredInterpolant(vbr',abr',br');%ת��������
vubr=0:0.05:50;
aubr=-8:0.05:0;
tablebr=zeros(length(vubr),length(aubr));
for i=1:length(vubr)
    for j=1:length(aubr)
        tablebr(i,j)=F(vubr(i),aubr(j));
    end
end






    
    
    
