Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846136;
	b=VCwaA5HkR1LphIbVJGQtyzjTLXJYacjxm2F5l2rYtZc6yaTWHxTepBJYgg2wP+NvOl80
	 88lMygzZDf89pgLWrTuIEn8pJLQLC1h4wPAhNYKxbuI6u4UpAxBf65NPl7AwVKGzxfj0f
	 I36pXtVxitrDoFRVZy6S7EwLvKKBQ/E4KeDpZBDeyBKxRW7NYVyqSt5w3bohOwQ0yB3i/
	 vF2lIDC3RJIWz8xt11/VB/gDv/PVyi1WORDppUMv/ryc0mzLeHqFb/nuyTZg9Wx4kJz9I
	 wca+TyT24sITauU/YR4XvYsHulamk9LG06OykG1a4d73yrZwH+bDo9xYRsfJ0zI28og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
	b=ICtJEpuVhBvZ6h3IRDgEbjePui03Mhp/PvDwa7fmp/dE7luV/J/xJXH0zoDi7y9opWsh
	 nbT87yO99QKJM1U3kIoAZFse6zaA55lZ2sLtBVjZh8yHPri2vL0nIFje3gvIiET2zcQj9
	 s05die4WrVNrPNU23YTHLw2In935SwgABMZutrAnqbTJQNb8jYuIiNN2VihsEVwFRfCLu
	 3QXF1W+O/u96wGQUDefwWmGib/rGFc6hjK+ktd71Nc/pmS8vdBonoWQ22zEF48DdcF/7R
	 Uxk7MsJ78x6tanhkJThw3FP8omFADakOV45kDnWaQClZpFTUdf0cYWKWkJn5TppgL5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iaOQbQ/V";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C8606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91C8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaOQbQ/V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIWps1788795
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k5XQA/BMzue
	iAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=; b=iaOQbQ/VnwK28Q7DB7onLCF1Vyv
	PQESzDoSFO1a/4RMUY/krilKAOkTsodyyfsg7daDC6nWKq9wBQINmJI4VospHbQu
	v4AvglZihlgUcqU0u8uidncVsg//B3evdhwddZuDa2qW8Sl/Ydbslys2C7JihE9b
	Ehd4oFDFdgQGVzgVIGxsKlcnIhBP9OljwUArJxBY53yks6K/IVXxiKaBrnsV5g0V
	+jBey2O14f2+UkW6oAtbZttFS9buS3FX5nOhyFT0AbtX0kepV8qrBdWEXTnO2m+b
	3o3dBNvbZgBtrcbRlwaXQan6GqLEDs/0yFEA3NOfdGK6LczaMljfKnoYqQw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy9ecr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso1724557c88.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846134; x=1795450934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=idBLOiMAfkhXVjCCt2oOtWQV2K22SbQ94vCrOVFdEWNLgR/9Zn0MHMeKRBW5MAuUKr
         GFtqMH/OOsH0Q/vhhGt7X9KbQ+lhtXMqXKWeZkPVaqc871X0wNtzF0YILFycRxMP0RM1
         IypFac2P+tdGIa7auuHFK6N9eP/rv1DD/yu/EAPhL21jm85IGGEvWqnTx39qvhoBEKwm
         E1GBU6XUI++otMmK8omq55WCxq4jxFXnKGjuQe+omGw9uyyB2e6PhZaJzHcjfklb7XLx
         gSg2UjdJUro6IPcGi6mi+pmRThpGzObfzzyV8S774E8HiHRF7xWN0S1R8tKRYFoXqgNm
         N7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846134; x=1795450934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=oOx4J5SfnoyLQTkGI/2NKrUfJs4zRFnbBTRiZkN3WQtDJ5D90xWSht4yy6GG9oTCtM
         J3CFDWFLQPl9Ssbf5uXEgP1GrkT/XtO/LMC6PrFC23xymLfRUCNBr4MPHJ0ZlZl18m9m
         hBMFAaRZZBnCJBkup3bLb0y2t3uuHyTed1IcQnpUizUMiRXEo0Lp2dhMnqpCEIjLSKbp
         pnwUcuHxSI/vTl0BZg3IeWZYRecqkJuIiv1KpBx22718Vx+TZp+92/eJTIBd7I++UEuR
         YS9fD2JWaCDWxZh9GV3KfwZFDDJQD31NS4JTF8MxsI4jH3A87JQqpTyJPOfr6NbeJg3r
         lXWA==
X-Forwarded-Encrypted: i=1; AL+hErELhKHAty4NXoBN9PjW9Q8Fjta2SkSYI18I7g1ZOtLA6JPQlegpq3t75OzuXb20QQGmdViCK3i/QmAazA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9643r3/hPn52qrmnthqZRzSkGqO5S6sfVxzCsPBiiN/ydRkeSE
	c+s5wysJ1nknZ4FzyLwOvP+giKdhBp0lE2fDpKIvP7PMX0DBwb/aH8E++m2qH+EXjWZHdhKWtr8
	X49/2QjYQ4EQWYQARqAu2RFIqyDL5wn5QgbL3osH5TKb7E93NtE1a+65WS9Zzs5UKSg==
X-Gm-Gg: AYBFou2lyXFFevPKq1NKbEko2KFvZumSez+DSdvb0Hwt7BA5bnbLHXNRWvCVwCMSf+E
	W4cx7wzpGHLrV7x9dpn1LMNFWudAuFRWrAF2Uo+9+BkSP/ebqdyL7Up+6YUAwJv4VE+Kxpzxtgk
	S6zfNijZCcLy/MU5fX/42YLnWga6KgIjC7OgadTeDYEmwiKottniAJskDU1soBRbp1XZXudiX5T
	LBlxPJOLvBLIJQV/dJEooKH5XfD6k3LirmnmJKbjK42gMdOi5IcHgJhkE2MgJSN63fifU1KVGbZ
	Ig/os6mO8eMNxteVI6+P5E8UpAalSjI5MXbVseoI7SOiWbzwd+B8ZONFEunHDeL67Abq7xNMLrl
	K04dNPcE80fhBpPceQPoouj6bNS/v5eqkkK7+ZIOrVD91i7y+6Iif2C2wqLl2+iGmoxOoaR35oy
	ZZ
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065909c88.19.1794846133568;
        Mon, 16 Nov 2026 08:22:13 -0800 (PST)
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065862c88.19.1794846132861;
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 1/9] firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated context
Date: Mon, 16 Nov 2026 21:51:40 +0530
Message-ID: <20261116162148.2864501-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwwMM+vodMiE2
 vcGVRGeGIz04hJS7NhmAQbMCD6FVaRZaxhKUbWYuctmLrKvtKUGl7AOhR77MQcNeb2uiy/vv7Sb
 vAWZxz9/0ZICIjjd5kH2rfcp66+00mE=
X-Proofpoint-GUID: zSVesloCKI3eg3daYMkd2kmrrpXekEM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXykVNW4s0ijFm
 fATN11hwveUU5G0DuuEcNFx0dB+3rdT/IXyYXdSdraE60gI6IHZTmv/HJOvShgXZRUzbWFpT6C/
 CDTmqgweAEYWqmTPFC8d/leO1/ZbddLbMu0S5TbaFhTFz9rqPiyrSC1zV+2c7r0a9Viig1GOaHr
 scoPJOVBvO4gjvBlz+ck/oR4vwGIKYZNH0KPFbKETQP0NVC8SGUFw/8uWKbqWu3CR6Sa63Pt8pJ
 nSqdc6edlbP24Yl5ETRCYkDgw92o6TZJMUwQiTcTt+ha2VLyEoDhgZBxefh3wKbR0vDkNBKMK9P
 LRtNUEfJ0Ne89zzULJEedDyfwLLhpiez0mQiAmNc3swfjDg7DirCcPIDL1X24WYxVbpaUahr+q+
 1ohQ6UAT8uZwLKNYBr3qfFeG+5FaD/p2xPqO0p2bvDMdk+dZKu8Ciki9aYDTTERxTInHLsr3lsA
 3R/06oX4SrQx6j2BQng==
X-Proofpoint-ORIG-GUID: zSVesloCKI3eg3daYMkd2kmrrpXekEM0
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afb2db6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=A8JJMgtFIkyHT4jqAlUA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

devm_qcom_pas_context_alloc() allocates and initializes a struct
qcom_pas_context using devres.  Several callers, however, either live
entirely on the stack (short-lived helper functions) or embed the
context in a larger structure that is already managed by other means.
Forcing those callers through the devm allocation path is wasteful and,
in the case of functions called on every power cycle, causes a devres
entry to accumulate on every invocation.

Add qcom_pas_context_init() that initializes a caller-supplied struct
qcom_pas_context in place using memset + field assignment, with no
allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
to qcom_pas_context_init() after the kzalloc, so both helpers share
the same initialization logic.

Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
context may now be initialized by either qcom_pas_context_init() or
devm_qcom_pas_context_alloc().

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_pas.h |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index d74dd7b4f332..fdf62003fbf1 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -14,6 +14,27 @@
 
 static struct qcom_pas_ops *ops_ptr;
 
+/**
+ * qcom_pas_context_init() - Initialize a peripheral authentication service
+ *			     context for a given peripheral
+ *
+ * @ctx:	  Caller-provided PAS context to initialize
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ */
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+}
+EXPORT_SYMBOL_GPL(qcom_pas_context_init);
+
 /**
  * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
  *				   context for a given peripheral
@@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->dev = dev;
-	ctx->pas_id = pas_id;
-	ctx->mem_phys = mem_phys;
-	ctx->mem_size = mem_size;
+	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
 
 	return ctx;
 }
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0d55e9e0af3f..c6ec67e1da09 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using devm_qcom_pas_context_alloc()
- * prior to invoking this function.
+ * The PAS context must be initialized using qcom_pas_context_init() or
+ * devm_qcom_pas_context_alloc() prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..458075868bf5 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
 }
 
 bool qcom_pas_is_available(void);
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,
 						     phys_addr_t mem_phys,
-- 
2.55.0

