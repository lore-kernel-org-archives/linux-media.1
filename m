Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22C4562A4
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425190; cv=none; b=HMt8p8N+nget7chGpJh7kMHdULMZaOrk9DFpQSzNhGP/4xQ7aa2LkQ/QvXyTiuxvbc9nlFrDZPZ90i+j6rTXj0N2SiD3d+zopYmnihHvd0tqAKzBAq/dRC6kS7yM3VdjqvSp8FkQXB5W8+s/XBJN1H6/YV0C5S5jwInHG4mTKwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425190; c=relaxed/simple;
	bh=EUJn+8g0f7NVaANbcYBTFYGJVuQTg+xY+WBNZFKq8hY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPOXEZIHmCZBMExluhhjFegFboIZ35IsVrWoH6DUd5ZCJ6HSLvh0ocNDdGEiEvCA2m51csmUxmYBQmj4aErEEs0Q9A+0Cl9PND/tFs6hIe5hQ1FbCo1JQFo5khmnARN3z8raBGUSSCOvgXEQnVuzY1iWr31MqRN74JrOl2d92mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1jK1zny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvewxXiS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1jK1zny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvewxXiS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE24Va2202886
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J2f4PjyWWckEdMtbV7gIe8pFQqnvY9M/viyklw2D1WI=; b=c1jK1znyYwSNsom0
	oPcsdY0HjA4vbvfCx8vkuD+2ylVe9qpPUIImrl8wnmtC8dLvVCndtOTvRQMIF8aw
	AYSeR0JSYWc0hPDf1g2F+qkKR97MUfo2cOuoiDvhRvnpTbinr7LcWsgAB+U5GoKn
	h0sJc3n1AyyBxMhNGoVafJZyJrHRUqiXdYUS8m9L3A7F0x39J8keKZwydjNot2cG
	RA6TMLvKxGhmS9Ukdb7Cd6JgQVrIxqOe1GzhvsiVu5mX2jD40KR4l6v62R+5FIKc
	ncLCjTIxYMeh+BKnPnHf8gbkeu5EOA2X/ehnHsmVjG94ZaagR3Kqlz3sUSdlIbHf
	Oh08QQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8168em1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so46629221cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425187; x=1786029987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2f4PjyWWckEdMtbV7gIe8pFQqnvY9M/viyklw2D1WI=;
        b=fvewxXiSPraPXM7eiu8kgamStxk2BD/YeMzVgF1eAAmfhhkodQePNM1NcLfHng+QDN
         YPzox8tWSN1y1z4ix7YZ7yZTGKlon/3vdLof4P9Vt9eV2ANtANGHP0RNIKpjOqESpvjd
         UozRI5tmxaVFtMVSEzVsVMu751faEM1YloNyAum7aznjRY4zI70N1vwBm49chFybuDHD
         G68uQ0aa5lAwXkAGJNS7AO2+7Noi7ngk+nqWkuYxO4TPZ9UKbDTbUNcCaqHvVKrFOU4u
         S67A65S8UBpqJViVBu3yatM2qAwe0oYfP1IMy14Sfd51gC6MAxrt6pCpD+bEZhE2j8u4
         h0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425187; x=1786029987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2f4PjyWWckEdMtbV7gIe8pFQqnvY9M/viyklw2D1WI=;
        b=tMJp5IpfBmcGh5j7g71PxxiKFpzPMcAmrUobTIxOXMARO4eTRQOoBZVfpnLQRBAzcK
         prK65wGOyyosJndgbEJ1/1v4wqkk75zqiE4BWGULIMzgzCfssGIUfYMC44ul2oZHhqml
         g0njJnFDMeUc8158eGSyM9CGjKDSPaWFOgfJoM2pHjWkEckBhAPYTNXxRVrlsMVHzPe1
         Dq+TT7wEH/gZeP3oAq5hdd2OOVuGdGj0UMXL4FZk79VNPLPa3aLPrxa5BYWjw4aWy+5p
         rPvxqRMlMnlYkfHvhGQiu1HTWFIyjADmtcVOhkzsfmMOLBXBYdSxOupqM1YFzdzxAYAD
         uP7A==
X-Gm-Message-State: AOJu0YxrdZESD70qaj2an8htsfBRESCvk6z0+wW2nqlGNf6UMXLoavHd
	JfnOpYwqVLz0XMGKTMOs4kL80fK0onlq6tv/nsF2yTxRKGwKxkk2WPsLbXP4NHbJA1a3XwJIgg5
	/6FfvZ8WKZSBBlfuBgX/0sEy9grHDzBGeu56IF6X5SJeMNeD4bviaYu5votHjZyzlmQ==
X-Gm-Gg: AR+sD12T0+iYEZ9X0xDyliLb7lcc50FmovQz9PhH/de0yoXDj7So1vsBfoSw63e4Kvc
	fpdNqTZHA1Eda3MbpRCEgPD60VHcHOjb6rOqDrWYN56Qnn6mCop4r3VMpISJJMd7cR5JQ6Nz2m8
	BDV/JRdlms7mQFadmM2Yu/BFztx9JCkdCZrjCdpmnJ8vID2QEiWrgSD6R9S1fR7/SRTv5Os11qC
	fVT65etY+ypONqdT1QmWAIFwsnm+8KdlLmRHT8cf6BOy8YXx+ljJJ/Z7/gXz1esqJWsE60hDSLo
	+uB45zsZNgnz996DUMAFT+RJwTE5ln9iES1n2Fps2Q9YoAxswHcocnI5gwQkWDCVxT2wagXrbqs
	gcHVdhH+lTd10XjpG+0RhTPnz2Fk/qfze5KiLV/6/v3KZgDNh2V4XpdD1wFfLkdycwEao5WOznX
	2a6QTRyC3hG2tNVw==
X-Received: by 2002:a05:622a:5c7:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b38389be0mr34032041cf.8.1785425186643;
        Thu, 30 Jul 2026 08:26:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c7:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b38389be0mr34031541cf.8.1785425186070;
        Thu, 30 Jul 2026 08:26:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:12 +0300
Subject: [PATCH 5/5] media: iris: reference count video instances
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-5-413d6cfaa8ca@oss.qualcomm.com>
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6909;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EUJn+8g0f7NVaANbcYBTFYGJVuQTg+xY+WBNZFKq8hY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20SMlWo0+aMkPlsdsk/IubwsM043KLqrnWvY
 ZybrbwxuqKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEgAKCRCLPIo+Aiko
 1RxDB/0VWfFqVoq065svqM3kCzBlRmZGkoWYSEm4R7fl88NxiKLaQKtPwbg6/X/T0MiEdzuqa2r
 CFq9hfCZfPwZaW7Gzi2PgEnGO4AFIVuLudn1ioVwd07YNxsCQ/0UA/TqI5GjO5Nn0X2TteyGKun
 jNDy67FvyCeGS9i3DIw/TKn+xM4ylzquNgycmaapAt9ckLb8AC2SH3gADSJt606DX9nWXhcSvGe
 EtOsRvDx6S/e5LOnwgmXFU6IxtoQKAafUBXNUAMLltcgD+ksOOnljIFm+CiI/qAhP6j+kxsewmQ
 r0dPOGAKpkNzi79aG9pf0BoBp2zr6YwttsdF7uRtRXPfOkVo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX9d36pmsVhcL0
 xpUzKsoX6xrgjh+ZqDrJ0medaPjBY6DpVnZxH/Sswrs7HW5Sw+dANjQs1Kf94WmphxT9Hj9+cNc
 A9VVXGdPgqjv7qymx8VTXWf1c3Nag0wBPSzRkwNVZERwuXt8lEGEWpZ+H/BoNlkQgHQRIeVYHkh
 2VBwxzZeZTOZjtncycncMji5ovt/XZjDYU5qL4F3dV5NpQF/urUkU60FJb14GLetedDinB6qI2i
 A7Qjr06ENQWJ/fpkYK3me/F00HX8AnH7kR0zXxHVjBc8hmNRfgCC6Xx/MMfvusaRG/MWvzDraMX
 vGbJg2vTxKhrqQQ28kbrP2lHmuS0OEl2ON39ltsSwsm1hP31trVGYFEymuRxmOh5J0/LYqIxLRx
 44kM/pBizBGqn4fbFqf4JaCskQdyYxHvvXPJs5xCsEtmkEfvEJs7b+BxjtTCxDlwt07ErlceZFH
 iZq+KoGvcia3aXpJrCw==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b6d23 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=D3wWFwynQU2KHtTvd0MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 7UZ64kOg1eC3bPezv6caj1cPTLKfVWeS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX8ERH7Sx0MTVp
 bGQqmOx19tvIg6A0hzNxfmTy7zoI/gbI8PUSngoRx5CmJbd+GQ0JVxeEPh5C/eFLZGakAqAjrSQ
 8b6iYdCnwOfnd3cAtYM5pnYr7MSwwx0=
X-Proofpoint-GUID: 7UZ64kOg1eC3bPezv6caj1cPTLKfVWeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 25162ae71357..1a1c221b8467 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -967,6 +967,7 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
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
index b68b98f02e26..53f1296aa4c5 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -39,6 +39,22 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
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
@@ -169,6 +185,7 @@ int iris_open(struct file *filp)
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

