Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793244675;
	b=H3OBRDgwL9aLO8dFpgzwmqAdJeFTMVVl9nOr7ol77Z4HLi16KZF9HYZbZbt5yKqaj7U0
	 vYVZmel1T5Slkwo+ECAhv3KYrp/cYkBx32j+L/ZwOgu+Cn0OwKe0w/He2nphEsP73xVvE
	 i/HULTLBKOuQGSimF1JuY5+E2AMQ51xXSg904x7Fs0eYLpUYQ9isXiMphd0gOFI3C4PTd
	 XVSdtqzARRDsx2TSEH7bS//LlI3L/KA3OxOoBakIQ3srg82iQhVqaYHCC+dbRCLWBD0LV
	 GjAB4wx+mzjRocyJqbA2MzkldbNmL3dcp4R6/6DOsxE/N9WPC+hdavsEIrnBe1PnPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tXqVgIHedAkUX1I4ngPnM2GuJZyv0UpTtxGtSVGkbxk=;
	b=DVtrkHrY9SQ3WgetC2MH73Xa5zf8ry/E1nuqD8oLSrQPhRpDTpDPO4erwhKLhXM8W2BE
	 yK8SCZ7z9INl64nCPJ4TJ6ewQ3F0b01FcgzfCE2DZOqM7VxH760SqFTQ/rSBaIHNz3L9z
	 umpFr1gPSHD75yzgY2sUxPNmy6q/ECeyl2SNRtf1RiN6tGP3IIXk+prTSYFcmMpOwix0A
	 qBz+gyiihJNUn1lzY5IRuwwJn5xWp1Cp67cd1yrZKClt7LCOS+8WRUry4smGPDFcYo6Wh
	 xTlIwKipkCAbiMub1fa/35jN9B7NVBV6Aa71Yaf9JuHClkvdHKi8grlzDF+BsfHWRFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYX39ZuJ;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F402606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F402606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYX39ZuJ
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso799619a12.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793244675; x=1793849475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXqVgIHedAkUX1I4ngPnM2GuJZyv0UpTtxGtSVGkbxk=;
        b=zYX39ZuJSN0UsvntbvUpb3KShsqH1yk55dbvdt2Ka+E4wcr6yk/MDMhfutRbsSFuql
         4/1q6devLsWltIva8YOiGifbaH9flU+l1q2C+XxTND0Q1PD8eEFBcC7fAaw1J8v4CJDP
         3uEYqGgklov6SdcABncf9CrYparZY5XTulR67I2EGT/ZzLdYG83GpdDJ5hb96X7U8UYn
         ile1SN32hs29/bhF+1b+MuzM6CeRocE0rxEF0sMc8yM5RhEuqyneQ/lksigYB55Jau+z
         ZuYx36Ip5/vRYeseQTofc2UjZFBifXUJH6pKdf+16GsVIVdZkfp6tAmdGQc5PyV8Ru+Q
         4VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244675; x=1793849475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXqVgIHedAkUX1I4ngPnM2GuJZyv0UpTtxGtSVGkbxk=;
        b=SZd0jqaMMVFrAZ2nmlLNE35zrYirTi6TalmcchIcHaGNjxWI5E1/U+YC0EqOf3l4aY
         t/S04HByK4h11fr7ngWKaP2TUfB+2EysoBhx2UzrXLzHMU7YTiFUSaVQ+1z3+oT+s+Ld
         noZ6PX8+y6HpqlXAUNzlN9Rmo/mpyLfVdmcguXh9H5WBwNtZboszJxDuKEuQknEC8xBm
         WXN8+kVBHFAaGfVNzs1GSUX0ZCy8ieRImfa3jqgzMRKMW+JwV3i/EwzBg1MfhcOrUH7y
         dzjF8UQmXTtJ6gQoZmyFdIc4zz3/crSiD6WJKhAcosjmGyEhAF/R/OTGPT+87VgdcI0P
         90vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpMon4sTFST1WMmRBABH7Vex3vz0e1oewcNOYt6uUqiPzqqjypcjL7yED2mQNgEN9ua4dt40PHGh+rcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJeDa2VQMqlg35qOp3+Bphw+dL6Ku3IzkWLv0ecDjgizI/KOf6p
	6WGQzp88D+EdS6K3sofoqg7day5czh5GXrJ0AytmdfAau5tuP5Dtkq/3
X-Gm-Gg: AYBFou2ijRiu7DeCY8hjS5JI2AWncuXr0y1kZ0ruMvW18E4ZiERmOips4I6p1z98+7B
	1vGjEwpgYXOHHidiEAXfjftvQ2JxM+qr8WjWFa4yjhiR9UNfes4yDY0yLtf95TnH8qtLSEyDjLF
	Q7DgsMFBMEkT+0FyXaNPg/PzFin0V+3k1UanTotnQeAZaxBEJZn8VT25s5quYxoWbzHJz69n87d
	cQI4EPfIYWvvqYTDpzlamrYJYaXhuqKth4URx8/KAP0a/ljNcQ45iUqUw6xInFtjNt9na7r4mEc
	RJO/2BYsH2C46DN4gEseofFzN1Lo2bwtI7+Gg11a48nMvZuwB4aQUFB3h1JSvjTJ2yLRcePBFO0
	l4KYCwiovFCg/tpTA/BwIJ80G02ALjzjxzuzTY4WUn93Q+UPKZIZVLRJDV0JXzIB55ruFh7kQpk
	kOvEwr26KyDYUP6Nk0GT6jUswFB/nUZ74KRCcpq946HlvvQSg9zS98zOUOhhL9czbMawaUT3DQs
	wowKMdz+BZ5aDPiN+MrK6C7ARZxz7gILWR3TxdwYzL2dvL978pXM9wUESbDA/d+9caHhbWoaZRZ
	n6jKPJWi8/hnGWvJN8ieJcYHa6v19TpZOwQ3o5SoP+6fi4UIYid89FFXpeABwVcdMWTqYJo/EyB
	cerzFgfSJZa4G5PnKu00SNY0=
X-Received: by 2002:a17:90b:1343:b0:3ab:2236:6b3d with SMTP id 98e67ed59e1d1-3ae5822fdf8mr3208481a91.27.1793244674909;
        Wed, 28 Oct 2026 20:31:14 -0700 (PDT)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e898317sm1824393a91.16.2026.10.28.20.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:31:14 -0700 (PDT)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK camera
Date: Thu, 29 Oct 2026 11:31:06 +0800
Message-Id: <20261029033106.7374-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UVC control requests issued when preparing a video stream sometimes
time out on the HIK 1080P Camera (2bdf:0280):

[   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
[   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
[   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
[   58.592967] uvcvideo: Failed to initialize the device (-5).

Adding a 1ms delay after each control message avoids the issue.

Introduce UVC_QUIRK_CTL_MSG_DELAY_1M for this device.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
 drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++--
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc7..c720d75 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3162,6 +3162,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
+	/* HIK 1080P Camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x2bdf,
+	  .idProduct		= 0x0280,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTL_MSG_DELAY_1M) },
 	/* Insta360 Link */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index fc3536a..4667f86 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -35,13 +35,19 @@ static int __uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 {
 	u8 type = USB_TYPE_CLASS | USB_RECIP_INTERFACE;
 	unsigned int pipe;
+	int ret;
 
 	pipe = (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
 			      : usb_sndctrlpipe(dev->udev, 0);
 	type |= (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
 
-	return usb_control_msg(dev->udev, pipe, query, type, cs << 8,
-			unit << 8 | intfnum, data, size, timeout);
+	ret = usb_control_msg(dev->udev, pipe, query, type, cs << 8,
+			      unit << 8 | intfnum, data, size, timeout);
+
+	if (dev->quirks & UVC_QUIRK_CTL_MSG_DELAY_1M)
+		usleep_range(1000, 2000);
+
+	return ret;
 }
 
 static const char *uvc_query_name(u8 query)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4..1426d14 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTL_MSG_DELAY_1M	0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.25.1

