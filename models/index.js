// import models
const Product = require('./Product');
const Category = require('./Category');
const Tag = require('./Tag');
const ProductTag = require('./ProductTag'); // check this line : what is this for?

// Products belongsTo Category
Product.belongsTo(Category, {
  foreignKey: 'category_id',
});
// Categories have many Products
Category.hasMany(Product, {
  foreignKey: 'category_id',
  onDelete: 'CASCADE',
});
// Products belongToMany Tags (through ProductTag)
Product.belongsToMany(Tag, { // check this line and below
  through: {
    model: ProductTag,
    foreignKey: 'product_id',
  },
  // as: 'product_tag'
});
// Tags belongToMany Products (through ProductTag)
Tag.belongsToMany(Product, {
  through: {
    model: ProductTag,
    foreignKey: 'tag_id',
  },
  // as: 'product_tags' // ??
});

module.exports = {
  Product,
  Category,
  Tag,
  ProductTag,
};
