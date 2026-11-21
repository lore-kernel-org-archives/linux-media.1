Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279778;
	b=wsSHsHTUu42mXH0pDnPrtSNk68KDLuNm7OlYtRlYR+KC5Il2FoqCVi7lWOiyXi/Oem45
	 87QMsithAFAtdmwtbPUI0BhC4vTq4H1Drb5YhQP1xLnOPwgrAL09huqc7ZQY5HyklmG0B
	 F1qSQlb5/bDbFmNOknqe8Cly8Hf+Ad3T+sOCdnF9u46GysbZA35cJIiNZOjqerQi+5/pI
	 7ATbP5HZghAygCH7gWt8w+AqaTVUOYmd18aUT5BP6HKXAuEZ3h+1VSoF5zGeRuqeC2lX5
	 Cc94kRsJVerBecfq5MVyStG+iHmKSNzHfVKfVcc2aZUMnFc/DJOYIyBENnk4AvNIT+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
	b=RAVFSEkRScJy9YQ7E8eoOADoK+oZ4/HJi5B76QUVavPV6kAuylSp+JffE6bq5xj3PtkQ
	 lCWOZ71TaXCQYUjQBuH/tuy57KrNBKAD6PjvFh7RQznF83SWmVjIRcSsEkngps7Oypbiu
	 q5LLaiq07mc/h+8JLOEXfEmK+7z6mXcI106IPVKEOxONcXO27hE1nDu9HPvp4rvdr/1du
	 237X2SGBmayiTh7bWCPzdj0VfXgnL7uaQar8scFNa2Pa3GZZ/e7DVz1rqDcgIMd2DgX0+
	 xSnUMUgwUO/gLuIwptcwCmK4CHXUgQrykAU7Vk+enfBh/nyOGK8CLeML6cUZ8nji6tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C384606A68B
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C384606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S1NccJw0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso22097825e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 08:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279776; x=1795884576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=S1NccJw0Ms+NHuzySD+H8dg4z2d7XLQp651/mphadfSwCAJxOZksz4J6/G7lFu4C83
         wgvpoYo8mezwD2HykkrtAatmVDpTlUPXyfM1Yk47PAkddq4KmODejoLVmjmCXBghfPcz
         G7pJ2/mggW/ix9QBknkTXUrLaGIYZLl/RPYuF+Y/e/rpjiiTKMMkAQRBWKKGcm9vw7of
         IGzhEjSSAM/t8gK86Bjv4faIaACHEsW9crqzr5bYd7Osv/lYXikDK0+kwJ1gZrJMCLWm
         4mkUzKSqchtA5U96FxEN+CPjRFoJOlv6McHzoNFHIx6SWGeuYuE0DygUOYEwmwMAKTwH
         LY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279776; x=1795884576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugnNXXIsy9Uor/V8luuCj9VNvTB9GFq713zvZphiVc8=;
        b=WGnEqK17x87sZ/wzJPoD1a0iv8mrXPrBN9syh9ya8SUTIJepT7+it2ME7i3J1qn9r9
         XmoF/Wer9BnRAtbAbcxGPJ5CQbZ7GEPvhVM6yRhFcLOjOiPzeXIcqhh50VBoJLzLHVQg
         hD2lRXWRtawb/QAvDoOzZcYx38yI1ePMY4meJ+39ko4eaRuZwXO0uN6nzXVcsn9SLTGM
         zWulfgTjo4Ad1fDwFk6/xp8inYxKgobtqrxXlwt+QJPQBOf8vGfkmlQ6ahTYCRZIIzUJ
         jeLLkrHXf+5703KLELOcn23GVIvz/wsarjqHjrKkieB7RmNEj6PSwQcN9J/LtCyLn0VX
         nM7w==
X-Forwarded-Encrypted: i=1; AL+hErG7SHGg9QNryZwX8WE6IGN5QByHPGekGig7rY8OTqAj2fOD56X3EdDT192G/T3cClbjuWKByER4qdcJiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dddTZBT8E0piCugsDQ4oBxfiAf5VCw1+tHG2TQGgBPAyLSakN
	SxyNq8C40KESoAHdQ+Cv/OQs6yd9M+7iDdzsFdosWe5jd/LghjoPOKB5
X-Gm-Gg: AZFdTZdV75vwC/YSWLWQw4SUXP04n7ml5Tgqcn8K5jKmOByVD2c/eYfXivxLwSWE7ki
	diBDMBzizl2tayS9F9eWlHpLzX8rvG2v6LHKVCxydX6Zod9EY7bS4oYA2fW978oXNF8cRmjQrx5
	qCuFIv0QnH8zPXfZkPrsZ+5Q6DVIoFAwEEydsV6uBrqL37TI8pTHnqvzNlVrVZSr1iOT5CEUZPD
	/TyoXBht/td2swZA/9p6ORMiVnO8+NHj3FHaqghg0Tqa1EJLYj1LfmJxNIklHu8nt5h3wypioiU
	4+2XyYsCWT37FtvL1iXBOqJn9J8XzlpRLt4KsYVL7eGLWzkEEYYPb/lh801OBrUcsUdPCFiu4ZS
	VtspRXGk557JsriEVw9QLnQWrnuFtvJl7IYk5MM7H4JxOrohyzOxE0gARR4rq8TEEBm400eVJEG
	aTAs9HRyS8rhHrdZ1D675G+5b8sPR5jWX0jcKpdeI6dYmLJT2ZrE+dTiJszQZ5gAE7Yw2QmHIPw
	bYoeKK3id0NkTEqkQaUdTMH2mN1SjkTYgUCNhIRgoMubel8DHtSojlTkOkW6WVvrZTR0l6oWSyG
	JrFugTzwOZ4ryiPOHflCUKyK53KFIYw=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr139557955e9.2.1795279775875;
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:35 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Sat, 21 Nov 2026 17:49:05 +0100
Subject: [PATCH] dt-bindings: media: i2c: dongwoon,dw9768: add DW9763
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
Message-Id: <20261121-dw9763-v1-1-f215290602f0@gmail.com>
References: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
In-Reply-To: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=1908;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=qLwwZ3rP/fjc2JAHuzzvcKw4S3Ep+DNYoDcVGI1KFc8=;
 b=FXcyCoVTdSrnvMx/FpFgdpHcR6SnrRAqBrBe9xrqyPsXhxCW27B742B0YYg0QtpySDp8a7kv9
 f7/o4C3koqzC44B2qlmfzILBcVcnnUlw6PFbYxtNUCsJZL6+gjJSXlJ
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Dongwoon DW9763 is a 10-bit VCM driver with 8 KiB of embedded
eFlash. No public register map exists, but the Rockchip and MediaTek
vendor drivers program it exactly like the DW9768: control at 0x02,
10-bit DAC at 0x03/0x04, status at 0x05, mode/prescaler at 0x06 and
resonance timing at 0x07. The chip ID reads 0xf9 and DAC writes read
back as expected.

The only register-level difference is the naming of the 0x06[7:5]
mode field: the DW9763 calls the values SAC1/2/2.5/3/4 (0/1/2/3/5),
the DW9768 AAC2/3/4/8 (1/2/3/5). The encodings match, so the existing
dongwoon,aac-mode and dongwoon,aac-timing properties apply unchanged.
The dw9768 driver's settle-delay estimate assumes the AAC4 multiplier
for mode 3, which may be slightly off for SAC3; this only affects the
wait after a move, not the lens position. The eFlash is not covered by
this binding.

Document dongwoon,dw9763 with dongwoon,dw9768 as fallback. No driver
change is needed.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
index a0855d3b7..386352f62 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
@@ -20,9 +20,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - dongwoon,dw9768 # for DW9768 VCM
-      - giantec,gt9769  # for GT9769 VCM
+    oneOf:
+      - enum:
+          - dongwoon,dw9768 # for DW9768 VCM
+          - giantec,gt9769  # for GT9769 VCM
+      - items:
+          - const: dongwoon,dw9763
+          - const: dongwoon,dw9768
 
   reg:
     maxItems: 1

-- 
2.56.1

