#project start folder script
echo "node_modules/" >> .gitignore
touch README.md
touch index.html
mkdir src
cd src
mkdir css img js scss
cd css
touch style.css
cd ..
cd js
touch script.js
cd ..
cd scss
mkdir abstract base layout components
touch main.scss
cd abstract
touch _function.scss _mixins.scss _variables.scss
cd .. 
cd base 
touch _animations.scss _base.scss
cd ..
cd components
touch _buttons.scss
# This is a comment
# Use below imports in your main main.scss file
# @import 'abstracts/variables';
# @import 'abstracts/mixins';

# @import 'vendors/bootstrap';

# @import 'base/reset';
# @import 'base/typography';

# @import 'layout/navigation';
# @import 'layout/grid';
# @import 'layout/header';
# @import 'layout/footer';
# @import 'layout/sidebar';
# @import 'layout/forms';

# @import 'components/buttons';
# @import 'components/carousel';
# @import 'components/cover';
# @import 'components/dropdown';

# @import 'pages/home';
# @import 'pages/contact';

# @import 'themes/theme';
# @import 'themes/admin';