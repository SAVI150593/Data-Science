length(trainm)
length(train_label)
train_matrix <- xgb.DMatrix(data = as.matrix(trainm), label = train_label)


testm <- sparse.model.matrix(test$target~.-1, data = test)
test_label <- test[,"target"]
test_matrix <- xgb.DMatrix(data = as.matrix(testm), label = test_label)


nc <- length(unique(train_label))
xgb_params <- list("objective" = "multi:softprob",
                   "eval_metric" = "mlogloss",
                   "num_class" = nc)
watchlist <- list(train = train_matrix, test = test_matrix)

# eXtreme Gradient Boosting Model
bst_model <- xgb.train(
  data = train_matrix,
  nrounds = 100,
  watchlist = watchlist,
  eta = 0.001,
  max.depth = 3,
  eval_metric = "merror",
  objective = "multi:softprob",
  num_class = 12,
  nthread = 3
)

# Training & test error plot
e <- data.frame(bst_model$evaluation_log)
plot(e$iter, e$train_mlogloss, col = 'blue')
lines(e$iter, e$test_mlogloss, col = 'red')

min(e$test_mlogloss)
e[e$test_mlogloss == 0.625217,]

# Feature importance
imp <- xgb.importance(colnames(train_matrix), model = bst_model)
print(imp)
xgb.plot.importance(imp)

# Prediction & confusion matrix - test data
p <- predict(bst_model, newdata = test_matrix)
pred <- matrix(p, nrow = nc, ncol = length(p)/nc) %>%
  t() %>%
  data.frame() %>%
  mutate(label = test_label, max_prob = max.col(., "last")-1)
table(Prediction = pred$max_prob, Actual = pred$label)