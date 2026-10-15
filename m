Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCCD39DBF4
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079884; cv=none; b=qVWIPKaLMrtfs75lY8K+B2gLVdprW4566OtxtUxtqbd1t48vpXuLb4xrn2xjT5bT/0xPpWpiAAvrV5+Qi4Z/fY4+96TiCRVWENmhTwboDkEg3G14KE5eVb+pVcL5QmhhRvotScoA8ii71eZjDhnNmrCZueZK+VpLhBW68GLCANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079884; c=relaxed/simple;
	bh=UIX4CHT9uj1+8MpaUJcFHq6eB5vI9kn09zdV0fSjOOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbR2OXYY982XM1tDpZo7PC75db+ch8iEIQ502d6nSsASgCtCFYd1Fz4JW/e9wWGFwvOARQu1DpI1Y8ViAixqq10kIcxe22IhaSeYLpenEpG/yskp5Pv6qagIy080qpSvggUPu4vn3awqU/aT/8EYo/OBb10l+fLWQwjOHKTrkGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bLJkTPFG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bLJkTPFG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso599432f8f.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079864; x=1792684664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiaI7PJTLTIOMlYMByTXCawN4zOurtnfoVaJirCKA9Y=;
        b=bLJkTPFGtfiQizfbch0yB6R7ewB+Q0g4p/JgI5YCH+In5TQhCgUzCn45Rn7UHz8qmi
         osr/DBbI8S0uKnh996fijfBodcUsoavZLAxxMrlfEAdw/JdOf2r2m5zAVfC4PPF5QVi+
         V2DaUzCKys9YtrFYXbGKLCdYF8a1toVQgaTRN+i9TSX5ijob2pA+q88ADRHuC7e87Ub8
         Dfj2RYKt7kDLHzjiH3G8XkQa2NwM0405AgPylgV63xBzgxFjWcJ9r4zSlRfOtLDpBKYB
         g//uoUxsxzYOHAGVMHvRbkB0y63GYigMoxgsDczVG83SDttEl2JPe3YyMV29xM7Za7dF
         1u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079864; x=1792684664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiaI7PJTLTIOMlYMByTXCawN4zOurtnfoVaJirCKA9Y=;
        b=zrcpZhbb9UOxwfMZSDmdcVQc2P5Hszk6UABCBSywmWdpPqLmsikZiIK6dWyCbuSlxB
         7nr8uWWtM84OGqrKcp1sqQZal6KgvxYyYfNATI1dwf+ilvGJLBsaA3AkuuePOwrTh8lv
         14jRi+5CNClifYwB7h8ASuY4oT3p/o1iybllWSNBiSQqdf19IvEbJFe9rWZu7L3CMqWG
         Y8QHDGc7gDGjquoChgWLGDJarOdUdoBMr56UF5Wi4F6c0fixA4lPFPnMwjGxCmxaCZmi
         yXtfYDgLKRsuAX3e4/Qr3NR/X6y6xlgSTYa4b+uUDxh2QUja3T4pYohTL8znE+CbOkH1
         nzFw==
X-Forwarded-Encrypted: i=1; AKwUvBy+JuS4K77vmIsIDKokJvLSjTTR269LR6KvCFt1PrkAtciAxEO9DiHIaOeh43L0iooP/yc562jq+g4lkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1jlYrsS3fplkSBAF3C2POCSac5H5oKiNeTuP/8treIOPRW/Pe
	fbopH5sPAhVY37nocUMDT5m3BiIlaoDD0PTDzJRAFmB/Pc5wSHvA60dwsCgZaLDuAU8=
X-Gm-Gg: AYBFou1/5+gXnrwiC4EHtlIGzSaXjM/2cqIxRRNn5CZjU8jb1iKSmsQ27YCteCQNlbW
	s/cGijN6REmpbHCziIPncBFh2MYRtfkPmAD0hTTlSknwxsydJeWf2cNxL0eUBlcF1LvG5p7XOsE
	m06IdLL1oG/jzz1w5TvRvtcFizrSXD/KspJjJeqTqvqgbyzDco0MS3Lh8SFi28ptx0u/FCh7UFB
	lALdhPo1bQfJ0U2BEzhBJBIfq9nRxks9qYUSBOLOaVIayqH/4tk2rUTOO+5X7u0PxGQgwZfludJ
	GnMIvRCOBB7BhtgSnuQ/h67CowHtbc+A6eLN2hNhZfUKZYanDgStGcMEt6FQTbhv0dQK/+wUStI
	DbQh+DfAl4mGKNHnhLl87LTkPR+ScEs2Hh5F7OtnGrjt9jj7wvko0Ke9nzIELbLmKHwfTzVtEKD
	jN6mmMqsaWG8LBbAkMrJDot7iSfg9O+CNdQXQd0BTYRDX+NUMlQrOoZkOczHSKM5klEqgjLCyZ8
	E/C78IorXFOYldxRZd/wnyZ+xWi1EAAfAdg1zU4NQcQdGXR6g==
X-Received: by 2002:a05:6000:248a:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48dbacdef01mr41734606f8f.39.1792079864318;
        Thu, 15 Oct 2026 08:57:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:42 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:33 +0100
Subject: [PATCH v4 07/16] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-7-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 02199336010e..10f91c4b6db3 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

