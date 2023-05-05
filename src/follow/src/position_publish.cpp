#include <ros/ros.h>
#include <std_msgs/String.h>
#include "follow/position.h"
int main(int argc, char **argv)
{
        ros::init(argc, argv,"position");
        ros::NodeHandle nh;
        ros::Publisher pub = nh.advertise<follow::position>("/obstacle/points", 10);
        ros::Rate loop_rate(10);
        double i = 0;
        while (ros::ok())
        {
                i = i+1;
                follow::position msg;
                msg.angleX =  i;
                msg.distance = 1 + i;
                pub.publish(msg);
                std::cout<<"i:"<<i<<std::endl;
                loop_rate.sleep();
        }

        return 0;
}
