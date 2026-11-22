Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327481;
	b=gpJv9vJFzwIuDJRt/EQQqh0Rbqz5wmiluW1A1FOtmSxrUd4Jmp+E/zMoSBoKUfQfP1aH
	 yW8xJnK+Ug0bgY356gBYDOkbD6BbSdd1MiyoAUCD8xrUsF1LpetNAsRyWHrZYWKg+fCQ7
	 TzOBvVYwQ9wt1o2E1C8BYgYoR7c524hF/xg3QIr0TxUYS+IeSw/KPXe9FkFHo2F5RiEne
	 SxTb+KlbIGfUn4EQSx7/DcR868TlF8+7bLuhT8Ht3oGMDGVL5dquNpxoQh0EeKkNxYI9b
	 zKhAGVPZ/1Kys5U4D7IAUbBj+uSpfR1ewU9lfSl/4wBJm7c9KrPYY2U+gyeEt8DQDXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5NFMG2PvhOk/v2cx9/EqWDkni1W5VrzeNCSaqAwEm/M=;
	b=GjVon/nXaZmoHXkHwIqct5YflmA3ua8aP7L6fwyekj85wk2UlVLyu3W8c+UexYeal56p
	 BOJewxoRp+5jrsvAkSgA9AXEVPChAwo5s+Hr6xbOJEOf+ea45aze/rjnK172yuGJGv1CI
	 75gtT2G17yN9yCLeypurHU+/hKdUlxJKsKovnUNEjsgPs5HiOAOszF7Gj8YNLH/VzTyoj
	 tvSK0xMLAyp3Kcv7VQSX2IouFkYTKWA6eI/RjPf0X8KyU3+BdHS9sghI5Id72SmNcfdKU
	 bUsmm3cgwqEBHjUq8pZcKJmyNjQRdnF4oUbZo+jkE7BBEYq87rZj+U7nOgBcmjazcXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPzlYQ+z;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCAD606A686
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 06:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCAD606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPzlYQ+z
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so3692938c88.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 22:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327480; x=1795932280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NFMG2PvhOk/v2cx9/EqWDkni1W5VrzeNCSaqAwEm/M=;
        b=CPzlYQ+zjMF/MAKxHtYFa3yUeZe7LMbJ52gKhGTuEo0r2r46JjQcz4XgWGfgTx/Bql
         ShN1ZeOt4V1fX4RrQD5PwFuJNwgzPYMCMMsr0f/2dw2YLTWGJ0gP5HDSwTd0b8FtMbil
         zdUkbRCdZ1KuAFfWoCRwti8DWPnLIRAwb8Gqq9qVmW/So0JO0xNIigDLaVvLwY8nm2TH
         gTtClanVbBIDRWWyERLxNJM41bmoNhbp8/07VTCYHupVsHsvNfXGTsxA3ZirggzC3m1e
         zD6mUfb3NuuGRoULQh8tT0u9Of6UTFesq3A8qqUnlp5qjROYPcjWK/sc9B8l0cTcYX+o
         hAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327480; x=1795932280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NFMG2PvhOk/v2cx9/EqWDkni1W5VrzeNCSaqAwEm/M=;
        b=fB5BNUWKodSdT/YMmmadvJloTDHVWC1N25RnYT1dFwB/nss8MwxFFTXG/jyTee7vs9
         MUd5lvjHEnsJxvxYn2Z0KUydHHEAcztCYhI3898NJJVzt2yZmJiT/txhD1AiliaPg9rM
         lrJFCb1aBKaZL4K3pnNgHLDHydRD/w151QbFbiIvQKv+qtl9NzIUGGZiLuemQOlwZrPB
         PppDA6cR1YRrgr5UdMFgMxCclDJ0n24X0Pd6nvWIS3483coiUF5iaJCKAgx4PDRNJbyo
         Grp2UyYeZFQXgJvbBXAzrrizzZtDvG1w6gkZQwSAv/gudLb3Hlk2ZKi/1HwYf4ll3KOc
         YO5Q==
X-Gm-Message-State: APuU4Z/UO2sFk+/MD175JUQ84jgJvYjaFAlDvgivt1KsAYk+BBYmfHp7
	0lCVbWYYPOD3YJW67pAuSpFSjtW1ibmU6BJQHEZa3dz0Sc/lBUg8H49Mq+Bz4+Ag
X-Gm-Gg: AZFdTZfM0OjnkXehVxEb3OuHrK/Wz1rLI9NEpJHzN7zPTKuYPN7qkZWbxf3piknMRFQ
	jEpdt24hTnurLRcAYs9w7EITNPwQrsb6IWr8ujM7Vs3szHfBxyzZatqTgY6HYf7xvgfkm3VTysm
	7tK3vbhvTQSQotI+Qx4WPRiyPG1TpkcV/GIShhJggYqnkDhci1GyIUEKaBgzEklZMev2gfHimiR
	ZVq1h6NayJI6n+oV0jsREkga/hvo1wsMTIIKvP4M+b467VqLN07MHg97+5MdCIIE513Bjcspago
	ssdgRB3+rTrY3TYzpxg0gP4bP5KAfT+PuHrKin2SeiUu9VNCwZucZALymo1lp/QbutD0BuYiPnD
	MMyyHERydSW1BawE/ZY/uk0AN1rmu7HaHitT51XhW8lB+VYuCQP0vT1ju3OsebKrtTROV46nZ2y
	23hhaKTx3p5dy60wUIw+K52zuua09RWdkGj4wUTqjNbt50dyO+HI+JqoTNA0KBbz7c3G/q8KnYe
	Ifp9N7dYl5aMSiPpYpmA3qKQ8hGHUj/BHtDubdcAhD+YXGgX7UVLQnMe6eac6G+0H6OPXw795Qi
	3ZkfhNJR2ffw1U2O3qNg+7mLDJKh7Ncq+cjxpJiAjYmarca4uz5Wl43UxP+tiUdzpCkX
X-Received: by 2002:a05:701b:4552:10b0:1b5:31ed:e26c with SMTP id a92af1059eb24-1b55689b23dmr7435524c88.18.1795327480071;
        Sat, 21 Nov 2026 22:04:40 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm26704718c88.14.2026.11.21.22.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:04:39 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: uvcvideo: delay HP True Vision 5MP isochronous start
Date: Sun, 22 Nov 2026 19:03:09 +1300
Message-ID: <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
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

The HP True Vision 5MP Camera (04f2:b767, revision 0.05) accepts
COMMIT and SET_INTERFACE, then may disconnect shortly after starting
isochronous transfers. A 350 ms pause between SET_INTERFACE and the
first video URB allowed color streaming in MJPEG and YUYV modes.

Add a per-device isochronous startup delay and apply it to the color
interface.

On Arch Linux 7.2.14, FFmpeg decoded 90 frames each in 720p MJPEG,
640x480 YUYV and 2592x1944 MJPEG, plus 300 frames after a 720p
restart. The infrared stream still disconnected during the delay
experiment, before the first video URB was submitted.

OpenAI Codex (GPT-6.2 Sol) helped design and analyze the USB timing
experiment and write the driver change.

Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>

---
 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 99c28991b..cfc626a15 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2754,6 +2754,20 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
+	/* HP True Vision 5MP Camera (color) */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO
+				| USB_DEVICE_ID_MATCH_INT_NUMBER,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb767,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .bInterfaceNumber	= 0,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.quirks = UVC_QUIRK_PROBE_DEF,
+		.isoc_start_delay_ms = 350,
+	  } },
 	/* HP True Vision 5MP Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab..e20330998 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -6,6 +6,7 @@
  *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/highmem.h>
 #include <linux/kernel.h>
@@ -2103,6 +2104,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 		if (ret < 0)
 			return ret;
 
+		if (stream->dev->info->isoc_start_delay_ms)
+			msleep(stream->dev->info->isoc_start_delay_ms);
+
 		ret = uvc_init_video_isoc(stream, best_ep, gfp_flags);
 	} else {
 		/* Bulk endpoint, proceed to URB initialization. */
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94f..eb949c6d8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -545,6 +545,7 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
+	u16	isoc_start_delay_ms;
 };
 
 struct uvc_rect {
-- 
2.56.0

