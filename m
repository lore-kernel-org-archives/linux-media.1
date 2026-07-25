Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F206F3EB0FF
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002956; cv=none; b=YVkpmarkg0y76JFu669hcymOqVv2LBIQK+aVqKP6MeVmJjgRXlHoa/MvqsrQeO30wTb5np3KdJSLkinRv9O5P8f8XJ/GHY1k6YJgTequEPoyHJPqFcAbth55fXuGaxCfFfpTNSRDBfgfy8/UnGJl/ziOg3dUQ7fVfkjZVNXVBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002956; c=relaxed/simple;
	bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nyQahr70Zd6+evVxjvyTZZJrw8+7zqau98i9L6e1NJydMR2dd4/2w6nv/ScwztrOI8vXEsUU7f7ao29lN2qa2FAhG41CAp+kN4518H704Nmh56SVupwCcEZjk+5GDumkp+ZxAXZbyvnmp32GvnP/1dMm2CuX0JrVLLN+mn4/3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUcUWyg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/nOA43N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUcUWyg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/nOA43N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PGwuOi2615503
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 18:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=; b=LUcUWyg301/LImfy
	29dTTFOv2znmCc9lABK4vAfWYBEZxrLyfE8Zei2Fj5F3pRh53eaJIcSJj6dBKdBo
	MrnBickbsnQvH3CcTjrhXr9qX+VaKdO7kSLUmaoBtu+Y4MT9zCUGXxFHGJScNtW/
	D+SPPKOtYKYHQHTIuQxbehqZ1rjcnqbWlPFVeYhqkhN9PMtsgB1VPcENee3XFQv9
	9Rtr4G7QtwbZKcQyw48AtClFpSRrE/84xYg66nv12SAoie5m5G2p1joDCgURbAoD
	NZzpe6JhRrK1Psa2zJEVAPH17n14ENf2r4IxvoiuB2iZeE9R7VejXdMfptLZ8KWV
	KjgN/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqy9g1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 18:09:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso30669815ad.0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785002953; x=1785607753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=E/nOA43NhnKdMX7Dy13A7FW/+7T4qsO0v4RVSUlskoSKfpIVmVAD2wy+XCitoYvbRg
         BDgv2cx2Nak6eEuEg+uIfKmDHfg2ftOGYvwOh8fuvJULVqKqigfpXMmJXIvjAU4VtcXf
         cifaDtCReF+wz5NHxoHlVQCIqnHm8JcrulwryeuNeOUimYDjdO5MVQ6ODhAmhbrVLuPC
         4kM+9uI9j4Kw17oHhsyJNvW84z/uU6u1b/ipn0igAZuP9SCtDchor/pU6iv6t/JVadCt
         ZhZR9/tEcvrs5VynrW33xTBuMJjN3xVq5Z+V5/7fpHqWmi1pkcc+3glsAGY7aFJw/c3N
         C9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002953; x=1785607753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=pHNpMH/9/scDVJqsqc0bhLfebz3zyRjvGBKzLQiYoykffd0gh18zDJ07kv15Ypka/K
         dw7Oqnwd0AGUJ4DnOnwMP/m5BlyMi+VHH/6JkjFaSbJGB42IuGqSKyzat2X3lHGat2Rd
         oNFIVEz1dbRHBAn+oF0ajhGZdL4714co0aq5fHHnhmJ9Rs8AZquWmhrkHcjnvN7bdaNh
         FMhXYOOcPUjhQLLkqZ+P3kCuVWcEoI0nC56zzpCJ8rL7kk+Iuy9DjoHuFf8c+l7GA/m6
         HrwXDKMMMzP2SD19DNmO6rnu4xnzqRhMM0lD8XbFZS9Y81hYP2dPSW+lecqGFAxcHVnS
         wYqw==
X-Gm-Message-State: AOJu0YyL0EuKOe4ycs6nbO/xHJeOiBSCyIuh6BJ/RpPRI6J1NtM/aWIT
	tZZtYIx0HSz59QhMjjMvxMuc5f1gUHh4ilWXuDoxAJEUTghPaMG4JrEDRAJerNbzmsU4OVQD89p
	U8jrmtfz6DWrFbAsYP3J1AXeH4Fc3WJ5CJYOYDcsyS2s9iUd+wigNc2UceJN4ZF4wpQ==
X-Gm-Gg: AR+sD12C+K81Wm0Zy36IeGMRV9IMIJa/NQ2HlimLap+8GmkxpMQZHcYk2h8nWiHw7eQ
	P2W6IDeA9POSiR34JnXj1+Tw5D+bRuUQ2mJUc0VVN5NkFC/LugcAvQyD0vNDu89To5b+JTUyFMA
	0oU+9FIqxNgh3Rllk3konwyQ83EIJvxSDBPSpxpr2kdC+J9TVqi8q9nXdqWQg6Fw+CUnE2nr4ci
	WkyNwAAR3Xq8jR/s7M8vQ/4ypriy+Xu547TuG0vhFldm4EjW/LQmJjpUXkp197u3kItv5p09PbH
	B+Hi8W1e0gFNZq/kVd0bTDiTO7Cf8sSZltOtNT2R0qA0s0/1gEfMabY4j3aN/SjoFH3pZE1U9Zo
	ynyAcBGHGWnJX3TQgavjTXS1UA9tUl6c=
X-Received: by 2002:a05:6a21:389:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c67d9b3db0mr2834694637.4.1785002952872;
        Sat, 25 Jul 2026 11:09:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:389:b0:3c3:812a:2198 with SMTP id adf61e73a8af0-3c67d9b3db0mr2834672637.4.1785002952425;
        Sat, 25 Jul 2026 11:09:12 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm12592642eec.10.2026.07.25.11.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 11:09:11 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 23:38:52 +0530
Subject: [PATCH v7 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-iris_multi_slice-v7-2-b4365c4930fe@oss.qualcomm.com>
References: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
In-Reply-To: <20260725-iris_multi_slice-v7-0-b4365c4930fe@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785002937; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
 b=5aVzxWfCj9vXuYdXUt1d6Mq+kMJsf5iZgrRZGYkyDUuEezK49o09tlv/nwQA9fWB63wHuOVBT
 eBWjfdYljmBB1+6iUh+KdOvXQkVQu6TuBzvAm7XCjZ1pt/IHT3dtj2G
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: m01ZX2nQHXrCuUym4w9RK4mMeXmvgT0L
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a64fbc9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m01ZX2nQHXrCuUym4w9RK4mMeXmvgT0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX2DBEreFdj7jG
 ii9PY7f6UzZ93ZEoGgNPPLPPtQGFZl8TuUtoopC3MLx+XLwDA3P5xSP8cdHsv95iCve27I05JZf
 YyPhDIP9QKxqJbPvRPXYyiWp9tumNXThjKT2jPWzJ9GFLkJlmCJ2oY2KGl5NtsPeIwlpdp0A/AN
 G7fYhvI0KTlCNfe+DZNmM+Qwoi6yqWKNpJQXMWxDsQvb7f1BuKIL6BkK74p4pTQAJi5B8KRA90Y
 KbYMyzX4SHrfmfejFzmLEBZzvA3aClwRyOVIbZA8LZRTwWQJlKxPxg4u1spTUQpsP6w5xPYrFkh
 QWPYaHUGi7aykni/jfA7AJ0gD8JrI+aWSJsBSzZvv/C/+9lVDU5Hpaj+dP0kANCzKnA/E7geW8B
 i4tXtirnwNm4PPsMA4tCl+yFOD13hjURPA1Vp/Lr/mpDVvggfnaxZRteLP0QxyAfVzMcxk496vJ
 cpPeSLy927RWHyk2l5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDE3MiBTYWx0ZWRfX5WobQkhfHveb
 djci1DhHCn6lMfW4F3OlWJ5jcKz2TpSDm9DGDIIdA/rmbyRqtJufZpdWpxXSrHfbIMrsgYJdNlk
 sG8a0An/ueffS79nazGKld68ifu2b/I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607250172

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

