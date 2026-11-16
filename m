Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846176;
	b=ou95DX0y1QVdf6sZlq9ynRRiW5FKmi0GOsVweAl63FDVDh5hONIPSCZxUkTtbLwjwErM
	 kmqrVbqWDR3QPLFjiRmC6Jt6TcBY1CTUqDlGZEgCpRsGDuIfWPI2T9/HJQIKwXuARtSv2
	 nUk2OG9QHPbfEoc53Qg53k5KKLN+SPxStWgeEW5ATd2IE1pXMn54ZCaV4AkYUv/zdMMze
	 7BinZ1RRWkDf5LNufI6PYcnXAoQ0Pae51opO1b8m8lzuRt8+CkGY4kqUTSGsLFhJ4Vmnx
	 w32/qLBnSGe/WNhamLjFPISAghMWWB8KUQgGedyVXHoESXxkQm4BrGiPm1wLxdnLBKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=F4zEQfDmaBZtGu/N3qVbrSf5Lqi/xGvULWd1cIl2mKVWSZ53ZqnIicpR2gaie+i8R88U
	 8vT179Vpca49nYlMty44VArpxChjDPStKxNKkc41F3b8SxsFXFAGG5qu9DfO3Nnv5iCto
	 V9/20fNraTY4Oo46yBtSrumEIQB1odl0fwBEayUSLQ7ijVQW2igUbP7JSzN9bZlN/n1kP
	 KkUbgF15Cx95fq/PinlNTeGQolNmlVme7P4l4n/4MdeI+7xe96j3YiI/cXK1OLNPa4p4b
	 A+js/X2jt12ZNzuanxunkdZAet8PlfilgCd5PPdN9BQSXtnaA50pYSijH3pDkZ+5dfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6718B606A329
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6718B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGKAHb3693035
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=JJXXqVQtYeE7I2LIEKqks+Aj4Og
	6mnE8TIi1ILCOq3qM3zVIKPZcwh5rA41aKqTA6PTkfDdudLi89hQdm0W9KNvl/Se
	V7ZsXAWS9TIyjztwC3XSBW02c2hQsa04UDoTLnpOwWu3P8l3aDQGk3y/heMjTuRT
	nNm5k5Zz+jk+oQGwu5nk/eX64P7cDzS9BS1E6TA2RfiRwgwpbu07xlAIgaXOdyxk
	X76qpzY8fUBZL81X9hbki8jvo2HfuhfgWqE/h0hlG+5IywHykWIzfTG5M6T/EOBv
	s8Vl8bPkaZGplcg+mhacoh3bDccKZF7hLzLP6YotlMs9sona+8iakVmMXyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f810ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4518716eec.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846174; x=1795450974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=d9sgcvnriVBI0vbCeHhHUbG9IeWuVL+9OJyu51Fdi5gcoe8z603BJyj9wfFvqukxRy
         4GjsBduEkjKRGesd8Cc1O+90jMA7iezGrl7LSY9fVVoTrwUnsl2aQtzHohhDirixDrHM
         lHjv5A6FjURb9pgiWdZSaeyatRB52I5AiTybeNxtdsXMBel3Cm72HaBRtmeYCKT4T1bM
         3xVAaT1lPv2+gjri5iHUg9I8j3rCkaXnjhvVZRRnImzhxJ4a/h4Wr1N/kYx38lR1jJYi
         YhQs5+7R9Y7BcPoa3cn6zT1sH7SP+4CeSn6ooqA6VB9tYo+E5fkmbxQ5GGzHDIUxJz+Q
         21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846174; x=1795450974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=C+Z631v/kVPUhD6epzNakRrf54/f76SawrVFNier0GCiaNQ/H5AvCQzARUAQjwkfp8
         ThBHr/+teoC3sriZjz0r9ixc0l9O+qCNX685ev9iFfAzunJnb+VhpQ6ORPptCnWXxceW
         aIzNj5RYFQhVAz4NjbyKNOW7WGl/jiKle0oDwArK+nvKi8Yj6JbBhyejkoQsJdcswAZL
         r/rsmaQ1GstWKZA7p9J6hfdnkMDp+2lt6DxacQTLu1nwAr6dCI79OhPwOP2ZijSyBbkL
         fdFHSYhAfHQvPGp9YL3WwhzjGe71rgSq1FjBFbBVZ5+SVZ2oRVYqncgN7gIvHw6mAJ/B
         Ee1g==
X-Forwarded-Encrypted: i=1; AL+hErEgXjlxQBsM0T+Sj5U8gOlfkhwDfXP4nmkjfa2uWQEUvv2a/sN3As5DbVpZr/Px4muOGU0oncud50PBxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mq7cplPEsPo0Irf8Z4Je7HOwX5GjBwLoDthRjN1WDMcSs7tPP
	wNmj5L6PvEpAzTooQxf1MOpikHQ386XeUuiu5tCkTh47afGf+5eDg5+iCTMT/YbmBO8jvyTMC2I
	jMs75LPLICOggv2zDANhjxzX6vM23vtluall8J85+mlrGazZ27Mrc7bcJKtfNIzJGpw==
X-Gm-Gg: AYBFou10cZeN8UgD4TO45LFaw4LH0Y0yQm4kQsQU0wGLZGIs/LYymQSaPpxSNp63sa9
	aVUXzM0DGVp4NGrM5xpzuLnuRoJBsDdoZzgJdaYipWgUkedXbW/YBgz6SpHUgOBLIXtwRVyfRvR
	dZ+5lncbzljZn68+/shsJEmRHMxLMJKvoo5x0OopZPJqUN3orxM0XL0Oq/CRZjB+p0x98DoG44R
	Lxo232dsmV0yjDcex9iyr5MDuj/8LIzl3bWHKhTHINaf2B+3N9uhP966sr8Hj4wAc4lyit9Wt+L
	Q6m2AYMGgXytpzv70o3iss+es76IPYdVqRy21bqYBosiGDl+y5rWrK1h9wUgx4lVuv85MGSii8P
	STNjMaJCFRR5gIo5JcnGV4DUAwpmqT8DRttp1bOlLdSnYcGtfvgGVsmHcPz5i+AAes07nX3kI6H
	b7
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214626c88.33.1794846173977;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214575c88.33.1794846173198;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:52 -0800 (PST)
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
Subject: [PATCH v3 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:44 +0530
Message-ID: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXz/ScLF1LPI7y
 ZsLPZquUwREyJqNaCdVR/Fct2YSDzMTszMwFP+gidJDf6nGx01twNYVRnpw/epa+h32if3jar9o
 Qcq1Z98ooiinYY8n9G6rgTbpMGc2TD6WVy8ejk5FOW/8/Kr/8IfAHZOXdO9i8ho3YqxYLHAHVy7
 UTi3yPP6sLtq2B0t6wVhYm7nEvy+QD+IOL19TIbaAH2oPanhvggMqxoDXOl7+3jfmyTh31J4P9I
 vjNzky5w+ftorkjuWlKEOOImYszPzPIfeC9bhhknH3d2HkAs2Jhudf89a8wbK64sEPwCQuYO40/
 06TNxs/Mqgci17TPye6onvEmCBiQjMNcZmw4AUupH23LkuXGWPnBz7svA5Xp6bFWJ3pslgq1ut5
 SVbuWs7zNug2YcOAWpT618yxWDxxfPHma9gSGfyoOQb35SMj8sfaqoo+PDr5KumxaTsvdkgXX4e
 jehSejcHqMrThiXvZ2w==
X-Proofpoint-GUID: alrIKXwAZIRJ9M7FlbMJlX_7DXPg-Mt_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2etjfAttu/Vt
 KNH7dPySaOpE2EahN2jTHAbPC3je1EIlY/PbFCGBLYM8ACcxgzWQSX0gf6vOm2/Ngj15gaP4EqX
 HucIPcOm5UIp6EAQr8CDze4jMmaWk44=
X-Proofpoint-ORIG-GUID: alrIKXwAZIRJ9M7FlbMJlX_7DXPg-Mt_
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb2ddf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

