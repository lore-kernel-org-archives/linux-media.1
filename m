Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283530;
	b=ZL4Vo6OHLHnvFrmkLuJXmTC8OsaQ0mHy2+6rSudJOtrCKFJ/Rlefckhf1/Z2tmMsj/3b
	 UbC0f5eVsN4wCLvKLku0UH76B4xBDuz8PPRvD2L4e6y6NJxhFLnefyI0dWJYAaYGK7ll/
	 bMRksVwwGgIbiW3ogwWKpQQtbAguhb1AqZXb5LTGguAocr8HwD4BAJgTtLBrjb1dSlxTK
	 5SNw0lgI9/N+66z1e/dxicFR67lh84X2P3Va5UCpRy2m2bUsJbYkBAJHBHIJCPCg9F/Zo
	 modcGMIzpH9h0dE8avVXNmIuNdn4kg+Aw7gT881tG2XwRB1Xvuz1dV4dkeDldbxehvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
	b=jsBqMzi7DsIkx90QLXPbrOuiu6spm2g8MgYPXVsQGmWfPYrfZWzDPyBrEmhX7heEcOmf
	 j5QHoo8iSkTl1SjtgZVTiRfNmE3WBjQJRRaKmTACBeYTOM+gYRx4Ct4jPDzEmDFaSELTI
	 OVKNcTDwoAB5V/k1awPS9NIG+iESNSq4HrXxhxqjAu/yKatF11S7slO3HqhiohsHk2LIP
	 iz5eNnA0OJhmhfeHSFHWkfuVa+Mz0wsxxlgx85v3RQAzkrqbeXPs0AxzXdnPtF+R9Hq8/
	 auUYP/WqE+vJkOyNp+c/w3g5Pwl5u5ILSbIbpGR2w3e87BACoRvLa4quOZQMboKt3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LMzM6aTL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008660A5BE9
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E008660A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=LMzM6aTL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7494905e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283528; x=1793888328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=LMzM6aTLoKd8Cru+xZpRaMXjmDhPnBRho+NfETPuWNz4M11boDRJCoeJ2fje8SG8Vk
         vwk2rDplqnrhRNENUapJJssuWVZUQLAqa2qyvw1iRwl1ISvrOPdDs6K0mP6eR201aTGo
         av0YFV2H1V81z/Ih5rXCN13dJuK1nymT2kMGfT+bLMj5GLvEM+A374z9HN68unNMxH4E
         dqWROmO5uI3lr1vF1CaUFrvse6zx3gZ+nqr/3hfKcPmb6UBmg1BcRt7LuRh4c3Tx31h8
         hGRqQV8rY3peSeeMwAnLZCU+lDkjqcKdfW9g6OLuDrXyYgjPsEm1K5LMsj2TjwIgJ6Wp
         sNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283528; x=1793888328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=QXhdTNMgSnrAZswiGGR8H44mOYtQz1/vcP1CYDhcE4VdImTQ6TpsyUWEA3mrHLwjlM
         qf4gmdbvblpjRWZUyzfYBWTAPDtw5/gP4LWoCZ71VeVUEEXcuAdSGOLF+eJLiORFDsk9
         qjLNzYoj9qk6HmN727b30zr8hR9i4esBFlCq9SlkgSlkUluJfKH60krdGXvl9skxW7kF
         XTACRtDpgLmj0yva6AdUcnZjRSNXFxpiJ1yAVilLbYDftwlf4aO1X1qA865p66Ze9qYo
         eCplWyQ/NwGQ2t4QJiV7O8GHgiesEeTEbexIy6U310K9wmwWGm2lYyJXffsotqMY224z
         7u+g==
X-Forwarded-Encrypted: i=1; AKwUvBy1c4XQQhb7OptQMa9CwnFeJ8IObTdvwr5mtV4ZifD1pk9apVqcHVZK2p9ys3yI/FzDZvI0xatIoySIHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJaiU6D0a//i9zdYeLL0+VaIF1qqRHJIof5KIdZNx9IYCffxh25
	fHqDjTW88Oyn+aEMQek1FyzcMjaOFFo9f6KHBPnSl5O15zUw0ORcO+IW2C/Q0I7BbZ4=
X-Gm-Gg: AYBFou04AHEonN7zBpgJ/TRz0LcjZ6msa248/rVq2Al8UBVkKvrNK49WuHUtyBQUkLc
	XohKlVqw69cfy873tcriUuRL7qp2NldSi/bgAIwNP0tGtAlAhRKmHMgzvM31Du2Rf+hWwGhgx/N
	iHUndpHQIyIZE6HVtMDu0Pzr9IXAhuR13h+lAR3K0E2UxGcW66Z8b9oty5Yk9UUUHH69wZuveL+
	NOKUWUYvDrfXfNhS+l0ZxQLHcPXrtolWarGDbVeNUylyqp1ZB1wwXf/f4euKpmrQYJz5wbkyI1/
	9PNDXj1YpVz1WXMfK86UZObfTvHz/a7a5Ms834nKErHF6GEJuknyBFj0P4aehpAmXhNuwuKLlVM
	NIz2aJsOP+q6X16Cfrb0ONexTwiE7vYBYiqIwULS9mjEblgMXXlHYRybmBRaV7Topl7txeptgo7
	aoTK5RkHfSpP1kZWMmmYiMcOiOB23hJkiJYCSWHa7+XEMN4C6bG1529FxmoKA0u8hP+jMzfPen+
	+pd2hodITAwbkxuqVBUZkADAK9tAQc2QqJW8INbLLUBhRVcyUc+0opj9ulwCsUxN8GZQ0hGYVtT
	7D6qfwNUF/sRdAuvq9hqmsc+BHiCQ6FIFCHKaQlV5rH7HuT3n65t9cJmrqXIVhot5DVLO6V4N9g
	VZ386
X-Received: by 2002:a05:600c:e558:20b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4aa87d702f4mr44584355e9.14.1793283528130;
        Thu, 29 Oct 2026 07:18:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:31 +0000
Subject: [PATCH v7 10/18] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
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
Message-Id: <20261029-media-starvis2-v7-10-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 44 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..0115f7b00d5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,29 +5,59 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
 
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
-  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels,
+  and part of the Starvis 2 family of sensors. Other members of the Starvis 2
+  have the same hardware requirements, and therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx676-aamr
+              - sony,imx676-aacr
+          - const: sony,imx676
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

