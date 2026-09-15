Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4D4A64FD
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475286; cv=none; b=TWeG+giOyH8whaPDx7RmhsBc6yw157Rsny92K3vjjqv89Yz17gaZy6BDWEtPhI177c9M5zlk3pEUei5BCv6KZl4Jz4HjSh2nD+PtP1qI2WU0zH6gkgZNwB1yIIuAi3hE9E/48iHITyOyECksuUA7wE/28iwLlzoU5NHdNHBKhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475286; c=relaxed/simple;
	bh=z7S+WapOAADt+toUCtbJgKgHGdB3VijwYG1m9opy0vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfrqQC7oYj72lHQeosySj6oNyIJjuKtzZtiYBHUaTYyFXC5U2f7wLBEfCS5P+kDzPwLYDCk+d1HkW8PtZggthYKRyqeURI6GaDfN1F1sqYclo1Mx358Z/M7TZSBhbRXUc1A0GZJ8/hGel56ZmIRBG7Nzqz6krR+DPevcscKLM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyTRCyy1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyTRCyy1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so10885715e9.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475283; x=1790080083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hwo4di6s/GiSU94MPQNBdddN+KWlZv54gVo+DuGg1w=;
        b=VyTRCyy1Qd2b42NXd/vpNKAgVLXeDcK2RmeBuj4AnHcUtdDFME9K9Y1ws0qHTLykEn
         UuYG9GHIlwkIfPAR02EAB4XNqPs8bNSj2VKh+0HBnDZrq0AWicS4pg7+I4JGRCzQSj/m
         sKclQcLN26f7/CbzL2YoncmeiCUy795cjnzFKaT5vqC8owJ8fYeOSuHndAlFUbZEqqKe
         3uwAvBkTjs5XoeTOCKmYkv6SUfAhv0EitZ6yveCb5fG1ZcgyKcEaLRHvYBgOtNC15JQZ
         RmqA4N6KMal1pgYCFNPnMzy6+m5jWNWI21AbHDbGjM+T+i+JvsSbzGQmIDvfqy5xAQqZ
         T1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475283; x=1790080083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Hwo4di6s/GiSU94MPQNBdddN+KWlZv54gVo+DuGg1w=;
        b=xzdrz1t03rJkXGyoq4ET/eodNa0jjLrENJPXLuHDyTjs8qbOdq/lyJvgcW+fKxchqk
         yUdJtPjpDsmNWpKs367OLaXD7ge8FqIAmv4HMnxGlpjsN9wg9G4vZgjC6+TclNoGxDJe
         OPzpQM3c91KKyYBR/F4In4Z3y19cFBq+RNdWZbUTZpa8nunxsjL4Rm1qiiJ/L/LOrpcu
         qcIX9UIyoWHpjRjjafuZrxHzcUleiGJU5sJINXXu3FsFFZyFp5Sd94+u4SrYmVZHo/vl
         Z5WKJJXwBd5ZDtxB8K+J+yqQvdU5ccZwV11cYWtJfX5NxejsL05XQ8DbJKmLTM3FSe+m
         rGBA==
X-Gm-Message-State: AFuF++mqkNhsioYKQBahOnFUKX3YaRtS7Hv786c17i6YMpFvfX7LQt8P
	vH0paGEq7ycp8y02KUXpH2r8DoaqAm01Z1nosLtNSHaOrjOIhZQ8BkLA
X-Gm-Gg: AYBFou0IAppR67ToOFHy6OTr7NaoJ3t15yDsxrJVqppHeADLflYGqULKLoSxDXnjDiM
	jHfbFbL7NYJf3R9U86lPOavKnt908kWB3aGRx5VQDEUXDmc8/D3pvADKzab58lZySsFep5cMeuK
	0vj1dWdotmi+nw7N/Q77wIYHugcC8FwROecsRdMIoqTKbE34kiz/KFLpssD65W4bog0ccdAi6MG
	Ih66zTZzI39L/eNSiDwcZwNPYoUOL7kQR51Yto/SVMgne5RoboWbXMnIbz+9sPr6jFj4Z1El4Yu
	NmjL8d4c1mgiSnEMD5RNrPWUQTxVt6yAQtfEy0z/c4pC+nBXa6RyRXBm4JNHW5dApVNgSY0FjNk
	rv4AUOylkpZPNlbDnrNgKgqSE06HwZnQD0sO5JY77lWxV5Rx1dzlTQ8OiYcILlW0ooC1wZxDIGU
	XbRrWpnzEkR6hQ5c4re2N5s8HUL8/gp4kCcpjTtqO8Nwn7LPpXfnBbhg9hFh03rTbzOS3pfxNoL
	yEZdM9lgbR/9zrrB8xTnnRT1qAYgJJRLOyjZ0F/cMrEEudvUAOwVnsQ7YsBoAHbkYbz
X-Received: by 2002:a7b:c044:0:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49e7d749462mr31690275e9.11.1789475282404;
        Tue, 15 Sep 2026 05:28:02 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:02 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 14:27:56 +0200
Subject: [PATCH 1/3] media: dt-bindings: add rockchip rk3576 vicap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vicap-rk3576-v1-1-d3f5eb58a0b5@gmail.com>
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
In-Reply-To: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=3072;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=z7S+WapOAADt+toUCtbJgKgHGdB3VijwYG1m9opy0vY=;
 b=IC84XA3mCQXaWFg/4AsAwioBWvYzZmyHQmZ2hIwH3YricEhEp8sgB2ssCuVdWRiOgs4wN+2/4
 btCDa2mED+HCDnyf4iis3VYb97FCMIHQsX7Y4yo3U7fbH3x3owlCjf9
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the compatible for the Video Capture (VICAP) unit of the Rockchip
RK3576. This variant features five MIPI CSI-2 ports and a connection
to the image signal processor (ISP). The pixel clock of each MIPI port
enters the VICAP through a dedicated gate in the clock and reset unit,
so the variant takes five interface clocks and five interface resets
in addition to the aclk, hclk and dclk of the other variants.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 080b64503b1b..b7dfaf3b378d 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -15,6 +15,10 @@ description:
   the data from camera sensors, video decoders, or other companion ICs and
   transfers it into system main memory by AXI bus.
 
+  The Rockchip RK3576 Video Capture (VICAP) is similar to its RK3568
+  counterpart, but features five MIPI CSI-2 ports and an additional
+  connection to the image signal processor (ISP) block.
+
   The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
   counterpart, but features six MIPI CSI-2 ports and additional connections
   to the image signal processor (ISP) blocks.
@@ -23,6 +27,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-vicap
+      - rockchip,rk3576-vicap
       - rockchip,rk3588-vicap
 
   reg:
@@ -33,7 +38,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     items:
@@ -42,6 +47,9 @@ properties:
       - const: dclk
       - const: iclk
       - const: iclk1
+      - const: iclk2
+      - const: iclk3
+      - const: iclk4
     minItems: 4
 
   iommus:
@@ -221,6 +229,40 @@ allOf:
 
             port@11: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 8
+
+        clock-names:
+          minItems: 8
+
+        resets:
+          minItems: 8
+          maxItems: 8
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: irst0
+            - const: irst1
+            - const: irst2
+            - const: irst3
+            - const: irst4
+
+        ports:
+          properties:
+            port@6: false
+
+            port@11: false
+
   - if:
       properties:
         compatible:
@@ -230,9 +272,11 @@ allOf:
       properties:
         clocks:
           minItems: 5
+          maxItems: 5
 
         clock-names:
           minItems: 5
+          maxItems: 5
 
         resets:
           minItems: 9

-- 
2.43.0

