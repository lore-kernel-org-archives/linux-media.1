Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D04AA403
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648091; cv=none; b=WCkG93OF7rOS+xfTbzJ6VyLsVSuraIDCRdHQuVno/mRHOdLk+2z7fhxVx5p7V2jTIZyQnap6VxD9YvQ+fL8M/74WdY0l/565qObcBUZb63/Tu84Tq5PSAarpv7m9iz+DXeDvLosiwdlAdRpMbcv7IGNWd0oVMhchv/cjKinhHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648091; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4294gr90iAavzrLOjFz2cofIfBiAE4LiGJ5ggM8hIK8hMZcTsdwWqHsgfKFVHn3yAMbRf/81Ho43jWvLWDVonabLTijQvbtRMXImvMZmRDec+cUbpUnofaQqVF6n7olK0yD3FAh8w0PK4qkLvKT2VPxNWPqxG4k8bc7DsVIk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0Uzha9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/PUxCUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0Uzha9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/PUxCUb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPVFQ4139219
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=R0Uzha9/vgKV7ivq
	v0xrQYGxks2tZH7LDHYAavq390OObotO9tImU5TYniSkj4VXhM3yjUcMlwsqEoRE
	jmiEkZyPoivDU0veoFClMDOenHWJBIotTGRfQAxp6yxyDKEps9Q6ojj1uf5Ne5tc
	SyaKbElMBZbdM53Yuj+K5v1+BI2ibvfLmbSRQdiT6KWBYR/b6is3O4ulrglC9rel
	iB/UQP2P7lQgIrOdKY2u/zCLVqZUIaC5MPgHUuTMolz0HUSIFDDqfDpOLke5+HBz
	W+sA9hnvTUumV4lXtnRaLLK+IwY3OshYqXsQ6bOllfAAM3l0WL6oCtmD3Xb12/lK
	g3JFmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dr7ha6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 16:01:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-358856e5105so2687042eec.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648087; x=1792252887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=d/PUxCUbCOoNAFClRmLJ5rXZ5SchrmEZXrTPeamjhR23l3jOiLt7SgRkGmv1h25RKO
         ZFbngQLQWE2BqfF36LSXoVLUhMRVGPqW5/Ob3txwsn9j5rWXqQFTn7ylw1I+avJ4Cdps
         tLEYES8cmgsCtrDKk3EXmnzlt/PiHoFzPAlxTU+Esf25EqCTAclUKiwjS+QsRBNM9n7K
         yPhOnsNl8UzJ+trW0o/pMO44VP4lMDR8VeX9+8gbrD7tldcB8I/HV+bO1YZDHUJ3qm1t
         1ZQ4HCJdkXjuSL772qq7rUGHGanv/HkWsXY6IVmbelPU5l7mHoyi2c0qw8V0zh0klMSX
         pqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648087; x=1792252887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=ruXaCbJ5gG7Jobu3+IoQA/xgzQoUmoCB2azIO9dy+IzhtZGqizVgj1rXW32UjOY5hg
         hyFRnDLIKvdyYTjxIWphe1SCTk7Vda0/554+nanRHUP2WMseLg2c36DrGB/O5JWw/Ce0
         qJOlrg29dmn8ourF0NDAna3hK2cIJ+4Dc0prLyznB9D4ovxpGdMHfK3Ys1RQK3lx5cbM
         c3BZ3J/cH//2gQCdcpcC3CS7nhkTLn+c5tgw0yaMmRnoayoNlQejCPedRZyDiNJNpwh+
         L7xc9zSdLeTMInq7ro3FKJnYmiHNegg6nN+fgke5D1jAb69mPuxEyPpYStiHj074+34+
         tidA==
X-Forwarded-Encrypted: i=1; AKwUvBzQRoYf9SEezYOQwci3fWc8bM/V6qvDig2l6Ore4BsXJ+Evo1+WEkHN15A36gOAOUNtvvcQpDTWqxu+AA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7rfO/N6iHjosin8p4YI+XX4LSp+T357IJG0xNaoahY30XQToV
	e+dd7Bb99v7IFxjsdqJplLtDaIytgNMkZ+GC8kNFjwx4LNxKZVrp5DYo3Z5Tp0oEyUHaKYoLZ82
	iUSudNYU/Fkr1KFX2JcvjnlhDb1Xd3W1XcUC/8VvjHL/ObSITxN5XCZPcjaPRH68B6A==
X-Gm-Gg: AYBFou30jlyUaQ5mzel9K73JQhd0XlL1yQeaVglUMnN12lm6q7b+9Xla2SXJEedbpPQ
	CQg+NxTMvX/YerJE9WA8we3mv8Cy9p8fz1ZMaIY9k11F1dSLRevMlx4TR7uLDowEW1c6dSrY83x
	RJBSVHB/YEYhJRdZVQojFXjZYzCDadRRJxeOsJWCQWTCaDXm0KyQfzkPCdWljrNqxTssv4e4ONc
	L0G0iMkNZMMvknzYYqrrMIjak4Mk5jswWxVBflLMBS8sRLf+2l8EinnYVcVHmTE0JD8Uw6bugRq
	FXFQ0jXr7iqeI8oZEFsE/pTzYbM3UuEQHyyTdEBWA+SyjkxuYi7+19+o9pE2k0rDIAE0KU5HBwX
	OGwFGziH3S8ODrpZIAFj4SkrvuqYH2iSwH/XNP89tzxIr4MaZLzsTiBIEz360Aq+Kg7SJhU7g5X
	Uygla7n+T0/w==
X-Received: by 2002:a05:7022:150e:b0:163:bee9:b250 with SMTP id a92af1059eb24-16a5ef287c9mr7218580c88.22.1791648087102;
        Sat, 10 Oct 2026 09:01:27 -0700 (PDT)
X-Received: by 2002:a05:7022:150e:b0:163:bee9:b250 with SMTP id a92af1059eb24-16a5ef287c9mr7218506c88.22.1791648086344;
        Sat, 10 Oct 2026 09:01:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:10 -0700
Subject: [PATCH v20 05/13] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-5-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Gfr2WaTrJblUmbOzHAVKTASCr-bBM5Jw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX2V7RhkuRSArj
 jQsUS2u4h1XHypi/jrOo9ZoIFN8wYz/ZaVOeZb8sWA+VPp+89rhhPmYNc0YbM77ETiPU7Wc1sbI
 ZyOLzXdSotPbEbbbdr3QnKVnyDB8Nzk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX59C7VhUFDrSg
 EdNjq80bDl2iBhXvq+JbfaJOsZ58NKqO8yC0lWyGruXNqXQzFukOyC+6UI7JCsdW4w6pKiS0i+O
 nY9lRKLPFXxJubScbPEu/yeRuTx4l23xAa1sfbBqPMa3ReBcrfza5CnHwgALoFMfsqJ/CYthRBt
 YjYasTXTsC+m0RXOv3dBoF0wacveWqYbMezXokUHC6qpL7RLTy/rRKYUVcWNGWKUkuNzkw2CC7Z
 JPBTkczXFPf42G5xNbNf0pqYZLj4o/U0Qc+NnuG6yO5axBQY0fJGh+bbMS47uJmL5ji84CZIer8
 ItnaRiZYsxrbY6ihQuZnivI/Y2KJ+TDoucBRlovVpYcOg4G/UWRQkitCirqe6/Y+ys8yeQlgYVj
 SigfU85nczVdTW2hY6wF8U/3SbOsTip5qv3zON58bg3XYGb3+jNl9xZPvxyVPToj7trDyYK/U47
 i3b3eO6ygzQCoXqVvNQ==
X-Proofpoint-GUID: Gfr2WaTrJblUmbOzHAVKTASCr-bBM5Jw
X-Authority-Analysis: v=2.4 cv=asknmiZV c=1 sm=1 tr=0 ts=6aca6158 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..fca3de214a92 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5810,6 +5831,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..0551211f7948 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

