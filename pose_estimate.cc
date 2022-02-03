//
// Created by yyh on 2022/1/28.
//

#include "pose_estimate.h"
namespace sfmProject {
template <typename T>
bool pose_estimate::PnPCeres::operator()(const T *const camera,
                                         T *residual) const {
  T p[3];
  T point[3];
  point[0] = T(_xyz.x);
  point[1] = T(_xyz.y);
  point[2] = T(_xyz.z);
  AngleAxisRotatePoint(camera, point, p);  //计算RP
  p[0] += camera[3];
  p[1] += camera[4];
  p[2] += camera[5];
  T xp = p[0] / p[2];
  T yp = p[1] / p[2];  // xp,yp是归一化坐标，深度为p[2]
  T u_ = xp * K.at<double>(0, 0) + K.at<double>(0, 2);
  T v_ = yp * K.at<double>(1, 1) + K.at<double>(1, 2);
  residual[0] = T(_uv.x) - u_;
  residual[1] = T(_uv.y) - v_;
  return true;
}
ceres::CostFunction *pose_estimate::PnPCeres::Create(const cv::Point2f &uv,
                                                     const cv::Point3f &xyz) {
  return (
      new ceres::AutoDiffCostFunction<PnPCeres, 2, 6>(new PnPCeres(uv, xyz)));
}
void pose_estimate::constructProblem() {
  for (int i = 0; i < pts_2d.size();
       ++i)  // add residualblock based on the number of 2d point
  {
    ceres::CostFunction *cost_function = PnPCeres::Create(pts_2d[i], pts_3d[i]);
    problem.AddResidualBlock(cost_function, NULL /* squared loss */, camera);
  }
}
void pose_estimate::solveBA() {
  options.linear_solver_type = ceres::DENSE_SCHUR;
  options.minimizer_progress_to_stdout = true;

  ceres::Solve(options, &problem, &summary);
  std::cout << summary.FullReport() << "\n";
  cv::Mat R_vec = (cv::Mat_<double>(3, 1) << camera[0], camera[1],
                   camera[2]);  //数组转cv向量
  cv::Mat R_cvest;
  Rodrigues(R_vec, R_cvest);  //罗德里格斯公式，旋转向量转旋转矩阵
  std::cout << "R_cvest=" << R_cvest << std::endl;
  Eigen::Matrix3d R_est;
  cv::cv2eigen(R_cvest, R_est);  // cv矩阵转eigen矩阵
  std::cout << "R_est=" << R_est << std::endl;
  Eigen::Vector3d t_est(camera[3], camera[4], camera[5]);
  std::cout << "t_est=" << t_est << std::endl;
  Eigen::Isometry3d T(R_est);  //构造变换矩阵与输出
  T.pretranslate(t_est);
  std::cout << T.matrix() << std::endl;
}

void pose_estimate::pose_estimation_2d2d(detect_points points,
                                         std::vector<cv::Mat> &R,
                                         std::vector<cv::Mat> &t) {
  int focal_length = 521;
  int image_number = points.get_image_number();
  cv::Mat fundamental_matrix;
  cv::Mat essential_matrix;
  cv::Mat homography_matrix;

  std::vector<cv::Point2f> first_image_points;
  std::vector<cv::Point2f> now_image_points;
  cv::Point2d principal_point(640, 360);

  points.copy_key_points(first_image_points, 0);

  for (int i = 1; i < image_number; ++i) {
    points.copy_key_points(now_image_points, i);
    fundamental_matrix = cv::findFundamentalMat(
        first_image_points, now_image_points, cv::FM_8POINT);
    essential_matrix =
        cv::findEssentialMat(first_image_points, now_image_points, focal_length,
                             principal_point, cv::RANSAC);
    cv::recoverPose(essential_matrix, first_image_points, now_image_points,
                    R[i], t[i], focal_length, principal_point);
  }
}
}  // namespace sfmProject