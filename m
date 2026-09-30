Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED0D375F69
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755705; cv=none; b=BSKYJhGzle1BNuAo1zcbv+OkjWvJYYfD5gjSL2hkQWBHvS0EvTU5wJcCsgDgue5dbdwsmDpCUsgoNkt1P4cKOv49B01byM3jsy+NMtcykW57LqeqEWc2zX6+tZwp7A+t1WUN4D10iugoKaPnm49rgAfI4vgBP/9jUvBUpWEq9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755705; c=relaxed/simple;
	bh=EPKvKkROJPEyEuRE/ipg5dktsURogb/Hz9TNKB/MyKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSpSJNBUqp2d9ntnhTCST3utEBR9f/Ya65lQVeThVgmIKoI6jpv83ZRmEDqMKtVI3Y4Lhj6MEmhP9q5Qkp/aVxgQMLfDYfyVxB/pPR1Y4Y4WZf+AwuA+UZB6csnA9/KC94NEGmvtNk7TYzq6cgvdvCZlQ5+AEzaM2/su8Df04Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gf/pneb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WH/ZXI4q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gf/pneb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WH/ZXI4q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dbfr2433160
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mERjziZP9prCoKtq1eMN8rj15+xaQ2Rdsci+eQDqeBw=; b=Gf/pneb49IheYwce
	hoeTP+ENawogkdNciSPZOA0OAkkVBahuOc8DAqwP3WzDKVtn4n/OdwPbmHCbaZtv
	NP8nOmEQBykebiK3GjTp4FpfbM0U9X2+1Cj4in7Aed6R14smyf5c3NlzhypnVBBu
	TAh5qxgrAlfVpc6c7tgvldFiKzfHdkiZMndjz3ntDlPXhy/0/jt4V44KuLcdWTgA
	M5kdBuEmgXKRPpVKI/XzJb8vYxuMXun2s4dqWBi4mjqJJ701amIeKNxLe4+PXAo6
	/uT6JGJ3lRED9yFPqCvXgrut7HFoKMfxWLTCejEaSrUkVORmDSGvhQoCjg/0RRDg
	Xgl77g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn13gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:08:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1315430685a.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790755702; x=1791360502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mERjziZP9prCoKtq1eMN8rj15+xaQ2Rdsci+eQDqeBw=;
        b=WH/ZXI4qhpysNP97auNKFjrwOypZaQoJgwyLRN7Ru1w9VyPXe9cNxl8Y5KIoGlc4GZ
         XtTOqiCkDVh9pD2zdIRiqY2nCvm6mRBlh+kCOutCGaCTbh0VtqCPxmNPs/DL9iDwI83S
         g5eGjpxa+P0G19cVV4cWuOyiUefVqGNmKVkyRwZV6oJSh4FUUjdzWzrtzEliSk4E3RSs
         k1SC1Vdhbtt1M29K1AA6SEAgJyWiGS4AzuW11GXM9QARp/aub62qEmd7TSFNL4wMLOJi
         x2y6PXpFcc5AsHKFLhwTUBE8R82YK/4K+ut48l9oDDzwq5oI3bD0V2xTMIkquQHyxgTz
         Y1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755702; x=1791360502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mERjziZP9prCoKtq1eMN8rj15+xaQ2Rdsci+eQDqeBw=;
        b=ZX1HeNdtOp4kFVpmxn90aUqREWdjgLp+yMC5c2oUbLkWnw3U+Xc956p3FMu+vVWW22
         rlobtTj2rMlLWdjpRD7reLLohkbKvT90iT5AU7FG+pMSIsVA0nRZpqENaMTtoOdkhch/
         b2krcZLWRm6l+4kWKBp/eoi0qfBHujphTeK2psk2EP1osdtRrPeo/deJ7jCe8oyQiGUS
         ht4n9WGzW2cpbutjHaNYSznhLYcf+By3kWbo3RmkXkiuiyLwKswfY0nHn2jPE9zEQH9p
         VssDMzhakAGHloZ3BEPbR2WYeayhPIBfXCK0qmDMNsf/A9Qz798YDE+T5TbYs28bJJre
         0+QQ==
X-Gm-Message-State: AFuF++lKtkRvnLsXqURf+uO0ISkac9BEM+9ruo8zbFXOObx4hkF3isfi
	QSI/rCDY1bxaLAyeQJRV1QjcU3ZKvzk17TCnOxzCjw2a5wuRvlkvqXdTBkKrgkavPcKIGG2B57L
	I8ooXenqhm2+/XS1xPtoUwKc9jmb8w8Hw0LixWUWeaQwyd8Sq6C7r+9dzfIXlxIpFFA==
X-Gm-Gg: AYBFou0IFAQdZmbo756Ydk37gz4tN0KfqiN6yKXwBnEtSnpV4Fp0LcVEc6qLBlQMWJY
	t16QdWJPSNaT+atXg3IpFCzY0euFd8MCnqavyvTQvBj2l4JOKh+7nOQViXW8SUdqO9C4Qookk6M
	dkr2K7zTRayNvf5y6N/qVHglZ5Qv/G+xB+A6c7znlXXQx1ky7SpeqA2sgFDHroKh6Xk1zePUD+b
	5c4bewPK5v8pa4sHRHX/sPsw61/64G8b6NpDdm7JeHSSunBKIjV3rVd8W/kt85000DYG/RjPphf
	MZv9kUt/OMkJKRh/Wi8nyFOTvUYcwKzLUOzPVcbUzkoWKNre0xcLSmisot8GQFUfI+M+ycJexlf
	fVFXpRDBBV7bdgK0hm7Z/eLFi7yiWEeMfXQUrHUL5ibwybm0/62EJqlcaDdU81b3PjSzr
X-Received: by 2002:a05:620a:470e:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93cac149674mr42271485a.32.1790755701956;
        Wed, 30 Sep 2026 01:08:21 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93cac149674mr42268585a.32.1790755701432;
        Wed, 30 Sep 2026 01:08:21 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca833347csm62238585a.43.2026.09.30.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:08:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:08:05 +0800
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-sk5jn5-v6-1-517c9b34008a@oss.qualcomm.com>
References: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
In-Reply-To: <20260930-sk5jn5-v6-0-517c9b34008a@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790755692; l=4575;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EPKvKkROJPEyEuRE/ipg5dktsURogb/Hz9TNKB/MyKk=;
 b=BbzvUyAR11+IMuu6/wLp82hfCQXQvRxyKcwOWsS661vqeCmhEncrO6xNPbNNKRbIajJCTHH5a
 xzcy4aIgiIKCDpult+2difzNhCGpkHMYzYoZFnCZfNmtHthJcZCBM0Q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcc377 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=xYdTjhl2YIFMzPZYPIkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-ORIG-GUID: Irvto3zAI0AL5UjB6PpIKJvu1gk8ilxU
X-Proofpoint-GUID: Irvto3zAI0AL5UjB6PpIKJvu1gk8ilxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfX7d7kslQtUEBV
 q7bCC7ZyU36tYXK6cEorKmn8NsIndN8eHU1tck+25ZryU0sl0rNVY8IE6cB+XEPL2OCR6OMxuFM
 dSr2XewMyQWIc8vmBZz3aACRcZNJSPldenPV3FUcowX6dMqC6yAgSAbE8IAFo0uCti/QpO82I9i
 bix7HJI16AbiCQn+52IG+m1l0wMm3jODMSzipsZUCmxrA4UewoCuWIryQsX9ankXsHAHdo5wU/x
 hinV4MFzsxqlrsjGBGUmzRypkMfxQO3F+S3CmxV/L+5Gh9IAqJwQCzuL7kcyCtrfJj2NL86w7rU
 SuzLo+KLoWPtXnd1CXLjEPZQOgsvswUAYgRclC62ooylvZ4RAVUiSUmlmUZXnteY/mIkx8CjDOF
 wFVfh+NmIq7fkh7qliDhXTv16wZ8GY35bB3lXsQB763JlZFCdi87pIXxRKNM+SNdw8TG3bPVMtF
 MRsEBTTquNJZqvnD0Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzMiBTYWx0ZWRfXz+Bpi4ztBUQP
 nS6mjSR2P+fkA5TXexdwtvmaQjiSXQkhMeoT1fUDvgwPvHsDGjro4g0OeuKMyVwVvTI/GkxP1fX
 ZLCDteBaUHB7uKa7QTD3N3RDWulMZ7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300032

Add device tree bindings for the Samsung S5KJN5, a 50 MP 10-bit RAW
MIPI CSI-2 image sensor controlled over CCI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/samsung,s5kjn5.yaml         | 117 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fedb274679cd125483961fee7ac922f2c5efa755
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KJN5 Image Sensor
+
+description:
+  Samsung S5KJN5 is a 50MP 10-bit RAW MIPI CSI-2 image sensor.
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
+    description:
+      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2 volt
+      I/O operation.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.0 volts.
+
+  vddm-supply:
+    description: MIPI voltage supply, 1.0 volts.
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.2 volts.
+
+  vddio1p2-supply:
+    description:
+      1.2 volt I/O voltage supply (VDDIO12). Required only for 1.2 volt I/O
+      operation.
+
+  afvdd-supply:
+    description: Autofocus actuator voltage supply, 2.8-3.0 volts.
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
+              vddio-supply = <&vreg_1p8>;
+              vddd-supply = <&vreg_1p0>;
+              vddm-supply = <&vreg_1p0>;
+              vdda-supply = <&vreg_2p2>;
+              vddio1p2-supply = <&vreg_1p2>;
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
index 2d137a3399408c53a9285686c24f42580292a9ea..7b8538078c7010b1fb8a77dff906cf9bd4bf0642 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24772,6 +24772,12 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 F:	drivers/media/i2c/s5kjn1.c
 
+SAMSUNG S5KJN5 CAMERA DRIVER
+M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
+
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>

-- 
2.34.1

