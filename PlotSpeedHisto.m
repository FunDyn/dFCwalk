function PlotSpeedHisto(Histo)
% Plots a histogram plot from a dFC speed structure Histo

col1=[.4,0,.5];
col2=col1;

c=Histo.BinCenters;
lo=Histo.BinCounts_low;
hi=Histo.Bincounts_high;

h=fill([c fliplr(c)], [lo fliplr(hi)],col1);
set(h,'facealpha',.2);hold on   
plot(c,Histo.BinCounts,'-o','Color',col2,'linewidth',3);
box off
set(gca,'fontsize',15)