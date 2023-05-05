#include "follow.h"
#include <cmath>
#include <iostream>
#include "mpc_osqp.h"
#include <algorithm>
void RobotDogFollow::positionUpdateCallback(const follow::position::ConstPtr& msg )
{
        

        double x_error = 1.0;
        double y_error = 1.0;
        double heading_error = 0.1;
        double speed_reference = 1.0;
        double target_heading = 0.2;
        double ts_ = 0.01;
        double wheelbase_ = 2.8;
        double steer_feedforward = 0.0;


        mpc_eps_ = 0.01;
        mpc_max_iteration_ = 1500;
	    matrix_state_(0, 0) =- x_error;
	    matrix_state_(1, 0) =- y_error;
	    matrix_state_(2, 0) = heading_error;

	    reference_state <<0.0, 0.0, 0.0;

	    matrix_ad_ << 1, 0, -speed_reference * sin(target_heading) * ts_, 0, 1, speed_reference * cos(target_heading) * ts_, 0, 0, 1;
	    matrix_bd_ << cos(target_heading) * ts_, 0, sin(target_heading) * ts_, 0, tan(target_heading) / wheelbase_ * ts_, speed_reference / (wheelbase_ * cos(steer_feedforward) * cos(steer_feedforward)) * ts_;

	    matrix_q_ << 5.0, 0, 0, 0, 5.0, 0, 0, 0, 5.0;
	    matrix_r_ << 1.0, 0, 0, 1.0;

	    lower_bound << -10.0, -0.5066;
	    upper_bound << 10.0, 0.5066;

	    const double max = std::numeric_limits<float>::max();
        lower_state_bound << -1.0 * max, -1.0 * max, -1.0 * M_PI;
	    upper_state_bound << max, max, M_PI;
    
	    std::vector<double> control_cmd(Nu, 0);

	    MpcOsqp  mpc_osqp(matrix_ad_, matrix_bd_, matrix_q_, matrix_r_,
                   matrix_state_, lower_bound, upper_bound, lower_state_bound,
                   upper_state_bound, reference_state, mpc_max_iteration_,
                   horizon_, mpc_eps_);

      if (!mpc_osqp.Solve(&control_cmd)) {
	    // AERROR << "MPC OSQP solver failed";
      } else {
	    // ADEBUG << "MPC OSQP problem solved! ";
        control_matrix(0, 0) = control_cmd.at(0);
        control_matrix(1, 0) = control_cmd.at(1);
      }

}


int main(int argc, char **argv)

{
    ros::init(argc, argv,"follow");
    ros::NodeHandle nh; 
    RobotDogFollow robot_dog_follow;
    robot_dog_follow.positionSubscriber = nh.subscribe("/obstacle/points", 10, &RobotDogFollow::positionUpdateCallback, &robot_dog_follow); 
    // robot_dog_follow.cmd_sub = nh.subscribe("/move_cmd", 10, &RobotDogFollow::cmdMoveCallback, &robot_dog_follow);
    // robot_dog_follow.cmdVelPublisher = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 10);
    ros::spin(); 

    return 0;

}