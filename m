Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2B44062F
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874575; cv=none; b=G51IhTXV/d6NyPn8Yc4zKvP1C0Uku8ZkPeE8MPNjtvmi2ckk72P+JWidgAEuUnEe9rwWEnOoRJ+bXUCaLqth3W+MA8tBAO8Aquk5jEY0T0hJLz1hZ0ulMUcUyWrjD2MAIr9hpJMyhqqKaOon4VIH0RBRewMm6jRv4tS8QVrNgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874575; c=relaxed/simple;
	bh=1Fobwrg8AECZXZe7njdX8d38CGkOJpbWg5fkKH8FxOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nwPeOf+RYSi87jBGL8VGD8fUllqTP8pvQvYEYjLjOXKwCvGLjtXW5mvc8tKspqbMZaiVdRFkO23uw9tfjFaybS+uMuylyFcZY36Kd5wLGgMRttycySLhhBo6/xDw0tvfElkbj/hjf6nu+Lg1Ui/7p4Y664cyORozY/pyOn+8Fao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y86CtWYC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y86CtWYC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso21844785e9.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 23:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791874572; x=1792479372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl1vkIq2RUKP+g12UFW92ioYIoDQmINIFzje7YSAvf0=;
        b=Y86CtWYCZCJXmX0RpyUoSZVnBVBhUz798iSmwoOLBOUXS9V6MYljR+6byZSjRNz/+W
         WmJYFHBO9opo8CcrN8Rdq69ZL2L5veB6tCzpEHTRMYwM0RiFhlpK69XrbgikeoozTv8c
         qMvI7P5PcaeCjY8wft8JZlV94rRIMONUsHvjRwGEIEpF88UdoAKmFxkMXsOPBS9XTcvQ
         2RORj867+Vcy46DCK9esuson1fUcPrQhx/QjF5SVBkYbrJ9w43nYlwbj2JeplIKOjKaL
         iydBWTo23NP9zP/BIMk2XfBqm25QF+X57nynDwi+uE5i9cojw24DQBbENyJAuFONVLTc
         /7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791874572; x=1792479372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl1vkIq2RUKP+g12UFW92ioYIoDQmINIFzje7YSAvf0=;
        b=C/zoeBKYIh7maITPsNO47tjMs55QEH3yL19vo2rDMk+NiORJeOBzJ+A8pTQNb1SWYL
         RGOPIWavfFLbQY+XfEKJ0qOn7yHOOZ+7ScU07n/AqpaSp+APUMT5MtxJNL5oA6sFIHhY
         E8nUz8AIjMgwoHaeNIjD3oIWsBzeGWdt9rRM7WAR0BRbQsAJJWKiGueLrQUakfb/twLF
         vdDz7OQ7unPPLes/p7XN+Ku6H9hpIntTk9u0YL8TqNnvkrQ1kR7Vfe9tnBz8XBHysmTu
         QVQyRruY0FXs5+pfau2ST6m15sCBNtPN3ukevIb7n+x/gLWguDnxcrwJelGxB4OeC7Wr
         XFNA==
X-Forwarded-Encrypted: i=1; AKwUvBzUv5Q2IbLWgrgDF4pmqWq/lpi2UtxlTBx+QAkDF2jADA9/+uiItdIzR+x6nXzn8ogdq1jtxZoser1W1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ikdqc2LBapS+ra1ZU2W5/7leaT7++ckyKUvJL9jTnkPdNpdd
	TttgMuxOm7/FBc8hCTp6899OjZNLh/B8Kb5jsZro2oZmAgZjzr5tsWnF
X-Gm-Gg: AYBFou3MV6pZDwub4DOu5qvchoU7moUMQdSQKeqpnrkLSWw31tI8q8OQtxnPdOvi/Og
	mw+iGRhHPYrApPFhGhwbPQW9yoddodVF5edaR8rc4URr/j18P/TdsN+OOQPp3sJDNp4C+ixX9jz
	RRi1jrp0d/jBpG8Cg+PFHtiU5/CwLjHuRJB+wfSuz0Z9ri2u8kj7ULpCSBMmfqnD5h+KMxo4utL
	/5XCtVvfTxBmpDiE+DNf/KLbkaci9aboJWMncV0FGqjoRZfOab2iflGHHRtfb7QdrvDh48vlBqN
	GSMeOs5dKTNuSRWf/3anUmJ8V6VvGcPlFKkkGBLxDxwghjJfIg1twPW6wnw0iVKNbHdgKHVtSng
	0CG2UHNDvhXFA0IxCgAKweFxESx/BCot5tT2wcb9UKmmtN5//Dd890dIAo7SyAdk4tF8uQCd+ig
	aRZ+n+7TQhg/MLCRZzjoO2X30mnjf7cTz/58us02r7oOkFIH1fjHVSsx4ofZRhRuE8IhDTk/v8R
	Oj3OAsZQ02wcZ63QXCWsV2/PLXcLnRufNGo4VYCE3UAH6jhQhWRESLgl+OBx3vGQ4gFhkKBmqUf
	w9b5hMlwiazExrOP/1jzsQzid1fF55Txg+QTTbAeF3Th223d/qU=
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a18e4e0963mr228220195e9.34.1791874571933;
        Mon, 12 Oct 2026 23:56:11 -0700 (PDT)
Received: from my-vps.. (ip212-227-39-93.pbiaas.com. [212.227.39.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1a1feb78csm154188095e9.0.2026.10.12.23.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:56:11 -0700 (PDT)
From: Louis Clinckx <clinckx.louis@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Louis Clinckx <clinckx.louis@gmail.com>
Subject: [PATCH] media: uvcvideo: skip bulk output URBs smaller than the payload header
Date: Tue, 13 Oct 2026 06:53:35 +0000
Message-Id: <20261013065335.2246959-1-clinckx.louis@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a bulk video output stream, uvc_video_encode_bulk() starts each
payload by writing a fixed 2-byte header with uvc_video_encode_header()
and subtracts it from a signed length counter initialised to the URB
size:

	int len = stream->urb_size;
	...
	len -= uvc_video_encode_header(...);	/* always returns 2 */

An output device can describe a bulk endpoint with wMaxPacketSize 1 and
negotiate dwMaxPayloadTransferSize 1, which leaves stream->urb_size == 1.
len then becomes -1, and uvc_video_encode_data() casts it to unsigned:

	nbytes = min((unsigned int)len, buf->bytesused - queue->buf_used);

so (unsigned)-1 does not clamp and the following memcpy() copies the
whole frame past the one-byte URB buffer.

A URB that cannot hold the 2-byte header cannot carry a payload, so skip
it instead of letting the length underflow.

Signed-off-by: Louis Clinckx <clinckx.louis@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1701,7 +1701,14 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	if (buf == NULL) {
 		urb->transfer_buffer_length = 0;
 		return;
 	}
 
+	/* The 2-byte payload header must fit; a smaller URB would make len
+	 * underflow and uvc_video_encode_data() copy past the buffer. */
+	if (len < 2) {
+		urb->transfer_buffer_length = 0;
+		return;
+	}
+
 	/* If the URB is the first of its payload, add the header. */
 	if (stream->bulk.header_size == 0) {
