# Windows Azure VM for Cloud Platforms Streaming

This repo contains various assets used to provision a Windows-based VM in
Azure to run OBS for live streaming.

## Build VM
Go to https://portal.azure.com/#create/Microsoft.Template and use the
`build_vm_template.json` and the `template_parameters.json` to initially
build the base VM.

When the provisioning process is complete, RDP connect to the VM and be sure
to set the sound settings in your RDP client (eg: Remmina) to `remote`.

Once connected, open a file explorer and navigate to `C:\` and install the
virtual audio cable driver with the executable file `vacxxx.exe`.

At this point you can either run `C:\firstrun.bat` and start using this VM,
or you could sysprep it to create an image of it and use it later. Using a
sysprep'd image will be marginally faster to provision.

## Imaging the VM
If you want to image the VM, run `C:\prepme.bat` which will run sysprep and
then shut down the machine. After the machine shuts down, follow [these
instructions](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image-resource#create-a-managed-image-in-the-portal)
for creating a managed image.

## Deploy from an Image
If you imaged your VM, you can deploy from that image by using the template
deploy link above and use `imaged_vm_template.json` instead. However, you
**will** need to modify the file to point to the correct resource URL for the
image in your Azure account.