Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFF3D967F
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886671; cv=none; b=WKWBIRPJkNgJQqKD1+lf6ImWxafT0TG1qcuP/eo+bLfGdrN8AO3BsX4+Cvi7ceTk+s4I7gzu456U7tSqq9Z7yF+MaIaKca6UujxnGSiqlwXzVx9UwspJXPGW4281Y9CibgBh0J8Dvhkw+JoJXDxDfHabDQKbqfSodEp6V7WG1Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886671; c=relaxed/simple;
	bh=ew0lX2oiOSKfF7cXtcS1yUwMJ0AZShLWP8rJd/aSavw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=piPCs2+e5Q0Vgbet58SpgyFAoC7mWkCOlchTaiaOP1hvNFGSoNNCyoHqafSiETDOr4oW1JMiVYRThUg2aDcDINad6u+T7wdXMyjBVKBZe1Ia8MtnRqPSJvxQWOeCfDWTPnraTVXc55crMRHcq1tSeBsTlk/cZTWQR/+rGtOML7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrA2WPQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPET7SRw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrA2WPQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPET7SRw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4stvt1897960
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJhBfGCQfP8QCMc0mQ3bJOYgtWCHYxQ8pJI/2OH4dIk=; b=VrA2WPQkyUI2ivdk
	3KLHdc1qH8FSE34UutkfqQLnvwxixq/YVo2uXOzcVHD+W/ftBLscv1BfC1AXsHLq
	gBKXXbLlPp6tvX0ReC9fpotHrXVzjLrW4COTGJRaSzZ3T5N1h+ws/Vz1YayMaI8z
	OPpwF7gj40uqxJe7bt4/IesP/oIkuAGOrfWoyyYj2wv8ft49zF3my7NIE5XXi7pu
	P05ecWwvupRAhemAqgJgjt92L3P2p1xtfB+711An4F7VnRO7D41kUYzqG30MspMh
	xN+wvVsEsyXK+/79tq58AAiofjPucn2cs6J20GrpwywNzyEjP4eOnArdNmVtCu7+
	fw29Lw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em918p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:51:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so38850785a.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 02:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784886668; x=1785491468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJhBfGCQfP8QCMc0mQ3bJOYgtWCHYxQ8pJI/2OH4dIk=;
        b=LPET7SRw3+0VomIDJVJQQtTZizwDlul8geUWnwbKBBRO9P65j2XjH5pl0rjUsQPP5C
         FKgE25j9dy4dYcS9EokwyuAyqSYofSETSItgpY4CLuzkDbiQTnE7DkspRjDj5vCyBNuR
         I0hPri6HI/Rbe6tpwR2vvG0AdwX5lcQadATYUKNfi74ySKqwOySS8evpPdjy+MxjlX7c
         8eR5+liES28xntk2gGBOIj5nsBhrBbDag0lsXiZAzSwjprFTtkiblf168IRHVYN+Msf5
         LAc+loiuIOa/bM7iVJIDcmpiR5fJ4OQuBOTR0+ZWwe0o+/+089pW/5WNNpMYk0dM9lwm
         6kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886668; x=1785491468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJhBfGCQfP8QCMc0mQ3bJOYgtWCHYxQ8pJI/2OH4dIk=;
        b=iHQ26ArMzNmqgE3QkrFego159Rmp7iBNYXhqlenv1vZol7dHfUozS/s/9Qs4cUmtDL
         ugCSpyc7/dfPvkfLclus2PDypU0jBtOtToqInJUARxAWb6GO/lbEc3CeSvJLPlrHG7Df
         hGzI/3xKqJPeALv5eBW5AvFMFbGrfDZpZGiuGTkvylohYCgwrmvfYbbCqBB2bQMO/ayL
         odheKAC570ge4OZiR/bK7LPn7wrGibCzQZaethbcRF3Khui8lvvUhucDUGdQAdrbPVVq
         Ia8hVfRZx0PSovIB20CWs3kWTzy3sVTh1B0lM+URbzig8ePbve4PC88nhize4NU9ExSz
         c5Qw==
X-Gm-Message-State: AOJu0YwFUfxzOTVLxrWjhuUOTXe5Usd/4qGBe+UJ9CQFbCnp8P2tEBaK
	oIqk1ur1fzctxh1qkih+rDvZT2KDLttNn7bTuhZ4gs7K2sjhp1M1VYlInmpxIoG49lZGKKeKezv
	J5+99D7YsSeEayrw+rHbzhs9swphR+CV16Lb2dN0/dRaxpbJbH26m/465qlLuTa+WQw==
X-Gm-Gg: AR+sD11hv2boQPdQavAS4njhV8cTWSRHoD9KyLaoDoh76vAvwl4INwT2r3ehMYhySSW
	onFHDDSnMa6bJAodKiC5LIkDZAjJLNU1cl3Bvv8WiFi9zwbjsCl2uLMtQu+u/q/uw8+7TYZFb9u
	Xuf4nia6N7TpfVnzAEnYTfwuV6cHzQ94xu9sfXsX9V32AdopIyIJeWUge+OJuaetxDmzE+rLo+9
	8FfWhFj/AGyQ6UfDS43NbNabG3zVf9XWu7clHB9s0OYLyDwDVVK0pLsSh46gIZcU1ox+3nG+hjN
	X7OJbxcGbgfWMjPUNZFpPGfm6K8hspffR847WbWxJONMVXRKuSKpI/cn/M6xhHgsUKPg9a05SwK
	xyZZ8aDPwZxRMP+0Bg4ygW2BsWD9Lc9TRzxDyk1u3qylYAXH0fW392DyQjUXcHXzmhOUc
X-Received: by 2002:a05:620a:7119:b0:92b:6805:918a with SMTP id af79cd13be357-93103b0f48emr651169085a.66.1784886668213;
        Fri, 24 Jul 2026 02:51:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:92b:6805:918a with SMTP id af79cd13be357-93103b0f48emr651166485a.66.1784886667743;
        Fri, 24 Jul 2026 02:51:07 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68a7fffsm620261585a.11.2026.07.24.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:51:07 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:50:37 +0800
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-sk5jn5-v2-1-871d3b9a2e47@oss.qualcomm.com>
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
In-Reply-To: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784886657; l=4471;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ew0lX2oiOSKfF7cXtcS1yUwMJ0AZShLWP8rJd/aSavw=;
 b=HZly//aQpBiv1ixH7Kcqep1SLRwTshlQWSzDLwxI5aWFEhQF6DsBYl5F69btS9EMUQR5+X02I
 gbciP8ZRiduAljkaSfYy6CgWVxBqczljj9XQZb70jEICnrVL7AA5ZfZ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX3n7cvMOgjdfY
 Y31rvKRdOqMg6jiCMzeOJrU1DpRTeDXkJUx933C4HQwUECv0Vvjw9hox6ZAWIePdQtXWwDOYzBq
 uuXKCVMfHSr5N03vs3sZ4PIhmErJ9mQ=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a63358d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=quotk0hs_E-_1z6np2gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-ORIG-GUID: rUsKgiZ0-AtuYy-JERBZ31563q0DqGFq
X-Proofpoint-GUID: rUsKgiZ0-AtuYy-JERBZ31563q0DqGFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4OSBTYWx0ZWRfX3YghW5RTeqvV
 7L+w7k3rDIZx1BfRivrNZw9XeG8wOHWNPOgb7Hn1qkChRTchnjXiZuu8M9CQc5w32efL7ZVkGlo
 RPPTzsABgNM2wurxlo7A1GAwecywVNhHblC57AwjgAvbaUhezJcUWXHHr4IeaEdCAyKS0zQ0VKL
 CM7Uzxted1i46gbRLT2iUFHu0+hzedORtP6m1QrVHtwlZPMfY2kTFOtgH1ho4UZrK/oi+Ozbzcb
 roi1yQkm2qE0d6u8blTFNVydh1Bow6UsmU0TzmifUhMRqavGjcGJIIjpbDmlI4E99a9r6tXVwQH
 CuGm/flvL75IVeYrxSdtyvX41GVT3nMRSoVp4J6Zmp9LJqyRqDsIKd6NoJzabebE3hRqr9xhyxU
 /lCOtvWLJWbkxfvKpXMR9WaWKwZm7PRl5pkgFUKzLKpALJSsl2Q0QAyLLn4DgvAGhxel7YmHI09
 L/OAUbWHn//1RTm7P9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240089

Add device tree bindings for the Samsung S5KJN5, a 50 MP GBRG 10-bit RAW
MIPI CSI-2 image sensor controlled over CCI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/samsung,s5kjn5.yaml         | 113 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9526d2bc5f5be236d7e3d0f1409df2ef991dd0e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
@@ -0,0 +1,113 @@
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
+    description:
+      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2 volt
+      I/O operation.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.0 volts.
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

