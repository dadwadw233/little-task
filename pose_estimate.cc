//
// Created by yyh on 2022/1/28.
//

#include "pose_estimate.h"
namespace sfmProject {

pose_estimate::pose_estimate() {}
pose_estimate::~pose_estimate() {}
void pose_estimate::initialize() {}

/**
 * the module to compute the residual
 * @tparam T
 * @param camera
 * @param residual
 * @return
 */
template <typename T>

bool pose_estimate::PnPCeres::operator()(const T *const camera,
                                         T *residual) const {
  T p[3];
  T point[3];
  point[0] = T(_xyz.x);
  point[1] = T(_xyz.y);
  point[2] = T(_xyz.z);
  ceres::AngleAxisRotatePoint(camera, point, p);  // compute RP
  p[0] += camera[3];
  p[1] += camera[4];
  p[2] += camera[5];
  T xp = p[0] / p[2];
  T yp = p[1] / p[2];  //
  T u_ = xp * K.at<double>(0, 0) + K.at<double>(0, 2);
  T v_ = yp * K.at<double>(1, 1) + K.at<double>(1, 2);
  residual[0] = T(_uv.x) - u_;
  residual[1] = T(_uv.y) - v_;
  return true;
}

/**
 * Create a residual block
 * @param uv
 * @param xyz
 * @return
 */
ceres::CostFunction *pose_estimate::PnPCeres::Create(const cv::Point2f &uv,
                                                     const cv::Point3f &xyz) {
  return (
      new ceres::AutoDiffCostFunction<PnPCeres, 2, 6>(new PnPCeres(uv, xyz)));
}

/**
 * build the BA problem
 */
void pose_estimate::constructProblem() {
  // add residual blocks based on the number of 2d point
  for (int i = 0; i < pts_2d.size(); ++i) {
    ceres::CostFunction *cost_function = PnPCeres::Create(pts_2d[i], pts_3d[i]);
    problem.AddResidualBlock(cost_function, NULL /* squared loss */, camera);
  }
}

/**
 * solve the BA problem
 */
void pose_estimate::solveBA() {
  options.linear_solver_type = ceres::DENSE_SCHUR;
  options.minimizer_progress_to_stdout = true;

  ceres::Solve(options, &problem, &summary);
  std::cout << summary.FullReport() << "\n";
  cv::Mat R_vec = (cv::Mat_<double>(3, 1) << camera[0], camera[1],
                   camera[2]);  //
  cv::Mat R_cvest;
  Rodrigues(R_vec, R_cvest);  //
  std::cout << "R_cvest=" << R_cvest << std::endl;
  Eigen::Matrix3d R_est;
  cv::cv2eigen(R_cvest, R_est);  //
  std::cout << "R_est=" << R_est << std::endl;
  Eigen::Vector3d t_est(camera[3], camera[4], camera[5]);
  std::cout << "t_est=" << t_est << std::endl;
  Eigen::Isometry3d T(R_est);  //
  T.pretranslate(t_est);
  std::cout << T.matrix() << std::endl;
}
void pose_estimate::poseGeneration(const std::vector<cv::Mat> R,
                                   const std::vector<cv::Mat> t) {
  cv::Mat initLoc(3, 1, CV_64F);
  cv::Mat initOrientation(3, 1, CV_64F);
  for (auto i = 0; i < initLoc.rows; i++) {
    initLoc.at<float>(i, 0) = 0;
  }
  for (auto i = 0; i < initOrientation.rows; i++) {
    initOrientation.at<float>(i, 0) = (i == 0) ? 1 : 0;
  }
  std::pair<cv::Mat, cv::Mat> initPoint(initLoc, initOrientation);
  this->poseList.push_back(initPoint);
  for (size_t i = 1; i < R.size(); i++) {
    cv::Mat nL = initLoc + t[i];
    cv::Mat nO = R[i] * initOrientation;
    std::pair<cv::Mat, cv::Mat> nextPoint(nL, nO);
    this->poseList.push_back(nextPoint);
    std::cout << nL << " " << nO << std::endl;
  }
  return;
}

void pose_estimate::pcGeneration(
    const std::vector<std::vector<cv::KeyPoint>> keyPoints) {
  for(auto i = 0;i<keyPoints.size();i++){
    for(auto j = 0;j<keyPoints[i].size();j++){
      pcl::PointXYZ point;
    }
  }
}
void pose_estimate::poseViewer() {
  for(auto i = 0; i<this->poseList.size();i++){
    pcl::PointXYZ point;
    point.x = poseList[i].first.at<float>(0,0);
    point.y = poseList[i].first.at<float>(1,0);
    point.z = poseList[i].first.at<float>(2,0);
    this->poseCloud->points.push_back(point);
  }
}
}  // namespace sfmProject
