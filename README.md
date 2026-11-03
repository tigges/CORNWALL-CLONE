# CORNWALL-CLONE

This repository is an independent WordPress theme project. It is not connected
to the original `cornwall-dry-clean` repository, `cornwalldrycleaners.com`, or
any Cloudways staging or production app. The inherited Cloudways deployment
notes do not apply here.

## Preview locally

This repository contains the theme, not a complete WordPress installation or
a build/deployment system. To preview the working site:

1. Set up a disposable local WordPress site using a local WordPress environment.
2. Copy `wp-content/themes/cornwall-dry-cleaners` into that site's
   `wp-content/themes/` directory.
3. In the local WordPress dashboard, go to **Appearance → Themes** and activate
   **Cornwall Dry Cleaners**.

**Use a disposable local site:** activating this theme can replace the
WordPress homepage and update site settings. Do not activate it on a live or
valuable WordPress site just to preview the theme.

The theme's [`screenshot.png`](wp-content/themes/cornwall-dry-cleaners/screenshot.png)
is a static preview; it does not require WordPress.

## Development

- Theme source: [`wp-content/themes/cornwall-dry-cleaners/`](wp-content/themes/cornwall-dry-cleaners/)
- Content editor checks (run inside a WordPress installation with WP-CLI):
  `wp eval-file wp-content/themes/cornwall-dry-cleaners/tests/content-editor-test.php`
- There is no separate frontend build command configured in this repository.

Changes here affect only this checkout. Deploying them to any external site
requires that site's own separately configured and explicitly authorized
workflow.
