Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E640566C66
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000481; cv=none; b=DUZ2lMTaLhtQASNLynGiv0izTwrWpUicxHicV9+80SHebbTFzB6BfhOl5EB6KhMTB41otB+kRy7/9r3d/uAwx1JHxrkZWdFcWG88qqv6ScMjO/S6YuDXIJOlyAAXCvtWoSIduZU4ZYEt3Ye7WMLks6h733kmf0WASJTr1fao8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000481; c=relaxed/simple;
	bh=BaIz/EHiRPouZhcJJAmfGVCWwp024Upe+xsltSwGH9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC9M9A5UY3Ld/X+9NXbhVoDQXGVX/tfl77s9mLcM2+jFKdp8WKfZBD8BTuH2HbQHw2uDSw1XJBDkLihkm1o6o6WddFb0ZNfzAEt/w25ulPzx872e+O32uCJ6ky+CwEneyigAym34+iVh8y0Suagieno/c/rK9e9vtgfZxXLAv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dJm446yg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dJm446yg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so35793235e9.3
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000477; x=1792605277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUWph0tUtI5hruFB4Ktgpc38tr7LXmV3yDg/rZR+XQ0=;
        b=dJm446ygtben/2jGmAf23myOtYl3eYII2fmgQjj08ibaDbSg6ciUnyRsWG3PUYPs9E
         EiJRXqruhtOuV/lBigdplUO4Z4WlXvYKxiIK9qrrPvW37jrxwgHMzy5tBIMRRjxBCOuR
         rMZSE7kYyYoTXkg2msw+wFrfyorbEg5FxhhliaI5OgJ31Uh+gsqN0qgo8qQWSbsRGzQ9
         I+3Q33s4HVbkpFmu5gMxqcrlkbl7RjSEPqZ8W1IyLMs2s7s13+duhPNbhCAwtKZbE640
         C49ndZ9gwfUHg7FO3tfKwCQjpvXPoVQR2uu7GUFPykXNap1mDkb42AUateU/4InSOoZj
         a4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000477; x=1792605277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUWph0tUtI5hruFB4Ktgpc38tr7LXmV3yDg/rZR+XQ0=;
        b=1GhENfNvzhpdUb8rTU6czpZNnXyLEXbIrFjhQNFPQXUpapwUqjAjUsuvVix4eqymQ0
         H8tR9CgS62yBkLv2GL1irMxEzN+x7AI31MqdvU/aPs2BZM1oyOfoXJQhPLWYduGH9e3P
         xBs+9imC48zNRCVA/dH/C8sTcAqTQM9iqeiz3ivPGQ972Xir/xgTPl/0gH9dyVxcFEZs
         3K8A5Gdn/F/HURQWOfIarp0u67W3k43U0QIfgOJOvqdaQ+jdfxKmftBlXPFBo0UkKBBG
         D4fdbbQ0/pDgOBJf/CmI76U76sXPOwAS/z2dPYTYzxk3j3fvc5SudSbg9bduA+HwvcPF
         3VhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGBtxLy1F+vfDnRTTve5wrN3xCTJWXZHgQeAxXapBTGmKYAydaGu3H5CEZiQfIk85x85BjpR0K2VQXVA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL+V3Nq0cdf07kbEZkMf8QwCuABiziIvPCimvac0ZR7VB1RjJn/
	y/Fj+rTNV26tA4Bq73U+QWDEbCfBszxp43rNUivUKd7AAhJr7Gy5zPyu3+OOG27olbY=
X-Gm-Gg: AYBFou0khwFAOEzhwApKe61LmuvDMnK7LVAyqF0oZUQHdTnSlSD/lxZ8xcmSuhXtrlR
	7jBbsdLnw1DFeELRQlEEEyksjnSDgxycaUYyeldq86vYNRwKasklFXSEM2VagAWNSWqF6gCfaPb
	LRrXsIBTvMrGHDbIQEw1saY4AZ/Q/a9U8TVyMUPa/Z37z9srUHIjncg4FWrC1JrfxVYvXUC0S7q
	NKBP3LgcopBOSGW+m7jtZ1UNAcsQnHkN/TjMibz0m7OmtapIYfaIuHFPhMpGqfR+svBoS0G7+6n
	9HWUtKVr80kgilRiI9H6bDMKVQomsW6of7Azl07Cf4jFVjBMD+Vd9rIIFlD8loDH55nXRddqE0Z
	fHzVyQd1hZSG2JlckpyZV/EsODMZV/G4shq0OR8I82n9ehTQbllBIpvLF8gcGKQhCroarLvekPG
	DPN3W57iRPrhFmTWHbnxH/L8Care7tRB6wP5yskvHorfUPcUDBtPQ6eqC7Y5ZLP7ooXSU+Vdu31
	4y7Jijg3paCztC1wsXD8AYrhuqQbxKliuPcLVx2gxoXWypfOw==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr349037365e9.16.1792000477357;
        Wed, 14 Oct 2026 10:54:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:29 +0100
Subject: [PATCH v3 08/14] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-8-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
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

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..027872a134f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
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

