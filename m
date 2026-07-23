Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A838F646
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781906; cv=none; b=Pn3rDc7x6H1LzOnmHz0dkNLh8SvezmtrjLq624zKP1pWlb1OgXY48J9mtQlQnYfZY52Khtv1qKe7XTo3RKKbGfFPx5MrBJr1REpNYcxLrps37sOJA6WEQiueU6Hrtep711Thgil5O3au2HPSQVqk02BaP3V+UaSRtEStFQ37vr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781906; c=relaxed/simple;
	bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9jyz2n/sUiqPevMu/9WBH3njGhva2YamuGyJixbelB3PR0z+ddHze+JHQVuYY2NNO867Sgxm5uf87mGe+Bqa8TMkk1t1H0ZkTinWX5gO19Nv/Qbj4KJ9uKdAzvmQsRsEg7eOc1ZDYNPTH9a76PZ0xFDz5s2CZYE2xENSZPJj6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBNC1nRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caspcI2s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBNC1nRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caspcI2s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X4x22398735
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=; b=TBNC1nROiCH80PBP
	dKH1XXCDWeEj5ck3aIfOAEDUXyQW4A3eLzei8UeMNORT36rgJTyig4ioAuOJIasp
	wUlY4byea5Sg/Q0mh8BvnEYua5a+8JGGKHJLqZ0Ne039qluXAElKRUMe+5CCxdsj
	r2TbShV9m5cIKFAH0nGV+w0K3AErPxkGuaSRfOrTmBe88y2aqZc/Do2s+RIn4rec
	shEyg+RSij5KQoafvQPYAxQd3zqRrafEuc4IJe7+N6ZDRWBEHXIKKU3y9LF0VJEg
	d4l6EQuMCpzIXyqlxXcRFgKLgYcDkkiSkl7gY09gBcqiPQsa/6bjdEbsdkmJx5Jm
	y46DpQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm13c4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e024d2129so551900b3a.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781878; x=1785386678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=caspcI2spUWbkoHC1dUQkfss039e7NZjVbX6dB2Em9HBP6gqAguuffuJfLELfJ0DaQ
         Pf++/q5cg6iDRiEi5VRJgUFtLEhbJQiJGtbN/RBweNkHiEw4arY+2OMvRpqdZHPcfd56
         Zsju7yOGZgqK2s9y80C9/EOm0PW9Z2mUl2yoZ6+yQr/1k+4lLzxrhoVKDAM5+YRH+EPG
         ZXutlILHPyWdPVrQ5wrVhkBTwzflozXSK8YC2SGeLh5KMCGp4kE+U9n9yO6MtylQQcTk
         forTdzerY7td8D0t+q6K5jBSuS4dALfxhWAEaP9pkjIW0I45NMiAGYzJO9qO8pSDz5YU
         on9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781878; x=1785386678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5Rll7m1c+w2Vd//rEPttTWmC98Eb3WrsQxbNm1uIXs=;
        b=sF/uasQ+ts33e5XwTUJzd0MJ37bAixQFEdm9YNG+eZv7rfqpImwoFTw7tUOIXLNiBk
         rMaq+hhctF5X6LWJiGWb6aPJFezuMrupVO38jPPiiBpx8JeWSm/yBaoLMSrrTvGo5lJq
         a+kRmCVw7lLykhkrMbmaI4F7v1bykjkaUfZXTlgEIsJLbfmOmldLR+OcJ0QlmblGMxKj
         TpRoXCLOo4XpSH9IlZi2J+xvVJRSDmlGXEfl6Ds7qSuYUyeEAEp80jN7jUoZFQi7AKaI
         /dT2Lsn0aDB+zs4UM0/GK3EZ30KaHaUCKB762RqyCqIbOf4jENbedbu/m5FfyliPXh2o
         Nzfg==
X-Forwarded-Encrypted: i=1; AHgh+RpE0R/n+WNGvc8vhSSPfhCEKwSiuRidCzNIpyr4aY8+KUIs7Cbi90XTB58YMemYTNj0LL1XtNV6OkVSZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzckf9/EEXDs/EVSMkkm1aaQvJ2IOLQh6vwW8yCqP3EMf2UjecH
	RC5jkfQIl8+XTGFDArvMuKhx1Vfq6wtwsoztpJjKk9D57Szi/eSQ51DX96YOdALiXXIK0JNMOVI
	+HDK5VtQ0AgBHohYoE6WpKOVbFrlwTqyNjUkcrgMJVMMtOU5TwPP8zUITve5G//b04g==
X-Gm-Gg: AR+sD13Oqy8AQz9xXn1pEjsBN0UB0Eyn3LPvEo+qNLS7W5GoQ7S8Nae8PmHLypPdv6H
	Pimqe2uv+GMeeUYDLYF7jM8qZLn5q5nt1hoFrH+ILPcusKIeFU4iZ8gg2DynWu60Az1zmOKSpuZ
	dG7wIE75cWg47J/rgBJ8yiVMql7izMvcyWnm7GlOCLbSxSBn3bFurBXg5N7qDGWiwIqi2+h1GtM
	epxUofi9LqMR3AU1N8hy/2g/Iw9JZg7U04glq3N8ms+s8hhzwi0bMhmmlgqYhdJebJoqc8Iu2KA
	7YIZJw1U18aufAp//jlbXZFD5/UVZD6An9OYoi5916DT8kF6t3q1LG5Diq453R+DyZdirM3uD+c
	01+Y92O5l3BzDzsD3MQQbugCXoPYP/Bk=
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885734b3a.53.1784781878429;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2918:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-84e2c1e978cmr1885703b3a.53.1784781878031;
        Wed, 22 Jul 2026 21:44:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:37 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:58 +0530
Subject: [PATCH v6 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-4-7c46f9bbb4db@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zp1GXufqizR+5VEnn6BfS8arlJZLATjlbuLg+yCNhPE=;
 b=xoCCReuM9sWmw9kwbpJND8v84xB2buMxPsVSRf7mjtzpq3bfp9trleSKgaTamcnh56dc3gAFZ
 ogFomEK2UvCAtlL8vCc9kDfL9gV/aOlRgg+U5cxJSTwqio8CseL/pBR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXxOg9X1XCziTw
 FVZkAUTow/DNIIOR4XYqt1iaKTBfh8uGTAf7e+gZxrvK32RYQzCVEHzWGU5krHdPt+Yfy7hJ3Ge
 Qz2iFcKb371X1XTEkdHoltNRtB/XWtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX9UFJkcWI/dCU
 YYAVoxn9ajI7iIxwuC8Ncmy1FiiUjxQ4aIPX2veEorTkWWFyykjHCBKkctDe6pfQUovNYvKvlSk
 eXcPtIu5siDXhqn8aFP5Q0EJ7pnr6BxDwHV0k+krRBKfg4jldcIXOqMikemvrjUMrf/ZdPgkcnL
 f1i/g5JB0nD6u/6eHR5cd1Ju/JVJVY3WYuGrR2NMTLQzBWzlPDbfLNlKuNiuC6tstZUOp63Yx9y
 jmWGHpBmIzTjIlkx7ilA4kqUeuSPhlftQ//pfbZNR0v2Bfvqv5n9WEqqe+TtUMPiSY5/mQC7HGx
 mGPjzq4UIR+8F8kawZkMLlaAyKKd5135OHkHjaVCsu0oo0Tg/ilvZHD7/OeID6TFyz0fOVYvZHu
 bWxGIljznYKUV67wfuCm3Lb/l98M9CzUS8JPoq4EU0mKkNzkHM0x7cp9nQqZ5DYsSRvx0PZQvL8
 3QvEEBWJf8pdNQYl7MA==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a619c37 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yPF0G0iFDDrdx9Xn6OPbL6viqgfAVD9r
X-Proofpoint-ORIG-GUID: yPF0G0iFDDrdx9Xn6OPbL6viqgfAVD9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 215ca0743d943dde71045c331f7cef6ee4d9e9d2..446141e4f45fbafc750f5b90e4bb67cace5c3031 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

