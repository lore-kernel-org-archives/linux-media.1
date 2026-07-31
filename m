Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068828CF5F
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457927; cv=none; b=b5ntN6YdtKm3d34+ncejryVOzAvcq16WXponbVNF8CYih/AcBf/tdpwNLUSrZlKrH5gAYLShnr1twp0Xa04hCYyIpT/s0M5GVeByuFJroQ557RbyKoO31HAqtnSNX0rDEzu5GRWdUpkbjIx5CNhLhu+6peAqsHCpLdk+UdQnd+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457927; c=relaxed/simple;
	bh=GJ+ySrymWuLsSpYJsvPcJ14/uEgMN/mxqNxIVXzl7aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwHV06HqLBtH3Sz8m5JhgGlzLUWYYMdAXkn4UaDnrjDLGZyl5CI6BbG1T3q2ZdTK/QTZosVAtAzXTPqkHYP9daMwlSOu3RqOIa/WXrv5LhyDT134lZ8yW1FwrmPQi5+dbJUgFHUzYrZbKC/yzchRyPYCsSynjT5JnevlXTQyHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwKydO0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfmOj0tQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwKydO0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfmOj0tQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UN29AC2415358
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zRicdP7MxQ+tTXunDsN7IaxIFcAVLbO4TxnDJ5/5TY=; b=nwKydO0mwX5CsyAC
	AfBQYKdaIIqf8fYMlx1ZTFu4Nf1qqGZfFHS4WBojRTejnax5qt/cJTVLvFX/GEup
	wIaxXEUQwqxZeMpHm0EH7nFFUPcQnIDjugongZVWzZZEBNJs6nctO7nUZham8E1V
	2RR5WVC6PkimQD9fZsIEwlwb3qhGAVf3yHuOQmedrmCThIgBvYz94HRrzOZkktOi
	yUzUJuFWZhJnlSzH00gNYvKsEbPMySYtY55ltgjITgCH+ebuNTpqbbFQRk++Txc7
	IE/z7t1f1yu772ru50W4gnPN7sWsGbi57W4d/w8D9W6t8Ksbjb/tGMCeGEddmiC4
	DEyfEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfxbg7bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so4850191cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457924; x=1786062724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zRicdP7MxQ+tTXunDsN7IaxIFcAVLbO4TxnDJ5/5TY=;
        b=hfmOj0tQdUrrfAFnaBvg/dojWshgENwCZ16m77trjShPebSfrGzT7MnnZvrCLCU0H0
         BovkWeTNXZtHJMv9TGYda1zxMoFX2Himp6nJNOZdNXoqTmEio4/a0I8Ff5PedHq2JCIq
         ZFVMrwjAWOaAu5mBe2VId0mOUIImuMGlda7ypZbxq/CixnWou+NqjaPkCIQjY0dEA61i
         w06m3wdFEtYv9DShwtLU6d1PDh1InzFKYnBQGvR6saSjhfx9f3JyGZzgOLaK693IHKvf
         PC8RgGd9bibsniqEk0lJq+AQ6rolln+huaXA4FDRr0CKyQlO+olfiVc3YmD5ef6NfsPX
         4Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457924; x=1786062724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zRicdP7MxQ+tTXunDsN7IaxIFcAVLbO4TxnDJ5/5TY=;
        b=AEIDkXO1akG3BoeqiPJvR52LrJKcf3OzC/i3acrMrH8X5tLdw3Bm9PQlcwE5xM1oVJ
         PkyWNtVv2+yDKEvPVXlmbzO5UnMOGYC3jWDLX5LidFw3m55kpVUiNznBOA3bUfrSbDnF
         Rx9GUqd1UipS6xcSdS5nap/jrBeUXOPdRANCF2AH3OPuOMRCjW/5GUfvVEJqq4WmzN/6
         jTg9CCWIFf1oh1KsMudlflJjmFK8ZFRNUJKSG3L/qd4jkpOKhMqhCo6z7yE/ra7fTIQC
         lJvgducERtuvuvuah8V9ziOKvmStm38eJTn4HNXay44GkKby5bc1MQ/hvDsT7zsRFaMz
         tyuQ==
X-Gm-Message-State: AOJu0Ywvn0l7VRe7GaD3pgJpVXSlTZ0G6iJ9pTlldMpHylkdYBT5a1Ww
	XDUwy9GEvECs1YXBBKvU4ltIqLxJsSwa4bHJDyHh0BX8Uq95YgERi2Gj+j4/tzpYeHJT1gXzFZb
	JnpJalSSQc0MfyIBYdxMq4wN/UcWcntMObvzLr2f78lfEPPxZNvFdBeeb6Z9Q60501Q==
X-Gm-Gg: AR+sD12e7oy9tGS44EOLFN61Gd8joqL0TPUlQmNL/o56EjfA6j4tSnqWoU020Z4UDTI
	xoqvjNMavrcvR1BYBuqUO7uZ2SOCysodgDjnMGPmt5GUcAifKknVIMM+FDywS90wyGOzV80Um1b
	uao2epbP7vQHD0v2SWsvjEDFQt138/2r/FBLlyKDAJSOyaheHv5vA1uC4EPz+HbPg+80icAxop/
	jar0fqs1Pojb6sYi2Ukwj1uYxcfCS4EZ0PSQwIQS/frxy9hUL0l20KyKivC8J/gQvkzcuT27w/2
	tG0sO7nJq4EH0Xd058+p4GQAYXFvy7yDNDVUO98nsmjHhLb4hcTCptCLqFFpzbXEc5p4ZmzXHy1
	4jQ9fQ2N39YCwYQl6dSsqcaEWybJ5D+aSg4aprxVkDwWeL35PGqnrr6Mr8y2QX7tDRYKr0cBWXR
	kT7lOm28k9Fv1ssQ==
X-Received: by 2002:a05:6214:419b:b0:8f3:f17a:a3f with SMTP id 6a1803df08f44-9084218f8bemr1688936d6.3.1785457924487;
        Thu, 30 Jul 2026 17:32:04 -0700 (PDT)
X-Received: by 2002:a05:6214:419b:b0:8f3:f17a:a3f with SMTP id 6a1803df08f44-9084218f8bemr1688476d6.3.1785457923900;
        Thu, 30 Jul 2026 17:32:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:41 +0300
Subject: [PATCH v2 2/5] media: iris: take core lock when scanning the
 instance list
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-2-94c002016a09@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GJ+ySrymWuLsSpYJsvPcJ14/uEgMN/mxqNxIVXzl7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z8MQFsNBb3TBsAfK8BUIfgXStvOqqp1Z6iw
 lcmLnE9gI6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs/AAKCRCLPIo+Aiko
 1elZCAClq7OZugFOwpA/5R6/SUxPPk8GxXUGQdoEOcprMHOHoyk6dsBqIrqspVjlaM2AWyHdUsB
 KxtKosGjTAv2s0whbOjZDTo0uExwW32+e41pZYX244DprxHGcumdl4b2JE1iMFG8TxZLEGwyclW
 SGGLdZr5/ynMED94pr2wdO+ngcenOgY1RjAiwcADE6dZfei7X2MwPlDt7GifvXQgXH61/NsrXQt
 VnekzUYVsK0caDfAYGxTfAhhoEq+Cm9cMnYAZ6+WPYWqg8HwwBpo0WazvU0cz00+QCVUy5PfvBx
 Tqofi9pAQa/RETvcBr6hkSHo3zie44oDsBO1SmazHHACXep0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX51ONkbUkVu08
 nn0abhezTuef0EYf4+Ylqhk6KAnWt8wB57YUX7scJS7/JL9pq+Dud+lg53Sz6lkeP2KgJ2MzXjv
 StNJkcYJnbGRGwq7X4eLQSe6Tn4IUFHYjxCI9MBmaApZVYqQ/1s7aLxY7pzsR3yM/KeyD5P5/Ag
 gr3NXnOkPIKraJk+loJI3NttWGLVsmM1Z2ZAc4GkPVtPVbKKWb+i4RCHywCD8pW9FPbdHOhF7Hr
 rePHQS6NdfbfPyR3RfZLPaJbmlIa8uThw3RQLHwllPDrNhqHZ0ySv07DZMAngnesg+xdFcPqcmW
 nHbn6cdPfrR9MR1bgO/RKdmMchDYoSfK1/pk0f/1EFFjJzb3r0JCEUAKzxLRM5wC2D8RX1IaoC5
 XEbv/yO7vd9dZKO7yk5zR3XIA3COzecekn+jSwqCywU5qUSHYokvXvr1aXflQWHqFsTHGaUQBUt
 WYMZqqnUxelHejIJsbw==
X-Proofpoint-ORIG-GUID: UFloNqDJ6ZGqgoRPKjlNlTLLkRGWuX-B
X-Authority-Analysis: v=2.4 cv=Irkutr/g c=1 sm=1 tr=0 ts=6a6bed05 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ArhRcrGwThaRUb-MlkEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: UFloNqDJ6ZGqgoRPKjlNlTLLkRGWuX-B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfXz7Dbe4xSgEWy
 T4UrbcOKExyPCwUCdMa8BzIXt7MqNV48JpTIuhPOLswhrKJdXbANKtf6gwr0DK3mvMDuo3s/l6X
 LWHA3kFCrrLxwfsdlTA8I1xsmMbwoEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

iris_check_session_supported() walks core->instances to confirm the
current instance is registered, but does so without holding core->lock.
A concurrent iris_close() takes core->lock and removes a (possibly
different) instance from the list via list_del_init() before freeing it,
so the lockless traversal can follow a freed pointer and dereference it,
resulting in a use-after-free.

Hold core->lock across the list traversal, matching the other iterators
over core->instances such as iris_check_core_mbpf(). The lock is dropped
before iris_check_core_mbpf() is called so the nesting is unchanged.

Fixes: bdbe1cac0c10 ("media: iris: add check whether the video session is supported or not")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index a2ea2d67f60d..8faf709c26c1 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -56,10 +56,14 @@ static int iris_check_session_supported(struct iris_inst *inst)
 	bool found = false;
 	int ret;
 
+	mutex_lock(&core->lock);
 	list_for_each_entry(instance, &core->instances, list) {
-		if (instance == inst)
+		if (instance == inst) {
 			found = true;
+			break;
+		}
 	}
+	mutex_unlock(&core->lock);
 
 	if (!found) {
 		ret = -EINVAL;

-- 
2.47.3

