import pandas as pd
import folium

# Step 1: Read the CSV file with the 'latin1' encoding
data = pd.read_csv('data.csv', delimiter=';', encoding='latin1')

# Step 2: Extract the coordinates
data['X'] = data['wkt_geom'].str.extract(r'Point \((\d+)')
data['Y'] = data['wkt_geom'].str.extract(r'Point \(\d+ (\d+)')

# Convert to numeric
data['X'] = pd.to_numeric(data['X'])
data['Y'] = pd.to_numeric(data['Y'])

# Normalize the coordinates to a rough lat/lon approximation for visualization
min_x, max_x = data['X'].min(), data['X'].max()
min_y, max_y = data['Y'].min(), data['Y'].max()

# Normalize the coordinates to fit into a lat/lon range
data['lat'] = 40.0 + (data['Y'] - min_y) / (max_y - min_y) * 0.1  # roughly around 40 degrees latitude
data['lon'] = 60.0 + (data['X'] - min_x) / (max_x - min_x) * 0.1  # roughly around 60 degrees longitude

# Step 3: Create a Folium map centered around the mean latitude and longitude
m = folium.Map(location=[data['lat'].mean(), data['lon'].mean()], zoom_start=14)

# Step 4: Add points to the map
for _, row in data.iterrows():
    folium.Marker(
        location=[row['lat'], row['lon']],
        popup=row['MANZIL'],
        icon=folium.Icon(color='blue', icon='info-sign')
    ).add_to(m)

# Save the map to an HTML file
m.save('map.html')

print("Map has been created and saved as map.html")