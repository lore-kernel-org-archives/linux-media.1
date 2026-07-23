Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C9F3515E1
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781887; cv=none; b=qttmYL7ObyRXuz2380y/McAHjiWR2WX4liFb6GWTfxI9YqsE4ymRofp58v9XJT18Sj24LheA3ChOkr6aIMbICFnq6gkCLvX9HsUUV4dSUsg1nda6/1DLYCKMbwGcveH1jkae64pc3xXuSIUMt/d90snCK4XMMEq9sI3b/wInM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781887; c=relaxed/simple;
	bh=fvp+ta5kyo9P1ISBE724MVFIdf/YdhpsBaN9p/esYwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3aXXb3R0cU+ENCOoUSrD6fe/HiMxMbWNOnweFYxNTDufKsceiJXyZG/uNM5dRuz5vGm+xcVgz5H1w9+g9iYDIS6135YzyB2ULDmXcDi61iQBwCa5F7v0FB6U9StAwvazvysanW10RhAVJNISXNASYrRhZGAQVIXckF/GVBJG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsniN3EX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLlM3YBH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsniN3EX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLlM3YBH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X9P12264585
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=; b=gsniN3EXpXixFTom
	iuTVT4ew1b2CajxKkSUbAuahpegxuzwUMx5hvg2VO7x16+bx/R3feX7AeBcdLyLC
	oheTqkVwiotWCsTc7nrw5357q2PbZ2IoG/X8JBhPiDErXKXOgTcXL1NujV8Wcn/O
	nNyqjPoAAs+073/pkQbtqYvPDlR9ClqOQd/rybN3PIqDRsku3uUlCqWp3e58VNgD
	hlrUDYAuKY78L7QJp0ZPvIh+h+USUuH6NfSQFRex7sQJXjdrVxpbZqdf4Gzr/4i7
	oGFKTzq24xvJ15Q+yEicDgtuL4XTEgX9gCMtNBaS1fEoZg2jSRz1rln4dbFte4Jo
	aCw9YA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2vhjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso487738b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781871; x=1785386671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=;
        b=NLlM3YBHkApHPQiUKAxr8nGSUybCJDi2FdSNRkRUe8bs82IIAmi24iDzpf8gxXJHjU
         fOee8l15Q4DKTzcbOWBipEh+Ji7XaK0WsFaj7GPOXBclGhstQD/cOScEyoWD8QAncTRr
         FcDaEZCDq9SfMEFiaum2ligi7XoK4AppsZoJCfpKz4HlCdy0kWUlD/ooACGqsABtjyFR
         m2Jw1nc+BwW0/XPGT3ndOlXUN1VgSwWscQthiFtMReOxXnUtOBIbNyXP62mYPwlcsNOM
         3PjRgQ9DEtIB2dOjNgcD8bPA8VGgW1Hv5LJx4nFjUfqg16mcCuGlAuSKmL07aKF4sgpS
         by0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781871; x=1785386671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+zagSHROFEodx+Lk0GjyCrhmWq2ocvbAsIK+kpUx1s=;
        b=XoyuJ/iETVznQNgZSC8bNQcocRxZOf+M/bq2VjPapLnX0bU3DddIsBSwSx136WYaHV
         c1t51cIw8OHttzz6JeeTaYyMZA/QLYmZUmPGAkd1tJ6RvwGAa9wmNCw7aYA1xAavrQ2Y
         qb+QEWWUAwcZtO0TJXpRYqtU7ZseyMQ90DnjLyKtITIrgT83TEs9+IK+q7aC2rfZdRhR
         WQJHoa0pb3rwmnh74E26S/yvQ1siMbSvHZlNYnFDINKnY3EV51ZvtdQiDVxrVRIvtNNP
         Wy9I9eDZwWoi+jmLvb0w1CQPnZkO7CD6rPwetkC9c4lUJCGkFRjb1u5sW6kxtWfZ4i6b
         vMoA==
X-Forwarded-Encrypted: i=1; AHgh+Ros+hq5T/2VeGpRAWm2dOiz/KFIrFBmFpyR3Ueajj0qCc5FBtcF6fCCJQStjaFab3FYj5+wN1r1nkx4rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeNva3QbmmJ/ehLnueAuD+sPX4NUic8gaFYl6A1TpQh1bPEeSa
	EkKYSBnWopJnW4o6HfWyIOUAYAMuPS78WoiWoai8mRkF5rl3vUfFYQTAof4IXSG9ge5sQ9bDHpO
	Jta/Xvfe+Glw94KeW/ITG9mhDWQqqST7Dgaweiag6ZH6I7w1ZT3BeYxKePffWpgX/SQ==
X-Gm-Gg: AR+sD1324yf+YxPeVDS6AvNCnjliisuYpaxiwbyr79p+MPdglYj1EJjfwE3XTqoKqHI
	WwHZbfiQi1+JwTMi/SvXB+S3OTRUPOBTiPRJOYS9h9p/F2WgAKjAeGkIQbcol7CJgRfEUTqnDom
	Ah2eqdAW3e+js+iDlixVbStL3sp/PE6vFOcaJgNiTCE48Bq4s3y5OhJctPr0p6bIQTuVlsfrXht
	5TGZScGi3BjMnMjy8sK/ntCRR736BMi0+KYSwI10kHWAmzLjWiEmZV9ovyBqo7rByZtwSLAIzsM
	sGF+Eq4WI8LBxUDMHHdu1bTp4LXUdKUG1KcG6hooxeuY0hVIMl5Nc/Gy4ApKmAJ0PInw5VfQ6mP
	8czDykv/SIwbdUoWcKnSFnoiwWzm5T/k=
X-Received: by 2002:a05:6a00:4505:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e2bc69e37mr1849206b3a.32.1784781870579;
        Wed, 22 Jul 2026 21:44:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:4505:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e2bc69e37mr1849167b3a.32.1784781870157;
        Wed, 22 Jul 2026 21:44:30 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:29 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:57 +0530
Subject: [PATCH v6 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-3-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=2668;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=fvp+ta5kyo9P1ISBE724MVFIdf/YdhpsBaN9p/esYwU=;
 b=aCFsFVSI+19VMBFO+CGAO6movLwyzk2+QHAfc13mdaxkAdQ3arJ42R1jN5tgn6crl6pwlEWUa
 0xPgJ779uO+D+oYwRatYhSbhwkpXFQDjQfx1EzVOZzDF7T1179TJlgh
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXxIIB0Z2i9sTg
 TzkiDWcPZnOITipKtk2K5BClymoo4jI0861GVaj/eiFjsgO/j8eWNoTM6S1b9Ao0/HOoZP5ro6f
 9hwtfpsEu8tfusJasVDA9c1ob6yqspena8FCeJXOgBX35CcXyOGw0Z6yVBs/EqjbkmJs8piBkwf
 bxBds/uoKfDlHnjrooYU1zYl+874blyzG+ZVJY+OrU/dPZV8d5YA+LzvyZMyUX+7G1sKQcpuqFk
 C3QffQzCkKadqJhO43werskFCuXy+5sOCQw1PEsgb+bOaW8v4y+xrgBQoK4VP8yzQISsUd5PYfn
 AkSmJ7i5JyQmvcOoshqmCdVinXwYFkyGUCtpaPo8N+Rv4T6BaILuEmfpkDko3dKYfr8IxRPBAnr
 aKr+btQ3qqGOJWYtth4EVMpb9Oq5Nn94W9V62YIhw14Y22w8X4VknyVD5mQgczi5EQKx6rcnkDe
 azQIlbdTOqYk2u0Gyrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXx2gMQm+DxeQO
 7CFQuBKRg5pAwpXAybqYI9Uoi2B76CVHtuh8pBQUK5UUMRuLfcS2gw1DE3Jx45aEfj6wU2i3oVl
 xOWdLNDNxIeZfQFnSyZgUM2G9oR1ea4=
X-Proofpoint-GUID: Fcj8QQKlY7puVHAoMFHSURUJ2syA7bl1
X-Proofpoint-ORIG-GUID: Fcj8QQKlY7puVHAoMFHSURUJ2syA7bl1
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a619c2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f7caee4cffdf72b7e98f5dd33a33419087cb8b57..215ca0743d943dde71045c331f7cef6ee4d9e9d2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -738,6 +770,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		sram@c11e000 {

-- 
2.34.1

