Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690484;
	b=cSXIHaCEbgjAd4TB5ZqcoYq4pmJNhW3ZNYbUjstIYjJpSZF4WFAp2fu6fHA/VXjc8y5A
	 vC+ulwkLaSXzwV6gwTYzz6LbtvQMjHtnLXWqvCbOKC7ihecsbwdKDjyR32a14n95rplQ2
	 CHW1ZBp3q6xMU5Ru3XPTmDoVo+Sg+AKbvmeaUxyXCnC31ZAjd1uUr/J8TyTNbCqu81RxF
	 fukcuWWliJHF+kz31QIOZLHzXG6gQ9ebsp4+payzx4cRGc8TuNR+Gly08umaL+xNxMkRd
	 C4JG+CwWJGxigTrxPICgxqXE32xftIdM5EyDROOFqFmh+CkVv9clQAMWnP0sZES9L4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
	b=eab+CJ34TZ0lmBh2DWsDOoDGWui+Jn+wVaZHEsYEAqJ5ig7SlS3HuS68y66mBy0rXnXj
	 FLYaVE0BavfpNh+vEWS2MzjCRIrhrwQWiD2sn5H3FylaV1ZUitsNoH3JKjaexI85OA6x+
	 6LXMSp+82Ba4n9twvP0dzkKBtWg/ywv84ZIpqaVGBIC3a4EZ/jvMr9AWTb+ltmnC1teYo
	 xoSCKpod8Cd2km1FX3QPzn21E30PCCgeQ1EhfHVyPs0PvBpQsArOb8HBh1VCdsTdWxxus
	 oZMjzzM3ReJF+Hmd/9gSPdwpx0xPprnqvl6q0zqr/jB29/evBZqENZ5oW4kPFEw1zkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=oZKn81O0;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EB460A5BE1
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EB460A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=oZKn81O0
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so28937f8f.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690483; x=1793295283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=oZKn81O0a11SpkUNeq2NAxJwSgzjpEfa7Rt7URUvcUigkeVeR6y+gSwCWzHGJgosfg
         oEye/GszlPOD7YktNmWOjC+tXfVrMfi+810862/ttdzsqpjrDR/hYxTLwWLFDQNDbFTI
         2Q19Cq/w9jF2bSRVq5iqWbmSQnIN7SrfdoWM4dbmajBGEenGW2voPdZRNER6A6/DvhkN
         9rRb1OAuGH5cZkrUzLX/1G0YjPYWfMuk/1Zj0u8rvoWNEnuNQrosVWs5+WoKwS0E8SM1
         QIo7unWbf6ybwQHolfuEmMJLUYGidpR/fkjyyeN98xbiTZAtS3U1PsulMvI34hdjzDcc
         6wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690483; x=1793295283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=vOL0R7WO3Q9sE6odq9duTbq5XiultnFnfVFYZ90KcaRf83IRSNfMH49+h2wdSCgYgg
         KAJDir8iIB0ShW0/RdVL8jascZjritWGsIsq+6Bg7AO/c+81qo56Z9N03WBykKxtZE2T
         KSrhzaTnJJcvVRQEVcdXlY/wMLq3v/IYu9ZlrOtqJuzk5+WXMH8lQiWSuKBx4IX6s3yB
         OKECZvHnfJm9IjBEPLzVj9pqsEgoZf7yguMxHu8aEfGIfF3aRsEdreF7nY6tTt3UT3yD
         UkgmvtkrF+Z3kvjfzI3JCnaqOH53/ObaQSw2CSBHuGNln22h5usey6cHa7KDiu9GQ4ZI
         JTVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyRxPjZ0SkOSei1hW2vOhxZw5A9k8RCMxcJg3kunIi40hg393U8ovfeHjXiKiyiQjisazQqowUnSAayw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLq7fUh0nNfjG6UTxUOmRV0NzlHVkxspEXRs9L0uiSpjfjZes56
	du8vlVejBt9zC2gBgMDq/EJ8T6KY4tmjMZ7/v5mURSLzaGarEHuZjPJ+dJnOgx8Zb90=
X-Gm-Gg: AYBFou2ozBlUvOAr3a8rE6VF541v7JM/sP824TlGtSmhEMUqgvd+45nXeGkfX8BPEdN
	e79b44+VLRMyIyJLPIIuXG9T+1nYz4Hf7AvtS0n/u5cDJjpbiz0oHc2x2PldVUmjSqI2Ftqcf3P
	Kw7926qg97W5467eHfm3obEoznbqwhKigxbOsr7qE9FGHwnqfTu0hR4FDtKiFv9OHIwi9zXYE2h
	BET6mTzzEZyFZ2HEI6IP8dhoiwYj1ocUL3ffz/vasl/fL+Lf7kE4x88gDI/l7dJczkivl+0Q8MD
	cInMGnIztBtT8392mSMCGwQ4/EveAldZY5U//JyNK2vzNFMkci80ejZDjYE8Y87fbqaFAIDbu9Q
	zNFgXt7AJ8kTXedlsmkOPTcTA6EMDpwgJFQb47pp1y5t9ta/brHKKzuV7EGEA0PFRWqmXThHrGe
	MwukmWfX1hnq8pBEJ5bBnKAbqysVhbM5DdgJMhWfXiQJwyMYhelc0zry/Zf1z8vkazwWQsTvaBH
	VGiIBLb/0F91ODffp0VdNTDcdyxQnmuHVTwuh5E7tsbytmSNZMHgPhvxOwE90Hgqb5SO4GrDpyZ
	4BpqqpTBfZAzc773nCdth+iZSKvRDYw=
X-Received: by 2002:a05:6000:29c9:b0:48e:203e:84f0 with SMTP id ffacd0b85a97d-48e264a7cc6mr8368922f8f.24.1792690482821;
        Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:07 +0100
Subject: [PATCH v6 14/18] media: sony-starvis2: Only update bits for window
 mode
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
Message-Id: <20261022-media-starvis2-v6-14-374343f55fd3@raspberrypi.com>
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

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 645417cc08fb..e64d943369b1 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -89,6 +89,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1460,7 +1461,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

