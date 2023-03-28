import pandas as pd
import cv2
import re
def preprocessing(Path):

  #Load the health dataset.
  df = pd.read_csv(Path)

  #function to convert text to lowercase.
  def process_review(review):
      processed_token = []
      for token in review.split():
          token = ''.join(e.lower() for e in token if e.isalnum())
          processed_token.append(token)
      return ' '.join(processed_token)

  #Drugs Names
  all_drugs = df['drugName'].unique().tolist()
  all_drugs = [x.lower() for x in all_drugs]
  #Converting the text in format of Named Entity Recognition for categorical Text Extraction (i.e. Extracting only drug names)
  count = 0
  TRAIN_DATA = []
  for _, item in df.iterrows():
      ent_dict = {}
      if count < 1000:
          review = process_review(item['review'])
          visited_items = []
          entities = []
          for token in review.split():
              if token in all_drugs:
                  for i in re.finditer(token, review):
                      if token not in visited_items:
                          entity = (i.span()[0], i.span()[1], 'DRUG')
                          visited_items.append(token)
                          entities.append(entity)
          if len(entities) > 0:
              ent_dict['entities'] = entities
              train_item = (review, ent_dict)
              TRAIN_DATA.append(train_item)
              count+=1

  #Using EasyOCR for real time text extraction.
  #Extracting the medicine information present on the back of the medicine pamphlets.

  return TRAIN_DATA

TRAIN_DATA = preprocessing("train_Dataset_health.csv")
print(TRAIN_DATA)