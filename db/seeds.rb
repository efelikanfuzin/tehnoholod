15.times do 
  Project.create(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    preview: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae neque velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel nulla eget quam dictum aliquet in nec eros. Curabitur pretium metus eu ornare suscipit. Nunc dictum ultrices augue vitae rutrum. Curabitur sed purus viverra, rhoncus elit id, fermentum eros. Mauris vel sapien nec nisl faucibus commodo. In ut massa mattis, sodales magna nec, porttitor enim. Fusce dignissim tortor libero, vitae interdum dui condimentum sed. Quisque et efficitur ante. Curabitur turpis ante, pellentesque in scelerisque et, consectetur at sapien. Nulla eget risus in magna cursus mattis.',
    content: 
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae neque velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel nulla eget quam dictum aliquet in nec eros. Curabitur pretium metus eu ornare suscipit. Nunc dictum ultrices augue vitae rutrum. Curabitur sed purus viverra, rhoncus elit id, fermentum eros. Mauris vel sapien nec nisl faucibus commodo. In ut massa mattis, sodales magna nec, porttitor enim. Fusce dignissim tortor libero, vitae interdum dui condimentum sed. Quisque et efficitur ante. Curabitur turpis ante, pellentesque in scelerisque et, consectetur at sapien. Nulla eget risus in magna cursus mattis.
      Nulla luctus rhoncus enim, ac iaculis sem euismod id. Morbi et odio eu nibh posuere scelerisque. Maecenas condimentum ligula et varius malesuada. Nulla in purus placerat, lobortis orci nec, interdum sapien. Vestibulum dictum ipsum in sapien pretium, et vehicula orci convallis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque vitae sodales erat, eu condimentum orci. Duis ligula dui, iaculis eu convallis sit amet, bibendum non ligula. Phasellus varius augue id efficitur fermentum. Quisque imperdiet tincidunt sollicitudin. Vivamus sollicitudin, lectus eu mattis tincidunt, eros leo luctus ligula, at lobortis tortor sapien ut dolor. Nunc egestas scelerisque nulla lobortis molestie. Phasellus congue diam vitae lectus dignissim, vitae dignissim mi elementum.
      Cras vel vulputate eros. Etiam suscipit arcu ut orci ultricies, imperdiet dapibus sem maximus. Aliquam non enim sed elit placerat feugiat. Integer aliquet quis arcu ac rhoncus. Morbi dictum dignissim leo, ac ultricies nulla mollis et. Sed posuere semper risus, sed tempor eros facilisis at. Nulla non maximus justo, sed sodales justo. In eget felis magna. Quisque sodales sed dolor id porta.
      Sed auctor, magna et pretium condimentum, libero enim congue nulla, ac varius diam diam sit amet massa. Quisque at ultrices velit. Pellentesque et nisl non justo ullamcorper ullamcorper sed quis mi. Aliquam gravida vulputate ex eu convallis. Praesent finibus finibus sagittis. Vestibulum id ipsum quis odio lobortis tristique efficitur nec ex. Duis consectetur quis lacus eget fermentum. Quisque quis euismod ante. Ut vel dui massa. Curabitur dignissim gravida sem, eget congue dui mollis quis. Vestibulum sed nulla tincidunt, finibus magna at, rhoncus nunc. Aliquam erat volutpat.
      Sed egestas aliquet ex sed tristique. Sed sit amet odio convallis, vestibulum risus sit amet, venenatis turpis. Nam rutrum purus in mauris gravida, iaculis interdum est finibus. Cras ultrices, mi eu faucibus dignissim, orci urna pellentesque lacus, in eleifend felis sapien ac ligula. Suspendisse potenti. Aenean sodales eros vitae neque euismod ultricies. Nam viverra auctor massa id vulputate. Etiam rutrum egestas malesuada. Sed facilisis egestas lacus, scelerisque placerat tortor faucibus id. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
    preview_img: File.open(Rails.root + 'db/images/default_1.jpg'),
    photos: [
      File.open(Rails.root + 'db/images/default_1.jpg'),
      File.open(Rails.root + 'db/images/default_1.jpg'),
      File.open(Rails.root + 'db/images/default_1.jpg')
    ]
  )
end

# Blog posts are now stored as markdown files in content/blogs/
# See content/blogs/*.md for sample posts
# To migrate existing DB posts, run: rake blogs:migrate_to_markdown

10.times do
  Stock.create(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae neque velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel nulla eget quam dictum aliquet in nec eros. Curabitur pretium metus eu ornare suscipit. Nunc dictum ultrices augue vitae rutrum. Curabitur sed purus viverra, rhoncus elit id, fermentum eros. Mauris vel sapien nec nisl faucibus commodo. In ut massa mattis, sodales magna nec, porttitor enim. Fusce dignissim tortor libero, vitae interdum dui condimentum sed. Quisque et efficitur ante. Curabitur turpis ante, pellentesque in scelerisque et, consectetur at sapien. Nulla eget risus in magna cursus mattis.',
    price: 3000,
    sale_price: 1000,
    preview: File.open(Rails.root + 'db/images/default_1.jpg')
  )
end

5.times do
  Product.create(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae neque velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel nulla eget quam dictum aliquet in nec eros. Curabitur pretium metus eu ornare suscipit. Nunc dictum ultrices augue vitae rutrum. Curabitur sed purus viverra, rhoncus elit id, fermentum eros. Mauris vel sapien nec nisl faucibus commodo. In ut massa mattis, sodales magna nec, porttitor enim. Fusce dignissim tortor libero, vitae interdum dui condimentum sed. Quisque et efficitur ante. Curabitur turpis ante, pellentesque in scelerisque et, consectetur at sapien. Nulla eget risus in magna cursus mattis.',
    avatar: File.open(Rails.root + 'db/images/default_1.jpg'),
    products_type: :public_catering
  )
end

5.times do
  Product.create(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae neque velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel nulla eget quam dictum aliquet in nec eros. Curabitur pretium metus eu ornare suscipit. Nunc dictum ultrices augue vitae rutrum. Curabitur sed purus viverra, rhoncus elit id, fermentum eros. Mauris vel sapien nec nisl faucibus commodo. In ut massa mattis, sodales magna nec, porttitor enim. Fusce dignissim tortor libero, vitae interdum dui condimentum sed. Quisque et efficitur ante. Curabitur turpis ante, pellentesque in scelerisque et, consectetur at sapien. Nulla eget risus in magna cursus mattis.',
    avatar: File.open(Rails.root + 'db/images/default_1.jpg'),
    products_type: :furniture
  )
end

5.times do
  Product.create(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae neque velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc vel nulla eget quam dictum aliquet in nec eros. Curabitur pretium metus eu ornare suscipit. Nunc dictum ultrices augue vitae rutrum. Curabitur sed purus viverra, rhoncus elit id, fermentum eros. Mauris vel sapien nec nisl faucibus commodo. In ut massa mattis, sodales magna nec, porttitor enim. Fusce dignissim tortor libero, vitae interdum dui condimentum sed. Quisque et efficitur ante. Curabitur turpis ante, pellentesque in scelerisque et, consectetur at sapien. Nulla eget risus in magna cursus mattis.',
    avatar: File.open(Rails.root + 'db/images/default_1.jpg'),
    products_type: :store_items
  )
end
