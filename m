Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691856;
	b=dpLFay4awI24adUOoyHjvcYxZgKoosZOzoCai4GymOk6k07Xu+uYWVZSi5tE7fLJT0YN
	 Egxqr6gUEQpzkIAJJwyYjCnIKeu+RL9YpHbGh2HplGXfrbA+FgHbQbpIunosEcL/cq+bE
	 9+qOOJglf8x6mUI7WTZI0e2cgjOxg7xKyLkk3pUn4za9X7Jh7O2TLLzVh6DKZbnwR2Bnt
	 Crq1ND1jFjJKd3n2TAQBfGZEE0mEwNEEZLZ7/I89nDJfwmg/bTwCjJaDyra/qwteY0QVB
	 +Qy89/oQ5RIKlEknBVUJNaSHKdjucB8GGm4DE9gCbY8jYBs4jXfKdNmjinle5RRQerA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691856;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xmQE0mY9Era0XvZpDqWvSLgto38wmygL/cz/IUrBfog=;
	b=LwSeaoIQxJpZ8TfRiYH/8vrOwBUpnDb00nwevqmGQRZbTXwWnEDpcg7fnh+yJCicaYv+
	 pvPhw9mJHwCbTWcVd4BOFn5tl/wLS2aJIJO0GKiUvafEKxDm8eiYuJ4OvEXwtHB88uyiQ
	 9X6rPl/Mgd2Nma5KXH/80t3ExtsTchgifyxQj63WZAnz4ECxGCixtAXZYtEQW5d53F1vQ
	 f4KBBrBPuNKzad4TZcWZVIL7TYOurWrOH0JP7C69h3hO4FiQnfu39JNPX/Jcb5cqtCpZ6
	 evFqgf32pAru+xGTOMsP64aZ1MH2TdihoDFzzoOs+hzXVzMsyw/RvwLHAFJjxaljeLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5dVK8y9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lf9En76L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470B606A684
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1470B606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5dVK8y9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lf9En76L
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBH8vO3860087
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xmQE0mY9Era0XvZpDqWvSLgto38wmygL/cz/IUrBfog=; b=J5dVK8y9P2mpckg8
	K0CUuVs7fyAjBXxNpDNPfuXTKHgkMYsmhP9sVotST9KkdVKA4Vk9wQqOaHQPwDFa
	hwRy3QheGWAEoH8oTVIs9ZEtbwvmcEWCQCGpAUJkamQGK7Beon+E+j4lHCAsJvTv
	fGNxsdeX/go36VdrvvAyY6MGX7YKPIQ7yhMhksg4cSdsqwo1m577d+sPJiiII7k0
	9fOCtIvcLOk6TdDkzc7uSH7K6ItnmXnNT5nH6gXSGI1Pn3iMBWowg+SyiIGWF3Lv
	WKEFTUP5z6l9Q0aRT76h69FJAVPxjc9fjiHFLd7ZyrbycCqicDNv9IBzARXUYAyo
	d1D4Nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80j40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55bb7f70b06so119653871cf.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691854; x=1796296654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xmQE0mY9Era0XvZpDqWvSLgto38wmygL/cz/IUrBfog=;
        b=Lf9En76LRfBfp29Y4NHCCxHEPH4GJW7QpYWYOYlfiGSMOrtuU/L+ywTI6Dud+zq+fz
         VBaLKIKguYLEDqTLDJ4+Pejfjs4CLZzVmTtG/9YdVXcYFzRHTqiNhYFE72eshweJ/yzo
         k9teQE9/NbPhdD7nTRoKLccBF01y9W/LpqlD+Oj2d4WWlv6/hCsQPSU7TrDM9eXWgXe+
         a8aINbFkc6uUrHFhll7Jr+PK3ysQk/daY7fxMzUgO9kQAQFJHrQlFrLGm3KG0N14V8vF
         Co3WDwNNg9CPaI1Fm9c7HWhPH9aIp1PK436CJTJhGAUFmRD2M3m2Qxmfs4Gh8kV0rONf
         /j0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691854; x=1796296654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmQE0mY9Era0XvZpDqWvSLgto38wmygL/cz/IUrBfog=;
        b=evNhAnhg7BunkAPY0vt7Fqn1RcxTd63gDa1Yudtpjv2EDFL50XK6oemtu4jGwzBQDe
         Lx40zHolEv3rIC6FcNtCBJheH8zBUeqLLrQqDAcLIGY7/u4nTM1Ch+YIqR8oWJZWRyXl
         J8K6JZGkxtvR82teP6wBSf8XveG7rWhLjQN6Tt5uHvjDdOXIsVsitfSZmes2Q6PaMiJl
         Y5Eh5vzA9TO77FDdlXDOk7NMAVH9LvR0fyPng8LHsQhWQESwZFWTZjZ0qibeEx30CISN
         wngBQvjhBkgAt2eVal658WiHlGBTZVNon8JOcOzSpJHWo1bsaApDRGJgLPelMY/haRz3
         RNEA==
X-Gm-Message-State: APuU4Z+xmvqF+VDnxnOm7N5LlQxjlWl4QWJKMVzhpyoVErhqOnN6VWug
	aKa3JsMftJ9PmGV0vZ7tgSqLM6TI/+pGc1zf5re6RYiJizccegzeLJeNIPJ/wvVse1uMv8inEn9
	VZCOt/L1tEI8A+J/OoqW/6ijY1RRf9L2BsJZj8m9dJjCw17KodEqP/p4m1AbDcczQsQ==
X-Gm-Gg: AZFdTZcyABX7Zh0SAgly4LLtUNCfhBI8KqlvsbArx8TWHe9e+9WstElwCXsIlRHDe3L
	7gluEBXOmReKPzmEst0MSR1hBoKdfnuUJ4LCk1bb/y0Pq9creyxFs5pqfg997stgJ5hFcfqpyvF
	Pi2SI9wUT4xyotHOjhA4JT4zizO/DPGxAwRKdnlolZnSsggklRD0o9nAJEE5DHd0rJhtNzkjuwJ
	C/IwmleP2yY8oMM8VMNdcpljt2Ctblp3fMSYAyDrZc54gufNHaCvHqYg7HcqX4dKXha2DnpnDB4
	X+iqFfUblTdo9nZQMJvNbRMsqORUX3a2IglRbXa2eoJCrPJCSStOQKJEPw22wh1IPkK8jI+efbU
	rAiXwTZ/q47Eta8Ng8FPioB6zSVeKf3fkWCiyzYWQjR1dN0Md1IdMk65I/jjlWTvOnPZ/P4UkHr
	gpkDiKz+32byomTPxgLSVtfIVCa9ChnK38t3NhzfdjEg==
X-Received: by 2002:a05:622a:428d:b0:51c:b98c:f772 with SMTP id d75a77b69052e-55d769ffccemr331947511cf.15.1795691853855;
        Thu, 26 Nov 2026 03:17:33 -0800 (PST)
X-Received: by 2002:a05:622a:428d:b0:51c:b98c:f772 with SMTP id d75a77b69052e-55d769ffccemr331947251cf.15.1795691853404;
        Thu, 26 Nov 2026 03:17:33 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:32 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:15:59 +0800
Subject: [PATCH v6 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
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
Message-Id: <20261126-purwa_camss-v6-3-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
In-Reply-To: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691836; l=8344;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=nAoX0CjI5/2mpdVyI2pO/+pNNYehUmNhWAfmy1CftoA=;
 b=9i2ITSNYMocTn4W5HsYoPse2XhNHqzMy5wnHZXBOsNe8u7u2+j0By5H4TVg+OXr1j5BBCgujQ
 UlJ6nZ2NxY+DP/PQyQ0M+6UEhPuZq+piLh0b/urKdwHTxMOU3iBmBaZ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: RpDfSZNUx3fBM7cDvubKAcifQzVfY85C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX3Xwk67FiCUT3
 D43CHEgtFHKkMur5PyR3meA/HUexLtkmAYa0ax1+Gb1n+ylT8X864FLagSdztxwBcnPShU1NZMd
 0313r45Z9ww5SbmIeNoecois/GSW7N8=
X-Proofpoint-GUID: RpDfSZNUx3fBM7cDvubKAcifQzVfY85C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX1RkmfwEb6ToP
 +waPUz/rCPeiC1TFQzEMbnr9eMLjC+pwfjG0cBzKRRs33JK0nSGN9ISGaBIYYctYipN+D73o0iS
 96WEB/VOxuksX0Kq9/Je1Gn+L0DSTiWuuKsX5n4e4IQaWsCR8uQB62dDljEhoFKxUTsZHoF0qDU
 l+U18y11rnWrUR6LUYB5M45659h/1vwWlNZqi8mJv4bykWp3bTM4/tL9kTUfdWV6p92tLZR3Yeo
 W7ICegUSq3jK+///Kokb2NsXtBecR3ZwsemXMujGu1TLn/LfFFjDwdHqf5KGNU5kfTFbc0Y5bO8
 8MNZsqDCwpyo2Iyv2mGLEmdwFfyuPzS7vXaQeOztTjzQjzKf/1IbAwqxyrFMIn7GodOwzhOhGt8
 fxXPgQw6iONf3maC0MKZXFMJy3/BUnOOjV2LG2i2SwP++1OR1dYm4K0i/tQ7+8awWEGveNoLZe3
 Vo7fel0NIk0QomvfKtA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08154e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=U-wJkj8mTumg3oPakRUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260043

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
CAMSS. Compared to X1E80100 it has:
- 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
- 1 x IFE instead of 2
- only the ahb and hf_mnoc interconnect paths

The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
TPG and CSID wrapper resources.

CSID1 and CSID2 have no corresponding IFE on X1P42100, so they cannot
drive any write master. Leave them out of the CSID resources, keeping
the 1:1 CSID to VFE mapping CSID0->IFE0, CSID_LITE0->IFE_LITE0 and
CSID_LITE1->IFE_LITE1.

The CSIPHYs are handled through the PHY API, so no CSIPHY
resources other than the lane format are needed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 176 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 178 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5ec5dace2105692c395763b2c4bd888ec49d821b..84cd6fb2a740dac5d51b0440787b79281d9736b9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2054,6 +2054,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fbf7be44d8fa2947f3c68c6d467ce0aeaebc39ff..0505b209262c3419afa6b8435fc80128c84aa2a2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -36,6 +36,13 @@
 /* Top-level CAMSS version register */
 #define CAMSS_HW_VERSION		0x0
 
+/* CSIPHY resources for PHY API devices, only id and formats are needed */
+#define CAMSS_CSIPHY_RES_PHY_API(_id, _formats)		\
+	.csiphy = {					\
+		.id = (_id),				\
+		.formats = (_formats),			\
+	}
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csid_res_kaanapali[] = {
@@ -4738,6 +4745,158 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(0, &csiphy_formats_sdm845),
+	},
+	/* CSIPHY4 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(4, &csiphy_formats_sdm845),
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1p42100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_id = 0,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.hw_id = 3,
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.hw_id = 4,
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
+			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 432000000, 594000000, 675000000, 727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1p42100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -6135,6 +6294,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1p42100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1p42100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
@@ -6155,6 +6330,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..734023839abe9ec6a89b1a5c2a0bd5e545846c0e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -99,6 +99,7 @@ enum camss_version {
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

-- 
2.34.1

