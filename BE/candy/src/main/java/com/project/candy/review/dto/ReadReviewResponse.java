package com.project.candy.review.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.review.dto fileName       : ReadAllReviewRequest date
 * : 2023-03-23 description    : ReadAllReview 시에 프론트엔드로 전달하는 객체 타입
 */
@Getter
@NoArgsConstructor
public class ReadReviewResponse {

  String user_name;
  float overall;
  String profile_image;
  String contents;

}
