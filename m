Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655935;
	b=BSBmgWIPMDA5+wIbtOP1Xa8w19EmMbHatf7z9iPuie6mCAYxtPkghbvNDf2XVeKRyCES
	 ho+vwmcImbDH9W46d97ADJCOhnfj0C8rbsrkW+djn1fwtMWuzShdZh/yHjWc/rhhK3sJ6
	 iRad/CgNSB8uachWcSuP5PAcRMcXu27jO+BQl6P0cEkWc7Rsfm30vff3XDoNLNcQqkAY3
	 orbE0YXdk3Zbs7iOlwkJpJNb0wTDbC1fxo0bG3QeXtqhkUhJcy0EeYQq2jxTHDoM+Qu8g
	 kjwwKzVlovYjkxozjjz5ahYKhqXuwPBxB2xoxZU28fXo+zQk7j6IulPtKik3NqAti4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
	b=GMDBPAtOKC/73rQV8TiAsra2PtWch/l7X7j94WRNgZFffJB07j5BgVVlWwGdxZikSluj
	 1jX2NjA4PTuwSr1BHg9EEMpl5WvwcLhADYymQA9KFTgLMDnODD9PjGl45vBbUNJV6Si/v
	 MrUJmookgDYKGHZiOmzGOPgXVi3vduZZJdHC4vXcQeIxTPXv4ApfhJdiHVJJt0b3cfJxu
	 3W8qPRKSjvtO+xuzCEEbOy8bMOQM6nKm4fvv/IysVc2GVv8mZk3XWj0WVJhqVrP6lV672
	 rsRWGTDGJurQC1MDqQWNfd6TKhRchEcJjNCJ8oIz9MftGvWEufpGI0laqpw2svaPkFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rb30fIlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2QPAAeq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA7606A323
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17EA7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rb30fIlB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2QPAAeq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wZSe3165133
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=; b=Rb30fIlBgs+mcJCD
	QUBI9NvC+h1X+6x5RkDiB4jvORgBbB5+6PMB0EpONoFZPCx4kdp1j6XNqARdEx6Z
	ypy5qVylklR1HjsMl9Nvg9WEJC8qte5JxFxcuDHArHi2XFE6ErX1aSGA93H2XiJ1
	orCDrKqx2X4DdXwgytW8Ws9UQM2cSRQkG4NPboww7Z9qLUJvnhl6V8pv5Al+FT1O
	XLNAMNEytXRpU4/bWp5qMOdz4YHoOgjFoJ4uec+58tsCj+f/plJeFsVmhjin9rCJ
	FWZ8H6Zi56R5xrbHD3/dHGD4aj0/s+bln2V1mAAtDom3QvNtFzskD0Kk8K1anH1I
	DHME0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8m27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d2b776fccso1120781cf.3
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655933; x=1795260733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
        b=J2QPAAeqnZDTvRVcdWybxMkQgaCoLdtCymx9C9YXsHgnywXEVMrfyh3LfCaYz8HhjN
         osltLvvxDjOx4S7DlDgAIjh//mMdgTxe55MQEL2MbULvgEhQvxmJZ7r0kCANOMjnZDi9
         sBnb9zoX6QiBV4X0KUgJvsSQvD90CGDhwZfFW6hBRaFWXvqKwacWv7eM8B5ICFCXuOO+
         XovM+x8uWBmp8+cPAa0KuWjOD9SO/XvZ05q1pNKC+8NhmUJtxPXvWLmN2O1o8J75vN3j
         5JkWY0gp846nve3Z2PI0Ftb0KDgScBgfRh0/RJnc8EhZkkDnggAD9LX6F6iWFEvH4/Ux
         ZqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655933; x=1795260733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
        b=RW7LckFyxzZe/L4hbdvfwEaW+1OT42J5HxdZgeFa2DnCNY9EKuRfIJwQq2sHqFYEMK
         cn8GfyuMVbAFmtkbyHo+gRtYepQ8W2WuawVMjh5c+Zy15xAJXRJw0kGVgPGukIpIWfQr
         KiJjsE2qwhLtPioQbKH9NxzKnP6J0FBed+ehoRkvyx7ds8XXTE4JqzbxTRX2Eguhq8oc
         yg0TQVyvI/a8VB+8tYq2vxHQmYK4MBHIITecccl/Fb2VyOn/T9VM77qRNEMig2WgNjyC
         DUn8gFG3we6u9QPqHtkMGI39Rqvjb+AqnJuXDRYpWx6ffjCcQ788HSs+G2L06zdF8KW4
         ZO5g==
X-Forwarded-Encrypted: i=1; AL+hErHDJQMnxcM+x1DnXuCOVf5WZzX12b4MySbTw0KFOQfk9mW1167b+nVh8hRssFr09G1yJNH5CA7Xh8Kmow==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wE8NW81wEYt17QA9JpBR5WoWyg2C/BrSst6Pl8+2lztnMljrs
	sH6RpzRFqlZVQVVOpJMdnI3LZWQpmaSqkSehb4e7dSH6dUg5PR/4bkURNSxXZdqi1JTqLzw7LwD
	v2WfeNpFCoF6yA8e2dXIBHZ+h6IE9XfgBFnyAW4GOigZFtYkhSaaiRhT2/b021KgcUQ==
X-Gm-Gg: AYBFou109P7UEqZZdgitNQd3odlq8y5Smw7l1/bOzR3SDZgV242AiDk90WXncCPLXjw
	xW9igtKjsv8X7bVLOqFbzxI8a/w28BYo1f5bmtXj257RVAiZGlqsX04OTXV3gRQ+iH3Wwq9muQ1
	3adGOn15DhNK9BA0X+p6aEmOSYan6HaY9hA/EkRc9lgoVoz+3HDFqqgg6yVDoi5ELr+PJxZZGoU
	Ff1lMkyEU2++xOJe+6/gLocXq5AkeRZY583B+V1HTq5J7bgdeKFPkhg27Oc1BekN9OzyCLvTngx
	dx+xuBf3BAlv/CeY/PIYZOI14BSvDnuwL+FHu1evUGW5AtYDbJWS2DmByDpdfSqQwA1FH8FhNi9
	jSB0RTd1zJo2sy+daX/adUm9uj7bdha7DeaYFawkv6EM/daoWUCE2niVzs+xBmC1oAnX7jrp9le
	JXiI60JBE6zkpVflpOhWmRTj2GUHuKbc6vGcR5cYDJ
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr78978311cf.18.1794655933523;
        Sat, 14 Nov 2026 03:32:13 -0800 (PST)
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr78977961cf.18.1794655933007;
        Sat, 14 Nov 2026 03:32:13 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:12 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:33 +0800
Subject: [PATCH v7 16/23] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-16-8ff2a11835f6@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=2166;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ZjpIL59WVpDn2zuhTRFHiQbumlAhh6tSXd8R3gIf0As=;
 b=hqMmOgnhfauqkwhUk2lv+qrc/2o12LH4x6v3Jcd5C6MQx+NF/ugLG+9jQALC6LqjrjvqK4+NB
 SxlmJRyJgwdClYSPI9vbmm5M7ig+CXxAVrRS03QARqIcN2Qv5oNmuc1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX+CwIgMo8hSSE
 G7x06Hm6PGhJOE1QyiQiz/c43mHAjMl7WBvgn99aREuKez9Nb91eVIF1eMbwPFbMikrVyYNBOzY
 UgQ5ppzpDrqvMk8k6sukQ4PUjSAKFKMpw0h1AEa3rRRRi+0GWSJgTESnrgoz6tEhhf9lDYRKGYt
 bgfbH2IDQYpE9xUoL6iZVfrCXGEOylxXlFFuaHU0SYyQH6Qx5uTSva0Z8xMEe6QjHSxkFI3BVK+
 wS7VLXHh4jLVyf8FHBdU7EeekzoNNmQE6UzVenqSNPPJNk0B1eie3L9a0x898q4W9JdjfCoeM2m
 o7oo0jkxn/BA0GRDjkjOckoj/H5N6hdbVSW+7yOBL2qEvqsLSUYPEDj0+LshQ+T8H2x2Bdtzsan
 PWvk1jmXbpIIQBEEaSGOrrAzr+pYF3sXuvrSe7Vmqnz2Lh9kGUT3sbb+73EHBUHN79E1y8V/6hk
 tOaCgmD/HNq1/HENm8g==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af846be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZY3ACuDlzNLtHqm84dYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: k1QyNH6xb1Q6C_JA09-xDxoPY7akjjES
X-Proofpoint-ORIG-GUID: k1QyNH6xb1Q6C_JA09-xDxoPY7akjjES
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX7ltPTZ8YrU+l
 6932W6v1P+cXqnQgQHSEZdQDM7aI+kioWpNaOClAZ+3bjOndxICUGe5g/TPPxqAsrKh9TNMlF49
 DiwWzxA8Kjx7X43+W9eZTheDiW2E73Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Define pinctrl definitions to enable camera master clocks on SM8750.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index b1fe1c2f5ae9c5b6107729fbdf31c2577ee3ebd3..522d2c0c374cba48de1420be5357db65864bd3cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4386,6 +4386,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
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
+				function = "cam_aon_mclk2";
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
+				function = "cam_aon_mclk4";
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
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1

