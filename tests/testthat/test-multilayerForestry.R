test_that("Tests that multilayerForestry is working correctly", {
  x <- iris[, -1]
  y <- iris[, 1]

  context('MultilayerForestry base function')
  # Set seed for reproductivity
  set.seed(24750371)

  # Test forestry (mimic RF)
  forest <- multilayerForestry(
    x,
    y,
    ntree = 500,
    nrounds = 2,
    replace = TRUE,
    sample.fraction = .8,
    mtry = 3,
    nodesizeStrictSpl = 5,
    maxDepth = 4,
    nthread = 2,
    splitrule = "variance",
    splitratio = 1,
    nodesizeStrictAvg = 5
  )
  # Test predict
  y_pred <- predict(forest, x)

  # Mean Square Error
  sum((y_pred - y) ^ 2)
  expect_equal(sum((y_pred - y) ^ 2), 34.6, tolerance = 1e-2)
})
