#Codebook for Portion of UCI HAR Data Set Used in ‘run_analysis.R’

##Overview
The script, ‘run_analysis.R’, uses a portion of the Smartphones Dataset that was published by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto of Smartlab.  The data were collected from experiments conducted on a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. This codebook modifies and updates the codebook included with the Smartphones Dataset because only a selection of the variables (i.e., those representing means and standard deviations) are used in the current analysis.

In the Using its embedded Acceleration and AngularVelocity, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.  The sensor signals (Acceleration and AngularVelocity) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. A full description of the dataset is available at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

The features, or variables, selected for this database come from the Acceleration and AngularVelocity 3-axial raw signals.  The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.

This codebook has two sections: 
	(1) a description of variables in the dataset extracted by ‘run_analysis.R’; and 
	(2) a description of variables in the newly created, independent dataset ‘newData.txt’.


##SECTION 1: Description of Variables in the Dataset Extracted by ‘run_analysis.R’ (‘mergedData_tbl’)

###General

"activity"	
	physical activity being performed during measurement
		1	walking
		2	walking_upstairs
		3	walking_downstairs
		4	sitting
		5	standing
		6	laying

"subject"	
	identification number of volunteer (person)
		1 to 30 

###Mean Measurements Made with Time Domain Signals 

"timeDomainBodyAccelerationMeanXDirection"     
	mean of the body acceleration signal in the X-Direction, measured with time domain signal

"timeDomainBodyAccelerationMeanYDirection" 
	mean of the body acceleration signal in the Y-Direction, measured with time domain signal

"timeDomainBodyAccelerationMeanZDirection" 
	mean of the body acceleration signal in the Z-Direction, measured with time domain signal

"timeDomainGravityAccelerationMeanXDirection"
	mean of the gravity acceleration signal in the X-Direction, measured with time domain signal

"timeDomainGravityAccelerationMeanYDirection" 
	mean of the gravity acceleration signal in the Y-Direction, measured with time domain signal

"timeDomainGravityAccelerationMeanZDirection" 
	mean of the gravity acceleration signal in the Z-Direction, measured with time domain signal

"timeDomainBodyAccelerationJerkMeanXDirection"
	mean of the jerk signal of body acceleration in the X-Direction, measured with time domain signal

"timeDomainBodyAccelerationJerkMeanYDirection" 
	mean of the jerk signal of body acceleration in the Y-Direction, measured with time domain signal

"timeDomainBodyAccelerationJerkMeanZDirection" 
	mean of the jerk signal of body acceleration in the Z-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityMeanXDirection" 
	mean of body angular velocity in the X-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityMeanYDirection" 
	mean of body angular velocity in the Y-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityMeanZDirection" 
	mean of body angular velocity in the Z-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityJerkMeanXDirection" 
	mean of the jerk signal of body angular velocity in the X-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityJerkMeanYDirection" 
	mean of the jerk signal of body angular velocity in the Y-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityJerkMeanZDirection" 
	mean of the jerk signal of body angular velocity in the Z-Direction, measured with time domain signal

####Calculated three-dimensional signals using the Euclidean norm; Time Domain Signals 
 
"timeDomainBodyAccelerationMagnitudeMean"
	mean of the magnitude of 3D signal of body acceleration, measured with time domain signal

"timeDomainGravityAccelerationMagnitudeMean" 
	mean of the magnitude of 3D signal of gravity acceleration, measured with time domain signal

"timeDomainBodyAccelerationJerkMagnitudeMean" 
	mean of the magnitude of 3D jerk signal of body acceleration, measured with time domain signal 

"timeDomainBodyAngularVelocityMagnitudeMean" 
	mean of the magnitude of 3D signal of angular velocity, measured with time domain signal

"timeDomainBodyAngularVelocityJerkMagnitudeMean" 
	mean of the magnitude of 3D jerk signal of angular velocity, measured with time domain signal 

####Frequency Domain Signals processed with a Fast Fourier Transform (FFT) 

"frequencyBodyAccelerationMeanXDirection"
 	mean of the body acceleration signal in the X-Direction, measured with frequency domain signal

"frequencyBodyAccelerationMeanYDirection"
 	mean of the body acceleration signal in the Y-Direction, measured with frequency domain signal
 
"frequencyBodyAccelerationMeanZDirection"
 	mean of the body acceleration signal in the Z-Direction, measured with frequency domain signal

"frequencyBodyAngularVelocityMeanXDirection"
	mean of the body angular velocity in the X-Direction, measured with frequency domain signal
 
"frequencyBodyAngularVelocityMeanYDirection" 
	mean of the body angular velocity in the Y-Direction, measured with frequency domain signal
 
"frequencyBodyAngularVelocityMeanZDirection" 
	mean of the body angular velocity in the Z-Direction, measured with frequency domain signal
 
"frequencyBodyAccelerationMagnitudeMean" 
	mean of the magnitude of 3D signal of body acceleration, measured with frequency domain signal

"frequencyBodyBodyAccelerationJerkMagnitudeMean" 
	mean of the magnitude of 3D jerk signal of body acceleration, measured with frequency domain signal 

”frequencyBodyBodyAngularVelocityMagnitudeMean"
	mean of the magnitude of 3D signal of angular velocity, measured with frequency domain signal
 
"frequencyBodyBodyAngularVelocityJerkMagnitudeMean"
	mean of the magnitude of 3D jerk signal of angular velocity, measured with frequency domain signal 

###Standard Deviation Measurements Made with Time Domain Signals

"timeDomainBodyAccelerationStdDevXDirection" 
	standard deviation of the body acceleration signal in the X-Direction, measured with time domain signal

"timeDomainBodyAccelerationStdDevYDirection" 
	standard deviation of the body acceleration signal in the Y-Direction, measured with time domain signal

"timeDomainBodyAccelerationStdDevZDirection" 
	standard deviation of the body acceleration signal in the Z-Direction, measured with time domain signal

"timeDomainGravityAccelerationStdDevXDirection" 
	standard deviation of the gravity acceleration signal in the X-Direction, measured with time domain signal

"timeDomainGravityAccelerationStdDevYDirection" 
	standard deviation of the gravity acceleration signal in the Y-Direction, measured with time domain signal

"timeDomainGravityAccelerationStdDevZDirection" 
	standard deviation of the gravity acceleration signal in the Z-Direction, measured with time domain signal

"timeDomainBodyAccelerationJerkStdDevXDirection" 
	standard deviation of the jerk signal of body acceleration in the X-Direction, measured with time domain signal

"timeDomainBodyAccelerationJerkStdDevYDirection" 
	standard deviation of the jerk signal of body acceleration in the Y-Direction, measured with time domain signal

"timeDomainBodyAccelerationJerkStdDevZDirection" 
	standard deviation of the jerk signal of body acceleration in the Z-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityStdDevXDirection" 
	standard deviation of body angular velocity in the X-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityStdDevYDirection" 
	standard deviation of body angular velocity in the Y-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityStdDevZDirection" 
	standard deviation of body angular velocity in the Z-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityJerkStdDevXDirection" 
	standard deviation of the jerk signal of body angular velocity in the X-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityJerkStdDevYDirection" 
	standard deviation of the jerk signal of body angular velocity in the Y-Direction, measured with time domain signal

"timeDomainBodyAngularVelocityJerkStdDevZDirection" 
	standard deviation of the jerk signal of body angular velocity in the Z-Direction, measured with time domain signal

####Calculated three-dimensional signals using the Euclidean norm; Time Domain Signals 
 
"timeDomainBodyAccelerationMagnitudeStdDev" 
	standard deviation of the magnitude of 3D signal of body acceleration, measured with time domain signal

"timeDomainGravityAccelerationMagnitudeStdDev" 
	standard deviation of the magnitude of 3D signal of gravity acceleration, measured with time domain signal

"timeDomainBodyAccelerationJerkMagnitudeStdDev" 
	standard deviation of the magnitude of 3D jerk signal of body acceleration, measured with time domain signal 
 
"timeDomainBodyAngularVelocityMagnitudeStdDev" 
	standard deviation of the magnitude of 3D signal of angular velocity, measured with time domain signal

"timeDomainBodyAngularVelocityJerkMagnitudeStdDev" 
	standard deviation of the magnitude of 3D jerk signal of angular velocity, measured with time domain signal 

####Frequency Domain Signals processed with a Fast Fourier Transform (FFT) 

"frequencyBodyAccelerationStdDevXDirection"
  	standard deviation of the body acceleration signal in the X-Direction, measured with frequency domain signal

"frequencyBodyAccelerationStdDevYDirection"
  	standard deviation of the body acceleration signal in the Y-Direction, measured with frequency domain signal

"frequencyBodyAccelerationStdDevZDirection"
   	standard deviation of the body acceleration signal in the Z-Direction, measured with frequency domain signal

"frequencyBodyAccelerationJerkStdDevXDirection"
	standard deviation of the body acceleration jerk signal in the X-Direction, measured with frequency domain signal

"frequencyBodyAccelerationJerkStdDevYDirection"
	standard deviation of the body acceleration jerk signal in the Y-Direction, measured with frequency domain signal

"frequencyBodyAccelerationJerkStdDevZDirection"
	standard deviation of the body acceleration jerk signal in the Z-Direction, measured with frequency domain signal

"frequencyBodyAngularVelocityStdDevXDirection"
  	standard deviation of the body angular velocity signal in the X-Direction, measured with frequency domain signal

"frequencyBodyAngularVelocityStdDevYDirection"
  	standard deviation of the body angular velocity signal in the Y-Direction, measured with frequency domain signal

"frequencyBodyAngularVelocityStdDevZDirection"
  	standard deviation of the body angular velocity signal in the Z-Direction, measured with frequency domain signal

"frequencyBodyAccelerationMagnitudeStdDev"
	standard deviation of the magnitude of 3D signal of body acceleration, measured with frequency domain signal

"frequencyBodyBodyAccelerationJerkMagnitudeStdDev"
	standard deviation of the magnitude of 3D jerk signal of body acceleration, measured with frequency domain signal 

"frequencyBodyBodyAngularVelocityMagnitudeStdDev"
	standard deviation of the magnitude of 3D signal of angular velocity, measured with frequency domain signal
 
"frequencyBodyBodyAngularVelocityJerkMagnitudeStdDev"
	standard deviation of the magnitude of 3D jerk signal of angular velocity, measured with frequency domain signal 


##SECTION 2: Description of Variables in the Newly Created, Independent Dataset: ‘newData.txt’

###General

"activity"	
	physical activity being performed during measurement
		1	walking
		2	walking_upstairs
		3	walking_downstairs
		4	sitting
		5	standing
		6	laying

"subject"	
	identification number of volunteer (person)
		1 to 30 

###Measurements of Acceleration and Angular Velocity

The variables in ‘newData.txt’ have the same names as the variables in ‘mergedData_tbl’, however, the variables in ‘newData.txt’ represent MEANS of each variable from ‘mergedData_tbl’ for each activity and subject pair.  
