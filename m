Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCEB44F578
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648088; cv=none; b=tdvDHibz2iczTz5lNgHEjPEIE5cIK3J0ZmK41XIuenUe/NDMauHRxbqAF6IpNbN7Jf/KuWsIAR8PQ1RDQIpADfJzHjWXicMKqETo8m4qOfytUF1BTvfd/g8rTlCWUTUmCnlXgYa+FkvNQsf7qGSnJ/ZZ/w5OyIJRqbsKW3VCgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648088; c=relaxed/simple;
	bh=ZHkg5zM+lJIOFrCLJ/Suoj+HX48bpaqLr1WZJ5FQ+VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RazUxpesoMJBW7sk93esOTDNo34P294OESDbNtc+xMDdLCX9eOnL4MCDko2+3pb7DoQogpE4q4oAwtl8Crqj0CQN39Mwp+59hdkFBUOjmpH5ztDC2WcZph5N+lq/y+J23zWBndT9l+w5+ZQOJgS8vD2ElHAj5KOhW+sZlcX32ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoEPxQSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+SfDGdA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoEPxQSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+SfDGdA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFQUkb797336
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=XoEPxQSOXzlZt8AX
	bMjFxRlBzJIsWvtrk4FAEGUr0BXAoxNVSLJaLI+V61pulY+s3WkQjU4+0wobLa6Y
	3bd+/6PGJms1vWYM92ck37fCgU4oORi1H3cIrrJO0pieC+SwMY9VeP58YQMkNHVM
	Au5t+9OWyveLcjImUTX2+/Y6rCHTr7bcD1JWIpM75VELbIsxY+xyIDIuiMWN1SMY
	qGHFfMGaMR5/EcPRUBzJpAv7xcjK2BK+oEZAzaRlOMDZhueVSkqmzsfNQcN37sGG
	5F7P/+XTesN1Vt0FVY8GDT7THpPeHnfja3wbZS5ll399n+1tU1qdWBm7Pu1cF5S1
	0XdwYQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsr17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35158d674e1so3055839eec.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648084; x=1792252884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=Y+SfDGdADLWT+3iuSHKBLnEqV+iemMSSwXaMpMzC5Rs94GGbUcX3rWcEyMH0MD/kQg
         bIFbvZzoh2xdtYhV0IjIrSs9LGg5+EBcySFu7gQPhrRyWfxsA/qX2TBi2XbND7hr7FIk
         sfoEhunsMZppj2G+Vvsa2TpfTf+Je8c+ETnc/R67WSHqeq/q/EWGqaWxO76/VrMgTFH/
         BcSgFROzg5U7VBPpjejSYfGo3R1qgVvpquPOdfCJlHjirhFJdGSdCHi43wEB7XEM2Xh3
         2VMDcRSYOkxSP6gp3JGNpNqkoDYLNBqXUOBBU2DJ+zeqEkJmzs+3vQOXmpI12F3ySlVI
         jOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648084; x=1792252884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=tA667gDKuba0b+WL73OTJuvdlHsKQMAQ5ClEum3YGbnZ35V6/i/W8xgwh5Z81tYqVB
         5zFjGX1jH8M7xPYJondCZACnxoga3DqlAF1eD2d7kxWuxw+UYzCtorjSt2rHLs1zZfoW
         A7AISnEweuUOZ/fF2mFohYxUPh7k9nRwZ3EcHysrlzJ1bK4aDpX+usWIaEOsE3HVhTYm
         wYIYFknuVNCRBHkxAT0Z149Z48TgOpsRLFBRy0SoJLSA0UmXU4U1DXul1meOD2XiEw9j
         jErS/B80LDcVzag3whDSlm8Ft3IkMePbHUlC1I3Joh5dKgS632owGLoB3ek4yDWlrHVH
         oWfg==
X-Forwarded-Encrypted: i=1; AKwUvByTLFGqn7hy0wlNpHbqBvjLr6akTMlixQG2OCJdTMOf9Y1W7fSoaAFyqbJXwvuh7pj5eRl+9WiyuqZJ6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzvXlzgKIJAbW1xEE8HrJ2LDf44oXcWW4P6xtz767AkcT1riM4
	yhtAZTMlge+7erIG8qVlpaLB6aLX++jX3F+Lv3tatuoA24NyXx5GvEn+uq6NZZAEtQkWijZKvuF
	JHGrey/iTGw2ZEI298RupfLyYbg8PSpZtEUhgaDwobPytN4as6tTk47x3qnvHxwwcFg==
X-Gm-Gg: AYBFou3f+j6YdMIONwLBWfSpZ8GcdvgY4WreswKCqY7pFoOwDl4Pq7Zt5jteMLovxHE
	NlLxNMYIV65/VbN666K7Y94YBJlzfTrrdWIxIOQlyzta+fPbrRiNJ/Tl8hk9Ywro8QRjpgEQsw+
	YwujBV5lj4rSR6OfBYe7AFbWMyfGNop7boGm5/of+wILhNgrmj+VQFLyAgaq1uFdgRRJ7eFyBuN
	EAyxnHFk41ZFmJeO2zoi0fUrC4ZFBdIZOUzZAkrXAhxKpVkivR5GI/gQfQNStqBA1gcJWBpXd0x
	eNpPDozGN16pQBxTDwSu2LGdRhO1X7JM1YXPLUulj0kKD9vd+o7WWZZlpdOAQiPlJ1lNjDokDrn
	mn92UVv7aQ+52NVQjMnk09JKek4+BbJfS3Vcs0K7IXAjh36kDd3ZUxY1iasPFpbJS9qalpB1lCY
	9gc1QHASqpQA==
X-Received: by 2002:a05:701b:4583:20b0:151:9af3:1beb with SMTP id a92af1059eb24-16a5dee12e2mr6475645c88.10.1791648084237;
        Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4583:20b0:151:9af3:1beb with SMTP id a92af1059eb24-16a5dee12e2mr6475573c88.10.1791648083488;
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:08 -0700
Subject: [PATCH v20 03/13] phy: qcom-mipi-csi2: Add Kaanapali support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-3-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX0NxCCIO2YUPr
 h9tIb5T0EaXstykO5IWA0HzIFrPnHN1aw5kRf/P50X+2pk9whvSv3VHAY9PmGavstSqiQPvXUA1
 pEZWk//SbUFn0xSJUnZN1K3mkMaoK5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXzQgvzs1+gEFF
 wuDWbbxdPxuvVf/Zu6BLRdcvrj9xQaJpgUr5UznwiPCKdKbZchus9lrq7notvAEwaArgISDY4jZ
 0wheb0f316xa6t8zqyFfjHSAQwsRKNvBuLkh0ggQKPDZJGvdCJLbsSnlBNj4ATotM0+M3IgdPjw
 ByXBIXymkbyRyPe7zc1CFAUtLZWICAO7EaPs6/gKNGS84Zm5yp57f3xwgPV+G8AGmRS2EGrbfIw
 C5pNM1Hwm8pZJ4F+oIHe4Xf9OeJb0ukH9ear3mbR0oXncwdyu1iJ20TZetZOV/GfXiRbUTXkOP5
 My24m5zl1k7ODgYDzomgExvsH1Hub+ELw1h1iEXQqg48Cuhh7m2jeRE9A0mkRwecP2x3364aHV+
 euKgd8BC+2SjDIjYz7/aO/zo13hL7yuk6lBb38wOYusl3emOoCaCFwNZaut6utOve+JKfLXDH9B
 wHYqXiMBjRWGTCCMDSg==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca6155 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: N85_XCOArLhIW3DX6I-2LrnRx4kf1R_J
X-Proofpoint-GUID: N85_XCOArLhIW3DX6I-2LrnRx4kf1R_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

