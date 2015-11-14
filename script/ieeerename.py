import urllib2, re, time, random
from os import listdir, rename
from os.path import isfile, join

# for every publisher we have different way of scraping
IEEE = 1
SCIENCEDIRECT = 2

# yes, I know, this very bad and stupid web scraping. But it's work at least.

# get title for IEEE paper
# the IEEE paper filename is looks like this '06089032.pdf'
def getIEEETitle(fname):
    # get url
    number = int(fname.split('.')[0])    
    targeturl = 'http://ieeexplore.ieee.org/xpl/freeabs_all.jsp?arnumber='+str(number)
    # open and read from those url
    opener = urllib2.build_opener()
    opener.addheaders = [('User-agent', 'Mozilla/5.0')]
    ieeePage = opener.open(targeturl).read()
    # split  every tag in the html. this is the stupid part :p
    ieeePageSplit = ieeePage.replace('<','>').split('>')
    title = None
    # find a tag that start with 'meta name="citation_title" content="'
    for i in ieeePageSplit:
        if i.startswith('meta name="citation_title" content="'):
            # get the paper title
            title = i.split('"')[3]
            break
    # a file name cannot be longer than 255 character (theoretically)
    # http://msdn.microsoft.com/en-us/library/aa365247.aspx 
    return title.strip()[:150]

# get title for Science Direct paper
# the Science Direct paper filename is looks like this '1-s2.0-0031320375900217-main.pdf'
def getScienceDirectTittle(fname):
    # get url
    number = fname.split('-')[2]
    targeturl = 'http://www.sciencedirect.com/science/article/pii/'+number
    # open and read from those url
    opener = urllib2.build_opener()
    opener.addheaders = [('User-agent', 'Mozilla/5.0')]
    sdPage = opener.open(targeturl).read()
    # split  every tag in the html. this is the stupid part :p
    sdPageSplit = sdPage.replace('<','>').split('>')
    title = None
    for i in range(len(sdPageSplit)):
        if sdPageSplit[i].startswith('title'):
            title = sdPageSplit[i+1]
            break
    # a file name cannot be longer than 255 character (theoretically)
    # http://msdn.microsoft.com/en-us/library/aa365247.aspx 
    return title.strip()[:150]

def batchRename(workingdir, site):
    # list all file in working directory
    files = [ fInput for fInput in listdir(workingdir) if isfile(join(workingdir,fInput)) ]
    # compiled regular expression for illegal filename character
    reIlegalChar = re.compile(r'([<>:"/\\|?*])')
    # rename all files
    for f in files:
        try:
            # find title
            if site == IEEE:
                title = getIEEETitle(f)
            elif site == SCIENCEDIRECT:
                title = getScienceDirectTittle(f)
            else:
                title = None

            if title:
                # remove illegal file name character
                fnew = reIlegalChar.sub(r' ', title) + '.pdf'
                print '{} --> {}'.format(f, fnew)
                # rename file
                rename((workingdir + f), (workingdir + fnew))
                print 'Success'
            else:
                print '{}\nFailed'.format(f)
        except:
            print '{}\nERROR'.format(f)
        # give some random delay, so we will not be blocked (hopefully) :p
        time.sleep(random.randrange(10))

if __name__ == '__main__':
    print 'Please be patient, it takes time depending on your internet connection speed...'
    workingdir = '/cygdrive/f/Download/DownThemAll/' 
    batchRename(workingdir, IEEE)
