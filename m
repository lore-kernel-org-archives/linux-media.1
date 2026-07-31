Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF062D7817
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457938; cv=none; b=kko8xRRzpagtVnPLRq/We+f11b9CW7CWmhMMrmRdlcjDeRgOAR62xXlQ2TklTQAv9RWXNejOr/r0u3B1YcC8Gn8BjIn5q2SIk/BckCHnP0CVaEkZFku7q3SyPhU9yHfA5oTOcB3e6XLhPJUTDW8j67WWKqZO8LkQI8jRgd30P6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457938; c=relaxed/simple;
	bh=AtlBxAnhMsZ5O/g9dbEU81FBTz82waEQwGjM5JZ7NJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUTWsIvfrpXMUYcOt+o1S5iU17+E151C+lA5ufPFVLfFe/FqpY/SPcpJn9J4AawKrOWct/9fmGtqpAYIldHlyQ1g3YIejJrpaFEatwApr8a252lIdtSlzhyoOSOTeng1InWF/okJqEj/+agcCT7y8TPJ8IL3/f/XC0m/e8f6lYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpDTKrtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PE3whfVC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpDTKrtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PE3whfVC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V0PNTK2399014
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7RLFBUQEX78LH/H+CTPwK5+ik3e+0QJasHFVlabl/k=; b=EpDTKrtxYhp22C4Y
	Lc9v7in4NGRF+4cuSgBOgqQuiPbmc45MgoAYqpufLxIls3eTotLuMGY2wSF/vqUE
	bNUxzmcwJ4QOTSOGMlQQ9V+Zum21zEkCCxhN2pmyT5C+lTunTqPDKOgINKcq/w0r
	k+nK8r8LUrsnCJG/Zp70l4pl9QOAkWAhManfzWcob5SfSQ5glR4t1Qgr+2UXCZon
	BmzXPzZAvMMCPJoszn+wTSwZs88M7gQp6xPYTyf17G2K8dsHzlZYCkd2mINVW6n4
	iG+VXvpXD3nyHXp18YBcbqpRKqKNMALPfKua4iavhsOplLQWE+SVfQUbjz/zGyDN
	YjtT4g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frh5b80hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so4859366d6.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457935; x=1786062735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7RLFBUQEX78LH/H+CTPwK5+ik3e+0QJasHFVlabl/k=;
        b=PE3whfVChfBywjfu26npO/MciLunHZA57H2zwD+nBBAxTImaXVlvQu7sfVXcDiEQEz
         Pmqmb3zHUqmPnhjdA9p9jgowcnH7fvveGxrxzFNFQBztoV3eQJV7LWrIGwrtO+xJEYiE
         01KK79whrwZipmx3izQaClPWV/XbuvEj2Zp3C5U+oSXLwgL+d/x7TsE5QaBfu7SHuVlr
         tvrbKgPfX88iVBVvdjdF7/zejVJS+0lAiLsf9cQNglSkzUTcvS6VpCQw3Gk9wtKmhqjl
         adi8IxOhHDgPZcNpub5tZqRTlr30czthRpMliW1XXrLJjIRrDMtcBSxtyQlHJn+wb17E
         ScEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457935; x=1786062735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7RLFBUQEX78LH/H+CTPwK5+ik3e+0QJasHFVlabl/k=;
        b=jg19vSvdTvOG8Po4uznK2AD/8HVSlEyc1mUSTstp3sL3C5KPOxF14qi5TZzvs2RnSW
         lgNgVNGjdGTCok11m7ABvCe2YmhkdHY7om1HmRJ09g3gS4droDqo+lY76lr6jP6xS1YA
         3zLmBPI9qt9K+DrUjGTSftyt+IjXbW1V0yyNdKAdNbe09I/9ZWZu2uf1R3mfy021RnMg
         DgC1fPF/kVBC71Jpf5V3TB1xmx2E2I1cdKbAvR8Sn6MCccnwTkD4sDo43mxq170XwvB4
         rJSFH8yoQPuchVIiIa0JD/Px7KU3lb0QQOnzBTjJjzezZ+K8BvM51ASU2WtR6U3X9i3K
         DstA==
X-Gm-Message-State: AOJu0Ywe8P6Eqnlh4bvKfJ1+9NzNJqbr6nMJ5rjui6r9wXC5Y95XAg89
	j32gG9SP8zd5SUfBF+DlE/o7JhjMyimVhGRRfbYygblXPgfN849PvERnjSDHH3HQZRZU4bhDFOh
	sera6RCvJMMq7i82nT2LfQTTtqKLT48l4tyAOneRDEXJ6EKceaI78EjE5ImfunTJkTA==
X-Gm-Gg: AR+sD13P1+B91vJgEatgsDbFNI9xMdbvLIOoEx4JGk6zmeIaI1+MBPbYAa+idOuuUed
	mvN9Y+DxvAvTrJZjZapSXDBLJ8OZk8Zc43JB+emANX67lHp1DYK2RXKC5pbxRwxNz0uaBV7fSdV
	tFtIsRx43Olm+If4StHjr/A9ULR33q5W23sv1f1Oji9/PYguDogCxAopwJmsQW999NO3h8Jiu/7
	63zjJDZmviVzGcNpYhaeJR9oQM+qUxI0La4wncSFzYdlgvRm9DjcjXPQa0JS5rCiioXlarHUtlh
	dMEHpjrhLsxRtXH0M6bRtzonDHqzP3Gmoxn7+tSlxOqnhBfkV/YdD81bu6qvGBgogr+pYpFJM2h
	FA7ndfZyyD1ko+B+L9fg9aGY5230tLKHAlvoo8AhpovFh9juFYyjQ5c41LggxGA3RCSVzFCDAM/
	/QD1tjIgNt2h81KQ==
X-Received: by 2002:a05:622a:138b:b0:529:a553:9d6a with SMTP id d75a77b69052e-52b4b1d6ee3mr621721cf.63.1785457934774;
        Thu, 30 Jul 2026 17:32:14 -0700 (PDT)
X-Received: by 2002:a05:622a:138b:b0:529:a553:9d6a with SMTP id d75a77b69052e-52b4b1d6ee3mr621491cf.63.1785457934325;
        Thu, 30 Jul 2026 17:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:32:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 03:31:44 +0300
Subject: [PATCH v2 5/5] media: iris: reference count video instances
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-fixes-v2-5-94c002016a09@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6840;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AtlBxAnhMsZ5O/g9dbEU81FBTz82waEQwGjM5JZ7NJs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z8G+KJsJaJZA+Z/kLUlMNwZgz5wI+sRhn8q
 X92vfrDnvmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs/AAKCRCLPIo+Aiko
 1dlvB/4roW4ncetMvD7EQPWle46DiMNURUIjHRBA/RJKp25IGfZE7vktYJj3lil7KNctMGFgx+S
 M2M/P4Cn7GpG0NyPrSIsrpHXE1xZxGbkrh57LpxBA+9xHZfngAog2Lm6/rc+jk+kYPhaV4Iv1rC
 pfXxoV4wx0ntye0PUq2wyLhk+FqrAng7u97odCWOgFzGmnPTS5BO6lOrpqUPFMPWh7zV26GDrNj
 um0zysnmOCE44ZBnAxiXCEsF21p4OQpM/cefYSZSivx7aTjKuJrSF7IwZiEhGFFAr3mipJeXLZX
 b3l42eXFzvo26yFMs1+G/2JwiCy8hUb22ksDqJ3Muq/kyR81
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: XPdlaX1-JX4IMJ-EXIWUsoK0cQBbM7jJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX9HqKXxxg//vp
 cR1XWe9BOwF+iFpjnHACDcFIGsellHgvZHCGk57RvhM1TsVr1NgZ3crCYKs/t4FTC3oPuH2OATX
 inHVutxBCbuYd0bvorEYbCGONh0fgkLu4hxECSCueThRK2+M3oCdquHmk2EXVl4lrNjBKHQy6X1
 lRDS993zUV0hg+6gH1BCLdrAkld4S9IqrZ0KIHF8YwEvx2b73ppxjF2ATUYU7MwGSAosp4P/hP5
 z3JRv6w59CvOJOOMmD5tiIUlGmq8oO3qfVF9aNrMCUNoedXHeklZhzLHCjWoqHMUdbxpk1Zxb18
 KnD8uV2Fp7wBGgckleCO68x+3FJVp5CmHuxje+wXm8k8zFEMFxnJgDIfmjguU5ziyaEpODxdbXi
 H4WdAJ+b8bseG1wZk8RoqBlHgRzwfjDxk3zbeVzy5jYy6UDC3rAOgDE11JBWqklYT20O3ajKOm/
 /qIN+/1K+kOOmuGHKmg==
X-Proofpoint-ORIG-GUID: XPdlaX1-JX4IMJ-EXIWUsoK0cQBbM7jJ
X-Authority-Analysis: v=2.4 cv=AtveGu9P c=1 sm=1 tr=0 ts=6a6bed0f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=D3wWFwynQU2KHtTvd0MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX28lLqi+yG9L0
 mxqpGaWNuf2qJvgNsNpSugK+9zAf3z+INVmC5SE95oWeESK2VF7bOCO+7kFzjGhUopthkDa8hng
 1ZGcPTr1ufkUfPVc1zUv5NPskZlSnI0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310002

iris_get_instance() looks up an instance on core->instances and returns
it after dropping core->lock, without taking any reference. The threaded
interrupt handler uses this to find the instance a firmware response
belongs to and then takes inst->lock. Meanwhile userspace may close the
same file descriptor: iris_close() removes the instance from the list,
destroys inst->lock and frees the instance. The interrupt handler then
operates on freed memory and a destroyed mutex, a use-after-free.

Add a kref to struct iris_inst. iris_get_instance() takes a reference
under core->lock, so an instance it returns cannot be freed until the
caller drops that reference with iris_inst_put(). The instance is
released (mutexes destroyed, memory freed) only when the last reference
goes away, whether that is held by the closing thread or the interrupt
handler.

Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c       | 23 +++++++++++++++++-----
 6 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..e2b95c22f4d1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -632,6 +632,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			mutex_lock(&inst->lock);
 			iris_hfi_gen1_session_event_notify(inst, hdr);
 			mutex_unlock(&inst->lock);
+			iris_inst_put(inst);
 		} else {
 			iris_hfi_gen1_sys_event_notify(core, hdr);
 		}
@@ -667,6 +668,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			}
 		}
 		mutex_unlock(&inst->lock);
+		iris_inst_put(inst);
 
 		break;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e8..f0782c4b1e6e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -969,6 +969,7 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 		iris_hfi_gen2_handle_dequeue_buffers(inst);
 
 	mutex_unlock(&inst->lock);
+	iris_inst_put(inst);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..dde5d0b8a83b 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -6,6 +6,8 @@
 #ifndef __IRIS_INSTANCE_H__
 #define __IRIS_INSTANCE_H__
 
+#include <linux/kref.h>
+
 #include <media/v4l2-ctrls.h>
 
 #include "iris_buffer.h"
@@ -35,6 +37,7 @@ enum iris_fmt_type_cap {
  * struct iris_inst - holds per video instance parameters
  *
  * @list: used for attach an instance to the core
+ * @kref: reference count, keeps the instance alive while the IRQ thread uses it
  * @core: pointer to core structure
  * @session_id: id of current video session
  * @hfi_session_ops: iris HFI session ops
@@ -82,6 +85,7 @@ enum iris_fmt_type_cap {
 
 struct iris_inst {
 	struct list_head		list;
+	struct kref			kref;
 	struct iris_core		*core;
 	u32				session_id;
 	const struct iris_hfi_session_ops	*hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index ba5c8dc1280c..1096cc4b01c3 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -92,6 +92,12 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	mutex_lock(&core->lock);
 	list_for_each_entry(inst, &core->instances, list) {
 		if (inst->session_id == session_id) {
+			/*
+			 * Take a reference under core->lock, paired with
+			 * iris_inst_put() once the caller is done, so the
+			 * instance cannot be freed by a concurrent close().
+			 */
+			kref_get(&inst->kref);
 			mutex_unlock(&core->lock);
 			return inst;
 		}
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 228a5f963812..be23acc0e848 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -48,6 +48,7 @@ bool iris_split_mode_enabled(struct iris_inst *inst);
 bool iris_fmt_is_8bit(u32 pixelformat);
 bool iris_fmt_is_10bit(u32 pixelformat);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
+void iris_inst_put(struct iris_inst *inst);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 4ca9185b3d2b..56c6c1b0ac16 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -40,6 +40,22 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_exit(&inst->fh);
 }
 
+static void iris_inst_release(struct kref *kref)
+{
+	struct iris_inst *inst = container_of(kref, struct iris_inst, kref);
+
+	mutex_destroy(&inst->ctx_q_lock);
+	mutex_destroy(&inst->lock);
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
+	kfree(inst);
+}
+
+void iris_inst_put(struct iris_inst *inst)
+{
+	kref_put(&inst->kref, iris_inst_release);
+}
+
 static int iris_add_session(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
@@ -167,6 +183,7 @@ int iris_open(struct file *filp)
 	inst->domain = session_type;
 	inst->session_id = hash32_ptr(inst);
 	inst->state = IRIS_INST_DEINIT;
+	kref_init(&inst->kref);
 
 	mutex_init(&inst->lock);
 	mutex_init(&inst->ctx_q_lock);
@@ -308,11 +325,7 @@ int iris_close(struct file *filp)
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
-	mutex_destroy(&inst->lock);
-	kfree(inst->fmt_src);
-	kfree(inst->fmt_dst);
-	kfree(inst);
+	iris_inst_put(inst);
 
 	return 0;
 }

-- 
2.47.3

