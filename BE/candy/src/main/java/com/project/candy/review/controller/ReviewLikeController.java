package com.project.candy.review.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.project.candy.review.controller
 * fileName       : ReviewLikeController
 * date           : 2023-03-25
 * description    : ReviewLike 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/review-like")
@RequiredArgsConstructor
public class ReviewLikeController {

  @PostMapping("/{beer-id}")
  public ResponseEntity<?> createLikeBeer(
          @PathVariable(name = "review-id") Long reviewId, @RequestHeader(value = "email") String userEmail) {
//    likesService.createLikeBeer(beerId, userEmail);
    return new ResponseEntity<>(HttpStatus.CREATED);
  }

  @DeleteMapping("/{review-id}")
  public ResponseEntity<?> deleteLikeBeer(
          @PathVariable(name = "review-id") Long reviewId, @RequestHeader(value = "email") String userEmail) {
//    likesService.deleteLikeBeer(beerId, userEmail);
    return new ResponseEntity<>(HttpStatus.OK);
  }
}
