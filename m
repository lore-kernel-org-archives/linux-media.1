Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433783;
	b=LCclrO12Ai1gbe6Odfg8V4UAn85Hxu6HqXxrRToE9J+lXwEk6Ya5QqcRfkM0l2LqqH9w
	 WqDW+45xJcG2EGwvAsuVIrUO/4+EJLTtg6WzQq+6hWp9JwTcrj9tRRcjKc/JdN99wmOKQ
	 64+gprwNCiEj9XBwmMYaojZm4YN/xokbNg9H4W+GnCVArYHa5UmBzO4l4LY7maVFwyBsK
	 h5Su9Z9T4cgfjjAMwBTR0Q9jPh1FgBuiF1xGHsTwT5F9taTrQJGMMdunxjyznuqWbMIjh
	 +sZG4KGxiFj391wV7Bul9QmNq1R6mkO2VsdNDijQ6leNd+b1sQ9vtxhkA26aQ9KsifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=;
	b=D5pQnPHrLALQFsuow/itjwDjD/B51E1aduVYFPNXmKBLM7U0NC79BPmPsVw28B3mY9Nx
	 sTX6R4oFIK4/JYwy9r/MMKAbLorupubVZ5FPRV9bZHx3vjAEZpiZRtP1/CZnywIeohhJr
	 +HXwu6FW4ukjQsPgs7ayfrano4FhKN8vJ0cy+ULigD6uFrZB7LIl11TZEXvEmjcEpUWFr
	 BQ2QeEMHG1hlPOlWWOOyz1/qGm+kVQY0+YYj5dzFNGEubyh10eck7anZrDGW/N/+NsDpH
	 vkqszbE9l6A+kDAEDLgQfkIyS4f92XP3xIGKx4RXIoQsCVUfL0XI9W0G7D6+8eRkfWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRjPo3kN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1KPHt3o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE8606A321
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAE8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRjPo3kN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1KPHt3o
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IYAX3490933
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=; b=ZRjPo3kNYEsuyS99
	wYBVguEEJFDJOZCZIdztuRb63EC+zsrBpgdQ6Yp9m2KNSeZyTes2lrsrXNnSC1f+
	8CYcAKqz74yCePbt7aYg4je8g/tEOC4wjTQDDEoVq6C+J8VXqmQy/PUBFU0M3SMS
	IcYimcSYIsaz/BPsjpukTew4rNyc/wB0wA+gkJQ6iLekMgfN2VMdnYwHpqMkCPTx
	VJJCSbMolssOGFHnBYwKOSS3zV2amVv1atNxLi+/eMGItp7OlflS1EvT2Z4B4VsW
	8Eu9iw8mnGuLcxVYtqtV88zSCLlQZ/2bTGZMAAexmXN793fkF6FOa/4giykc8cl1
	nDF/qA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshcw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b45655b428so2104560a91.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433780; x=1796038580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=;
        b=R1KPHt3ouzuXe+EQxncWLBCmJr0kiAVcj1EuNI2VdSN1iEdCr0kCQFdUeNOiis79WB
         +Cq5hlrURULXKZhAN8hNlBKEsSBLerv6AmOt1hT38d7pX89s+gaUomipdV078V/hp1tV
         bdFsslHT8W3GeO6yVesmXjeqSBt6z7DX61I81lJDi7rV3l4hMoywDD+/LbwT1hsIo/s6
         ZskvinQKBMG6lJHEXmy/WSZoq7End6SdtSeK2zGQ9UyETedmQUL1TSiiuEKeYw0aNfAk
         5ZVpGhu5PeSuPYsxGIO4TiVUas2lvU24zQAVfZbEcJQlQPbgnfo2Tgbs5uX1JgKnqfMm
         RkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433780; x=1796038580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=;
        b=zWKoBzxJE12tOAvoOm6vMEAPxTQ6VIuZT6iCjmi7tmBYP/ta9DFLT+qVlXI1yEZ+/V
         nFIb+VuDlw4obOHIbL1B1ZO35umP2UugF5QbySUmKcQc65n/MLal/vUSHGxYsfauR45r
         PEkO+c6CtLGK04mxvKe5IVq/8YUYH0zg47r/QTVyDkyf90fc3Jsx1xtpu3dRdFJjoYdl
         kPbGX3ZJgG7s/PYRzlOX66zJzPgWfaL3WOzC1myHPf0AI2r6bVwirUrU9dow3O14Hf4x
         Ge+g/pTP0KkS2qJfYM48YYrzMC5V/h0wKrd4VjrKcpqWil6Zlo+7cb/exL+t3aBHFan0
         MdBg==
X-Forwarded-Encrypted: i=1; AL+hErETt0K4U/K69P3rT2N0az2E9W/w6aXd56+rDUxhTXK36ouLnrVenoqDFOv1DdPTyuq8Vn/j61dJZvC2sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JpmZaDHQihrFwk2JDCWr7YqIqql8m7hgKTEkg5PrFCR6lfG53
	9hDiIXJ8+cfCNfojTCEcJWk///Ad5tHkDsn0+m9MUqOodnJKoFmX45UQYa5PGwcXAlXk+F3aPyL
	uHnFfRni1/C2EexRaRmWmFGGwi3J3ovmtocgm/cGoo+hflefZUhGmANRG0vMR7LnslQ==
X-Gm-Gg: AZFdTZfP3cAnuAfqo+wOxt+22MY+7NeOuVyFZUWn425rAUv5o2+Js85Z2WXsjS/SRlN
	hQ/hr2gkKgg80b1Itn8M1ONI91/UwQNz8RaW3B+DE63qpPbcbdBL0CBkg8vcbiqDvkSRpk0aXdU
	wrIjnRGaxBgAwQA3RvXOKvfqggBYeCnG9jpZDVpefR9EqQzCS5z+nT5zT+26r7SMHkkLs007col
	EN8DdHs7C7drhy+NvPOe4e6NEBVzfuDdtszkuQwv5s9ci2DqJZMcTOylCLE++HAM9LNo9LJoLsP
	J3/KVcAZzqMimoXSoCq2YUypco53v4pYQ1QNY7IthApjJfHASbtsXouaeNXHFratBHRxDJ6uBS1
	MKGLyC3olqpZXFHOd5I0jO251AIq//8RWNyg5I1VBSII2jHEGMCYeQ3WW1XInitPZfz2tx3Y7be
	ZkDvKu
X-Received: by 2002:a17:90b:3ecd:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b41c9e46c6mr10373947a91.27.1795433780517;
        Mon, 23 Nov 2026 03:36:20 -0800 (PST)
X-Received: by 2002:a17:90b:3ecd:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b41c9e46c6mr10373925a91.27.1795433780099;
        Mon, 23 Nov 2026 03:36:20 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:19 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:06:00 +0530
Subject: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
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
Message-Id: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=3050;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nyXhP3Ab+JK7/tMc0Dc6RlQW/cBCn+toktGdYLYMpEU=;
 b=+BIYIoCCyGBcMVks1nrKVa1cSnkcz/01IshxM4a8xghh6UQzv8JTPdUVrEr3cPI07EmhfawBk
 LOuj2Armqr5AjyqWN8XhK2gIC/45oDiR6YCmKxxhZcouTwBPksy8d/8
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b042535 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eFSy-WoeKmqNeFKM-ZoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _6blYU6ZEsWs1qETOOXWfxmU2PsZxiNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfXzFTLJ79bX7XM
 FGNvh8c1jQTc8rOLxZOlfZ+xXG6nxXfHXeokDSGB50Xc+c1wsVB6EXT/l3BGDrZ9TnwcZ5Ob0U2
 ihOBYlKFHiSIX5x1cvtXyMzummAGCWL+0MNb63yu1fEaXKpkjIzNSzJx24c2h4i9W/FR+GOyFeA
 lBokEkQFMPZ8BmBzTDR9XAK5mPe2ypN3l+MoqWdZknI4s9RR3FQLjiMC+4mPlFIHgfTZ+XwjA6T
 Xup6/iz0kifvM0UAa1XcK5qEd07ckzVM+gjk0Nzn7fQg3zBrU5Wkm2u3dVfvV5QeQs39tN05Z4l
 mnvcp/5q3dlBtqgogMGEtykzB4JnkI8fhcaFgNFn7gEYFUfWodY6kl8QOM7PXlWGw0yT/w1gagy
 BBYqeZizb/0FniZMnmN6rpSJ86NbA0I8nwmCoXGQ0m/zLve8EbsARA4zLYsG1ijBE3KTWoMxJNs
 IvZ/OnbSqrMCguckaUw==
X-Proofpoint-GUID: _6blYU6ZEsWs1qETOOXWfxmU2PsZxiNl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX5Mos7b1Ga5L0
 bSU2Vv5c+nLsVr0DqgrOKYowFYsDC9E4JCrvRpnbL+3IH8ngtymdrsyHgso3mSNJvZaQHLTvFZr
 IoRuPdSXExP8baUvypI4FStmtcrBSOY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
Glymur.

Add Glymur-specific CSIPHY resources for the three available PHYs while
continuing to reuse the common X1E80100 CAMSS resources.

Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_glymur[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

