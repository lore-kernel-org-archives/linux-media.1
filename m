Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577132;
	b=Izp/rydsYPmzgKL01gCzkTL5xL2u5i/cA6JQzIPnZAHcKUUquKJGPO3UgPzWYL+Q0ouo
	 W0RcpyoL7uHbFhBIi3YUYMIbWVPgbmILKVYKpjHW3Y6o69lxpEMBotT5BYDmhftUGy/fT
	 W+6K9pxt1q9q7HPVmPD/XxFoGPCR/QR0pAqDQADhD/cpqLF14kJBbQdJmLMz5zwMlfsqB
	 wlOcp5c8s1Spmt0q4toIulmOFH2LCcyHxhjxT/BlYbRZlft7fbaW9ULzK3p4+b3UEU2/W
	 n87Bpdge8GI73TE01FXOM9Rb8LXuIx2F5o/T3CFNGabFaa/Spm/QCl9ImPjuIy21rEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6uFj07CuonEi/ic5C4Fu/0kpNIbIFxIATJknsZpfdsE=;
	b=qyYYW22uwGbr1AftQsK/AEnomNKDagGyznv87PzwmKZddQaPw9UAzqb4eNXKwhT2RsCg
	 HiH+Pvwc5Ndov9CoO9IGEwrWO15L1c9D2ZUQmebZw6LDkkzmsRFB+/wkMt6KcpD36WH4A
	 +R0asY2Cgf3mx2KHTC2MImF7MvHVIHYN3uugA2mDKBLNdH7dJFzGmoqSzshX7n+jUd4hF
	 Xh1VJ7wpOhQXsV2Bzsi3aVQdvZqFB5f5262zH+h9cTTueMdxNfqZVU6JYu49IJyDI1l5y
	 XgvoVmUHLGL38bJYhHKgROc3ssTbp2ox6rX6mS14eL/lM5OvM7zuthm0rociqblFCDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdDH8opN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OT+YInyc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA9F606A326
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA9F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdDH8opN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OT+YInyc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BKgh2741903
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uFj07CuonEi/ic5C4Fu/0kpNIbIFxIATJknsZpfdsE=; b=VdDH8opNLBvcaKm+
	QqSpZKNV/NJz037iovwnF/hCrc52TtWINbyfaIN/GVyjARurUsl9UEGC5g/AFXvG
	J7REd1fINhmX+fHfzyKq4Qtb8FZ61bwI9AhPx4RMtOi7zhuHAoQup6I93Qp636aA
	vSS2aC3ciyec7P3i+TLn1L2CbpK2eu/2iGWjNJo4Utk83875W33lLHww9nZ7xu+P
	/pV+0j9V+6v3Hc/CrSAwJzci8Vs0JdHMcthQwWxivJ6CTVgIGfpcngXTTYFYzN/r
	EYBx+NlV5xPkTW5LZcmSko7891aJPK4OOksOyotQko9PXyQQOk2QDVaoNLP73apQ
	h+F9ag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsa3nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso4949395a12.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577130; x=1796181930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uFj07CuonEi/ic5C4Fu/0kpNIbIFxIATJknsZpfdsE=;
        b=OT+YInyc4rlis3QGGAetrQYw3DQRzQw8jgSyeHjUOmTECphdPRs/WWhUviONIs+hvv
         PK34PByY7UUkvhfzzvpZYaeNmtvZrrkeacg/W+w2t3xjJ3K6+XQLUccRD6P7nuTZMPHp
         hsptqoKcc81ZVhSS7mvHY63yxu5H4dcnDLjFEVahxnfdTu2X73dQ7nSpoazserMFqIEm
         VJomIE3XCwnmlEZLKwbg/lMd1ZaPvIaAnkSv1Py5PpFMtfZ3ZZ/Zk3AE6M0Pzo4zc9m9
         yzvj0baw9VRRAJ5BIYal15VKVVVlU7nLj3Ug1kzGYp0W21vf0uR2guAPh0N2JMA4IC7C
         Y5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577130; x=1796181930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uFj07CuonEi/ic5C4Fu/0kpNIbIFxIATJknsZpfdsE=;
        b=y3yq0Cv7IL1uRGN0rfH/TsE6xIV9OFdxKnKLP/2vRjIgTa0X9dSdL33zp7ZFMsLoHj
         N2jGyGFstBaYRF/0KzZ+OrQxoa9h5/2lKc4q5i+ulqytbKJbH0WggpqEkUouVCaxlS/x
         wg0ekZlxLEBHzPlYk460ofpmJZfGM5l47Ghojloz47WCjsgEAiHIysD5xA7OV8LKfP59
         YUaBj/JfRevPfTwBeoLHyzCzJGnM/GjlklFsOO+wCippC0MP6UEpn+YZPFrs62vK8JPi
         sjKHQcww63qBr3aClr3BZEQeQ816U7el0oVQ/Sd+S80qmJXAGzdyM23rf177sapBPZXp
         DoaQ==
X-Forwarded-Encrypted: i=1; AL+hErEE9f6mjnlc9yYLTnH+KUMd0Se0CgxlJDe3vAQ8bK5MpKJFvsXd1tXRWxj+6mXgjuNKmzdjj/Z31UlPeQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z82OpGO6VaAnETHh5Q41XC9axJOC/feZiijufQU+/dY5SOKuWC+
	Ug8FzJed9H6gaMCxREaha5u5l5zysT61OnV5UzGVjrR8y8238TsX99N30k2hfGm2ZKffI9r4zoD
	vWnNVbQZKEm3g/Li4w5HPrVXOyouGGr73Y0gK8+foNPbc4vKwYoXUuAb1TsHbvkkt4w==
X-Gm-Gg: AZFdTZefqj3LDYTrUsPE7F3jGJCMUNu3nO3Ls4nvyV6Tk/2VCQOIMQdJUeyXx1Xz0uR
	GwT0+h/oWIG3BriEiZCpia12mslG2Y5B9oJuDTloSfqJ4UaXSYCFhIRZY6UQFAofx6GP1WkSzmt
	gnisksYqbK8zCinGji4DYMV2fwcb7Xy8vO3NMzk94F2tFDVeWcSYPu1SPBpdK9T9llyTmSa9h2l
	6bnvJQ8SfpF7NnyGvNv9KA2QannJ+CPvZDj0anS1VLY1FTcQ7Y4EUhMiIxN/UPzOGa11i5+F3j8
	wKeoKR4v+dDfW+KT8b1/p02G5H0InIhw3kno/vEcMFQOes+kR7GNLfrIyOshmhPDcTq22D0++GO
	HJXgYw48vdOGUqa7a9ZYHRb+/jvlWPaSkm4zbOUi9oz/JtvPlGkpxPt4kvBsyPu5Y6KU+UT16eN
	wAKxm5R2E=
X-Received: by 2002:a05:6a20:9e46:b0:3e1:c805:45d6 with SMTP id adf61e73a8af0-4014b65caecmr15129895637.24.1795577129552;
        Tue, 24 Nov 2026 19:25:29 -0800 (PST)
X-Received: by 2002:a05:6a20:9e46:b0:3e1:c805:45d6 with SMTP id adf61e73a8af0-4014b65caecmr15129861637.24.1795577128983;
        Tue, 24 Nov 2026 19:25:28 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:28 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:13 +0530
Subject: [PATCH v12 6/9] media: iris: Add support to select core for dual
 core platforms
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-glymur-v12-6-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=19032;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=gRlZOHJqeOaOQuVFeuT1LdYbI81MEsOFvHzdlYSW8AA=;
 b=bEM8g3k+OCes1kL4uSKC2GFeQy5BxIeEPX/UtyLrZoZIqivVkBb9QrB6xickmUAzQq8CAz3wY
 7+4fQqIMxFoD+chdafpXsrdVNMpFz0IfZVuoFeh5Gsq45u7K2EUziMF
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX5xr9jf2sv7rI
 oB/fooatuOzlHgL0XNxNA65o1QNa78G/a/Q6cDzJpaYcURC11dipjFFFfamj/5ZlQDctvSTSwES
 H2Wk+LCwyjwgUCCEKIHdsU4ERJOTpmqboC8QF/XqSmVKL+CriADCSAFpMG8AOq3cc2fpGgfUKNR
 4n+skBHNkSDTkmbGRlfhXnYsJ2ncoPZCL4AOKbRT0GX5sMq21PBsCdpTuPBq/DRDLL/wacGjsUJ
 tp7aHEr4zVNJUQCybnF8WWKcM3rVmLPz1djRQBTyI1SklDXwebILbliN35A8MjO72Yi460ox5Iu
 5FIL63m8LKtdahni5vNeSyAx3cK8v10vRORg2wAk5pc/yTbk6HwZ2sYYWg0GOcE1f0Ec0SK+8qC
 jgmYeXxHA+0jSi/OZo7UeEOVP6mhvczlfL1q06sID8mj/6tvhDaegvq8RhfI5nOAYx3MEQJvU+f
 ntDHde4uP6hxRrNb+CA==
X-Proofpoint-GUID: ig-4Z5EUSGYhq_AwZyhRarByGUoNMhcP
X-Proofpoint-ORIG-GUID: ig-4Z5EUSGYhq_AwZyhRarByGUoNMhcP
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b06552a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cJEeBfx7ZMHFC392LVMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX16hiiJAZhwX7
 yBnc9z51c1vlgwEWaNwOq2P+xJWd82WFNXQm3GcJzZ2ueHCu6surgy38h7eFEMRSvFaJwqTHLm8
 P25mSf+ZBxs68RC8wevoDhcG5Dqjd/M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250013

On platforms with two video codec cores, the firmware places every
session on core 0 by default and leaves load balancing to the host.
Without core selection, core 1 would stay idle.

Choose a core for each new session based on the macroblocks per frame
(MBPF) already on each core and the number of sessions on it, and pass
the choice to the firmware at stream-on time using HFI_PROP_CORE_ID.
The core is picked when the session is first accepted and is kept
for the whole session, since the firmware does not act on a core
change while the session is actively processing frames. The
macroblocks per second (MBPS) load depends on the frame rate, which
applications can change while the session is running, so it is not
used for the initial choice. It is enforced on the chosen core when
the rate changes.

Both cores share one clock source, so the clock has to satisfy the
more demanding of the two. Each core has its own session limit, so
the total session limit scales with the number of cores.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_common.c     | 10 ++++
 drivers/media/platform/qcom/iris/iris_common.h     |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 drivers/media/platform/qcom/iris/iris_power.c      | 28 ++++++---
 drivers/media/platform/qcom/iris/iris_utils.c      | 58 ++++++++++++-------
 drivers/media/platform/qcom/iris/iris_utils.h      |  3 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        | 10 +++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 66 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 +
 14 files changed, 181 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 25836561bcf3e..4e1e7d38e3fbd 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	inst->metadata_idx++;
 }
 
+int iris_set_core_id(struct iris_inst *inst)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+
+	if (!inst->core_id || !hfi_ops->session_set_core_id)
+		return 0;
+
+	return hfi_ops->session_set_core_id(inst, inst->core_id);
+}
+
 int iris_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
index b2a27b781c9ac..34e32c60f7687 100644
--- a/drivers/media/platform/qcom/iris/iris_common.h
+++ b/drivers/media/platform/qcom/iris/iris_common.h
@@ -11,6 +11,7 @@ struct iris_buffer;
 
 int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
 void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_set_core_id(struct iris_inst *inst);
 int iris_process_streamon_input(struct iris_inst *inst);
 int iris_process_streamon_output(struct iris_inst *inst);
 int iris_session_streamoff(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 7c2dc24f2060a..15188471f82a0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -41,6 +41,11 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+enum iris_vcodec_core_id {
+	IRIS_VCODEC0 = 1,
+	IRIS_VCODEC1,
+};
+
 struct qcom_ubwc_cfg_data;
 
 /**
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 16099f9a25b65..5841e5f9c1228 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -132,6 +132,7 @@ struct iris_hfi_session_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
 };
 
 struct hfi_subscription_params {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..b071980ddd27a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1359,6 +1359,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = core_id;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_PROP_CORE_ID,
+					     HFI_HOST_FLAGS_NONE,
+					     HFI_PORT_NONE,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32,
+					     &payload,
+					     sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
@@ -1372,6 +1390,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_set_core_id = iris_hfi_gen2_set_core_id,
 };
 
 static struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9b..96650297e7251 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -56,6 +56,7 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+#define HFI_PROP_CORE_ID			0x030001a9
 
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index cb84753e4f915..8b71e85f3663e 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -25,6 +25,7 @@ struct iris_hfi_session_ops;
  * @list: used for attach an instance to the core
  * @kref: reference count, keeps the instance alive while the IRQ thread uses it
  * @core: pointer to core structure
+ * @core_id: specifies the hardware core on which the session runs
  * @session_id: id of current video session
  * @hfi_session_ops: iris HFI session ops
  * @ctx_q_lock: lock to serialize queues related ioctls
@@ -74,6 +75,7 @@ struct iris_inst {
 	struct list_head		list;
 	struct kref			kref;
 	struct iris_core		*core;
+	u32				core_id;
 	u32				session_id;
 	const struct iris_hfi_session_ops	*hfi_session_ops;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 77395754a1dc8..f39e2da3bf099 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -81,11 +81,27 @@ static int iris_vote_interconnects(struct iris_inst *inst)
 	return iris_set_interconnects(inst);
 }
 
-static int iris_set_clocks(struct iris_inst *inst)
+static u64 iris_get_required_freq(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *instance;
 	u64 freq = 0;
+
+	list_for_each_entry(instance, &core->instances, list) {
+		if (!instance->max_input_data_size)
+			continue;
+
+		freq += instance->power.min_freq;
+	}
+
+	return freq;
+}
+
+static int iris_set_clocks(struct iris_inst *inst)
+{
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
+	struct iris_core *core = inst->core;
+	u64 freq;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -94,12 +110,10 @@ static int iris_set_clocks(struct iris_inst *inst)
 		goto exit;
 	}
 
-	list_for_each_entry(instance, &core->instances, list) {
-		if (!instance->max_input_data_size)
-			continue;
-
-		freq += instance->power.min_freq;
-	}
+	if (vpu_ops->get_required_freq)
+		freq = vpu_ops->get_required_freq(inst);
+	else
+		freq = iris_get_required_freq(inst);
 
 	core->power.clk_freq = freq;
 	ret = iris_opp_set_rate(core->dev, freq);
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 1096cc4b01c36..7299330965dab 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "iris_instance.h"
+#include "iris_vpu_common.h"
 #include "iris_utils.h"
 
 bool iris_res_is_less_than(u32 width, u32 height,
@@ -23,7 +24,7 @@ bool iris_res_is_less_than(u32 width, u32 height,
 	return false;
 }
 
-int iris_get_mbpf(struct iris_inst *inst)
+u32 iris_get_mbpf(struct iris_inst *inst)
 {
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -32,6 +33,13 @@ int iris_get_mbpf(struct iris_inst *inst)
 	return NUM_MBS_PER_FRAME(height, width);
 }
 
+u32 iris_get_mbps(struct iris_inst *inst)
+{
+	u32 fps = max(inst->frame_rate, inst->operating_rate);
+
+	return iris_get_mbpf(inst) * fps;
+}
+
 bool iris_split_mode_enabled(struct iris_inst *inst)
 {
 	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -107,40 +115,52 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	return NULL;
 }
 
-int iris_check_core_mbpf(struct iris_inst *inst)
+static int iris_check_core_load(struct iris_inst *inst, bool mbpf)
 {
-	struct iris_core *core = inst->core;
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
 	struct iris_inst *instance;
-	u32 total_mbpf = 0;
+	u32 total_load = 0;
 
-	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list)
-		total_mbpf += iris_get_mbpf(instance);
-	mutex_unlock(&core->lock);
+	list_for_each_entry(instance, &inst->core->instances, list)
+		total_load += mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
 
-	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+	if (total_load > max_load)
 		return -ENOMEM;
 
 	return 0;
 }
 
-int iris_check_core_mbps(struct iris_inst *inst)
+int iris_check_core_mbpf(struct iris_inst *inst)
 {
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
 	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	int ret;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
+	if (vpu_ops->check_core_load)
+		ret = vpu_ops->check_core_load(inst, true);
+	else
+		ret = iris_check_core_load(inst, true);
 	mutex_unlock(&core->lock);
 
-	if (total_mbps > core->iris_platform_data->max_core_mbps)
-		return -ENOMEM;
+	return ret;
+}
 
-	return 0;
+int iris_check_core_mbps(struct iris_inst *inst)
+{
+	const struct vpu_ops *vpu_ops = inst->core->iris_platform_data->vpu_ops;
+	struct iris_core *core = inst->core;
+	int ret;
+
+	mutex_lock(&core->lock);
+	if (vpu_ops->check_core_load)
+		ret = vpu_ops->check_core_load(inst, false);
+	else
+		ret = iris_check_core_load(inst, false);
+	mutex_unlock(&core->lock);
+
+	return ret;
 }
 
 bool is_rotation_90_or_270(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index be23acc0e8484..98a898de465a6 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -43,7 +43,8 @@ static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
 
 bool iris_res_is_less_than(u32 width, u32 height,
 			   u32 ref_width, u32 ref_height);
-int iris_get_mbpf(struct iris_inst *inst);
+u32 iris_get_mbpf(struct iris_inst *inst);
+u32 iris_get_mbps(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
 bool iris_fmt_is_8bit(u32 pixelformat);
 bool iris_fmt_is_10bit(u32 pixelformat);
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 8faf709c26c12..5a4d0137e75f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -70,15 +70,15 @@ static int iris_check_session_supported(struct iris_inst *inst)
 		goto exit;
 	}
 
-	ret = iris_check_core_mbpf(inst);
+	ret = iris_check_inst_mbpf(inst);
 	if (ret)
 		goto exit;
 
-	ret = iris_check_inst_mbpf(inst);
+	ret = iris_check_resolution_supported(inst);
 	if (ret)
 		goto exit;
 
-	ret = iris_check_resolution_supported(inst);
+	ret = iris_check_core_mbpf(inst);
 	if (ret)
 		goto exit;
 
@@ -180,6 +180,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto error;
 
+	ret = iris_set_core_id(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_input(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 0d673139a7568..522ef8214bf2d 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -58,10 +58,14 @@ void iris_inst_put(struct iris_inst *inst)
 
 static int iris_add_session(struct iris_inst *inst)
 {
+	const struct iris_platform_data *plat = inst->core->iris_platform_data;
+	u32 max_session_count = plat->max_session_count;
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
+	max_session_count *= max(plat->num_cores, 1);
+
 	guard(mutex)(&core->lock);
 
 	if (core->removing)
@@ -70,7 +74,7 @@ static int iris_add_session(struct iris_inst *inst)
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count >= core->iris_platform_data->max_session_count)
+	if (count >= max_session_count)
 		return -EBUSY;
 
 	list_add_tail(&inst->list, &core->instances);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe0c91af3301d..0a211506d12d7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -339,6 +339,70 @@ static void iris_vpu36_program_bootup_registers(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
 }
 
+static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
+{
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
+	u32 max_session_cnt = platform_data->max_session_count;
+	u32 core0_session_cnt = 0, core1_session_cnt = 0;
+	u32 core0_load = 0, core1_load = 0;
+	bool select_core0, select_core1;
+	struct iris_inst *instance;
+	u32 load, new_load;
+
+	list_for_each_entry(instance, &inst->core->instances, list) {
+		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
+
+		if (instance->core_id == IRIS_VCODEC0) {
+			core0_load += load;
+			core0_session_cnt++;
+		} else if (instance->core_id == IRIS_VCODEC1) {
+			core1_load += load;
+			core1_session_cnt++;
+		}
+	}
+
+	if (inst->core_id == IRIS_VCODEC0)
+		return core0_load <= max_load ? 0 : -ENOMEM;
+	else if (inst->core_id == IRIS_VCODEC1)
+		return core1_load <= max_load ? 0 : -ENOMEM;
+
+	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
+
+	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
+	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
+
+	if (select_core0 && select_core1)
+		inst->core_id = (core0_load <= core1_load) ? IRIS_VCODEC0 : IRIS_VCODEC1;
+	else if (select_core0)
+		inst->core_id = IRIS_VCODEC0;
+	else if (select_core1)
+		inst->core_id = IRIS_VCODEC1;
+	else
+		return -ENOMEM;
+
+	return 0;
+}
+
+static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
+{
+	u64 vcodec0_freq = 0, vcodec1_freq = 0;
+	struct iris_core *core = inst->core;
+	struct iris_inst *instance;
+
+	list_for_each_entry(instance, &core->instances, list) {
+		if (!instance->max_input_data_size)
+			continue;
+
+		if (instance->core_id == IRIS_VCODEC0)
+			vcodec0_freq += instance->power.min_freq;
+		else if (instance->core_id == IRIS_VCODEC1)
+			vcodec1_freq += instance->power.min_freq;
+	}
+
+	return max(vcodec0_freq, vcodec1_freq);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -383,4 +447,6 @@ const struct vpu_ops iris_vpu36_ops = {
 	.set_hwmode = iris_vpu36_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.interrupt_init = iris_vpu_interrupt_init,
+	.check_core_load = iris_vpu36_check_core_load,
+	.get_required_freq = iris_vpu36_get_required_freq,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 5a9ca9d1902a6..ad568b5343982 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -27,6 +27,8 @@ struct vpu_ops {
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
 	void (*disable_arp)(struct iris_core *core);
+	int (*check_core_load)(struct iris_inst *inst, bool mbpf);
+	u64 (*get_required_freq)(struct iris_inst *inst);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1

