Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8A3C81B9
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609490; cv=none; b=shUnJXqSCWZ2DwP1+daUrlKv4nX7fkh61HVQHYJ+N5foSXiDUT4UbxS6d385wR0fwz4oZpnb3Imqk5iZ/jt24UwwfyI0/3+68jDpwV8hpetqfTFyal5nIQjEEvoc3F9YiLTHKzwnR+aHdyyixzb/GXmIptJXFC82/Fzx28WTjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609490; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JItvipDB/6aKxVRU09SMQZt/WjM9ZBZJM9gd+JJhpEr2+gQm2uvic/sp6S7sIHhoD0erzuXcUeFJ7UJ/vtdvKH7+IGpKePwHuLmpgTiORJyDFc98Uo7iemZyKSzMYW3TvQ8pQ5KP8G981z6J2zgJFVFe/uUqdD3PjDmCYHr1Blo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLiiuD24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIN93pad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLiiuD24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIN93pad"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCSIb4107055
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=nLiiuD24OAP0YSIR
	nWHNwFB1a+P4NlXRrRNMCVV7m+oLh8JJW2CLeZSe3/zc4nXIqFZqe/QjigIOOona
	ISMzsfAq66kP769hqbFmy6Fkt/qRKRPzaZcijB4lD2A4eOb16nrulsuHV8kjDB62
	p+OlrGGfdGw/BKeY98I12tVVE0VdxITiNDOyWijgeClP+5b6Larh+8Q6nDo4KPfN
	o2l30/0aQWsxAAQWD+W9ZvV6rkWvDycQOmpwwplhA6Nbi5x8N/Mtmwo9tFaP8TZi
	s0EcFPzQ1rLY+dQY0Mtn8Xe91HoX50yHporiZAirhfLFy5tE0h2+85DzpQA+URwc
	ivj0UQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn94ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e667368f0so4537549a91.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609488; x=1785214288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=iIN93padqK4zc8ibHVsXBngTvrBIk1X+uutweH8zMJuLYaRbLdBfdPHj8b3ATLpRiD
         wiG6ayTRNxIxHqXbCCYuvwRdAw4TVjhlp+JNJuox8rlepP7s3ID376P0ym5+uz0erGv+
         e+jKSl3oyKNxvgtrFLqgdBRNcHxfnSPLyUJ1Zgm2/A/3NlrJ66zo9suz22G0nToOflCt
         Zk4HOlxVUvOFNuebzqzTb1v5vFt9rlrYHQtlUS4DozDGC+ee6H3kh5572Jd6w5xHskz5
         3invbTrVgOPZh9I8K8CTrxyV83hFPoJBbKVVh02mFcW13KXiLSDWJ4wOQEbbCNHPMa+e
         yRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609488; x=1785214288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=tB8WKKpMi43yOx1FLi7wcsd3JeXSkJZivE/7QiUt60UynP/Fed5iab0jF/LBLQIwDJ
         GUdWjRzo+N2FQWzqZc8O16nptit5wooR9pSjxl5IqDHoBbv46+H1I+UaIXWyQkHScmAV
         fh+pcmCNqn3KM0SLLUsOINJb+YBcU5+ED5AHYH9tq6FI7aNDX7MjD7WQDuAub3VBoEuM
         UN2CqlNkAdmNHgyO7uX8oA0PQZrfzffE85CUUuSRTTKgNkjr6kCZ4iSkWQ//Q5Z0980T
         Kx6dW/05DYTbYI7swDLAp70OUbeJ1LiBTYCmPzl8pSN1szP86JzZ2BN3fl/UtOxWzO5i
         HX5g==
X-Forwarded-Encrypted: i=1; AHgh+RpgIVkRTyh7PiNYbqrQRdNE0BGhdwG0tkwq1dJCu0Lwdi3iPWHW1Z2i/KHxt18ArcaVg6TcwV4ouSAFTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIl65ByZPqqbz18Xno8bGvovRZuAOA/3bQyEuacKw32nM75rMM
	GBZygCQVrAIAtywxezcTYE41tdQUOQ4oLUtU4DwCzuaFDVkGM1djRDCqEV1gV/6AKW0XsaIdl/Q
	M1WO2GTVyIA4ws/1x0jk+F3ZycA1uLkz5X1DpKm/KqAImAWOmjLO8tSl6QUyQ8jqxDbyO+k7psM
	is
X-Gm-Gg: AR+sD10b8Cv8n9Q1ibhDLOMcTXX1wx/r7ntsPJYV+AdtI9ZbZErrbrlvcc+dq4v8fe0
	/7DhgGQv7ATSyX2EAtTR7xG8j3JXMiWtupLbxaj+Ma07Mr1HrnsbEHyomFZ+tFpZ9hdTk/YrlKf
	RFLMQe3WsuDuMmTQ48AoVwVJYuJ2zvFbL93YsqepufEkZ/++0I/4EJNdokA05xyLwLZJQm3TKN9
	gqGpDU+36/dBo1wbAH/NKldkxXfjPSXfsVkRwsye2msfcUDzQR8axZZHMi1MnhWoKkkAD7Q/BIO
	AvgydES7CA83JZGJtjCHvl3ONQcUfcQ1i2byD0dI2ozLcyHEIvGr9PfpARfjwlw3sjDn568PW/K
	K8ithM74Vhr6zdanKk4aCnP9tl4Ne1LDEIugH+0Tkr8EpX2cIKAG1oPM=
X-Received: by 2002:a17:90b:54c4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e4b3e133fmr16105500a91.7.1784609487504;
        Mon, 20 Jul 2026 21:51:27 -0700 (PDT)
X-Received: by 2002:a17:90b:54c4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e4b3e133fmr16105480a91.7.1784609487041;
        Mon, 20 Jul 2026 21:51:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:37 -0700
Subject: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common status
 register offset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX+ZkmAqiJ1mjr
 q6LvXwh55BaTJKMCnoXNnxZTMCP5Hj5luks2fGyseoqMahWKEVVqk3P+j8RYweA+VFusXSfl3yS
 iSHLqfQRj5ExN+M51KE08o1boczPzOdHOwQ4PiUYn6i6nYzr9yqTFyuDexMwFi6XONKI3RC3qVj
 bnpQ6xJdg7d+gk0KhwewG/mC6fbPOay5NEh++yL4+NtscjK2dRT2iFUXGEfOIIJ/9gR2t2bqcy/
 4/V8GpVxWBzfy7ppW/iY+xyeeBFIIkueW5IjUO2pk7SkWeioOCKt/VetZuS1kYXuMvFD48le2it
 1LTPzv8sOk/38mjHc5HNHdjKGtxCTPLJ5uWDZEXop0Fz91binUnXTCRghJ+jDMRYsqrmGctxzeM
 MNEZb0vxgIYcRSQzlluRrLTRhmMKEJvLdNvVdCfpPbaYTyps9czDPNYrAq/BMQ4l042kp5wnwbu
 QVgPWw0ABNfggJAQoaw==
X-Proofpoint-ORIG-GUID: 5F7iDW9xNKmSp7Ja980y6CNd7U3SEd65
X-Proofpoint-GUID: 5F7iDW9xNKmSp7Ja980y6CNd7U3SEd65
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5efad0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXxlAsnU5yRLvx
 WjFXzKNjFvCEKy63LdV6AiNe3yR6BRTfrezjouVirLd89DqlWPUF9SSP09hBpjCaBwvldsSB953
 9Z7l90zZOWPguHTg1lYMvV3goWR6zbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210046

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

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

