Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029EF424D6B
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889369; cv=none; b=uOG+QFvnIVsfTHm8Pm5Aoo4TVJo3iBHivEdv41pu5sV5DQNG+TKrQSasd3OU+v7kqHtASRG0yHMyOTBkEqVy5IYAe4u8IQer8nXWT94pHB/QV3tmUsVAKoMRDsZifXvwV5zCV18dX9HkIu8SeLGxEVABps98fJZWjqxxJYVuHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889369; c=relaxed/simple;
	bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWihpp+8tXGgOeZ9xCh7zKN7rj8ZOAW4UgjC3w6IOKFYRUnZEvmGgNoTd2f1pMnM00MEkPS/zkExzOLgxVxXjPGg+KdrAfRloKhxdZ7CbFF23TOX44ezARMZzUfJLSmJS93JUt0W6bK3R2cR2FYx8srCDvHBHQ3lC8m56Up+bGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKtvT5Yz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDhZ/1kc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKtvT5Yz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDhZ/1kc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADreo2616192
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=; b=fKtvT5YzyjkVJW0f
	sGgMI3kkwGtP7hzyiBnE30SLJ0RpWFdGj6fI91spwbbQN3cGaN0wCJWdvciI7a3o
	ZQJFoKU0i/xnR+xhhshIFy+2x3UeKpX7cS3M0MKHzztd3FSveW6t6HFlZBDJ033X
	WJPQE37MuIr5pxStxOBI4OSVXialdCcD18kawiM1ueRim5+Fm3GdDJf4Wm3whG2w
	rFU2H7SXDyoJ9FN+zgwBDfe+PxdR9rXBvIF7AHZLjbrmInw1bH6UsM4hV3mLZ37V
	Gls2ilvGUMoldZW51dbXPmMbunCQG4HDr9HdxwCYWW+RBbdb9ftGVGUfU/EqGaBy
	LleecQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9bs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:36:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811279d51aso422719a91.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889366; x=1785494166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=iDhZ/1kcfNBFQhkqhZW2m6A/HQEJL6XKgybOSLcg0Wl18AzBzf2xbXBrQxgIQuuTK+
         V3FCY3GSPVhoHHfqFseOHLT4swYUKhqJkJOGILzT+q3S86R1Pn34Ovqh81GwHdK1T5zS
         TO2QhfMw7StCgkSjR+swvfR0HSmnHjn1gv3lu/DN2ZRpOx1sfxzdnWpg/UgJ2WCivWNQ
         lUblw+X1wTcBtjfmgxHEfFsb5+xv+UEtWWc0lwGddLn1/HuscPr+cv7WxMJQwPfkXg3c
         tdAZzuU4OIyueIrAhN/sK0ZkmEACxfbi+z2sJqZjSnyH+vNLVakFd64CB0ww4QqIMH3X
         pmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889366; x=1785494166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqEI+F/1SIBbj6LdgTjUTc+Y69JPX3b2PxQd4sqwy7I=;
        b=UDlXhbyimXfO0gNFKxky9aSYJl2gYH7KQOmItDcghL/vXmlVUKDOb1kNM0BcgK/jj5
         cn4WgQ3HxH4LMI4YeRcHHzc1BYPTfQri/7GJr8RmeVSmxB+O/zosGiB08AiHeEWnxItk
         8AsCcc55mnx51pHJS+fnR64vLKanFy3RfEj0DTsicO5uwUX7qIKK0Xu+6Uw7GMP42v4k
         IlIy5rPMsyWOW/KJQHWO79UJSrk3HMAunexEWc91s1KLj/cTSqFHprJ6WyyBqmH3RZZx
         qYqUKg3jj3Zq6ii8EqQ5H1KKGjRt5qEmOrK4HnRrTrWBuiaOcKujqwO7mnAETKyuIIAh
         WMEg==
X-Gm-Message-State: AOJu0Yyx8lYlLgcID5x0Gnps1GiiJPg4BsT7GgH49PKoVTADDJ+xgtt1
	9xHcPUHHjqodKNX6g+ZxbC8QbtjAaAQ6F0Pz+K7EJxpEU6sTH7E1d/Yxq8rqVyK3VSxJVuP5bJN
	vTM6S2bX2tdVeCzDTF3H3KqTJrunBkKVLGOP+lYL9JOLPj3AlUWB1sj7UQ1/1QHxXK7LGI4zKVA
	==
X-Gm-Gg: AR+sD13MIXKVbwiHqOC2f2PPax+J5xSWCGxaPHpjIkP3fv0yp++9zE8fHJnko98c8/p
	GZ9YDp371PksEYURid/kBqgk0ytdKxvzfgYW017DFcnG4YeQ7fgDu1FHr08pgFBaCHzQYSbRtKA
	A23KrnX0PpZjIJoeQ/kWv930kEigxjqXhCuCTKsr26AaqekS+K6h6oVk7YE8g3bp5FCpGSXfd6G
	NvoB4dWnvcNpu47Sl2XIeDHj24R2dVOHCUQ3hCFX0UwsrVqwr3MAArO1oHbrqBKdRiFcLF4igZJ
	Du1HQy1f2YjzCfwipMMuYxF37EcB1Jr7awU5z76r6kBLvJeCvBnWFqTXZ9B/ZghFN/TNX9GDHvt
	Ccb1yjF1jIXswIW2zr+uKNL3dvXJocHQ=
X-Received: by 2002:a17:90b:2b44:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38ec66594e6mr7039767a91.21.1784889365964;
        Fri, 24 Jul 2026 03:36:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:38e:2f21:3bb5 with SMTP id 98e67ed59e1d1-38ec66594e6mr7039751a91.21.1784889365635;
        Fri, 24 Jul 2026 03:36:05 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm1228657a91.5.2026.07.24.03.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:36:05 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:05:51 +0530
Subject: [PATCH v6 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v6-2-a99d160cb42a@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784889352; l=1399;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=vyhhtZo2WdIR+FGNDgM41Ud6FlKDiGMJM2eDDf1MrJg=;
 b=a+jfX+gHztN/XVjFY2OVsYTMHJNU4SfNw5F/lLT5W6oI8fhZIo686bkoOrhvRVYGmsD45O6Q4
 OZPjRcVsqGXC6aXttqtFVUBWp3x1h/KAigzaXLEGLTFiwEoHGvSPbJH
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX9TiuhvVmnxaJ
 hStYIpShX7W2qEzhRyS3zjJOLH3KPuh06vuLnQ1gLFVr0sm4wS7MPWNVzCEey7t8R1Gz+UyhLW4
 7SCNZ4qq3KW+EV49mevnNuKfaR8E1ZmwhokyPm2gtvuIwt1fTqvaCAPGA+/RquoL12F7Fft9kuD
 ZFMGTpfLiGa/oV35/T0F1cJblDCVzPxUImbLYJ8OKJ0ECk5BRFZDATA3ktXQGW3lYvrahvkA0dR
 N+UKTFK+86+VIDmVEb/guZni8fJrUS/vLmOc+rRVsgkox+n8ycaTdi1NBJklNfeUV8LL8RZ0BGH
 tgW0qwa8zRaNplxESXAyUnm8GN40cyrqPpgvgQHT0gj7RjQnx+zxkGZRonTO+9+1MkqPeSlU7Zi
 iWUDZZxZR6Jql082GrJ2RTO5K8Yo5WR+qjbvSUiNid7JCLVGiXHN52acHBnDXT9TopMuxCFCf/8
 QEj+7IvUuu8iX6zGBzg==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a634016 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: wy_JRKwuOjyq2CswucHBE512Yr_6Fp48
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX/QPFTFiE6ogG
 FFeOkpkVkh9ah7UUp4bxPvk55ULoNAt+NZr5n+aFy17dipW3qaH6MIMjiJpFS88RbZpYYy74Zht
 funs38RvlRNOgMYcBoeqr0pz95y5DNs=
X-Proofpoint-GUID: wy_JRKwuOjyq2CswucHBE512Yr_6Fp48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

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

