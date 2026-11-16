Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846170;
	b=GOGW4BbqTa2wZEKh5L+JH0VNA2T7HJBUP04X30EdOAhpeSrdCGZpN1nCuw4RN5Z0l3D9
	 D8/reYZ5jBMzSUNHTJKYzE7wiBVWpLaZa6lXJKZ5uIoM9oPPxkwSs4i5Xi9u4jhlMT4Bv
	 Gth+gmagGzhoJIWPn7mnY/KWAK0Om7ayjcK4EZz/Jxf3QxnfzlHdePwnFHz+xoR4c51EO
	 /z+ejNKV1yMGtK3ksmpO8VbnEk5w6y4bbZt/LHcLukF8jIO3GPVf1hGdKXndWwv7q79gr
	 ROO8gPCFpc/eiidJx0zGncJxPY5Dwlr35Uc23xSXOc/8W1bwrZihomemoZ9ztCbzjUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=O4zvL4f0PBE3mP8i6OWlQppc09epzwfIGgCw9mUtxixe9w6nJ1rgEmCgWNMNJcH9UE1p
	 trzHDZ3smM4d5NjijVl+z5kW/vT2P8Wxtzcxlbgrnu3ecXunVQbp4VPQqtlMOSkzLCyoS
	 rssNQkRWtVEvclBLABl1TvpM+fXH87l5bmdy5NAMyJk9xXq0SS37y6F8MC4Y+wNuBNpWc
	 6Wodo4Mfe436jUFpi8rw0I/SK5nrxqgFHC4OPLLlapMxwluradZiwPTBJopdajFbssBWt
	 wv85FKrfYPnti3Jo+jSc0RJOJGbz1jkqjSWnOmHphwWjsRwiYbo8JtvrgFc4l6hswjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bm3KNl9g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693C606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C693C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImKUP3Xz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bm3KNl9g
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGI8mR1110232
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=ImKUP3XzzkcWGQBIHDld29kSpW1
	3G0uJ7xw4IKj6KnrhZDSfB9JFndd77V8uovcWSGwnRjYp6meXxZoJBI50ayEkCIh
	I330kLlI+/Ar3WA9eAymEYIX5A/kqaKYXMhTce83OnuGUbV62i7e5GZ7CKjqm7aK
	QF8Pn+N1ZojmqzzYyrfv/WTtBipZJUibUu/LVq72U5a0PnScjI1uzPbuh7NmL4o9
	B8ItKnCP9ocyMAghENDK6IwB1R6i4ADTkilLUnXEeH+jN+LYIeIb2Lc6KproX9NV
	2VR/aeYO4AzSy0m95rDre8ROZELsYzIzCRFwC+uWejLqZtliMUhFFFdJEew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgheaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so1238419c88.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846168; x=1795450968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=Bm3KNl9gkbKl1REM0lQfJr+iTd6fvCnhK6w6AN5NbYzBtJWOAgh7YShx5teVkm44RC
         /9L8+xEVF8IayX4KThnhal1jlbp6jIRGqao87i6dxj6uKawZkNKq10EgxnE+uYm+u0Hl
         FgDmuq2JpD6BAPLOG6hroVZ5FhYzA54/iqcOi1xfaHCgkG6vLuhR6z+tYgdiR3NY5Enk
         8nKbEv8+dI02y4okjC0/oxAu/+IxnAG/zos3/5/ORJCJ1bJccgGaLnFYCIreQUgfyjYh
         2qMFuPF6w+LT1K5RtgyTohX3zxngXyC+nSoo/KELJhi13/6RkXo++/QLIJludXmX2cXX
         mOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846168; x=1795450968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=Rfc7Y8jjW6visEDyy9+CnbK20D3uPHp92MHZ4UVdJu9qF8r/BlH6FZSNLGTXM+bv58
         v/Mc8pp12FSNi/GWdbTWT30XxowpDgzjT9p9zgwzEQEO87Tfwz/nUARZkn+uIFyfMqLb
         VZ/2hdU2aPkjk44Gesk+BV0XGZpabQWWwxlR/ApxKW13KwfAUoRoqmBX24mne4psTBIV
         KZ4iGagPFQFhFN/3EVEdBlekwXeT1wZoomFKpIrgrjeAhGRUnpaJQjPUxy5+ypqZHjJW
         KPBlAT03wFgRp66aLuRCa/8182h3yZkrhc8L+Jlz6LxZHHEd04KcR61H/TjTnXUytI4K
         P58w==
X-Forwarded-Encrypted: i=1; AL+hErH9pFHIFPvXEWG61Kj0sbr5ekkAJhsoKLabrTHOLy+UX7Py1ilpObrweTxuNjGFATa5PXmDIFpnal0aSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EN8VHaRemtW1G5VpSI8yV9Ut4TTALzBjbHvhZ3kNztSHzbdsC
	Uokv0VsIbA74HlzPgbWTfdNxLqDmSRDfkyOCjkf7OcMeFhILjqgVfOubtfciIXSJT5Y7HnbBMb7
	ebhG2FPKtwIKXX1fXtBoPI6ZMQbC/9fPvw1oPiLnIiOiT1aLctl9GX3gZsSK3w+BNtQ==
X-Gm-Gg: AYBFou0d26zcaQdaAa9b37PyI04Jy0uzS+aiRkGQVAsblHwwspkeZlCkK52J3gI/4is
	lewpiP/Isx+bf4EQpR4v9JAxKxjb16SXLlNUe5fCNskgdI1+fzomNC9mPxNzMLk0XPSLKOmBN+W
	ccvRNfn2P8eATW4uafOCwnI8NNlh/RudB50DAgoJB9NVHikSPbs6+FiQYbAC3ibUOEeaMod2xEn
	SMzZHvtAyMkdUMvGwtSMrlIpT3kxaOEndd0UGF2RMj1gCiFN05KCIez11sSdfVd+/mwUUOLIG3r
	O0C+Y38/pA49WmFOLQ4sqqIa3vfnAhjeCzWaUQ5+O7xGGrPAl44IE12bfHqphoZG7d1wmV4Ll9T
	yKB4RQXEkMVqoRGNG6PuZS16obHVH5Xiu0IKAVEmmotrLE6ScXO6akwx65QSHkCovw4VI6N/6dA
	LO
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473325c88.21.1794846168331;
        Mon, 16 Nov 2026 08:22:48 -0800 (PST)
X-Received: by 2002:a05:7022:2594:b0:1b4:caae:3324 with SMTP id a92af1059eb24-1b5030ad1d8mr12473081c88.21.1794846163018;
        Mon, 16 Nov 2026 08:22:43 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:42 -0800 (PST)
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
Subject: [PATCH v3 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:43 +0530
Message-ID: <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX4gXNqkNHkWch
 4wCRGAkVbDCJVwWuQUguswPEn2CEVMv+30ifSxjEm7auJUeXFW7VSBeylzxyUnt0lDKHCPgCJbb
 BI7N/gzL4yZWw9O4Ozi/N6HgR4WrI4w=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb2dd9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: TlORu1aOqOqVxWrFkvwuw56H7m1aPA33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX0IlgHJzEZ9kM
 0ae3ttQj9038r99tcz+WG2HMNMLCOTwg1K36UzMO0fj4myEkBaZFqPF0R6qT5NGe4F2J2fBqTi/
 yOnGvei+E5rw0/Wt142E83+1ytJw3bPmgCZ1l0E85f05vJzabPXSOE35lq3mH6nmDp5h2/ebJfn
 sFHrAVQklxE09DYY1EytjZt34xACOAgzLe8wM1/UxoSyNbcXat0REzGGv1/yAI4VOCUygJH201h
 Isf/koF7521JDWHMXvhBhWwYXGlErsf1hGYcLU0krRsIY7vf5B75u1eujwBQdj71UAkhhkhfhGI
 HQXCiGswlBqMSiMVGC59sAnmhR7/B4m8OoF7p2llmahacQajOMPTGbz0FLBh7sNNYW5BbBKqaJG
 NXwSpm+Mzg+vQ3aE6WS2uzZzR8U/eiggZfYPornog9jYkJ3dB4ZhGn6D9Hkkejj5Xvn0holT8sh
 cZU9YnKjlF6+COrN0cQ==
X-Proofpoint-GUID: TlORu1aOqOqVxWrFkvwuw56H7m1aPA33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
metadata initialization, memory setup, and segment loading into a
single API that does not expose a PAS context.  iris_fw_load()
calls qcom_pas_auth_and_reset() for TrustZone authentication,
which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with
a PAS context and can handle everything qcom_mdt_load() provides,
along with additional functionality such as shmbridge creation
and retrieving memory from the shmbridge buffer when the same
remote processor needs to run while Linux runs at EL2.

Embed a struct qcom_pas_context directly in struct iris_core and
initialize it with qcom_pas_context_init() inside
iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
with qcom_pas_prepare_and_auth_reset().  The
iris_detect_firmware() scan retains a separate memremap window
after qcom_mdt_pas_load() completes, since it needs to read back
the loaded image data.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..ac73bda072f8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -129,6 +130,7 @@ struct iris_core {
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 	struct dma_iova_state			*iova_state;
+	struct qcom_pas_context			pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..b701a7f43514 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	memset(mem_virt, 0, res_size);
-
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
+			      res_size);
+
+	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
+	if (!ret) {
+		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+		if (!mem_virt) {
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 
-	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
-
-	memunmap(mem_virt);
+		memunmap(mem_virt);
+	}
 err_release_fw:
 	release_firmware(firmware);
 
@@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0

