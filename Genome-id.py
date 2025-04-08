df=pd.read_csv('dataa.csv',encoding='latin1')
df
g = df.groupby('Genome Name')['Genome ID'].apply(lambda x: list(np.unique(x)))
g