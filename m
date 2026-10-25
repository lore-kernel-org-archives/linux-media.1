Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898249;
	b=AGoCT76ai0MNmztpq+20dcSfEvy71I/mBmpYsS5mG5VtijkPIBw8vl61M/2lS4vrcxeU
	 /XgPCl/el0jM2sjlwFJPpU5lHPIKWXBJ/tdKxLVp6Jr8fKrFq76XEUaXfXkEqixfVRSV6
	 mnL+hxc05xA6+IQP/0jjyMRzsi5pIXYaZII2+qEMmgFpDwYzPy6llDwfH/74E2ABySKoZ
	 oRKu3bWxfV9bMJFVoqOGHckBAdQqWxyvbLJ8xHzb+6p60tfmFuTdS1QZp5A0Ly2ajkOm3
	 ThtJQYsnw/h2kci0hT/FGA6pAT9fGOL6clOA0eL55flqjf7its84oLpbrT6PLdiUhsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
	b=lq83XdvZVEtbOMJ9hUaLEycL7TdrSZ462oQhxRtdws/mDsUg1B1/1pZTNYQI8UA/MS1c
	 K3pcUa29HfYTmqVVzjBolhxPZv88pA9zOobUMo+e36Hk57A0hoIKfYfLKXO2GaIuOxMlq
	 f8GmQF1C5uY68dnNDpGp/SH0WVHmkb8NOyrs5XSaQhdsXAj/5LOnR2wgY7b8dnYFeTwJ+
	 dsR9olZmv6IH+rznUFm5Trf8kv/S+TvCSNlsvau4zSmpDgN10/z9yeKsfCM6z29HS2BV3
	 2tuReaHfl8JPXR/VPR/ZP0AmvkX7XoXiN6Cm2n65Yt0c6RDRRPkfOCWCmKG+qzYTg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMfuPY9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UaPTnjy8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C4606A32F
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7C4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMfuPY9b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UaPTnjy8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16X1Y4167524
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=KMfuPY9buqvS37J+
	W4zpIW4o6235zZ9+7zfRs7ZNI9Vw5JIAhwtfiMAUJUX9e9GRjvtJIO3td6XK57H1
	sYJYeulbgMP8vUt+8Pwubjyhy7R9YIqlz8tseXBPqZz0QFk8gMi1ZcoZOc/h7XED
	h9+ywnb18Achc6oPO/nMWugLSLWQYONYcsifckTXc4U423X0lVBWIOcwH2oVOHLn
	7IV1hD7vFQ4KiMPrKZM9WnJ0WF8wvjg0UzWiTM1o5onxa9I9bBNc+CaooHQmNmc8
	uKeV4cZCuejyw9LMVns42aOzQKTZ9I8Jja0BGvvQiEgNVR3VGX++5zRrwbOtk39p
	nw8iqA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsae8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408349eec.0
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898247; x=1793503047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=UaPTnjy8NQ+mYPmWmyxgofE4IZb5gHPCi2zwvtZPA+wbR5XGc4UTRSGgrdVSeGfwK1
         yWv7nxgNQlNmbWSuFLpk4+Wha8uHMPTCTyXBy8ZFnhC+56I6FdJQxb6u2xL7MIZ3wxth
         DNE2R96DGc7xUKkfl1AdtLaYdr22i1mInExIIhFjnAc8T2bs+CwVbjLf2QmObBS+Fny6
         w0y7CuQb9MB5btRkQJa4UHE/2XRuTZjbub3ii/f9oxmfxFL1IkABBSXhPvCbhZA9VCZd
         87Zv9JBf2qIdNm/feucG13pmzIeUh4s5s50Kk2HaNq6zYI9tTvguvESEaIjcvK1iERgR
         m/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898247; x=1793503047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=Wvul0kmDi1CfqX5qr//MjHAg3cTJM46iGGFf88Qan5SCI+NRv/igntYmC/lapIuu23
         z/LuKAyVJTUFnC7ZS4mdm0RkKppzFJhkQWJY2aKa8KSiS9c8X+OEhwNSqaMhV4rUNjvI
         XHpvPZEbpl+aCxtr5YExruj66naOSpQqytxsmP2Jy8ksjX8WM/Ze8lVgLTAynGf5xWRb
         VLm6mGXanH6u4YUCxJcHp3n2aaBFzIaZbnsXVE4vlMCSi9lD9H6x1tixYPyQXh9kLuzN
         y7SA4VjfHeqs3HixQY4qWlcUsyX3GWLZPiM3Mt3XpwwDJtRR4XbPcfOvX5HbEVM/4xzF
         6lLg==
X-Forwarded-Encrypted: i=1; AKwUvBzKHRM8qnpBg9D2ABsmIidmCmCQBijQhQixOVc+zjpc1dKFaXRm5EJmaMVj+kJbPbWJtD9F7qc1/z3OUw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLUyWpSWw4VI82yjO9G1SZ1g0hT91NeFIR9aouK6CbEiz9xhMro
	1O45A0mUXPLGC65cJD/IFMmj7lxaviw38MUx9xY97gCmoolEG4ChSYZKLT6IEZeSvEa4l3BnE/2
	OEjYdT9JlAECWZPbfuJFgA/RWsasXSFM1vNB3k7Yz3sy09oDnLD+iA1b4HJAkbhL2nw==
X-Gm-Gg: AYBFou1GS6YCrEnuNsXquMcVwby/mXR81BRXoLLK68gTv26yLt/MrZDlscKC635Uc0U
	JtgrLm6g4BYaQAm2J9m/44zm6XCD9PcGxwekY9dSz1h9ns4oCpr+j3EozVKm5+jbKtyFHZaLQaL
	87tA1xCQ55Xd/lBhcWC6XM5QxqBAQxJ3x6/P6BpP9En5g+fZRublxIwXkLPFpkPDxRDvJ0ETWoF
	bXW+ZasDiZnD7Tf/3mDkGSDTBaAJg9VXo+uoaOm4wCoUX2Aq2RU2qD4gNCkRS3ZN55K4ILH5wHJ
	wGJkSSfa+m7UrYrkQLnEDwtzOwNYp1cO2LH+nx8TtzZyDyTNJM/DCwTNhnwbCSOfCwjY1V7WArp
	woRluFfKnsyC3yngqLpPhXZQBbAN8hnJ2zRBDtECVUhlwwqtM8PK5Ny+ACU0yaQpuESLToMRS7j
	TgIJZwv0uwdQ==
X-Received: by 2002:a05:693c:88d2:10b0:369:f0de:259f with SMTP id 5a478bee46e88-369f0de264emr2953208eec.35.1792898247465;
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
X-Received: by 2002:a05:693c:88d2:10b0:369:f0de:259f with SMTP id 5a478bee46e88-369f0de264emr2953170eec.35.1792898246942;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:21 -0700
Subject: [PATCH v22 02/14] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
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
Message-Id: <20261024-kaanapali-camss-v22-2-7da3ea49c8a1@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: T58QfPd8LjSybbFDKRvB5JRT4hcufxGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX0RCqPImO/AiQ
 E/ZgWMz14SECQkOlWa+zN24D+1HwewiqrExquMY+P4BBoyClMvaiEtmM463d7YlxXN4mb4rQ0yz
 jl9Ri+JaF6mJ1mBv72wWYc9HR9OzVOFq9EU9FKzkKM0ZOL2WsuBCm8mQhOcCeTS4WQPi4a6dG9D
 S8nvJhKFRfB+h9vTTobOgUoYNa37NAMRjqzoYzKEbJl9WQMDvpqcV6xiaoGlBJNYYS9F0cIrIsX
 m3YKGYOhctgJnJYQoZmSW5MaEmg48YpcXh6n76AUSSGOONi9PZHGj6YKNoxZOHzuoh6DbPB8ZNv
 u4irHqgn6u/e1h6uCMXSh+sMn2ArIFjXjUxB4PZLl98Z6HnXbpwCAScJNQCOIpH6PQKcfVJ8CXW
 Z9wPcEWQ4tihxzqmYANnEbmNusmNmZ0VJi/5soBn6qSgEMfoih1834X58dqTFHFlrAnjBeBv2rb
 o7XdqKGoRagQWFKyv3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX4JypSEvV/Y67
 OYwdkmhFcYbORYwJfSZCgFoEcLgEX00jid29yDFdzMkHtHPG2+6JXrqtYvK60xq4A8hqzRQDIPC
 L3Tle7qOSA1p2gm7M1oeJIdCui7x+eI=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add74c8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: T58QfPd8LjSybbFDKRvB5JRT4hcufxGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250012

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

