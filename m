Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447708;
	b=N4McUSrO6PMWictNQ5qplG7kyMuzbCx1A1HuqaR4/G2oy+Vjon2Lb3DflT93OW8gsjAK
	 FkrjNCx57lmXTbWojwBP8LgtE2krBgM3iTcltJj1GEXcGTEnOcG3Sr7PUmkDShSM5kT/z
	 rouREy65SbyyVeLkTzKrvaoS8XXhnILOYUQN9CsMmKlWLamsWjyAg4e+9GfStNplmDbH+
	 00fuuuJu2J6lA01uIIPM7m5dQZoj/UgIeX8pHwEZC+l88dz40VYvvf1Oom1agymz6Rv2I
	 IzgXxoJBYcS9pyUtYUIRYvqLY69SDyr3ZulRZRzYOD9+GXTCejtnlgUMRYAgf+pScjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
	b=1bidLPJpq4cCIZdxFabMLUhfbqWE67BnE8Ui3mjHU83Q179U8y/7TGPeJ364b+Qj7zL5
	 VigVW62mFDeIiY14Ltuom6YSaef2qFHrq/SbLRnpV8sgbeHNVUid28ukG6XMsEUbMolms
	 zy6RRBs4xHx8BqQq43TkGh6J8gTv0Dh9OVqnnK/d7VJJmvnUsIEuJc6vg3oVNuFc1nlQV
	 6VHIkD9ZoSe2vsj2PsFN7NdSdSmgu+iPTrQqT4lt/HxoPmvhTIINVMptG9Hw1/uppTLtj
	 2zSCxNpfzPDVWosXDzrvUecx6K0eYq0KWcCNokDyugWwubhEEKY3MeKTHMwBhX1My3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZnRq9zd;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46154606A330
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46154606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZnRq9zd
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so10248365eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447707; x=1796052507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
        b=oZnRq9zdypvS2DwG1Ss0TUrzwJ9aSvyFrAgZKobCk09IPnQ3+hbgssNi1b+88s6HQA
         gY4Db2K6ktxzb9MAmtjTkyYyl0T/RlXH2j+447Yoto8My11eO2L3dYutkdZyglh4lqrS
         eYoMzqXw8RXTLxmVBlFrWLynCxPgbvddL0jhkkPYuLsGmpr4QFhKcHPkTlOLEDJijtKz
         YwT8bHlo0d+Dz7pZXD49rP+dCkUE8WPMXhjo8/qFjdX6OIgTgcin7yJi7s5I0/LXUUu5
         sLT+vjPyhTTqkf5sJIueIN2yL11f1kajYwmftMAFy12vDLalFr+BeofwB9Cfr+291A5X
         DnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447707; x=1796052507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdgqu3QCXJCp7CIEEJ8Efs+J1m9HLn7osT77U3P/bgg=;
        b=aACWRz/jifhz8ei8P29H5lll1dBWCjA/TOqe78JmCWBACDQ4yj9/k/W+hQw5DCtqkd
         kJkhmHtnSHbPaJisZ8MVIrHWeFFQYQM3RJ/niiyJ1DgXIvUh9zAMLMMYcaIg3jtKj/9f
         GV6T86IzQHdQeQg8eCpmtMzYwA0HdigPA3D8p24Iohx8Yy5gzkIZTPNPC3jqMoCxoU5e
         WoeWBCsCHHPdIG3bko7FfwVqQ91fL6NsTnLDSahUYqdX6K9p+XtayUtKu7FQ6LP9mucP
         9dL1oSu/8e3pmuDIR0mjscB6vtNjpDKexaULUdRHpcGd6rMSLvThArLNvy4yfPEqVFqS
         IAXw==
X-Forwarded-Encrypted: i=1; AL+hErFKCrnr84ETg2p03ZN47sKMZRezIzE96ePGX0qL7qzH/CNDJDTNsuh50EJiaURDYRByImvSjTG+ld+XXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xeiWVpGoYdRpnt5Iab03DUdPbNvCUhmB9DKx979MhPbVIf5DG
	2z7QmO+UUk3F5TTQEV/VcFuhG3T1vV4artcQd6+ecXUA3LsgjaNEJ041
X-Gm-Gg: AZFdTZcJx0Ox17+WuvEbzxRAtcFfAt9lMOeYttchKRUBMpR4N8/FpM63/IZqG3YwbMo
	K0uJV7IZUh39sChaOSHfUiXCsSUCqEuHgG0MsxdnkTVtVBPOguN3SsmWZ1iXraXllqPCKTq13/W
	cy1nYP4zveUKXrphECyIskOnrAfiKUtsy8qH7G2TBykfzZrcozEgkgSfgcLAx3ioAZk19eNwgC7
	AYLyD0U31g3tIf2dg/dD2FnVD5/CUMCEJYD0Yck7vhBQEi4y4dAcyzlHAgJ04llVvJ5vjo1iX7e
	mAMexjUS2620O8WYSLiL7UoR3JxjYwpfZ4qzG7AvXmP6IXnmAM6SYidmNmU5PFM09yWi0gGiQsL
	NgZB0Wb8JpAv7j8qJzDoToT/ZeDG+z2m1TWr6xKCRagxdMsvhMfCS7Ncb+/ztwQZ1RpNw5Uo5NT
	m9m87ZQY2emQ+kE+/rfqwTbmsXJfOTUaqOLaQtorKzLc94o5MZpFNjjLvxa/HPogCiY0w82MwpI
	cBoA7SGWll/R6j1zzNGxILYs10YSn9Cr/EXBT6kY3SpMk54lyCUv0c5Dod46Su9ci6m3Q3es+IE
	x+tkYrYHcQS09EWsA5YcqT8GxwcCkLitVDx41nx2tu+dGXk=
X-Received: by 2002:a05:693c:8859:b0:386:b826:3f9 with SMTP id 5a478bee46e88-386b82605b9mr1528240eec.7.1795447707306;
        Mon, 23 Nov 2026 07:28:27 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:26 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 22:27:19 +0700
Message-ID: <20261123152722.168879-5-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
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
+              - const: 3
+              - const: 4
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
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

