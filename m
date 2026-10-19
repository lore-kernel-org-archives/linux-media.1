Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1898573F27
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420118; cv=none; b=aFx3l18hIhM3oCdhWn6TvqeU+qpMXcSeo+k/0bBE0OZmHjAe8d34wa/Dsv/k7CTpILMMnCHXfM3w3OvFShbK9d7W5ohfFXx91YhZWVVPsE1KHp/jsMbiRuTp3hXa849/89apsmH0qTZqHj0WkuFr09F/wZJISi3DD0wnnH3lKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420118; c=relaxed/simple;
	bh=LjEmyleO79NM8uWuMzakkcA0rXksukeE3zemrxG3uqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCxHMs5YXLu1Dh2/c/Oje8nPUxAbWgA3wKqqAPqy3TP5A+2RndpPN6WkPo63qVSRhmxE199kYWI7fA/WNjbyNpR32JJ1Xgm9pzKG3cxM0KZKUYf0V28s4JveH0lTTKd9oICXBThWiDvHRBq8jlIrXGlKR4dbDUYN8fbCjZWPkZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OAWKpFV5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OAWKpFV5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1165881f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420114; x=1793024914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=OAWKpFV5fC7ITiG9MvCp7m8hAUvR6iIf8XDBT6fTbnpv9nsuRp/3QHN+fCud85tnjL
         eWeZ9WOulfA1Ci9iIinYt3ISS4MbPBYUE5RMgyRdsudoLZrn/rPeYpktjycouz6cNQ6n
         lWAcjEl7OFHW3admBjuB6DxYuUDvlqV6RfrMGKFdPGlh0E1qLqZez6aJ32RM82IraQmV
         TfpGI+PSsHmbc8rHQ8ycMubd6F4wshjUE7Uei74ZoYMrHuY4J9zzuauYp25xz8LCFgFy
         KrVimdBoUKIOb3vixoZmwy+sTUrqPHTmkgcdx0T4+dn2a44eSyjggYRk1uIw0JFsPflZ
         idtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420114; x=1793024914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+bUFEmLPS4/TdrbxhIqdaZX2ZeBKuPS+ZYgOUoKgys=;
        b=d0JiIctOk8qDm1wWoTpWROTQzeMG/lSjWhKPihsgwqu31n/wyPm7au9IjROOLzymd9
         6gUJeet5aVfEC9uK/t2aDjsc2lpMmV9YR+C17/M0K1glJIzldHPGKYENKWcxsEre6sNp
         DCPt2TwIq7lChZOvOCAioM2VZu8OTj0cS5b4EwMpyWTNRvudCY4rHs4eLgyQVPlJrMBC
         +S85DxU/fGF3OaASz2ie27Dhz7YoEkFsILR5SYaFnUPyF1UHVg3DGNgrrIOirzB73cDo
         Cmt30g8BIB57T2+Is+AqDI7vUJEioaxaOXMUmLhK3OHtUu7qd7yoEmcfMWN2Aahv+Idl
         BeJg==
X-Forwarded-Encrypted: i=1; AKwUvBxQLXdOrVp+wIWIMwwa9coXndSbv8WYlGT9z/L0CFEZ4p0Xh1YrXduc/81WI7ToVbSSszEefbo5S5IJNw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJcN8Y0wCQnsA6EPXys0x+Obnlnjqt8Y0SR4yPvmhmj6MaadP/X
	bdQp3R8K0jD70w7J5ZLUmAa6Ih2sawijN/4lFvP5f8TZ/uuI3OXnEra3/kcNQAIRzIE=
X-Gm-Gg: AYBFou0sYJPH1Ply03s/znJoB2Ver/btH1iQclXwkG2sdkrssBswCcgWh2iBDLhwmnv
	nSuQrg2IiZn1k3Ve9re6wtasMXcCPbaFJ/UVrFw/aA/YsP9h+Tc/Fsn/Vy5rXjbujF7vXpjRGan
	zo4OwNr/4wDM3zmRsyEvxY0YZyVUh7gdWcNG+GxlSOh+9SwnQJfQHKkIW2r1vlDSCgKt+5O1+a0
	N3VSU0KosyXuMAsuvtlTbsDKzRUlUrnhoKNYzzdwJbyeyIlypxlFUYQEHNvm47FXaaKH2j3T76P
	outZR488YOu4Hz/H+czQK6FSG6D2xVsfReiY+/c5ikRQwD+nJ5ZpEqlywglA2ghwvKlxBRO3bOG
	Q39PaS3toejcqxbVjgjCb2JfcGOcbj66hOPy/Rq+ImUlBLbKFPjmqWly4WEn2s0ibfh0HEWh66G
	eJFiqxlonOftP0cdxNGfMYYUC6S2fWK3H7KihbRPF6DSI4bjG4pZkD4OOm9lfMS6OVHahjDUR6y
	nQlubOCz1q/BJn+0m2oSvH4qqeUCtU7dgvrnopF+8wtDXxwaQ==
X-Received: by 2002:a05:6000:c4c:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e07fb36a8mr11991206f8f.49.1792420114082;
        Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:17 +0100
Subject: [PATCH v5 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-10-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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

