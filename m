Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690494;
	b=NGXwEiQd7canPe+iW3s6siqJp9t1YuDHO81GTFOBD7KNBaIsGZ2L7sABXsTmm1JyNqlD
	 pVlqlwqB/Of1Ysr0BNagdobGBFsjLRsZp67ESHLb17jW87IAYnd5IApGF8Si2kF/uGpc7
	 6/hSE+pGnGz/1HAGxXQuR5t7+uwpLyfspYROLF0CygE3kfCKQ3KqTJ4ME685nH2wR2PIi
	 BdtTrGuChdUDjNYXFSzPbhK595Nm6dDtSyjNA6E/cxRfgcQewJXR5hlPg8oN/VW29g4Ws
	 /oQ3uy3ruIOC+tBx3rORn4Mm8Rq+tDtx+GhSTx2lTT1F9fjqDD/rRGsKxvPV4jx+u/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
	b=ZNHSdBUP/FsjCKtUQ+HQbZ9W9kcY7nFAmdSzdeYG+EIdVfwkdgEJg+gSprvfIMVoRUXn
	 evdDVAfphoE1A+e96HQoOmtv73H7ebHUtY2+CfPwljerUn/OZV4bcrlTfbmTinvrgAeX2
	 hWDUzdfaMUGSGJH5aSmWAX+Q1F2+dEA4vNJR+OE43UEv4rYYQqPDsyy8vbWEIyiZbWNZN
	 76Ki/JfcZgeb6KxUBsVIwFnlp7btQhVsEcUdA7ucdgm+baWpd81J0Pm5TU9dx07+JxjQi
	 LyHbOX3WNhU7cx+Uy2VKD6BomPfEX/nq9YVsephLPveVK22b6LxfEKRmqIk7SgSHr1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sI4LJ6Qy;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4A606A32D
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F4A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sI4LJ6Qy
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e09aa5264so18827f8f.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690478; x=1793295278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=sI4LJ6Qy6KS4Az06HsbqBPQPTZ9D3YzEPneAJpoUA0iIU5b/KZFk2B4UmBnfVKtDbT
         1mM9wrXIIbFzjQwUFRTINUd9I+DNl4tERFkhjJAAC8FT/IQALLB020FaiOlnmYdDtW/P
         9mL/0s/jsfzcWne8j0egSHgXLv+klEc2kK7hqYuvF/khOZtrc83J3wO6JsYYl4SuYGsY
         ZNBluYNppvHG2gl4Bq7h7m/oJGbSnWVBDXsM/NhHrbxSZ2rhpWNL+wv83wVYG2z1lFue
         RKfRkYzgkOJQn10QbuYCWdLQDliSLaxXndaPcwWg/81+XK3mJ/OcWLKlJXQKb+HrkvmE
         ayUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690478; x=1793295278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUF6T1CjdM7KPykBK1rJtL5GvAJtQ2hOBe2P+sd0pXk=;
        b=hL0enOyRvk09UyEW1XNgajWQSjE6unT2OfZbZX13ZsJbUX0aQ81EZDJy8B2px1dhJ9
         oGX6OyXbE/GJHiJDXdPhQveSwUjuLr/tkVm7N+S1T3Ctvw5C2d3surpqVyunJIo0wfKD
         d1e52fuyQaC63bDfLIWc3EhdJ6yNoNdvd01JvbmIEo7m15iU0k6yJZs/Xvxj261Msbgd
         /WfqcDuuog/qrpZKm3yyJzWpHqMmYXOkPtS50dQlYxCk7qnII6lWo/PbUf+Jj3eaz0H9
         K+5VaiYaA4+PVMbM7lTPNLnlnDOGYSe1WZVFYDIOx2Mb9jnHtG0kdVr71rhxsOL4dNuO
         YQVQ==
X-Forwarded-Encrypted: i=1; AKwUvByBkOSTVBzhIOnCEX68qn3c+n9sp6l54mY3jO9Y1ZKwxbNy3st9eoJLADsBEBkT4Yo5bcnr/GCkhWah6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ypqYYCPnJdvgKDMLPxYny/aHr5jXOU4hrDTKHNDsrfrp0hjR
	QPFApHKMqljeFD7DkbrkSt0RcCeFPk1JdkYxfucqDI2H46TB/DwSOxjOqQZSGeQe5h0=
X-Gm-Gg: AYBFou0KoZPCP3j/zjXn0Sm3w4JPbehxJh4zkwlvoE/khkRc2unL+D6qxXvzyAu2ekT
	J58HsNgrFYcJqkiCCpBdV847F2JCJaDgmtEes5jkmQpj8VHJf6q8BlgQJRNNlFLSqC530yrq3iy
	88p2oTSf3pdMSYiAb3NQ/HQ/9sqPuychhtiHMaMMujX3LGUt2TRDKvgbA57S1Sy2cMKz6k/HY66
	+yGYPtAw7Hn+ID7C11jOmPFW3T0STWMxnB195UAOyNhl52YUGLaOBwbPa7tMdF6eA9Hvw8nTXjw
	2FgfcMEIu97XbPSEZaB38AmSf0crYvQ0sbzz8ogmCehpopDFZ83x6xY5HyEupDIGWapWKFTplNj
	U6Dc8qvMuzfYxfV9jtCX+4xWsSHeaFLFcaqV7ydre4VKqYGtB6erSPWO9r5OWIcEHI95IgKHi+8
	MiVgXebeFfQk6L/qDY0LEXERY06uUIpMCcfhILWYk9oQDmSjRAcOtcfiV2wkpsKUnRNojKoH11e
	xK90Jd9NvOzRKCAzhIyax8+OmbeoM5nUiHtKwSuOCWFU+WVdvph8D8QViUiEGDe8ZR/FpZ+VGeI
	KQoZEn+JmKKfPtzC+4DWBvwYLZb/d44=
X-Received: by 2002:a5d:6e8b:0:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48e2650e290mr8989325f8f.50.1792690478409;
        Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:03 +0100
Subject: [PATCH v6 10/18] media: dt-bindings: sony,imx678: Add other
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
Message-Id: <20261022-media-starvis2-v6-10-374343f55fd3@raspberrypi.com>
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

