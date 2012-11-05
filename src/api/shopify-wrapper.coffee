shopify = require('wlaurance-nodify-shopify')
nodify = shopify.createSession process.env.SHOP_NAME, process.env.SHOP_PERSISTENT_TOKEN
exports.listProductImages = (cb)->
  nodify.product.all {}, (error, products)->
    images = []
    for entity in products
      if entity.images
        for img in entity.images
          images.push img.src
    cb images
