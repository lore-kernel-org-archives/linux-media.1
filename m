Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874545;
	b=U7EpMNaWHM5S/lWzm0gDmIvuzBdngp0I8ljCrjkwyMgaJXTyAbEQqpNGCjjl1k8Zvl+L
	 uLxM/5Rn0om1+Y1CT8OB7R5wnJoQMfCIxFEc8FA/u7eDIWzxlpoGpoGkOmw5fr/G6UR9Y
	 34hl722mirjwkbuMQBQVasRGvAel7xzbgpLHHzP/axNVsGyO/HtE84qIi1/WG6RE5Si+2
	 +2NG0ynPRclGKhl0bTnltLUK3KmDBv8i1NkUBxOTFh9RyL/kTr3CYvkLxauN1af7gT04a
	 D/RhS2dwfXbdjS5JSsaWf0qLarXE47V5Y9NfO3WK3YHxAsHZ17Vk1EvoZ2nkvlq5eYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6hANZJB2Azv54bDyM4oKWaAqx1DIkGLLUuu1pUJ8+bU=;
	b=2yUaAqK5RI5Qct8JU/CmBdbRz2XjTHmGE7viCwAIT1T8waS4AGWFKcVfPDWbjKOdz9BQ
	 S+A79WmPqXh+IT7D2RF5Nd84S2lYmSWP4OokZunoNHqJHJ4HNftxwGe9+ElfhlJOjXD7S
	 6gd7/OBT5nhyEDCH4YKP6Xr+UhrKQ5fEC2XSxoS8QYftnKNBM0ONfGtTi+1GR5ws7dpaN
	 th0YCirgkreeRvQtYE0kgIalk+HrkYKDoNm6j/s9C4ANX7dksPS7AnhRBchci/7uTm1o9
	 dltKrXkmgmh0FG79gzBOujK+Gemmq7lsGB35VyHnChmYksZ4WiX2d4m2qmNmmeFDgLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=0wRnwcbH;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41797606D80B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 10:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41797606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=0wRnwcbH
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so102144266b.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874543; x=1794479343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hANZJB2Azv54bDyM4oKWaAqx1DIkGLLUuu1pUJ8+bU=;
        b=0wRnwcbHBDXCOMw+mNKHeFRL4AwbI6yrcXn5GRDkodHv8/+T94lI5/17TOlFhmSDNk
         xKdJlNMTUQEP+9bsWQithmvKn5GAg6J2hW4dEpTERqTd2d4vD/ps+7CqmyI+fvcpU3wv
         ygLREqTdfUz4kmd0BW+6gng80Zoq/GUYIMFoVRyT+FDapWpE9YTci5IDO8xZ2iFuRTlj
         4jmWFzdPacgYetRKp9+qXF61ySUlmH7FRssfo+uPN9j3ACpSJcRdrOhBTsGNXSB5noh8
         LeD47MJqtlKUgfnm7vN11dtazS+2Nl1KLymo/4+nxFcDe4SEjFU6EkxOE5W6Y4z7m3FT
         L5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874543; x=1794479343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hANZJB2Azv54bDyM4oKWaAqx1DIkGLLUuu1pUJ8+bU=;
        b=P04vsKP8aN4xvhCPNK9tMrziBWcZSrykawdhJLKKt2oxOLm72uDMBIj3U5olWPcwcK
         QMZtF1pA119ljSBAVNtkI20kbCeqd5qoTf7te2kbQgVAeTHCWiD5pM5vpp4RG89cNI4e
         lb/eTwbhRYBopsW3IDwT906PcWLjvHt4RxKQ9xy4xgvWbOConfRE6ev9nJREH21IfTCZ
         3KFc82Q3HNjHpwxBmiV9/QUbI98Gs6pxT2zbP0ShO126kt9LLK1sfljF8V6uBslo2l0Q
         oGB6vl2lGDPFgxpBLemdNxks1PPj9/cL0ZwBdfq9dayL0sIeSFMij/YUtgxUwdpNoSAD
         vR/Q==
X-Gm-Message-State: APuU4Z9RSAH+MveYuUwjGW2ZI5IYdwmcLU0qoaubD8XDQbmaSkoGCTWY
	t64byE49/62wkLSIDgwRQm3+Qs6HX5WA7/YpMrYWPTexLrbngj93nrACYGVMfUtDz1Y=
X-Gm-Gg: AYBFou1H/NlKlYRUX80FLA9xurnqnm/Ii7I+Faxe12ZNMyENhLNoJfZrmGl8dCzfOl2
	iLWX8kjAVaguX+HThCeQMAKvrmUeGk+zjn0KSexErX4aPkX9w9n4Gneb+tbGIZxEnxooMQ53iHF
	HRmV2qlrEaSp0gK8GpFX3/i+h3jr3vcKp0bnTZi/Z17oflahIc4oy1dldLKZhe7oZsrti+8pAkC
	dEFaRx3ICxvL/rh/9QOdzBMxgtrVgcrgrtF7QXON/2jmD6VGdNUg+3mBRRLKm613bSX5N562ruX
	4SHIqZ2s6VcAia8JoEOLqfD/9F2j0K802+M7WrZzxJ6sUXflSXHL3y+C8I6L8xST0PabBg0KKEF
	WMA60eY4sNAWkWEnw2a/jsibU2M8PyP3P7SknJlm3+d50xs9FYnLgKpAeJXlwT6VsmodJzgVmoT
	JtT174WQrPxugLCBZarlgiAmj0v8/Z5gzZwVkaq7UaKQLLpYa0Tq8XfOy5P1o2ZmSjiQcXmmg8d
	J+shXjBeh3wbE1MU1ZDlBvCQ/6O+oLT1eZOa+/wBx+X6AdYU6t18sLDIogdc29cwvZyFlUEqsV8
	/SSeE0k6nPTRdLFS39SQksubH9hZ9wN+XsdxZgFgjy9Fbuq9FAx1qpWx+2fGmT+RQVvePAapSkK
	05Osikscg/Kw=
X-Received: by 2002:a17:907:3e0c:b0:c46:7de7:e41d with SMTP id a640c23a62f3a-c4d206f22dcmr174044466b.18.1793874542649;
        Thu, 05 Nov 2026 02:29:02 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:02 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:00 +0100
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
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
Message-Id: <20261105-b4-dw9800k_cleanup-v3-1-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=4474;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=JHsk8t4k0NZ/ewosQGK5JWUdcdnvV4ysNURYZvCFlcY=;
 b=oyPS1ksp83aCOZM8rLYrzBHtsAgqXH6Us4lrCSRrPMwn0DUWjkYjpeq2R5GcVNG7nwM0hTMYT
 ugXFK4bJBILC9xpBCKZdJEHcb2yo6gtC3Z/utzScuCksPc0Pbe7MV3d
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with its updated properties.

More specifically:

The DW9800K did not share the SAC1 and SAC6 modes
that the DW9719 used.

Description of vcm-prescale does not match the calculations labeled in
the DW9800K datasheet for how clock diving rate is computed.

New property timing-control introduced to offer more fine-tuned dividing
options available to the DW9800K.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d0c4f9af9e52262b23881abd37cec..38db0764c0f70ad49295dcddc182b7e100a68b29 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,7 +21,6 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-      - dongwoon,dw9800k
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f5bae7b287f1bbfba0c974431bc8faf232c06c45
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+description:
+  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
+  +-130 mA output current sink capability, designed for linear control of
+  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
+  provides a Smart Actuator Control (SAC) mode intended for minimizing
+  mechanical vibration.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9800k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply, can range from 2.3V to 4.8V
+
+  dongwoon,sac-mode:
+    description: >
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC2-SAC5 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct mode
+      - 1 # LSC mode
+      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
+      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
+      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
+      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
+    default: 3
+
+  dongwoon,vcm-prescale:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 #  Dividing Rate -  2
+      - 1 #  Dividing Rate -  1
+      - 2 #  Dividing Rate -  1/2
+      - 3 #  Dividing Rate -  1/4
+      - 4 #  Dividing Rate -  8
+      - 5 #  Dividing Rate -  4
+    default: 1
+
+  dongwoon,timing-control:
+    description:
+      In LSC mode (252 + value * 4) * divider value in microseconds
+      In SAC mode (6.3 + value * 0.1) * divider value in milliseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x00
+    maximum: 0x3f
+    default: 0x20
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        actuator@c {
+            compatible = "dongwoon,dw9800k";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,vcm-presc = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.43.0

