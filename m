Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2E439F7F
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787551; cv=none; b=tMCtGMrBPl9RVcEdZmymS0+5s5TYYvwgHdtpqC6WphMNfX6fl+GW/Y2kX+TSfgVJFFy283mZIGrMTFS2tW2CTYQLJcQbpesZbYLIX0tlbyUnNTJx/Ppq3ZDQPj8ie5HFrtOia81Dx2KmGTvj4ezBaTBK5yBZUfrEZB+TZ1ON1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787551; c=relaxed/simple;
	bh=pxHyg/jfZ7eJ6o8uVk7w4Q38gLsjYlwkLC67UQT1/wQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSXDyHkdPZA+V+5gFpO1zL222g52mWAgm3VJwAVMejJFRJ/5L8zRZY3i7W1GgH5+eE2leh5/pMAJAjVxzFqtccht/8EKqgLVBv7hk0rzCM8YNZh+pORbukn1205FNZe8s8baenvcFRDbVCnrbVfhR/Rjz+Kiearzg2GNefNXew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBqO2jl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmdGgpj6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBqO2jl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmdGgpj6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55gkS750872
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=; b=TBqO2jl0Bu3/iorL
	kJGdWmwP+MKV+62hxRvZID2WbF+xQW33FDdajxpeCyQU2NHwyVfZiyGxy2gyo6ov
	faaYMyG/i/2EBUMeHZyXYF3M+CMmRt8wbQD6QkgWl5HL3MdyX324qRv6Q+W9X9B6
	0cE6EpXcrku4/74dmERS3PkHakPuNG9ZlK4fpihtkXM+0x9AfB6+hWZd7Tyl0MUQ
	/TZokay1LwNINxWwO909JXeqCJrTX54S5gCNSfovJ8COabIFy5haq3/dFpz4UNDQ
	XS3URa6Mt3HJYD7hllz/XO4BjW6rj6j0870XT2E/OfMKsgz4qvReWuiidNk1G5RP
	F1dVlw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed2ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so834513a12.2
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 23:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787543; x=1792392343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=DmdGgpj6qHh51oHJLX/vb7OUAN11dyyrSYuj9hgR9Z7USmQ++SqrSQR7ij2iw+ZgId
         wH+ypQkvhsyxCPmtNBfNwiSDvh8LDkl16Xl5bQxZuYTeDnjiX5pPrEskaEz1npMMsG6X
         kt0/7PN8Fl3NmLJjCEjmvDnpGH44gQR0+3roduRK9ycJoDMrlqozamrRyz8i/gRe8o5r
         ByosXf5/lFkP5QUmqJbEjWPIpNOCcmBm+z54nFnwkIQ0LXQ04oYUzwP2gpdfYovE3+h4
         htJAckUOXjkFcxBTPJMGaFgTE4wyJ56TGIT7yUJGMenfnS2yRzczDWcNSfJH07mkdx0K
         Nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787543; x=1792392343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnv0qmK8/nEJAwt/Str/SSMG0YhjSM3cMdd5FG5Ong8=;
        b=DkdU4Icnjvl67Hmd4Wm/R85vuTQXyr0ba79W7ZP6K1vcgoTxR/tLFdEcdbudHF1Wn7
         swvIzmoAn5Mj7yuKgMcJ5aairq1WgA0glMZd7Crgl/VNgLxijkhBC5dCjl91DYJoiGDX
         9H9idbEPRFgAKZJPXZeQHtUkRlyZlO5hk/+D2wAjc2ZxkYLdCe4r6+s1+AUg5uIUDAwW
         M4xEW+0UhwHShMe1B2gG0Ot+7DaiMETL+qierWj9lMrWUqlKxSGoxJeaDfNNNHGg5q7p
         OqLyLGbXloF5HzG5nbuETTs/SfB6sT3qrn53PTknxBQz4DiLj/4QxdE0EI06gl7AGBPa
         bA+A==
X-Forwarded-Encrypted: i=1; AKwUvBzsBNO0bT7cIGvTwoLujAhrZmsXzW/xtf9c45vV6VOCGLDotGyc2MqpE5jNcUjBHA9EBH2edMNgWevyFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIE4Ulv9Iz/yBjIhvYmhq0ACizHDJBVp0xNpuEhHBsp0AyEDf0X
	uOGSSL/sP8es5hC78B+Im0CtnZikcbCxcB9TphVFyrYvMLRFobyq3+2NS9xR4sjWPAH2cRbAh41
	80wXv5vy2S90xvRch9WY/4h3h54oQu+YzAhbRkr2apHfDznc9Z0hRzRgazVwax3Qy6g==
X-Gm-Gg: AYBFou3YOODR98GKFtBqhJevBgM0k4MAzDGhzRRCHI0Itq85iQrtYK28UUiaXEpAJ6C
	EkuR3MwcL27fAo/gyjnZpgqgeBO+OX9Q38KdUu1DrU+Hg/Zmheeh5GwBdFFhXuOEqz10V8WYgvs
	WkxDaRRgPI9VycWN4ZfxpZ0jzmE9zVqAUP/nb4pYMW0PWjKlO/tWlJFns6J2TwFtjJANPpwER3E
	VBZA/CRrLW2Ld9Ff4Y1w4kl0kc8+qpTFTsjXV40rnQ5uURKNWk7ghgFJFUyaRmLzpVqfnR4GTFa
	tJZIjDEdM2SH4WHkd2KYsStY2SBoovpk9F2PatXyE5KjSXLkW6aXuRD2wVAVLRCUBsAeGa6qfkk
	GOlf/P3odFc4WUsC0y/yVlbGmYmFvlmCEQzTPIokPXNKq7N+fUdPYUb9AkbbKfkUUxqCQhvfWO8
	jNiAYeTFnZHg==
X-Received: by 2002:a05:6a21:3292:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3e16ba9ff90mr7154952637.2.1791787543343;
        Sun, 11 Oct 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:3292:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3e16ba9ff90mr7154921637.2.1791787542836;
        Sun, 11 Oct 2026 23:45:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:42 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:15 -0700
Subject: [PATCH v21 13/14] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-13-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX6JwBzfs4BeiD
 6Kp9vhgUG6txk/6T+cGM3A2c4igdJok4psdr/Da1v3aT9Q4NpQWV0+nB2XyDEReiTljFxcDOSj/
 nE/7gRRG+8rprxyvnIBupDOdPRXk7Lc42JGtuxkqxqRwabTrQHMC00TlObEpUaGv1Br231nshqp
 aALlqSxBbdyJbBcUa3rhclSfHqDlsTDSaFvum4i7/WaI2S9TBEPfwI9Igu5g47wbDrjkmAJisUd
 zPc9Esoe3XYJxauR7u3aUHwXAXhip1GPXQXGcG4O8G9Dz6JoJn1cSVSX4n/Tr0ErIEkiap+ty6n
 3ZfHcdnczLr+5rcHUWPOM/TglCXbpsEVVehjgqocAou5cOt8nzQIezWrhUkSmqLP6/IslAXO4AN
 IQRUvN3DkRAoWYDZV6jDG+riO6Yo1Yf1UgBUxYAUwSoLYhgMOYgGkPn8ms/FPTdwzNupxGQk9HY
 OZBRxoOMra/zOXvApbQ==
X-Proofpoint-ORIG-GUID: kH4OkpYRjEFZNztUK1SE_gvyNlRT8IgZ
X-Proofpoint-GUID: kH4OkpYRjEFZNztUK1SE_gvyNlRT8IgZ
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8218 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX0EuNi+Uu2jh2
 ipkamCC3StZS6a4l/W2dNpreYjiuu6BWJn8+GfxCcYLXtfkmeiJy5SdSAbEb74O00isVdiQxaB9
 pIvo2N+V2peV9MNsh/xKuwdIsX43fDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 62f02bff0227..63fae1bbfe66 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4648,6 +4648,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

