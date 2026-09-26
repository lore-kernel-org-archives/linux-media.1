Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0F384CCB
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442602; cv=none; b=cBapOKxYlQz2WLfaO+2OOmCHVS/zbhUwzMhmWtGTA3eM/6GU1QH6gN6JUHslDQo4R+mc4Cb642ySJR7BP7IQ0i92MhiM/TurLsbNTHs7c4o343IKzLZO1+2L+j3zYlBCqLE8Sn49HBcfzLJzoRGt0z7Vv2or3cRBTMFvoyp75f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442602; c=relaxed/simple;
	bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5gj2hx5FHKlwIuf4rN+WRNLmPWy528JoUpUeOsNFhcSyxHWmf74GOaoXvc9gehQr1s8IAPAkKZDR43G+kkf71BPl3hOL6h3W80pC6YOZ66vt6UBC5wtOkFkaEMrtI3lDvbcz4NJH0DErZrTHR2Fmo5ZK3VmGEUxvUP/tXtP028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzzMPzgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRxr1cKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzzMPzgS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRxr1cKp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxREg3167966
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=; b=gzzMPzgSY1oWD70S
	Edvb/+PEJETLM2dtYzWNeO2194XaFJMCHZyM1RJIjfg86sqWsmjjeuSE7+Q5KoQ3
	ExbbLPj8PQ7qp/c4Ja7HLRp5bl/Lkp+L50uD8LcRaMp9vszIrMDhdCYtrqiYv9tF
	1oD7FZBBE9tGgSNex1wCXzDWKPLbm4lrUgzDPkvoP6N1nTKAhKAEUtnEjMvK8L8R
	S1TipA4z8TjQIIIm8SMpU7XnqQcn898kJTH1Q+NLkYh9fSS7YXxxCLVW/YMYy7tb
	0trbModi59PkHX+R7h2nENJlI2k7SgNRqArcOq5LK0Tbxf8LVcKKQYj8D+TL4zBH
	vlImnQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77js86k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 17:09:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342217d8d53so4290439eec.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790442599; x=1791047399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=XRxr1cKpvL8/sW64hQrDVjh8AT1CCJ8JV2TRfpiRHJVSLV+sYmihPZv23Py6YOCI6j
         9m4v4Y6w3i4uz9FlrrAB8IWbS50arbzGoxxegSl5kr/qWrneSu93MmrrYp7CYU9TYYV1
         m2XAQP8CH1i1wKQDQoInmQnEhEco2f8Q3Qps2NBXfsKiRBCMLCrKPWK242NYdn/VVbp2
         En2zrm3SKHuifPFcL0glE+YIFWY0iTPAzS8nVkWxbHs38JHhgUsPGOtyWttIxyjbFQ+p
         r9aSfdqzEetQq2PL7pEWWRDDDWhIkp2zDMeBKl19Wd+RvreU/HLlWHn84SIdojP6cUhk
         GPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442599; x=1791047399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=aKhxjO/loavMIYJuT6aAAsiBJaWnW7cTgT2y+V+BEwWqZ80xYc/B5KXVBJjtiWPKCJ
         akiCcqgB/HI845MU0oMFAUBvcibRIVBQ7HhFGIWB2FZteUW//ztI+bqsglBHUNJAhDuQ
         jOOC/e/w4zdAculdUZmdL7QxOelezC8lfTBhoifTuxoAcmfkC/u/3dTcuhLtEgPK349y
         D4usqhVlrm3HAGwhzGq171rEEYieowhbKj4AT4PlYKFBAj2kShzCR3Uqx+5FWhBg7qRY
         VYlmU0wP0fR8KWLDRvwhd+QkVzjKqFaNqeiMNVdU5Q39/KUWNI1PYGlEtGYQoln+SphZ
         wJCA==
X-Gm-Message-State: AFq9FYIpR+dobubEkLl9Ph6xkJW2lyXGhrVgof0dPSMlyUxx8QGgtkpD
	IASG5VPMsx75oFNYasuprvMkElhd2R1RV5gl9jsMRKUwwysnyNI+hxMGlyyJDv1Pqssg9of2Q1y
	E+yL5EyaZ6FgCZXy/6JGzUdGk4ZUm4mqbmuHNelr5ZDQWZKvMFKgtiwH42viehMvrMA==
X-Gm-Gg: AYBFou0U5rMLfPe8Vnzkq/jOrq7uM60Tyu1fCKqYef2mgL47JmCHRson6mKjAU3B0YF
	86vO/epefdKnWlu1XGFImD49T1Fs+8xcUkDO7jYmXZ7bx08u+u1L0FspNwoJKzvwGmCCcTULN0u
	S7gY6xaj44PoHNJ8m38KhSwp6HggK4s1NsXR2Df5Rg9JgxV4m3B2Z9rMywnip93S+N++qV3Q85j
	09INCeW5olVZeJiWrs1lU8XEOd5aEbwjkrAHM3vXv3KGDamTY+S1rasZWmhrCnhnXsakCAzOZz7
	qXJ6+V6uqBiJgBicSzCkrWP+Ta1MJAhGT829EDYI//X8LPWOoIl+rNynLIgoADOpw23Ng+uef83
	+TMawQi9PvKaMI66J0etSRaXBg4qw2g==
X-Received: by 2002:a05:7300:16a8:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-34272b3bc7amr3450686eec.36.1790442598025;
        Sat, 26 Sep 2026 10:09:58 -0700 (PDT)
X-Received: by 2002:a05:7300:16a8:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-34272b3bc7amr3450664eec.36.1790442597466;
        Sat, 26 Sep 2026 10:09:57 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm7382231eec.14.2026.09.26.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:09:57 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 22:39:41 +0530
Subject: [PATCH v3 1/2] media: iris: enable pipe for hfi gen2 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-iris_vbv_delay-v3-1-d6894f117be5@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
In-Reply-To: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790442590; l=2664;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
 b=y+MdFOqWykeSskHfEXvGdSGQ7zvJBgCsSX5tqXl9hOBFL7YJ7HrxkxD0iU7JM+7EFuSq7Qab2
 QyOdKbxyik2BOdvgKEJor9FVXRGkJKNxhXO/Rr2oJI65NwwoxUlOERp
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX+ci04t7MUoJc
 d2TIK6EDWRZ4ZYSE3Leqf5G/xDtBCtlhE4FzCyIbJrSmngFYH5HqeeDNoUtHsEQxbzsgUdOrz5b
 GQQj2D3tpD7ZjKLRUJX7aS9UJowRq0g=
X-Proofpoint-GUID: nWJMiVRy5ZQF8sjWEBheP2BuSFoerISX
X-Proofpoint-ORIG-GUID: nWJMiVRy5ZQF8sjWEBheP2BuSFoerISX
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab7fc67 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=loXtWXkZPLyPDUeNfL4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX/1U3jAO4o2cd
 u1aLcK9ryebbfSzZYhtNlsQA4ALt90YrosUV9+YEBPaT+O0Db5s7+qPyW0xfrth0PAoiBr4FA4d
 aqez0KXv/wzvAVE6aGHmfn+/Xixaj9BFI0G6hABFxh+45vJks4eQ8hDQ1REMaR5pLg0UF2TsJ4X
 rjlha4sMxgSQR083hApOJ9MK7nIndJrN/P0BenhVhfTiX4YQ7AC+XOQqHCn89Q7RN4rSu3oSaGe
 OgMsT+t5H7pumtBqxR6POazQXlXhvVrGduzt1I1GlU8Tho3iWarjiK2PAksxJAGv4IsGLTMNwmh
 6Mv2v8R8EzLVmrOttyjY4maOI2m0/kjkdFJDoTeh0E463p5kE+dlGXukCixtvmP5A6WundgH2O8
 bTSv5nJoRXEkwEprzEbfaqVzG+CIHlDFj9FLfLqbfqEfJeXHxS1X8HBmb3eUJdC6eIETlO/cz5y
 smt8RIm9UrJ4vE9U8Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260068

Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
encoder instance capability table, and extend the encoder
branch of iris_session_init_caps() to derive PIPE's min/max/value
from the platform's num_vpp_pipe, mirroring the existing decoder
handling.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33114d80aa68 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -453,13 +453,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
 		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_enc[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+			core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+			core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..45a418fde7e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -365,6 +365,13 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_STAGE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PIPE,
+		/* .max, .min and .value are set via platform data */
+		.step_or_mask = 1,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,

-- 
2.34.1

