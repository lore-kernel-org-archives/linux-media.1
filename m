Received: from sneak2.sneakemail.com (sneak2.sneakemail.com [64.46.159.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C21449B17
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.46.159.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164913; cv=none; b=RTtMXV6Q212D5qR0yaRx/UqY9NWVifjhz68rGGlwwkBzLtc7IBqsgndmxNkOZCBYm2tu+Z8atli8/xJOoBM/lwGwjvlIJr0Emx95jjtOLSD89aJTkgoox6M3NeEikv2smpX2eV9KpiFlU2w9YMaOk8nKN9Wao5DjVXWM4c586Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164913; c=relaxed/simple;
	bh=uQpfyau+jWBvj/lcGdAhSzCxvdTB9MGROGuYNqSS3jU=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=a6flMSQVY9hEyYSBt4Gl9AXA684D3lzBEmJR4qOpHzk2yVm/fPNrZWFu8ZqDtNWSN/vj/hjDOVQU9LawAh2Ytpvjs581WNVHRNSFxT4bohptgN0eleEtGCeWa8WXozyKBrcUFl1k4ylpz05Ij049xV6HeOxywllNxHq78771Nh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=liamekaens.com; spf=pass smtp.mailfrom=liamekaens.com; dkim=pass (2048-bit key) header.d=liamekaens.com header.i=@liamekaens.com header.b=uJQ55D1G; arc=none smtp.client-ip=64.46.159.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=liamekaens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=liamekaens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=liamekaens.com header.i=@liamekaens.com header.b="uJQ55D1G"
Received: (sneakemail censored 30465-1792164435-194719 #2); 16 Oct 2026
 15:27:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=liamekaens.com;
	s=mail; t=1792164435;
	bh=uQpfyau+jWBvj/lcGdAhSzCxvdTB9MGROGuYNqSS3jU=;
	h=Date:From:To:Subject:From;
	b=uJQ55D1GV39jKwKaYqQb3efEPoQEhIOUOPQRKn2EihOVwqSrlFsbwbSDAXEV0hk6r
	 +EDkB8GebNACCaBIrgAesc9JFnGzDxk+Fzm7N1m2+zn0DjAVLI5zjN4q8QBPSQlviX
	 m1L5kkc0DxxvcZCisyOxLPN6x4X95K7r8l/Y7rqelBOsR2hNWgw2gC8ARlbNahB4vd
	 RF65GEtv6YH96qnC/OI7nXkEe9aspKeAaGZVbhJmVQrxF3VZVd//RuvDPAwqUZre7n
	 w8oePinZ2Yy2mCjWOH4wHujCeSF5aPbKfIcjCE3T5AIwN+mm2cQ+p4A4V/WJ+A/CFb
	 lZ4SVk3az4KLQ==
Received: (sneakemail censored 30465-1792164435-194719 #1); 16 Oct 2026
 15:27:15 -0000
Date: Fri, 16 Oct 2026 15:27:14 +0000
From: y8sh229r8s@liamekaens.com
To: linux-media@vger.kernel.org
Message-ID: <30465-1792164435-194719@sneakemail.com>
Subject: [PATCH] media: cxusb: fix NULL pointer dereference in
 cxusb_disconnect()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: Perl5 Mail::Internet v

cxusb_disconnect() dereferences the interface data without checking it:

	struct dvb_usb_device *d = usb_get_intfdata(intf);
	struct cxusb_state *st = d->priv;

For a device found in cold state that pointer is NULL.  cxusb never sets
no_reconnect, so once the firmware has been downloaded
dvb_usb_device_init() leaves through its error path:

	if (cold) {
		ret = dvb_usb_download_firmware(udev, props);
		if (!props->no_reconnect || ret != 0)
			goto error;
	}
	[...]
 error:
	usb_set_intfdata(intf, NULL);
	kfree(d);
	return ret;

ret is 0 when the download succeeded, so cxusb_probe() reports success
and the interface stays bound with the interface data explicitly set to
NULL.  The device then re-enumerates in warm state, and the disconnect
of the cold interface oopses.

This happens on every cold start of a DViCO FusionHDTV5 USB Gold
(0fe9:d500); the port, the hub and the power source make no difference:

 usb 1-1.1.4: New USB device found, idVendor=0fe9, idProduct=d500
 dvb-usb: downloading firmware from file 'dvb-usb-bluebird-01.fw'
 usb 1-1.1.4: USB disconnect, device number 7
 Unable to handle kernel read from unreadable memory at virtual address 0000000000000368
 Workqueue: usb_hub_wq hub_event
 pc : cxusb_disconnect+0x28/0xa0 [dvb_usb_cxusb]
 lr : usb_unbind_interface+0x84/0x308
 Call trace:
  cxusb_disconnect+0x28/0xa0 [dvb_usb_cxusb] (P)
  usb_unbind_interface+0x84/0x308
  device_remove+0x78/0x90
  device_release_driver_internal+0x1e0/0x2b0
  device_release_driver+0x20/0x38
  bus_remove_device+0xf8/0x240
  device_del+0x160/0x3a8
  usb_disable_device+0x104/0x2c8
  usb_disconnect+0xec/0x328
  hub_port_connect+0x8c/0xae8
  hub_port_connect_change+0x1fc/0x2e0
  port_event+0x430/0x850
  hub_event+0x134/0x500

Most dvb-usb drivers use dvb_usb_device_exit() directly as their
->disconnect handler, and that one does check for NULL.  cxusb has its
own handler and has to do the same.

Bail out of cxusb_disconnect() when there is no interface data.

Tested on the affected hardware: with the fix applied the cold interface
is torn down silently, the device re-enumerates in warm state and the
DVB adapter registers normally.  Only the DViCO FusionHDTV5 USB Gold was
available here; the other devices this driver handles were not
exercised, and neither was the Medion MD95700 analog path.

Fixes: 26c42b0dd5fa ("[media] cxusb: TechnoTrend CT2-4400 USB DVB-T2/C tuner support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Bob Entwhistle <y8sh229r8s@liamekaens.com>
---

Notes on tool assistance, per Documentation/process/generated-content.rst:

The diagnosis and this patch were produced with LLM assistance (Claude
Opus 5) over an interactive session, working from the kernel log quoted above.
The assistant decoded the faulting instruction, traced the NULL
interface data back to the cold-firmware path in dvb_usb_device_init(),
located the commit named in the Fixes: tag, and drafted both the change
and this changelog.  No specialized analysis tools (coccinelle, sparse,
smatch) were involved.

I reviewed the result, built it as an out-of-tree module against the
running kernel on the affected machine and confirmed the oops is gone
and the tuner works.  checkpatch.pl --strict is clean apart from false
positives on the quoted oops line, where the 64-bit fault address is
read as a commit id.

 drivers/media/usb/dvb-usb/cxusb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index d0501c1..73543a1 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -1668,9 +1668,22 @@ ret_uninit:
 static void cxusb_disconnect(struct usb_interface *intf)
 {
 	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	struct cxusb_state *st = d->priv;
+	struct cxusb_state *st;
 	struct i2c_client *client;
 
+	/*
+	 * A device found in cold state is bound by cxusb_probe(), but
+	 * dvb_usb_device_init() takes its error path right after the
+	 * firmware download (cxusb does not set no_reconnect), which
+	 * leaves the interface data NULL while still returning success.
+	 * The device then re-enumerates in warm state, and this handler
+	 * runs for the cold interface with nothing to clean up.
+	 */
+	if (!d)
+		return;
+
+	st = d->priv;
+
 	if (d->props.devices[0].warm_ids[0] == &cxusb_table[MEDION_MD95700])
 		cxusb_medion_unregister_analog(d);
 
-- 
2.53.0.windows.1


