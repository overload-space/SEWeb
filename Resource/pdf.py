#encoding=utf8
from PyPDF2 import PdfFileMerger
import  sys

def splitPdf(origin,target,begin,end):
    merger = PdfFileMerger()
    input1 = open(origin, "rb")
    merger.append(fileobj=input1, pages=(begin,end))
    output = open(target, "wb")
    merger.write(output)

originPdf = u"D:\\桌面\PBRT.pdf"
if __name__ == '__main__':
        lst = [28,82,134,210,288,328,350,450,504,528,602,632,664,706,766,900,952,1016,1027]
        for i in range(0,len(lst)-1):
            a,b = lst[i]+1,lst[i+1]
            targetPdf = u"D:\\桌面\\"+str(i+1)+u".pdf"
            splitPdf(originPdf,targetPdf,a,b)
            print str(i+1)+".pdf generate completed!"









