Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432124;
	b=dTaFBz5c5a9UtxxU7mJHwsdzaboIyjKmTQF3O+n0l42JL1y1DoTPzs/684JXQwV3GHQb
	 exMASLSBZ0SzEwPytpHMPqVajJ+5hXmBISe4nMB/08pq5OQYI0sQm+iNkmKQXZHdECAm3
	 51SzR/j70YAZ2TjqTEtyrQypqs3N2BRDNBIaflw6Lvdyd+y1npQv72RErALMj/CfARMTH
	 ssV4H9zJxg9Y3wvX5E+dcuAzmHZxUD5AHqAY1PbALR1IOtVo/PlUb/g1yvarAptAT3/uC
	 oRAjigNEOZR4t2gfLI5U73R+TPYlNIz7bxtPh1X7yBLuHuYDG4VJI3AXnyWJcdgi22A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
	b=auFWq54CpljYpaGQof2V1gtrK9YJUY9bO5N1R07cETx+1noXRj94cGIlANwimd0RVJUQ
	 eA3XXB6D+v7vkxAJFDEWisF5DNiwgk5o4Aou2O+HuCK4qHfAEMldFlY/w/QZdtoeaViof
	 phcwSDNkqjvHVw8klfRsbv8bsL7gR1aDPIVKFPCGHSbmrRqvMBq8R1nbEnSGVK9qD8yt1
	 IAHNPXo52b1mUOValoUjJ83Igb+FYzIAexiv8MfgBb1GmwqVhlSnzGdxDenZTOQg0PJC/
	 RttImptcI7VgcziWdlxpI1iKMDv8BDoJ+9LwsvNgLzp5BhJeDVsUH/pFkWDkR0f0UNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BE606A32D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C8BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so4313097c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432123; x=1796036923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=NYhklWzVFa6EfONV/VswvwA7Rdk+KRRa+1Ppi9dOVfxxnO6ONCCtVvCV9Fa0jaIgez
         3qyQOKoxOp+nGGCsXHpCSDEMBrgAbdWEmHz781jWAGYqXS3Rad3DfH6UIOHRaam3xaKr
         ZIC6xeoan4KDakRyolQCM+S90cFzwyrVIH6vGUNY/CMlwpofanGGNQNcqPfEiZjM6Osg
         NSAE49kDjc25TZZFzKHxpDM8aemIN8o1tr2tI5Q788T9xeCgjyn5H54frG509qH4iqjX
         TSEGywEVdnSxcGKmIkaDGOBX4iHypo0z45vuHIPjdoF8igDIah2vqzmiyT4xlqdurLC1
         37lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432123; x=1796036923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=yzEQpCCJE8aNP08apWUx2wH0ze0ybAnDO2rhPm7WGDciw2zjq+fEqUTyRHyeZJ0Rgc
         WhxrgOQaMIZS9c7balDyvj8QLsQXbdhTKTLipjpyzsYrvIKPf0g2R34KZ74Ro2UxBMnx
         OraL61CJFFv/MGjhznlVcT5jf3D1rDAGriEY2inZblHY8wAt09pfqfMroElO3BMC5Wgd
         1QBFsmBIziseVw+ZlFVj1aGltsqiNPNMxNEvszcsacsRSLxTHp8G4v+FIY0i3w/ZN59X
         Lz7ydA4sgPAOesCFBAIrN4ArtRHosuUZMbqZ2IoJ8fg5waVt9qvQCc/o6L1k4Pm1/PC9
         nLCQ==
X-Forwarded-Encrypted: i=1; AL+hErHmPjzf+t4Q1OBiKf/PdzOKihhdW0mWimLlpQGD+BgmOvtv127GZ9wvQzjjExXo61R0KY92bWNMEku0FQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/zxztZg3WSJ1YCxCyUX9Y0Y7SH4tF4W1UnNWnWklTdJg/kVBJ
	9usZK3Gkdanti7gJUcpiz3QK/Voggqpz1SVg6tRAkReg03l49blsENw5
X-Gm-Gg: AZFdTZfJqj0ko5bbFc/jKbPtyR5ZcUhv6GJzBgVu2riFlTZe0TmFJjvKJDDBnOGB1wI
	ePRQMgmD44d4sk1mDuyhrFmAU/AI9AznSVRicbmPA4KwIF1A5uhIsZA1HgOwtabHdrurS1poY/N
	+raPx/443zoAjH6o2aV8DesOjI0d1AYbssYJrIX2zPL6k4envTf+J4v+F93hN6as0ylnLQPF6XY
	d7QG/Zkn1KoDOmb+2yJxmnZwD833GIDNCuLpReFjKimJ52ZKHNJsjHea6K5lisfKltJmLdgabIP
	6IWW3EBw5qlzbkqqGP0Qz6LnnkFhM1NUjPAuPOTGOTswjOq92HIJSMT7nGbkOugaJVD524CqQ/O
	bEzTgZQaGMpzbzvs1xFSZbsVtgiaPz1Vu0I/ff5M0MyJxZ9e94DhRlRD4Q7Kg9EJ6Cfe7hiSz8/
	aUNp+2PGdamodsItMPYwcmCmSRZhM/0f9hCHwbFHMnMgibQ/IGzqpi784PXxJTVAonpkWsFwfxr
	yXqNmvvAF1mA+gvRlC1XSsiT3kMdMQcnzt/Ti5P1CxOKxNqrRhGAlTASbzHx5x5rKE1l283FPTQ
	c/Fw1yBW5w5GoVkrKn2uuvqGagflMw1Ny/YZK5p5qhZ5yQ==
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr14442888c88.10.1795432123328;
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/6] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 18:08:03 +0700
Message-ID: <20261123110805.119610-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel
MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..6919277c2b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  pwdn-gpios:
+    description: Active-low power-down GPIO.
+    maxItems: 1
+
+  vana-gpios:
+    description: Active-high analog power enable GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
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
+        properties:
+          data-lanes:
+            items:
+              - const: 0
+              - const: 1
+              - const: 2
+              - const: 3
+
+          link-frequencies: true
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
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
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
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

