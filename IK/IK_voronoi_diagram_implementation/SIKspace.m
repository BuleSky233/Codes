function [ndata] = SIKspace (Sdata,data, psi, t)
% kernel space for data
% Sdata is used for partition
%�˾���
[sn,~]=size(Sdata);   
[n,d]=size(data);   
IDX=[]; 

for i = 1:t 
     subIndex = datasample(1:sn, psi, 'Replace', false); %�޷Ż�������� %psi��ʾ��������
     tdata=Sdata(subIndex,:);    
%     
%    tdata=rand(psi,d);
    
    dis=pdist2(tdata,data);    %returns the distance between each pair of observations in X and Y using the metric specified by Distance.
                                %Ĭ�ϼ���ŷ����þ���
    [~, centerIdx] = min(dis);  %centeridx�õ�������data��ÿ��sample�����tdata�еĵ������
    IDX=[IDX; centerIdx+(i-1)*psi]; 
end 
 
IDR = repmat(1:n,t,1);
V=IDR-IDR+1; %ȫ1���� t��n��
ndata = sparse(IDR(:)',IDX(:)',V(:)',n,t*psi);

end
 