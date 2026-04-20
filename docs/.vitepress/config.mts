import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  rewrites: {
    'en/:path*': ':path*',
  },
  themeConfig: {
    search: {
      provider: "local",
      options: {
        async _render(src, env, md) {
          const html = await md.renderAsync(src, env)
          if (env.relativePath.includes('LICENSE.md')) return ''
          return html
        },
        locales: {
          sk: {
            translations: {
              button: {
                buttonText: 'Vyhľadávať',
                buttonAriaLabel: 'Vyhľadávať'
              },
              modal: {
                displayDetails: 'Zobraziť podrobný zoznam',
                resetButtonTitle: 'Resetovať vyhľadávanie',
                backButtonTitle: 'Zatvoriť vyhľadávanie',
                noResultsText: 'Žiadne výsledky pre',
                footer: {
                  selectText: 'pre výber',
                  selectKeyAriaLabel: 'enter',
                  navigateText: 'pre navigovanie',
                  navigateUpKeyAriaLabel: 'šípka hore',
                  navigateDownKeyAriaLabel: 'šípka dole',
                  closeText: 'pre zatvorenie',
                  closeKeyAriaLabel: 'esc'
                }
              }
            }
          }
        }
      }
    },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/Kolby11/nixos-i3', ariaLabel: 'Source code' }
    ]
  },
  locales: {
    root: {
      label: "English",
      lang: "en",
      title: "Kolby's NixOS",
      description: "Kolby's NixOS multi-desktop environment",
      themeConfig: {
        nav: [
          { text: 'Home', link: '/' },
          { text: 'Docs', link: '/introduction/' }
        ],
        sidebar: [
          {
            text: "Introduction", collapsed: false, items: [
              { text: 'Introduction', link: '/introduction/' },
              { text: 'Basic Principles', link: '/introduction/basic-principles' },
              { text: 'Multi-Desktop Environment', link: '/introduction/multi-desktop-environment' }
            ]
          },
          {
            text: "Getting Started", collapsed: false, items: [
              { text: 'Setup', link: '/setup/' }
            ]
          },
          {
            text: "System Modules", collapsed: false, items: [
              { text: 'Overview', link: '/system/modules/' },
              { text: 'Boot', link: '/system/modules/boot' },
              { text: 'Display Manager', link: '/system/modules/display-manager' },
              { text: 'Hardware', link: '/system/modules/hardware' },
              { text: 'Internationalisation', link: '/system/modules/i18n' },
              { text: 'Networking', link: '/system/modules/networking' },
              { text: 'Nix Settings', link: '/system/modules/nixsettings' },
              { text: 'Packages', link: '/system/modules/packages' },
              { text: 'Polkit', link: '/system/modules/polkit' },
              { text: 'Programs', link: '/system/modules/programs' },
              { text: 'Remote Desktop', link: '/system/modules/remote-desktop' },
              { text: 'Security', link: '/system/modules/security' },
              { text: 'Sound', link: '/system/modules/sound' },
              { text: 'Theme', link: '/system/modules/theme' },
              { text: 'Time', link: '/system/modules/time' },
              { text: 'Users', link: '/system/modules/users' }
            ]
          },
          {
            text: "Machine Configurations", collapsed: false, items: [
              { text: 'Overview', link: '/system/configurations/' },
              { text: 'Desktop', link: '/system/configurations/desktop' },
              { text: 'Legion', link: '/system/configurations/legion' }
            ]
          },
          {
            text: "Desktop Environments", collapsed: false, items: [
              { text: 'Overview', link: '/system/desktops/' },
              { text: 'Hyprland', link: '/system/desktops/hyprland/' },
              { text: 'i3', link: '/system/desktops/i3/' },
              { text: 'GNOME', link: '/system/desktops/gnome/' }
            ]
          },
          {
            text: "Custom Packages", collapsed: false, items: [
              { text: 'Overview', link: '/pkgs/' },
              { text: 'Material Symbols', link: '/pkgs/material-symbols' },
              { text: 'OneUI4 Icons', link: '/pkgs/illogical-impulse-oneui4-icons' }
            ]
          },
          {
            text: "Home Manager", collapsed: false, items: [
              { text: 'Overview', link: '/home-manager/' },
              { text: 'Packages', link: '/home-manager/packages' },
              { text: 'Programs', link: '/home-manager/programs' },
              { text: 'Fonts & Cursor', link: '/home-manager/fonts' },
              { text: 'Environment', link: '/home-manager/environment' }
            ]
          }
        ]
      }
    },
    sk: {
      label: "Slovak",
      lang: "sk",
      title: "Kolbyho NixOS",
      description: "Kolbyho NixOS viac-desktopové prostredie",
      themeConfig: {
        nav: [
          { text: 'Domov', link: '/sk/' },
          { text: 'Dokumentácia', link: '/sk/introduction/' }
        ],
        sidebar: [
          {
            text: "Úvod", collapsed: false, items: [
              { text: 'Úvod', link: '/sk/introduction/' },
              { text: 'Základné princípy', link: '/sk/introduction/basic-principles' },
              { text: 'Viac-desktopové prostredie', link: '/sk/introduction/multi-desktop-environment' }
            ]
          },
          {
            text: "Začíname", collapsed: false, items: [
              { text: 'Nastavenie', link: '/sk/setup/' }
            ]
          },
          {
            text: "Systémové moduly", collapsed: false, items: [
              { text: 'Prehľad', link: '/sk/system/modules/' },
              { text: 'Boot', link: '/sk/system/modules/boot' },
              { text: 'Správca zobrazenia', link: '/sk/system/modules/display-manager' },
              { text: 'Hardware', link: '/sk/system/modules/hardware' },
              { text: 'Internacionalizácia', link: '/sk/system/modules/i18n' },
              { text: 'Sieť', link: '/sk/system/modules/networking' },
              { text: 'Nastavenia Nix', link: '/sk/system/modules/nixsettings' },
              { text: 'Balíčky', link: '/sk/system/modules/packages' },
              { text: 'Polkit', link: '/sk/system/modules/polkit' },
              { text: 'Programy', link: '/sk/system/modules/programs' },
              { text: 'Vzdialená plocha', link: '/sk/system/modules/remote-desktop' },
              { text: 'Bezpečnosť', link: '/sk/system/modules/security' },
              { text: 'Zvuk', link: '/sk/system/modules/sound' },
              { text: 'Téma', link: '/sk/system/modules/theme' },
              { text: 'Čas', link: '/sk/system/modules/time' },
              { text: 'Používatelia', link: '/sk/system/modules/users' }
            ]
          },
          {
            text: "Konfigurácie zariadení", collapsed: false, items: [
              { text: 'Prehľad', link: '/sk/system/configurations/' },
              { text: 'Desktop', link: '/sk/system/configurations/desktop' },
              { text: 'Legion', link: '/sk/system/configurations/legion' }
            ]
          },
          {
            text: "Desktopové prostredia", collapsed: false, items: [
              { text: 'Prehľad', link: '/sk/system/desktops/' },
              { text: 'Hyprland', link: '/sk/system/desktops/hyprland/' },
              { text: 'i3', link: '/sk/system/desktops/i3/' },
              { text: 'GNOME', link: '/sk/system/desktops/gnome/' }
            ]
          },
          {
            text: "Vlastné balíčky", collapsed: false, items: [
              { text: 'Prehľad', link: '/sk/pkgs/' },
              { text: 'Material Symbols', link: '/sk/pkgs/material-symbols' },
              { text: 'OneUI4 ikony', link: '/sk/pkgs/illogical-impulse-oneui4-icons' }
            ]
          },
          {
            text: "Home Manager", collapsed: false, items: [
              { text: 'Prehľad', link: '/sk/home-manager/' },
              { text: 'Balíčky', link: '/sk/home-manager/packages' },
              { text: 'Programy', link: '/sk/home-manager/programs' },
              { text: 'Fonty a kurzor', link: '/sk/home-manager/fonts' },
              { text: 'Prostredie', link: '/sk/home-manager/environment' }
            ]
          }
        ],
        socialLinks: [
          { icon: 'github', link: 'https://github.com/Kolby11/nixos-i3', ariaLabel: 'Zdrojový kód' }
        ]
      }
    }
  }
})
