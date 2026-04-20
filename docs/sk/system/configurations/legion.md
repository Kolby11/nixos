# Legion

Konfigurácia pre Lenovo Legion laptop, nachádza sa v `system/configurations/legion/`. Tento stroj má AMD iGPU a NVIDIA dGPU (hybridné grafiky), čo vyžaduje rôzne režimy ovládačov v závislosti od napájania.

## Vstupný bod

<<< @/../system/configurations/legion/default.nix

## Hardvérová konfigurácia

<<< @/../system/configurations/legion/hardware-configuration.nix

Hlavné rozdiely oproti desktopu:

- **Initramfs moduly**: `nvme`, `xhci_pci`, `usbhid`, `rtsx_pci_sdmmc` (čítačka SD kariet)
- **KVM**: `kvm-amd` modul načítaný pre podporu virtualizácie
- **Boot**: prísnejšie EFI povolenia (`fmask=0077`, `dmask=0077`)

## Základný hardvérový modul (GPU)

<<< @/../system/configurations/legion/modules/hardware.nix

Načítajú sa `amdgpu` a `nvidia` ovládače. Blok `nvidia.prime` deklaruje PCIe bus ID pre oba GPU — potrebné pre PRIME offload a synchronizáciu.

|                         Možnosť |                                          Hodnota |
| ------------------------------: | -----------------------------------------------: |
|                   `nvidia.open` | `true` — používa open-source NVIDIA kernel modul |
|     `nvidia.modesetting.enable` |                  `true` — požadované pre Wayland |
| `nvidia.powerManagement.enable` |  `true` — povolí runtime power management NVIDIA |
|                   `amdgpuBusId` |                                    `PCI:6@0:0:0` |
|                   `nvidiaBusId` |                                    `PCI:1@0:0:0` |

## Specializácie

NixOS specializácie umožňujú zostaviť viacero variant z jednej konfigurácie, všetky dostupné ako samostatné GRUB položky. Legion používa dve specializácie na prepínanie GPU režimov pri štarte:

<<< @/../system/configurations/legion/specialisations/default.nix

### legion-docked

Používa sa, keď je laptop pripojený k externému monitoru alebo napájaniu a je potrebný plný výkon GPU.

<<< @/../system/configurations/legion/specialisations/docked/modules/hardware.nix

`nvidia.prime.sync.enable = true` aktivuje PRIME Sync režim: oba GPU sú aktívne súčasne. Všetko sa vykresľuje na NVIDIA GPU a kompozituje AMD iGPU. To poskytuje maximálny výkon, ale väčšiu spotrebu energie.

### legion-on-the-go

Používa sa na batérii pre dlhšiu výdrž.

<<< @/../system/configurations/legion/specialisations/on-the-go/modules/hardware.nix

`nvidia.prime.offload` aktivuje PRIME offload režim: predvolene renderuje AMD iGPU. NVIDIA GPU sa zapne len pri explicitnej požiadavke cez wrapper `nvidia-offload`. To maximalizuje výdrž batérie.

## Premenovanie GRUB položiek

Specializované GRUB položky sú generované s dlhými auto-generovanými menami. Aktivačný skript ich premenúva na čitateľnejšie popisky:

<<< @/../system/configurations/legion/modules/activation-scripts.nix

Príkazy `sed` premenúvajú položky z `legion-docked` a `legion-on-the-go` na `"NixOS - Legion Docked"` a `"NixOS - Legion On The Go"`. Tento skript beží pri každom rebuild.
