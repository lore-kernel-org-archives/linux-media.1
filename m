Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690473;
	b=4xZ+Ld7nDBOILn5axu3uBWyGrh9cY/WR9PJntztZns72Krj2pzZQjwoL9GY0ceWs8/MP
	 8J1gKQ7NuHWmgIAwwGnGQTRnLmbygNIZ/HN1y1lrZqH0YjGAy4yV11feDHM6cF+QgHMX2
	 /oCaTN2QtAgh+KFgF7A02zxf1x+8zg9/iNB+4c+d+S5qQjL2jIUl2y6vlFNHywjpmSJDM
	 95JbB5Jv6oeQwp2RH7o/K7XuMjeTnnr29wBejL6OZJQHyR8UF0IxR8rVvbRPJUh8Ig0Yc
	 2DG2UWcQKxAHiB02zbzDGRlCV9kk6X12+oUQCKDaUht6bLEMU003Wif55yCYd4YL6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
	b=K918c4FIBpeSBDc8e4SOZZnhbuVdgJEtGg95vBb0xH+JQMqhmis4VSHHf6l5V7O12GHu
	 qhDCBpDNFwZhROGm1QSYiQNG3weAq+U7W3ZpTJn+kZkELnCzaaS4zWSfYkAAiPvr68uIk
	 gUV8IKFAsTh+ov8UKWSc2SWo9QhFbXjECHl1ljzo19UbYYdSPOywuD+BxSIVQ4NMGeDrI
	 GjI8UZhMsGs/CNulJoYc25alHkpVmjurQA0kYltKk080BxdlYIXbfxld3tX6RzLgFKz+L
	 wOYPvN511NxGeUzJT4LFK4DSQgQa67Cwfb4Vl1BZiSby6apYMAIJ2BcFSkmLlDbyu9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=redEqoEx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A83606A339
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A83606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=redEqoEx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso44235f8f.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690471; x=1793295271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=redEqoExeBfRPB4HydW2hut2CDqjFdcbosZhclRkDYRZsj0r3PNwR6k4MeKJoP6J2T
         NvEjW+piKiCzWFYDMcWAD4b0BnBVr1nr33fMTixOcyVm1nMlxPjhZceSCpxsR0a7/ILu
         xmgwlev7nIsAQdVM7n/9M/yLmU8HQeCdUKW6ksHJhnSsdu0BkocGKStaYxaa/U4WbblS
         2xrnWk94n2NwSKa39n7s8DP0axdnQIzTkbhR5X18V/0eAaYOTEEgmqwtynxEb8vVzzgJ
         gsblAOloKSoprmBR+c2APf/9RU7mH6QEDaXNsG2qRYCxEEt74UKRGhnU7nETP4ni9BEl
         rxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690471; x=1793295271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=pSwKOFXLiSdB1lvN/1LQnXqraE8RvQlvwHfXAKQ6kBzEUEXnHPuU81k2x2yQyYFFXg
         M5Pu/ml3bPe9qUPAcII6T2EHVF1uiWqm3l4US7S8fuIEZzFVgrGZB6X1XFVLMNJhyWS/
         /8mpT9fIuxBMbIGM1pMzrTyelhUfi/oNrNZ++7pRDcooQhZR8Y0ttqTbsDxoqfTsMTR3
         ZacvMLMe3zUFOzYsZI2hG/kLl/keFtTMGXYoqpnEpAk/kVfWUEQJ0wPjcyZhipAitqKI
         P16WzP1m1Ly/4dmWrkktyYxFr8VBu0MDR+LK4jWx/LxMo/o5ZmFLrY3qychP37t6bUZn
         WqKA==
X-Forwarded-Encrypted: i=1; AKwUvByQIbuUq0Hzsdsi9dD2FoxDzUw6rkxREbi6ebpB0H2O27/lxQnR/qTYYuW3+PcjvoZYy4h61t8t4ME4UQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/0pFcB1b/5aeDqJGqInaxcQbeqcGLdUNjeWitq/CBd1U/VIgE
	AQ9jJ0BRevvFTItFX/MLCkamNuvN4b3rczuusHyoDkvrcVbQ+T5iAyeuB6vtIkI5cBM=
X-Gm-Gg: AYBFou1s9u62j4tAytarMT3X1nDx8P4FjDJtrNjvTl8KCp7ZoHFVTOa/sPx0RPjHEoZ
	1Af4qpiq2Snm1KvEbcbzyHhrbLUmlFFfRicMaNWrGPmSNSJbQs0NIqugD7l05Qm9QmZUWKHhnyo
	eVqo1MEW9eboZlKXQkj3rTmUNcc9cpdSlLJBxbcbdp6uYpW+5t/cRLcMPmD0Xy0yWclOyh0Z9Fa
	TpTERvFjF3LPXHVM1fT/gPsQEyRa52nh9lQsMj37Nx6oT4+yXPwUq61cwINqCeigXxZ7S9134Cg
	vo44o9L8lWOv8plHWc0aBqRLDV6y2o0ssaKyuSMP4J/jSq57LU1KM7eiTa8w9Y3cdj5zCcr1nsu
	ByWdiqi4T7NF4UVJ1z+gK8nLY2xUbg+qYCfRwSq+0MuRNe4ckgRf/Jy7LD/vX1ORldc4L4zjGCx
	T1Eurc2Pp4X4X85+PB0zUum3vFV5FvJINRKQL9f6kjPBCxf649D3ADjRQ3fgGMqRdCVVl8RB8p8
	86G1Ur4vmPuHzSUlPnuFa+B01e/oVfu1VHoF23EtYjwXpl8PLvXdNsEQArL8T/0vbCuo86cuLHj
	4xg9ErSTqpx4b968pQUUwj6TldsQDdw=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr13082880f8f.56.1792690470487;
        Thu, 22 Oct 2026 10:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:56 +0100
Subject: [PATCH v6 03/18] media: sony-starvis2: Always program the sensor
 in window mode
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
Message-Id: <20261022-media-starvis2-v6-3-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 134fececac5c..31aa1ec6ba40 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -923,9 +923,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

