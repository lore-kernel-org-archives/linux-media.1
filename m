Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB843DCD80;
	Wed,  5 Aug 2026 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785959701; cv=none; b=nwNQvXrjcnufVe/9JfMQoV8SXoKRWv12mgBGgdI+UT32x5AQGTZq9UEbxNopJHY/G3HQL7bCBTQD0Z+AAfAY5oXK+r75RrUDuqCoGjyC6zRz94wWJucL2dGEO2iDrrysVcGm5zcc+Vfx0R2PchB6y/KRA6x/ESB9OVG81BUO8Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785959701; c=relaxed/simple;
	bh=EtE9eBuVezPblX0lgqzOCYUHC4jeotEPNRBqwukfnu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okEDrGuZ0XN4/+fTAl5O/xvCLKQMt7nXA28RUB+PEGVzOEJOrbGfwM3n+FzlSkzZU2bN7Ct1dcwzUTHTFiqdGZIsvGcdYeY61ZlS7SImh335/6MwgzGzwCYDwQn2HCJQtQIO/9N9lCFSmrivgSyWzbnERt4SjDJZIEApqWOU3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FRVNGm6v; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I3AsTJO+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FRVNGm6v";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I3AsTJO+"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959686; bh=R9UWx9HDr2ao7NFufthBQo0
	JmWAgNGvgsDSNwDq7BuU=; b=FRVNGm6v2EwZRHcO/OIzYRoonQw/EsF+RiilhWFbStSVV8Kwao
	bW0cFdiRcaPCNBwhDVC5FprJpBz4R8PnaXDXuyWwoEp6UCL9WXUQrosBSUbpl/ff7CZONu5MCfF
	BCWLP4n0GbZaRa6dGypFVupgRVorJtWb2M22zF4aq7oUdWHWgnTmK4woSvtQiikEoLWwDR5jO/g
	WpU2zwo2eirs2xnHGCUD5eQVj4vQuptuRvnkqUktvN1g7Ge+F7umfQ3sazXFtq4avM13grAOlhP
	UbuBuO9Llqat/85PlE4UUr/6EzVJmNZCPHBGkeVTjMP4cdqQ3B/6ZDBTZ90TfkydxbA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959686; bh=R9UWx9HDr2ao7NFufthBQo0
	JmWAgNGvgsDSNwDq7BuU=; b=I3AsTJO+4ziQ+zoEbnl3gRWy9ga6umuyn55YD9njxFMAA3GxAp
	suGtG3GLz6kRBND+Yw9NitXX5ksDiwmw00Bw==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Wed, 05 Aug 2026 22:54:24 +0300
Subject: [PATCH 1/4] dt-bindings: media: i2c: Add Sony IMX471 CMOS Image
 Sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx471-v1-1-7be79f539ed8@mainlining.org>
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
In-Reply-To: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

Document the Sony IMX471 CMOS Image Sensor.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 .../devicetree/bindings/media/i2c/sony,imx471.yaml | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx471.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx471.yaml
new file mode 100644
index 000000000000..9c6c7c55746f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx471.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx471.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX471 CMOS Image Sensor
+
+maintainers:
+  - Danila Tikhonov <danila@mainlining.org>
+
+description: |-
+  The Sony IMX471 is a diagonal 5.822 mm (Type 1/3.09) 16-megapixel
+  back-illuminated stacked CMOS active pixel image sensor with a 4656 x 3496
+  active pixel array and 1.0 um square pixels. It uses a Quad Bayer color filter
+  array, is programmable through an I2C interface, and outputs image data
+  through MIPI CSI-2.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx471
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: External input clock (19.2 MHz)
+    maxItems: 1
+
+  vana-supply:
+    description: Analog power supply (2.8 V)
+
+  vdig-supply:
+    description: Digital core power supply (1.05 V)
+
+  vif-supply:
+    description: I/O interface power supply (1.8 V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
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
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          link-frequencies:
+            maxItems: 1
+            items:
+              const: 200000000
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vana-supply
+  - vdig-supply
+  - vif-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camf_imx471: camera@1a {
+            compatible = "sony,imx471";
+            reg = <0x1a>;
+
+            vana-supply = <&vreg_camf_vana_2p8>;
+            vdig-supply = <&vreg_camf_vdig_1p1>;
+            vif-supply = <&vreg_cam_vio_1p8>;
+
+            clocks = <&camcc CAM_CC_MCLK0_CLK>;
+            assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+            pinctrl-0 = <&cam_mclk0_default>;
+            pinctrl-names = "default";
+
+            orientation = <0>;
+            rotation = <270>;
+
+            port {
+                camera_imx471_ep: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <200000000>;
+                    remote-endpoint = <&csiphy0_ep>;
+                };
+            };
+        };
+    };
+...

-- 
2.55.0

