cmake_minimum_required(VERSION 3.0.2)
project(camera_driver)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS roscpp std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

# 如果有源代码文件，添加以下内容：
# add_executable(${PROJECT_NAME}_node src/camera_driver_node.cpp)
# target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES}) 