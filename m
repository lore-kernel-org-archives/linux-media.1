Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830206;
	b=acmFLKLJifs2b5r7hCRZMoTahgtolnqfUkZiPFLFmiHkogKbqd/KLK8liygzpi9YbGTx
	 mzDO5Ps12rrtio0Mzx0CEOaw6iXQjBnk1cILRE9m25EGwLioR4GTK5Dxchh6dhYH6johC
	 8gkKm+/bXcad9F++6AOOUAV1Hb+6e8HDIBZ1OJ3KNLnfSF/pJ/CFRegmuqFJY+tlhZZiI
	 u6ml3i2S13/SH6oup9u+a9wIzqldHURal/TVrfraVy+lfVjgsMR6HVD4xy9OUEV2SXvFB
	 X0D9HnLrRY0W1fkjNOMq71rOEpldVhdJI2eysStKMN6K4QL/ZkSMhzBQ9YDhtT+Rf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=v0Pwk6CaaHvFgXY2gQX9zn/QUfhEytg331EKFMXCHHo=;
	b=YBNYn5iLuwsKuDg71vXekgJeDx7OXkbWWY6qeal+3oVM0WUqqRi0LBjmpxa3l/i9Lzfu
	 0O6Dy560VZLk2B2VkwQs4ZGY8bTwfacI9hBXKRPoG+2+JjCByZXJcw4wULfWE5mINdi9Y
	 AdBH3s9KVtL6QF4mvr5gdM0tDjgAxqmjld+wKo7Rz0Cp9kBGl8zuJpRPERbioztpSM0I9
	 uTooBXQ8dOWMo5cfZMD4GlQChj9zw+MCTz+d2+Z47IsMGw58kLY9t1XJj9IFrfGZRqGJA
	 /SYauc6QR9n1ToxmTYAoyGH4+mRRrJ0hblc8WTu5kt5uC7AttTT93lpJEjr20vc1iPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K6QuAuQJ;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C01606A33A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C01606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K6QuAuQJ
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab46699a09so32727191fa.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830204; x=1795435004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0Pwk6CaaHvFgXY2gQX9zn/QUfhEytg331EKFMXCHHo=;
        b=K6QuAuQJWUkxqikWrZ3j43wGho2vSW00MBfV6rkA7bNMYX+be0i+viVynRYuY5ml38
         YVrbqqzWKdh0m2MSTRvE//kfuLRd1oE46xlPusARo7KVc9lSv09uQD0wtKhsIsf93A+a
         cTQgmUbRpg7UUd1w+0fBDYzAjItWceeqPN+tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830204; x=1795435004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0Pwk6CaaHvFgXY2gQX9zn/QUfhEytg331EKFMXCHHo=;
        b=ReYd+BbebPXGwG3lUx8H/VdjWmPeho+zcd/7l22blgndU1jk/HcI3QlyRDxRl2DxA1
         QfwKsCbggTCSCTBqjQZ7+GzhH1i+Jsmj8AViEeQPYbGexbp8Wbi4/HCCixXOU+kUR7Wr
         4tvJfmV6AbRcVUfHsm9TPHMYDjUo28xFDjOWUjMKDJgLnU3tlPW7FMr5CJX9xDVb7PS8
         k8hcjgHTzuP2B6NG2psQSFNF9u9eXkl+owSSqablRxnzGBoyC0TFHUhK8Y1tpc8cE/5w
         EGYX0v81GKBON85zp5IVzJSh4OtD1QbnzA9EIwfOkZ5N0a0Zu1axSvLeHmGivVJcqRs/
         i1Vw==
X-Gm-Message-State: APuU4Z+rnCVbXNOKOOVS2208YfjWBk/qz4S5uMEerRESlPHfnBabie5j
	xsx1heVUzrCf7emyKXBuyBak3yk5xjMJBvOwVA0n6bEKNGaH+kW+Z9zpXy++Y5xqZQ==
X-Gm-Gg: AYBFou3q59v1SjjHOgqxu0Vhl/Y1Zeqog1XDt+tCNFnXnqRXEllu4FwXnCY5bxHNSB0
	E+JITPW8cBkcYs3taVO6DocysM0hi1sXoE7+epWWltvcy2bTNox2WRyLEbzH59Ckj/Fd+0/uSeW
	SOLQa1joBammvlvOQZ4qAl7/jBgAZ2fsg9b6LYBGrAjO7aSM+YjcU9hPZ7CEGSL82vbfLNIknkt
	AJ71BcmxKpcA3FjYu6mcAAECLMeSfldFRwj94tDdXfOwrLLqoGBtftrrPacGcsgV9fBBsASvFEZ
	pwtcAisughJu92vwDSIjQi8Q107+fiM/gUTV+ZyUN9ZezFlG9RB86Kho+hH99QR9CvoP/epTydg
	XfJp5ZFZD0ZIpnmvQDR2drljd49HqM0SK1usabx75rjH2sQx+OeY+kRh2g4SpQ2rdFb4CSqNu3c
	5DPSHZ80RaNFZz05OpKlYEqZ7h2AJPZ4RfYieuy64OzQb5ejoE3T/d5A26bJbQnAQ5X15Q1AFYR
	Zpym2ljPaODSbal+oHab64ljgoz6tBZBe1ANrolDUEYKeTNthVLJVJG28JbE5PuVtiNLsJsBWfb
	lZK6o1DGG9/7T3k68gZDzVkYoPP8M0PC2ykmWtzd0UTuVcbjsMZcdFKFCS4wLuCPnzr4GWyV/cG
	FLLE5lMNeKg==
X-Received: by 2002:a05:651c:993:b0:3ab:2d74:71e with SMTP id 38308e7fff4ca-3ae2b4eecd2mr24839651fa.10.1794830204243;
        Mon, 16 Nov 2026 03:56:44 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 11:56:37 +0000
Subject: [PATCH 1/3] media: uvcvideo: Reject short metadata
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-uvc-shortmeta-v1-1-487cfe42fa89@chromium.org>
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Sinan Turunc <enscrpt@pm.me>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

The UVC header has two bits saying whether the packet contains the
optional PTS or SCR fields.

If the header says that those fields are there, but the header is not
big enough to hold them, there is something wrong going on and we could
read out of bounds.

Mark the metadata as invalid and move on.

Reported-by: Sinan Turunc <enscrpt@pm.me>
Closes: https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me/
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..9cc5d83acbc2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1487,6 +1487,14 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (has_scr)
 		len_std += 6;
 
+	if (length < len_std) {
+		uvc_warn_once(stream->dev, UVC_WARN_META_SHORT,
+			      "UVC non compliance: payload header length %u is shorter than expected %zu (flags 0x%02x).\n",
+			      length, len_std, mem[1]);
+		meta_buf->error = 1;
+		return;
+	}
+
 	if (stream->meta.format == V4L2_META_FMT_UVC)
 		length = len_std;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..59e23e55bc2e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_PROBE_DEF	1
 #define UVC_WARN_XU_GET_RES	2
 #define UVC_WARN_QUERY_CTRL	3
+#define UVC_WARN_META_SHORT	4
 
 extern unsigned int uvc_clock_param;
 extern unsigned int uvc_no_drop_param;

-- 
2.56.0.679.gc527c65306-goog

