Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F14FB9C5
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328798; cv=none; b=M/6Knc+Qon/Xj/jNY/zeKUNvgGe7YLj/6dGiao0pJZGSVDIaqeRR/AUv5QriXNW1dkFsBEZ5NT/6z3g4n1HjAJ4KczgUjP1khYQ4wXohFpJSM5JHZJjFslAGRC/79df2pgRMfPh1ACtxvPULlZSPkCJ/H2PB3pmeWtjpcuFXXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328798; c=relaxed/simple;
	bh=IaV+7Nqe72WztSaW3MG9b28k36h8V9JiDqMww/MfWcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cbqBlAoLt5tHw+2vnESEG5Bjx1Smd0sPF2uJSHwc2BNwmj90I4tfVu33hTEYrkTdpU42ct4AsibP3wY1jNiknzRMuWPFnKDjn8zUhEneKzMRotERYzI3G5LjaJZdHUQOcJ36LdC5SOKttHYsS/PUBa7iwlsv4mnMHITh+XiYC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3ZamGyq reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3ZamGyq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lexse2389962
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MAZtRLhJFy1
	2wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=; b=G3ZamGyqebVX5YIEpmKYT7Imklm
	DZChHQ+Qsqbscd3JLJsjn50TwHAs3LhSaKQ6OkLPrTLu1u2sNU8/0KHRtjeucXby
	Ujxm9V4xkJEQab8S5zNV7gwm3iMPNI5TJUVwAjHyxCN9nVraqosddwC0/l7YXi3w
	DeGitE+NM9qkZG7lScH4KE+psRpyNquHEoZpZlX9THTxss5YYfi690FjLg5Dn3eo
	tgJPeJCVsUbdqFMQU9nxdq3XkcSONOlm1cFCyfIoIuDC+DpSm2kkbPli+S1jyK19
	GmTQT0ObwIdFnoF/ITubbeKPTkDpDI/NpKEVtm8a81hHW2rJJqCWYXU7gwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk0y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be1861d2dso556029785a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326513; x=1791931313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAZtRLhJFy12wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=;
        b=Y/YHXLaWqain0lKsK5e5sO58UnDDzs5sREh7YRYIcjYsWLbQA9JjKahy7ffexIjDZ7
         G2+GzCDsYZjHZEi1yx/eDRo6lvWSYpAWxxAIic7qGgBXLaNXdI+DB4C0KC0HRC3bT8fl
         lNqtTLYeygbh6BABWN1kJvOCMK8C4JTbNczo5PbW+ngoX8HvYi1dbHYta9WKSk2u0ssP
         iOHfGEqgwlVurWP/i1yU9RZGG8nIICgLUjDHIXSr3Ra3aHuCdxKmgwpnd4Ge1nd9QoNe
         g2wBlS/UdZig0nfcoCkbksO2H6VMtcz07ORKfqS0q0GP58XTRsiQ5+5nwnq4TvaGZb2I
         QM+w==
X-Forwarded-Encrypted: i=1; AKwUvBwiBKa7x+RwmQ9nFxuAnX2+RaC9/W0/SJWB4EchoLJOOXbwz+FFX3KgzdQ34meokgsl/dOHCHF7ebcSjw==@vger.kernel.org
X-Gm-Message-State: AFuF++m992XDDRMkJmR2Lvf2IBkDJSTWee5Z6aXh9qaYkwfPASJTy12B
	WWIOwC6aXCDlMQ4af7xXZtkCLWpUmXpWV9PcRnIDVxJVVrGBn4nqmlSZihuTFEV+17hFEXlH+bP
	9oHPPeTCSbuKicNVlU8qHzfX8NyiW4Aekp+508rJYREy5HPFhVqriZ9KGPPjPjla2Rg==
X-Gm-Gg: AYBFou1KqtiStwOWCp70wEm1dQXCKExN+K/dDO6jexWD1jBHHDmX/D6mVy2uF/TVHzy
	XD1ZxSL9fO/l6TTvhlnYEJa/G4tQ9FKINIUYt4AcyrDSx1y9wQD9yjfsQ6m7alC9ZjBRLPR4WAk
	rJPS+ACysmjlKFPgfaU/AVtR4mjaagT8DJFBkdU0Ty0wFLVJSZxl/7Pml4i8QNKJ/Per9wkcCoj
	UGE91PEdp08NYVmw/RHUAyosp9Dg3f9JZpSE7T+NWSQuMFASJPSaZnwxdJcMFgswpbeH9unkvi1
	wOumtcxKEjL7N2Mhgksh8rTywUlge/6TyKYC3MoEe0QJNYATlv9asmtq2Jo=
X-Received: by 2002:a05:620a:4011:b0:93e:980a:88c4 with SMTP id af79cd13be357-93e9b8d9b1bmr73208185a.83.1791326513485;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4011:b0:93e:980a:88c4 with SMTP id af79cd13be357-93e9b8d9b1bmr73203685a.83.1791326513025;
        Tue, 06 Oct 2026 15:41:53 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:52 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 43/45] media: qcom: camss: ife: queue params buffers in FIFO order
Date: Wed,  7 Oct 2026 01:39:51 +0300
Message-Id: <20261006223953.3382273-44-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac57932 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=Esc8-VpS8LW7SIx68BoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IwdxUKBxTPTRDdakY4Te_WHLNaSwgzNY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6zRzLPsWC2vs
 NOvIRenOjikRiBP2WsNoMexFM/7uBzSnxwuw8Fp/Fk/+2NHYDTlitWByUWOiqMpSt2mumNJpgxM
 tD/DhjdytSidyf1AB8UyE3BTw/g7M/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+2gIjYI5e2Xw
 seiyYNEMCkRtGhBKVEVQF9dMfB0E+rzhfccL0566pemYxoCEMAmIVN0VYP/ErIqUGAn/D/qx4zd
 C+9TyasYwIbhAhowNu/GaZjDg3YFEmYJFVWLz+WWsQOM5j96s+Lgw4BQiQw0bHT4kyyu4Oi5iRg
 Uk7lfzxH4azuAbuD0s8dvq4a0yoFHecjTkQf3ZoXfrI2ZAS86No7vCuJ2DazHLKlRAqLC+VcxiK
 lNNQy8h8OpuEG4f8CwDL6L73rXiLwx8NKimdwLJlROnFi5cQeOMh2kkMKdR/126/WUvhbAYtKpQ
 NYzDR+jFbchZtyc0BOddseeKCYMhDv5KqgmygqgmA09YTLIGIBzYJSgeAhXnVGFeHm2wuMFsIHb
 aM8eFQqRGtSAzh49kijlxGTb6lrjhc3O2KqDNzVn375p0S4ry2syE7BIHoyxIki1vO0Ax37h3UP
 8Br4Ssj5GD3DBDtOdRg==
X-Proofpoint-ORIG-GUID: IwdxUKBxTPTRDdakY4Te_WHLNaSwgzNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

ife->pending_params was a single-slot pointer: queuing a second PARAMS
buffer before the next PP epoch0 IRQ consumed it would silently
displace the first one, completing it with VB2_BUF_STATE_ERROR. This
means a userspace client that queues several params buffers ahead of
time (mirroring how image buffers are queued) loses all but the most
recently queued one instead of having them applied one per frame in
order.

Turn pending_params into a struct list_head FIFO, following the same
pending_bufs/bufs_lock pattern already used for image buffers. Buffers
are now enqueued at the tail in camss_ife_queue_buffer() and dequeued
from the head once per PP epoch0 IRQ, applying at most one params
buffer per frame without dropping queued-ahead buffers. Flushing on
stream-off now completes every buffer left in the list rather than
just one.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 25 +++++++++----------
 drivers/media/platform/qcom/camss/camss-ife.h |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index ab6102fd1126..57fab10a87f5 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -293,8 +293,10 @@ static void ife_hw_isr_pp_epoch0(struct ife_device *ife)
 
 	spin_lock_irqsave(&ife->bufs_lock, flags);
 
-	params_buf = ife->pending_params;
-	ife->pending_params = NULL;
+	params_buf = list_first_entry_or_null(&ife->pending_params,
+					      struct camss_buffer, queue);
+	if (params_buf)
+		list_del(&params_buf->queue);
 
 	for (i = 0; i < ife->npads; i++) {
 		struct ife_video_pad *vid_pad = ife->pads[i].vid_pad;
@@ -1360,17 +1362,13 @@ static int ife_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 	struct ife_device *ife = vid_pad->ife;
 
 	if (is_ife_video_params(vid)) {
-		struct camss_buffer *old_buf;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		old_buf = ife->pending_params;
-		ife->pending_params = buf;
+		INIT_LIST_HEAD(&buf->queue);
+		list_add_tail(&buf->queue, &ife->pending_params);
 		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
-		if (old_buf)
-			vb2_buffer_done(&old_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-
 		return 0;
 	}
 
@@ -1387,15 +1385,15 @@ static int ife_flush_buffers(struct camss_video *vid, enum vb2_buffer_state stat
 	if (is_ife_video_params(vid)) {
 		struct ife_device *ife = vid_pad->ife;
 		struct camss_buffer *buf;
+		struct camss_buffer *tmp;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		buf = ife->pending_params;
-		ife->pending_params = NULL;
-		spin_unlock_irqrestore(&ife->bufs_lock, flags);
-
-		if (buf)
+		list_for_each_entry_safe(buf, tmp, &ife->pending_params, queue) {
+			list_del(&buf->queue);
 			vb2_buffer_done(&buf->vb.vb2_buf, state);
+		}
+		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
 		return 0;
 	}
@@ -1499,6 +1497,7 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 	init_completion(&ife->reset_complete);
 	mutex_init(&ife->state_mutex);
 	spin_lock_init(&ife->bufs_lock);
+	INIT_LIST_HEAD(&ife->pending_params);
 
 	/* Memory */
 	base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c38b96076a1f..9656d29717d1 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -367,7 +367,7 @@ struct ife_device {
 
 	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
 
-	struct camss_buffer *pending_params;
+	struct list_head pending_params;
 
 	struct v4l2_subdev sd;
 	struct device *genpd;
-- 
2.34.1

