Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266087;
	b=Hk7ZGXn7oKyjQZuCniB47Z5S0xfm8gfYIIZIAV2LsIHbIR4Jn4JNtRu84VO3N0IzL0H0
	 BUpARWxzdcu+Y1/O2KDWwIb+ViK8ZmbdrgXFMYS5KWSLZJtLI0dR5+ZAdn/pzlyagFhSX
	 zrWUFp32bUUXcnGP+8bcoEzMLLAmbEnCJcLf3Fy8niji2ITvggWsv2EMBJaLaNpAsnuqq
	 uxv+palvsBu/am/K8Iz5wbBjT0mPbIQJpjOVNzJaa7vTMO2dZTBUd2vmjf1W4EWUCGwM0
	 2iKMR8LsQ8r+1gvvzhcbJYXZDrJQ8EA2c5A7aT8WZn6vvGRWYMavyCk3bid1FvX1v/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=w+KCgDr9UJJbQIx7mC4i/I2OBN1kJKNwj5V2SZ0eQ6k=;
	b=Ny4fgOCzOsDjBg3EtngOKj03y/ywL0Tyl3BU8mZ1Zq5e1uUFzE++tmnnCMaWfXkKr2uD
	 1va+CKxods/3d+5IBlBEiFvQe2SOojS4zIH+mp9U/WHeS5wBcNeHDTGfr0Jf7MD9jhpV+
	 FfugNQPTP1WHsDjRPzrh0Kg8sDsWo8EAV2IbMlSoGKvEgZ05cFGhch1+xmezxcW1gKVnu
	 3HsHK0b1rHRG+lMrghZ1YBwFRtSmxQcps8wlCmZ32YBlxZ58lffJshRb/NAv0bV3aIPiu
	 AFcxIdelyL/Ezos88SwuBc2C7J9P+45l4XQnd8ky1u0L9JeZRloFwfQ0xqIdsuUHjKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXkK1GyT;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F6606A331
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7F6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXkK1GyT
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso16548305e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266085; x=1793870885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+KCgDr9UJJbQIx7mC4i/I2OBN1kJKNwj5V2SZ0eQ6k=;
        b=gXkK1GyTNmWf7o0dX1xpL7bTBKfWl9+vIFq0LUAtw/jC/by41htTXRcD/DLb0GSNMV
         OOsFuITCrsYgHZw2yjXVb+ss1pzvslxE4siBCX9ISWmrUWeyJPpBdeSYWG+93o2ASOwF
         Vf38cTYqwXkmoiZ8/iPSL6Df/qEE5E9Sd3Nn0mHzzes6p6RtgKEDfyz4GFAwPXcrK+f3
         2kS2oCsIG6l8Gm8U03g4izsbQZnuzdlyXR1uG72q9qhwa60ecFUJew88NU+XQY9l4Q5T
         6v15XFE4wiscDhe7IDNfkiBYsVc8pitmmQxZiAlFjKLRXAMYLByj/DLNe2VsdGNYjt+W
         humg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266085; x=1793870885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+KCgDr9UJJbQIx7mC4i/I2OBN1kJKNwj5V2SZ0eQ6k=;
        b=thYzbGnBhUPFJPNiO64wG854DORJFYA2ilTzAgkzR/mfK9IeLqR8F7MpzLGl4OtraH
         Ih8mQa3N9qoIb7OK/W/Mbv5d00BJptRZOZzlNWafueINVZM7WXDyIo+zH+q+z/L3zc8a
         NHysF+J98qLvNdoDuVQP3slAeC+TzgTECLnBzAuwFeOFL12t/1IgkGS7LACywN4rYebw
         ddniJ1FXuX8PtukcfaqG83kAwkvDVvlPvTTDg/rCIy+8TVO7ITPdiuTJPzpbmw+3Zb0c
         6vX7yjU+Bqb+6qlaLvU5sm4wAH4X5+txW9d5gtIyfBEzmnF7HMxtJ5sINRZJmwVIfU2L
         6l0g==
X-Gm-Message-State: AFq9FYIW+ehHEkUXUnJJQeXIQmDv6xC8j8Ru/qt/6rZy5tJtUwWlH0EF
	fQnqKaillpRvZr9do5kXg2zg8pzYuHhFlij5KLPqQwG8MDpDeJkm+a8HFfuhi/G/
X-Gm-Gg: AYBFou36QerG1hs1Kdj9f2iiSWXCkHwkg+CVwx5NiGcEkiZ7smZFH22QQ4eft8KOqDf
	qOyCN8wbVXZLbfq+0DY9svHD1jRdavSZT6FndqOgqVwLjLOLIhFU2Hb+QEipiJHLN+c2OfjL6n5
	x5UBKXQflJu071BhRbg/cHmppUpjA0Cs+ujEhtEmJyT342QmdiZ4WQwiX7s5F7Beb5nyDRsfT8q
	8iLz0sq+TgFabzD6RYp2U/6sZ5MCkhQb9A4VK7K0Ch/H4HOnj/LpHNJADs3Q/dxXSyHRwanbWA0
	HtF1de3WjIuQ6wmKO+xWoMfy9pzdqKTxKHI4G5dxvb3FVsx/esGCCr/W1EC1LhNlMBEho7mV1Xf
	9WE+Mucn7QEEsCQnJ2rj6qY2vKR138ekvOBoIbdTtfE+WVRtjvw/JPlKuL7jwDXndi0PQ4zJAN7
	damMMG8EhDO9gcXg9NBN/EWGtbqfa05XVEpj57Miao4Nk7mcU7oV6UGx+yz67s/cE3D+U9fB8Ml
	KCyPtMKbeJOiNliDr74BejItk0OBObdoywZ1qVZHWwcSvxBnOLlKrUYGQcqyOq8YwyVQ1ArgQKq
	cuSEwQwRBjmFTLnZzzof4jLQ1sUtaHUaxliWTnBTZfqAjWY8wB3hC/rZh6HdV08jtJ39NRdX0eX
	3iTQsWTzHbHWetgb99RLdtudKutJ9O2q0+6zvUSIVLG3b2LIIM0w0IucqMU9Qglc9nwRQ
X-Received: by 2002:a05:600c:3541:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4a9672014d4mr112987925e9.26.1793266084969;
        Thu, 29 Oct 2026 02:28:04 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:04 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Date: Thu, 29 Oct 2026 10:27:54 +0100
Subject: [PATCH v2 3/3] media: i2c: ov5693: Use autosuspend when stopping
 the stream
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
Message-Id: <20261029-ov5693-fixes-v2-3-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
In-Reply-To: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=1994;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=BqAoIHyVW+q0T8uthFLboYE8msP1bRHlLUc4VCxhsMQ=;
 b=Y0QvG3xcjMxxLXTF4F+2flEq82TPB7jiPZad8NGBRrx41VECDt0aFdmfPrXTHRbjwh0dKJgCu
 bTWvI5jf3TADUeL/wFqcbs2nwGwxWQDvoxU2XyC0rNuU8rzP0np3ahW
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

The driver enables runtime PM autosuspend with a 1 second delay at
probe, but drops the usage count at stream stop with pm_runtime_put(),
which doesn't update the device's last busy time. The autosuspend
delay is then counted from the runtime resume at stream start rather
than from stream stop, so after any stream longer than the delay the
sensor is powered off right away.

Use pm_runtime_put_autosuspend(), which marks the device busy, so that
the delay counts from stream stop as intended, and a following stream
started within it doesn't power the sensor up from scratch again. With
the mode now programmed on every stream start, keeping the sensor
powered between streams no longer leaves it in a stale mode.

On a Surface Pro 9 (IPU6) with autosuspend_delay_ms set to 3000, the
sensor suspended 1-2 ms after a 5 s stream stopped; with this change,
3.7 s after it, i.e. the delay plus the autosuspend timer slack. On a
Surface Pro 5 (IPU3) with the default 1 s delay, the sensor suspended
as soon as a 2 s stream stopped; with this change, 1.1 s after it.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://github.com/linux-surface/kernel/pull/181#issuecomment-6436016335
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Chris Simpson <chris@nilk.net>
Tested-by: Tony Garcia <tony@loafecho.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 9fedc087e..086f9df07 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1065,7 +1065,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		goto err_power_down;
 
 	if (!enable)
-		pm_runtime_put(ov5693->dev);
+		pm_runtime_put_autosuspend(ov5693->dev);
 
 	return 0;
 err_power_down:

-- 
2.56.0

