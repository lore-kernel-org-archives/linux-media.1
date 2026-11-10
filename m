Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304706;
	b=rsDY/5vQKzndU9OJe/Zp4Grm6+dVVG/TizMf6YuBNWqFlU5u3LPtLuijjFCGA8yqLN3q
	 Cy+ZusQfCYQVZVJHzCKu7Pl+voe2gv85fhXaVG+aUFJ11K+M/7DXIRr93bUySBFFiw3hY
	 erl9SnIKYiHTFAFQB9+F5WSyshAMlzf0Z3rUMnVuOz+UoLcBOkzhwMi7V5N6MGCJ4f12b
	 Ub17JT+GA5WZcQd6nlohiE/dvEwKfRvfcAvF5ZcGifs1DhMZjtI2mjl+dZciudbnoxSDO
	 PjQqugTkhYlGe/h9xdhSxuEVuh+vnXSB5I8GzQWDtpcRFeFn6+18z2QsVDZt4qjFT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
	b=ahZto+ME/PgC2fpdRiPzpJI+OzKpRpAJbnwzKWns2Q++3TYCx1Eg8L48K2XN0DMaNSYu
	 cXs0T5bnFfxf5Dl7kWy3Jbn/juMDqHvilXJMwsAz1v/UvzVa2DVMwWP0YrMLMtivIeuKz
	 qVyJa/AeqBmTs/moVWPMHPP5suoVJrzEwpA3fCAimsbHtHORv8L6US9P8CxnPehuSzNfN
	 bXH9BQqSNGaOlF9pjPE5TkSiqbi78M5dnEfi1Bc9M6MilmqW+euWe5hWhATFChjet/FYG
	 1e7NEzo5FQAv2/eMVzQqoMFnw839ZJVFrx1XfK9s1angsnwjsBCQquOThkS7dIZrakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYiODmX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Otdi77it;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A660A260A
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947A660A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYiODmX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Otdi77it
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kxYo2770471
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=; b=YwYiODmXjRJmEA/T
	q6P88I1GJDSo4yWM9K4B4cXdQPe4Sup3CKQdQ/kwbqzIKkiDN/H+NduBKs40F19E
	izpTQjJq6+VS6SwjIYWQ3WjRcSkshwVOgQnfMWFFSYSug+Q4RzfYO9sNI/Vx90/O
	Jr36nEk2KAK/FdAfD/W17tDBGC0nsTc5yEzzo9yTjA/nF3mkYgibEwQfjPtMLzGt
	G2fjK6hdJ0rKUSmoXjxEcHrTxRTSxpVhvRgqwQAlm0tfhMH9Fag9jE9OxlLIU4ek
	HTb4YprNc3AGKWKZEwWDzZ4ZOJCci/6nSQsW/mFuEabjNh+IoNFtHheqkXvU7ZMo
	XjtcXQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd95pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso2566020eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304704; x=1794909504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
        b=Otdi77it+izgwgtDLbp57LDDZqQOqXRLIWmRpYccc52WvWEzD61faPbsaSkBCZ3ZfW
         uW6H3PKJJEFGLNKUoSt5sEBh+B/Ean833rllfLs5XTviueJDKRbu040EC6E+yguRNxmZ
         I73G2NvH66WCwT4cTDYVarAsP5/6QS51VhL7DvqwR0qALIw/FcjS7FaXuMB5Hvsar+yN
         brWWMTf+l2BcEEVKblfdFwBKQXo+hhYd8ccSjoa+tVwGBODwKK0rxVPoDkXUWuqDk2i5
         PiQNzlBoBH1N8sxqwPMHCT+DplR+SaHyI7oulYPKih0/WWMOwRZ46h55aeqf0bgvP0CW
         uvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304704; x=1794909504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
        b=xUX5zLY1qtXfVrjFVos0Mu6d3ffBb+EoBvRuMFJMnLr0EslCcJoasPGrOLEbe2qIeX
         pvutV3+tisppJNUrZLtBNLIYaURhpXFhGt0KX6tbVr/Xg4gkCpB7Kpspq/43DejMLiSX
         sr4syWtd4akLzIKtd4PT3PJmOkoDJ0WK5saehh2doNAVaG3+f5yC+NZD4RM3dFWnzaA6
         BV+g0LImIG+vKd7qzrQ0WApcwo4WzZBx5f/HWT5y/76fQ7JuIAZ+fodEjlMK2elBL+3H
         GbNZrCgbQlLKgKQeb5XTamYfRzGktkZj4dGxRHOv9iUoyf2U1rtshbF3wVkT72kFdik7
         KDmg==
X-Gm-Message-State: APuU4Z8Xc6kkToCj44J4JVeFUy/A9DaYqVszmJWVdAUW4uC78dx8Mock
	Ly+sLZ5ttRAGj23eAAcuDGzARVz+FMwhQL4sQS/HAhhIKZUP12ai1Xi1NnLiDkyreGxzPuHERzf
	8DwlLXC5BvMSsnL89D9vmtggLG0K9jC0J7UCxjMDXqI9geUoK9rhVgzm80LsR8PmHjw==
X-Gm-Gg: AYBFou2jYLYGlo4f+aBLoVciodp9tSJOLy413XWZR/sAKEU6ORaWJcJ8Awvqm6l8B0x
	7FoEyjcJp8dAf83tvvm6R8TY2HX+MmDjmQNVSyBxbYedX/OYnrCUNFcbUflnbtrk/NkN8mbLu5g
	yeLVct4lZt+kGe8nIqm9zFfQAPcr5YcWfFY+b6/hy98kr7d3b+Tmz0KbqvhXDquGJRLZRaeSHOb
	2rLP6HorcldplTv+kmqAAU15qy8tRWrUHw8X5MKuQg3paUbWRQoylOaTHO3KlstDJ1zlemaAdIR
	n2RezK9nO7iTWvE8H7JwcTosIOSlGmSsAhe7CwM17zr6Ww+u7kFtAuYN5Lp1cR2dMWR2TcSD3Av
	JCm3mhNZCG1MzfUJRuIhW/E1n/H5fYgkEaq/vsIDl3m5qqM2G8ME7SvWHery35uY/wc5n2ulw3O
	Ss4iOnSQ==
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr3319733c88.41.1794304703470;
        Tue, 10 Nov 2026 01:58:23 -0800 (PST)
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr3319695c88.41.1794304702767;
        Tue, 10 Nov 2026 01:58:22 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:22 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:14 +0530
Subject: [PATCH v2 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
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
Message-Id: <20261110-fix_dec_seek-v2-2-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=2849;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9rwHDwJH30YYpsnnhv+f/V2usq3fbaNIKrsSLkQDhUs=;
 b=/hEgDVf0nOZwuvoFSkD+o+esSMm6hLP37P8CLEsIJ4lphz70b+4odMYDw+Mvb/WXrlMsy3EuC
 lUHQYXtKKdrB43IWEaQLOuNGVEpIYEmbKzlXHgFRcEWad89f4p03qSs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: RssulUOPdUEMmZEKgt3t6aU3g6du61af
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXylyoPFQml0iT
 kKqlE9hj+MuP1cU0lADsHYlmq/5gptzBF+1CcRmeLzTHBH2MNbYr01Ue09lwBZddq/wCCx2fXuS
 OvLFkLRWesQnEhONiT0PlFHqFibci3U=
X-Proofpoint-ORIG-GUID: RssulUOPdUEMmZEKgt3t6aU3g6du61af
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8HaNI2Vg8UH6
 zGbSzi/AKQGzBaYFiS3HH9NmcYfSC67WgllWwaJcjTeP/szz5RDc5D+P1yXwJLWxLXOl3cd7RV8
 wWJ4h4xVc2ozeVF1Ge8AwcSg+kE2NmwJ4N77KWueJhMae5qt1pRucjPth+UI8ewE4FhnVWd0fx/
 3e6rq70q2fYlZBmrvRacrVJVRnxPzOqDZCJEm0Tbvm9oua7xeQCw3nHWa9KvzjjWfSOuz/XehlW
 6oL/1LceVocFHgpH19IvEbspaUgnvqB7DHX7v9vN0P0sUQ/0iJGHFFmUTVj3znjuHCfQY8gq+xm
 yxbPX3vHESHy4Z0UeayvYGmDBzizIz2Ww2QurHCn/6BxRWzdJSQLvrbmOgE8q+0ROreonxq/vrv
 dtDRtew+OIY5eCL2z/hFlrvfiC8Prj7zkP0iXc9ozJLYsgUnHuoRgO3koEDMxN3wNYigij6ozNj
 nNVWLZSTABwUH1wwLSg==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2eac0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jJqbJ-F1a0nUChmTeA8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

HFI_PROP_TIER is applicable to HEVC decoding. TIER and TIER_AV1 both map
to HFI_PROP_TIER and both define a .set callback, so iris_set_properties()
programs the property twice. TIER is programmed first and TIER_AV1, with
its default of 0, is programmed last. For HEVC, TIER_AV1 value overwrites
the tier selected through V4L2_CID_MPEG_VIDEO_HEVC_TIER.

AV1 does not require the tier property. Drop the TIER_AV1 cap and its
enum, and make iris_hfi_gen2_set_tier() read the value from TIER cap.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 10 ----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..706698201c17 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -999,16 +999,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
-	{
-		.cap_id = TIER_AV1,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
 	{
 		.cap_id = DRAP,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fac61ece177e..9464543836c0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -603,8 +603,7 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
-	u32 tier = inst->fw_caps[tier_cap].value;
+	u32 tier = inst->fw_caps[TIER].value;
 
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..973a6f91a49b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -135,7 +135,6 @@ enum platform_inst_fw_cap_type {
 	LEVEL_VP9,
 	PROFILE_AV1,
 	LEVEL_AV1,
-	TIER_AV1,
 	DRAP,
 	FILM_GRAIN,
 	SUPER_BLOCK,

-- 
2.34.1

