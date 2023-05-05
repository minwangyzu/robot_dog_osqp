#include <vector>
#include "ros/ros.h"
#include "follow/ObstaclePoint.h"
#include "follow/ObstaclePointList.h"
#include "follow/position.h"
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Vector3.h>
#include <sensor_msgs/Joy.h>
#include <sensor_msgs/LaserScan.h>
#include <tf/transform_datatypes.h>
#include <geometry_msgs/PoseStamped.h>
#include <Eigen/Core>
#include <Eigen/Eigen>//MPC
#include <Eigen/Dense>//MPC
#include <Eigen/Geometry>//MPC
#include <Eigen/Eigenvalues>//MPC

using namespace Eigen;
using Matrix = Eigen::MatrixXd;
using namespace std;
class RobotDogFollow
{
public:
    RobotDogFollow(){} ;
    ~RobotDogFollow(){};
    
    ros::Subscriber positionSubscriber;
    ros::Publisher cmdVelPublisher;
    ros::Subscriber cmd_sub;
    geometry_msgs::Twist velocity;
    geometry_msgs::Vector3 linear;
    geometry_msgs::Vector3 angular;
    double Distance_kp = 0.1;
    double Distance_ki = 0.1;
    double Distance_kd = 0.0;
    double AngleX_kp = 0.1;
    double AngleX_ki = 0.1;
    double AngleX_kd = 0.0;
    double target_Distance = 1.0;
    double target_AngleX =0.0;
    double AngleX;
    double Distance;
    double dt = 0.1;

    int32_t move_cmd;
    struct struct_position
    {
        double s_anglex;
        double s_distance;
    };

    int  Np=5;             //预测时域
	int  Nc=3;              //控制时域
	int  Nx=3;              //状态变量
	int  Nu=2;              //控制变量
    int mpc_max_iteration_ = 0;
    const int horizon_ = 10; 
    double mpc_eps_ = 0.0;
  
    MatrixXd control_matrix = MatrixXd::Zero(Nu, 1);
    MatrixXd matrix_ad_ = MatrixXd::Zero(Nx, Nx);
	MatrixXd matrix_bd_ = MatrixXd::Zero(Nx, Nu);
    MatrixXd  matrix_state_ = MatrixXd::Zero(Nx, 1);
    MatrixXd reference_state = MatrixXd::Zero(Nx, 1);
    MatrixXd  matrix_q_ = MatrixXd::Zero(Nx,Nx);
    MatrixXd  matrix_r_ = MatrixXd::Zero(Nu, Nu);
    MatrixXd lower_bound = MatrixXd::Zero(Nu, 1);
    MatrixXd upper_bound = MatrixXd::Zero(Nu, 1);
    MatrixXd lower_state_bound = MatrixXd::Zero(Nx, 1);
    MatrixXd upper_state_bound = MatrixXd::Zero(Nx, 1);

    vector<struct_position> vector_position;//vector每次初始化时需要清空
    void positionUpdateCallback(const follow::position::ConstPtr& msg );
    void cmdMoveCallback(const std_msgs::Int32::ConstPtr& msg);
    void compute_linear_velocity_and_angle_velocity();
    double pid_controller(double kp, double ki, double kd, double error);
};