Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945474;
	b=0fjGrGXQPT6ZpwOae6IV5K6NiQJMlB9bct4s9zrdZJyHyyIf4iMN17X2wsOjTldSjDk3
	 Ciql/utFaN7bg5U/PYf2LBxGDar2v9d3JNYb/UDu+KWXnjP9aug4BSq0YZwxmefa+VoiF
	 H5lk65xlLqJH6v6RWrOMYOdvlDmIMwkv1UVODnfW5Jdeq7cG8eH5knWbCZ6rVicwlE+dj
	 oQc56ct9XbmdQdEdbXfaA5gsRror02pDLjyWwjaoNjnWoz7uDmC2mQb+DiuuhEQXOb4AI
	 Gng0brafr3v93C4kV9I8mI4qIlIjdHmdBfH3UPm6dG0Ow5W0LP0VzsrmALAMD/9eb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
	b=0BnGl+GIhmg7qKfCK5ZChM8oxds5cRqFOwXpXYGK0okV75AQHtjVf6dsGn6poSqntfbk
	 13iw03bMF6bQfmfKPEKPbNBLxK7qP+RakJ4jnzEqvjHaoXQrF3YliU15CwlvnAkN+9ayT
	 jZN+DEtikK8U1D4mlDT6gHrmFL8lz9Rt/sh4f6keYqbGi6lFdu0KWAtQFgQox3F7xmlUx
	 GRCXBZDtfLOQ6NCj80CGRXM+74QHCR2hXDoVdPmg6Eh9BRth+H7J+SCx6AkqabJCNe9/+
	 8jtDCvoIOHAiW3c0e3RZFsYr7/KMLQFFADiq5/OQHOgG/FLmuvlg4OIwF/V5J9EVMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="piVOs/i2";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E69606A31D
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 16:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E69606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=piVOs/i2
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6552014eec.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945473; x=1793550273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=piVOs/i2wwqKrNJRRQcsFBxOhSsD/oA+DtBDJ0eO7uFgeIUWiV3/S77TOvOs4Mg2w8
         UCoal+Q4KZT6XJj2dsyQsVQOfT6Z75lpCAvV8Nvaz6oL34rsbcmgiWpoW8dIj9beC3cs
         SXPr2o1QwqUa/4cOWzMOkQhDpYKXQyivL+WDWx3Mj7UCmdSnzP+s6KK+bJ99kv/ju2eC
         ynzOuNmgPlISAPkew4JA/oW12eG2K2X9PVpWNmE+c3fCweuPkaSnBP3Tl4pL/xFG7UTZ
         0Q7p6i7eqNEmIO+LYUYJpBlmxCcKUOywDI9CfNA3KxQ9WXCgrh7ZEpmfSLkGETp+ALZ8
         UvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945473; x=1793550273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8wCm2Nfy1YlIAb2uRfBFA3ucdNuFD+nuit8STLj3RM=;
        b=r7/yURGFH/WdhY1prmZqKOGoewZAQSmm1hB2wksTLgFgDiJSDMfD0poHKZQ4tWTNEd
         g00RAwDMex4pa9+Ns9OWSasjfM3U/PcKzlpBasnBSmrvTu/dcX2HXW7Td4kifcecshWY
         f5e/ocUtUEBuJXhZtitIT+D5HfXIkbPfxpSe+3OHuYJJF9znY7GbTSu4Y+GFF7fANox5
         CAhUYwFluCcjDX34aMwYoGzjunFdsaxNq3Y44I1VpJAS96Bwo4MuWsiz6zejIICJmEHF
         WJ8oFjQKc+uBeklIis4qvJwEnZ+a5viQmxW9TI4wIa28mpCoyItC8Jz1fV2ERMqEpkx8
         hrmg==
X-Forwarded-Encrypted: i=1; AKwUvBxq/zUHVD8lBv/F0t+tZFA2VW5HigQU9qx78SMyVN59F+DoYqZSABMvLpH4VN0TWHax0M3VQLspiKQGdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6AkJ2UcI+sDey62SkOIEzlHGHUqoW1i3e6EaF8sR5JP1elOjr
	O6LVOgY8CGtlsei3wtvoaBux71dW/5xb9SDDyTfMo2rDJFqyof/hwVAd
X-Gm-Gg: AYBFou3209MmQaEMZuNcEZSZ2TbIsZXV+VkrQCo2n9kxVntc/JKuNfoXfSj9CVzB+7n
	2X89brHUSQPgfrhxnWAXExF0RrkL1+DOfXav6AbLWLDylcXgTLZGdrGfYnxxM26xbXn1oIYBpyR
	QSMka6Wn6ZT8rPymy1mxkXFdWpUY47Dw+HMh2O8PGPDTR2NGne/fvOEBNiIIx6BoQzuEX+GLNp+
	xF9k7q7Hc3HwpLaTbVp8UmEfVN1YB/sBwZFBxLtXDd+pix61Hgqo8/SryIWaI50aR46/LktqvzN
	6BRONUA1+JnAeJwPWEcd4MBi451ll/Hz/g56EqMzvyCM28+aAKl0ZDwhPU5PY52pQMGlwKhxdhr
	Rik8XOxJ1jNM0tV9PXgH5q7JElU5+8AuHvHu3+oIsmpWGNTzsP2O3nFH/87BAcGlYYsAZNHlznO
	yY1bwf74OIjsD/Yl1KeNKoN6yhsrJqnrJzd449VGTlxcgMYkQBbWrdQjS39oPgJGNxcUY0u0BOh
	q+LWJ2faixkuAURYAzTgkoFalfIeqW/rQ83KFiWKNIv8v+6xkJ08Z+7noP078DkHOoxtj+aUq11
	76Te6PQ7h5Ud2ZDFN7A6Ts1liI8mYnQUSWOi4Q==
X-Received: by 2002:a05:701b:4213:10b0:19a:a2d0:f41e with SMTP id a92af1059eb24-19aa2d0f58cmr6269251c88.13.1792945472995;
        Sun, 25 Oct 2026 09:24:32 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:7b93:fac6:22d5:5a09:b572:da26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm16385722c88.12.2026.10.25.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:24:32 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sun, 25 Oct 2026 21:54:17 +0530
Subject: [PATCH v8 1/3] media: dt-bindings: Add Himax HM1092 NIR sensor
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
Message-Id: <20261025-hm1092-driver-v8-1-9cd575c366cf@gmail.com>
References: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
In-Reply-To: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, Ray Strode <halfline@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=1596ZXtdhvZVs+Tdnu6Ajw7/QmvSTVTcByw56Brktwc=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBq3i0z67mYS9Bva1TiFN0E4tjZI/X24V4+ziTJe
 y5pUHcvLhKJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCat4tMwAKCRAVlYpeERwF
 3l9YD/0RRR5cz2oYBvIAYphlv5y2TIn4TiaivLC/2N6Hc7GGnP/8hNO/yjqEFbJX0jQwVWWqQW6
 j6YYV7kTyt8Bcc7WtDcHxBYUPEJxluvAOlKxBxiTme6sabfofIDRK8GypKvFG4oYiyuRg/WOKRj
 +3TIdYAsGNGc5jHA8hTjFijQmLsMpF08tv8aU3c5bvVfcrRI67eBS1ZXmAEv+hvqAYuBBoyHVrp
 wRD08R6wCGGwMJne1o1m2LF+zIcXLfOi6U9N63/bMgJgK9d0Yi2bsPiNnw9p0tG5uHWTwxtGdAh
 q6m/+aGIQYYXLHctB9cfhhCGwG8roG5QSapC5s1XFaNPnv4un2f6zXWc1zMVHOW+OM0WPfpxxAd
 o4MXKXPkgAeXcUUxkGyEiGBbYhR70WYz3oyRzGKAXTSPiJh0iSdNs7Bg2Ac2jc2f6FcbWsJzaIL
 kwXiWl07voM5pDwOIzR+3pevYC/XThyTJ2ieON4JBbefD0wIg37uH7AmEuPUBr2vmnkmlhYKJ65
 8kHj0JEzbYf0H+UrIRjuOdiBxS2pLQPeGLkndh9F8ZQtLElUOQdyl2zqnVuMFQmOaMjKI8uprBT
 Za3oXWm5+nsca8SateWzWCFshMaEbFjb+7XWKsR54WBSrrcg8tl2y8IExnnTJocyPGIp/9pdd/l
 0AYJ2GUW0qcU0sA==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..e0a8bee62afc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
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
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    link-frequencies = /bits/ 64 <180000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.55.0

