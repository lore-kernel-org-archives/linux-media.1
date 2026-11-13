Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596032;
	b=VVbEamCO+sEvoZyE7eU0AKbxmLkfjgWBhPAiFki9tfdQew0FqrpiahuLynFyKy5KmrwY
	 E5ny+b1RSaXQsIMDMjNd5yyJCSuA3mD+NGaXHR6eoJTvS36dn6bOQm79dVe7UWNDMfViK
	 Ka+mKN+QZWLAWEwfwuqhcMGRWaCfhVq6/QstB3rd4fE8IZcJHNf703qS8yVEpiEKXLC15
	 BjIjaNdSO4LbkB7lqlDSd6zbcJ2vM67MNpz324UxMuTXFTU2v0CZxmduJ4JXzBBpowdDC
	 rhp+oY8rQUJOBgx93JimZKxnzuel/sEsFqNJhJiPX5pd7nwtCj4pgV7PbvLV+u8MPHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=Gr8HqOzA+eFCvNrZZCbpDqKF0sQjtqwe7g8daHlS17I5Oq/Ai+Dw/ocEF4qgQog4A+ls
	 f95VmbN+O3vReNAMBvi1JmXeugGkQTv1JrStzmyqidgkufBg34/ZaqKXK2z/BiX6nmNDm
	 FAZZ8ZjpQM9OZyN11RLEgAKPCG9BpOeFPKSJXWIadwIfDnia4do09yAsKaglntRaoYmIt
	 G8DaUoeQ+AkQWHUybbnovFjs9OEJhitKvpk+xg7KUapWWK18tl1iOv77kikbNdQ4KAQr+
	 k2AvIfdEh2qCBWHLaKsO7Y8N1lreeHXEUNkNk+AmmUoaq1OJvCjc/Kmfz/gPDmyuOuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgfCZh5I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEFE606A32E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCEFE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SgfCZh5I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRZjP533510
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=chlWtNlFOsXFLmcefZtYaJNjW5x
	vy4O8EZdPf0zimj6RIz1A1D7MSx6iXjy7hDhXUfl/ad8fAVY2g3nyKLdbIsD/VO0
	fTeyNigeR9xlG2JaYFW3w5mG0fTreYlRb6BR27cUseLWXV8LlCIRgxiKYXva/twy
	xHBqPV6C+MiphHXqXgYfN/lr8EHponBTaA+2nxafx9I/h7OBHHbCxZfFSNyo8qi7
	HNGuwmxpZlhyr56WCuFDE9sBAmtjLV+/GacKnuXMQKi7vllonn0MUvQk7Tic9BLV
	gYqZb/a+S8yUTIGpcPVtN5NgfYidUal/f/dgNlvOCH0PEMi2kX7b8SQbfOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaasch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1518690eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 10:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596030; x=1795200830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=SgfCZh5IagFuyY8hk57HvwKOi/6Df2RzDDC+aZ+ZHm91Kj8nEtuPCEC6dDyibSVzyN
         fqoBnvDrNUJJPL7VLSs5+Myz0bNuwwQZAThz5uKm+LBCdSTx1qVdZgjgWKyBKcI6+5Mn
         X1WjHeV2FfGr+Iy4/PJnAo8eTiHMNZkJbd/QHFvokjArtrLHYg0NkOjniL/RahLEpKRL
         5BxoNo/BpKv+ylf12F3G5IiG8b6hJPmYdvRbSJZInfKDOV8JCYgLtD+BhvuEUx4eHpCw
         sVuniYvJNvNlLb9f72vdLOV2TsLLcqdQ9fbI695hb7VALs4vD5NwdvteMYGugNN81aez
         15cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596030; x=1795200830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=t2TvRJYU9wNLz4d4aDkyJpk2efArqGhI1DwJoTaPtdUjdaGIy9IuVjjqiG2aJKY4Ya
         4PwY1V5jcTqfK5vw5qDgS1SULzIbGMcJ8Os9yNU6ckXFS1lLoBeWeqzP+qZkJW9b/CqY
         9PJp+dgE63LHh8fYsZFY00db5udDJ3u+xC8C2DNjL2iZO3bmX4jXgtrBYwK46PajoGmf
         3tg8/DG2vf6h0qgFTp6EPBSKAIPAnsjqeDW5VX4B7b+UtJ1tE3xJOnyLM+dU0PljCP90
         bBxx8wNKLHeZw8zC6DhwzuLQdg5m1qI7eYtXQAMuNgT9uTSGepa+22bdWsFPytOmq3zn
         wnIA==
X-Forwarded-Encrypted: i=1; AL+hErE5fWEqs6RGcspbolHv8KiXVk6mnzooFVM1mqveDcjE2Ny+EJUkIUiSeJZp3ztYqyxu7qooqMCiJPhPJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SNl18vXQnukoVMsLVrYtL1fOSLXthl1IDNZGYP8buOGvETj51
	jNhJyoanL1qWst3QVEzEj4mZIKuRK8jTsnObxgjBMcIRKwIw+TRqrWpLeWVeKiiZl7MqoWH7m8N
	NzMaZ+Zfkx0pJT1qIhnMgng2iRD26wCdXNoifukMbSp9/LT+hJ7cSHB424i5vfdm4EQ==
X-Gm-Gg: AYBFou1t30LLK35fTBMTAQ215KduegrVP0XFLX2AotQ2wAm6TBVApStUqehbBHs+c5c
	OH7+NLLaDZ+kc3FXLt+aHcrUKwjXXCI3swnQVfCMrjPIW1lb/dVq+mAb1dis3OWyTfkIpuw8f4b
	XUowYloOg2n3Nt5LZyV0l9+aJ03GctcoWtjngPcVB6l7vngRu2OKA+kCRSFCnKgvKdMom7hzhh6
	ha013gbu0ud6TaByf3cowFr+7/5wggl0g4UhniDGXXHBKe7fNg3bJpePLv/UgDbJjHMou37yI0/
	iKx+yfkdwr7we/GbZgLTuonDgmWcqJzRGVJ5SWEHTkZYvmOZcmEac5ArbYOA0xptNrurScLK1Hc
	JoqpsIJBdoJJVWlkYlLxlX6bDNM0oGmBfOXqXp/ZSFccHdGjBgP8/lyAleHoHaG6cZkimMMYQYf
	4=
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108375eec.26.1794596030334;
        Fri, 13 Nov 2026 10:53:50 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108341eec.26.1794596029602;
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
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
Subject: [PATCH v2 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:04 +0530
Message-ID: <20261113185009.157893-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 678g4_Ljo18pLobP7lwHcV8xeE738dwj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX8c4EHLV5mhhb
 ZWjB0y/eXbTdpjPXPflcyfjMPLFcM4o9AXFR4+B+5O7oju3z1yDG0bnSFkQkCUShdyt6gOKBpyz
 v922AcS7TmJxe1BHnK6/xNJsu4XKdLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX2L+qQ4s+/yAe
 fHaWazlx6Uwdlvweb7PLWPWASB/Lw6qTUFDdYp+rvxfLp93qLQWGfpNTx2q1ntvQdVJChPT+R7e
 wR/CyumZ36wXS6hnvVJy27p3y2oLm7uCN185s6leua4DbIQshf1yyMFpn2/K7aXyGfvepVGmkGA
 qnhYVXM4m0UjitystfyRuFgYTV5dlNaC07LAgIyIeMY9W9hMy/oRB7zpzHwXoMKGetWsNnLIlmw
 O64pZ7QL0S7TUnXq9e3P4cnyj6HHqJnU97LZ3t3g5L+E5BRRqRAMJQR5gt+0Ngpoa8XZLdV7L8m
 +GhquOkB2kRFO4Yv3p43BYR06bAQ97E9CHGG14fhHg3yKurZhzV3W49CukFJ5a2Ei7zAKV233I+
 Q+uJadWYkGYaRQHD9E1OFgyAuoxMt6xE6/IQu+JkDTYwdHac6YCVDF3GkfeparuiwGctSCo8jUU
 FOUddNfvbzvqgzx5hPQ==
X-Proofpoint-ORIG-GUID: 678g4_Ljo18pLobP7lwHcV8xeE738dwj
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af75cbf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

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

