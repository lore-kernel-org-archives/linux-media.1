Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200883;
	b=a9dJBN2UPgN0m8gNZwzqnZQWcIBHX+5fh8MGXtOz3yZGihuktEA0uKX30j3sVFgzcyBB
	 TOGAHBIrkw5sviHTfE4iPPtvTsUlmfdSV8ZZA9FJeRvHJXkX2x7Baa0dxHgDdckaurHn3
	 y6gmuLYRSmff2TbPztqPYDbHEI+UGwMnk0l1j2zuB71jKm2/IJ7Ilg7j0DCmOr+5tNYFG
	 q8gZv8XTN/V0Imb8XJcOJjuNijwAsHhTlyHcXa/Ehu7njZ+yItYn5tkrIixO6o4YTXAg0
	 fyjkSgoWrrO9Cdxqp78IGu2Y3yICULL154knfGwq1sOZ/fGhOZDQ1FsDKHPR1sbx6wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
	b=3t7RylHu/a3OXpKci/YqwYuKZsfNU6aR9/GYxf+Fq/DjKOEfh+H1X2rjo+VNST0ssTeX
	 ydu/JjIPH4j3Qb4eHQN1XGL79BwdIRka7McZ58NLsnygTHa7lQn8uXIHzzIdwclVPXxdR
	 RCZO0oQ5WbNXUUEyDV4lJQmsLWXuQiPBzXGh8fQCMidCw7o5xjIqjVO935zED9SiyGfAu
	 pNBi+khF1KG4zOq9/0r46wd3ApJsTpFrakU2o6e683xDm/WQLglS9GsOiMlbTfz0NGdtS
	 rbdYup29qU8ewYIbb0/FufboqNAWIB5AhLpIMnR6wcPc+bAL05fllHVopk8BXhrQ5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZzseuKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ6aHHgv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16860A2608
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF16860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZzseuKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ6aHHgv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAcYm423495
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=; b=nZzseuKEmdajGeTK
	g56F9YULRkwTioXg3c2PI00JMwS/wiMdnkstMV9EQ15zDq7euDY8hncpZOEKNCbH
	EgM0th+McGsiTQbjUeuY4NZmBE9wbM4Djv85Zy9YwxtFvyNxrG7y9r58Ln98jBov
	x+nqTH26SMk8uTUaE157DWTUGFFUyJQg0mgr2b3/IewYwJyGZ80t8S+gp9jW4KA8
	q2RQYqpPglc71/MryyfYUK9oSkxX2zTpkcdluGXKrz4TYxZaLzQWLbRhxYKSeAyl
	4eSaAQumcfORrfLIikFwmLgK0vjpe4KoDBLoypLY54kguOR5IpmgUWCa8dwObk4Q
	C+2m6w==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1h27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:21 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679b96a1e29so1904166d50.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200881; x=1793805681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
        b=FQ6aHHgvEsXFs7aiwgUBzf0I1LI7KSINilslqWW+NGFmP5lly6y80giHMkGwntT83G
         5LG8cT78CArOALLo9bHandtNKzQFK0CH9mLRhDuecR+/E4fCBWiDanw5OQkH9D8NRKPz
         hr13Yef1nyit/jWoLc9HIOOb7s22FikIYhd50Qlv89NBxp+/QQRLHUJ/GeRJPTeOQXsL
         uCH0Q+rEX7saikB73Sp5QdMeP3KV1rOuUF9XPbts7Br+szcAzKmLdl/NmcFJrOWuCODF
         v5tMoLnbioQzoNAJUeZeu7VX91iJJ5hMASUD/Q/nhfaN1x5bFLrUgJhw28NXTCRvmudW
         o8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200881; x=1793805681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
        b=mVBgluhfJ1HuqntKPKbh7YAaH/PJ3UI2Sj1JPSfIuJ9mhYmZFtRSfh/OoS5usurcDz
         Avc5STH2Snf0YQw6AuzDaPDgMYcO1KIwin9fNkBhLLkIf7wzkAZ773kDwP6/wboQ9p+w
         r60eiE7hgtzhE9/aCAYefbWfSA1JeQtn4sFOQPLxq2n/Y6CrMU5JkF9DHsf0WgajL+s0
         M0XNEO+WRLaxJknvBjD5eQt4038XnYM6mclwpENxGwusoHuAMz39RkLWEnnFNuAXB5bv
         BxXBCfjAKQfre3oDGkaCrlroiAjDwiiznDQytSGRRFZCDf03y7c5j9f2p/PwNjc4CSOw
         0Jvg==
X-Forwarded-Encrypted: i=1; AKwUvBy7jG7NMgoKGP/TZ/8xwV83v2niR3rwk46FLq4Fgbt/OZb4uVGp9xeeEP+SfeGKrWl+AYhbhHTqjLrg2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLFTjbXznH0xg0NTymYlpkFNMWbdPoq67eEIEqU8QiVYRh3F0Th
	tyEm8FM3jBsgi3J3spVcVXyd/fNGcCoFnfIeKAkpq58AtanDBVp/yY7JTL2xOMGMV34YeC4hbT1
	VtZgv8WhZ1aI8HFINi3msKw2RoLfg1RJIDOVx2o/htw/2tK7VeXQLAkb1Sb70iXvQNw==
X-Gm-Gg: AYBFou0zwBFS2OMk7keVolEhCuMPpygTVHA/+5DxAivIIeep1lYeDnDrkR3fJlcTNvZ
	ryy4Ic1+ZpM8B1Lt6O/STa2wNjcFiK0IoXMqvv7zvTE0xGDSlwNXsZt2c3EMZW+VgOl8XHpTiNF
	m2V24POwp3WEAFyKDsdGxaAFSOQsI5+0dcg8EZINmwiMZujOIslVE18Vy4jRcNRiwU1csCo5qQ9
	bNb6BzyL2ZguQWk9XtzbIbfvn0vREq+oPZnU0UfiB4xfcnGwYGgR/qdCWPHy2bPYQVpgwzV61C7
	cX+/6qBI4MbF4VpHjnAyZPsDZr2Nxx4JQwm9wu1LkXcRFg9L2E7p+aOfeuGbrrwH3DzRAXAm7cl
	049K9yuyjuFnCHhDKquIlavWaztYFroaIyaTjLChRgMhzXeLLreqZb+N8gg61gfJKfig0vS7caL
	f7J5qfxBidaTqaa0atY/iuf9ml9l6WJSunKKxEFfwif6YfSSdHx4DB64IolUto
X-Received: by 2002:a05:690e:438c:b0:677:d31f:5a6b with SMTP id 956f58d0204a3-67a7bc157f5mr1294942d50.16.1793200881012;
        Wed, 28 Oct 2026 08:21:21 -0700 (PDT)
X-Received: by 2002:a05:690e:438c:b0:677:d31f:5a6b with SMTP id 956f58d0204a3-67a7bc157f5mr1294931d50.16.1793200880381;
        Wed, 28 Oct 2026 08:21:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:42 -0700
Subject: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
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
Message-Id: <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-GUID: 98NVipTITlET8bJ5SFJ-A4Gs1-MyyruS
X-Proofpoint-ORIG-GUID: 98NVipTITlET8bJ5SFJ-A4Gs1-MyyruS
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae212f1 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/8N4AFZ3IzIb
 4IfF+Zx6D1oRiAHrA9txo0sh/4PTMYaUO0zLkQgP4hCYWTL0Ru7TMHvR+EVlOxtPhCejbmNbieY
 ITr9l3kKLQT070BOOM51aLudZeKP2/AOd5utcb4B99qiPHsBOlE8JcSnW+MXty2lQvmmRo+v+VH
 PicnwBDcAb6SBgx1/EI+3QTF9x09azk/KFM0NuRnFquN0yhHOeY6/ZYosz+UyBUh5PRgL5WgMVz
 p05q+Dtrg1Lz6F8GoD4qnNJEKBsGq2agORFevFbBoq0VsdiW5VFMFfttgA0C9Od5pfr6WG9KkyG
 U4K28mrTskJy8Ri5gFM4j61lyYREGsCqsnTy/zP1TK2Q/uKr/AljIg87t52nfr5DwaMQu7SrU8Q
 +oM1bTDBrBd9wyI1x90xmFaB0sGM7brMZzPXRSQ8KDLacBB69zvwiD3EN/U+0Z8diD2IxVcEypz
 ORP7YwygWkKwxOv788A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXyCNIdNAjs6I2
 UVWZPDnvH4pg4SqK7mlN5RlSdMz/xYXetMaeG1VIkPTgc9AByRbDqYl3KMaW/dN2s6rSfwDzSYi
 C99L7HAjU9b1BW+Ct/QKTvsEzLLwGd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

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
index a64242c66cf0..b0b63dd3d958 100644
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
@@ -5607,8 +5652,10 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

