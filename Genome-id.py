import pandas as pd
import numpy as np
 
df = pd.read_csv('data.csv', encoding='latin1')

# Group by 'Genome Name' and get a list of unique 'Genome ID's for each
g = df.groupby('Genome Name')['Genome ID'].apply(lambda x: list(np.unique(x)))

print(g)

g.to_csv('grouped_genome_ids.csv')
