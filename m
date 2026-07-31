Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3672E7375
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483330; cv=none; b=mO5ag96qLUzBVMevYJNvp51T7aBUlLoq/mtWeNRre+VL9knI4H22gw9+cLIeTnJNYnn5erjJJBQhIWTIEwkgSb6md8QuNp8LKKeI9fvQNo1ZXwTKDQxiyEmvgf0ONhiA9bBbGMwaR8dV0Up5oNBaDC/96LKdOiEYR/YLjnXcNHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483330; c=relaxed/simple;
	bh=5oeuUMiEbc/gnXYZZCE8rkqJNDodryJrsNnHvO8sZ+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qawiUi6BveN7IkV3dcyGsWoJR/0buf3j7ouu6yjEd1FNzMNSxjwEgy1rMIqHSE6iTUoXjMpfK0wLjA9a4vSABkci8+/nQv8a5pFC2Hu/PR5qvd5XNrfqteEMSinrin9qssjDqjrCJNARm+XdErWHuOJHaIPl2knifFLYi4nt/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY0XIITw; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY0XIITw"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so522963e87.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785483327; x=1786088127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0sgP8zYMtavu3QILMfV/lK94fX3GKCpo8mco+Exael8=;
        b=dY0XIITwIv/WMovfZEKfoxC4CpWowxHnZtTVM13DqzLmPpx67tmX/BmR5Gk5pHZBJ8
         cwBoC5gsym330pCogP7Y93WnlxgBaJHycIAKOvKy/8G0RAPkqUs+C0zErH2XcQr7rUmh
         JMPm3GYD4SbwqSFWo0H3WdMYZGEw5iTtklQceuZUPU3T+adJ6rNq1c318LD6kfkH6W3S
         fG5Z6TLx/tU+CqvqSMJxBLuri89Is/SvV0PH0kwuzHTbitShr6CQjbsAir3MJE5YTWWG
         NZ2YhyqvfwQ+PhSgO0hXDPJ77WFGlfYQ666RkUG6ySvD/RrCid1HNT/fQdRNZ0megegH
         Ljog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483327; x=1786088127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0sgP8zYMtavu3QILMfV/lK94fX3GKCpo8mco+Exael8=;
        b=G50ipnQA8j17IRK5LwyoM/YLKdXqnHfXpLZo/hLZKJaMRn+G9Qe+lCtCNU6C8MWJQx
         Lvr6S9IXH+ek6hk/iDjs2T3FjGyqIS4ffykZ2qH8kmRWfMfcuXgPYUQgCVON3yFX4xwh
         BD8xaj1VlflHeG2A/Y0gO21jGuEx5hfEKKioVwvjMpDK1zOx1qWmwPCgTj4bj6/hoW4j
         SlpWe1k5ZIzffQcp8n2hLCDnU2KjBEks077W0HbpFmJpqvuJbJrmQokmfY9KS1NsKQNP
         i8LJX1prLMJefLk1JgmHene9A+RrlIjO0cAw8Yg6kB6gDYlYugfK87T2JUybYqi1x5y6
         uLfg==
X-Gm-Message-State: AOJu0Yzzay27xu6XKJx8fmdkRKPkNN94nkFoygAsMAP3DvFgyASJaeFO
	OLXFiDvAprmt6kxTok1HZNIBFup36DuXxiIrHpOpvBMcMTy5ZtfYfyCd/dXrSaqR
X-Gm-Gg: AR+sD11wbyBCWwQw8CeUgtBbHbE/1TOY6rHN8K1DSoSB4YEwMTDQHpXWyJAf/EKjJWe
	WcXSCSuGWXqvZEEWt4W3CaMmpxt8tqkgESqhjgjCsFEUqtvEPrv+DjwqdkiPcHqr79zf8TG0lKa
	ZMkcoCToXqBD7CpSCk/00QvUTwKDVjvvLywGs6Z+JHya0c78VHFRrlndBoNtDEXFY9cfxNWTpJ+
	aXh/p7HCweAxLmwQuTF+gFf6SBbNnOR20Q+U1O4nN7dLm+3GO0TduA+vZRIV+TQeLwbAmfn1aFF
	v+aEtMpi3K7aNWQijeZq5DQqfAV27lt+LLYbdrsyHmFG9mvk3QZuMtV/ESC5ifhTrw1Xa+KN5Ph
	eHCsEvhrbRFgCKj73iY3b87H1xqFUzNqEoxAb/p4ra321cY2VOimGGsFwy3CWrdolzXdXrVBFXd
	s8vHsECdvmcTTEe7HEpeH0CvgW4JFWHhQ8SiA0pGBZaZyp9WrCL9EGwoqXjfaxbIhQHAZQf+q+8
	44l
X-Received: by 2002:a05:6512:b98:b0:5b0:1df9:2ae5 with SMTP id 2adb3069b0e04-5b2e1fd6d83mr280185e87.14.1785483326711;
        Fri, 31 Jul 2026 00:35:26 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbeedsm143653e87.30.2026.07.31.00.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:35:25 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
Date: Fri, 31 Jul 2026 10:35:04 +0300
Message-ID: <20260731073505.2278769-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260731073505.2278769-1-eagle.alexander923@gmail.com>
References: <20260731073505.2278769-1-eagle.alexander923@gmail.com>
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
 .../bindings/media/i2c/onnn,ar0234.yaml       | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
new file mode 100644
index 000000000000..3ebc1cfa23a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
@@ -0,0 +1,123 @@
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
+      const: onnn,ar0234cs
+      items:
+        enum:
+          onnn,ar0234cssc
+          onnn,ar0234cssm
+        const: onnn,ar0234cs
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
+            description: Number of MIPI CSI-2 data lanes (must be 2 or 4)
+            minItems: 2
+            maxItems: 4
+            items:
+              enum: [1, 2, 3, 4]
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

