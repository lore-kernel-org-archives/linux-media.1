Received: from smail-out3.vo.lu (smail-out3.vo.lu [80.90.45.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18AB3C1985
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 18:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.90.45.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919357; cv=none; b=GB2nHZhZP1Bfpw/DWAwsYGSHkkVRXvDfFfT1yytg+fbGqwhDNo1j9ffIvd0CWfQagemJt8y8VOAwCbzygRwCOSsH4P3xQTjAwvZHkrSgIg0pJng92rQhcMCzUADTAzXj4ztwPBuWwnHZqmlhM9LzpYWHQcq9SEy0b3TMAJOvxNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919357; c=relaxed/simple;
	bh=RXBJMoGViFiiQWfUOq8GEBtKxJ8S0lnWvX7B4Fd1M5c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aa7kVbpVo+Sa53uM/srJW2ezygyfx9HGPjrYpz59JYlSL5wuI+7YKCrgxM3PSu+XDHuFvBqWRPsX3wZiyLj/KaA68AR+PZUM8pyFktaZdcXlFFAUKRmpJF6TzLFtGvTZvGZOcjnwC//3XrtMJS4cfkQdLDT4pUyHkDTJIgv3KVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tcnnet.com; spf=pass smtp.mailfrom=tcnnet.com; dkim=pass (2048-bit key) header.d=tcnnet.com header.i=@tcnnet.com header.b=iFEc46Sf; arc=none smtp.client-ip=80.90.45.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tcnnet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tcnnet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tcnnet.com header.i=@tcnnet.com header.b="iFEc46Sf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tcnnet.com;
	s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wJ3sWSHwJc0j793tCc+LyBoapTdMH61L7HshVG56kss=; b=iFEc46SfarRnZzHcOxrRrwNMrZ
	i0nA26cZ1MPDrOggL6ssM9/fiEMrqne2eSuI4M1MAatcSNfXs/Ddu1fU5irq9ahYAegJVvDDRhuhV
	l92qd0MafcU7S+3ao7+ZVY/5AtxuvQg7JXrs+jqof8sPq+F2BX5EyK375T4w6NDW7RT7syEQnpBoe
	uDhjhpSef6G1amIQ93ZCHzHCJJl010IHUcaT7fHuyC5KLAqiQKHwy54b1lsEoE75TmJ+jQ2Ey5d11
	UvjvLReGH7cW6BPTVJUKTDrrxxRrl0T/0YnEDN6n7EDVRnrfYRpQUtMQPchSOSreEqJB2w2QjUdBG
	kWfmHrEQ==;
Received: from localhost ([127.0.0.1] helo=tcnnet.com)
	by shodan.glc with esmtp (Exim 4.98.2)
	(envelope-from <debian@tcnnet.com>)
	id 1wnL3R-0000000BRxF-1njB;
	Fri, 24 Jul 2026 20:55:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 24 Jul 2026 20:55:29 +0200
From: Michel Meyers <debian@tcnnet.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH v2] media: technisat-usb2 Load firmware to cold device
In-Reply-To: <2cef6662e1b5ae2cb1469bb10c3daff9@tcnnet.com>
References: <0028e04c8a7965af455b22161f77c1e4@tcnnet.com>
 <2cef6662e1b5ae2cb1469bb10c3daff9@tcnnet.com>
Message-ID: <70b658f25ab19ef68204ab89a97d83de@tcnnet.com>
X-Sender: debian@tcnnet.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Changes:
+ Add Technisat SkyStar USB HD cold device USB IDs so firmware is loaded 
to device.

Fixes: Technisat SkyStar USB HD is not detected/initialized by driver 
when in cold state.

By making a contribution to this project, I certify that:

- The contribution was created in whole or in part by me and I have the 
right to submit it under the open source license indicated in the file; 
or
- The contribution is based upon previous work that, to the best of my 
knowledge, is covered under an appropriate open source license and I 
have the right under that license to submit that work with 
modifications, whether created in whole or in part by me, under the same 
open source license (unless I am permitted to submit under a different 
license), as indicated in the file; or
- The contribution was provided directly to me by some other person who 
certified (a), (b) or (c) and I have not modified it.
- I understand and agree that this project and the contribution are 
public and that a record of the contribution (including all personal 
information I submit with it, including my sign-off) is maintained 
indefinitely and may be redistributed consistent with this project or 
the open source license(s) involved.

Signed-off-by: Michel Meyers <debian@tcnnet.com>
----------
--- drivers/media/usb/dvb-usb/technisat-usb2.c.orig     2026-07-18 
16:52:17.000000000 +0200
+++ drivers/media/usb/dvb-usb/technisat-usb2.c  2026-07-24 
20:27:14.811164112 +0200
@@ -691,10 +691,12 @@
  /* DVB-USB and USB stuff follows */
  enum {
         TECHNISAT_USB2_DVB_S2,
+       ULTIMA_TVBOX_USB2_FX_COLD,
  };

  static struct usb_device_id technisat_usb2_id_table[] = {
         DVB_USB_DEV(TECHNISAT, TECHNISAT_USB2_DVB_S2),
+       DVB_USB_DEV(CYPRESS, ULTIMA_TVBOX_USB2_FX_COLD),
         { }
  };

@@ -743,7 +745,11 @@
         .num_device_descs = 1,
         .devices = {
                 {   "Technisat SkyStar USB HD (DVB-S/S2)",
-                       { 
&technisat_usb2_id_table[TECHNISAT_USB2_DVB_S2], NULL },
+                       {
+                               
&technisat_usb2_id_table[ULTIMA_TVBOX_USB2_FX_COLD],
+                               
&technisat_usb2_id_table[TECHNISAT_USB2_DVB_S2],
+                               NULL
+                       },
                         { NULL },
                 },
         },
----------

Apologies for the spam. This is a cleaner version of my previous patch 
to fix the issue of the Technisat SkyStar USB HD not working when in 
cold state.

- Michel Meyers


On 2026-07-24 20:52, Michel Meyers wrote:
> Changes:
> + Add Technisat SkyStar USB HD cold device USB IDs so firmware is 
> loaded to device.
> 
> Fixes: Technisat SkyStar USB HD is not detected/initialized by driver 
> when in cold state.
> 
> By making a contribution to this project, I certify that:
> 
> - The contribution was created in whole or in part by me and I have the 
> right to submit it under the open source license indicated in the file; 
> or
> - The contribution is based upon previous work that, to the best of my 
> knowledge, is covered under an appropriate open source license and I 
> have the right under that license to submit that work with 
> modifications, whether created in whole or in part by me, under the 
> same open source license (unless I am permitted to submit under a 
> different license), as indicated in the file; or
> - The contribution was provided directly to me by some other person who 
> certified (a), (b) or (c) and I have not modified it.
> - I understand and agree that this project and the contribution are 
> public and that a record of the contribution (including all personal 
> information I submit with it, including my sign-off) is maintained 
> indefinitely and may be redistributed consistent with this project or 
> the open source license(s) involved.
> 
> Signed-off-by: Michel Meyers <debian@tcnnet.com>
> ----------
> --- drivers/media/usb/dvb-usb/technisat-usb2.c.orig     2026-07-18 
> 16:52:17.000000000 +0200
> +++ drivers/media/usb/dvb-usb/technisat-usb2.c  2026-07-23 
> 14:40:06.789009440 +0200
> @@ -691,10 +691,14 @@ static int technisat_usb2_rc_query(struc
>  /* DVB-USB and USB stuff follows */
>  enum {
>         TECHNISAT_USB2_DVB_S2,
> +       TECHNISAT_USB2_DVB_S2_COLD,
>  };
> 
>  static struct usb_device_id technisat_usb2_id_table[] = {
>         DVB_USB_DEV(TECHNISAT, TECHNISAT_USB2_DVB_S2),
> +       [TECHNISAT_USB2_DVB_S2_COLD] = {
> +               USB_DEVICE(USB_VID_CYPRESS, 
> USB_PID_ULTIMA_TVBOX_USB2_FX_COLD)
> +       },
>         { }
>  };
> 
> @@ -743,7 +747,11 @@ static struct dvb_usb_device_properties
>         .num_device_descs = 1,
>         .devices = {
>                 {   "Technisat SkyStar USB HD (DVB-S/S2)",
> -                       { 
> &technisat_usb2_id_table[TECHNISAT_USB2_DVB_S2], NULL },
> +                       {
> +                               
> &technisat_usb2_id_table[TECHNISAT_USB2_DVB_S2],
> +                               
> &technisat_usb2_id_table[TECHNISAT_USB2_DVB_S2_COLD],
> +                               NULL
> +                       },
>                         { NULL },
>                 },
>         },
> ----------
> 
> The above adds the necessary USB IDs to the driver for the device to be 
> detected in cold state and have the firmware uploaded to it. The 
> competing usbtest driver still needs to be blacklisted for this to 
> work. (Inversely, this patch may cause the dvb_usb_technisat_usb2 
> driver to attempt to upload the dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw 
> firmware to generic Cypress FX2 devices with the same USB IDs. I am not 
> sure if there are such devices out in the wild that have the 
> USB_PID_ULTIMA_TVBOX_USB2_FX_COLD/0x8613 PID.)
> 
> Thank you for your consideration.
> 
> - Michel Meyers
> 
> On 2026-07-20 10:17, Michel Meyers wrote:
>> Hello,
>> 
>> My DVB-S2 USB receiver (Technisat SkyStar USB HD / 
>> https://www.linuxtv.org/wiki/index.php/Technisat_SkyStar_USB_HD ) is 
>> not/no longer being recognised by the Linux kernel driver 
>> dvb_usb_technisat_usb2. The device used to work, but unfortunately I 
>> do not know when it stopped being recognised by the kernel.
>> 
>> When plugging in the device, it appears as follows...:
>> 
>> [2614361.108719] usb 3-12: new high-speed USB device number 51 using 
>> xhci_hcd
>> [2614361.248797] usb 3-12: New USB device found, idVendor=04b4, 
>> idProduct=8613, bcdDevice=a0.01
>> [2614361.248863] usb 3-12: New USB device strings: Mfr=0, Product=0, 
>> SerialNumber=0
>> [2614361.249537] usbtest 3-12:1.0: FX2 device
>> [2614361.249583] usbtest 3-12:1.0: high-speed {control bulk-in 
>> bulk-out} tests (+alt)
>> 
>> ... and then a module named 'usbtest' loads and claims it. 
>> Blacklisting usbtest and manually loading dvb_usb_technisat_usb2 
>> didn't solve the issue.
>> 
>> 
>> lsusb shows the device like this:
>> 
>> Bus 003 Device 051: ID 04b4:8613 Cypress Semiconductor Corp. CY7C68013 
>> EZ-USB FX2 USB 2.0 Development Kit
>> 
>> 
>> I do have the firmware for this device stored in /lib/firmware:
>> 
>> -rw-r--r-- 1 root root 9214 Oct 10  2010 
>> /lib/firmware/dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw
>> 
>> 
>> Kernel version:
>> 
>> Linux version 6.12.90+deb13.1-amd64 (debian-kernel@lists.debian.org) 
>> (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU 
>> Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.12.90-2 
>> (2026-05-27)
>> 
>> (Kernel config file is attached)
>> 
>> 
>> Diagnostic steps taken:
>> 
>> It is my understanding that this device connects in a 'cold boot' 
>> state and then needs firmware loaded to it to work. I have tried 
>> manually loading the firmware to the device, which makes it appear 
>> slightly differently after a reconnect, but it still retains the same 
>> "cold" USB VID and PID:
>> 
>> sudo fxload -v -t fx2 \
>>   -s /usr/share/usb/a3load.hex \
>>   -I /tmp/skystar-usb-hd-le.hex \
>>   -D /dev/bus/usb/003/047
>> 
>> [2613219.906449] usb 3-12: New USB device found, idVendor=04b4, 
>> idProduct=8613, bcdDevice=a0.01
>> [2613219.906514] usb 3-12: New USB device strings: Mfr=1, Product=2, 
>> SerialNumber=3
>> [2613219.906572] usb 3-12: Product: TechniSat USB device
>> [2613219.906618] usb 3-12: Manufacturer: TechniSat Digital
>> [2613219.906663] usb 3-12: SerialNumber: 0008C9[redacted]
>> 
>> 
>> I've also tried to manually add its USB ID to dvb_usb_technisat_usb2 
>> using this command:
>> 
>> echo 04b4 8613 | sudo tee 
>> /sys/bus/usb/drivers/dvb_usb_technisat_usb2/new_id
>> 
>> ... with no result.
>> 
>> 
>> I'm not smart enough to mess with driver modules, but trawling the DVB 
>> source code, I found these references matching the USB IDs in 
>> dvb-usb-ids.h:
>> 
>> #define USB_VID_CYPRESS 			0x04b4
>> #define USB_PID_ULTIMA_TVBOX_USB2_FX_COLD		0x8613
>> 
>> They are not referenced in technisat-usb2.c. (USB_VID_CYPRESS is 
>> referenced elsewhere, USB_PID_ULTIMA_TVBOX_USB2_FX_COLD isn't.)
>> 
>> 
>> Hopefully the above information is helpful in diagnosing this. I 
>> appreciate any help I could get to re-activate this device.
>> 
>> - Michel Meyers

