Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166819;
	b=SGTeCtGYZz96YNVT/az7qiarradYTTYzAkg5ivCq8JhsmlHdrKCMvi34WHd573Wm7KPX
	 Wcv3XuT8NIrokbcxMrwdKTjAbLRurWz5k8116TZZZbM5JPd+jDD60R/Rs6hfXSdljLMW6
	 1dnnwmw2IOD/O+eq/n7KEZPGWLwmL/mB99OwHFi/OYSeUhbWG4F+61So5e+0F944w0/YV
	 2up63yT2eYmBgoA60HkhEUZh/a3yfevjzra2fLg+dznASMgs+ZEN765mBsCyFr4rOtriK
	 yeX/VxzfzJQFlxm4OiDQQvNLwBLN6I8rt6A2gdNDph+zWJncWhWwwFryS+h673OIJeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jgN6Bg/88EVvG7gizqtM+Fbm0QD1WzCs1dkA6abj+Xo=;
	b=0kWfXu4PT8NP0x0c5Lw7Ai3SIL8jbAURCSutGmP9PvDJ3uM3ogPxBauVnKhDMv+ZzKGV
	 4w7Vw6FnhV8zX3b0rSTRwHVvw37rFemwE1PYvcZ/PsXvUm3AUZgrfZIi7QqkQD2ZHGqhB
	 NFXXXLx7Pnl/eYP/PhQZTrGq3/R4cQvWPSeSm+cB6KixnG59eNG7dXK721duHfDm1Fk23
	 cnC0M+kAtJKxFeOK+fJWsjE4wajxfBFgP/EfO9BacKx7qheXMiu9RhDGJD/ZT3N66mxWz
	 9HVFlHkLZwCliBwVbKTfRNjMldZpOHf5So4i0ZDlljpKFmN0NJ4gHbIVIAax7X2O13w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbBUkI2C;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADF606A321
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 19:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADADF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbBUkI2C
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a142c6cfso17403c88.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 11:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166818; x=1794771618; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jgN6Bg/88EVvG7gizqtM+Fbm0QD1WzCs1dkA6abj+Xo=;
        b=RbBUkI2CuwYbQhZJnK3u11+VhhgeD9WZgGtPrXZCV3OHDulaniBy6IrzW58fETO7JI
         kj/pEZQFvHHCBqWXxoeUPENyJdWpkLt8e6bLf/K6C0Y7Ai7wmKDISOG41zl55+vMvGEp
         B9dXz9zKNiDIV8Pull71+2cj/pk87Zau/p/RZy5yfH5mrMbGGe3kROZsaAO0KWSPPfF/
         jNkCVpQHVcuCmQboKGcP0l0wT5QVVQIXejbaicgwytYkmdSlE97Ay7ib3dXxbAUT4OJP
         oKRoRpPBc5KPqA5GEkKOrP4RlMsAn69zSUnvgIPHsq8jDTO8NtY/US9HG1Fz4Ozb5yEw
         /rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166818; x=1794771618;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jgN6Bg/88EVvG7gizqtM+Fbm0QD1WzCs1dkA6abj+Xo=;
        b=YJzOe0Ywr/tEPqcLy2rfxhONuhSC8QoNnUwrra7Ce4sDyIENWSSBRsc9p1VMYMwV1t
         ihLCSGBNELH8AEv1HXbgigfCYRfDpXnSEeMZge/L6ACR5WtSRI5VnCrtvWrzP16qTjFg
         SzMZ6d/V1rMsfvlZAk/ZvCaeX+fL+HtJghz+QWqaVsj2TlE24SimJvo3Fcrmwc0sTD02
         YuQk3Jg9wAE5QnmONJkUVxyPeOV89bhkhGwz8oEYgeBzACdVGmzRImtqc6RH2oewctoT
         WDmK9QRJU8BD69q0KCtvXhTpE+YwufJwqyMnKzw5sZl6ZQ9mhOsNuw+CkbsItt+JCxfo
         N0Lw==
X-Gm-Message-State: APuU4Z9uqiJujriID1HN1tar4blkM9n0NB3lSBLpam1B5GWdR7kYZItV
	pxw8V5MsiApgfVq1LXAnD1mZno/3IiOFd0WNK1978h/YIUhl+QWfk0Zm
X-Gm-Gg: AYBFou0aiCnUcfK1vYhzglHdQiNh8IMnCtsYPLz7kXrKSS0ebRfUfPDdhNwp+uBMj+d
	d6HBgwGVYCcJARoVTUDsksvV3/+ORHJBOwrPF2ruTTjed2kCpXG9kQKeXKJvHkAcMFPnNHJ1UBf
	+Ah0i3zdIzJkmcKScP5uuKesXqCeFV4z1YocMgj24uzr4i7Xz7aXHtBS4pdVijSBPtVNLOel5J2
	8Lid7atbb2jiAvnS262qugZxO08PkpehT45DIohAbJG/ubUmLVgBmp/wCHlWp+P84RJN7KTzIDy
	JqHuPwNkvoMj9/piDr3uTqFECYVWPBJMlieX/FmmlMubAFQxlRQ4eE4/YUGuBEc7KwxGO0+PVXD
	xKlgbblf+Vo6wYLpE+W0zGBMLXTNiQmLJDvLiaJdeev3tQk6sivPF3f+PAfzcIXIZ39tfEiXpbL
	llA2YMNmYklDr3iupB0pR8Xg+iol/nnSz16WeCVnqaDb7gyGVt9FGhd63cqVeFyuXCCsCKMjtcH
	akapoX82J8ud6ihelhamqjt+cPTWKoGSrS1DyPcGPrP+SQ3oQ3LRyikdkkWajl/drnYLWP1q6bx
	A1SziKItjHOIPo29KaVbMCpZp0olWXVMTIo3pvY=
X-Received: by 2002:a05:693c:62cc:b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3725024039amr6431662eec.0.1794166817576;
        Sun, 08 Nov 2026 11:40:17 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm6997517eec.0.2026.11.08.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:40:16 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 09 Nov 2026 01:10:06 +0530
Subject: [PATCH] dt-bindings: media: i2c: ti,tvp514x: Convert to DT schema
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
Message-Id: <20261109-ti-tvp514x-v1-1-151cc74f67bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc2ND3ZJM3ZKyAlNDkwpdY5NkC6NkUyNjQzMjJaCGgqLUtMwKsGHRsbW
 1AL3/gCxcAAAA
X-Change-ID: 20260731-ti-tvp514x-34c82c523162
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vaibhav Hiremath <hvaibhav@ti.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166813; l=4336;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=9Qksg9VZxIypnPAp453R1HaC6dfK5tRPmx4sBRRlbx4=;
 b=11eMTlJzawxRvobdnfXimGV0AkJ7uFuerwq5N6G3Jh7usGfM97q8uN0xjLajUswQEorQvn3nt
 U3K2dFrJeIOAI4BKgH3VNBthR4Ugkd+tlNeTSFZuzpZ/rX82W0ntAPj
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments TVP514x video decoder from text to DT schema.
The legacy text binding marked the port endpoint as required, but
in-tree DTS files omit it. Make the endpoint optional.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/media/i2c/ti,tvp514x.txt   | 44 -------------
 .../devicetree/bindings/media/i2c/ti,tvp514x.yaml  | 72 ++++++++++++++++++++++
 2 files changed, 72 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
deleted file mode 100644
index 46752cc71f2eb..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* Texas Instruments TVP514x video decoder
-
-The TVP5146/TVP5146m2/TVP5147/TVP5147m1 device is high quality, single-chip
-digital video decoder that digitizes and decodes all popular baseband analog
-video formats into digital video component. The tvp514x decoder supports analog-
-to-digital (A/D) conversion of component RGB and YPbPr signals as well as A/D
-conversion and decoding of NTSC, PAL and SECAM composite and S-video into
-component YCbCr.
-
-Required Properties :
-- compatible : value should be either one among the following
-	(a) "ti,tvp5146" for tvp5146 decoder.
-	(b) "ti,tvp5146m2" for tvp5146m2 decoder.
-	(c) "ti,tvp5147" for tvp5147 decoder.
-	(d) "ti,tvp5147m1" for tvp5147m1 decoder.
-
-- hsync-active: HSYNC Polarity configuration for endpoint.
-
-- vsync-active: VSYNC Polarity configuration for endpoint.
-
-- pclk-sample: Clock polarity of the endpoint.
-
-For further reading on port node refer to Documentation/devicetree/bindings/
-media/video-interfaces.txt.
-
-Example:
-
-	i2c0@1c22000 {
-		...
-		...
-		tvp514x@5c {
-			compatible = "ti,tvp5146";
-			reg = <0x5c>;
-
-			port {
-				tvp514x_1: endpoint {
-					hsync-active = <1>;
-					vsync-active = <1>;
-					pclk-sample = <0>;
-				};
-			};
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.yaml b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.yaml
new file mode 100644
index 0000000000000..d39dd6c37c073
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,tvp514x.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,tvp514x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TVP514x video decoders
+
+maintainers:
+  - Vaibhav Hiremath <hvaibhav@ti.com>
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+
+description:
+  The TVP5146/TVP5146m2/TVP5147/TVP5147m1 device is high quality, single-chip
+  digital video decoder that digitizes and decodes all popular baseband analog
+  video formats into digital video component. The tvp514x decoder supports
+  analog- to-digital (A/D) conversion of component RGB and YPbPr signals as
+  well as A/D conversion and decoding of NTSC, PAL and SECAM composite and
+  S-video into component YCbCr.
+
+properties:
+  compatible:
+    enum:
+      - ti,tvp5146
+      - ti,tvp5146m2
+      - ti,tvp5147
+      - ti,tvp5147m1
+
+  reg:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        required:
+          - hsync-active
+          - vsync-active
+          - pclk-sample
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        video-decoder@5c {
+            compatible = "ti,tvp5146m2";
+            reg = <0x5c>;
+
+            port {
+                endpoint {
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    pclk-sample = <0>;
+                };
+            };
+        };
+    };

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20260731-ti-tvp514x-34c82c523162

Best regards,
-- 
Bhargav

