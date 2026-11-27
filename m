Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821111;
	b=h6dS3fA+mxG4TAM9zAVYyWGBKbyK3KABZwsiA7Ws4UMoNSzfg0pJprXmLOWN04Zb9tOp
	 boQF0vc0BnfzHKTmdys8EqElUWUqlL/zhFpSmZJWUFInXR2AM9v9DrSQaxz8KbXmn/XYT
	 mvu8IbLE9rj/X6YxKhPdqPVVILkxeNk+Ra0EmaAZ+KC3AdJq2qt1wi4ZoWUZhkXAsKfAc
	 w113OBmuetXPTvISNOgoCL4IpdrQjWDIcv6n+kUTo4pYE63sMN770NPqy1QvNGzvedpS4
	 L82LPatZAWeYE9xlWGccEsrbUr8/NCDVRV+WIQg3NuSoz7riY+2Hwxdr4+6NaoNdUvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=PpxoeyjYrCqY9eg6ZscAnqGD9ZnSfRdjl0ZbWcv5AAg=;
	b=gBfXYz5tcGYff7CoeojzIdt9xGydNGP/A3LLJWMXsOhKGG3I8pk8TDuWeOp6DJDhfCQM
	 0q2RfLhmUZoFx3Lp3BvUG9zTSwDKy2L8Eg6IHwwwgoDkEkoN2SMsBiV88+iXZ2W2qGrSy
	 IhRO2KoIo1D0PwKlIxjCuKit/oV7x1kCUkQt9ZsenAg+MqPG5aME2WLHEHfj2D/haVJkS
	 YZjr5EsLC/HpGpO4vxt4gCGObeBN0UtxpzVBxx6sB0OzpBggK3YGihFZrwXhwM1qi1suF
	 prdjOjjqdmPiOHcp2iJTS/jIGc2oKTczoTeaxJiLFjCDvEwJy3xiYECDoYt/wyvv2kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzGgi89M;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F0606A6A7
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 23:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 541F0606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xzGgi89M
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so88288015e9.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 15:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821110; x=1796425910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpxoeyjYrCqY9eg6ZscAnqGD9ZnSfRdjl0ZbWcv5AAg=;
        b=xzGgi89M2S12Xqojxd9tP8UJOR82cF4rXhnQ6WcvgtlMFxAleliSFhqNTlUkum9zG3
         Z/Sbu4dNe0DYS/n5ccfloB0cdtELXtNEIy33NBIFm29YuPlmvd2UeXyGdgv7M5iFwiHJ
         JZ0Yhg1XwyEY2tONGzHqmpgWdPtVVIisBTGidWM2rvPxDClXVPN/MKim1FWIDiJBe7QJ
         8bHqN4uetbe6FQ3XDEInLENjS/nPISPP7uQxHCTzRXPfI1lv2WkFI7u4Zt6FOs5Vv/qA
         6uZ8bSOSR239wUIRZrt2KqMBfzq3gojslz542wo5Fw/ud3HtHS2uhxBEGGV4F7K1gQyd
         pQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821110; x=1796425910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpxoeyjYrCqY9eg6ZscAnqGD9ZnSfRdjl0ZbWcv5AAg=;
        b=DHmgASgGT1yDOBs/50bdxXJu/4RCr1LvQU5IZ+OMQuepkL2GuRYmYJZybZ1105FZzR
         0kn1mZfdrZ/sH33ryf2zhWGYFQoFdOHmtEcVkJRs7xqeSBFKXxN1r9BpdDRw2iLwn/M5
         J3vr0Lg+T7XEbvh9wvcwwMgW/yfBxoaZBtt007/iWTIV3uqpM2U7fUvlZ2XJOssXwDvE
         7F+d3df21hEoQcD43h+o9AJrUQjwiQwbP2qzPqoXWchDM8Sfr4erSBxzK3IRqZQsLfkA
         dc6dJyxcHeOhmw9iN5slWb41Ls8tq6sh+SGGlsAbukFT4bIVpB/O6F5Nzh82LbdfXolp
         Wp1g==
X-Gm-Message-State: APuU4Z9upxf6ONYEWR/WDXq+4czqxDrglf+SwtOY6TdYGpcOEDXbzJIL
	iyEdBcZEhOCoNudO9Zn72cDYhSa1HpCTbEDcnK9mSTF9+ud2Ypr+Ej3mKSVib5JW
X-Gm-Gg: AZFdTZd6NAh9Y8afzvyfeQY49gS/N8i16/Jy7UOCR8xqOmx5s/OwAO1V0ts1sTpsD6J
	dl5qQ//gx6bfLF3yUf6lehjxa6RHDEiqQm6IiAwGmeppaN5fxpqKOKGA4rdvbLcNwML4iiZSBfQ
	8ynr1yEQq7zSF3wFLmLs7l4nQp+USahx5qsewvRYvBS1gKtzdx2A7ieyblsZR7+/IEqluo0omFk
	EqvJQXRLOdav3egEGc3ylnoHsmimOlZzDjMYeXuZUMiN+LUu1vQ/X21oAAark5dJQMVkuMx1hc3
	1hLrLlO/VSCvGmjDVB4GURw50lzPzk7ksdGSSeaG+R54TcD0MgNO1Px5QkzqhYOgfvlIQy/yBmv
	INBCUVCl8rLzvVa18KPES7/6wE1e8jnJ4N9q6/iIQHO4yFj8bJwXRO3ZCYGdXmJxVMuAu+uPQGy
	VBiBNADXmMWQYkylAyL5Al3j//ACfaz9+Ykexgx+BY+q/rF/jJ6BdN5so5zE9hvpUvEVrCuNxLn
	yMdCBYKbuZgTwXFfnfpKcmu6qU9NQHvteAMWjNN+FdUgkDXVyrSbxD29CrccKhoxcSWQFeBgvmP
	7v1ehH/qe722eGDKRTQyFAk4YYMwO6pjP0ySYnYL+eD7uvuh27k+ENMtHzV3qAblKDEZJ9yiWAk
	JZtPqRRaLCt3JNlDyAcRsV96ZzFDEUSQiiO/i6E4QZg3KqfYa+Ph3dVW1WMsz7FXNb7yYf8G0gV
	+r+Wr/JKVoE1w=
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr494916255e9.30.1795821109624;
        Fri, 27 Nov 2026 15:11:49 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:49 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 28 Nov 2026 00:11:36 +0100
Subject: [PATCH v3 4/4] media: i2c: ov5693: Use autosuspend when stopping
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
Message-Id: <20261128-ov5693-fixes-v3-4-bcdd169958b6@gmail.com>
References: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
In-Reply-To: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=1991;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=50CDNpEVkpZUkj4rcLzBQPrrm+eW1uUsTRn/4t6oC/I=;
 b=HYMhyGaHk/c55honsuCe0uxTYDDTQJv6CrCKQjSkEcBsriRAaJmATvwJmg/TBW/Y3KzzUYqpj
 9AEkFrzYBuZCBThC6CDA14SPFxLB3hG1pIUBLOVWqqIQWCmwy5PMwLF
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
started within it doesn't power the sensor up from scratch again. Now
that format changes are written to a powered sensor, keeping it powered
between streams no longer leaves it in a stale mode.

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
index 6e76e289f..5c64ae063 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1098,7 +1098,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		goto err_power_down;
 
 	if (!enable)
-		pm_runtime_put(ov5693->dev);
+		pm_runtime_put_autosuspend(ov5693->dev);
 
 	return 0;
 err_power_down:

-- 
2.56.1

