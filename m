Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447C23E35F
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457935; cv=none; b=nVpsvQa3J4NRPfR0yajaZzsMfAlJaQpWqNoVtzfQzlszGlh9aN1yxXmso1h5ygKFjyN9fh0D3lVJOvxHW+HN1lOpAjKXPv3fsfyxHY5RKjeJ+R/SwnYM55axgqYeVVqXaIQ7KDKGgDCONVqAl3kiCU/W1IGE2wShtbcwj05kk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457935; c=relaxed/simple;
	bh=UTnwS/2KKMHvEnj1G5hWv78QxtNSfDbjsv+TIRCZ8q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbD9V5TUG2Kc1RCEYtEHkbO4apLD/RY3XJ60eYvbPsoT6jy5IZ7oHQUr4TXNNyPlSDth9wgkYs90WRggX2h9ZnnjsZW9uYtxpRugmSoYSQNajJHQd3vFgTO1971CwNmD7ffZqI/acdZfWw3c4+Gr40gaHqFxMulr781ygHlKq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmAOihVd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ku85ieRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmAOihVd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ku85ieRN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMxcuZ2683382
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVKIsROaFLrBTWGGnB2cmBVxI+DUX5fudtaQeIbEl+s=; b=WmAOihVd/qdE7Me5
	pjnb+kgRM1KpWULzNSUdQCU9bbnkeUFpV8i6X34noTvjsn5BGYyaVEJf+q2+ZWUr
	l7C7GuS/DlkebekZ6NC3R/Wlhg2RLpQw/3r7Ocn+Qi8oYSSMebOfwBooGIaJkWx/
	9MnvCvgEizR7bFvCqEzPh3Du0Y73ErCXWJ7mMX5BeW9PH0jX+pCi7hiy0v9Lw6OZ
	RHzYOFR3JJikFsRn7ShOx0ouoHY7DEbzmCFbwwb479joUOAehlJIQjnao/RDeUfR
	DVwaml4lUqI4o3aTLNbREHrduTlsaYnpSHbaQgQk/WFEGNroHMhmfXTYBB6I5VMM
	fmGq5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfw5r7nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso3470861cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457932; x=1786062732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVKIsROaFLrBTWGGnB2cmBVxI+DUX5fudtaQeIbEl+s=;
        b=Ku85ieRNk1gI57h7boe5FGbD26zTcglsakeM82EX0pS6JgETijAwDMvoQdPvcJ0o+M
         DaJf42sA0Y8KsiMDyv/g/innahpW6Sb6Kx/ZsOSYCO40GkRPLdPIWChRDqvY8TlYgC5B
         zYRKZeohnQlXeHhh9EBpaEAbw3JBtgwDoO7Nk90uzYDXCa6+cL8MEZppwB+APIIVHbb/
         yCqwv7FdaxRgyev/Vgu6Ruo/4V7nbzQq/8uu9dYuUwEr1oKZjYOE1TZ2TOQmwwcMuZ4o
         jWMLa0jiFCTSlAzMngt9Jvsmq/j8OGYJ2RBum6ES719w1NvO/R4mD+Zkb2KY+WsFog7C
         DUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457932; x=1786062732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVKIsROaFLrBTWGGnB2cmBVxI+DUX5fudtaQeIbEl+s=;
        b=Jh0SWM/Xa+uF+d2nO/BFkRAr3Y2PJ5UyjzE562c2w+hmn2iSdfMbtUzsKuzq3uHBVr
         kZ6xYX2/n8Ky7P5BroEzjTyyCKbI0tWAQcGb787XrOCQ0oeuNurkCnW3BDU301TG0qGf
         EEiuO4IC7ZtgCxT356mdGQ2szbggikSGX37YVpVxnxybtohRHBtIOjPucowwF3Xzz2bg
         G270S5EM+uQrbflRKM7NwBM5N0ull8SBALVdCqu2PW7QiHLQHzCO7czfvo6JQA+m77C0
         wrK34kEFNs0FCqdJ2uOWrMZ1260d339jsztKDncZwsHFCdSKtxeoMsgqpMqd0Ip3rKlJ
         t42w==
X-Gm-Message-State: AOJu0YzhHVPoOfm164Lf1dXgccfh2ikGj18WiBO+S8DnWCe4/aOlyqfN
	N66QASa3LN506zDjhHyHx2xQO912AqGcdWEIsOATjyRMBtMoJ+dRVSdWlXwH0VUWTiUR9gJX6LR
	ugY6AAkm7+Ptl75TXKcRfKikEVBo8SHCip9kLnPil1U0iOoDZlIcXwjzYSVT9odonVg==
X-Gm-Gg: AR+sD11wnn9ChaM4hLQLOG5gowp5QQHcNrL/3ngJK2G0f7N4A1bzuaEGvF6PuOaV5BF
	TEwaPyJsBGnJaNvquVdl0H9VKcoKSN1Uh5oILsMAlBv2NSruhXG9EWIzCoOaA8BI2CZnyCt+ZU9
	0vihUZHuffblskU/NTRbNCvUFcYUwDCm3fNQACPtKPdg4UcIkasAhXbojnF8NnHj2FNCzUMWCcc
	zoSSt8XXJAk3gIBOyCoQgevv0YOQynWmPLp4CbNIw+hPHyYxnepCVEbed2GGiQUYb/8+yDddbmF
	gft4dE7oWFZkGNyrtsReoQBBOdEtF2ab8UIeg1fEX3VE3D+GYi1fLPGvPYV9gcxFzHkxItBiqO7
	ipOz7FCFj3SzTuyEqgixoQzkxXaW379rtn8jV4FbX4pehllVobbohTrwyx1U6UlHpFS/g/ViZjG
	MsObfLp3n8/7+RpA==
X-Received: by 2002:a05:622a:2509:b0:51a:8c97:9383 with SMTP id d75a77b69052e-52b4b07c9c0mr964361cf.58.1785457932279;
        Thu, 30 Jul 2026 17:32:12 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:51a:8c97:9383 with SMTP id d75a77b69052e-52b4b07c9c0mr964171cf.58.1785457931876;
        Thu, 30 Jul 2026 17:32:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:43 +0300
Subject: [PATCH v2 4/5] media: iris: reject open() when the session limit
 is reached
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-4-94c002016a09@oss.qualcomm.com>
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UTnwS/2KKMHvEnj1G5hWv78QxtNSfDbjsv+TIRCZ8q0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z8pcYXFxCxQYZ5HVdyRAo+4mAppT+Dx+uFq
 z+/3vsTq3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs/AAKCRCLPIo+Aiko
 1RbUB/96EDm0/+sFBiakv8N/d/MwqjNAj3xbQZgcnod2Mz46RHG23UrI9zlAotJhcq7K9JxEoNQ
 W8xVZLXCcuMFnXEzyeKDHZXpNF2VSlfP/jQlhv7v1MTuNedpnI5jr+qniO2/prGams3F/LJep0g
 7NvCfxRK6qFXdOXDWqx5PCa3Pi5/HIBCU5IlFMIOUwRdgCsCNCTogvH5qjWkmEUPsZonZxPXJEm
 zlMAbItBMOZTtJW0AepRvuxRXcWtRpfhunZvZiKRMfkfQYMUIV+38KT1Hz9GORoyWREWdUyiuqA
 fRTserw2he5KlEhODQhvZdZKJH9nVPiGJ1qQ0OWJUlOby35F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Elq49UXz9s9SZJF2Ja1aNDjo09shn6qk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX95ZGXHdaOut6
 EmOTZOY5VBV7Sw2uwd2Okw5aOB9m/FYoTM9Mcz5dKdBxQ1GTT/TpIGLZ0V0UGoTFrtkhm5697b0
 mXY0ZthkEizye5K1zsuOhSUOam454Dk=
X-Proofpoint-ORIG-GUID: Elq49UXz9s9SZJF2Ja1aNDjo09shn6qk
X-Authority-Analysis: v=2.4 cv=DconbPtW c=1 sm=1 tr=0 ts=6a6bed0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8bbKkYRu5Ug-Ka50F9MA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX2rXTyoVO8f4D
 MydsK9u7J2w0GnE9XkopCbaxr5NskDy3W6tS1Ogfg5Zqg4Nm0f+U36s+kOxqzQwG58aC2iEerD+
 n0mb/uUbmwfUJrtbENH9izZPZVsjfoaB4YO9w8VxYY9J1wIVpfw9g5e5jfqYX2+7JcdbeAsPwTh
 3ZZ8e3XlyvAu6CiUk1ULmzNAAfMCImkom6M1DMhDzGd9tOYVJ/VqQyNMNJKhL+Lt2OLK9hzAb1E
 Peg0eCeVJEMXNsPe6vuWJ9NrxceErnJykiz2qUOEs0LeLhgqsmJn4bxS8o1q4vLLmn40kNoHM26
 G+9TGyYZ756S34f3qvjzzl/0iut/31bX5D1Tn0DaEcJEBfQeg4+5XVJ28rQbhGbLmrWWtzpMzBI
 30m3s6CH+mEdKwYaVRVEjR2/EPZJnCXiZAXo0xmOXiqEwGQxfkt4DTvV/0loxi9XR5dzZ+R+PT9
 Hpyod13ol6CJMICbbbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

iris_add_session() silently skips adding the instance to core->instances
once max_session_count is reached, but returns void, so iris_open()
continues as if it succeeded and hands a file descriptor back to
userspace. As the instance is not on core->instances, firmware responses
for it are dropped and every subsequent ioctl times out.

Make iris_add_session() return an error when the limit is reached and
fail iris_open() accordingly, freeing the partially initialised instance.

Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016bee..4ca9185b3d2b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -40,21 +40,23 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_exit(&inst->fh);
 }
 
-static void iris_add_session(struct iris_inst *inst)
+static int iris_add_session(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
-	mutex_lock(&core->lock);
+	guard(mutex)(&core->lock);
 
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count < core->iris_platform_data->max_session_count)
-		list_add_tail(&inst->list, &core->instances);
+	if (count >= core->iris_platform_data->max_session_count)
+		return -EBUSY;
 
-	mutex_unlock(&core->lock);
+	list_add_tail(&inst->list, &core->instances);
+
+	return 0;
 }
 
 static void iris_remove_session(struct iris_inst *inst)
@@ -206,12 +208,17 @@ int iris_open(struct file *filp)
 	if (ret)
 		goto fail_m2m_ctx_release;
 
-	iris_add_session(inst);
+	ret = iris_add_session(inst);
+	if (ret)
+		goto fail_inst_deinit;
 
 	inst->fh.m2m_ctx = inst->m2m_ctx;
 
 	return 0;
 
+fail_inst_deinit:
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
 fail_m2m_ctx_release:
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 fail_m2m_release:

-- 
2.47.3

