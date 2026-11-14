Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655987;
	b=TbR4GIqF7RRyCcW/Hk0t7An6Atvx/2AOOPndvuTHglqFlFt1EWXlLtE69gSdBud6QAau
	 jEDgynETZ0ssgJDLtUIVmNrXK5YaWodRmktiQnPVVSCNU/zkWZFss3PIHSikgo/dmL0Uu
	 NMM5NQYhTPbgYEx7+H6doUtFN+pFwYGapF7ZlIaPuXwsdF0eJE5BajtQ5ps+6CEjqJZ9+
	 nNxkQ3DpsaAnK+aMmtEqC+BECfYmjtpgLwV+gTWOFXZpShNcCals3QeDR+m9mz2xWUbvA
	 nAdOvKZ91GCc5bc/dj8ITCGFC5jPX9hikDLfFR8s0ZhgMkpRqKW8yvXajQWlXbmQYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655987;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YL2RS/EwYR3+hEcQENBxnWZjthmJZRl0ABwUqhJFCt8=;
	b=f6Nrnipir/ssW+h6D5V61QqCr8pIHFbaDQvhMHrlvk+fux8GDhPZmnBH41/TG34U11sp
	 4aKTUo58v4W4rcNqm+U6VytRlanpG1jOBvtHjTNEh2TIOQyjKbYE5TRbpOtcpSmQAWKIO
	 8IYl2OHozXA+Gzv40hESbv7xZ37XTsHRPb+4vbpuQ0/oWoupH29eK2EpRtm/MjtfDHNaz
	 DB4M8yvaRvDTAigJPz/Ja2B0EU/D0BvahmtaM7KYlZlYI7viarQ96JAVKdsKYZHRstT7h
	 f4zOM/dGs+Rf0tkOPYzVrPzqn7i9zjc8piSGCVn3fsEcaq/NiA7qAmMAiOTsVIDr85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TiRrdehl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AzrKbtcj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8105606A334
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8105606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TiRrdehl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AzrKbtcj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wl04174829
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YL2RS/EwYR3+hEcQENBxnWZjthmJZRl0ABwUqhJFCt8=; b=TiRrdehl1Ylx9RcY
	6YIFYoGiEW2QVqG7BnkgFMNM9oJhm3vVlx8qvrgH15tRMURS6lbT6c3X3eukLsbu
	2BzvbzThDkxg5/tzX3NjvsmqtUtabJON9Ipl48fN9ltuNMogfZEhEJAVlsJUGyXu
	5rkTWZMc6XSHxqNrOkfJ0NwshHLOKq+Qkqoa+oRoRPp5czOhK5c0niHWflDvgcSt
	ibr84UDz4qiTHiFzeUYrB2yLONDQHbbyA8wBW9pASQKl+g46bZ+NjnUjYvZzikEn
	YcoUkfVc8d8VceZ+su2Qf2wybFTpSL3PcBFPzezUe1I6EydVKfKs4b1R2Isn3hGc
	ozUoHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmagkps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:33:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eb3a63064so41088416d6.0
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655984; x=1795260784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YL2RS/EwYR3+hEcQENBxnWZjthmJZRl0ABwUqhJFCt8=;
        b=AzrKbtcjNI63iAsiJhoNXQwdAFdQt4FqV3RhcnaiMy7FZmAEqq19p/CsfSEobaQbux
         mG5tbo1eGZsLE09zf69XzDqT0U1xJxFOLV6cGHG2FUuH8GJhnJVW7rGtarwhyF8jb91x
         bQJsblUIZxrTB4jBvABEgex7QXkpcHC/3OelI4XPlD+frFCA5sAsBTkUX8+30py6Ssma
         sVJQgjR8o8kuClYYA80+59RAlDmiwcjjW1AanB//dVeBecKgtv3tH38hlx9LlolpSKD/
         FQC0Yj0AS1USt1SmSXdavfr5bKQ3sf/ypUbQXi/yqHieh/a3i9Jg29dxNDtTznySVqy+
         hzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655984; x=1795260784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YL2RS/EwYR3+hEcQENBxnWZjthmJZRl0ABwUqhJFCt8=;
        b=qB+ZIM7p1OHo4+W2TyjS378iYtPe2ylgOWzynnCbVigKSoIs7CVyntT0jarzRpL6W1
         ObNZmK9coHokWo7kLn+Ey6FVx0RN4VTRj9z7YGijD5h9ffn2vCs/xhCKseR0qCtvtL8t
         XvV+Kl5AoGXmwME8aRNg8Xa32E/TQJtxgACBFve2MluI5Q6L8gQcxOf0YT6ky+f6Bs/V
         Gpd7TBebO5Lf+8yY743XzUopemgOxzc1ENQMghHRcVd0Iaytgwyp8uVDQ993mayClGaw
         0Y6muPMbJFWXVNBljH4LyGIB/z9pCHOg2zEXFMbak68J3yCzMG9Vha4qbhMGaXHOVY48
         6kXg==
X-Forwarded-Encrypted: i=1; AL+hErFg29+rjXGM6K7pezzDsayfG4CSa8NhEUaWv616F4mgtNijn+AkC835rt9QUxFoQlvsYPdQSJ4Fo9A+Vg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZD2GYB3qi5vSI3LEcruJbi1KnT3qw4URL8CESgzPTyCSD3lsD
	yPfBnUG0hZy64DsbHMoVvOFoCnmsxHi6z7vy0dnMRNMQIgnKg9+1jUzLQwDpg7kf+O6fmiXbGzl
	ZVnIlocSRqD95Md5B6Y27DyVzMPd311fan3uHuwS1TBov3hM1f9HGjiKmZjiZM4VUOA==
X-Gm-Gg: AYBFou2GVyM/wZW43dx0lCGWH5SgBozTHn2rRyl8TFQzH00QYeD/Vq/JN+028o+gS64
	8NmM/v4/rkVTDqvRlFoLX5JeDHLD+YgG18Y/nb1YgWl1QLmKfzXjNVsaF0MXYeI71vjCB47KVxS
	2VYDW6sqCHzEorWEwUxfCouZQk9/JzZ5oq8tXTSyqGlSboH5MgGuZsL1ROPjCdDCTg6KZQPcRDm
	ncs/pEXAFwmBTQ2B4Hcg0SW4L99c6I0jn34oLhqMqw/loEoy2CR8y6gwVgizGRyaIjXCX6MlFMU
	kK1g1ZQ9iB1J66yhRikeit73+jmxaQ5Edwv0pS3y3uvjIqvq7h+SZvOw5UyDwEGbH9k4/dQJG98
	Bt/8b/+nE3NezPnXthh73rshB7EGe2LbADz8TgnMUi9ZmC7igRhYrE9fXyCQ3Rr/Et95XBWpiiQ
	2v/VeM4ZV87Zm2TzKgVfkJe8FqUtIIbWFIFKRcgJX1
X-Received: by 2002:a05:6214:840d:b0:91f:3063:6b2f with SMTP id 6a1803df08f44-91f30636b51mr36968546d6.17.1794655984176;
        Sat, 14 Nov 2026 03:33:04 -0800 (PST)
X-Received: by 2002:a05:6214:840d:b0:91f:3063:6b2f with SMTP id 6a1803df08f44-91f30636b51mr36968476d6.17.1794655983761;
        Sat, 14 Nov 2026 03:33:03 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:33:03 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:39 +0800
Subject: [PATCH v7 22/23] arm64: dts: qcom: eliza-mtp: Enable rear camera
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-22-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=2795;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PKU2g+Gn2vrHlq+OzzzbhEEMcvvxoyv/Dn/4YmbMkgI=;
 b=2qvCfPYV852R9Ur2umoTPGPZuJY4yAANvplFo8GtuVfDjHfTDbxh2tPABEDx/HzDAJfOd8fSU
 MGwAXRdCf7yCYhfMK3HpmRDfYxqVjRhoA3hSZSB8yJNmnaA8Ej+/Mb3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: M1PqXHxcw6CxHtJ0jVRXGIYpV86JBa-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+rtWI9F4DDbZ
 XMM6MjqcaD6JLbKoo9QN1jc38lw3iHzn4VDOhnmHDltU974B3OwkpNnKuJCe51opT/OaFvk1Yzu
 Vb3rqtPDwpXGoZjvAKVuL/hh2lZyqz/qpOsFVGIdNjpiu052R1kQSZNRq6StuoQ24pA/ricx+O+
 1eeva80GResxVvLfat0bt5G+LOs8PoV2/ED3F7M8rGUOEO6zAw2qcPr5HftEi+b7J39YAINfA7J
 bcCvCC/swPlb7703oDByVKbLrmp09byKLzV5/rfvd16d9Twfyi1Aj92Fd2a2WCJiyDgYQuQYP86
 20MPO0wGWWrvH8ydAFrfu/gdgQj3iJ2A3Le3K70j5Gde15b26SCcs17C8Mbh2VzfmUXlkDRuK9v
 OB2zw7dnDvlV7wJbr+2ynzjCh/4gsjBZ88937cudACX7Z3iHISsIeS36IDPSa6ZMhTaspXPEzy2
 z0d8uwaCWshI2hrYaiA==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af846f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: M1PqXHxcw6CxHtJ0jVRXGIYpV86JBa-y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXxLJBgoFEwuk6
 UHFj6LwZ3GhMlAMiqxO9SESCuBKtAyMu//w/aOloNXk7npk9XnuiXj0a7/hQNLW8Px/d+AEJoyu
 MBZJqh5fbOKHcIQQFRu+1zCkBQhp7g4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Enable the rear camera on the Eliza MTP: a Samsung S5KJN1 on CCI1 I2C
bus 0, connected to CSIPHY2 over four data lanes. The sensor takes MCLK2
at 24 MHz, is powered from the PM8010 regulators added in the previous
patch and is reset through GPIO125.

Also enable CAMSS, CSIPHY2 and CCI1.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 72 ++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index af7450fa2020d29a4ce98eb958dabd0cd8c61860..cd14b44cf0aef33a7939075949916d054cd77659 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
@@ -538,6 +539,70 @@ vreg_l7n: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	camera@56 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x56>;
+
+		reset-gpios = <&tlmm 125 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk2_default &cam2_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		vdda-supply = <&vreg_l4m>;
+		vddd-supply = <&vreg_l2m>;
+		vddio-supply = <&vreg_l5n>;
+
+		port {
+			s5kjn1_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l2b>;
+	vdda-1p2-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn1_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -657,6 +722,13 @@ &tlmm {
 			       <111 2>,  /* WCN UART1 */
 			       <118 1>;  /* NFC Secure I/O */
 
+	cam2_reset_default: cam2-reset-default-state {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	disp0_reset_n_active: disp0-reset-n-active-state {
 		pins = "gpio12";
 		function = "gpio";

-- 
2.34.1

