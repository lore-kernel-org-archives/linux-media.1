Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EC2469832
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582153; cv=none; b=pIFSsiBC+3oPJVCW12fv+JfRdIWzQY8/LRaFTGew4lr7Jt5bRsAoLgpepc6b+Bs5nfz4wcsHhF0H0gPwg826AfCCptVXqObEHVB/SPToy3DFgZNN1Bm7UPIJKuuwk/3EbnrcP88uEpAbvY5mgmXcpZzxE+MRpoBrab5EWp1qxng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582153; c=relaxed/simple;
	bh=tS+FBEWbhgL6Bpg2Xr2ZJDFC+1cBKPpsbwbZCJpkGls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b65veT+Rro1sBJS3BFj8THw1+j7sjDRcNL3SJjRSq4oqXm9+Bf7dNt40RgzL4WutElMEvrxMf/FPyCmjXmcykCQCrsGX+OuxKRJ+mlNY0ivilXYe98umiaOSAqwhJvNiuGeXCJ514RwPmhAzYSEEnCYM7OfZdyTlW7pC+pqIkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pL75KLeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbqH3Oia; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pL75KLeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CbqH3Oia"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLDMBo3208761
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d1a0XiiisasErSQXAgvPOa80F797XYo00E9rVevDiFs=; b=pL75KLeE0fPjpJKp
	j6Brqp9IlgVNrod3jTGHd59Vt6jIhTRq96GY7Rb/TqdWqZGdM84ETeONdGvM0IhS
	9icvPwHnD65FK6FKvoMUQR9tX1a0Px9ABKrlIHIjJ2PCoHihkM5vpXawISK3nExW
	0afXfjCSeLFZTN6Qi+mGcTgeJbewvB5g7sTVz6HIm3Qceos2Gsjm5DD92mCEzEEJ
	AwKY47PCz7ioU95TKnDiOQpIvkFU8zZ29p2pDYqZS8jkIp188CotGUGIdtDHHAi+
	FH6tgsiYpuICDe/K8s3kg/G4/aVIumzlTK/ftPdAUwssmCSsndGlzRrBFz+ZfYpU
	ptJZaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49dkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:55:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso371459185a.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582150; x=1791186950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1a0XiiisasErSQXAgvPOa80F797XYo00E9rVevDiFs=;
        b=CbqH3Oia4CD5aHVCAW+jQDCYUsdHoIKws1dBiWxM+Vdb4Y4bvJ1eGdE4+EgbPLA10v
         W8rczdPlsV8HellOL/1cJ9Tu/AQNEOudt6HNSUOGVPXALLdeBCX1T/33ldIOv3lSYVit
         nsm45HnwFh+mM8UGD7qqUPf6/0gZL4BU4qTIU+jc4RLC/p3gcVW6RMlrjgszgdsA+V68
         aYv+iLskbqDpWUdI325SAWancJODKp9COadeTKlKdzqjQMcWZbQkFF7UPh+vm5QXwPUS
         PSv/YfhVn1SFEtP5uJWA3F5vkAg8nbT+a+yXkUOCvnxxcRQciZySYdiRXS3Z0KylYiAo
         Lw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582150; x=1791186950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1a0XiiisasErSQXAgvPOa80F797XYo00E9rVevDiFs=;
        b=llegHFVEALeqSAm97cZ+Toc1JBdM2BxkllifpW8I7O/8dB4G33XYTa1TSiDwhyM3RB
         phRLQokfo0uorWMhD2P9lSdm8OeYQgXgdTxmm0BR3RdWghNWu8deXzqfnJTfpueavtYt
         ORLdLBjXglUrEU6Xf4Q0c8BF+SAw79gvM30d9Eh0fnMWktYkQuwUV4K1GbonpgztKz3v
         DXTTGTreCGrQEP/I/kzd3WrpMfV2bVxQbdkEpJ6lnRqeSBU7egyUk4F9YWteeKeNJeqz
         JhwOvQTozGLfNsmQtWeTA0Z9A+VJ2uNMw5mKKmijOygFYs4GBCC9lk/bH2oaHvZBkTzF
         G32w==
X-Gm-Message-State: AFuF++llQBESIQKozbeH+VYh0vJLNTmEYVPnDfUBskyBLx+BNSNnDYKG
	hq5U9UjG9+XnW6lQ3UzV3BbUz4lmFcCRcEabl3N2o4Ztv1nq6/Zo3l5l+sFkBiCPKqPLiKY8t2A
	cGiSi+14s01zXvJFHvwjQo8HgKSMXxyThDdESZNq77ZGAXzTI+eUEcVUdjCGibV0SCup2mn6rax
	CT
X-Gm-Gg: AYBFou0gFcCXCGpMdFl4aksxFO8M0Cat/EPrXj+7VxvNTMyreh1Vc51n8q2leRBGtyV
	kwm2u5NI4ZALo0KZMyXV14iw7ys0l1/MViV6qGKj9miLb2U1lepbUauDAy10wuowSJP0XpJbgmL
	B37zVVIiLTtF1RANrKxZETzxY/R67dVS7w1KyHvcRpEgkkCCtq9gft+nqHio62W24pcaPxUrxpF
	IEeLYtrmCZZRRnnVq1bdPOUBjLpTZDErfWD6pLoScodLt0hxXFB1Wkp3REJ17ji11sJ5bvUaDmC
	Y1WceMoOwfmHr/q4wpJJCR01qlIZOsEFGYqCyYoro6q+oGHbfz4Af390KKM/OURw0UlWyq/vhnU
	YEoTkmJPTXqOivvRfNafljrRBe5adGFukxGVltWBEWYash4SkqAlc4X8OCgcj9eBzwxc=
X-Received: by 2002:a05:620a:4150:b0:93b:e08e:ea5a with SMTP id af79cd13be357-93c43cb66ddmr1873016085a.41.1790582149810;
        Mon, 28 Sep 2026 00:55:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:93b:e08e:ea5a with SMTP id af79cd13be357-93c43cb66ddmr1873013085a.41.1790582149267;
        Mon, 28 Sep 2026 00:55:49 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c815a47a6sm87940585a.47.2026.09.28.00.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:55:48 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:55:16 +0800
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-sk5jn5-v5-1-19aa0a0a68eb@oss.qualcomm.com>
References: <20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com>
In-Reply-To: <20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790582140; l=4575;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=tS+FBEWbhgL6Bpg2Xr2ZJDFC+1cBKPpsbwbZCJpkGls=;
 b=Ag18dtfUrcqef8fuUR2X6gOsumEhD23suH2yH5/EbMYC15Gpj1+AqYrZiDIFJ30rwBS9gP9Tc
 osOnxswmGJwDAi1dpJKfmuIjh3dxY5XTQ+mfnluB7imY/3+HfaUpzKL
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: VM1NymLbduPCzT5FrLez_9m6dXRPzac-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfXyiP5hbgYllJJ
 g1oy9m4GLa2TI2lYWdZ/EAZq0FY+xVRNMkXFHsbx8hk/meImMdShPR1eHNrCuCO3JITZ7RTlmer
 7wzWc6/nXbIz7cxMvAXWVCuMHgY0KCt3IR6RzEuCEoogf0G0a0O3S4uoSxZw3w3Q9P+r5f77AF+
 VJphsgCNVv0fbF5ZCXN6oPQoQkdvGQ/2V2ecLdMhEdy0D4flf+5H00uZNNC7sZ/KN9UFJQVdG+W
 kwALHYtS4jzfot89mIC6q+CdqTLSFw2DUhZeaMn7B/nxMNIywbHYnQzMdomSuB5l87tsRiXgBM2
 IZ4yVn3y+BcIZXFH5K2aGcnnlWzXbeZcCH09BjNH2X5bQhS+zX0dY0kYjzM1ChxKrlP5yd4rs2f
 DhlKhMVX+ZcutxZdRGrRMBssvckWcP6e4c8AphxdY+d5k53+gJNKLBWlh9bpnc6PsCwa/o/0n8x
 nY+zwZr0ojefRjOMqOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfXyTd8cdZPLix+
 s1G9VwpTQV8EHakwPAt7S+pbj1zg+2HrNote6UH+ruywm7QW5KrRYUoMIhybI1muompN/juaY5W
 EXqHC49WiCUbmt6kPOrtKmVUI8DOkfo=
X-Proofpoint-ORIG-GUID: VM1NymLbduPCzT5FrLez_9m6dXRPzac-
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba1d86 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=xYdTjhl2YIFMzPZYPIkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280031

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
index 70a11f2ff61dc3ff6abd88eda07e53661262346b..8e9c847071153c842be841f32bcaabecbc86a763 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24730,6 +24730,12 @@ T:	git git://linuxtv.org/media_tree.git
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

