Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659A13655E7
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640080; cv=none; b=nwu+1SJ5XsRMWGjTaKCHc4zG/kGnNQsoEEyniFUNoOetunGlZ2IJvbXNbRVOwveOpufJZBtW5AOfA3/Egv0Fc1P5PUrfFMeG0tYiTOXPZBd6PjSDEKc7G/5l+r+aJnzHRxTJR7O0gsz4IvHkAYO1JWL6iPtAZklYZnU2Qng0NLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640080; c=relaxed/simple;
	bh=zZ37TWSmwG1/lzRCMjeybh+YUmab0aHUrm4xknMXWtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bW79RLlzyEBkkO3VyHGbXDLSNYZyXhbgcUZy5gGXLbHNbP+2hmhyC2z7dI8mtI3YQnLX4N73A0Tq8ZuAMPSzmLBaUHEggrptmSsZCvqZB+4hpgvfFkzGHwnp23ogcEnyI4NZ5wGVwucjB+YIbD43PTK0uTTFfPorvCO0M28O84w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJBOX36u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRtYkz78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJBOX36u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRtYkz78"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LD5iCM1853472
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzm0TOt37Nn9UAlWvpmSRCC3YSQDv8P/PcvNVlb0Ee4=; b=SJBOX36unOsx2TQT
	Ephsjf+VP0JrrtPwpl2AUHQ5P1QHNnIx1stDh60m6Vymayp7B7NKU/Hs1X0qpfIG
	NlKa1rGeUqmKmwiuwefVo+wgvGC79aACy5wATvI7rwta151WkRQV70z9Mb/XHqXh
	hi3XnqJTUSz4fWr+ki0T/tnt8Tve+rKMTlrquR8tKTXOplYMNI08AjWNiyEMmzct
	AdKveLMRx37iYYRI4c5+dHrD+WKaMMObVsShHNjkcMUf85h+CZpKfcc+W5rYuUzH
	hfhTMYGchJdLRz4/vhg5Xu3QMb216eiL6U5c6sPBveFqLz2Anaji6IJwE6Mk6LUO
	VYsjhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs825t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so100689951cf.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640077; x=1785244877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzm0TOt37Nn9UAlWvpmSRCC3YSQDv8P/PcvNVlb0Ee4=;
        b=hRtYkz788qfZDuM8DyUllJ9bP/QQUEnUF3maauAObYIWxpBgaMTQPIjLwq00xfP8NH
         nFSJx3qux2v8rofNlnvGQ9nBerlWNPvCtZj+8SpBOtCGRBM5DHm+V0XAN2wY0OS87mD4
         FGX6aR+BwAuI4A8vVWjx/HPxzbZANrbUpsgN596v5MOn9YRI7n/clykXOyjjRNk6elCb
         qDKkIAuaPlpsR8iDMACjA5I5fblCS13l4XYizh6uGByWgInCpPlvalMx/t8NM3sxu/U4
         MBs7Tm6cTLB27t8P/xCHvHiYzQquGe3L4TAZWu25lrBO4dmDnbGWatdaLzx+6Mm4sLVu
         Xsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640077; x=1785244877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzm0TOt37Nn9UAlWvpmSRCC3YSQDv8P/PcvNVlb0Ee4=;
        b=KhJzMW1vSC0myZT3hfEunQoUoX48MOTxN+qvY4ZYLw/d+eDPnMYCkp5Z4YDTlMu4do
         sA2AHTYP4j9ZbaGI0OynC+y0Xfrtb0+96QwKQr9RujOoPlJJJW6wiOjp4yJMiKONLmUf
         NpK7xYTk0Wo8OEYlKM/aGIpD3YliQ0fzucK9KzDonmbR9Hum+FUi+33vP3/dkyDAmLlP
         x0t2Dga5aiYMiJnBsPwnKJBu+4JT03jGF0E000AcpKKOF580S8SqbbQ1vW8mMKhmzpcO
         1EQWRMTqRL8fC257Lda8hnZmQws0TdxZ571ry/gcWICe/3r81IpOvlOya7wmNNOVltlQ
         I0HQ==
X-Gm-Message-State: AOJu0YzcTKOz1L3poYQzh2lyZG9mILvp3ARcpsWQMEm2R6uUr+DIccjS
	pCjDs06FDXXVjqBaOW5927i0Po2yNhvKi0qK7b7sOclPe9j4sFmJlglXca5mbVrFSOX7iEtep3F
	dLBNvQnCmkAYr92AE9A45uV1FAEoE4iJ+pDiNm1VA7b5evq5aexncjsV+4OUOFMCjqw==
X-Gm-Gg: AfdE7cma1v3WoihHQLJtCaoylGBOGK+h9zC48LBRwo7lhfSgD1MHMK9YEy7CsqLqLsz
	+xEs2KBr8+1k2xO162LBI7d2DvhUI+SujZcLDlhagC3uTXI2dtrttGstHEmBetVZBIzICUJSloJ
	1A5QsDrVbY1HR3F/X4alqRJ4nni63ZduCA22P+cY/g+ZG/PBka3QdKMvqixGeossVGSZ5zOC6vV
	GCnwk9hTInzeuIMkdi+N2C+1sb6D1608IrUCzJXcy103bjyqX52aC8O8bYfiuCyjvKWgHC3mFCO
	AcQWhQQmvUnn1OZcqLmea0lIVQHjLh99YGV129x9Rc5O42fzobQfGE1clgh/arY52ud8OEnZkuu
	X1J89DdsMp6kz7poMEt7VfbcrL2Pk5fqVieDTDlzXM4Ph9nkiPuLeGyUtXft+oKeHPtXc3OoCRI
	0Lyt6c+/88/9XomR8yMALp769Uvu7BCyv22EFG2nCEUoxPZmyM9QE=
X-Received: by 2002:ac8:59cb:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5213e48ba27mr170446601cf.48.1784640076504;
        Tue, 21 Jul 2026 06:21:16 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5213e48ba27mr170446071cf.48.1784640076018;
        Tue, 21 Jul 2026 06:21:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:10 +0200
Subject: [PATCH v2 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: l42c_WtXSVdcpmLpIEK-hqewhjedrTg1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfXwJLK8JH4Jhoa
 uHjsPERs9snu1dGAwlNVoQLJ3h2r3FrCKUl8yommJRjr9O4dILS3VlH7bUZWrc+I2sAIC5MuVr5
 UBFxRvYK/mfxvzeDrUXD6slwjQFv4DPfugADQ8mDBr/CSo7clL9paXO0+6fzJu+hcRtq+yEb9Mb
 c6xddKP8QfBQGU6GwiHyyCt4+X/0wmwa0ld/4Y84VzGsZpxvLyBig9VGZZBPYAf9xT3Mk8jMOlV
 Z2ELI4A1FG3+YQY4GgBZF/vSExvJSGAjRKc+2itImpui50RA0lKY6iZbHpckDO3ZjBdN99Fl0Ft
 VGJP8PX3FOznxnK8qv69bRnAjWCVx7Le6hu8pI4wIPDZ07+mPK7xZf72oyygrCzYpcBfLMdSzUt
 WyqoD7OUnWJsYUg++5DkDRvTj5oBMk94hTezZjzm/RifwBToWwIiQm+Je3UTWl7VcMtOkz2PoRT
 bU0zovO3o3SOnfG5POA==
X-Proofpoint-GUID: l42c_WtXSVdcpmLpIEK-hqewhjedrTg1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX2igYpSRV9Ebj
 pPbwVUubm69YxkFKpojvHjv3BYJzmfhQFqsxPb68DOwoYNIbHeS7W7HiHbM0KmvPIbmXW8s5hTd
 T6NRiQXGx7/1g1bd/qfhUAg9N4N1LX0=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f724d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jcYsRx50IvbP8YDAZZQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a87161f3d5524a6e40a7281e28787538613dd9cd..1f691b8940a9b3d8a9c03cb3159ed711d0d18e77 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
@@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
@@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe0" },
@@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe1" },

-- 
2.34.1

