Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089AB3D3D14
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212547; cv=none; b=jmVLPzmLmjMJ3IRt3I/BEiy/QOfrjR32g5RQIVavNTx7j00YeGyqur+n7eCoA/vXx7T/lLm2XO/ZAbywRyCiy2o4CtObJt/BKxqJq40B57OxP4cVaHrHRkfoptaeeFByPpsWoi2jFzT/+5mT3Z7r4wRTD8jjnAV1vUXN/QvPn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212547; c=relaxed/simple;
	bh=S0nT3BAUrTKLK8CP74We5cbfPtPeph2tcbM84MiJ+WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwAFTXwDhBLq0Q6AcKpI5uulRkc1ZD8+71nENrExv7Q5P/m0iSTlrzTm0leflLYly/mg2lJdpaMT8SK3VJ9IZQT7h9ZL55MF2D8lMDhotgyhJ61UgoIEECAI9RJnLutJRx4tC8u5OkkhfFPfcypRoxEQEen5h79cAUFG4hCvGUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG+8h1M4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG+8h1M4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a3166398so2234926e87.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 00:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787212544; x=1787817344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ql+J5+ABfUrs7L4QXWjWubReIVNdqzPnQlh41MeN1wY=;
        b=rG+8h1M40r5Cv1fSGRjETId9SgyUmvWdpyPLGqu4YwZ/pVm4DxrnJQPxujcFmjX70N
         IIOq+ypMxVctFvfQ04oP9M3cBVXpXYsozzQtQeM5lAkAIZEflMFwnp6RHVw2BHfmu/53
         oYwGAY0uGBBa/Z6bIc18aftpEyDxYkdfHWClwLofliAtik4YsRzZ1Ps6HlMPFjLEQDhD
         ZEwwI/RRVIkQZmB8di/9vYM3vx8nxhQY0VkYuINIoi2v5M0oeSmE7dW3rUrEqPA8nn9X
         wyB4MB3oakfKb7OET5pblrySRpCWOHf/DcB1/nNJM4ebKNd6vQ22dXtzXQEhyBjdImRu
         KmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212544; x=1787817344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ql+J5+ABfUrs7L4QXWjWubReIVNdqzPnQlh41MeN1wY=;
        b=smQltaWnWjBrVzNgsAx/CHXqScBbcyySO99vtT1ndpz3bDTTjlLsD6jNLFK81qK5qZ
         IfbFi9ElOwmAW48TtOeqc2i1R9JBPbFntnZcoVx8Cmeq9m6SWfPRdgeU85vrLLGVXpfz
         PEpqIixLgkxr5+asGpKNGTmclgj1EqYsmxWCl/fP1VyxZIA4GdF7BRRr/f+5yPOesFTg
         FQajsOMxLV+UZZR1JlEtSHdkzz8o//qnGOfT4XBfRh7Xtys+k2lZAjdAsWymRELHdy3O
         bg/1PbWo9oMuKaek40AVaAuDQp5JYjOsJRRDNC40Sye3bYl2bzKlU6UkE0+z8ZMLA4RP
         kTQA==
X-Gm-Message-State: AOJu0YyQeJnO+j4imEz0+5U8TxE7FPVUCgcuxJqwk2KWh6FXCzB9Wggq
	UTu/cjKuWlYRMIvcM3d8zskeN5FcEtlvEGQrbmYs3ig+2Phhuh4LyMK1Zvt6d+Om
X-Gm-Gg: AR+sD118rO9VnN9j2Pzufkl7m9qWXFI3mK6o2nsGrkhtzgqr63XPebcdM9s7EuKygsF
	3b5BRMP4Qq7iZLYI6i5DSI+xFPOh3OOFXdQ7eHivjG4fM6L3vTzz5rzBre44j3asLGlDbP3WmNy
	cAJPSDuhChCohtRkmE7cGm56XpzURIfENCWdGONVfk1K2YDIBaaav0v0DTbO8rn10BFEYmTX7G+
	58i+MfgDZg2yl4N7V4QceoQJU3R7QuOMo6ro4GIO7umVBOFab05iK2RZ/yLaDfpiC6ZJJ001Vpm
	Ek9/rfGvIOiHInWJRq6V9TnYld+eBf4JK0UVCTuDShfjSmEJ+KDPGtrJ5mCzkdaZ+lzm5bJ2cCT
	KF8Fi6PqVQpXSnfyjVJKUEfprfJGJEIYw8vZgrzWraXK4MGI505UDRD01EeZKXCcI9Jd5i1aM65
	SuB1ZBR77BvYcHZJf/DpnvXrLFtVKLzqm8rE5HTfsPEqqD/KBPwb2wawYgGS5MkdblsnOuzAbyl
	GTX
X-Received: by 2002:a2e:a550:0:b0:39e:ed7e:45df with SMTP id 38308e7fff4ca-3a189727f85mr24440741fa.1.1787212543870;
        Thu, 20 Aug 2026 00:55:43 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189e15d1dsm11757751fa.33.2026.08.20.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:55:42 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
Date: Thu, 20 Aug 2026 10:55:23 +0300
Message-ID: <20260820075524.2056029-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding for the onsemi AR0234 CMOS image sensor.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 .../bindings/media/i2c/onnn,ar0234.yaml       | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
new file mode 100644
index 000000000000..ee321acf22b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
+
+maintainers:
+  - Alexander Shiyan <eagle.alexander923@gmail.com>
+
+description:
+  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
+  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
+  to 120 fps. It supports MIPI CSI-2 output with 2 or 4 data lanes,
+  color raw Bayer (8/10-bit) or monochrome output.
+
+allOf:
+- $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - onnn,ar0234cssc
+      - onnn,ar0234cssm
+      - onnn,ar0234cs
+    description:
+      The AR0234 sensor exists in two different models, a colour variant
+      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
+      the model through registers, allowing for auto-detection with a common
+      "onnn,ar0234cs" compatible string.
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    description: Reference clock (external clock) input
+    maxItems: 1
+
+  reset-gpios:
+    description: Reset pin, usually active low (if needed)
+    maxItems: 1
+
+  vaa-supply:
+    description: Analog (2.8V) supply regulator
+
+  vdd-supply:
+    description: Digital Core (1.2V) supply regulator
+
+  vddio-supply:
+    description: I/O (1.8V-2.8V) supply regulator
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: CSI-2 transmitter port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
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
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@18 {
+            compatible = "onnn,ar0234cs";
+            reg = <0x18>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_cam>;
+            clocks = <&clk27m>;
+            vaa-supply = <&reg_cam_vaa>;
+            vdd-supply = <&reg_cam_vdd>;
+            vddio-supply = <&reg_cam_vddio>;
+            reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
+
+            port {
+                ar0234_out: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000 450000000>;
+                    remote-endpoint = <&ar0234_in>;
+                };
+            };
+        };
+    };
+...
-- 
2.52.0

