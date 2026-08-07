Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FBE46EF8D
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 10:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786098555; cv=none; b=l9GK8+njF085U80BstZNmLRuM3rJDkEeSIGjviVbY46p/qQ2zPrpAEdm8HEEBj1N0lnWba7my2FSUTlbHx59hyurtQVS3evtN6LdtLj6sKAARNOzubJklelv40E/+pmiBzIJp1RQoUH7HZZ+AXBE9AanU/VZ9KG69yk8e0iOBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786098555; c=relaxed/simple;
	bh=Pcly90Hr3S0tO+FdcmS9oaa/Iu1o6r06YG+f5mNv5xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3c5fPh0dm5tOzMcwv9lmD9uPnYWuMVNjp8pU5KF9fqsvoUdkjDYZ84wYmqQc5/hrI68ll/k+IYuDO0qyDV8SQ0i+Zgw8wDij7QZGpxvpaPy3ffysXP28+c0dfByJrB8hdUuwbO8VDsYUImR9bHGNyqWPfrSCSejirCxG2oSHdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvfI4o6L; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvfI4o6L"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso2958849e87.1
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098551; x=1786703351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJFmdsGJ2WppByZ2NPQSV9ghzwoP1HtmLTq1RZsqSjE=;
        b=BvfI4o6LZJ9YVxskuedGZ642ZZ5s6B6EVD3wQMQ1VxCmG/nu2ETkIxobU0Mu78Va3c
         9XsTG7xJu7K1iQsQVMTOZhcZrghkQx4W77vym3huS8zanxCjW4lQAVlic+uj3ENk5PnR
         bZ/YOhM2HcW5a+rzV5jHmaieY2tQAC9Gn5m/MQjtG7HDJTGfA27ScIrSoSRiTtJbNG4r
         NMtd/CF2a2YJB1EugqvEFjI6bz3xeDc2dq3rf07iwOYDCTMI0w7Z5t+4yH/aixbZLbXw
         uIQ9mDANVvEzrECSDISF4nE7UH+QQZUQxJ2TcG/dVWOhUs54VMQr3EQOZT8MDjxn/J4T
         GEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098551; x=1786703351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJFmdsGJ2WppByZ2NPQSV9ghzwoP1HtmLTq1RZsqSjE=;
        b=YSpJCPq2wLuhn1xV2zPpQa9Qm0tluDcCzizzCkreRreBXLa+ovwQ5nxmsQ4ywmFdia
         fk1MLGfoFdvz3qoBuAw7UjpMCfsAQW+Ht3M9XCWaoVYKLFKxzZkYA51geGFcq9N7OMQt
         m/ff4ajIQ3ZoAzzd5vKQq7Y6914YjqMEd9NIDM0Ov60cZk3Bqigg0HQFtSyY2uhzY45B
         6/00osV091QuKY0y3/Q/Y4nClD6+GJLvubWznAqm4bk945SxMeFptU7jDAw0kp6scl7U
         K7h9rDO83Vv47U4/HrHY+ZZk39fH2Ry+nEFhr6RHnK3walVPSwH4qxPVuKaBU2MWdxZF
         twSw==
X-Gm-Message-State: AOJu0YzXToZVZYAtOz9Rzj33wsipBarZGncw5q3kaSDAA2a8Y29pJF0F
	xe1Qlhi4ZS9L7KOpg4Hwu5ovLLMxU4LyviQa8tYATVG5M++usVmh21qHbkwtLnc+
X-Gm-Gg: AR+sD11sIg7bVr2WkrrU4dQLf3gf30G7pKGWLvLgQgZI2zDxU4erzUwU82uOzUcezBd
	Sai/GWFhUUQaARCgyQ0hDYo8z8rcl6IslOoIb2/39R7ui1F1WJDQ0WxSGP1MNKx5doUPZn19Jkl
	gtsZYj+s7jk7UWEcTFEdrE0g/x3Y6aWSyhhQdm/IguEZhMrF8kv3OIJNWEbGXSvEkENL1d3nDaP
	egHHioGa8wbK0BL6/GX+XYNDUOhir+DeqJQ6DWc7Sd2OB9JseNZHSitmMgrOD1suFOc6owRVurw
	p6zXvDmCMo1cv1TxPp/dgEQHZ5+VQ+eFxpglMQNOU/GVtL50yj5RN/f8fhlYjWAsV47HW5J6gi0
	2uMr2RIdSxlXo7sRsgTx9+BRNAcu/3fBVK4FV3jSd5sG9JpH/wv7HKWboIfwK49KbaiquFqPtNH
	5+t62PoJjzNoedjTFrPI0gak/ULrzZRkjNXAR7qoV4zDbsmo8qtUagvosL+knp8xu8RlWrbvv5N
	0kJ
X-Received: by 2002:a05:6512:33d0:b0:5ae:ba8f:f9fa with SMTP id 2adb3069b0e04-5b303b4ce93mr1220484e87.18.1786098551350;
        Fri, 07 Aug 2026 03:29:11 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1d2bsm394811e87.6.2026.08.07.03.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:29:10 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
Date: Fri,  7 Aug 2026 13:28:46 +0300
Message-ID: <20260807102847.1813059-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807102847.1813059-1-eagle.alexander923@gmail.com>
References: <20260807102847.1813059-1-eagle.alexander923@gmail.com>
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
 .../bindings/media/i2c/onnn,ar0234.yaml       | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
new file mode 100644
index 000000000000..d6db435be9e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
@@ -0,0 +1,126 @@
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
+properties:
+  compatible:
+    oneOf:
+      - const: onnn,ar0234cs
+      - items:
+          - enum: ["onnn,ar0234cssc", "onnn,ar0234cssm"]
+          - const: onnn,ar0234cs
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
+  orientation: true
+  rotation: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: CSI-2 transmitter port
+    additionalProperties: false
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            description: Number of MIPI CSI-2 data lanes
+            oneOf:
+              - items:
+                  enum: [1, 2]
+                minItems: 2
+                maxItems: 2
+              - items:
+                  enum: [1, 2, 3, 4]
+                minItems: 4
+                maxItems: 4
+
+          link-frequencies:
+            description:
+              Allowed MIPI link frequencies in Hz. Two frequencies must
+              be provided, one for 8-bit mode and another for 10-bit mode.
+              Each frequency shall be within the sensor valid operating
+              range.
+            minItems: 2
+            maxItems: 2
+            items:
+              minimum: 360000000
+              maximum: 450000000
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
+            compatible = "onnn,ar0234cssc", "onnn,ar0234cs";
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

