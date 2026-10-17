Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D753C0606
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257222; cv=none; b=iZLEXswUOa0Z1cRdbkQM4TKuQpqjAqxd93B4VzjJMYWVtYIYoKdSUE+OANXdfP3jVJw1kfBaCLbSGna3A+M4cygKSEcLfkc3WwVveUZuLbUjJO4wVwYC74r/1OLLQA/y5J60/2QwzJFDRaG7hm0dWQHe248tIKZL9mQRBOGnl/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257222; c=relaxed/simple;
	bh=EI0RYsZ3yOnKefVjSeOVmfm/PmjAgR2/wT5sSGJujcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1SsLpFhTWiOCm1u9O2Trp9/i6Wkyg/1FTeJ4+ebTBJOwpZy1P1F7KISkwX8kjP3TX54uj4e9yY+E7A0GlX8TekqIWARZnlhJid9TEI7+n+MY4rG9rsrB4EzY6Jxp7OTe1SuS7D5/qVk8Fui9KQDvU5VCxZj4Pki7mpEtfAEaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN7Ou5H7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMgdw1aU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN7Ou5H7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMgdw1aU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA7hO1521729
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBP5FDgUuNI+IeQ3fpaNQaTXKxFW4xAkNLJmRGA+1TA=; b=EN7Ou5H7e9t8ssm6
	o0/BfNMfdK1jZXxwwLsBRLiPkhqegbihae1z31SMXRARi2ginadODJZuM8ZZ07zg
	gHw7Eip5eK72CoFCVJPpYodvCnL9x3v9jfV1hrTl88C4UZvUYcI56l5S4xzKqOme
	zKE48Dbh8FDGdeGOSRbUk/6oK4YGOB92ugbyWTvUAgVLXuxZqTjE9HBjyC4XD1Gp
	itJMgHvC3+2tWMvdo04N/FuR5ohOPFqQUQl4UuxvvQf59C3PL6C0dxrQIYglsNBF
	OkPB8Ej2uEUK+3vPzbaB3aKzSU5EvjSAcmH+bcV4s3uiGIt5JwNJLNmrcRsQTji+
	9KyZxg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839d4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:13:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a4d2e39acso115203eec.1
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257220; x=1792862020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBP5FDgUuNI+IeQ3fpaNQaTXKxFW4xAkNLJmRGA+1TA=;
        b=DMgdw1aUbM9C8kHTej6st2m0kaxesuXJGbH+oRyjEfLSN4pFAszQrp00W095w2HBPb
         wj/zQCL+7x/vgcEq5/p0up3h30q9o4EAS5VTxZA4N/SuoeVSAVyXK5UH6om2zVxT18n9
         xVy3GviK2r4ZmkXveKeUx0NGKwG9lqfwpHW80fYWRT2OVk1W1mkKBs7Kf8OBqtDb7yY5
         PJC0+dngZD+f4WU3YskumOuN+4piwF9E3NxRrb4d8xVQjAWr0yPWFInSUd/U5407Xe63
         25eanvK3GyBG6WG3XGruJlkDiD3L9sciTT/Tj0r5b3BkxwkUrGyjcOGl27scpSLjpnxU
         pcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257220; x=1792862020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBP5FDgUuNI+IeQ3fpaNQaTXKxFW4xAkNLJmRGA+1TA=;
        b=AkYnHpMUn6mu+N16dJMTP/HjF+Z4KNleyP1O3t8zaHw3DW81qYHOnBVyILVTwbFnk2
         vBkKw4dFZ/uh8VlYmyQCWSU7G3geCFTJ2a37ig0oUz5F0j7Whwt/RHkSCN0tL0UuiWlW
         RIxGIp3AVY1CliV9bERXI7/mS1B6dNXM4+/L3kW46+37MxboBZ5sH4H+PJdwrndOXukZ
         JQ2NDQyLnmPbZFXnDgagdPjpyXbiVE/vilq/PW+acG23yI+tLaGzQ+6nQGv1h/0IacbS
         v4wjoCCKaCspX4sl1ia1p1Z70XHfC5C5IYN95bEW9Qu7k6Z68xK2Ws6QUWYd+sKa6fGk
         su+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzA5ADMoYjq1UalXmaxqmYxd8A3EPZckq81UIfpWNXnczaFVwcT2QJhf4Q0XTYLGun7AJG3wkjPi+vWeg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbTgRpANr7inycjX/+mx0m/aTFjO8baVz9bsblQjIHPEpbLJhw
	Oapf+f1wrcMZOQejOWdakLR0ccX0H4jXDWmSBP6DzNRhX5uMS79ArzP4dyQ9BOdaEu/SWcgHxZ7
	md0ORlL6XKtO2awE1wg/UOEwY2oDDQZd5RJKD3CEauQ9FTBgZClaeYcNcWG5/v1PT6g==
X-Gm-Gg: AYBFou0ImoRCDMHPOBdeFSXDkiVAxHRzqCLLo9KoYx+eK52t2Akq5hbS/HZi8JCeZcS
	aby7yAcOmSbQmWMI/EwzPAsbwjtKH0RFPnqGxf88CeVLEJkk794hOJ2zfvP+GoZobktfiHNmDyH
	cZ+pNtoggpzTVS46J68/RGAUjEIoO9y04rb71hd+bv2cRiz9H6KBwOuM3GvQvVQVBPCt7YhuZ2W
	eN1C2HOk3X4qR/QzA8UAPx1WQibaO3m58HiVOP9azWJlBRXZIXaYtbx2DHwz8mxQeLWRwZDKJA2
	LHWtTMABZknFAzepfDd7Ti64BsHl5Z+OFf9eatmUFq6uAjh+zYzseXmDsxTvqcxSPYHUkK1P55N
	3l830Z6Gr35YztceObtOgKV8wR2K7vg==
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr6210301eec.37.1792257219603;
        Sat, 17 Oct 2026 10:13:39 -0700 (PDT)
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr6210263eec.37.1792257219047;
        Sat, 17 Oct 2026 10:13:39 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:10 +0530
Subject: [PATCH RFC 3/6] phy: qcom: mipi-csi2: Split D-PHY register
 settings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-cphy_support-v1-3-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=3558;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=EI0RYsZ3yOnKefVjSeOVmfm/PmjAgR2/wT5sSGJujcs=;
 b=fpg9uAqqItJW+uBq5bvinDXTzTn5xxS1LHLyIQ57YiIFj/XQiVowd/9ok6xaPAzKa3epF5U3w
 Cjs4AePzRX5BaoAk/paWS290Fb9mDhkOoX6rAo5sg8DVHBHVjHcmABr
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX43QCLAg66Uy4
 gOME1oGY+PtIB5HgorNNZapoqXDCOSj5Q4zOVunpkP6nqvtM0H0O53DK68t4Kp5dBHdM9ZY48ge
 IlD6kY6NaHUqStk/zPO8XMaVfeRzNbc=
X-Proofpoint-GUID: NpMMSuF57uS5TQCuBu8at1b3n4wrEVxT
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3acc4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sk60x3sEPLDaefoj9B8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfXwcGjri1YMe/e
 C5JkjG1AFAp0OizeuzKkrknMDVl0yAjKRVbPKDIOg6PnxpYIbvL5nv+hkMdzwIDMKZrOY8LWN+F
 zkhmkCcisX0Kxw1ljZLBEscqWOwZ/GrbZOkGrfDCz6jdj7wmVLw3YkvInddXdFxUqWb3LBlHT27
 astZdx/+LK1/FdyStZ5gsi15oQXr5w85EBBazT7HBAYE98Dom+xMF3kZll+7VZ1gqidJZY1vZla
 3GR7azDj6dYs2YS7GBI/a7TB7T38npiU9CCNfdSj3LRaAvEsVuPn3A5nzqbbt0R+kCOHoP51IN/
 PQH7ISuUvARDINQk5thNwA7htdJ6iVlmcbWnF54PS8k+V6wg8I9scDCbK0IQK3egs0GIDOsX+gc
 1nUwwHEF207jkzJokyoHX83k6XBKwuJm3PX+Emw746YVeDroOwIn6/rj2U3TpBGcDWX9IZTs7p4
 0rQtltUysu+Foc1cWBw==
X-Proofpoint-ORIG-GUID: NpMMSuF57uS5TQCuBu8at1b3n4wrEVxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170068

The register sequence storage is tied to a single init table. C-PHY
support needs separate D-PHY and C-PHY sequence selection without
changing the existing D-PHY programming.

Wrap the existing D-PHY table in a D-PHY settings structure and route
lane programming through a common register write helper.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 28 +++++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  8 +++++--
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b21e1a235b8397c4c84b25d869427..79c7fa57d059b29f2f72a0c1208e07115b3fb049 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -241,14 +241,12 @@ static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 	return settle_cnt;
 }
 
-static void
-phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
-				     u8 settle_cnt)
+static void phy_qcom_mipi_csi2_write_regs(struct mipi_csi2phy_device *csi2phy,
+					  const struct mipi_csi2phy_lane_regs *r,
+					  unsigned int array_size, u8 settle_cnt)
 {
-	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
-	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
-	int i, array_size = regs->lane_array_size;
 	u32 val;
+	int i;
 
 	for (i = 0; i < array_size; i++, r++) {
 		switch (r->param_type) {
@@ -268,6 +266,16 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 	}
 }
 
+static void
+phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
+				     u8 settle_cnt)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+
+	phy_qcom_mipi_csi2_write_regs(csi2phy, regs->dphy->dphy_init_seq,
+					 regs->dphy->num_regs, settle_cnt);
+}
+
 static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 					   struct mipi_csi2phy_stream_cfg *cfg)
 {
@@ -369,11 +377,15 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
+static const struct mipi_csi2phy_dphy_rate_settings x1e80100_dphy_settings = {
+	.dphy_init_seq = lane_regs_x1e80100,
+	.num_regs = ARRAY_SIZE(lane_regs_x1e80100),
+};
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
-		.init_seq = lane_regs_x1e80100,
-		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.dphy = &x1e80100_dphy_settings,
 		.common_regs_offset = 0x1000,
 	},
 	.supply_names = (const char **)x1e_supplies,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae00737047f2d0384728a9c98780851eec05..528e80109c2f96b8c66d989ac834e30e7b38c732 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -47,9 +47,13 @@ struct mipi_csi2phy_lane_regs {
 	const u32 param_type;
 };
 
+struct mipi_csi2phy_dphy_rate_settings {
+	const struct mipi_csi2phy_lane_regs *dphy_init_seq;
+	unsigned int num_regs;
+};
+
 struct mipi_csi2phy_device_regs {
-	const struct mipi_csi2phy_lane_regs *init_seq;
-	const int lane_array_size;
+	const struct mipi_csi2phy_dphy_rate_settings *dphy;
 	const u32 common_regs_offset;
 };
 

-- 
2.34.1

