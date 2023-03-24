package com.project.candy.review.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.review.dto.CreateReviewRequest;
import com.project.candy.review.dto.ReadReviewResponse;
import com.project.candy.review.entity.Review;
import com.project.candy.review.repository.ReviewRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.review.service fileName       : ReviewServiceImpl date :
 * 2023-03-22 description    : Review 정보를 다루는 Service의 구현체
 */
@Service
@Transactional(readOnly = true)
@Slf4j
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

  private final BeerRepository beerRepository;
  private final UserRepository userRepository;
  private final ReviewRepository reviewRepository;

  @Override
  @Transactional
  public void CreateReview(long beerId, CreateReviewRequest createReviewRequest) {
    Beer beer = beerRepository.findById(beerId)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

    User user = userRepository.findByEmail(createReviewRequest.getUserEmail())
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    Review review = Review.create(user, beer, createReviewRequest);

    reviewRepository.save(review);
  }

  @Override
  public List<ReadReviewResponse> ReadAllReview(long beerId) {
    Beer beer = beerRepository.findById(beerId)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

    // 리뷰 리스트를 가져와서
    List<ReadReviewResponse> reviewList =reviewRepository.findAllByBeer(beer).stream().map(review -> {
      long userId=review.getUser().getId();
      User user=userRepository.findById(userId)
          .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

      ReadReviewResponse response=ReadReviewResponse.bu
    });

    List<ReadReviewResponse> response=new ArrayList<>();



    return reviewList;
  }


}
