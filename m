Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846217;
	b=ghzAhVqyDx57lTl/bTZnw+VGAE5ntwd6b2VjKOKi7ljfjWD/68XXoKBamjVUz4IBzqNm
	 24rIZd0KWVTyPHRo5J3RbZeG8Fx5tbif1m8e7Y+KP1w6wYTP+bFyZl12ApuBxAj5Z1Y8E
	 UpsSb227isIX3A7EFAKcgy8MP9zfhrgnNxQQsFJYCYdmwuZrRzCJc4ZiVOxUoF96aoz79
	 qeFzXkwe5a+zkMO0cJh+6PIpLO2x9r0wxSyFBvbG2It+ox8QhUxQwCvA+nO8Yj2u+E0KV
	 lC997EnyHXW3kwVVkvjYHFE0bTmhMNvlpAxPiVsXWseTEZyicpx41YHAdy+4+Vv8opQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
	b=DVtR8UYruMewNo+V+IoopvGxIBjx+Mbn4ZoF2HEyTFZcX7zqFZtN5hJL40hHtYA9WZ9c
	 WUBOonr3kjpEVuXyK1QCAfK1oqhH/dszbBDrK62RLFr+uLDPKZLezzLyrgHNaCekzagsC
	 KyOkC+RNOj85htxlJX2nRgwPTFYxkt4gC1KjciCcvVAgmYOa+GLbGJo8TmtxXcY3s8925
	 f1jOZk6Hoz0L6zetsiFDx7A92BscUFrTBTwN1Y5gFp+FxQUTQsDPItjl3Tjwu+74a+OLw
	 t1MG2ZcBdkahZwVXNzXnqYGmH2aev53kRyKVHutgTsdinsNG7MEInu1uY3hvhqZGCPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocs0oWpJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hF5Xun4r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE6606A880
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EE6606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocs0oWpJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hF5Xun4r
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIiFl155585
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sFBq9fRHwG6
	vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=; b=ocs0oWpJUltcBLfrPCQK8/iel1Z
	hOfj8zFNYEYgxIiVj7PJAF9gv0NO8IleMWhFrQDCZFPVxXrXxAfgWfxVH8/aNE0S
	h9//dADdIwFcXWZAtZkbIX1GPFNwmBIBvlu1T9h3+4/x+ZIr6MkFyiID0Io/ASsG
	hnc2bnMp/pBQJKAl/NbbEFKgXWJh2xptcgYqrWh+lfPbg71OYI+jHeoXHTY5EmaB
	slPM5ZhM/p+gyxRHxn5rzaj2yk8tGU3EERnLNX6QMMt0PvygOSAZrLYHhd1DtsHs
	KPiMNP0BcPZlbD1ODJrOg1niU4pAZXv/dWyAw96pUMUNmJcBZvRJ2Ec/o7Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghjnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:23:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so3226750c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846215; x=1795451015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=hF5Xun4roGT32JNeDjvG8uT1xx/v5T+TKrD/bfjHKF8uULwWWjeXtZOtZKs4Xl/NH0
         0bXeSbe+M4WbQv8LQCSWKrZiOTzP0RqMbXMC3CS7hjn86/vFLEPKs5kHHdkW/nV2llxh
         jAasu9P14vxIASCIQiJ98CrrbH94RMeSCt/ePHSeVGmzQkpIgZaJWsl+0u2xwO/i/bqR
         KMaFRzMvFGpLtol0domelt0BputIax6VFGpXaWsGh1J1n7vTUUL4RcarSPfoqDFE4zp/
         sVyCE1Uqa/JuWSnpyW7IwrzOLvydRpeABB9pFQIi6AviCHjqmC3Jyml11yzhvSMAp9MT
         2MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846215; x=1795451015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=iT+D4Qd4aeddpTu0stwBC7sLPc8wXMoM+zfYW7dulsbHGj+QxQrdPp2qo3nbQ+gQ0X
         RbbCjKB6nIq9kZnNG//7uai4E9x62CXxLh5M0Iix0t8Vq7bw45pRpnglhkj11Ku9GMzv
         1lxNfqn16l7/d1tI/VMBut9md8mIOOZNdzrrn3sv+AKmjFxA/IEIrkoUYj0hg2CS7oFg
         qxJzHJsCVWWootyiO0VtxrdIiQ+I+hY8+BhPJB9tgzgr2g9zGPj5zr/KCuDJU0zEMgwR
         y/Tjoh/goB0s4+yJy81EO84+qUtSoQgmP+jUZb4U+wvU3sbtPPYVDaJ8vfLPGlm0dPsA
         pa+w==
X-Forwarded-Encrypted: i=1; AL+hErFi2oakVM686ydrvXsnd9yCU/moohDNz23qZ42rlaZP4z69MrUZ/yh1Kg17wRJSwSjqQH9CL43OzMQs5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9a2lF93LSdH0IBz+ZfqW+W38VVfp/J6Mn+jtbRlSK1b31OwAll
	q9keUt2pg+g1vjOA0VlyVL/T8ggeXK84xJgnHJYvyTQ0yhnr9+qcVTzEGRcOcGA9Vwhw5VgozQD
	e/9JTJXDF7//gpvJ0cB7naj4GfOiWmWXYZDucTCfbrsOkO7xfgkSvqPWKvcs40iHwqg==
X-Gm-Gg: AYBFou2YHV4M2PEe6a18v0EJxyObDRKXmT2nCjvN6ZWWBR3Vq6M6C3UADXjmmMZodOK
	8bYbSsWe4/DLTE+pl8RGb39Yg4xxF9rtD5LwLcgNhSmHaq/fjiRjopcNWlHXOJptiukULf+payN
	c6LKZmu20xSNyvLA1c7NCInxDKvsmWQb7kz6eVbBHIyPSpDLMM5wonrMT4Ah3R761JZUNOVtJcR
	4dzqwtc44tgwxMz8D2Lo7UI4zkaUNALtJypqYg/nxsAgECGdReOU+8UcRzeHZFgqNxRX+3BD4EV
	0ExKRg21d6pkpHDQa6I2e8qS3/AlRMl9iT3r8L4oNiqi4z+hc4OvWKm2YiLAzX+D0nRhTYV5+Rz
	73yvX1PjA01bTMbvUlJGD/BnmTMik9Wb/O50iD/I1+OLPFYNRaYE/Im3/OOR5ei9aLP46U55IPp
	Q5
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr10929055c88.14.1794846214620;
        Mon, 16 Nov 2026 08:23:34 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr10929018c88.14.1794846213999;
        Mon, 16 Nov 2026 08:23:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:33 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 9/9] firmware: qcom: pas: remove qcom_pas_auth_and_reset()
Date: Mon, 16 Nov 2026 21:51:48 +0530
Message-ID: <20261116162148.2864501-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX+Ncqfs5bge0N
 9/EsFrZM9lS/i7LKpq4Zk6Sf2+0ThDW/b9EOKfL0Oq215aQcaHXEdQNBhbkaauYQ6OaWPPix2S7
 tzexRHoxYAiGpRwwBRfzW2AbQUDzVWTFO0DBZBOC5chqwWvdd5UuzvU18lrePFSt7w+2FKp8nz9
 lEXgf2Mq8Wg2qSweWdljEyu5ybolEcAO1JRTiZdSTCu8YV+hgvncQjM1P6fR0utXUOx1q1CtfHF
 i6hx2qODt9A3XPbhUJHabHmFCX+poiXkJdPRYNZwsriXIoEDYihk+Qr95zHHrUEu63Z5R8EVMZT
 wCzJP03byJo6TIQ/qtW3wOLNuTjh9m1pj2hQav3XV/yozICz5hFpcU1nlQAymPobIfUh1az/qJ0
 19uLtYUVncCxYk2g5Qyc2NEgrfHRBPjY2KiEXTekfPCWgF5lDRK51fS5I2ugB5KjrETPmvz+QI+
 6FBnfyJou5OLwhExD+g==
X-Proofpoint-GUID: ia6GPK0rXTvMAEPrZmLMj2FdWMu18D2R
X-Proofpoint-ORIG-GUID: ia6GPK0rXTvMAEPrZmLMj2FdWMu18D2R
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb2e08 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=sV0Ut8U-cAKt8JUqj3YA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX6Z0X6Ui8AsWD
 sZ6RflFYASNv4Y/X/6ot3vWHz244iG3ZMuM0jUIWkrH5aS1hdaT9sbvHqPtq4+5/2LiwszWs3zA
 DnW79S/2lFQnlkLRA09wADSbH7lVLbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

All callers have been migrated to qcom_pas_prepare_and_auth_reset(),
which additionally sets up a shmbridge over firmware memory before
TrustZone authentication.  Remove the bare pas_id-only wrapper, its
EXPORT_SYMBOL_GPL, the header declaration, the auth_and_reset ops slot
from struct qcom_pas_ops and both backend implementations.

The internal helper functions (__qcom_scm_pas_auth_and_reset,
__qcom_pas_tee_auth_and_reset) remain as they are called directly by
their respective prepare_and_auth_reset implementations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 16 ----------------
 drivers/firmware/qcom/qcom_pas.h       |  3 ---
 drivers/firmware/qcom/qcom_pas_tee.c   |  6 ------
 drivers/firmware/qcom/qcom_scm.c       |  7 +++----
 include/linux/firmware/qcom/qcom_pas.h |  1 -
 5 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index fdf62003fbf1..08bf3a8d3bf6 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -184,22 +184,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 }
 EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
 
-/**
- * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
- *			       and reset the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Return: 0 on success.
- */
-int qcom_pas_auth_and_reset(u32 pas_id)
-{
-	if (!ops_ptr)
-		return -ENODEV;
-
-	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
-}
-EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
-
 /**
  * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
  *				       remote processor
diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
index 8643e2760602..a296be2be8c0 100644
--- a/drivers/firmware/qcom/qcom_pas.h
+++ b/drivers/firmware/qcom/qcom_pas.h
@@ -18,8 +18,6 @@ struct device;
  * @get_rsc_table:		Peripheral get resource table callback.
  * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
  *				reset callback.
- * @auth_and_reset:		Peripheral firmware authentication and reset
- *				callback.
  * @set_remote_state:		Peripheral set remote state callback.
  * @shutdown:			Peripheral shutdown callback.
  * @metadata_release:		Image metadata release callback.
@@ -37,7 +35,6 @@ struct qcom_pas_ops {
 			       size_t *output_rt_size);
 	int (*prepare_and_auth_reset)(struct device *dev,
 				      struct qcom_pas_context *ctx);
-	int (*auth_and_reset)(struct device *dev, u32 pas_id);
 	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
 	int (*shutdown)(struct device *dev, u32 pas_id);
 	void (*metadata_release)(struct device *dev,
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index 1fca2712d791..525b8a02ae82 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -331,11 +331,6 @@ static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
 	return ret;
 }
 
-static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
-{
-	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
-}
-
 static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
 					       struct qcom_pas_context *ctx)
 {
@@ -412,7 +407,6 @@ static struct qcom_pas_ops qcom_pas_ops_tee = {
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
 	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
-	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
 	.set_remote_state	= qcom_pas_tee_set_remote_state,
 	.shutdown		= qcom_pas_tee_shutdown,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..b0f96e751167 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -855,7 +855,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
-static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -896,7 +896,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -906,7 +906,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
@@ -987,7 +987,6 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.init_image		= qcom_scm_pas_init_image,
 	.mem_setup		= qcom_scm_pas_mem_setup,
 	.get_rsc_table		= qcom_scm_pas_get_rsc_table,
-	.auth_and_reset		= qcom_scm_pas_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 458075868bf5..53b8d9631f22 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -48,7 +48,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 					      void *input_rt, size_t input_rt_size,
 					      size_t *output_rt_size);
 int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
-int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
-- 
2.55.0

