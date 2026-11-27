Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787141;
	b=UMXBe5yiEixrW2y8IVcj7YmXXXQKTvuMoNgpy3IlURvLQ46K1uPx/YQfvERYtUxDjgMW
	 xAiMlfBE2XSSPoPh/vYRS/gdtdkZGsR0Se4O11qecbs5quwOzItQKXFMzHEaWiis66hFd
	 FWaozniyAekowm3gP3Zf0+bmv7ocMkOKM5RbLqdZ5yUsDwwESmhGhQKa2elWk1KZceepv
	 Y5BnLEuk0bXqCHZt9sBI4y+h6vGSwALhNfnWWBLPimA57bxmPpD4FVy/baNyssmd6ajM+
	 sClLE03goDCzdz4uHemQRZqqSLqxFrwA+9Qqs5aH5lhXrRr1nB1zi15VH+DfNFO/ayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=0wBQhYXDSZPNIa7cS2FLX3ZUuTrJOBVRN8eAd4kpTvkxoJxzV0H+Mqh3Sl8JrcMBIRpU
	 ZU3PKo9P11pOP5sVelI45OJZR1YICP79dRLl1b7uDzRhw23QJdlqUIpffdD2W3Pz/qVK2
	 A1MBzSJJ7sgJEFZk1Nz7+tj80RT9/pcUjYc+jp6HaEU/ohBOeg/t7jaFLx0WwasVjplJh
	 Hwuk+ycxaLDyYbjHBF4bEe7RSz6yWwThPZBAkTgBuzV8UV0whQJs38iUDlssujMtKotfO
	 n2tRebWDLmL3HcWx0+ub64GtIvzVPh8m1WprC3SKVWQ62n7jFAyhGK9+Nqz4hbI0EJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5520606A335
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5520606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f052ae3c86so43963555ad.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787140; x=1796391940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=zqWC59HFBxeqnkwiJcA/vmF7PXqaSn4cPlghUfmvZNV5G3RaxpsuHbuhncRjcKUvVL
         RgVWQMgdXN58QHoMug3raBl6dLYdDukfKBAcgyeL28e2BM5cL5Hxg45qmG4jBDawc7S7
         lAEjzMp0sak/BpEjHW6drFOVkxWkD/DpzpIzeKtu6KfB+8s94kiR9T6TxqTYjNvoZOVW
         uloDbZg5rFJzZY5VgoLAdc+uiTL38cnKFgWeKaB+TMTTtan+bHjkFDVKszaB2FV/MKDt
         qUJrHVLE83u4ZrxeAcFD4bNulHhzew7Ez/XbUGlvtHVKZZZmkem3K3rPoh5EatDDP2EL
         X1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787140; x=1796391940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=h6MpMYe3voZPM9DbwHjS5H39QyRV1TwIfcHmJFlZOtvegigpHItq7mmLjFMLq4HM5C
         SRj/pDDWMXQUZ4V4Gh2XkCV9p3GutRRAm669FqAajvKp+uNw6rAFvzbwMv9AxxUVcikQ
         KCMeyRWZ2S72HZ3gmBETK/XLKMz8VqMlBIn5skSkBY5cOGGUbrnbuzKpzCC+euCRLGaI
         HPwn4Typ5kkR5hjdifjhs+rQAyQzRaDNTYbIhchW+muRz9Wkm+nqkGnySeiNYA/pbjvq
         VZ8+fUWz9exDTe9IHaaMgNdl3OFZ3pR5DRZxf4vh2WnYwuP40IuiNy3QKgF2d7xZGx/j
         EKGw==
X-Gm-Message-State: APuU4Z8m2DpG4vuavPE+gu48IbUXTXex9C5rwy7QlXPRhnSFSkPkAnIj
	XgB5XxuGvO9mXBe40YnwHaJesyL7T0Crowphj84MxcxxcOGKunSbG22F
X-Gm-Gg: AZFdTZclE9rVp9tCl6p19EuRhH3loRkbLEnMNrqr6AhDor0m5U3ovZwA7+r69zokpX9
	5SMILsWFxhB8FIAhRhZpNtXLkDD51D2kbBvGnrJrjJlekmuVEfoG+EEV+iRWM5nNfefgcMHIHAk
	vZXyFtuS4ucWQVjfGqpomDUwHk8KNVMVoqndzO5x9c7aJNG6VfCRA5THRW7fX7owy9V48xeK/fU
	pniAWpT3Q/GURc5euW7vAk19NYAU+HxFpzlyrnLsZgCSOQUg3HbMUC+PIgOC0M7ixTxQWnqjwNI
	B0poZ7pk8ztm2USaDSe5g3YyjN52Ut9r0jz3D7VjqcatSLFjHFnreoAXBjvRmmXxgWOW7IXV1QK
	9I/apgtjZ3HCBsUQgVOrPfd/6HUYl33+RWe8HvVnnGrPndPKMULAfx0NTwzcCJIeaXCzCqk2OWf
	PfrGDO0R3PMuyXgq2qgWy2nM0JmxGUdM3kaltliF2vueOfEGQdpIrXeH9eOF6un0YzC4IqOel8L
	bPYIxZINm2ncIx1IlWsrlQvAm5qFhIxaHTZJIanOvsS5uk1vPN3YLmfSoyvtqU7xN8sE0CS89dm
	JL3VrRJFjrpMnOAFyoC6u6bfEeyomYePvCAbntdfOKFaFQ==
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr270576165ad.2.1795787140051;
        Fri, 27 Nov 2026 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:39 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Fri, 27 Nov 2026 20:45:02 +0700
Message-ID: <20261127134507.125513-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
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
+              - const: 1
+              - const: 2
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
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

