;; Auto-generated. Do not edit!


(when (boundp 'follow::ObstaclePointList)
  (if (not (find-package "FOLLOW"))
    (make-package "FOLLOW"))
  (shadow 'ObstaclePointList (find-package "FOLLOW")))
(unless (find-package "FOLLOW::OBSTACLEPOINTLIST")
  (make-package "FOLLOW::OBSTACLEPOINTLIST"))

(in-package "ROS")
;;//! \htmlinclude ObstaclePointList.msg.html


(defclass follow::ObstaclePointList
  :super ros::object
  :slots (_timestamp _ObstaclePointList ))

(defmethod follow::ObstaclePointList
  (:init
   (&key
    ((:timestamp __timestamp) 0.0)
    ((:ObstaclePointList __ObstaclePointList) (let (r) (dotimes (i 0) (push (instance follow::ObstaclePoint :init) r)) r))
    )
   (send-super :init)
   (setq _timestamp (float __timestamp))
   (setq _ObstaclePointList __ObstaclePointList)
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:ObstaclePointList
   (&rest __ObstaclePointList)
   (if (keywordp (car __ObstaclePointList))
       (send* _ObstaclePointList __ObstaclePointList)
     (progn
       (if __ObstaclePointList (setq _ObstaclePointList (car __ObstaclePointList)))
       _ObstaclePointList)))
  (:serialization-length
   ()
   (+
    ;; float64 _timestamp
    8
    ;; follow/ObstaclePoint[] _ObstaclePointList
    (apply #'+ (send-all _ObstaclePointList :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _timestamp
       (sys::poke _timestamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; follow/ObstaclePoint[] _ObstaclePointList
     (write-long (length _ObstaclePointList) s)
     (dolist (elem _ObstaclePointList)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _timestamp
     (setq _timestamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; follow/ObstaclePoint[] _ObstaclePointList
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ObstaclePointList (let (r) (dotimes (i n) (push (instance follow::ObstaclePoint :init) r)) r))
     (dolist (elem- _ObstaclePointList)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get follow::ObstaclePointList :md5sum-) "87fcf6663b8f89f10382199b0742a8f1")
(setf (get follow::ObstaclePointList :datatype-) "follow/ObstaclePointList")
(setf (get follow::ObstaclePointList :definition-)
      "float64 timestamp
ObstaclePoint[] ObstaclePointList
================================================================================
MSG: follow/ObstaclePoint
float64 timestamp
int32 x0
int32 y0
int32 x1
int32 y1
float64 x
float64 y
float64 z
float64 angleX
float64 angleY
float64 distance
float64 conf
int32 track_id
string label
")



(provide :follow/ObstaclePointList "87fcf6663b8f89f10382199b0742a8f1")


