 # Yelper

 Yelper is a static website that aggregates and summarizes Yelp reviews to help users quickly understand what real reviewers are saying about businesses, surface the most common pros & cons, and recommend top dishes based on sentiment analysis.

 ## Purpose

 - Provide instant, high-level overviews of Yelp reviews without scrolling through dozens of pages.
 - Highlight the most praised and criticized aspects of each business at a glance.
 - Offer AI-powered dish and service recommendations derived from community feedback.
 - Present sentiment insights so users can filter and explore reviews by positive, neutral, or negative tone.

 ## How It Was Made

 - **Static Site Generator**: Built with [Hugo](https://gohugo.io/), a fast and flexible Go-based framework.
 - **Theme**: Uses a custom `simple` theme located in `landing/site/themes/simple`.
 - **Content Structure**:
   - Configuration: `landing/site/config.toml`
   - Layouts: `landing/site/layouts/`
   - Content: `landing/site/content/`
   - Archetypes: `landing/site/archetypes/`
   - Static assets (CSS, images, JS): `landing/site/static/`
 - **Submodules**: The repository includes submodules (defined in `.gitmodules`) for external themes or components.
 - **Build & Deployment**:
   - Local build: `hugo --source landing/site --destination public --gc --minify`
   - Deployment: The `publish_to_gh_pages.sh` script automates building the site and pushing the generated files to the `main` branch of the `CarsonFisher.github.io` GitHub Pages repository.

 ## What It Does

 - Renders a responsive homepage with:
   - A prominent download button linking to the application repository.
   - Sections for features, screenshots, and contact information.
 - Generates additional pages for features, tags, and categories.
 - Automatically creates a `.nojekyll` file to bypass GitHub Pages' Jekyll processing.
 - Applies custom styles defined in `landing/site/static/css/style.css`.

 ## Getting Started

 ### Prerequisites

 - [Hugo](https://gohugo.io/getting-started/installing) (version 0.147.0 or later)
 - Git

 ### Clone and Initialize

 ```bash
 git clone https://github.com/CarsonFisher/CarsonFisher.github.io.git
 cd CarsonFisher.github.io
 git submodule update --init --recursive
 ```

 #### Adding Your Logo

 Copy your logo image into the `landing/site/static/images` directory and rename it to `logo.png`. For example:

 ```bash
 cp "C:\Users\candl\Downloads\5baf4e7d-509e-4806-a825-478ea452eca1_removalai_preview (1).png" landing/site/static/images/logo.png
 ```

 ### Local Development

 ```bash
 cd landing/site
 hugo server --source . --themesDir themes
 ```

 Navigate to `http://localhost:1313` to preview changes in real time.

 ### Build and Deploy

 From the repository root:
 ```bash
 ./publish_to_gh_pages.sh
 ```

 This script will build the site, clone the Pages repo, sync the generated files, and push updates to GitHub Pages.

 ## License

 This project is released under the [MIT License](LICENSE) (if applicable).