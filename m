Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655960;
	b=P5/8T+n7EeIZtzaYuyktsoJ66vaEX/1+8LBu8vqXKM6saql0ocwq76ToZyJkK58JjcFz
	 r2lstRICjfPXKvGFNTWdHCGMntdXE4NTFMyd8ZSG4zMQle6nzbbc/gciqps4MebaN8SfG
	 IE7ROoKvcDaKoDgShKYlwk5KSt68cQwVtXbCcone8mJnA9qepHJrGMfJMYAJbiXQSKYkS
	 RBijN5qmC7XLmc6CBBEqaWdgAfb17exL1qlWEv1NjEPYDTNZfvNpdII/sldiFqdy77Wt8
	 WScNlU4a1q/VPv7mRVs8Ubxd0ezNeXFqmySi4yR5A05eKZ/Em8Q2w7OfbkvAu6OGdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=;
	b=n5m9tPmaeO7hU6qdUf1kMDyyjQ3N4YDQeT/opvKGzIbxMD1dTjYjES1I80ATZMRNmXIt
	 mR/sXBlDYZuYdtxDqVmRjNrrYQY0QNhGQ53icb691t1CWCKsnbd/1KSDPm4WrWyaAzJWh
	 lqpyubWkOH2zX011mb7whObqbWT46w0UZRjxy74WUyiBqqgIRrGuabwM7gWeeHuZ4FSDx
	 8IPoiK5zDWwzckzQdBnef2vVyUwC6iiDmizvk90VjXX5r1jYpEVSy87VjSlbUydcc/NXu
	 ZWPirBEWcfH1jvJr5sryZUTGbHQL1SsRhYiBJAPoWymjPoP7/VeKiVAMyBtzq2+ox3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZSxltaM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnIW7VTy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD5606A32E
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FD5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZSxltaM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnIW7VTy
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wBsw2054568
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=; b=fZSxltaMWxOlvyTS
	liBP5q85uM10hLNJeD31jrQCHp6gV1qA/C7DG5cjszv5tzV9pj1Vw8eYOSM5V9TY
	Kv+L2XhXff2mIOWokOSCXvqf6FnQXbQPwOy0h+Gj1u14xGTq+hr5BxHqKUYCptK8
	roYv/rt8Y19/mfYqF6C8oHKmuHFmybj5nyNQGmc8yrZ6d7/8mIE0MXPOs9GA63Q+
	eYt93MUxC/FUe8Yvh8gvaAdfJb98axB4e+EOdJ6+NEaVqNELulsAs5rYpbZNMijS
	3vld7CQQgfmpT1u0MerfOz/LqaQm1nJ/BIm2E8qIXXdDN3xp5GHqSwomAv6a9cMm
	vNF+qg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc8kwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso42522916d6.2
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655958; x=1795260758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=;
        b=VnIW7VTy8SuP+489n9OCLxU6M6zWlpB83C9VFkxadooBtSA/ZBLMPv9ffToo6ELTrD
         4dbmgwUad6RPHQYFqhgNCR90ejWoz337/xPZKYJzulseZrHQBZYGFpK2bPqQERgdWtiY
         2ANhr5CF5qNks/PrbA3C6CVlRdnBwA2U/JodTASFEAcIQjFYohitIC10OSxzEKxuicU5
         HRdz4Klo+QPq5ujgYi5Qr3hzrmF6am9srk7fkaWAoK+M3+B9J+Pntrs/ztP4xcf2Lq7c
         gmx6LzDk8fXpyM6leH5AFzs2pV5s3L/Mj6ioYmOuCuJcUD73vw7RBBGONqrOVP81v8O4
         4UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655958; x=1795260758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZaxRG29RknVY817FNbwaOahUHm9TuG+4UXX0Im9FiI=;
        b=m3R238GUENh/k0RdMfDMnkdsRAUBiMQePlKZQ/mK+YaP9CluIVR0QfVjKuCpw3ls0E
         oonK4vpIX+lsgMpk392kUDaTPqfH1441RzfXt55W1rWTkMLhdQ5mP2ePM45/D85gkWJS
         raCvNdiJt2cj85gXrywfXOgisJB/QOuCHfHxywcrFFHlzOqK52b1PvahnFZE8FogLC8H
         XdA7IVs9gFpK3qCKmiKU49eYUEFlFPy3gPzTZUcrCYKd14njj9J0rJNukKu9Nu3L6QAz
         Fq6gaF9cCrcOabA6lpGgQfhGybbiDHYiKkSHkn6d6x+ff55EDJ8sau8CQAx1Gx57Q8Lu
         Jzyw==
X-Forwarded-Encrypted: i=1; AL+hErHKc2U2KucnVEnIbl6D76sGp0l3tSF5zj6EBsFxMd8uZrCUchQccj6MXCJwOq6sD0s4nGI0rmmV4QS9mQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ftgFvsj2UQpiNmvISDSzJS8Y/NgrrlFxdX8yX19TZQl1TjKIk
	lOBQV1TMkDv7y1L0gthlkU0XNu9cDRzQ11eb3LWNNPqDZN2Rg0Rt916WB1WXLiB6MAXCFBpPetQ
	op4v0Ncera6jSyoHjOetULVVgRDQUyydDA1neeDwODSTj+mHD8V9sNVi0YSDegQoJuehOvY+wAi
	8k
X-Gm-Gg: AYBFou1z/mr/ARgO/4/VNQL2dMIUpDd0MEkvbCO31AGTkCxoOt9VfLAX5s5fgEix8As
	d0X29N5HYLvJfVe2rl5nrUJCMsldG9rW+MX/1jpU4TUhebru/1F+DenLDaFkxZY9uaEXF8I8IMV
	JLV2CEdYvRwfaMN8W+RKgppv+5C9AdLQajF/ZRfyRKqn1F5VYzh62hviynzgk1A7u3VtC1yGkf6
	ye8jfgHhayg4+AdFDkKBYqqJWqNvUPxK7JFzwm3LJTt/SMalyfnr4ZlxdxOulRuq/XOdWHD/4mU
	FIe0PD5UwI7AF0xVWY5v/zXiGxwyLvnirh2k3rW1XmlR+gwu8injjlI0pCswYASOYqIDvAm2nDp
	MTHQwEp3GVM0Wr1wo1gNj1qiPp/hFd2ZZW+sbKBDXPfSMY/Z2lLwGjFkLliZ/Giu82tpcqa1K5P
	l4icA+xHahjSmL9+jjIWb00e0ULWZM+3BLdpKOs3KW
X-Received: by 2002:a05:6214:2469:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-91f24110424mr82261076d6.15.1794655958462;
        Sat, 14 Nov 2026 03:32:38 -0800 (PST)
X-Received: by 2002:a05:6214:2469:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-91f24110424mr82260566d6.15.1794655957882;
        Sat, 14 Nov 2026 03:32:37 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:37 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:36 +0800
Subject: [PATCH v7 19/23] arm64: dts: qcom: eliza: Add CCI definitions
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-19-8ff2a11835f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=5423;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2F/1hz8EqW+dxa4z4ZGC8nIylMjGJ1qkPeQTQ26Wm2M=;
 b=o44pkLOF5gJic5FJlKeOE7d0Xu1/qC2Eksnos8KlJAINoSwL56OWNSnoCDj5/eeRt8XOgZh1/
 VnJ3UIBkC/vCbE6nJuuvnCfjTrDsVbM5vQcRwyMQo10T29oovCpSDfl
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX2FwzsJGdqMtf
 glexr0jj3yVNDACSu1SZZpUet4XB5v5uzmdJJP+b6Yeh89KuZ+2h1SDU3/k9BS/HpTCLGz5iYVX
 tsGJW9pv7cFz4fiCtuXxetvMqDwIl6c=
X-Proofpoint-ORIG-GUID: HB7KOIs9qGWyVMGIR25RIm0Ul5Mhg2_L
X-Proofpoint-GUID: HB7KOIs9qGWyVMGIR25RIm0Ul5Mhg2_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX3U5HHmH8gRBS
 mhKMhsYNtp5hxQUNzkeITi+4jGMKxax27nXPKK+Pr8o6STYRD3dlvAJFtW8cSu72JZfd5xC5Cy3
 rlIgiooBrKfnV7kM4T4MHerFPO5RysKV5Jn05b2wUmDkgri3uH73WIwXHqkXLcFrJtoSjCEnyoF
 nkY1cqcPMKtrGacQ4ijScImI2thREiYw3qdHDQ+ItDSHA56VqZ0KAgce1QNcBBDSf0KYKzt9MV4
 UpbJiDUSe+rQKalK05jENYi5MOwIH1onbFXkYQk6BhhTYYoKLkvi+gr6DYk/AjSyVLEEWhwL7/a
 qDyp37UlT6WN3ydc1ihA10397pE0CHcU7d/G5SxUkfCvLbJLAqU1LJfN10xgp3aGwDsDMes8COh
 d7ODALuCTORw24VZM3IUnSB8UVKDGB8Ton368ejOMsW/aSFVMxYKUnHXNEN02p6od/2Zp+ti06u
 fHY0+nIAxSzqfZM6qEw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af846d7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hcSdZqVZxIdZ69JYko0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Eliza has two Camera Control Interface (CCI) controllers, each with two
I2C hosts. Add the CCI nodes and their pinctrl states. The nodes are
left disabled; boards enable the CCI instances their camera sensors are
attached to.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 188 ++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index dd21cc4d267787db3d8741f8a8970629bd20d0c4..0b759bf5b91e412743c12982b79ab4506b9a50b9 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3592,6 +3592,66 @@ camss_csiphy3_in_port: port@3 {
 			};
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,eliza-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,eliza-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@ada9000 {
 			compatible = "qcom,eliza-csi2-phy", "qcom,x1e80100-csi2-phy";
 			reg = <0x0 0x0ada9000 0x0 0x2000>;
@@ -3953,6 +4013,134 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio70";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio71";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio70";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio71";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio72";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio73";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio72";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio73";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio74";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio75";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio74";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio75";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio76";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio77";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio76";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio77";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			pcie0_default_state: pcie0-default-state {
 				perst-pins {
 					pins = "gpio78";

-- 
2.34.1

