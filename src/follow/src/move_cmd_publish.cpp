#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include "follow/position.h"
int main(int argc, char **argv)
{
        ros::init(argc, argv,"move_cmd");
        ros::NodeHandle nh;
        ros::Publisher pub = nh.advertise<std_msgs::Int32>("/move_cmd", 10);
        ros::Rate loop_rate(10);
        double i = -30;
        while (ros::ok())
        {
                i = i+1;
                std_msgs::Int32 msg;
                msg.data =  i;
                std::cout<<"i:"<<i<<std::endl;
                pub.publish(msg);
                loop_rate.sleep();
                if(i == 2)
                {
                    break;
                    
                }
        }

        return 0;
}
