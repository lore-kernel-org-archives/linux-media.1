Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA213FE348
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600481; cv=none; b=Kwb2hWmhWpap+pSs6KXqCb080nQvcOMf1MHQYfuE59O13TcMn/UqNiGtHXR4ldNstbuQq+bnzyh6bqj1LTs+OHA/0hSZNK0I4TziNq8+N1801X8Qd5yiMkZnQaJ3Nnx+UdvnIFdUoxYL8TG9iX/VGnqHJmLgLxOQ5yiwzcNWJEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600481; c=relaxed/simple;
	bh=s5Zfbo4qdUGGjFW88zzbmy0I4llofaubC03Ctjj+LGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eifo6xP/p54EJUDN4UlM7J+mlN8XnpimpJUfYPfyZrE8mc7BXZRrUT5nxJ/wuzVkY6Js9fHqSwEGcpXze8tZXawOnVSjmjT5ctU2xb8CbCvdKeyAIOM9bIvLmGuck1xMDfHciTBWxb90DPfg1D2FR8gRagoTQKuDJCiPkzA53HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bsdtinxd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QebLMhjM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bsdtinxd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QebLMhjM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCWEl3769146
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kQHGoKLNl2Tfoue/4AF0aGGxJB+gMtGPQ3VGJW3XtEc=; b=BsdtinxdpLRzxTNJ
	qRps8AH4tD9Dyl8iiTgkwA9oogXGGthwcZzZx/6LytNIbDi7dOr4EfNbmF2tqZF5
	3fmUhjdsMo1RmIbtA6k7gD4cPELVzoCc4pXlQEpFVjibpoIp494Vje1xp+Bimh7I
	I8MDZFPipNfSn2rDWKHyA+e5DVNIUbjxIHMKY3ftrsY/EgbndrsQIyTAXvmYKp1Y
	OqPpwkW8xY/IGKZQNFP3OGEk721BMqmDlljBy2q21FBmPr826CltYS6KTO2fyu/A
	prihCgpVvySWrtbvHqC8/SvwHcWD+lE9zhPAkUte+yH8OcaL29E6Zxjc2Yi9l80X
	pckuCg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y3utt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2900121a12.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600478; x=1785205278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQHGoKLNl2Tfoue/4AF0aGGxJB+gMtGPQ3VGJW3XtEc=;
        b=QebLMhjMSiM7xkK4xcsBDfpLKgraHglUylXQHz2qx/fEvUOG1CLoC0pXsvf/fgnnny
         I5fa+DktTF8fabsN6OE6DCrjHuE5y6JWZnsLCUU1Gq5KKRqM9O5DU8o9SbYk77jP2elJ
         54H9zKUKSL/VQU13lijX1Sk56xdmjvl/1Jb19vOqbuWLxLPzbScvABesVet1IbcmCWvo
         QjnonVlLsEZpqqY7KmqdH84TFVv7PjNNuzgWBli66WHzD7cGXqhY1/h9sCPu+KgSMxL9
         UBq/kYvT2xl+dIAVdHYdzAr/NZtefIG5CB4+UVutn5k+WwZuYHAnmcKs8RNomw7dFCbY
         7HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600478; x=1785205278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kQHGoKLNl2Tfoue/4AF0aGGxJB+gMtGPQ3VGJW3XtEc=;
        b=qhDSjXb/x+4RcDSpnum9T1wONmrXV+G6dWjQy+zPPba0r6Gl7/f/2v1+LZ/ZhIDFX6
         bdC+604gxvNV2O3Hw3DI/8vwHW+tfqUolvkwV9OG45gR9LG/fzJlbVvJnX/jAiw+ahyY
         cdyUEfFL00B69N97s7p1A32jzjl7aTlwr7AaEV/d+ImIQGWJq3fVAeyFRTRepMhXl5jk
         WvCqkjNYU+MKWvB1r53zrhhZWfCT7aUpoX2iLmdeTsGrD7EnO82+ivOMkkqfBzL6aG8r
         MxcEi7Yokf9rLLjqDUEuX3MJ2t09+mybbZCYwCBAWmm9K5FOwllGspFUriq2U1WafANE
         c4Xg==
X-Forwarded-Encrypted: i=1; AHgh+RpexPEevadka4BdO+TyyUCCmEUCUcjzms8uULy6gEJqvbsg7PhUl22p5tZHEZ51UcxZXjzCEZzQbAtskQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7GHrj98mTDe7Oms1wCcQijcJAWsla32nyF3+RauBegN8/43s
	sjHbZxAzchszC5n9q576FuwTova53+B4nn71BLUS0HsG7Ss+k1Sx6MP9rvt7r3wlMUG6TAHBBgD
	pO0pbfWBp+zdGxOFh/BsJ02PYTYst2vQ0VkZK0nxcYqHl+1Bc67x32UoVHaou8MSb8Q==
X-Gm-Gg: AfdE7ck9VNwbOj0F9ZJIsw58SqpmhxasSO6v2yxGfNWqx9d289FPk10IhPgCRFhv6rm
	KENop3D5IhzgHNwvs/+Ti0Tkt1zusgzZ0nCzfNH8E8ahGwOq1c0DatarLSVSxIdL7x7SdOGhFU5
	sm7nc1JczoZb4eBHMV1biIpfF0cpD5+w+3/nWl7XugtTBMBk7C1uE9V7P+0l4Uxk+IKpfjnN8ie
	0vnbCp3CWdoPB6tbUAH5GZjSTLrJOnDJDwtjAiQOoe1CjACfD2WL0q6ioDUQXwRtz+rYHkwcZPH
	OMYKGEqlHRu2fy2IZ9qEehY2sIrTBgV+6pYFguhDVH2wm4fPrBXZZr/eNGUqPcv9LMcKniCFgHy
	3vKjTXI4nV7kh8+fce1GC3OAOnVbODbW/Ag==
X-Received: by 2002:a05:6a21:48f:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c3ad9afdb9mr16777516637.54.1784600478561;
        Mon, 20 Jul 2026 19:21:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:48f:b0:3c0:f772:8128 with SMTP id adf61e73a8af0-3c3ad9afdb9mr16777489637.54.1784600478113;
        Mon, 20 Jul 2026 19:21:18 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:17 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:40 +0530
Subject: [PATCH v4 7/7] media: qcom: iris: Make
 iris_destroy_internal_buffer() return void
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-7-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=5062;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=NJCVkXVG4kHkHSdORHSkz4ElWt4c51OBpIRD85ii4Us=;
 b=Ou4Wi3K0YRzMkPAqq777DeNC8zL567ygQ1sli4VuJ5MS82UPzCFKTDNiXAjOPGEIGqe7LntmM
 ZvVsveVU6HwBUnt4m2t0Xyjvr9+qgtX2pnaiBYjfQ9b237BGcwZ5z4Y
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfXztGYGtD5auKQ
 RJuWJ3G0TvyO6X94wvMflxAMs9ryctlUmUCbd5QB1Q8fk6qgszG6jNmoGNnhvvgNg2qTFgPCTzj
 KmiXyveFDk5goV/kXlqZkyHUmcBnaIc=
X-Proofpoint-GUID: x9TIp9fSmZCoZYR42Ho4P60VTfeBPPxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX8LOsKAtF2UKO
 MMY6f4Iz9AGdrA28QUstGE4V+lYLufxhWR7LXh2RnuT2JtaWR+ro3CGD4DBsP3foAcZw/hBV3JE
 2uvU0epTHb5dGqZts2L+fw6WRMgtNQDSuUEEivx/zUG3+VcECOB4+hqDEYk/MHKqb6DNaKueHrl
 RuDL1c86NdYjdhTuMDOqEJ7Pni85nv814NpLr6pi6dZrlg231YYIyVy3J6EeQA3fGNk/2oySfdK
 bHgKtLBoPyNzvdY7CR88VwaesXaUvfU8IBjlgMjje4pWBMjrvv7d0ltNB0BfKc7kIHhwcNzbKWk
 zjfv4klXme3aPskH/n9Wj33pa9TkHbGNMd2+gAN1ywRTqVPcEeZaCloOi+uWpbMAcNN3pGi3jtP
 t1/bwwb/OgLa3HQVg0A4xdl2QW6Mm6Zfx+shbhZITdqEzXO4419JEW7oj4QRwZ3GVlcZ//CKcoX
 IUvwIygvDF9REC2yt3Q==
X-Proofpoint-ORIG-GUID: x9TIp9fSmZCoZYR42Ho4P60VTfeBPPxA
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5ed79f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CWBAsx5YQZKXPYp8bPkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_destroy_internal_buffer() is guaranteed to succeed and never
reports an error. Returning an int is misleading and forces callers to
handle a meaningless status value. Convert it to return void to match
its behavior and simplify callers.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c           | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_buffer.h           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c |  2 +-
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    |  4 +++-
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index bd922a12045c..eb8de60c1177 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -648,7 +648,7 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 	return 0;
 }
 
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
 
@@ -656,8 +656,6 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
 	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
-
-	return 0;
 }
 
 static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
@@ -666,7 +664,6 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 	struct iris_buffers *buffers;
 	const u32 *internal_buf_type;
 	u32 i, len;
-	int ret;
 
 	iris_get_int_buf_tbl(inst, plane, &internal_buf_type, &len);
 
@@ -681,9 +678,7 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 			if (!force && buf->attr & BUF_ATTR_QUEUED)
 				continue;
 
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
+			iris_destroy_internal_buffer(inst, buf);
 		}
 	}
 
@@ -693,11 +688,8 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		else
 			buffers = &inst->buffers[BUF_ARP];
 
-		list_for_each_entry_safe(buf, next, &buffers->list, list) {
-			ret = iris_destroy_internal_buffer(inst, buf);
-			if (ret)
-				return ret;
-		}
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 75bb76776182..ab8e5d953101 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -112,7 +112,7 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_queue_internal_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buffer_type);
-int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
+void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
 int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst, enum iris_buffer_type buf_type);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c4..1c02f2eebdf7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -442,7 +442,7 @@ static int iris_hfi_gen1_session_unset_buffers(struct iris_inst *inst, struct ir
 
 	ret = iris_wait_for_session_response(inst, false);
 	if (!ret)
-		ret = iris_destroy_internal_buffer(inst, buf);
+		iris_destroy_internal_buffer(inst, buf);
 
 exit:
 	kfree(pkt);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 25162ae71357..8c2644c7f6e8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -447,7 +447,9 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
 
-	return iris_destroy_internal_buffer(inst, buf);
+	iris_destroy_internal_buffer(inst, buf);
+
+	return 0;
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1

