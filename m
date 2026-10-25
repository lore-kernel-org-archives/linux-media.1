Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898260;
	b=oGqkBF4oAZ1JgmRtczgIbsTObozOolFfDnz+M5Zh7MMu0NpKOgGStkhh5GioyGBsndMC
	 uAgGRQ2bEDCr90unY7H5OydgbqdbYIEvz/SWFqC+BI+f4Lb6kK+75SphGxo1fwMv6nHD5
	 4ANP6Ee0xfB6nm5eYROCWc7XU0GyGEtd2e0AIt02QSRLHlSyH1+y+R62VnRBGWkFVDlAq
	 7y8sHLzYOLayOg3RUxbx9gwruCYM75AAABPRYHsUf2twqqfH308TifRxpqTm690oBBLMN
	 u8XOS3tWTAty0dMLBdrphJwy+FThMzBlum+E9A8xU83jUGJbyFV8wPUJ/ok97cehQzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
	b=5h74cjzcooysyTRhWbdOygOKc64FyjbFykxBjGoh6x8TC7RS2ujcLPpJR79VL3Nlcnyi
	 pvwqEW8Iqa6uV4UZadlrtvSEv99eGD3RZjnqmBTmp3MOhVoe8l7wLDc1RxehRS92LVL7c
	 hKc9soeMgRUtC7ylPF6tGTgHZmunBUsTOkKJrHo29dfeYelbZqCbAP0+C0SnZEmqdGx1O
	 McqUHCbfsyD4jOEMZWB3/tvuHk/m5eAX6jULgK5spFxBcRz73XtpkZOKH8ZgltCpxooJT
	 2T4T4u5NVt6xlICebeePX1/cLpg3byta5kL7TjrAiwpebf16VKMF2ETOWZcKNxRyAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95B60A2627
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E95B60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYyXW6bU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZ5MKTeg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16M6U3121011
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=; b=QYyXW6bUTbcrcDDy
	7ohIzlCQ6Vsbe0dQN8fgBCEoiWRLCwoeNXH0awws9PjgHDTAO1kXxU1ThUeTiHur
	Kojc5pY2dxAtxrnu+yS1Z0t+G2YRgJFYKVWnTM7RmukUcmpG9y2Alnfsq2PKFImm
	LoSqFcG/+niGmH/BcStLHvKwaWwmfyVq6TpAOqwvr4d+9fFnWZhiFkXLaH9DpS6f
	7fbIDdF6+MzC5tyDjM7uHtacGohUCVg/x60aPhvzM1ijL63IJ9PStXV6Qnv76Jeq
	XpXepZ6s4hMWPBJ64+OIfDygBA5tY1Y1wTeT2uHG9HICZl1JEnRfk5LWoZ1mQy3I
	4QNrzg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3j9sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so10033621eec.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898259; x=1793503059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=bZ5MKTegq6nR69TiNuP8efnQ6by831nRuoWGBDinzj/w/7kNE+LhAVMWKQraJ3Cjgi
         6aUeF2gSWmkofC3mbwRcKmaVJOIOR5Fv2pLE/KdeGUQL8cmZE1vOzv89DoRejf8c3N14
         B2hzMruIt1kz7MMqWE+VpztgePE4sfok6nlmpOht8xvZ0CC9NhjNEWZR9gCqMXqbL96N
         TaHBl2k/wDupQcv71zD32JjMTh4STh/A0uM8c5+9oKCJDt18v5yc4fcwV3yESgabEinK
         57FXaUH9WH7NVlB29A7mv3Y6FdToWlZaws8sUhHwtITNM+DblVzMbYsN38K9EMD8xmwJ
         yUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898259; x=1793503059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/9ymwYLRuEiPenWIgoB1XidxNxPS22dZ2PmvmlaXa4=;
        b=GSk3A+pQtV5Po/tum7b1VQ6vPuSLQ6oqTS+UQAnaZ/djkJjoUaoptYOFB/qcycRFvi
         BxyGuvxNKYQPAUgDpqjJILdp5yUgu+zbZFlhRbBotA+6EsyFjDfEiMdQ8ixwrz9XHlDU
         9FqIoMWjyE+GZG9iMv+x9fuRlqsyPOsrWqUBooNzHcRP3WlhJ5pm7MJ3s3neKP54orjf
         KnjFLalYa5WmgSy7TpViX34hAXyndTisKuZes4mIDySYXUer4kmAWcOD7Dhb/hQwBWui
         vDc9N2IlhTR4aVogPNLly/otQN2SqF1UUBPVXRi/ioUDPeMA7NsaDVW1MtNw+eAvUGPI
         jUBw==
X-Forwarded-Encrypted: i=1; AKwUvByJktaOJAX0g/dHYNh/XRZ5E3pYpFETftufdnB6OAqUkz4ZSBdLLf/rlCy7PURCYnpLfZely67jqgcigw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1CSVr/iGcN9m5i7ROFxT8578q1sZvoWsdfFr57W5f50Q5GLlg
	z5vqFdZiix/HrWOsimkJdyk/LOJBmVJWiGFrO98s/8qqV/yDvXl7h3lIj+Th3w2/CYlePqCTARv
	04nwM+xNn/XqElcfbcu3BWBQ+pd1Ehf7es6SOW418++JqD01dqmgB8ANd3UEx6AfgyQ==
X-Gm-Gg: AYBFou1yncGDZOxwu7ljEcwebOhI9oXp0OT2h0d0e/WtBDkx1FW7BRaqGjD0sqANX1k
	XkM27hDqNzaFRzFV9E+I11Bst8ws6HUP8gkkbRpHNetmPLiH4tYjtFnxBeAL4qU6NkvJ0IpFPP0
	kR0CYyYp7zgL+G1EtI28iRF51Ei5TPorQxwp2LdPHi4U3BDiKK6XsNoRdyQaTPZpppQaIuAv/fb
	HXqBGq4Mbd5JuSAwjgvcmQoGSCQdHh1cw4UbX679k5TP9oHnK7dRJai5KhDbPgcl49FHGFvfg4X
	5nGSHRLwk7OBX70fw41wZFhmYdBknSQ6/Kd+Jrh2ffXXi6lCpCseU+akYui38iWN70foOoaNhFR
	kKgqebK7vYmq6mjq/bJuGb4GvHpdYCSPGcyfn7r8X9WZWuPuFIyAvK68mk7QGdq4VjyHX5ajixN
	gEo6cx+NsSSA==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537504eec.6.1792898258942;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7537473eec.6.1792898258482;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:32 -0700
Subject: [PATCH v22 13/14] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261024-kaanapali-camss-v22-13-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-GUID: Y-Dp_MSYp7FLQbM5gSkxYXRoGFGMSsRr
X-Proofpoint-ORIG-GUID: Y-Dp_MSYp7FLQbM5gSkxYXRoGFGMSsRr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX6HuOMDJpozTi
 C3LqtjpRf6XKcmERppZEDxtqwubB2bi8CBj83kMMnnJFUTwcESzBCgTyDdeiuI4jWlWEng4t8Ho
 9f5UoZp7EB+RwW7vGfpSQo+48OeB0LQ=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6add74d3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX3vMyArqzaN9T
 kk5XzZ4B8CY7lUMwL0DQsHtkrMCPeeynoCaMrXEYAx0GCbL/GNG6CxJP+1s7qsKGAcgg2AXmzH8
 XhQ1436iIz8UuVCxrVhQjhMiO3OaHypGzA6bjn6u+FZzeVg/rRQE6Am8fm9idG5yA62e7WWXzvQ
 mxThYQ9Pg4ttgfJhymiwii8AJ803LKfFl3PMIabV6l1rBLEAodHWXfFmQDtBuJqL4lKbxxPnRUI
 U8gCsg/agHNuq4SQt/XDRJYj4surfcOaj/m2dBJxM42ODDg25f9Qcartm+U3KtisX7V2tfLqEiR
 v9GKYbEmeH9ChRgWJlVPsX2BkePDHmow+4k8AhVlaSmdqm+YHwnhh78/O+mf295eZof+SnP/Imt
 aFRWqLfdTa9VAgLa5QfTHiXTIA4eRDs37MSciXaxyzsRfJwiUnOdH4u61+01KEoWcgGCR2i1Yiq
 oM+aOUsrBuIYWyOi7/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 86dc1400a25e..e94fa2ba3dad 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4645,6 +4645,62 @@ tlmm: pinctrl@f100000 {
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

