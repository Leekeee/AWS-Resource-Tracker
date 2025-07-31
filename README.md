# AWS-Resource-Tracker

This guide explains how to track key AWS resources such as EC2 instances, S3 buckets, Lambda and IAM Users.

## Prerequisites
- AWS account
- IAM role or user with necessary permissions
- AWS CLI or any terminal with access to the AWS Management Console. For this experiment, **MobaXterm** was used

## 1. Access the AWS console
1. Access the AWS console by searching for "AWS" in any search engine of your choice
2. Provide authorised credentials to login to your AWS console
3. If successful, a terminal similar to the image below should be achieved
![Screenshot 2025-07-31 040929](https://github.com/user-attachments/assets/40c30854-a0a9-4002-a9c4-9c5b6eb96791)
  
5. Then proceed to **EC2** or make use of the search bar
   ![Screenshot 2025-07-31 033741](https://github.com/user-attachments/assets/e2dc16c9-c2e9-4c4b-8f3e-2f90488fc0d4)

6. Launch an instance (or make use of a tutorial to create one)

## 2. SSH into the instance
1. Locate your pem key in your file manager, then open your terminal there (this is an easier method)
   <img width="1600" height="835" alt="Screenshot (11)" src="https://github.com/user-attachments/assets/43908526-9d0e-43bb-8d02-2d914ff936cc" />

2. After accessing your terminal, input your ssh credentials. For AWS, it is usually in this format : **"ssh -i /path/to/your/key-pair.pem username@public_dns_or_ip"**
   ![Screenshot 2025-07-31 034116](https://github.com/user-attachments/assets/9c3521b6-f4f4-48c7-9854-18b88d281e96)

## 3. Create a Shell Script
1. Using the **vim** command, create the script: "**vim status_report.sh**"
2. The file can be named as you wish (in this case it is status_report), but ensure that it ends with "**.sh**" for it to be recognized as a shell file or script
3. Refer to the "**status_report.sh**" in this repository, for the commands to be inputted and save it
4. Depending on the note editor used, there are different methods for writing and saving files. For the **Vim editor**, "**:w!**" is used to write to a file and "**:q!**" is used to quit or exit from the file. A combination of both : "**:wq!**" will write and exit fron the file editor
5. To ensure that the file has been created, "**ls**" can be used to view the files present
   ![Screenshot 2025-07-31 034219-1](https://github.com/user-attachments/assets/271c8d0e-9807-4796-acab-d54fc3ba3fb8)
   
6. Then make use of "**cat status_report.sh**" to view the content of the file
![Screenshot 2025-07-31 034248](https://github.com/user-attachments/assets/7fb204b6-75aa-4f2a-931e-4af15741d1b2)


## 4. Run the Script
1. Before running the script, certain permissions have to be changed or set to allow its execution. Using the **chmod**, this permissions can be set
2. Within the terminal, input "**chmod 700 status_report.sh**"
3. To run the script, input "**sh status_report.sh**" or "**./status_report.sh**"
4. If successful, an output in the image below should be generated
   ![Screenshot 2025-07-31 035046](https://github.com/user-attachments/assets/bf61def8-1f73-4ca4-bb1d-9d90e5faf1b3)
   ![Screenshot 2025-07-31 035113](https://github.com/user-attachments/assets/be80f063-79cb-4a6d-b78b-98c4b2ce686a)


## 5 Automate the Script
1. Unix systems have a time-based scheduler known as **CRON JOB**. It is a daemon (background process) that constantly checks for scheduled tasks and executes them according to the defined schedule.
2. To create it, input the command "**crontab -e**". This will open a file editor
3. Using the image below, we can keep generating a status report autonomously.
   <img width="1366" height="302" alt="Screenshot (4)-1" src="https://github.com/user-attachments/assets/0f317f09-1ed3-44f3-a6dd-1f1d30f69dc6" />
4. To access the cron job, input "**crontab -e**". Which should open a note editor in **Vi** or **Nano**
5. Within the editor, input the command "** 10 * * * * sh status_report.sh**". This will ensure the script is executed every tenth minute
6. Save the script ( use the "**wq!**" command for Vi and check online documentation for saving files in other note editors)
7. To check if the script has been saved, run the command "**crontab -l**" to list the available cron jobs
8. For better execution of cron jobs, there are online tools (such as Crontab Guru) which ease the job of time allocation and other functions.

   
