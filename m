Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83810400DE2
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884178; cv=none; b=mPQd8FMhhAYTKameyLEP+khwL35zOlwS0iy35ZHvAsGSns8cSyMRMJ2PftbWqhP003Dh7YpUxNTmykbkdkLiYF55L30lTUoos0vTrR3L8geEY/L7461GzIzZ+6Ht2sdyLnsluqBTUZ5kfe9YqcDrRFR0EbI/+/mqU5edpEpNDks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884178; c=relaxed/simple;
	bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YX7DfZprcnxVCq9ljbOR3Wqb5tz0OPqfNa9iYJe+PfFFBR4HvVqlaC5Y5233jY1YJvKHmsdcjXCnrsDF1vATatmXwmVSngFmQg8MgpkUt1gF5AzXwGTDeDhVnczlkEzE/hj+txA2iGyb8lhnB2P6J+pKOyn5qgm5F5gvfC+dJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odxVt0rC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnBnWmFS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odxVt0rC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnBnWmFS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4m0v32139238
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=; b=odxVt0rC9XiA6XLj
	U0BPseDfJUzEWM5ryKsqnOPDGr91/PBDwpZH5ryJ9b8l5IrZmXwoFiWGJAono3vu
	2IGTnuYTIAB1ctE3FZndxMMM+RwSHmGcy86WeDMdPE7H1NLEoLxWrq9rKoHsdKmR
	S+YzEIUkCLBgxinyXMafreCNYWKu2ioZ41QXgpoOynS4e5ReMCh137yWBLPKxXYd
	rxHMlwrGhEB8yWBxaO3/FpUvca0W0GaKT9iD4aMRDylFya0B2WHqxzU9VDq/7OkV
	SmvBYl4l/EyWroNp9QvPAmNu1xcIS/zw2oJe9W8nT5yi7zaxo9dzsDDr0ggyHTko
	JNCvgg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa1b21w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:09:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so3959145ad.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784884173; x=1785488973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=RnBnWmFShwyP4I7wNiJLVmPHru75QBG0/P5O3Ccadp/m4IFijCak0A7iIvMGcEp3LP
         v/ITL3M2nrsRgB1Y4EUccrVYw8drIfgUQD5fyAxvWAQQrcG9iKmcAVxcqBSV+D9PTS9p
         /kmnpfkoixlj0jeuposqHvCMWCznlKbAYoK/otvSwKqjINs2r2fN+JztNuNB843PSpIs
         PZOr3JwJvHFDtwULJWt4ilDmYe0RsJmAyy4MOYtqCwSaUP/6R4CB81fNDOIsCUnJsRoI
         wahsErcnUuX5ZAVqJQ4aqUYfGKd1B/qpDIN6O88IWSXsK3b+/X8LvKfglDt2vfCphqIR
         psEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784884173; x=1785488973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=M2a4s4AKRrL0nkUVaEK07G1PxSl/q1tPxLhO/1YIE55BF9EDYvyII/JNtFJ6irMBQJ
         eOED+99Oh0/7rR30XsWrd3lRS0A6BLAqS+otbKqkOfuFWLYf8s+midyOCOpEAVa1La0l
         KAeOeJAm6sOz6o60ROFfDIfh7pOqtbHDyqsG6eVvBNVPP8ti9kbaepWW5Zk88SUG1ZKm
         C1iYgfCuwbeNEi/qJMKzuC/M0hrXvZepa9HVBgOVBmJ/obvcmiiGr7Log6gfP6Gjt7QP
         Z43B+qk1YzAxTZB0LFtMYxRqisPViw2DXSy1y8fsSIejUZCLIF2LytOgNTF1yG+E3//5
         iV0g==
X-Gm-Message-State: AOJu0YxU7EwWysGgDGzO9cRYZVugWRneUpsOtA8jhBn7diPHNjQIQYUY
	v159B5k/i6Ut5eDwNzpaM1S05gaH9eyB//dRyoWqsAfhRstB1z1ZEn5qC3gFvoTi4mmUQoKSs9J
	2HB6jxv28fwMS3DoSkDKdMTdl+g+t7Gwn/WBTk5ILcgk4/5+YYZ0JZfURJOeKXpaUDw==
X-Gm-Gg: AR+sD10NQhnRNFnQaSTNs7y5EHYvRa6z2g9t9QDnIGQ8bDan47ldKRxx2RehUruuBIj
	+KoGLAJlUl13AUXNMgPRF4Gc3bj5CfF2R6xU8zQpIglmjNWzCRbXKIZnUu3gYTjbbrxithc80Rh
	lcXaXpmOkfbiNeol1ljaSOivc+4YvGJ+KaVdqaQaBzSnp68Ey9E+DlYbm3Ce5RlM0IyvLgpua/n
	L+KfTZy/euvlNqszEl4CP+CqTPKFVlw0QtSXjfJEpc7QwDh/0s4wD4Pi1YCHi+xRpeerpy1Tfqp
	4wqikArMuDjPA4OdfPTAHSfesCxFjCO9R44fgN5uL5rQXptx6LjeinCZpvIvd616zW59x5Ky1Lg
	mvqgk8OzRNxbWmeRVKE0OA9+HvqkYgZA=
X-Received: by 2002:a17:903:2306:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfa9588d7emr73332765ad.30.1784884173202;
        Fri, 24 Jul 2026 02:09:33 -0700 (PDT)
X-Received: by 2002:a17:903:2306:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cfa9588d7emr73332485ad.30.1784884172772;
        Fri, 24 Jul 2026 02:09:32 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm27170719eec.6.2026.07.24.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:09:32 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:38:58 +0530
Subject: [PATCH v5 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v5-2-4fb593d29b44@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v5-0-4fb593d29b44@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784884158; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
 b=Lw02srcT7XO5HNtAvaGhOh3qrJRtqG8UHr/PCbWs9/xeH6CaEsu+nx7z+nuQHY/kCbvzw/Q1T
 5Kz1ATrrEJADoOTil2HoErvE1RZ6Mt/4M6m8EEDITQpm2yZhUKgqOBy
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: bsP0NbzEqkWPCEbYgqbR1he516TCMM44
X-Authority-Analysis: v=2.4 cv=L4wtheT8 c=1 sm=1 tr=0 ts=6a632bcd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX0m8xbA/IMHGP
 aroRHn76/oqEC/GoGEWEmV5iNCCIQamnZmXe70CFnQC3tPuosV+DFjwi5PQSbLxNIQ91k+v36KO
 p74VYEdbHIjiL9fT5dVWZqs5N33azNT4m2Kd7RlTkc3BRoh8nDUMCBgVNj8z+iLZnM5d8fvvMg3
 ggZWKAaJWCJ9fuq4zr1PEtqxtzMCuA6e7AJQ3PgwJ8NVtwiH7R1JK2s/FDR6rrby0AcHNrBePIO
 A9Ui3kEOOQhhA6tuu8d0jUTFWDf6m2GjU+hPLwP2PmIXRyTJDYW8ClvGwhbx5MHa1AKExayz+ML
 t2kySXQ2CN1eOX3K0KVlxXLQc81hihcExCBWct3ANQ9QvJSdx9DsxqlXn01GGMVp+Tkq7k36gRQ
 XHHkXckBlSDhnkHeOAcuI+sx63wjO/Ej897yM1SOZtF56KRXSGpMJJuJAbtmAjxrbYd/Q+jECvz
 /u9NPBCvbCMwOa6dp1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MyBTYWx0ZWRfX8NyOl6o5V4dG
 1aVcXDtEOgr1wKsaJGxoTJ7o2jWqhVbHNvAqyA2sDPq3zlk2RNOWVCpx0Am+niDO/0bqLczKFoE
 51q8oNV3A9r5nJDWLbnckbGjDlantPo=
X-Proofpoint-GUID: bsP0NbzEqkWPCEbYgqbR1he516TCMM44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240083

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 58d195d2ab87..d7cbf6c3614a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -519,6 +519,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	if (inst->domain == DECODER) {
 		if (iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
+	} else if (inst->domain == ENCODER) {
+		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+			work_mode = STAGE_1;
 	}
 
 	inst->fw_caps[cap_id].value = work_mode;

-- 
2.34.1

