Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ADB37BE63
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249332; cv=none; b=Y75fgWjYJ285LnGTXSP7IZJRhQDKl+K3lbSRnI3qeHOAZW9bYlzP8m8FJGrdnYJmdAg9jZPoYYrr6xM53OVoRuGZM+O+u22KUI1oRFJJraYf2gmAYHtQ4xcSRhVJvmCNqFxItKyGSiEc0fkK79uQUxk2dikZmdlYUd46E92443M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249332; c=relaxed/simple;
	bh=c4E2tnVTjiSMvj4149fxPvJZ7wH5JajUkoantzHx2AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijhS0pYTAvOEXMI0kwWkBbFfp/MGYMrmK+xKBKL4NQDIEZzAyktoseqp6khaJ4SfTL1ofgJk7++CsKGIQzVjsWsHdsrPtyj2+pa44E0hcKbzT5CQ5s5RZ/aU9PQPW7gbj67DfTykG8C+GJvTBXprVkixyIt/jqEe09t1O9hGOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLnnwmm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlhdBXpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLnnwmm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlhdBXpI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6817985o1211500
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrjNTbkAdJ4wFIRw31jDeeYpxYPcjkaSLFO1o/BGZKU=; b=dLnnwmm5JK7Ec+Qj
	pBb2snlG+ZpQtFpQo3ytrP0g78DX/L9OL5x7g/4zXDKv2nCY+U8zkxGv6eAWmH9H
	Nbz4roIFcg2cKYm6ZojoVd5R/dLXbJsImCj4/5iqzTHYsi8duyLTd96HyV6s4kZD
	JDZKVqh8aMhS7oZjWZnmYXQ+c144kREGl1cwr9gUBzxdlEl5oPjm4CfB960Z/rMq
	L6fpX8OtGWmO6ThSObTjFwVUITw02kQHPQ2JMTaSArWqmpD2Lim8MqZT4SzZV1j9
	NvyKS82qJofzqnwzZjBQfLwrAV1TMQsvBBdawnEVe6fLscUctMOgmYqBFKOZUAXr
	n6WAbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8sbwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:55:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso123459485a.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249329; x=1788854129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrjNTbkAdJ4wFIRw31jDeeYpxYPcjkaSLFO1o/BGZKU=;
        b=DlhdBXpIwSB0SCEcYhA0yHNsRatpOyuh2JPwkp4dqEP31rtASYVc0tHsi6opLn5TEo
         6xHpi7HRyEoFVfzCd0ZFg2DdJzHNb7Q+XQmLedn3HgFkbtw9ScO3CM9CD5Nhwy7R3tAO
         AYxxRubtY54qfilqJTn6yqV4eXWtTzRvX+zkciI9EzYPuH6XicWHA9rHAl+fUp0BPBdu
         WdUUcExH1LHW+jfDt/y8KH7z1cKa4ygs9Xt78GoAxf4aDIK6w7aIhMrgh52W2i3qRC3g
         WC4V3FIlArUCQ+mtlKWnTeGHt1T2MR3Jn7oR9p8zEUw7i6haE9QQDPBb5+j3vnGZzqNq
         ZGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249329; x=1788854129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrjNTbkAdJ4wFIRw31jDeeYpxYPcjkaSLFO1o/BGZKU=;
        b=r6sqcZXk0j9FxUCU+TOyERzDwdah0fCbSpfi9pMnlut7yRIir4g2veP/IEgr8a/+Hm
         OGK6tvR9BYE/JsMF7/nmPevmD7PaWfxFKfBAoMuoLukkV47sQu65W1/1FfqAJatSt1Qq
         gUwOZaftOKvGSotHHE8BIGBE07GTqSzNRxkZkzH10HHml/To2eLZuT5j7GKIDz/BqwW3
         28HWonxQSIdV8cnMoqvyGbi7lWhs42H46fU49dmiFQ8VBCgjD3a0VdKUd8jvRs11OJAD
         Zo3WMdXIM+a2mPW5+tn2Qx32CE9uHDjyE1+SoYl2AzBoeJH9KtRtS0cz98CXhkZe+deZ
         9c5w==
X-Gm-Message-State: AFuF++k+IhgvnqHm1lh2MUM/c/qCgMJQo5r4Ozjk29FKGibyeG6JvKE0
	6qlJ/7pY9aTc7TVOkwP2CGeYAyQ9V/vW9JVOcYrY3G1hoAhuOJlvEMz9EczHV94ZGwUNjvggB41
	VqsCIAmOb7j5nflco50i+AKriao/kpoGtt94sEkeKjpvHrXdVb/IPuDlg/l6jYQSzFueR0gNrjw
	r5
X-Gm-Gg: AR+sD13r2mw5NV4rMw2UomZ9gWL4JAkMLtgLGVJ4bTB993cDbPldGkLF36mjiHcvGNI
	JdSFnmxfmnalR5criZHoJJ0+vNdToDFQ4uyV1fdOcpEEBcSHSJg6pndQMpEWY7OI0/CGMtbYKjF
	s/edCyA3nVqnQfzUBdC6mIHha4EAzurKgTs1q4bHLHniyYPpu81SQ/y+bihUL9NAhraprgqNuEr
	0+fwqilNf3AiMxJ7VgxSoLMlhT7kc4xTb4NfSiSMaBanQtVVAdL8SS4UNgQWFnKfStkbDntCzvf
	bPH938v05ivy7JJHyzcCkj4gjUq6G5hYizCRJ9J+FWXbLxyIdiggcpE6UrwD91NxDOAbzHiX8D2
	Rg7vktMlzCtOu7vgqiNivNtkh0m7y3EdqOZL0+e/qep6KkXruhxdVp2GWM3MeKsWH6gsQ
X-Received: by 2002:a05:620a:199d:b0:939:79c:1104 with SMTP id af79cd13be357-9394bc108bbmr400989885a.10.1788249329219;
        Tue, 01 Sep 2026 00:55:29 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:939:79c:1104 with SMTP id af79cd13be357-9394bc108bbmr400982085a.10.1788249327894;
        Tue, 01 Sep 2026 00:55:27 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391742780fsm970228785a.47.2026.09.01.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:26 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:53:46 +0800
Subject: [PATCH RESEND v3 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5
 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-sk5jn5-v3-1-17e728917bd4@oss.qualcomm.com>
References: <20260901-sk5jn5-v3-0-17e728917bd4@oss.qualcomm.com>
In-Reply-To: <20260901-sk5jn5-v3-0-17e728917bd4@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788249318; l=4575;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=c4E2tnVTjiSMvj4149fxPvJZ7wH5JajUkoantzHx2AE=;
 b=t1iF7dbffOUCFV+duSRnWDFlVjVNm6fOk82mvMAUYit+7aF4zn5bOogRCa10PQ4zUME397CsQ
 lTPpqfFt0nUAr+9wHJl4lwZpwBLHumPM5Sc8FX5/IvNH/Z0VQY1CSGw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a9684f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=xYdTjhl2YIFMzPZYPIkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX889+HlpF8sau
 m6ECXVlGrg8z349aJFxie3ecOjzNCzaLqbBEAHaqLwiH9+0fnVJmo+YAErkSXtXl1dtsT24AAgy
 1tfz7OpAwDGyeSWHKXLM/+beab2niUDzNiA3HkqKJIB0H122PMube1c2Q7i6b7s18+yUn4eqm8F
 TAuyTccvb5srDNc+6b+4e69sWqacZ989pBPMlcvwjzevM3vyT39Mhv6UCtFaAI0Ay14yKTZJwJi
 dy8uT2isUVFEGaP63mI2uYD/MRasVVSHTDdDsdKEN3XB1JL7VTozBaz9rhrBAgGjGtyBa1jhtp6
 0WkkCMNVFswmUZm2VIwIV7sf2eMN/P6cXmLStJ6sJ2Z4pDTEcJCxOp1pLGvGaSpcseO5f7mp4U8
 8+EvXqXWJJb+wF98XBlG2viS/7z7UdEsDoA/91Hz1BclSzCDSci3hhhj23zCpAA+LB8ZteH8B+j
 TztjR55Nrw7cJwwjQ/Q==
X-Proofpoint-ORIG-GUID: 51hNn42yWVwRDIVZQ24nl8zzOAewvCIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX+o7FCACCBKS+
 Zs1WsaxhJmOYtRRVsuGpwTK7cbXuIILfu7Q7RnmTdLyIe/X2y/n5TBHHO+FiN3+48ndYuWD5r1X
 f4C6kL3crPSTpWma6LOwN5+7K/HiFj0=
X-Proofpoint-GUID: 51hNn42yWVwRDIVZQ24nl8zzOAewvCIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010069

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
index 3af0fe95a92fc21c60819b892142380fad2ebd4e..244c7ed5872aa0972a7b055d7e0b19d530820a08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24190,6 +24190,12 @@ T:	git git://linuxtv.org/media_tree.git
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

