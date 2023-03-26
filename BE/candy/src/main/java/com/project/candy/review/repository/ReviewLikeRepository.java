package com.project.candy.review.repository;


import com.project.candy.review.entity.Review;
import com.project.candy.review.entity.ReviewLike;
import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * packageName    : com.project.candy.review.repository
 * fileName       : ReviewLikeRepository
 * date           : 2023-03-25
 * description    : Review like 정보를 DB와 통신하는 JPA DATA 인터페이스
 */
public interface ReviewLikeRepository extends JpaRepository<ReviewLike, Long> {

  Optional<ReviewLike> findByUserAndReview(User user, Review review);
}
