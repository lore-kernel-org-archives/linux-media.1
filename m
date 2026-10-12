Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A22443AA7
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787542; cv=none; b=aaRcWpL9RicLqXD7bs/KhteNeXrFDGflfYFuAp6sLRU+XUoY9EQzfYEdBcZo2/iR6QRHOMk9/+SFBowHrfcs8hDybDx8ZGVhSiljw0K2aLAJDE2B8XnrrxZpDtWWqQwGz6+T8vibkqsg+NyQzENJhGP/gQ5uNsY0wqkXmSjY1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787542; c=relaxed/simple;
	bh=wSU6Udjuj/Df4gxF9Zw8yWhgp6GwwoUXpeQ92a8/zWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3i5psqb6bGSUAr7t12/CXhpz2UPlGZSjQLH2zyIgh9FiBYtDNeieb/zddGNL4SfWvmUCgvQCBB8n6Zcdliqo33G9jZOsMnfqCFdIIjxlBnVKNEtOeMxLiCqViNwjlPmMbrlS+BnYaDj/D+/EvOi0UwdZxLqfSHxQfpMeuKa6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nwd/GctF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiyAYBd4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nwd/GctF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiyAYBd4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55uYD4068700
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2nGpKGuo9PQV/cUE+oKkjMvrl+HzJ34DmABGfvxrMg=; b=Nwd/GctFMc4h0RgD
	OtOxkz6WQbSW7iFafI5nsRAQJ697wyjepyMikIhbBrn+XM3QxwyhmACo5GiZhBKr
	yMcXbGLPii5bF0s0tCnMkXpqObOwlByHEzXjDTJkKP9q8IbrRNR/lHOiubJ9NJ8s
	rH4Cx/CNVi8r99wxxpAZgEYCxj24E/Y3MmQY9uPLRysEgwn9UTLIV2rwJ8M18pyS
	tQ1sZOSMqythxfpmC+BvvyKpymVk7x5UPizl/Cbha/pf2cxQ85vZBHCKCyjS9ixy
	Yfi1K1oIi3CICKfAZnr7sS0qGG7MBqtZRQOMtQF4RlnnhQ9muZPXqAdtHy9xdMf0
	IWoTGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjn69h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:45:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-892ccb01fbfso1367895b3a.1
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787534; x=1792392334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2nGpKGuo9PQV/cUE+oKkjMvrl+HzJ34DmABGfvxrMg=;
        b=FiyAYBd49yPjd3OVNN9hSZ/yjhUARDQAd5ExOE4kLb+zm4hz3Qs9Yb7vgZYvfxZzO+
         Yc7uVY6OwCD2FBta/7c1JHhWgl/EiwSbyTF3j6+1VbrcdNsqACH7m7tVvk1tlyFBhJCT
         AZM4uMVM+rg6MHLk/Q04LvbstJaXB/GEEr8DfpjM841zR8ERqUMlA/KQr7o1WXAaRmia
         kf1KyptTHWsXa3blW7Q0nRHaWB8kyk/jzOdFsNqxMPkf5BqT6StaXxeYgyijCyod9Y/S
         hA8ER2aWOyftQr7Jk3eL20dl4/zKeEDNm3TyDkwGwJ+jBGJmyuCcy4k2aec8PlUVamXp
         TsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787534; x=1792392334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2nGpKGuo9PQV/cUE+oKkjMvrl+HzJ34DmABGfvxrMg=;
        b=BxnbJwAYvpKoEEFQvKjgeNq6vuA6l4vwb7WapZWQdh/SCJa1gZ4FIW4yTI9Zj+5BPH
         G9GA1dUg3jxBqlMBG7/7rbgWWf5axeRAe5tPG9X9ggvaJ25rtMrzCfqg2FQgi3xf6Rjt
         U98cbVJNUEP7HHOFhynLbLBaEE4uQ3pJnnYEk8f/NtDTIR2NTC/PI5FFJ6N3kOrCmzbW
         e8TKOjYLz/H6vTK9FmZJW/Hs9t3cBM/16wLxTwFeBmWDXz7Not3xEsMiuLiQOTjmLhDw
         AGgIUMo4Z7+DDmSLOtFGH3qF0t5mAWV5GmMh7aEX6uvF2RKDhloDU/rvr58rtFQD8sm3
         iu6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2swnUIhGA2u6+YxqCg8n6CueUXG91loa7rZXk4vX05x5woKzGqfiDtlFFbb9282LwdJV2wU16wXCM4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsAmHFg7gLB8WZEgYnaYBhSk7jyfgHeiVw+/G26BFRQzenbJDn
	bgmof5OJN2/kiNwZDYq/D87QAqtspPq5b93Y3qq54VOqX1xTwh2ivq1quY/xOP7Nt/Ishy0idd6
	hAY/GmQZGAdqSFwcUXyYAi3qwP1Ug8AcU4jogwFfczxKuVfLEc7eD5Eyo0VaKCeQWVA==
X-Gm-Gg: AYBFou1D9784hgi8+s0I48NG+GiV1egxM4BuLd+Wt8suSP1cDaP593bxs4BC/+cXu/l
	gC+yor0VZpAIcq5VIvtot378oZxQugU0qNwW7etN+H4E/Rf8Bye3Dsg8bQXdXGIo0iltUt3dmdK
	yvwrwD4tWye7Z6MoO0oI5jn+XaEdMBJyri8Mi46k9kH9S+QJNqHMZvftkbbQmfv0IcJyY2yObqA
	u55I/SANMsgn0uWsRQZWCuf5Ybxz+ek7e9l2hzpagNYIq9Xz4nmVqVrioXanFRH9LQ4AmIepQII
	fX7c34G7n45bv9TPXBBe5/UxBC/FRMQB9TfdmpJ9DjmGtfssv7k2XBZePIiCMPHoXYXY6hU9skS
	EyDHHMRRlcQl3ElWGd4LYtA5OBXsJ/sjfxafIRffHQjeru/EHEFoIltPF+LF0rJdOYPA+NZNDfd
	B5xwiLZKI2nQ==
X-Received: by 2002:a05:6a00:b92:b0:890:b4c2:d7df with SMTP id d2e1a72fcca58-897c3ff4ab0mr6947719b3a.8.1791787534441;
        Sun, 11 Oct 2026 23:45:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:b92:b0:890:b4c2:d7df with SMTP id d2e1a72fcca58-897c3ff4ab0mr6947703b3a.8.1791787533983;
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:09 -0700
Subject: [PATCH v21 07/14] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-7-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXzFLME0SEdJr3
 p8VnsAfN8IY9BXn5UANc0ykceOmhWlmjYLE+o2ps0yyzexHW8fAaZkh+GNbZwSQEXPNUPwEzEJz
 WJQMhcQQPBRniO67vNNhWC2yl4+0g35adZZFpefRcchLr4UQmcBvHSGjhiHxe1Z/KmyWwmuC3Oq
 cbFhUjRJpXITVjc3FWCZGYqMKRFxiwcaTIIvgEX4NDMR58/HMs2+gg4CzWPRAFfw77PtLJqCwio
 U5AwcixVmpqdU46ZG+ehISMk9OBmR7U7Al7HHl+QOMQU2o7h7iOhxb8XoxTERd32upR02BAUKbg
 HWPqr53xNUD90/WuIJ9AHxxBZCr4XFxKCWNG8QNuSg0ncWZ8xiLvppN6sqVVvKhtmbKu+R0w/Kc
 8y2PAyORcsn2QHmsnygq1cwoS35ta8hVOK3nWTACwan7hOjHIRZKeBZk+kCwfZivMJiFuDQEuJf
 P8WSHIuHQpVI1rUdNmw==
X-Proofpoint-ORIG-GUID: -qmS9jPhTA7Eo4FAag9Q_w3hSULA5XeN
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc820f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -qmS9jPhTA7Eo4FAag9Q_w3hSULA5XeN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX1LnYerSXkaMX
 m87moxYwxSK/IOFFRHLgPKjLLxO4RR9UmPJvXyNIhaTLReChx5Bzg+v3xHW3bMEFtGKx+GuNmRY
 LPvHaW6wu6Epwon0PqaE9lR9FdqCRKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fca3de214a92..eeceb79c1e86 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
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
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
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
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5593,8 +5638,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

