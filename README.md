# ARES-race-line-data

By Charles L. Tucker III, Department of Mechanical Science and Engineering, University of Illinois at Urbana-Champaign

The files here show how to use the MARS (multivariate adaptive regression splines) algorithm and logged data from a race car to model the curvature of the car's path vs distance traveled.  An example is given in Matlab, using the ARESLab toolkit to perform the MARS calculation.

The files are:
- **MarsAresRaceLineData.pdf**, a PDF file explaining the method and the details of the example calculation.
- **MidOhioLap3.csv**, a data file from an in-car data logger, used for an example calculation.
- **ARESexample.m**, a Matlab script that reads the sample data file and fits a MARS/ARES model to the data. 

To download the files, click the green **Code** button, and select **Download ZIP**.  

These files are distributed under an MIT license; see the LICENSE file for details.  They can be cited as:
- C. L. Tucker, MARS/ARES Modeling of Race Line Data, https://github.com/charlestucker3/ARES-race-line-data, 2022.

To run the example you will need Matlab and the ARESLab toolkit.  You can download ARESLab from http://www.cs.rtu.lv/jekabsons/regression.html.
