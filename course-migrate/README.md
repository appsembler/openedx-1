<h1>Course-Migrate Tool</h1>
<br/><br/>
This command line Python tool fixes the known compatibility issues between different versions of Open edX courses and can migrate courses to Open edX paltform automatically using the tar.gz course files.<br/>
You also need to install lxml and bs4 python modules to be able to use this tool with commands: <br/>
<ul>
  <li>pip install <b>bs4</b></li>
  <li>pip install <b>lxml</b></li> 
</ul>
<br/>
Open edX Course Migration Tool Capabilities:<br/>
- Reads tar.gz course files from a folder<br/>
- Fixes the known compatibility issues<br/>
- Can remove unwanted course tabs<br/>
- Can list the used xmodules and xblocks in the courses and status<br/>
- Can install the missing xblocks<br/>
- Can import the courses automatically<br/> 
<br/>
TOOL:<br/>
./migrate-course.py -s <source-folder> [-f,] [-i,] [-o <origin-version>] [-t <target-version>] [-m,] [-x,] [-d <delete-tab-name>] [-p,]<br/>
<br/>
 -s : source folder that has the tar.gz files. For e.g /tmp/folder <br/>
 -f : fix compatibility issues.<br/>
 -i : info. Read the tar.gz files and show the summory information<br/>
 -o : origin version. Which Open edX version these tar.gaz course files exported from. For e.g. cyp,dog,euc<br/>
 -t : target version. Which Open edX version you want to import these tar.gaz course files into. For e.g. cyp,dog,euc<br/>
 -m : import courses automatically. Must run the script on the Open edX VM<br/>
 -x : install missing xblocks automatically. Must run the script on the Open edX VM<br/>
 -d : delete the specified tab. Can use multiple times<br/>
 -v : remove video_upload_pipeline info from course definition<br/>
 -p : pretend and do not take any action. Use to verify your parameters.<br/>
<br/>
The comma at the end of arguementless options are mendatory like -f, -i, -m, -x, -p,<br/>
<br/>You can use<br/>
 --info instead of -i<br/>
 --sourcedir instead of -s<br/>
 --origin instead of -o<br/>
 --target instead of -t<br/>
 --import instead of -m<br/>
 --xblock instead of -x<br/>
 --delete-tab instead of -d<br/>
 --video-upload-pipeline instead of -v<br/>
 --pretend instead of -p<br/>
<br/>Comma is still mendatory for argumentless options like --fix , --fix=, --info ,  --info=, --import=, --import ,  --xblock=, --xblock , --pretend=, --pretend , --video-upload-pipeline=, --video-upload-pipeline ,<br/>

SAMPLE COMMANDS:<br/>
<br/>
sudo ./migrate-course.py -s /tmp/source/ -i, -o dog -t cyp -m, -x, -d Discussion -d Wiki -p,<br/>
<br/>
Above command means this: Source tar.gz course files are in /tmp/source/ folder. Source Open edX origin version is Dogwood, Target Open edX version is Cypress. Import courses on the target system automatically after fixing the compatibility issues. Install the missing xblocks automatically. Delete course tabs Discussion and Wiki. And pretend. Just display the options and arguments and do not take any action. To run the actual command remove the -p option. Do not forget the comma at the and of argumentless options is mandatory
<br/><br/>
MORE SAMPLE COMMANDS:<br/>
sudo ./migrate-courses.py –h,<br/>
sudo ./migrate-course.py --sourcedir /tmp/courses –i,<br/>
sudo ./migrate-course.py --sourcedir=/tmp/courses -i, -x, -d Discussion –d Wiki<br/>
sudo ./migrate-course.py –s /tmp/courses --origin=dog --target=cyp –x, -f, -m,<br/>
sudo ./migrate-course.py –s /tmp/courses --origin=dog --target=cyp –x, -f, -m, -p,<br/>
sudo ./migrate-course.py –s /tmp/courses/ -o dog –t cyp –f, -x, -m, -i,<br/>
sudo ./migrate-course.py –sourcedir=/tmp/courses --import , <br/>
<br/>
RULES FOR COMPATIBILITY ISSUE FIXES:<br/>
- Course (courseware) must be the first tab in Cypress<br/>
- Solution tag must be directly under Problem section in problem xmls<br/>
- Discussion tab not wanted, can remove tabs<br/>
- Determine the missing xblocks and install if requested<br/>
- More rules can be added to the tool as we figure out new compatibility issues between different versions of Open edX<br/>
