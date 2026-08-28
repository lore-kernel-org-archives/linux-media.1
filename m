Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09073DAACF
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923273; cv=none; b=kgN7w3B9uPQZIycHEg2EIJ9VPyBbbcFtZ6eseejWhYs4pSQXmCy7bn4ScDQmpfuwLlGsYcEl9q8JO3r5qLfHR2Ot5mkPa925pQdiYZQ1+GQvXduxiD4xgX9FKusVNi1EQLW0coeYkImLDuaz46VZADB18pWR43EF5Y1oS20Tbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923273; c=relaxed/simple;
	bh=kFR4MwQi9z7jULXGDe0vv1n77N3E+oLRbT5mgeNldF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+7DKUo0DiFPNHKYj1hg+FtMhwWMk+L9X/diSgGsstnLchT4jPWPtXIqVSnH9xQ1ztRqNGJOGmc2AKQJLdup/h/q3HoBsVgH6EXFYlfUPDkbnzi5tTw6uVXt43kzTkZP8D5NRExMjQ6j6SkSy0Rc441dqCfxBoM9W8sNrMWyo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzGEffoP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzGEffoP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so7683615e9.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923270; x=1788528070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/vIfYY7EDJVVWxX84YUGiivV8L6WPZarzAiopUlndY=;
        b=fzGEffoPJPWrwbL+8ejPv522Cd8SoftnJlsW9+u14+VaqWygLf3a5Fc16EONjjdW7z
         jI/yuxttrginAGiC2jVgtj9BYt4uvINOiGXMtQc2DbjdQFIjYzoYLXfcizamwl3+9Zpz
         q8N8SUk2rM5DhSGkVHmUyB7UufzV7kPy/UDq4FyRUoCSGhsOvv0NmoU6WXR3CsvespdA
         0F1dZsFWY2eTiL6xlWtPG0Z4NRMEn+YxRC7YaYujSrskF8jADj1EFB/0VOXbzgyzoTqF
         t/s1s/V9mmMFXP/yzQlFh+lOu26Z1ocPlQU6vv6DP/9A0KmQ5JFEbNnAFnt3Gaw6Kss0
         GJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923270; x=1788528070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/vIfYY7EDJVVWxX84YUGiivV8L6WPZarzAiopUlndY=;
        b=g4aq2SZXJlxgAyMR+vgo4sqy4pzX4o/+S44nAS7Dv04GGxBWwLB7t2iagl7W1ETKf5
         GQR0KqQXvPDBns662R2ai49OzFMyyMcRIWmIYi63gHi7AbBxesey+gwOS+bpYv8cp4J4
         MmS4fh5Xk02j+i+McaW/HXAgovz+hm8u7VK7MrRwfmBl01ulLTHnYFVRPAfiZ9+Zj3ps
         79kMwNi9ytAv6k7pzvvT32ri14Q4N8cQSGwX4BFwHmmgAlG2vNb3WXpj2vzMhW7W5w8m
         JuIJaTu76U3atxvJ/KnuxW3dcVgVKQMR/UYN0cCHk5GCdqq0Ud+68dAEstzutzd5lYO4
         JUzQ==
X-Gm-Message-State: AFuF++kc4YdEHPaAOQMqIlWCw4Dxy/ApFDaIcJ9qBu7RpLRgorWDnab4
	eGoePD8IMPkpy2toGZ0+Xthj30wXj76jjUvfVWaGaBKSbEiu3geH1UoARaFqezwEh+Y=
X-Gm-Gg: AR+sD11hHXQydaffVdNuxi6UWoC3KBEPKtQ3cDjZDyO6VzmU7tFts3etaVhCyEqU6vo
	TbBEpWNvJoe8122bYl8WjgbUVGUi7ggzQn88s9s9Q6h2wDyLz0VnrJ9bFfr5zetUs0HIIKJm0xb
	yYg32EzqWuodN3er4C+qw7TDaP4Yjbs+vfSSNoV6Va+bNOK9IZPpPzzXpN3L2HOreNgVbuZbf8+
	LU+jt1EYGfLXJY+aWxkSqnk91YflovmTXv+wC9I5FrzHIQAGq3XP0hYKA8VZaCi8HgkiSsVR1QH
	qsD3jGM4PIOSfC53146wyUec15hF+hEASrLKsc9Z43wfJlkyd7c7EZ6igAwMoWaAX9JG1CZrNTG
	7/1VKOoVztDyK40HPHW/FgAg9He2ZMhWifcCkSvxvqNPl8SBX++rlria35VJ535vvVpT+c9S8mC
	qcDpB8Fja9fdgHmp5BMkgLglJX2IRlecYKc+lj51Q4Q55KfZYX3t688AMVCLFsfnDZNj4SXi6jq
	gh8TiMpyFbCqI2DW8k33raS0p9Eu2Xt7BaS1+5YeqCCUYOpHsPTooIdOAe+Cv1GdCsc3BlP2cTD
	OsQLwNtNSugVci0=
X-Received: by 2002:a05:600c:858b:b0:49b:928a:3f9e with SMTP id 5b1f17b1804b1-49b928a4006mr68543325e9.5.1787923269757;
        Fri, 28 Aug 2026 06:21:09 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac526dsm3997335f8f.12.2026.08.28.06.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:21:09 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:21:02 +0200
Message-ID: <20260828132104.21473-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828132104.21473-1-robertbozik@gmail.com>
References: <20260828132104.21473-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the OmniVision OV32C4, a 32 megapixel RGBC CMOS image
sensor with on-chip 4-cell fusion, a 4-lane MIPI CSI-2 D-PHY transmitter
and the standard SCCB command interface.

The sensor ships in laptops as an under-display camera, where it is
described by ACPI; the binding follows ovti,ov08x40.yaml, which covers
the closest relative already in tree.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v2:
- Drop the frequency from the xvclk description. 19.2 MHz is what this
  platform provides and what the driver's register tables assume, not a
  requirement of the sensor; the example keeps it in
  assigned-clock-rates (Conor Dooley).
- avdd-supply, dovdd-supply and dvdd-supply are now plain "true"; the
  names already say which rail is which (Conor Dooley).
- Drop the sentence listing the modes the driver supports. The binding
  describes the hardware.
- Signed-off-by placed last in the trailer block (Krzysztof Kozlowski).

 .../bindings/media/i2c/ovti,ov32c4.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
new file mode 100644
index 000000000..804307cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov32c4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV32C4 Image Sensor
+
+maintainers:
+  - Robert Bozik <robertbozik@gmail.com>
+
+description:
+  The OmniVision OV32C4 is a 32 megapixel RGBC (red, green, blue and clear)
+  CMOS image sensor in a 4-cell arrangement, with on-chip 4-cell fusion and
+  binning. It has a 6528x4896 active pixel array, a 4-lane MIPI CSI-2 D-PHY
+  transmitter and the standard SCCB command interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov32c4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Input clock (XVCLK).
+
+  avdd-supply: true
+
+  dovdd-supply: true
+
+  dvdd-supply: true
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad of the sensor.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@36 {
+            compatible = "ovti,ov32c4";
+            reg = <0x36>;
+
+            clocks = <&ov32c4_clk>;
+            assigned-clocks = <&ov32c4_clk>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_2p8>;
+            dovdd-supply = <&vreg_1p8>;
+            dvdd-supply = <&vreg_1p1>;
+
+            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+
+            port {
+                ov32c4_ep: endpoint {
+                    remote-endpoint = <&csiphy0_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

