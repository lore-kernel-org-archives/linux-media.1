Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAFE392C20
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 06:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740310; cv=none; b=pniCAITGW3iYqOH6lJlQPGUikV6tPBIQa+7GZ9GFB8aV1tMGKI2+/x+arNOLNYZMXJaTIWA+w46wgF9NpMAT2C/AECK6lju1qBsNw+w94dow98STAmoAv+pRTIWb/OQkCPdePzwtagrKQJxS03Kzg0fk8TG/xviAAgg1CCEuzvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740310; c=relaxed/simple;
	bh=On28LPNyT0wHYK1eiiih84TylpPEl11SClJhfwLcI+I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bVjGCwNtW8mIgS3vHck3rAAEbHWKf//QmVFD/aYfhhgKc5FsGfN0o4US9pJS4+mYVH+ikMPMu50Is7k8drBY4lKCRD3vvGgNCGWQdxjmAzGD/atqaAdPjRN8B+Cp9k8Bjj18vgIlHxS6gLho9dxkSEwqA5Sv9w2+OozIJ83yrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yunkec.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hA+V6W8W; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yunkec.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hA+V6W8W"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-49d4cb3ca23so4326967b6e.3
        for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785740308; x=1786345108; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqovcFe5p0Xr/iAlnmCGfLgOyscM3G7091IkNg+7W2o=;
        b=hA+V6W8Wjll8zhdOwNv3wVqeC3TrpuuvlFgBs4AEL0iOhAvfdiVqNdh189fS+YqYda
         6d4yfZZyVpp6AFZOFZAn6xcJmDrART6tCMABUuwEjR2CJeaWKTtw3A4V+qMiVfnhhA8P
         aVyrTBdukX79eXg9fE8FEmAgorVtA2RBNipmuJpSa75uvLKahGKkvz7C2yCQeL1m6+JW
         FetNxq8L55dv2izKmfbgcnBuMQdRfShdphtOlT1Dn/A+6vNQoq4ROzKNIBuV7XwQgCQi
         /4ixSBlP9Fc5gbGfI1eCbWKR0xcwdmDbIN1WFyEBxSyLc7UMll8w2po8xfM9J27JIcWa
         u69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785740308; x=1786345108;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqovcFe5p0Xr/iAlnmCGfLgOyscM3G7091IkNg+7W2o=;
        b=tWeeZMDX0ELyvqeBu6Ntv+iI4FC3rJrrSircAVE1GRr679Ja5IVGfVudJih91ZRQNQ
         Ug/kwtDnV2i/6SVhSVIA6tDOSXjDcUoBf6HWSLRzg5dmfFwS83iyuxPsh2bqrKHzRspx
         wfAh0PGr8ev3Cp+xdAZ7fRkdV4vWvG5L1Rl1K7YWd6ObI+xLckbj+skp5ZRPUS5adbrB
         4R+PLJ0L3kQz1UCRPnyjbaR3md/43rm8YWb6wTeD1MU1bLd11k9tYIleiEKZV7fu03ly
         I42PicH3OkTBkhcv139Kw7luOUn32uDqyp9sR/w2fAHse6lsWnAqZzAWNZfNHA7dK3ji
         2W6Q==
X-Gm-Message-State: AOJu0YwZ0laJdPSzZvUyiTt3/wbkGu8jllxFvfBySEVf6wlpzAc7B7TD
	r1niBBFyA6C1fVb/cyQP2e/y4G0G3zuRmk8hkmrpUh8fYKxDOxqRzyPvLS7+zqVWO2MXpl7XX+M
	MPTH8NQ==
X-Received: from oabyo7-n1.prod.google.com ([2002:a05:687c:47:10b0:457:cbf4:edf3])
 (user=yunkec job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:7083:10b0:6a3:1e40:6329
 with SMTP id 006d021491bc7-6ae43223c2emr9485122eaf.13.1785740307827; Sun, 02
 Aug 2026 23:58:27 -0700 (PDT)
Date: Mon,  3 Aug 2026 15:58:11 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803065811.3490286-1-yunkec@google.com>
Subject: [PATCH] media: uvcvideo: Add quirk for invalid dev_sof in Logitech C925e
From: Yunke Cao <yunkec@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"

Logitech C925e SOF does not increases at a stable rate of 1kHz.
Add a quirk for this camera to make hwtimestamp usable.

Before applying the quirk:
```
seq:     31 ts: 1075.543294 delta: 29.423 ms fps: 34.94
seq:     32 ts: 1075.573022 delta: 29.728 ms fps: 34.90
seq:     33 ts: 1075.602353 delta: 29.331 ms fps: 34.87
seq:     34 ts: 1075.632031 delta: 29.678 ms fps: 34.84
seq:     35 ts: 1076.177759 delta: 545.728 ms fps: 23.00
seq:     36 ts: 1076.213255 delta: 35.496 ms fps: 23.12
seq:     37 ts: 1076.209371 delta: -3.884 ms fps: 23.82
seq:     38 ts: 1076.232233 delta: 22.862 ms fps: 24.11
seq:     39 ts: 1076.264682 delta: 32.449 ms fps: 24.24
seq:     40 ts: 1076.287318 delta: 22.636 ms fps: 24.52
seq:     41 ts: 1076.285949 delta: -1.369 ms fps: 25.16
seq:     42 ts: 1076.317714 delta: 31.765 ms fps: 25.28
seq:     43 ts: 1076.317085 delta: -0.629 ms fps: 25.89
seq:     44 ts: 1076.339919 delta: 22.834 ms fps: 26.13
seq:     45 ts: 1076.212836 delta: -127.083 ms fps: 28.91
seq:     46 ts: 1076.242494 delta: 29.658 ms fps: 29.00
seq:     47 ts: 1076.271852 delta: 29.358 ms fps: 29.09
seq:     48 ts: 1076.301739 delta: 29.887 ms fps: 29.17
seq:     49 ts: 1076.330887 delta: 29.148 ms fps: 29.26
seq:     50 ts: 1076.360639 delta: 29.752 ms fps: 29.33
seq:     51 ts: 1076.390095 delta: 29.456 ms fps: 29.41
```

After applying the quirk:
```
seq:     31 ts: 203.782342 delta: 33.460 ms fps: 30.94
seq:     32 ts: 203.815492 delta: 33.150 ms fps: 30.91
seq:     33 ts: 203.849017 delta: 33.525 ms fps: 30.88
seq:     34 ts: 203.882190 delta: 33.173 ms fps: 30.86
seq:     35 ts: 203.915672 delta: 33.482 ms fps: 30.83
seq:     36 ts: 203.948902 delta: 33.230 ms fps: 30.81
seq:     37 ts: 203.982335 delta: 33.433 ms fps: 30.78
seq:     38 ts: 204.015475 delta: 33.140 ms fps: 30.76
seq:     39 ts: 204.048992 delta: 33.517 ms fps: 30.74
seq:     40 ts: 204.082208 delta: 33.216 ms fps: 30.72
seq:     41 ts: 204.115675 delta: 33.467 ms fps: 30.70
seq:     42 ts: 204.148995 delta: 33.320 ms fps: 30.69
seq:     43 ts: 204.182354 delta: 33.359 ms fps: 30.67
seq:     44 ts: 204.215605 delta: 33.251 ms fps: 30.66
seq:     45 ts: 204.249004 delta: 33.399 ms fps: 30.64
seq:     46 ts: 204.282259 delta: 33.255 ms fps: 30.63
seq:     47 ts: 204.315686 delta: 33.427 ms fps: 30.61
seq:     48 ts: 204.348945 delta: 33.259 ms fps: 30.60
seq:     49 ts: 204.382337 delta: 33.392 ms fps: 30.59
seq:     50 ts: 204.415570 delta: 33.233 ms fps: 30.58
seq:     51 ts: 204.449069 delta: 33.499 ms fps: 30.56
seq:     52 ts: 204.482218 delta: 33.149 ms fps: 30.55
seq:     53 ts: 204.515706 delta: 33.488 ms fps: 30.54
seq:     54 ts: 204.548940 delta: 33.234 ms fps: 30.53
seq:     55 ts: 204.582403 delta: 33.463 ms fps: 30.52
seq:     56 ts: 204.615563 delta: 33.160 ms fps: 30.51
seq:     57 ts: 204.649057 delta: 33.494 ms fps: 30.50
seq:     58 ts: 204.682301 delta: 33.244 ms fps: 30.49
seq:     59 ts: 204.715735 delta: 33.434 ms fps: 30.48
seq:     60 ts: 204.748890 delta: 33.155 ms fps: 30.48
```

lsusb -v

Bus 003 Device 005: ID 046d:085b
Device Descriptor:
  bLength                18
  bDescriptorType          1
  bcdUSB               2.00
  bDeviceClass            239
  bDeviceSubClass         2
  bDeviceProtocol         1
  bMaxPacketSize0        64
  idVendor           0x046d
  idProduct          0x085b
  bcdDevice            0.16
  iManufacturer           0
  iProduct                2 Logitech Webcam C925e
  iSerial                 1 2F2036AF
  bNumConfigurations      1

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..5b9ea19ad9f2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2706,6 +2706,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
+	/* Logitech HD Pro Webcam C925e */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x046d,
+	  .idProduct		= 0x085b,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Logitech Rally Bar Huddle */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.55.0.508.g3f0d502094-goog

