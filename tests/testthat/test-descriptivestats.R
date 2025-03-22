


df <- data.frame(cyl=c(4,6,8),
                 avg=c(26.7,19.7,15.1))


object <- descriptivestats(mtcars, rlang::exprs(cyl), mpg)

test_that("multiplication works", {
  expect_equal(object, df)
  expect_s3_class(object, 'data.frame')
})
