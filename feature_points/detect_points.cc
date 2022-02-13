//
// Created by dcr on 2022/1/23.
//

#include "detect_points.h"

#include <functional>
#include <utility>

namespace sfmProject {

// cv::Point2d pixel2cam(const cv::Point2d &p, cv::Mat K) {
//   return cv::Point2d((p.x - K.at<double>(0, 2)) / K.at<double>(0, 0),
//                      (p.y - K.at<double>(1, 2)) / K.at<double>(1, 1));
// }

detect_points::detect_points(std::vector<cv::Mat> &input_images) {
  std::copy(input_images.begin(), input_images.end(), images.begin());
  image_number = input_images.size();
  key_points.resize(image_number);
  descriptors.resize(image_number);
  matches.resize(image_number);
  good_matches.resize(image_number);
}

detect_points::detect_points(const std::string &location) {
  // Linux edition
  cv::Ptr<cv::ORB> orb =
      cv::ORB::create(500, 1.2f, 8, 31, 0, 2, cv::ORB::HARRIS_SCORE, 31, 20);
  DIR *pDir;
  struct dirent *ptr;

  if (!(pDir = opendir(location.c_str()))) {
    std::cout << "the root is " << location << std::endl;
    std::cout << "can not get the file ptr , check the dir location";
    return;
  }

  cv::Mat temp;
  cv::Mat temp_descriptors;
  std::vector<cv::KeyPoint> temp_key_points;

  while ((ptr = readdir(pDir)) != nullptr) {
    // 这里我理解他的指针应该是自动会指向到下一个文件，所以不用写指针的移动
    std::string sub_file =
        location + "/" + ptr->d_name;  // 当前指针指向的文件名
    if (ptr->d_type != 8 &&
        ptr->d_type !=
            4) {  // 递归出口，当不是普通文件（8）和文件夹（4）时退出递归
      return;
    }

    // 普通文件直接加入到files
    if (ptr->d_type == 8) {
      // 相当于将命令下使用ls展示出来的文件中除了. 和 ..全部保存在files中
      // 当然下面可以写各种字符串的筛选逻辑，比如只要后缀有.jpg图片
      if (strcmp(ptr->d_name, ".") != 0 && strcmp(ptr->d_name, "..") != 0) {
        if (strstr(ptr->d_name, ".png")) {
          temp = cv::imread(location + ptr->d_name);
          orb->detect(temp, temp_key_points);
          if (temp_key_points.size() >= 8) {
            std::cout << ptr->d_name << std::endl;
            images.push_back(temp);
            key_points.push_back(temp_key_points);

            orb->compute(images.back(), key_points.back(), temp_descriptors);
            descriptors.push_back(temp_descriptors);
          }
        }
      }
    }
  }
  begin_image = images.begin()->clone();
  orb->detect(begin_image, begin_image_key_points);
  orb->compute(begin_image, begin_image_key_points, begin_image_descriptors);
  image_number = images.size();
  key_points.resize(image_number);
  descriptors.resize(image_number);
  matches.resize(image_number);
  good_matches.resize(image_number);
  std::cout << "have successfully read " << images.size() << " images"
            << std::endl;
  // 关闭根目录
  std::cout << "test: " << images.front().size << std::endl;
  closedir(pDir);

  // windows edition
  /*intptr_t file_handle = 0;
  _finddata32_t file_infor{};
  cv::Mat temp;
  char *file_path = new char[location.size() + 1];
  strcpy_s(file_path, location.size() + 1, location.c_str());
  std::string target(location, 0, location.size() - 5);
  file_handle = _findfirst32(file_path, &file_infor);

  if (file_handle == -1) {
      std::cout << "error occurred!!! can not find the target file" <<
  std::endl; } else { begin_image = cv::imread(target + file_infor.name);
      cv::Ptr<cv::ORB> orb = cv::ORB::create(500, 1.2f, 8, 31, 0, 2,
  cv::ORB::HARRIS_SCORE, 31, 20); orb->detect(begin_image,
  begin_image_key_points); orb->compute(begin_image, begin_image_key_points,
  begin_image_descriptors); while (_findnext32(file_handle, &file_infor) != -1)
  { temp = cv::imread(target + file_infor.name); images.push_back(temp);
      }
      _findclose(file_handle);
  }*/
}
/**
 *
 * @param i
 */
void detect_points::find_feature_points(
    std::list<cv::Mat>::iterator now_image) {
  cv::Ptr<cv::ORB> orb =
      cv::ORB::create(500, 1.2f, 8, 31, 0, 2, cv::ORB::HARRIS_SCORE, 31, 20);

  cv::Mat temp_descriptor;
  std::vector<cv::KeyPoint> temp_key_points;
  orb->detect(*now_image, temp_key_points);
  orb->compute(*now_image, temp_key_points, temp_descriptor);

  key_points.push_back(temp_key_points);
  descriptors.push_back(temp_descriptor);
}

/**
 *
 * @param i
 */
void detect_points::matchFeaturePoints(
    std::list<cv::Mat>::iterator image_descriptors,
    std::list<std::vector<cv::DMatch>>::iterator image_match) {
  const float min_ratio = 1.f / 1.5f;
  cv::BFMatcher matcher(cv::NORM_HAMMING, false);
  std::vector<std::vector<cv::DMatch>> temp_matches;

  matcher.knnMatch(begin_image_descriptors, *image_descriptors, temp_matches,
                   2);

  for (auto &temp_match : temp_matches) {
    const cv::DMatch b_match0 = temp_match[0];
    const cv::DMatch b_match1 = temp_match[1];

    if (b_match0.distance / b_match1.distance < min_ratio) {
      image_match->push_back(b_match0);
    }
  }
  if (image_match->size() < 8) {
    std::cout << "This is less than 8" << std::endl;
  }
}

unsigned int detect_points::get_image_number() const { return image_number; }

/**
 *
 * @param points1
 * @param points2
 * @param image_index
 */
void detect_points::copy_key_points(
    std::vector<cv::Point2f> &points1, std::vector<cv::Point2f> &points2,
    std::list<std::vector<cv::DMatch>>::iterator now_match,
    std::list<std::vector<cv::KeyPoint>>::iterator now_key_points) {
  points1.clear();
  points2.clear();
  for (int i = 0; i < (int)now_match->size(); ++i) {
    points1.push_back(begin_image_key_points[(*now_match)[i].queryIdx].pt);
    points2.push_back((*now_key_points)[(*now_match)[i].trainIdx].pt);
  }
}

void pose_estimation_2d2d(
    detect_points &points, cv::Mat &R, cv::Mat &t,
    std::list<std::vector<cv::KeyPoint>>::iterator now_key_points,
    std::list<cv::Mat>::iterator now_descriptors,
    std::list<std::vector<cv::DMatch>>::iterator now_matches) {
  double focal_length = 951.432;
  //        cv::Mat fundamental_matrix;
  cv::Mat essential_matrix;
  //        cv::Mat homography_matrix;

  std::vector<cv::Point2f> first_image_points;
  std::vector<cv::Point2f> now_image_points;
  cv::Point2d principal_point(966.617, 532.934);

  points.copy_key_points(first_image_points, now_image_points, now_matches,
                         now_key_points);
  essential_matrix =
      cv::findEssentialMat(first_image_points, now_image_points, focal_length,
                           principal_point, cv::RANSAC);
  cv::recoverPose(essential_matrix, first_image_points, now_image_points, R, t,
                  focal_length, principal_point);
  // verify the R and t
  /*for (int j = 0; j < points.matches[i].size(); ++j) {
    cv::Mat t_x = (cv::Mat_<double>(3, 3) << 0, t[i].at<double>(2, 0),
                   t[i].at<double>(1, 0), t[i].at<double>(2, 0), 0,
                   -t[i].at<double>(0, 0), -t[i].at<double>(1, 0),
                   t[i].at<double>(0, 0), 0);
    cv::Point2d point1 =
        pixel2cam(points.key_points[0][points.matches[i][j].queryIdx].pt, k);
    cv::Point2d point2 =
        pixel2cam(points.key_points[i][points.matches[i][j].trainIdx].pt, k);
    cv::Mat y1 = (cv::Mat_<double>(3, 1) << point1.x, point1.y, 1);
    cv::Mat y2 = (cv::Mat_<double>(3, 1) << point2.x, point2.y, 1);
    cv::Mat d = y2.t() * t_x * R[i] * y1;
  }*/
}

void detect_points::test_function() { cv::Mat outImage; }

void fuc(detect_points &points, std::vector<cv::Mat> &R,
         std::vector<cv::Mat> &t, std::list<cv::Mat>::iterator now_image,
         std::list<std::vector<cv::KeyPoint>>::iterator now_key_points,
         std::list<cv::Mat>::iterator now_descriptors,
         std::list<std::vector<cv::DMatch>>::iterator now_match) {
  points.find_feature_points(now_image);
  points.matchFeaturePoints(now_image, now_match);
  //  pose_estimation_2d2d(points, R[i], t[i], i);
}

void get_R_t(detect_points &points, std::vector<cv::Mat> &R,
             std::vector<cv::Mat> &t) {
  std::vector<std::thread> all_threads;
  std::vector<std::thread> threads;

  auto now_image = points.images.begin();
  auto now_key_points = points.key_points.begin();
  auto now_descriptors = points.descriptors.begin();
  auto now_matches = points.matches.begin();

  for (; now_image != points.images.end();
       ++now_image, ++now_key_points, ++now_descriptors, ++now_matches) {
    all_threads.push_back(std::thread{
        fuc,
        std::ref(points),
        std::ref(R),
        std::ref(t),
        now_image,
        now_key_points,
        now_descriptors,
        now_matches,
    });
  }
  std::for_each(all_threads.begin(), all_threads.end(),
                std::mem_fn(&std::thread::join));

  for (; now_image != points.images.end();
       ++now_image, ++now_key_points, ++now_descriptors, ++now_matches) {
    if (now_matches->size() < 8) {
      now_image = points.images.erase(now_image);
      now_key_points = points.key_points.erase(now_key_points);
      now_descriptors = points.descriptors.erase(now_descriptors);
      now_matches = points.matches.erase(now_matches);

      continue;
    }
  }

  now_image = points.images.begin();
  now_key_points = points.key_points.begin();
  now_descriptors = points.descriptors.begin();
  now_matches = points.matches.begin();
}

}  // namespace sfmProject