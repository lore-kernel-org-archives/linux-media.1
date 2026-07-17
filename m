Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA603191CA
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261351; cv=none; b=a92unvxw845OkibwMmBqhsINGpTieOBNZFa9xR+IpPURReYyINpF+jy4HoQmlm1l6B0PqjNTjC1ABAK11cwUM0rRoGHXKISobsiLDOXX0yROsZdaxCZ1xfj3mibU1QF2qtV6/1z0h+QNyH0yJY9F+j8sl+aL4kZb03EEPcPe/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261351; c=relaxed/simple;
	bh=1I4d9UfWpRC1fK0Z/fUvhcN0vC5HspKK/6F446VRO44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRDCZ+afSCjqATxhnmZ6ANED40nKNh/YDQvjxlJtWLeApUMheHK7K8XqdKylb+FJPqd7zG23Tp0SXFg3WwT8lYbtZesb/wwY5HcuK/L11zNprxRIZiC3+xS6oXh80VckypN8j7TYs6k3i2zePJlcoKbHXuW1P7/XCfp+qXTxe9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6pWl9CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+vz2h5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6pWl9CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+vz2h5M"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H34XOe183687
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 04:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpWa5umlgGBGDx7LHfS416tJ6Lv3nU+N0Jb/cGOdKho=; b=f6pWl9CJfJB+orgI
	z64CTLkohs9poRqrsLcoBzFSQkVOP0SmQEzrWQjnHtXEoBid7+orLCbJgoV1Wg/K
	xGl0cHCpep51oN8Cnv+t0j58/6c3xo7Eu7/IiGwgfSir+VrAt+l1+fd7DsuYKj4u
	NlUTg0qwJpz6Zy2URWfu1DUgpCJCO1UV9eay3iUBI5hgr3Q2iZWhgeYurHtw1/FT
	kjZQSvqZufNUyHsc2f61yvzNS2cQWZU723crjivIeOuR+HaQJgfJXKKCv0Syprpr
	xMIA9/Ll9z0aC7wj3FveFfc+1LD5lGIUl7UZLvT6xUaJtoa/58oqVP73gUtCcEEc
	UCwRUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9jk8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 04:09:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef13b61bcso1082797585a.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784261349; x=1784866149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpWa5umlgGBGDx7LHfS416tJ6Lv3nU+N0Jb/cGOdKho=;
        b=K+vz2h5M2wBiGY/rMcvsvdpPsGkHauR+hZ5uAxQMpu74tyJ1dIlDcvTfsA17nnTNQ2
         orro4XN4fVaovucC0C9r0O5jvXjq2XUvvddwvb/zsWM8GL/Et5uL/A1kf7k9PiojFjm0
         tvMDrXxgrjxmA1kt43HCSSfabnSS+Mejlo+ZrVG+4HcUg/5tpLA5jWnB2kvCaskjm4qg
         MlNdImMfazUJCydficp5j1QYXjlvF0MXdDOpdXgXWdgJ+CTjG7VVN4T137v6fyPoq9Fy
         s6b+ndcMTLoGHHVJ/AzLapszmUsbwCsLpyltW3s2EV1/+krMWfKl/eMGljlR9oBW1HBu
         g5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784261349; x=1784866149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpWa5umlgGBGDx7LHfS416tJ6Lv3nU+N0Jb/cGOdKho=;
        b=DxSPrW8eVkXYlgCL9LOHCltpFPwxr6KRRj6oi0zJjUggsgFO3O8j7hFAOF2l8AKV/2
         W3ClQCD6F7j+eENnaWsO1KqEVbPE5DgIY7l5OXH1ZLRx5jJAbB1ePG+bKbMBcS64bcU4
         uus2mTdFME8dsjD/6Fpg/PicpRRP4Y7FNU9Omqi1m3Pd5Swp9iDq0BMq4278kxz/pLoM
         H1KdHEqodKO2D/EIy1ovV9XqPz9HXMhex4C11XD3dSKrOTiAvThs4wsLM+s9FUTvX238
         6PNPWmvSEqeJptTxdOtEetL99Hir9Flsr1XOiZSPXVzaJBIS7ZA0F6Lk/sm8aqyIwiH9
         Xblw==
X-Gm-Message-State: AOJu0YyyP9Jp5c0kZZU5VT21MrycikTu4w3v5iFRbYmdyXaYOpEM1kEH
	4rG/VeKEu9tBwXF11ZEZcw9ptEhjNGIcT4MWKptDFEBPWM3kNEZuFKozcuJeZA6KL6+SLiohJK0
	j7WzEGNWEHHzsnModZ5eoVoM7iCtBlmplJuMd5QIo9gdynzZnGPzA9EiUbDbLURIDrw==
X-Gm-Gg: AfdE7cnddSB9RUWc8b41RFHUlUwQrtL48yBM9jKwtYoRNWbel6xvrvIstTV1YcYPWwX
	ex9nsu1VNGgnhNkryln0R7zdbcGT/qrUcJGwpq9MsZzC3RIAz3oIY0NpM02MV3JayPLwPUOn0Pk
	hnOhY3TKecJP4zE9tiaBpuVq5r8OsnuXvzUQvh+7Bm7+rpzwFLcOVrYlkf/h2zEQhcz4G8XcscH
	93ODS2kcGEI3T/4PPl1no+8nSA811QZXSPgs7bhTSy2z/OTIw7yo29yf6MGVR+J4YmdyUl7rPCn
	6n9vCw2Gck6beKI/YOcWi4zOyT11P0VV7EZIbxfgzME/1SY9bn+nyBMQ+J3OCQEUBh1Xe2YDGct
	g1UIQKB5BOQH8xqdfemWCRX2AdyaLm/lqUV9LYeKwNFmrJsPxmm8WmF/BAHFsZtvbj/nv
X-Received: by 2002:a05:620a:2787:b0:915:ba3c:8c2b with SMTP id af79cd13be357-930b3eea5f1mr99850585a.19.1784261348793;
        Thu, 16 Jul 2026 21:09:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2787:b0:915:ba3c:8c2b with SMTP id af79cd13be357-930b3eea5f1mr99820585a.19.1784261340301;
        Thu, 16 Jul 2026 21:09:00 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm52313485a.35.2026.07.16.21.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:08:59 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:08:36 +0800
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-sk5jn5-v1-1-da610d7fd494@oss.qualcomm.com>
References: <20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com>
In-Reply-To: <20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784261332; l=4315;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=1I4d9UfWpRC1fK0Z/fUvhcN0vC5HspKK/6F446VRO44=;
 b=mKkT4f72CtUeDP/OsKcJXXYWksSAhhwLxY2F+hIUHdV+Q5S7Sb5fFm36A96epND9ZqM351HDa
 gz6oP1cuy70DQVTFoafZ8bsdVsGRU9WT/8+A44q6G29JsNlOTb8O3DL
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59aae5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=phExr7bpM11b3sUU1FAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzNiBTYWx0ZWRfXwenrcZyIAMbs
 a8PgNxWsWi3Xk4z6wfi38xa+9a5ZxF+roBguD0OA74z3675tiYpI34EcHhht5nJBfQu2Q7LDx1L
 b/BZhLGnjThIye7qmkRq3k2a9U0RTSIXnAurWrLJ00X/yaYrXvFxWy1s89Uplqzn0cDL6dGtJCM
 ZLLXtkTQj5vhlDbl4dAP59FUyoISB4EHLAlne8lu+d8PtJNI+2DDVzWXHAHCLi79xR5pmzznDMX
 RxLlTekHjcS+DpEoulst6MehQtYlB331Pe7bC1vlDHohVuSP7DyjRIQxsNA04Q8KfZGAUPCfWff
 3OKw8LREiQ5UC2LBZ9nMSJ1wIwS7oYUlYKflcoIdYxXyhC5eD9wf4czpMp4FA7SZe7Ss4IigQSU
 /tyPGgblb6K52zamX7qwgjI1BtxQ9gRx0a+6lmeH3C0GOHSBoKajyliclkVvwgN95KdzbWv5CDc
 6jD1az+hORPYTUjasRw==
X-Proofpoint-GUID: tx5Ij9UWZ8cIPTnWeODPBcnYgCrKltpY
X-Proofpoint-ORIG-GUID: tx5Ij9UWZ8cIPTnWeODPBcnYgCrKltpY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzNiBTYWx0ZWRfX/18KAAWV9yap
 mCMGK4CaoswTmg5/ECdZ1I+BMv+BghTCh8P8nSyih9S1tA6+iJl0rRFxV0gh7+YcJCiXPrgWwm/
 H+KlI6t/lpSVUT1FWFcNzBW89V0IquE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170036

Add device tree bindings for the Samsung S5KJN5, a 50 MP GBRG 10-bit RAW
MIPI CSI-2 image sensor controlled over CCI.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/samsung,s5kjn5.yaml         | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7fd9034f32efa93a753f27787b54022655010af8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KJN5 Image Sensor
+
+description:
+  Samsung S5KJN5 is a 50MP GBRG 10-bit RAW MIPI CSI-2 image sensor.
+  The sensor is controlled over I2C. The full resolution pixel array is
+  8192x6144, data output format is RAW10 transferred over 4-lane MIPI
+  D-PHY interface.
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5kjn5
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK/XVCLK input clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.2 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.0 volts.
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.2 volts.
+
+  vdda2-supply:
+    description: Secondary analogue voltage supply, 1.8 volts.
+
+  afvdd-supply:
+    description: Autofocus actuator voltage supply, 2.8 volts.
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
+        required:
+          - link-frequencies
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
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@10 {
+              compatible = "samsung,s5kjn5";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vddio-supply = <&vreg_1p2>;
+              vddd-supply = <&vreg_1p0>;
+              vdda-supply = <&vreg_2p2>;
+              vdda2-supply = <&vreg_1p8>;
+              afvdd-supply = <&vreg_2p8>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <1248000000>;
+                      data-lanes = <1 2 3 4>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3af0fe95a92fc21c60819b892142380fad2ebd4e..02b564cb8839e7de82d95855f95d6af17139d0f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24190,6 +24190,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 F:	drivers/media/i2c/s5kjn1.c
 
+SAMSUNG S5KJN5 CAMERA DRIVER
+M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
+
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>

-- 
2.34.1

