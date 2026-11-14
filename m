Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655968;
	b=JgrLApuLUWgssVcOwlL+3Zw3wrYWfQEawMYeAQFOuXSHClcWSRn2e+QL63m0YGGMqELo
	 PDzYB0tZMzJlB/gDB53+khRdv0mUVSzpfPHifJKmw8QKGp3chuJGegeZ5gylA2UnTPeWU
	 oMVkhYBtO9zkZWM5GRVhXlc+FQT/UoaOmByPRhMwWi+mgf0a9FwPS4MuToipeWSaMtDQP
	 jDv9+DpIyr4usEjtxXDV9EtAEuLpOoXvzSW5wL5ZIocmd2xgwlfpqmz1ngAjqt5xLiU1C
	 ga8Z7E/VUJsF5E2DbYxhQTywSeidtJFLrnzkQLbBltNKjMNPBAU//7N4meUL1hLgxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
	b=XQ7yeRA7hfBHWesc5JqPotemrCd7dpYIkPMB+5f8x1qjdnj6oCwTiYcGmQURv/dGiVcm
	 n6HQvfqiyi/DdH2bNMzzeOcQPhMqBNjMN2rN05pWxN6sYHpSv12sl7Nei88Gm3ih5mtJf
	 YWY1pIm9SBEQ0SkAuiaSRAHy3EWAfIdUyEGxmcry1jh96S71a7XKAyqRk6vLuQBWIgZ4K
	 IP8tjIsXFwHBgDJwgsi0Fwn3aa5i+rTtbn3pfn66GEjxWfZbzNLS7u9tNyUtEgE4jVTmm
	 xOs+Mam7sxjLT7cRyGLvrz4UtYVk6jTtKmWVeXNDe9T1txUV48wBux8E5so9m4cW9kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6DCdMVu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMXNe5KA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF9606A330
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBF9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6DCdMVu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMXNe5KA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wKpO1750458
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=; b=N6DCdMVuKhJqR+KQ
	hRhkHqPOgGzkEe592gkZnkrri0I1fAkmDRhdfsCsydRfefDHUq2zFvcYXqpnBNHT
	QbOUgukGZJYfM/eRcQ7G3Ny2DPnLcGsLsq6H9otfsmAq6+/b1jdgu9cUOh659CP8
	MViEJDsKlve7mPmtw2+Q45ydS6XVvv8klrYJTNP4aeZ07zGq8S6lyQVGw08LMSJA
	Zn1AKZSCjZqiLAXm3BU6wtiHd3jGKYNzK206gZpCdCiknYp2xrkM98o4e8y1tM4c
	aibWVe0QkhWfhveqWvKiiyIaEGScl11CTmhhpoyui82buFOYyjSQkt5nIdT2KTK8
	5zSKjw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40n2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:32:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea39a2f8eso42524796d6.2
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655967; x=1795260767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
        b=aMXNe5KAL0DQR07u8eBk6KXUBP7NGQUOPkLMCG6uSH1pWiirUHKdGejIC1jL/8QhhJ
         uDY+E4h4CQB11usKW3eA8jbESbwVpzNoe+y+PQ/N8eSA4GPtvpLOfvYuiI47ENIbd0st
         /RZhx0TrQiBCzsze2ypzyqCBKOxCs6+UKPm1swGBV1LvRf4asVvMxwubbAYiL49k9V9y
         SJXPd7mM9Yv+wWCf1o8SkNLKRUbNzYh0wOA0chK4Zvs2Qk0tB9La8fuRIPqot5I67LLF
         WIMJdeP6hLUNEjbVCpDMufon4QfGvuYrTm1i/uG03J8aWkjiMkySlyRvZLsgGwpy4rEk
         0Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655967; x=1795260767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1U7sBZaKqbNbwJInAu56We/z6Ce1sNVBbGtf7uj2O0=;
        b=gkl4dWCe6hHMVMtjpPPaQNzO25ZM/IP+cieewzkLWwkXJbKcZWNUykXZrBE/+Fp0TL
         up0GekNG6id8Ysfnpoif4jIC/UaZLko7i7anfmz8kA0wMLTEZxMZ9uCi9w64wTwT6Wr9
         WvGg9rCnfrMuG5WwBfs4nmGRqfXGDFLoV76vvpnNnj7OA3BzsY6Cx3wIVL9/XiXEi6v/
         rres7qq398z0odCawU6UWGDd2h7yEc3goZKLyz77yDSiPWGrIpfVF3G1LONWp92IqdOO
         r8Z+skmjD43P6Sh3pAWVt8moO3bPjLdVtQQuqWOWGxSjs74mRU5aKTz04eAs0Am8M5JV
         /6gA==
X-Forwarded-Encrypted: i=1; AL+hErHolJmNIfR7waxZs/Sn6AxsdYYHT82uZStYOJdEaZ4vuM+ggENMnRszv3HxlHrTTiezN7x/P0IlpHjlfQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9WPr6N1XlB98C+xSR7NjL6eD945P61WtvWqDFlrDdKll4KaDI
	VWDX0C/v7o3xub71d6Ovql3WK094V4Wb+IDe48Mm9O/g+EHCcDC0x6OzYfh+3XW6eChwG7LKyVJ
	pKXuxvj3WfF4g4+78lC9QryfcAGtgy27o8Y/UI/s8/DfRcJUFGYQdufayw/3gbSiKOw==
X-Gm-Gg: AYBFou2FdFNnW4ZtWlZMs5/Khq/0eYyVkrrZkuhdtlQgPkP6SnimDSICbOE0zj8Roik
	N6RFvCvN8/GaRS3C1XOfkTiKWfeR1mcvFCSFxez9RKGGzk8w4tUkgqBhuEKs3+dhow00Z/GByny
	2xZNHVMez4Oy8Q567cJoA2CFLnMyShYjBkWUG2Z6sUCrYeaqNsAggKlDAGL39cdcF6ckeAM25fF
	lh+rWB2O/4z/UxZxEFG1iLNRkl84RtWonT/5vPH30UP86K2snsatJJh1+srItRC1z8mcm3PQ1gZ
	9yuVHepGazeYAEQZBaRBC+mSmUkXbVVf6FfeO8Sht5a4TRKTNXaH3t2IhoxBWq9fK6d2bt/5v55
	F/g2nl8CS4uzbajltRoucSIxv71BIz526ebw/ZVJ8FwAQlqFwOnjga3RtHxbxRx+BKVKYRj+j8l
	hw5ZWkU15YqxpSMQ2zxCQvTO3bixM5TcuUZ54sGHzh
X-Received: by 2002:a05:6214:1301:b0:91f:136b:d44a with SMTP id 6a1803df08f44-91f24166bf4mr85261416d6.33.1794655966662;
        Sat, 14 Nov 2026 03:32:46 -0800 (PST)
X-Received: by 2002:a05:6214:1301:b0:91f:136b:d44a with SMTP id 6a1803df08f44-91f24166bf4mr85260946d6.33.1794655966199;
        Sat, 14 Nov 2026 03:32:46 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:45 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:37 +0800
Subject: [PATCH v7 20/23] arm64: dts: qcom: eliza: Add camera MCLK pinctrl
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-20-8ff2a11835f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1457;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=rB8pkz2FCaAP+r/pTb8lDqYixAV3o/wVSCv9gP1ibjc=;
 b=bO4rJz1QmC84EY6U3r1bkmZ4PXhLhKxM0HlCwJLVHdnT6+kWWrVPCxX06MNssdNUzjoYI8idQ
 feMeZ8f/G3FDr2iRw3wvf0PMTlcgmsQHkIIzvI8R7g2ylrMX85Hh2zA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX7ZhtAXoTR2zx
 YuseuAACp8wTAWxnEuyy+m9AOmXvBOq0LuQh7f4DdxFo2xDR7AR1B4rL5zUWrYSna09lj7DUFbN
 mMmY2DO8d10m0qEG3TWTdwfF0tI/KZ4g5WX58lnJa1MI36moKDDZP4fa2Eak1YYxcyJX0Sgrljc
 so7WjKUmNmeLhgSDKBaGB9JCln2u/Zuv7xHk4F5BupVbP5dmks2o1mYsQbehYkM6646njqsTMJi
 lZ5Y2c+AYDCpGotu/XprI6YLc7HqAX+nkTw65TsM2i0L8ik6ftoauuz95XXIG4sjzoIwLQc0X57
 RbQ8gSeBnLLGZPGPSkXEeUsGJdLfCm1+7zWkwLJ4re9NnwEnEQ46Z64FBM5fE4EGO2uX/escwl4
 PLcGrNeIEvwe9qyKOC8tJTAZw6r6304+yLwGkhdcNwyoxSZp8RkE0pevvtCPrfjWofS6GjBS21y
 BU0AfBhCfoE9OECKweg==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af846df cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wPaziBaVlFKsotjdNj0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: CRkREK7L23DGMG5B0JtFgFLWnV6DNNR2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX4rkHx6EoDnF/
 69rF87dgzuVitVLDOYW0dZxN6APtke9twlMGREcbgh+Ir9onpr1+GXQsZxQI4/mpEYnTnTCuRPT
 kmPgPA8qX4h9wSlUCmaC9IoDqSTuL9Q=
X-Proofpoint-ORIG-GUID: CRkREK7L23DGMG5B0JtFgFLWnV6DNNR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add TLMM pinctrl states for the camera master clocks MCLK0 to MCLK3 on
Eliza so camera sensor nodes can select the MCLK pin functions when
enabled.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 0b759bf5b91e412743c12982b79ab4506b9a50b9..f22a8b031e7c56e4ae7311c34ee6ca48359ce8fe 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4013,6 +4013,34 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 186>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio70";

-- 
2.34.1

