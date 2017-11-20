#!/usr/bin/env python
# Copyright (c) Microsoft Corporation. All Rights Reserved.
# Licensed under the MIT license. See LICENSE file on the project webpage for details.
import sys, getopt
import json
import os
import re
import glob
import bs4 as bs

# remove video_upload_pipeline fro json file
def removeVideoUploadPipelineJson(fileName):
    with open(fileName,'r') as json_data:
        d = json.load(json_data)
	if 'video_upload_pipeline' in d['course/course']:
            print " ==> Found video_upload_pipeline in file [" + fileName + "] and removed."
	    del d['course/course']['video_upload_pipeline']
	    with open(fileName,'w') as f:
	        json.dump(d,f, sort_keys=False, indent=4, separators=(',', ': '))


# remove video_upload_pipeline attribute from xml file
def removeVideoUploadPipelineXml(fileName):
    soup = bs.BeautifulSoup(open(fileName,'r'),'xml')
    myCourse = soup.course

    if 'video_upload_pipeline' in myCourse.attrs:
        print " ==> Found video_upload_pipeline in file [" + fileName + "] and removed."
        del myCourse['video_upload_pipeline'] 

        with open(fileName,'w') as w:
            w.write(soup.encode('utf8'))


# solution must be directly under problem. Fix it.
def fixProblemSolutionSection(fileName):
    soup = bs.BeautifulSoup(open(fileName,'r'),'xml')
    mySolution = soup('solution')
    myProblem = soup('problem')

    if len(myProblem) > 0 and len(mySolution) > 0 and mySolution[0].parent.name != 'problem':
        print "Fixing problem file: " + fileName
        myProblem[0].insert(len(myProblem[0].contents),mySolution[0]) 

        with open(fileName,'w') as w:
            w.write(soup.encode('utf8'))


def printHelp():
    print './migrate-course.py -s <source-folder> [-f,] [-i,] [-o <origin-version>] [-t <target-version>] [-m,] [-x,] [-v,] [-d <delete-tab-name>] [-p,]'
    print ' -s : source folder that has the tar.gz files. For e.g /tmp/folder'
    print ' -f : fix compatibility issues.'
    print ' -i : info. Read the tar.gz files and show the summory information'
    print ' -o : origin version. Which Open edX version these tar.gaz course files exported from. For e.g. cyp,dog,euc'
    print ' -t : target version. Which Open edX version you want to import these tar.gaz course files into. For e.g. cyp,dog,euc'
    print ' -m : import courses automatically. Must run the script on the Open edX VM'
    print ' -x : install missing xblocks automatically. Must run the script on the Open edX VM'
    print ' -d : delete the specified tab. Can use multiple times'
    print ' -p : pretend and do not take any action. Use to verify your parameters.'
    print ' -v : remove video_upload_pipeline info from course definition'
    print ''
    print 'The comma at the end of arguementless options are mendatory like -f, -i, -m, -x, -p,'
    print 'You can use' 
    print ' --info instead of -i'
    print ' --sourcedir instead of -s'
    print ' --origin instead of -o'
    print ' --target instead of -t'
    print ' --import instead of -m'
    print ' --xblock instead of -x'
    print ' --delete-tab instead of -d'
    print ' --pretend instead of -p'
    print ' --video-upload-pipeline instead of -v'
    print 'Comma is still mendatory for argumentless options like --fix , --fix=, --info ,  --info=, --import=, --import ,  --xblock=, --xblock , --pretend=, --pretend ,'
    print ''
    print 'SAMPLE COMMANDS:'
    print ''
    print 'sudo ./migrate-course.py -s /tmp/source/ -i, -o dog -t cyp -m, -x, -d Discussion -d Wiki -p,'
    print ''
    print 'Above command means this: Source tar.gz course files are in /tmp/source/ folder. Source Open edX origin version is Dogwood, Target Open edX version is Cypress. Import courses on the target system automatically after fixing the compatibility issues. Install the missing xblocks automatically. Delete course tabs Discussion and Wiki. And pretend. Just display the options and arguments and do not take any action. To run the actual command remove the -p option. Do not forget the comma at the and of argumentless options is mandatory' 

def main(argv):
    if len(argv) < 2:
        printHelp()
        sys.exit(0)

    sourceDir = ''
    showInfo = False
    fromVer = ''
    toVer=''
    importAuto = False
    installMissingXblocks = False
    deleteTabs = []
    pretend = False
    fix = False
    videoUploadPipeline = False

    try:
        opts, args = getopt.getopt(argv,"h:s:i:o:t:m:x:d:p:f:v:",["help=","sourcedir=","info=","origin=","target=","import=","xblock=","delete-tab=","pretend=","fix=","video-upload-pipeline="])
    except getopt.GetoptError:
        printHelp()
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-h","--help"):
            printHelp()
            sys.exit(0)
        elif opt in ("-s", "--sourcedir"):
            sourceDir = arg
        elif opt in ("-i", "--info"):
            showInfo = True
        elif opt in ("-o","--origin"):
            fromVer = arg
        elif opt in ("-t","--target"):
            toVer = arg
        elif opt in ("-m","--import"):
            importAuto = True
        elif opt in ("-x","--xblock"):
            installMissingXblocks = True  
        elif opt in ("-d","--delete-tab"):
            deleteTabs.append(arg)
        elif opt in ("-p","--pretend"):
            pretend = True
        elif opt in ("-f", "--fix"):
            fix = True
	elif opt in ("-v","--video-upload-pipeline"):
	    videoUploadPipeline = True

    if not sourceDir.endswith('/'):
        sourceDir += "/"

    if pretend == True:
        print "Source Directory         : " + sourceDir
        print "Show Info                : " + str(showInfo)
        print "Origin Version           : " + fromVer
        print "Target Version           : " + toVer
        print "Import Automatically     : " + str(importAuto)
        print "Install Missing XBlocks  : " + str(installMissingXblocks)
        print "Fix compatibility Issues : " + str(fix)
	print "Video Upload Pipleline   : " + str(videoUploadPipeline)
        print "Delete Tabs              : " + str(len(deleteTabs)) + " tabs"
        for t in deleteTabs:
            print " ==> " + t
        sys.exit()
  
    return sourceDir,showInfo,fromVer,toVer,importAuto,installMissingXblocks,deleteTabs,fix,videoUploadPipeline



def getXModuleList():
    os.system('ls -al /edx/app/edxapp/edx-platform/common/lib/xmodule/xmodule/*_module.py > /tmp/xm_list.txt')
    xm_list = open('/tmp/xm_list.txt','r').readlines()
    xm_newlist = []
    for xm in xm_list:
        xm = re.sub('.*/edx/app/edxapp/edx-platform/common/lib/xmodule/xmodule/','',xm)
        xm = re.sub('_module.py','',xm)
        xm_newlist.append(xm.rstrip('\n'))
    
    xm_newlist.append('done')
    return xm_newlist


def getXBlockList():
    os.system('cat /edx/app/edxapp/venvs/edxapp/lib/python*/site-packages/*xblock*/top_level.txt > /tmp/xblock_list.txt')
    xb_list = open('/tmp/xblock_list.txt','r').readlines()
   
    xb_newlist =[]
    for xb in xb_list:
        xb_newlist.append(xb.rstrip('\n'))

    return xb_newlist 


xm_list = getXModuleList()
xb_list = getXBlockList()

sourceDir,showInfo,fromVer,toVer,importAuto,installMissingXblocks,deleteTabs,fix,videoUploadPipeline = main(sys.argv[1:])

files = glob.glob(sourceDir + "*.tar.gz")
sourceDirLen = len(sourceDir)

print ""
print "Found " + str(len(files))+ " tar.gz course files in the source folder [" + sourceDir + "]"
print ""

# In the source folder, delete if exists and create unzipped, migrated and output parent folders
# Uncompressed and original course files will be in unzipped/ folder 
os.system('[ -e ' + sourceDir+'unzipped ] && rm -fr '+sourceDir+'unzipped')
os.system('mkdir '+sourceDir+'unzipped')
print 'Created ' + sourceDir+'unzipped/ folder'

# Uncompressed and modified and migrated course files will be in migrated/ folder

os.system('[ -e ' + sourceDir+'migrated ] && rm -fr '+sourceDir+'migrated')
os.system('mkdir '+sourceDir+'migrated')
print 'Created ' + sourceDir+'migrated/ folder' 

# The compatibility issues fixed course files will be compressed to tar.gaz file again and will be put to folder output/
os.system('[ -e ' + sourceDir+'output ] && rm -fr '+sourceDir+'output')
os.system('mkdir '+sourceDir+'output')
print 'Created ' + sourceDir+'output/ folder'
print ''

missingXBlockList = []

j = 1
# for each tar.gz course file
for f in files:
    # Under unzipped and migrated parent folders create folders with course file name
    fname = f[sourceDirLen:] # Remove the path from full file name. Now have only file name 
    # Uncompress tar.gz files to these two folders
    os.system('mkdir '+sourceDir+'unzipped/'+fname)
    os.system('tar xf '+f+' -C '+sourceDir+'unzipped/'+fname)
   
    os.system('mkdir '+sourceDir+'migrated/'+fname)
    os.system('tar xf '+f+' -C '+sourceDir+'migrated/'+fname)

    print str(j)+".["+fname+"]"
    j += 1   
    with open(sourceDir+'migrated/'+fname+'/course/policies/course/policy.json') as json_data:
        d = json.load(json_data)
        print " Course Name: " + d["course/course"]["display_name"]
  
        # Advanced Modules / XBlocks 
        if showInfo and d["course/course"].get("advanced_modules") and  len(d["course/course"]["advanced_modules"])>0:
            print " Advanced Modules:"
     
            for am in d["course/course"]["advanced_modules"]:
                am = am.replace('-','_');
                am_status = " missing! "
                if am in xm_list:
                    am_status = " built-in "
                elif am in xb_list:
                    am_status = " installed " 
                else:
                    # Not-Installed XBlock
                    if am not in missingXBlockList:
                        missingXBlockList.append(am)
  
                if showInfo==True: print "  - " + am + " ["+am_status+"]"

        # Info : Tabs and actions
        if showInfo == True:
            tabs = d["course/course"]["tabs"]
            print " Tabs:"
            for t in tabs:
                tabPrefix = ''
                if t["name"] in deleteTabs:
                    tabPrefix = " [ Action: Delete ]"  
                print "  -"+t["name"] + tabPrefix


# Print out missing xblock names
if len(missingXBlockList) > 0: 
    print "Found missing xblocks in the target Open edX VM:"
    for mxb in missingXBlockList:
        print " ==> " + mxb
    print " If you want to install these xblock automatically use -x, or --xblock=, option"

if len(missingXBlockList) <= 0 and installMissingXblocks == True:
    print "There are no any missing xblock on the VM"

if len(missingXBlockList) > 0 and installMissingXblocks == True:
    list_xb = {'lti_consumer':'https://github.com/edx/xblock-lti-consumer.git','azure_media_services':'https://github.com/Microsoft/xblock-azure-media-services.git','oembed':'https://github.com/Microsoft/xblock-oembed.git','onedrive':'https://github.com/Microsoft/xblock-onedrive.git','officevideo':'https://github.com/Microsoft/xblock-officevideo.git','filestorage':'https://github.com/Microsoft/xblock-filestorage.git','pdf':'https://github.com/MarCnu/pdfXBlock.git','poll':'https://github.com/mckinseyacademy/xblock-poll.git','survey':'https://github.com/mckinseyacademy/xblock-poll.git','drag_and_drop_v2':'https://github.com/edx-solutions/xblock-drag-and-drop-v2.git' }    

    xb_keys = list_xb.keys()
    for mxb in missingXBlockList:
        if mxb in xb_keys:
            print ' ==> Installing missing xblock ['+ mxb+'] from ['+list_xb[mxb]+']'
            os.system('sudo -H -u edxapp /edx/bin/pip.edxapp install git+'+list_xb[mxb])	
            print ' ==> Installed xblock: ' + mxb
        else:
            print ' ==> Do not know how to install missing xblock ['+mxb+']! Please add this to the script.'	

# Fix the compatibility issues
if fix == True:
    print "Will fix the compatibility issues from ["+fromVer+"] to [" + toVer +"] version"

if fix == True and len(deleteTabs) > 0:
    print "RULE: Will delete the requested tabs from the courses now"
    for f in files:
        fname = f[sourceDirLen:] # Remove the path from full file name. Now have only file name
        with open(sourceDir+'migrated/'+fname+'/course/policies/course/policy.json','r') as json_data:
            d = json.load(json_data)
            print " Course Name: " + d["course/course"]["display_name"]
            tabs2 = []
            tabs= d["course/course"]["tabs"]
            for t in tabs:
	        if t["name"] in deleteTabs:
                    print " ==>  Found and deleted tab " + t["name"] 
                else:
                    tabs2.append(t) 	
            d["course/course"]["tabs"] = tabs2

            with open(sourceDir+'migrated/'+fname+'/course/policies/course/policy.json','w') as f:
                json.dump(d,f, sort_keys=False, indent=4, separators=(',', ': '))


# 2 courseware (Course) tab must be the first tab in cypress
if fix == True and (toVer == "cyp" or toVer=="dog"):
   print "RULE: For Cypress and Dogwood target Open edX platform, first tab must be courseware (Course) tab. Will fix that now."   
   for f in files:
        fname = f[sourceDirLen:] # Remove the path from full file name. Now have only file name
        with open(sourceDir+'migrated/'+fname+'/course/policies/course/policy.json','r') as json_data:
            d = json.load(json_data)
            tabs2 = []
            tabs= d["course/course"]["tabs"]
            for t in tabs:
                if t["type"] == "courseware":
                    print " ==>  ["+d["course/course"]["display_name"]+"] 'Course' is found and set as the first tab"
                    tabs2.insert(0,t)
                else:
                    tabs2.append(t)
            d["course/course"]["tabs"] = tabs2

            with open(sourceDir+'migrated/'+fname+'/course/policies/course/policy.json','w') as f:
                json.dump(d,f, sort_keys=False, indent=4, separators=(',', ': '))

# Remove video_upload_pipeline info if any exists
if fix == True and videoUploadPipeline == True:
    print "RULE: Remove video_upload_pipeline info if any exists from policy.json. Also remove video_upload_pipeline from attributes of course.xml"
    for f in files:
        fname = f[sourceDirLen:] # Remove the path from full file name. Now have only file name
	
	removeVideoUploadPipelineJson( sourceDir+'migrated/'+fname+'/course/policies/course/policy.json' )
	removeVideoUploadPipelineXml( sourceDir+'migrated/'+fname+'/course/course/course.xml' )	
	    

# Fix the Problem-Souliton issue. Solution section must be directly under problem.
if fix == True: 
    print "RULE: Fix the Problem-Solution issue. In problem xmls solution section must be directly under problem section."
    for f in files:
        fname = f[sourceDirLen:] # Remove the path from full file name. Now have only file name
        problemFiles = glob.glob(sourceDir + "migrated/"+fname+"/course/problem/*.xml")
        for fp in problemFiles:
           fixProblemSolutionSection(fp)
        # Also fix the problems in drafts folder that unpublished ones.
	problemFiles = glob.glob(sourceDir + "migrated/"+fname+"/course/drafts/problem/*.xml")
        for fp in problemFiles:
           fixProblemSolutionSection(fp)


# Create the new tar.gaz files in output/ folder with compatibility issues fixed.  
os.system('chmod  777 -R ' + sourceDir+'migrated/' )

for f in files:
    fname = f[sourceDirLen:] #Remove the path from full file name. Now have only file name
    os.system('tar cfz '+sourceDir+'output/'+fname+' --directory="' + sourceDir+'migrated/'+fname+'" course')

print 'Created output tar.gaz files under ' +sourceDir+'output/'
# Give everymody read right so that import command doesn't need sudo right. File is creted with root:root
os.system('chmod  777 -R ' + sourceDir+'output/*')


# Automatically import courses
if importAuto == True:
    os.chdir('/edx/app/edxapp/edx-platform') 
    print "Automatically importing compatibility-issues-fixed courses from " + sourceDir+"migrated/"  
    for f in files:
        fname = f[sourceDirLen:] # Remove the path from full file name. Now have only file name
        print " ==> Importing course from " + fname
        os.system('sudo -u www-data /edx/bin/python.edxapp ./manage.py cms --settings=aws import /edx/var/edxapp/data ' + sourceDir+'migrated/'+fname+'/course')

print "Successfully completed migration"

