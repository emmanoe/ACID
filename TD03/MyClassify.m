%MyClassify return a boolean vector wich indicate   
% if pBar > pSaumon (0,1)

function[res] = MyClassify(vt,mu1,sigma1,mu2,sigma2)
pBar = normpdf(vt,mu1,sigma1);
pSaumon = normpdf(vt,mu2,sigma2);

res = pBar > pSaumon;

end