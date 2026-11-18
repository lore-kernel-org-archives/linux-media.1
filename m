Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980815;
	b=oXurkDfv+J0szN3frPzTuvcgf/u2oDg6xaisrCdqwe58aBdQPPnuw1dYHtphcyULKC3k
	 GxyEpMhteADxRcSFrS3ydJ2+gLDq/DCnqdONBejAmYvo/c6qwM5P+xJHG3b6UjJXMf+oa
	 Xvv8kEGmsvW0+jjoDUdD489p4OW7MaFBszDHgJjMLTAqjl1pqpIvtrJki0+V+hUhfsoFs
	 A2+J4Kc+0wOESfWL60c/ZRwXqEWhkVvVBW3Sg22zqY+348p6fpepixy7HCf404UjBOvjW
	 m2PXiH08Dme0KWjVfbjGgXCGohubVZm9tz452vrOdJ3ye3sX2Kd7OXJKvsKhblj5p/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980815;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BvO5IEELPY7k03esD7OvbhhgR0L7sOMqM7a7Ttptan4=;
	b=K4xBDnw1NB+j3Spc8yvbgVWVMOQb2Y5jV8uAPi0dO5VlV6YTRFTTQewdub3ONdlxhUMj
	 mzQkqYNcLyc08SMGyQrQFxYBYS9IbGC6onOHHDE6bP4BMqn0NkQ1lgHANmTkVlsjm6YQh
	 u8q07BvqdsLR9/LkS8W7BqE4B6MpTLm8Il4YlGg7giVj+YVCibzYIwqMlmQQZ3gLU5gy0
	 U1TQmR2eOVRm9mOoMhnal9OXt9HWal6ee2ZnW4qLHix0DtXqwTAwh/d1O6Yrnshx6O7vL
	 33c05SMO5EsSYtDQA9OGf5KHDCc/v9KX0HEbwnSfUNpwK21/J57mW5yoNhVfrtgB4vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PH2Dmhen;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F76606A32F;
	Wed, 18 Nov 2026 05:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F76606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PH2Dmhen
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=BvO5IEELPY7k03esD7OvbhhgR0L7sOMqM7a7Ttptan4=;
	b=PH2Dmhen/fIAIITJTP7nyirxnQQYwCuTlVcrDvTKG+3OKOuJDmg9MTqfBWTtO8
	7acPUwMtaSgNeU6Oji+s1LnQaWbe/SCNXGG71NQtgitqESiyXPsrxzyv+B26f4g6
	Bf8TECq1UptVxO2Bo3tzV5CTAuF8Ab9AootzBMaTcTBA4=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3l7KxO_1qDAR3IA--.59887S4;
	Wed, 18 Nov 2026 13:46:30 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvcvideo: reject descriptor walks that cannot advance
Date: Wed, 18 Nov 2026 13:46:29 +0800
Message-ID: <20261118134629.463042-1-shxzhaosr@163.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:_____wD3l7KxO_1qDAR3IA--.59887S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr15ZrykGF1Utw15uF13twb_yoWrGFWkpa
	yYkan8AF98GryrA3Wjyws5Jry5Aan7W34UKr4fK34Y9r98JFyrXa42yr40y347CF93Zr1U
	trs0kasrCr40yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlyxiUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7hYWVGr9O7YqXwAA3V

uvc_driver.c walks the extra descriptor data four times, advancing
the cursor by buffer[0] each round: the frame descriptor loop in
uvc_parse_format(), the skip loop and the counting pre-pass in
uvc_parse_streaming(), and the format descriptor loop after them.

buffer[0] is bLength from a descriptor the USB device supplied, and
nothing constrains it.  A device that reports bLength 0 leaves both
buflen and buffer unchanged, so the loop condition is still true on the
next iteration and the same descriptor is parsed again forever, on the
enumeration path.  A bLength above the remaining extra data walks the
cursor past the buffer instead.

Add uvc_desc_walkable(), which requires the two-byte descriptor minimum
and that the descriptor still fits in what is left, and use it in the
four loop conditions.

uvc_parse_control() is left alone: it already carries
"if (buflen < buffer[0] || buffer[0] < 3) return -EINVAL;" at the top of
its loop, which covers the same case there.

Found by static analysis of the descriptor loops; not observed at
runtime.
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc1456..57437e1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -332,6 +332,18 @@ static int uvc_parse_frame(struct uvc_device *dev,
 	return buffer[0];
 }
 
+/*
+ * A descriptor's length is supplied by the device, and nothing constrains it
+ * before the walks below step the cursor by it.  Below the two-byte
+ * descriptor minimum the cursor does not move at all and the walk spins on
+ * data the device chose; longer than the extra data still unparsed and the
+ * cursor would step outside that buffer.
+ */
+static bool uvc_desc_walkable(const unsigned char *buffer, int buflen)
+{
+	return buffer[0] >= 2 && buffer[0] <= buflen;
+}
+
 static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_streaming *streaming, struct uvc_format *format,
 	struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
@@ -486,8 +498,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 	 * based formats have frame descriptors.
 	 */
 	if (ftype) {
-		while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
-		       buffer[2] == ftype) {
+		while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
+		       buffer[1] == USB_DT_CS_INTERFACE && buffer[2] == ftype) {
 			frame = &frames[format->nframes];
 			ret = uvc_parse_frame(dev, streaming, format, frame,
 					      intervals, ftype, width_multiplier,
@@ -591,7 +603,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	}
 
 	/* Skip the standard interface descriptors. */
-	while (buflen > 2 && buffer[1] != USB_DT_CS_INTERFACE) {
+	while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
+	       buffer[1] != USB_DT_CS_INTERFACE) {
 		buflen -= buffer[0];
 		buffer += buffer[0];
 	}
@@ -658,7 +671,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	_buflen = buflen;
 
 	/* Count the format and frame descriptors. */
-	while (_buflen > 2 && _buffer[1] == USB_DT_CS_INTERFACE) {
+	while (_buflen > 2 && uvc_desc_walkable(_buffer, _buflen) &&
+	       _buffer[1] == USB_DT_CS_INTERFACE) {
 		switch (_buffer[2]) {
 		case UVC_VS_FORMAT_UNCOMPRESSED:
 		case UVC_VS_FORMAT_MJPEG:
@@ -734,7 +748,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	streaming->nformats = 0;
 
 	/* Parse the format descriptors. */
-	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
+	while (buflen > 2 && uvc_desc_walkable(buffer, buflen) &&
+	       buffer[1] == USB_DT_CS_INTERFACE) {
 		switch (buffer[2]) {
 		case UVC_VS_FORMAT_UNCOMPRESSED:
 		case UVC_VS_FORMAT_MJPEG:

