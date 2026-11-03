Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742075;
	b=HsQMVfRLMY7XU+Stq03ufoPasd4MED7+3NaBNiHDZ0VZi9Y4xFkeSkxiSQ8R9sXbEZCU
	 6r8KBrRu2B7H+FveZheDVqK/T0h6nGSJEON6Sa2wW/B3j0EjPY7S3d4N9sHZtxXlGFl+a
	 3her5BfvFfLJcc8y9kjsqW8q2Hks6xbmrZlqo26o/5LhTzcFgBAkNb5eDeu2U0SPfC6Nm
	 p9Zk9r8KtsWBRYRr76CSjXjGJV5H9sgx0eGoWfQIjJoZeWEU2WbLhIHW2IJJ/YRkr05rT
	 bVIWr3h8LkXlbi1peI4NY9JjbqZ15GwKKX6j1EaF9kYs2KN6ACD8W4NzGyQBt5j5fzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e5XJzAZheTUK3ukVKAe5hW931rUhqzQaFtTqIg/u1EE=;
	b=DFmI6BNrlwwQ/ojn88KiT+dYNO/NxUSRUWDaj6sp4AmbGx0mnAzwsBPQuUG5iHNvjN5i
	 7s/c+ZHLsTLUJ7u8BRvO2UAuRyWRMW3Q9GI+2jFU/R2mt5kZyvIamNGgXG0ERSsuWof7e
	 jNNNOlLse0eUcCoyNhTpVD1NSbeQknfPNXTgF1pnw7FhKuUsDe0+p2dxH4rcCwj9ydX0I
	 MhjLomjolFeEXT/dv67zlYGqFclyf7uQst9mFGTqrqfrhjfP2Q7ApFqlch0TMmtho5+/D
	 nk/gnwTTzzIx24d68JAGffdSx56nDgqsfCN/JTS/0NonG0dZYLALFxeKONlL5Cq4krA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MUSA5ECx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bw1hU23j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8E606EE81
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE8E606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MUSA5ECx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bw1hU23j
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL5Tc2944212
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 21:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e5XJzAZheTU
	K3ukVKAe5hW931rUhqzQaFtTqIg/u1EE=; b=MUSA5ECx344MnqC7aoCaVRXDExk
	49SOtf0a+DUIA8ezRgONZGTYdcKkKx7bUrzsRsFX1MakZYK6NrM1vvVfZjU1CDPm
	qO4/GIFxRFcXsRM9ZlQeA2CZHRu/Fgx9xPv4P56Ul+QHjTBkdasNrhLIPjfX2X4f
	qKUf87Kptsrkc153J0BgdKMYa0tryfVdSsx08jSqYDBSft1bBZ8FakFEiXb427bo
	A+Of9MWhR0cShJeCvyeieicJPGyXUyN0aQRaYpQQ3qV32nNcZVVrsMhDEpUO/Q/j
	V0TbvNwjAN11sfHWo5A1+NzntbRlMLyTfbq314TuUsILnOf89OynaLVTn/Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrsa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 21:41:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ab289bb41eso746959c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742073; x=1794346873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5XJzAZheTUK3ukVKAe5hW931rUhqzQaFtTqIg/u1EE=;
        b=bw1hU23jRi/nS5HZPHwdfGjOUfWMsSEfE54SHhmKe4gi5vxUIyP/JB7KWlb/7MSO6j
         rtIslxh5QcWGrjyw5hWkXKdun4eWZTjERT/3x4eLADEFQ2y02wuZXpSAatiZ5ziRgce6
         eLA0z7BUoIA2Vt5g24s0uxWr8KkS18xMmh4QumnLwQMpsqYGDY5iNNNo6zhBu0Z4UhR4
         Fhl0/jeseTrjoMnMXmGmp4Ha5wbesbMh3VeUhoP6UCE2LnovX4jYbklgz+3Tqb3iOWE7
         n89m+UzJX2zH7JCb2LTjv9hSkMbCXI1gMFu2D4ya3eG639zrM1AT+puuXlgVPcUjUIGP
         INlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742073; x=1794346873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5XJzAZheTUK3ukVKAe5hW931rUhqzQaFtTqIg/u1EE=;
        b=SrJp65I+Aq7h5/0uyhCU4n6YtBY2Q7itNKdLBq41prhENVu0mIQYPFd3x32i2utC1l
         8QOoQmQdIXwlsnGyGoK1ENo6Qi4d9b1b0easIZR4UiBGFD+FDfQfxhAq+rjGGMoS+KiJ
         vsp9OtHoBw6kg4yH3mFTjpf1C9Cj2NXGAfObziPetp8RpQR8ikfPAT3nWJORhYlyhyeI
         Jx+ALKQ0o0q/7wZLPynPPhHoe9/ExSrg+RmpNojm9Vcvb8fQl97GXcgWr50Iqo6OwX82
         fDdplb5disXog1qY16pJiKGCmECqtvyMjTnT85uS2+Cqu+2nKYlVJbx23LBrLK2QZKOC
         IFjA==
X-Forwarded-Encrypted: i=1; AKwUvBxXdcs45UD2q4YjV+2XIHl4WUZISWCFnYC3ilXReVebilfWa7pqI7IthAcU8MliJTv+2Wf5vM+flphzMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z94HntJzY/yq8yDtuLP6AzjRTQigCdPfJsRi5AuVhM0PBBejSCI
	PwYfrmijrFyudrxLKMNxYlAM+jUsk7X9a70QRCr+I0kx6F2LtCbWDljvY3XMRMp+5sDmIg+JwBo
	O6yHYE9cQuPgSwXb6N5BCppFs6anNgPt88gZHu8e8t7tJxvLzkv0KBHmLgiEYCv9guQ==
X-Gm-Gg: AYBFou2OGW44JTG/DurvhFSEggbyH+WtJL7f1R5kWnHZJ07LFSLKVNn3SVsQDXLaK/A
	cADixIL/DC4HVNr9JMT6uYSEtBfcROeUK66/kitaUq2GIFsv8NksSVSo8JPYfq5rmsKd12nhhB1
	AsPmE2JwwTktT8hkqiJqDCqEDPq/fCNWaoeJA/4AIW9TI8MWPzTtqrTa/4cs5xuqeDQ3huYYTjV
	aCj5XXG1RofHOhJ5KnhNCzmOGcgZrdBuDiAAwwhyGt4qDO1yi1CxCfvsAjkITfnZVIFYgRqzPuZ
	ihQnjXaVIWzNiyFdS4MKCP7aSrPKXJyuXGApLGSRc0tT7yuF15W/P7CbBy0xF/KeloAzUGkPrNi
	fj9AcQf4BirBbQX2QDfd45tX1o2DzqvtcIuIhv2CqKGbVUnYe2AZGPC1DArDg2tGRZDAOt+YQAK
	ndxohAujR7qVEzR4mjYmvOCYuu+ZE=
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr20823042c88.26.1793742072695;
        Tue, 03 Nov 2026 13:41:12 -0800 (PST)
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr20823024c88.26.1793742071964;
        Tue, 03 Nov 2026 13:41:11 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:11 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] phy: qcom-mipi-csi2: Add sc7280 D-PHY provider
Date: Tue,  3 Nov 2026 13:41:05 -0800
Message-Id: <20261103214105.3605181-6-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: byTYH7q1Jzw8om86btaGvW7aKX_-8CdX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX8EHn/3jquzCZ
 1AWcFggq3BAILixgFMba4oiY64UaXsDh82qbX3pI31yAd72nbu11Fhx+HoXZTU+yCchEp0x2NgH
 tFapypofBSbZOCywKd1BP5gSFc8fZ/N3FKkZ0jaAcDirSorcmgyd7C6E+X3R6eUH//gRnjX+s1V
 S/PofceqQ5Aui+6AEHVMVpI2ClzkLB1UGQASKv7Tmu/fihE4HOAS+xGnaCnGb2ef1ZwxeCUew0l
 JXKptXCC2Sp63tZWk5HRWRx55klRyqHMWmprkTnLZhag8Rk8+EHYca5Ofj2JCEFCbqUHCvBzKpt
 gYhv28684rakSIwNMAe8zJ+QGMU1Cvz8I81S4gAXVIwl19nsyoRFPAIUs7CYsXNygAeeg/VdAZa
 kRvvbAoRCg5YMMzbGmzfTfwpjx7209cK32pNNSbrKLiQ9MTCzKjgQPQ8wufsE6bxad+c8L6kvGU
 lyb8IL2w/P1BjdTwg6Q==
X-Proofpoint-ORIG-GUID: byTYH7q1Jzw8om86btaGvW7aKX_-8CdX
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea54fa cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NbtrdQoedUgDOuZm1b4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX2A/b4/wp4uNT
 ocUHSJy54VrU2W3Wxj1SOsFmZrqyVw2IEC6BLPupkJqtRN+tF5qgzaH6od/KLcXfylL5zL7Yp/L
 DV/v/Y7KG8lvwGzPKKnSbjgqFXqcDBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030086

Add the SC7280 CSIPHY to the generic MIPI CSI2 PHY driver, 
bound to a new "qcom,sc7280-csi2-phy" compatible
and reusing the existing D-PHY 2-phase hw ops
(phy_qcom_mipi_csi2_ops_3ph_1_0). The lane_regs_sc7280[] init
sequence is the CSIPHY 5nm 2-phase 2.5Gbps 4-lane D-PHY register
set ported from the legacy in-tree camss-csiphy-3ph-1-0.c table,
with the entries that table left as do-not-program placeholders
simply omitted here rather than carried as a new marker. The
soc_cfg declares the core/timer clocks (matching x1e80100's and
sa8775p's clock-names convention for this pair) and the
vdda-phy/vdda-pll supplies.

Like x1e80100 and SA8775P, SC7280's CSIPHY core clock is OPP-scaled
against the sensor's link frequency via the shared csiphy_opp_table
in kodiak.dtsi, so opp_clk_name is set to "core" here too. SC7280's
CSIPHY has a single power-domain, the Titan Top GDSC, matching
camss.c's sc7280_resources.pd_name = "top" and kodiak.dtsi's
existing camss node; it is not OPP-scaled, only kept enabled.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 122 ++++++++++++++++++
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   1 +
 3 files changed, 124 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 3e93e0b49106..dc31c5cd1475 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -493,3 +493,125 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
 	.genpds = sa8775p_genpds,
 	.num_genpds = ARRAY_SIZE(sa8775p_genpds),
 };
+
+/* sc7280 5nm 2PH 2p5Gbps 4 lane DPHY mode */
+static const struct mipi_csi2phy_lane_regs lane_regs_sc7280[] = {
+	{.reg_addr = 0x0030, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0900, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0908, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0904, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0904, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0004, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x002C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0034, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0010, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x001C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x003C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0008, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0000, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0038, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0014, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0730, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C80, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C88, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C84, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0704, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x072C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0734, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0710, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x071C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x073C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0708, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0700, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x070c, .reg_data = 0xA5, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0738, .reg_data = 0x1F, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0714, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0728, .reg_data = 0x04, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0230, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0A04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0204, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x022C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0234, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0210, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x021C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x023C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0208, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0200, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0238, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0214, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0430, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0B04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0404, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x042C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0434, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0410, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x041C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x043C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0408, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0400, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0438, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0414, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0630, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C00, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C08, .reg_data = 0x10, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0C04, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0604, .reg_data = 0x0C, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x062C, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0634, .reg_data = 0x07, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0610, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x061C, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x063C, .reg_data = 0xB8, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0608, .reg_data = 0x10, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{.reg_addr = 0x0600, .reg_data = 0x8D, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0638, .reg_data = 0xFE, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0614, .reg_data = 0x60, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0800, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
+	{.reg_addr = 0x0884, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
+};
+
+static const char * const sc7280_clks[] = {
+	"core",
+	"timer",
+};
+
+static const char * const sc7280_supplies[] = {
+	"vdda-phy",
+	"vdda-pll",
+};
+
+static const struct mipi_csi2_genpd sc7280_genpds[] = {
+	{ .name = "top", .scaled = false },
+};
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280 = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_sc7280,
+		.lane_array_size = ARRAY_SIZE(lane_regs_sc7280),
+		.common_regs_offset = 0x800,
+	},
+	.supply_names = (const char **)sc7280_supplies,
+	.num_supplies = ARRAY_SIZE(sc7280_supplies),
+	.clk_names = (const char **)sc7280_clks,
+	.num_clk = ARRAY_SIZE(sc7280_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
+	.genpds = sc7280_genpds,
+	.num_genpds = ARRAY_SIZE(sc7280_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 244e851ff24d..26ee5d9fa4c9 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -455,6 +455,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
+	{ .compatible	= "qcom,sc7280-csi2-phy", .data = &mipi_csi2_dphy_sc7280 },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 5578741c0930..e2a346bcec89 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -97,5 +97,6 @@ struct mipi_csi2phy_device {
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
-- 
2.34.1

