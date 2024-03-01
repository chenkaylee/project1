-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    line_id INT,
    category_id INT,
    name VARCHAR(255) NOT NULL,
    price DOUBLE,
    material VARCHAR(255),
    date_added DATE,
    FOREIGN KEY (line_id) REFERENCES LimitedEditionLines(line_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create LimitedEditionLines table
CREATE TABLE LimitedEditionLines (
    line_id INT  PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    launch_date DATE,
    end_date DATE
);

-- Create Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create ProductVariants table
CREATE TABLE ProductVariants (
    variant_id INT PRIMARY KEY,
    product_id INT,
    size VARCHAR(255),
    color VARCHAR(255),
    inventory_count INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create ChannelListings table
CREATE TABLE ChannelListings (
    listing_id INT PRIMARY KEY,
    variant_id INT,
    channel_id INT,
    listing_url VARCHAR(255),
    price_override DOUBLE,
    quantity_listed INT,
    listing_date DATE,
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id),
    FOREIGN KEY (channel_id) REFERENCES SalesChannels(channel_id)
);

-- Create SalesChannels table
CREATE TABLE SalesChannels (
    channel_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    location_url VARCHAR(255)
);

-- Create ListedOn table
CREATE TABLE ListedOn (
    channel_id INT,
    listing_id INT,
    PRIMARY KEY (channel_id, listing_id),
    FOREIGN KEY (channel_id) REFERENCES SalesChannels(channel_id),
    FOREIGN KEY (listing_id) REFERENCES ChannelListings(listing_id)
);

-- Create SalesRecords table
CREATE TABLE SalesRecords (
    sale_id INT PRIMARY KEY,
    listing_id INT,
    sale_date DATE,
    quantity_sold INT,
    FOREIGN KEY (listing_id) REFERENCES ChannelListings(listing_id)
);

-- Create InventoryAdjustments table
CREATE TABLE InventoryAdjustments (
    adjustment_id INT PRIMARY KEY,
    variant_id INT,
    adjustment_date DATE,
    quantity_adjusted INT,
    reason TEXT,
    FOREIGN KEY (variant_id) REFERENCES ProductVariants(variant_id)
);