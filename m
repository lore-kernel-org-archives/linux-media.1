Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B782BEFFD;
	Sat,  8 Aug 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786225363; cv=none; b=IW9NhMXo+34FRIzhAO5ZAbI9xo4pV1ed3Xc/Ahb0B5iJ5pQbZMMipWadAliqwc+CioMAznD97iVObUH0qo4J59rS9USGctowPc0BnIa+eEiRHszzP5RObZHKVmyw8wWHEXW+pLEBITjrGJCuSV1SOUOEbnL07dr/Hv/M36+U/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786225363; c=relaxed/simple;
	bh=OQJyL5Z+wwEr+8nrmu80asSo1z/KQC5Oo917L2q38Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pDUmZEgFzjlftW6bK6HCxtWj6oYT17FVAgOdWy8ZU12KsOdJjZlR5S8yJb2Axn4OxjZ4yHjsi9xeqVB0HqYIaKnusKkXwvw6hhv/ipVRgl/KGdVgeg3TfUan+jk0t9MjVLQ+jgNDg7L2eX8C2JfvsuB5nhJtjMqcCC1jrpbEFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=CcjW61XJ; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="CcjW61XJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GU6NM14M0jdodYEAxWoLhLOiR1hmxaLJaPjBVZLN/I8=; b=CcjW61XJA620Psxv1FO3r51A/X
	eWdGHr+e4vbj9wUMxo8rnF1DaorG4+T6oHf63xRcTz5YS2kbLMNbrwPx4FyIEfUQly8ptrdXzVPf9
	fGW/WUWeeDMEK1LvPkASFFnvXX2vNieRjJsSzF/yT/5SmLDevxpbQvXs6oc2mMBx10OaSHBa71oQz
	koqX7vrfAGUS9+hq9njf1xiItgsB66Dpv0KeigI0H+NkvpJ13by9+qMaRS1xUVDyXgYr3rdtOd9Ed
	hEeX5WNK00KFwLt6TWLL8gCX2RH0WtXznVX+n9oqD/zIzgEG5+cxHyMrLG+OudGRWH91Vnkhsa4Zm
	y9yHtStw==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708] (helo=fangorn)
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wsoo2-000000004yi-0Vp0;
	Sat, 08 Aug 2026 17:42:14 -0400
Date: Sat, 8 Aug 2026 17:42:13 -0400
From: Rik van Riel <riel@surriel.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jarod Wilson
 <jarod@redhat.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: redrat3: fix UAF in probe error path leaving rc
 device registered
Message-ID: <20260808174213.1d68336e@fangorn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

redrat3 stores its device name and phys path inside the main rr3
structure, and the rc device's device_name and input_phys point into
rr3. When the RC device is registered, it keeps those pointers.

  KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648
  Read of size 1 at addr ffff888051fda758 by task udevd/7464
  Call Trace:
   string_nocheck lib/vsprintf.c:648 [inline]
   string+0x216/0x2d0 lib/vsprintf.c:730
   vsnprintf+0x74a/0xef0 lib/vsprintf.c:2945
   vscnprintf+0x41/0x90 lib/vsprintf.c:3014
   sysfs_emit+0x10e/0x180 fs/sysfs/file.c:761
   input_dev_show_name+0x58/0x70 drivers/input/input.c:1282

  Allocated by task 10:
   redrat3_dev_probe+0x477/0x2570 drivers/media/rc/redrat3.c:1023
  Freed by task 10:
   redrat3_delete drivers/media/rc/redrat3.c:466 [inline]
   redrat3_dev_probe+0x1bf4/0x2570 drivers/media/rc/redrat3.c:1124

Syzkaller triggers this via usb probing. It probes the RedRat3 USB
interface, which calls redrat3_dev_probe() in redrat3.c. That function
allocates rr3, then builds an rc device whose name points into rr3 via
redrat3_init_rc_dev() in redrat3.c, and registers it with
rc_register_device().

When the detector enable fails after the RC device is registered, the
probe jumps to the led_free path. That path unregisters the LED but
does not unregister the RC device before freeing rr3 via
redrat3_delete() in redrat3.c. The RC device still holds
device_name = rr3->name which is now freed.

Later udevd reads /sys/.../input device name via sysfs_emit() in
file.c, which calls input_dev_show_name() in input.c, which emits
dev->name which is the freed rr3->name.

Fix the error path to unregister and free the RC device before freeing
rr3, matching the order already used in redrat3_dev_disconnect() in
redrat3.c.

This change should be safe because the RC device is fully registered
at this point and its teardown via rc_unregister_device() is protected
by the input device mutex, and rr3 is still alive during unregister so
device_name remains valid until after unregister. No new lock ordering
is introduced.

Reported-by: syzbot+302b9b575a06733ff60c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=302b9b575a06733ff60c
Link: https://lore.kernel.org/all/6a74a76d.ec7c9571.3ac9bb.0056.GAE@google.com/
Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
Cc: stable@vger.kernel.org
Assisted-by: Hermes:muse-spark-1.2 syzkaller
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 drivers/media/rc/redrat3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3f828a564e19..ae1e01097639 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1120,6 +1120,8 @@ static int redrat3_dev_probe(struct usb_interface *intf,
 
 led_free:
 	led_classdev_unregister(&rr3->led);
+	rc_unregister_device(rr3->rc);
+	rc_free_device(rr3->rc);
 redrat_free:
 	redrat3_delete(rr3, rr3->udev);
 
-- 
2.55.0


