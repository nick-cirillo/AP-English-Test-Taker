function features = featurize(text)
%text is unprocessed
%this will transform it into a feature vectorize

  % Extract Features

  word_indices  = processEmail(text);
  features      = emailFeatures(word_indices);
  
end