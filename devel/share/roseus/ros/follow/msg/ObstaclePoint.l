;; Auto-generated. Do not edit!


(when (boundp 'follow::ObstaclePoint)
  (if (not (find-package "FOLLOW"))
    (make-package "FOLLOW"))
  (shadow 'ObstaclePoint (find-package "FOLLOW")))
(unless (find-package "FOLLOW::OBSTACLEPOINT")
  (make-package "FOLLOW::OBSTACLEPOINT"))

(in-package "ROS")
;;//! \htmlinclude ObstaclePoint.msg.html


(defclass follow::ObstaclePoint
  :super ros::object
  :slots (_timestamp _x0 _y0 _x1 _y1 _x _y _z _angleX _angleY _distance _conf _track_id _label ))

(defmethod follow::ObstaclePoint
  (:init
   (&key
    ((:timestamp __timestamp) 0.0)
    ((:x0 __x0) 0)
    ((:y0 __y0) 0)
    ((:x1 __x1) 0)
    ((:y1 __y1) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:angleX __angleX) 0.0)
    ((:angleY __angleY) 0.0)
    ((:distance __distance) 0.0)
    ((:conf __conf) 0.0)
    ((:track_id __track_id) 0)
    ((:label __label) "")
    )
   (send-super :init)
   (setq _timestamp (float __timestamp))
   (setq _x0 (round __x0))
   (setq _y0 (round __y0))
   (setq _x1 (round __x1))
   (setq _y1 (round __y1))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _angleX (float __angleX))
   (setq _angleY (float __angleY))
   (setq _distance (float __distance))
   (setq _conf (float __conf))
   (setq _track_id (round __track_id))
   (setq _label (string __label))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:x0
   (&optional __x0)
   (if __x0 (setq _x0 __x0)) _x0)
  (:y0
   (&optional __y0)
   (if __y0 (setq _y0 __y0)) _y0)
  (:x1
   (&optional __x1)
   (if __x1 (setq _x1 __x1)) _x1)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:angleX
   (&optional __angleX)
   (if __angleX (setq _angleX __angleX)) _angleX)
  (:angleY
   (&optional __angleY)
   (if __angleY (setq _angleY __angleY)) _angleY)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:track_id
   (&optional __track_id)
   (if __track_id (setq _track_id __track_id)) _track_id)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:serialization-length
   ()
   (+
    ;; float64 _timestamp
    8
    ;; int32 _x0
    4
    ;; int32 _y0
    4
    ;; int32 _x1
    4
    ;; int32 _y1
    4
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _angleX
    8
    ;; float64 _angleY
    8
    ;; float64 _distance
    8
    ;; float64 _conf
    8
    ;; int32 _track_id
    4
    ;; string _label
    4 (length _label)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _timestamp
       (sys::poke _timestamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _x0
       (write-long _x0 s)
     ;; int32 _y0
       (write-long _y0 s)
     ;; int32 _x1
       (write-long _x1 s)
     ;; int32 _y1
       (write-long _y1 s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angleX
       (sys::poke _angleX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angleY
       (sys::poke _angleY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _track_id
       (write-long _track_id s)
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _timestamp
     (setq _timestamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _x0
     (setq _x0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y0
     (setq _y0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x1
     (setq _x1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y1
     (setq _y1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angleX
     (setq _angleX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angleY
     (setq _angleY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _conf
     (setq _conf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _track_id
     (setq _track_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get follow::ObstaclePoint :md5sum-) "035901bda74cc190cb732ad4fef0a1b0")
(setf (get follow::ObstaclePoint :datatype-) "follow/ObstaclePoint")
(setf (get follow::ObstaclePoint :definition-)
      "float64 timestamp
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



(provide :follow/ObstaclePoint "035901bda74cc190cb732ad4fef0a1b0")


