<h2>Example of code</h2>

<pre>
    <div class="container">
        <div class="block two first">
            <h2>Your title</h2>
            <div class="wrap">
            //Your content
            </div>
        </div>
    </div>
</pre>



Click here to return to Amazon Web Services homepage
Contact Us
Support 
English 
My Account 
Sign In 
re:Invent Products Solutions Pricing Documentation Learn Partner Network AWS Marketplace Customer Enablement Events Explore More
How do I install and configure the unified CloudWatch agent to push metrics and logs from my EC2 instance to CloudWatch?
Last updated: 2021-02-01

I want to use the unified Amazon CloudWatch agent to push metrics and logs from my Amazon Elastic Compute Cloud (Amazon EC2) instance to CloudWatch. How can I do this?

Short description
Regardless of your platform (Windows or Linux), the steps to install the unified Amazon CloudWatch agent are the same:

Create an AWS Identity and Access Management (IAM) role to run the CloudWatch agent. Then, attach that IAM role to the EC2 instance.
Download and install the CloudWatch agent.
Create an agent configuration file that specifies the metrics/logs that you plan to push to CloudWatch from your EC2 instance.
Start the CloudWatch agent using the configuration file that you created in step 3.
Resolution
Note: Before you begin, be sure that you established internet connectivity in your EC2 instance. Internet connectivity is necessary to connect your EC2 instance to the required endpoints.

Installing the unified CloudWatch agent (Amazon Linux or Amazon Linux 2)
1.    Create an IAM role to run the CloudWatch agent on your EC2 instance:

      Open the IAM console.
      In the navigation pane, choose Roles.
      Choose Create role.
      For Choose the service that will use this role, choose EC2.
      Choose Next: Permissions.
      In the list of policies, select the CloudWatchAgentServerPolicy check box.
      Choose Next: Tags, and then choose Next: Review.
      For Role name, enter a name for the role, such as CloudWatchAgentServerRole.
      (Optional) Provide a role description.
      Confirm that CloudWatchAgentServerPolicy appears next to Policies.
      Choose Create role.
      Attach this newly created IAM role to the EC2 instance.

2.    Download and install the unified CloudWatch agent on your EC2 instance:

Download:

wget https://s3.<region>.amazonaws.com/amazoncloudwatch-agent-<region>/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
Install:

sudo rpm -U ./amazon-cloudwatch-agent.rpm
3.    Create the agent configuration file.

Note: For simplicity, you can create the agent configuration file using the wizard. Later, you can manually edit the file to add or remove metrics or logs. For more information, see the following section, Tips for completing the agent configuration file wizard.

Run the wizard:

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
4.    Start the CloudWatch agent:

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:configuration-file-path -s
Note: Replace configuration-file-path with the configuration file path that you received in step 3.

Metrics and logs are now pushed to CloudWatch. By default, the agent pushes metrics to NameSpace CWAgent.

Installing the unified CloudWatch agent (Windows)
1.    Follow step 1 above to create an IAM role to run the CloudWatch agent on your EC2 instance.

2.    Download and install the unified CloudWatch agent on your EC2 instance:

Download:

https://s3.<region>.amazonaws.com/amazoncloudwatch-agent-<region>/windows/amd64/latest/amazon-cloudwatch-agent.msi
Move to the directory containing the package, and then enter the following:

msiexec /i amazon-cloudwatch-agent.msi
3.    Create the agent configuration file:

Note: For simplicity, you can create the agent configuration file using the wizard. Later, you can manually edit the file to add or remove metrics or logs. See "Tips for completing the agent configuration file wizard" below.

cd "C:\Program Files\Amazon\AmazonCloudWatchAgent"
amazon-cloudwatch-agent-config-wizard.exe
By default, the wizard creates the agent configuration file in the following location: C:\Program Files\Amazon\AmazonCloudWatchAgent\config.json.

4.    Start the CloudWatch agent. Enter the following in PowerShell as an administrator:

& $Env:ProgramFiles\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1 -a fetch-config -m ec2 -c file:<configuration-file-path> -s      
Example command:

& $Env:ProgramFiles\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1 -a fetch-config -m ec2 -c file:'C:\Program Files\Amazon\AmazonCloudWatchAgent\config.json' -s
Metrics and logs are now pushed to CloudWatch. By default, the agent pushes metrics to NameSpace CWAgent.

Tips for configuring the agent configuration file wizard
Do you want to turn on StatsD daemon? and Do you want to monitor metrics from CollectD? – Only choose Yes for these questions if you have the StatsD and CollectD plugins installed on your EC2 instance.
Which default metrics configuration do you want? – For more information on the different detail levels, see CloudWatch Agent predefined metric sets. Then, choose the option that's best for your use case.
Do you have an existing CloudWatch Logs Agent configuration file to import for migration? – This question is asking whether you already have the awslogs agent installed and running. If you do, the wizard reads the awslogs agent configuration file (/etc/awslogs/awslogs.conf or /var/awslogs/etc/awslogs.conf) to determine the log files you need to monitor.
Do you want to store the configuration in the SSM Parameter Store? – Choose Yes if you want to store this agent configuration file in the SSM Parameter Store so that you can reuse the file later. Important: The command for starting the agent varies when the agent configuration file is stored in the SSM Parameter Store.
When you complete the wizard, the agent configuration file is stored in /opt/aws/amazon-cloudwatch-agent/bin/config.json by default. You can manually edit this file to add or remove metrics or logs.
Starting and stopping the CloudWatch agent
For steps on starting and stopping the CloudWatch agent in Linux and Windows, see Stopping and restarting the CloudWatch Agent.

Note: When modifying the agent configuration file, start the agent using the fetch-config command to be sure that the agent reflects your changes.

Did this article help?

Do you need billing or technical support?
Learn About AWS
What Is AWS?
What Is Cloud Computing?
AWS Inclusion, Diversity & Equity
What Is DevOps?
What Is a Container?
What Is a Data Lake?
AWS Cloud Security
What's New
Blogs
Press Releases
Resources for AWS
Getting Started
Training and Certification
AWS Solutions Portfolio
Architecture Center
Product and Technical FAQs
Analyst Reports
AWS Partner Network
Developers on AWS
Developer Center
SDKs & Tools
.NET on AWS
Python on AWS
Java on AWS
PHP on AWS
JavaScript on AWS
Help
Contact Us
AWS Careers
File a Support Ticket
Knowledge Center
AWS re:Post
AWS Support Overview
Legal
Amazon is an Equal Opportunity Employer: Minority / Women / Disability / Veteran / Gender Identity / Sexual Orientation / Age.
Language عربي Bahasa Indonesia Deutsch English Español Français Italiano Português Tiếng Việt Türkçe Ρусский ไทย 日本語 한국어 中文 (简体) 中文 (繁體)
Privacy | Site Terms | Cookie Preferences | © 2022, Amazon Web Services, Inc. or its affiliates. All rights reserved.