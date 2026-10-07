Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8448592C
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363750; cv=none; b=ETC6BBGEg/l8moUZ+erBhgRpLiqdHxZOpDyb6xtjIZ9iv9s7gRMZUNnfmM2jr6ROjlB369YzODrl7kv2tOrvTOj32jLxfWnN6WEJ0PgdCnpQCO5pvfmXxoxUN72j1lNvNSDX+pLD3A8aW441Qm5AYltecuC+qhiPWa1vOt/FhlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363750; c=relaxed/simple;
	bh=J8zX0BosxALREkGuvS73xGXuDFgp939q8bxy9PiCNfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lHAP8aViMB2xWpHazt0BQs3duWSNAcgaJN8XLeQVViPM2VKv8FYlMiz552UTzXImN4xT8/NK2sU50L9n4tyiTek/kzkPr/KtyCPAMntHTAjipQ6m2ox8+V09PfgUsbG6FyJW5yQRmQGE5IL5CWYKAPsBV8gwDopg97UL1ch5cSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtHjdhW+ reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtHjdhW+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWHn2481348
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b2TIZsxTZBx
	V/cYkGg07OniicaQBj33MmruE/6U5Zcc=; b=JtHjdhW+C0IamxuIe1pQa/gQ1Tm
	7KNLbC198xiW3qmoIe8wrJFpuwgjpY8LM79GV6hsK6y9BsxN6S7s/blSR6+JjEuJ
	UsZZS46Qzjbu8cim9bH4qSjUGWf2y2cuuK6NPwl8M70OlyPqxhLA0uk14l6+3lSF
	1CaJQv8EMlqW5uIwzayjOfo+5YCESCvWdGMirQHntz6bMnyOYx3wMPjkG8mwXJ9M
	CANsWGUVJXibC1qLE6nFDWBU7MXS4uRJq0zX0fjggzHJ1inGVpRn2QbAc38EoLmj
	cTXC8XKia33ssc7NLQ59b6J0dOTyPR8Zw2bBYTySheswdRR7Cp5GEqwz2+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1cdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca4a2b9c4so843234685a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363721; x=1791968521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2TIZsxTZBxV/cYkGg07OniicaQBj33MmruE/6U5Zcc=;
        b=bxtdc359f+ceOuHO6L/m+ia8v3Xe/UnxMv0pfXXIy+AlhZuN8nvpql+BjUicm6RZ9K
         p0Q15UqZGhEjWYd+0qpzjoAGWE9+p2AWeZipkk1TVoko7pm1J0VOiiEy1As6Vbs+Yj4J
         o64Q99Qj3TJz39yqq7bdS5Jix4TVRiQa0C1g2AbCJu9apE9kAiydRQ1srlMezKqwgu3S
         t6vrB0bm5hcGa2XQTzSz1urqxcq/3x3BVMlGKZe5nejL1KOZHsFnz9Zp4XfoK1DC4bWb
         +lGOjE7CTbyI1sY0CqJeQ5QRUYRDxt1qm0cM3DYoxufSStdSpZoWWrLUfo9sZNcyCctP
         6ryA==
X-Forwarded-Encrypted: i=1; AKwUvBzQX5ZJkpv7za+kGSZyFWAmph9iTz4iXXW+28yQYUaixSTUeJCp74PRG0vgTEH3oU3qIzgR1Q1ZywU3cg==@vger.kernel.org
X-Gm-Message-State: AFuF++mkV5ZA+JcL0e2YcGJZ5kxwNRidJFSdbfMNJmY6FYhY98H9BcPP
	ce587yCCypogJoPiD3QctXnk33rddVVaZjFo5t7sKtIe8u0VVgOHfM5eE08RUJp+mT46B+/aF2X
	P4W3GteYTH467qMlSaBV0sApea+CKzl1T+i6oYCbZPI4EmB+mIlFfDTkLSLjMjwNFAA==
X-Gm-Gg: AYBFou03DJaRJ5jyfBPTTVlsx9pZlq/m1rKHUYFKfnxynO3JSBzpOrgyoRz9qiOdIQz
	5RPuig9b4kjjbl6o/dDf/+v40w24E5BDk/QGT5DTFvUvHPb4F3IBrUzVPmvP8+XnjwlZimNNOZL
	hW2ARsHIBWXbXF+GzGZ9W+a4ZOG//ErlOM3fO8Nf/NK6m0xWYvEt8Gs3WvMpbpPCfV2QBV+MWt1
	zaN4/p+GvJD2zB3wQrX8en0TEzPlsFVyLd6KhvK47e3RjlTjTw5m2aKCVRGpgqPwxuvRqQqyLuZ
	gwmCtyLk7Vke4ZSEZ7tcj9Qw2nwfyLlq4HFhyctv4BxRfsQwlowq2QsklvA=
X-Received: by 2002:a05:620a:1d07:b0:93e:9aaa:45c with SMTP id af79cd13be357-93e9b2ea963mr305448885a.6.1791363720729;
        Wed, 07 Oct 2026 02:02:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1d07:b0:93e:9aaa:45c with SMTP id af79cd13be357-93e9b2ea963mr305442385a.6.1791363720188;
        Wed, 07 Oct 2026 02:02:00 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:59 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 21/45] media: uapi: add Qualcomm IFE parameters
Date: Wed,  7 Oct 2026 12:00:17 +0300
Message-Id: <20261007090041.3732717-22-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX706WlSRlJ/Ge
 zvd7SwZVQvp+1j5RljecHoyaMwWBbUlO4JmoDFlfqfGklYotHimtG6/Ye6OXgGIVF1BrDA45hKT
 eG4qsiZI8EjuaGhfFW4ks38qjJtZXCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0lL6uNTVMzJD
 LdEinM9JYMyT+LayLJBblAXLCoLylwo+VvCZ5dzgLTwuC2AGamNH72+akwtlXVeQx3PacYy7P/k
 i6S5qBebyS2x/q7ssCNIuWQW3MGGiI0ibYG+JjF4ZOlJc4WRmydLvABxEl9D1Y1LCB+jGdZhOrz
 QieP7SvjRmt6MswgprlAoaZ3omygejJzqfPtBV9J2biVN28wkdfVp3+xFq08iJpARccGvHWAj4v
 lx73Q8BLDvxWe0n8wQrb75mh/nL+b0qj6L94qHqpHMVBHBAjQ0aSn7Z/rXBPeadj9JJEvo5atn1
 fJ0IIMiM6b7R3IaIvzVEf70PnzQ41JhhhqGDMavAK66z4PkSoL7NhRo1vY7Iabl8RAj6unoenXu
 nj7hRm4J1QMreAcsvR9gvhEc+3dFquVfMMY85f3F1KmhUz34wW7QhFEoLo9SarwcUG7ODq4N80l
 yIhYr3l5x62rk4ROGpg==
X-Proofpoint-ORIG-GUID: WPO7jGGc3grknlk82iKRKWLJ65uPpKkW
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac60a89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Vy616epaR3mJq_vLIv4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WPO7jGGc3grknlk82iKRKWLJ65uPpKkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Define the parameter buffer used to configure Qualcomm IFE image
processing modules.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 157 +++++++++++++++++++++++--
 1 file changed, 150 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
index aa3d97cfcc78..b44f80bf850a 100644
--- a/include/uapi/linux/qcom-camss-config.h
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -11,6 +11,16 @@
 #include <linux/types.h>
 #include <linux/media/v4l2-isp.h>
 
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/* Max number of lsc blocks */
+#define CAMSS_IFE_MAX_LSC_BLOCKS (17 * 13)
+/* Gamma table size for CAMSS_IFE_PARAMS_GAMMA_64 (v10x native LUT width) */
+#define CAMSS_IFE_GAMMA_64_SIZE 64
+/* Gamma table size for CAMSS_IFE_PARAMS_GAMMA_256 (v41x native LUT width) */
+#define CAMSS_IFE_GAMMA_256_SIZE 256
+
 /**
  * enum camss_params_block_type - CAMSS ISP parameter block identifiers
  *
@@ -25,17 +35,34 @@
  *	&struct camss_params_color_correct
  * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
  *	&struct camss_params_gamma
+ * @CAMSS_IFE_PARAMS_WB_GAIN: IFE per-channel white balance gains,
+ *	&struct camss_ife_params_wb_gain
+ * @CAMSS_IFE_PARAMS_COLOR_CORRECT: IFE color correction matrix,
+ *	&struct camss_ife_params_color_correct
+ * @CAMSS_IFE_PARAMS_LSC: IFE lens shading correction,
+ *	&struct camss_ife_params_lsc
+ * @CAMSS_IFE_PARAMS_GAMMA_64: IFE 64-entry gamma correction curves, used by
+ *	IFE hardware generations whose native GLUT LUT is 64 entries wide,
+ *	&struct camss_ife_params_gamma_64
+ * @CAMSS_IFE_PARAMS_GAMMA_256: IFE 256-entry gamma correction curves, used
+ *	by IFE hardware generations whose native GLUT LUT is 256 entries
+ *	wide, &struct camss_ife_params_gamma_256
+ * @CAMSS_IFE_PARAMS_BG_STATS: enable/disable the IFE bayer grid 3A
+ *	statistics engine, &struct camss_ife_params_bg_stats
  */
 enum camss_params_block_type {
-	CAMSS_PARAMS_WB_GAIN = 1,
-	CAMSS_PARAMS_CHROMA_ENHAN = 2,
-	CAMSS_PARAMS_COLOR_CORRECT = 3,
-	CAMSS_PARAMS_GAMMA = 4,
+	CAMSS_PARAMS_WB_GAIN		= 1,
+	CAMSS_PARAMS_CHROMA_ENHAN	= 2,
+	CAMSS_PARAMS_COLOR_CORRECT	= 3,
+	CAMSS_PARAMS_GAMMA		= 4,
+	CAMSS_IFE_PARAMS_WB_GAIN	= 5,
+	CAMSS_IFE_PARAMS_COLOR_CORRECT	= 6,
+	CAMSS_IFE_PARAMS_LSC		= 8,
+	CAMSS_IFE_PARAMS_GAMMA_64	= 9,
+	CAMSS_IFE_PARAMS_GAMMA_256	= 10,
+	CAMSS_IFE_PARAMS_BG_STATS	= 11,
 };
 
-/* Number of entries in each gamma channel LUT. */
-#define CAMSS_GAMMA_LUT_SIZE	256
-
 /**
  * struct camss_params_wb_gain - White Balance gains
  *
@@ -209,4 +236,120 @@ struct camss_params_gamma {
 	 sizeof(struct camss_params_color_correct)	+\
 	 sizeof(struct camss_params_gamma))
 
+/**
+ * struct camss_ife_params_wb_gain - IFE per channel gains configuration.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_WB_GAIN
+ * @r: Red channel gain in U15Q10 format (max 0x7fff, i.e. ~31.999).
+ * @b: Blue channel gain in U15Q10 format (max 0x7fff, i.e. ~31.999).
+ * @g: Green channel gain in U15Q10 format (max 0x7fff, i.e. ~31.999).
+ * @_pad: padding for 64-bit alignment, must be zero.
+ */
+struct camss_ife_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 r;
+	__u16 b;
+	__u16 g;
+	__u16 _pad;
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_color_correct - IFE color correction configuration.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_COLOR_CORRECT
+ * @coeff: 3x3 RGB to RGB matrix. Values are in S12Q8 format.
+ * @offset: Offset values in (S12Q8 format).
+ */
+struct camss_ife_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeff[3][3];
+	__u16 offset[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_gamma_64 - IFE gamma correction configuration
+ * (64-entry, v10x native).
+ *
+ * Each DMI table word packs two fields so the hardware can
+ * piecewise-linearly interpolate between adjacent LUT entries from a
+ * single DMI read:
+ *   bits [9:0]:   base  - this index's curve value (10-bit unsigned)
+ *   bits [19:10]: delta - signed difference to the *next* index's value
+ *                 (10-bit signed, two's complement)
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_GAMMA_64
+ * @table_r: Pre-calculated DMI table values for the red channel.
+ * @table_g: Pre-calculated DMI table values for the green channel.
+ * @table_b: Pre-calculated DMI table values for the blue channel.
+ */
+struct camss_ife_params_gamma_64 {
+	struct v4l2_isp_params_block_header header;
+	__u32 table_r[CAMSS_IFE_GAMMA_64_SIZE];
+	__u32 table_g[CAMSS_IFE_GAMMA_64_SIZE];
+	__u32 table_b[CAMSS_IFE_GAMMA_64_SIZE];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_gamma_256 - IFE gamma correction configuration
+ * (256-entry, v41x native).
+ *
+ * Same DMI table word packing as &struct camss_ife_params_gamma_64, just
+ * with a 256-entry table matching the wider GLUT DMI address field of this
+ * generation's hardware:
+ *   bits [9:0]:   base  - this index's curve value (10-bit unsigned)
+ *   bits [19:10]: delta - signed difference to the *next* index's value
+ *                 (10-bit signed, two's complement)
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_GAMMA_256
+ * @table_r: Pre-calculated DMI table values for the red channel.
+ * @table_g: Pre-calculated DMI table values for the green channel.
+ * @table_b: Pre-calculated DMI table values for the blue channel.
+ */
+struct camss_ife_params_gamma_256 {
+	struct v4l2_isp_params_block_header header;
+	__u32 table_r[CAMSS_IFE_GAMMA_256_SIZE];
+	__u32 table_g[CAMSS_IFE_GAMMA_256_SIZE];
+	__u32 table_b[CAMSS_IFE_GAMMA_256_SIZE];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_lsc - IFE lens shading configuration.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_LSC
+ * @num_hor_blocks: Number of horizontal blocks.
+ * @num_ver_blocks: Number of vertical blocks.
+ * @_pad: padding for 64-bit alignment, must be zero.
+ * @table_r: Pre-calculated DMI table values for the red channel.
+ * @table_b: Pre-calculated DMI table values for the blue channel.
+ */
+struct camss_ife_params_lsc {
+	struct v4l2_isp_params_block_header header;
+	__u8 num_hor_blocks;
+	__u8 num_ver_blocks;
+	__u16 _pad[3];
+
+	__u32 table_r[CAMSS_IFE_MAX_LSC_BLOCKS];
+	__u32 table_b[CAMSS_IFE_MAX_LSC_BLOCKS];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_bg_stats - IFE bayer grid 3A statistics enable.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_BG_STATS. Carries
+ *	no payload of its own: the engine is enabled or disabled purely via
+ *	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE/_DISABLE in @header.flags, using the
+ *	grid geometry already configured for the active stream.
+ */
+struct camss_ife_params_bg_stats {
+	struct v4l2_isp_params_block_header header;
+} __attribute__((aligned(8)));
+
+#define CAMSS_IFE_PARAMS_MAX_PAYLOAD				\
+	(sizeof(struct camss_ife_params_wb_gain)		+\
+	 sizeof(struct camss_ife_params_color_correct)		+\
+	 sizeof(struct camss_ife_params_gamma_64)		+\
+	 sizeof(struct camss_ife_params_gamma_256)		+\
+	 sizeof(struct camss_ife_params_lsc)			+\
+	 sizeof(struct camss_ife_params_bg_stats))
+
 #endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
-- 
2.34.1

