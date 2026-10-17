Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663FF3C1F43
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792207021; cv=none; b=ZvuRhmYuRafQwv4V08LMM1ab/6HpElk32DdByCgDhOEeVcRGtF+cdwpu3q6+GA/h2qXjEiGHPUFq5Ln5q8sp0SCrUoFR2/EAF2XHCYLk/Ioe18WnUzNd3pawB6gZwklsNlEdI7b4jpYaxMFMITrx4Qe2o1MjYRtwmmCU3Ib2Mmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792207021; c=relaxed/simple;
	bh=ebxY1nUeHm11IT8aZjhTxlVglYcAHiE4XzbXRK4KBD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYRXFmLo23yNsUQuYpCN67KJfjgmsdrm/N147FtvrOZbLD2FutwW+qJ9rWvY8iJSXf2BGHmyhXfLLJ2NUoVo9JycnlauI17PIiycbR22G/IgBpuf3EQ9okqCRp/q4ftqyi1OH7f+/cXYpEd/fNKGElUGmotJGpUUiPz9JSx0TFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ruxog8qx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ceZBOyOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ruxog8qx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceZBOyOX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30bCH3242599
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fF7niJXwbnhKmIleucamElPfOhrgpZJPP4CoRWDHEMc=; b=Ruxog8qxRAwDbEsG
	ni/dGBqnQdAtWVcq9m6aNc/mlhEV8ZKvJRYs20dLrQPoyWrr5ITcVYT8xBu6K5+V
	MRpRORQjOVWYHkZ1asV6Jy/lTI4Wd+Xs/ZukBcp0+j9QbPZm+5sliaCnD/Nvf20g
	v6KgKpc0Wd5k8Ht+/t36b3+0Z5kATk5nX4bn3uIDTaD40svh6LVe/P41pz7O0qFc
	VXo4blSkneivQQRO2VVnfp/tJR0jEvjaTbRSIQE4wJNek7cwI/URWL/1ni0GvzaD
	3or2iLPutVZbgAC0/9TXFNi08Ti4/foS7oVNx35FEdKWsBUvpPdd3qywmAG6cDSO
	WtJKcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v2xph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:16:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1383531eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 20:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792207019; x=1792811819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF7niJXwbnhKmIleucamElPfOhrgpZJPP4CoRWDHEMc=;
        b=ceZBOyOXeEYvz7ehOM5kLFerOSKTxKVgLuhC8HJ5Ss+2WOxmhIY+Sbv46xEUqaHyWg
         RavgZ9AJybdxMN4fQ/wjwhfHec6shrp+zG1j7GgVPHoIYHKxVHMESY/HY34kNR+vadwo
         z9x7jd9meiC+c0Ar2yw7P/KF9KTF9TF8l/UeMEAXOeCKOo7Rc90wXbYTX+qqrcVkJ1nk
         O3AewVQ2snM+96oxBUSywBFzXPSTelBr/5Fd/phQZ3+7nHeGY6/O/9FEq0nBGEiTG5sR
         Z+Ui9HfljousBghG9CJVGBaCw8JBKC6/6/zFKUQWycDQ0sx1PogNZ0hWvg+oAEjDtxny
         P/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792207019; x=1792811819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fF7niJXwbnhKmIleucamElPfOhrgpZJPP4CoRWDHEMc=;
        b=oijA6NjV1zrbF6kNdyMuSieTj51GLJ6TtneW/e6QUu62ZivOO8+NMHFQ8LuA4+z9Gw
         8i97WO7kNeoF45BH5HTo4rHMlGnADffUF+01tszoDg/4JKoobzhUUuQDgYS2nI8wBSig
         Pnzf/0eB82wbcFT6Ns7OnqxCtpAsqdtmUebnGLJZ1t5gyMeM1B6q0wFFwaw0fm7e82O8
         /p6yGIZ79l7hyxV+cWBasrVUoMSKTm4AsFTKQbr3+zc7gBu/1yG8Q5nK5MludxgM6eZk
         YZSy2fms2IDqXtYCJRNtg9RxZ+1g7YOvecu5XcxQj0chVL+JPb5Udhk8tLJy6C6pfD7P
         ZcfQ==
X-Gm-Message-State: AFq9FYKEiDBDFybQk8YTMsKYnU1JHFWnjk6V86nhVtlIX1NCLjbYlecC
	jrCRqGLB7ihc+M+JTL76jme+iqFc1cvHGQTsUs9ker6WKqM+FATLQSIScteBrEZwZ2Xn/TK+P2E
	gqfCbs3YmrsO4NGSUZVuxucPxpA8pZspQg2zgJeP+NX/rnyHYoxBGMe6Yl81w6rI/+g==
X-Gm-Gg: AYBFou1vsog+8hUfMLI8eIvLTvexpTeAuz7U7jzFzJV2tFh8pt0B6s1YSiqOY8/q5sZ
	qtjJmgfMFloH0XW6U1XTnzY7ZQixuxH0cv6G7IvPSW/TXyuAE942TZL5ypj3XpYS6cnowyY19QZ
	K2Hf+JHo+ipfTJ9Fh/ZzWgpUDv79PkqhXnSojTYUpaiEVDsNuPzAQcnAlrRfVMrKjzyholwjE/r
	j5Ued0UdV1nMDQVFVT4IzeT9rXcTCA5A8eotdkDOy4eR3ol5TWMXuZeeL60nnbkQDFFgJA0DisP
	YzkGSAxkdQHqTk6wdGX351dNJjhpBttg5Sda5jI+zeRgndYyfxyb+uKTqi9xAoeyfMQevaIfCSu
	WQ9iGa8Emjle7+PUj1075PvrBcPuQiu67aQ==
X-Received: by 2002:a05:7300:a209:b0:34e:3ce1:39f8 with SMTP id 5a478bee46e88-361a19608b8mr2123923eec.18.1792207018662;
        Fri, 16 Oct 2026 20:16:58 -0700 (PDT)
X-Received: by 2002:a05:7300:a209:b0:34e:3ce1:39f8 with SMTP id 5a478bee46e88-361a19608b8mr2123897eec.18.1792207018058;
        Fri, 16 Oct 2026 20:16:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm10969995eec.4.2026.10.16.20.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:16:57 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 08:46:17 +0530
Subject: [PATCH 1/3] media: iris: Fix runtime PM reference imbalance on
 failed resume
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792207006; l=1118;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ebxY1nUeHm11IT8aZjhTxlVglYcAHiE4XzbXRK4KBD8=;
 b=4on817X1smlVhSSD4Kkz2zPLwdTPYF/RXT5oFt2TNLcRb92fstFuv6Gy0X25enDrkWmdpTEGt
 yomUWzuF3w7DLR+cRKDjONMBFuzz+NcBLlqZbLbQd8YESvoyTn7qIQI
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: Au49KON0kRQs2wtumUdKAStZ7w8ZnTLL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfXwq+P9sIiAXdG
 N2sFB+c7h/eRe101ZXbYE5riuy7q4sRbVF6C1jwyL6edEf2ILtrdQLkrl4kpHVlnp+AN9aQ4Ni4
 HLVpnTLxBQVaF38sKAGEQ3ml6PKe5rs=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2e8ab cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ohPow3cFOKvdjjdYMLAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfX70p5p4qmnds6
 Eolb39dRX1rZCRSKn4sjjCPWpUrIIbBpvfBaV9/iMjvjkNpDwY78EQfAIyvVJI0tODp0OWsavj+
 2SVQT3wXnlMdYQLDoRd/hHET+OU3HCMbkBb4jTl3hbOh6uVa2IfnlqqHpMmJAgLsaDHkZWZDlyg
 k+S92wdwENJqQzTu4wgqriXLtTXYL79S3e3S71tFmEFVITdZXR0Zpk9k4/r1G29rljpupcOFK7a
 oyI7GwHGQBarGt/eUMcmd64BMNKYJ34AznfQYE6mu3Vef9KZ+TIgKUJzXj0nD6xHvvmlRvx716G
 A5iGa86skApCAgaHR07dmGBdDuELLmvwuE8RKTbTq+md5+eEBvuH51oMxmZHJwoBHP5UoWQ0Cfj
 qdk8RR6x6rTYlUnCn70BO5U9T2B0szRde4SeUL9Ucy3NJsl+pELT5yFl+tUSk8xu0k4tYoD1BK9
 ILNnHq8ezRbXV86cc+Q==
X-Proofpoint-ORIG-GUID: Au49KON0kRQs2wtumUdKAStZ7w8ZnTLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170012

pm_runtime_resume_and_get() drops its usage count when the resume
fails. iris_hfi_queue_cmd_write() dropped it a second time on that
path, resulting in a runtime PM usage count underflow warning:

  qcom-iris aa00000.video-codec: Runtime PM usage count underflow!

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e21..545bbe75e1740 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -132,7 +132,7 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto exit;
+		return ret;
 
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);

-- 
2.34.1

