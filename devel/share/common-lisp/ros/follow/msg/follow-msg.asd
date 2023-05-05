
(cl:in-package :asdf)

(defsystem "follow-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ObstaclePoint" :depends-on ("_package_ObstaclePoint"))
    (:file "_package_ObstaclePoint" :depends-on ("_package"))
    (:file "ObstaclePointList" :depends-on ("_package_ObstaclePointList"))
    (:file "_package_ObstaclePointList" :depends-on ("_package"))
    (:file "position" :depends-on ("_package_position"))
    (:file "_package_position" :depends-on ("_package"))
  ))