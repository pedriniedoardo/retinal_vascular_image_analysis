// chose the directory of the masks
dir = getDirectory("Choose source directory the mask");
list = getFileList(dir);
dir1 = getDirectory("Choose destionation of the line");
dir2 = getDirectory("Choose destionation of the csv");
print(dir);
print(dir1);
//print(dir2);
print(list.length);
for(i=0; i<list.length;i++){
    print(list[i]);
}
setBatchMode(true);
run("Set Measurements...", "area display redirect=None decimal=3");
for(i=0; i<list.length;i++){
    // empty the result table
    run("Clear Results");
    
    //open the image and produce the mask
    open(dir + list[i]);
    file = File.nameWithoutExtension();
    
    run("Create Selection");
    roiManager("Add");
    //create the mask
        //create a new image
        newImage("Untitled", "8-bit white", 512, 512, 1);
        //set the background color
        setForegroundColor(0, 0, 0);
        //make and draw a line
        makeLine(100, 0, 100, 512);
        run("Draw", "slice");
        //make and draw the second line
        makeLine(256, 0, 256, 512);
        run("Draw", "slice");
        //make and draw the third line
        makeLine(412, 0, 412, 512);
        run("Draw", "slice");
        // remove the selections
        run("Select None");

    //cut the template
    roiManager("Select", 0);
    setForegroundColor(255, 255, 255);
    run("Fill","slice");
    roiManager("Deselect");
    roiManager("Delete");
    
    //create the new selection over the mask
    run("Create Selection");
    roiManager("Add");
    roiManager("Split");
    roiManager("Measure");
    roiManager("Delete");
    //save the mask
    //selectWindow(file);
    //close();
    //selectWindow("Mask of "+file);
    out_path = dir1 + file + ".tif";
    print(out_path);
    saveAs("Tiff",out_path);

    saveAs("Results", dir2 + file + ".csv");

    
    close();
    close();
}
//save the csv with the measurement
//saveAs("Results", dir2 + "result_area.csv");
showMessage("Macro is finished");