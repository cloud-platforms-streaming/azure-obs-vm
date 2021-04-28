# Windows Azure VM for Cloud Platforms Streaming

This repo contains various assets used to provision a Windows-based VM in
Azure to run OBS for live streaming.

## Build VM

Use the `build_vm.sh` script to initially build the Windows 10 virtual
machine. You will need the `az` CLI installed.

When the provisioning process is complete, you'll be able to find the VM in
your Azure account in the stated Resource Group and then obtain its public IP
address.

RDP connect to the VM and be sure to **set the sound settings in your
RDP client** (eg: Remmina) to `remote`. Also be sure to connect a local folder
to the remote system so that you can transfer the audio driver.

Once connected, open a file explorer transfer the `vac462full.exe` from your
system to the Windows system's `C:\`.

## Imaging the VM

To image the VM, run `C:\prepme.bat` which will run sysprep and
then shut down the machine. After the machine shuts down, follow [these
instructions](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image-resource#create-a-managed-image-in-the-portal)
for creating a managed image.

## Deploy from an Image

If you imaged your VM, you can deploy from that image by using the
`image_vm.sh` script. Be sure to use the parameter for the correct image
reference in your account.

Example: `./image_vm.sh eastus /subscriptions/f4c5a52e-981d-4dcc-8ae1-23759d7a65c2/resourceGroups/C87B6867-F12F-4E37-AFF9-7203B183CB37/providers/Microsoft.Compute/images/0428013334obs-image-20210428101546`

Once the image is deployed, connect to it with RDP as above, then hit the
Windows Start button and type `c:\firstrun.bat` and hit enter. This will
prepare OBS for you.

You're good to go.

## Running the Built VM

You could also build the VM every time and go from there. You will want to
install the audio driver manually (by double clicking `vac462full.exe` in the
file explorer and following the prompts). 

You will also need to install the AMD GPU driver extension from the Azure
portal. This is normally included as a part of the `image_vm.sh` deployment, but
it is *not* included as part of the standard build (in order to save time).

Then run `c:\firstrun.bat` and you are good to go.
