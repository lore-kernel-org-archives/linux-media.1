Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571726;
	b=JSN1zOi8CrZHj/VSC7DZw/jbssh4wSsnVZAtO/7QuC/Y2is1hVmJ8uNPEhXIbOeNwN5N
	 WcpstcTARn5HY2aGtkMrGlHHfa5FXhZUaNhuG1oPt62HfDK9KHgFXJmtUKig1E/5fw84p
	 2pkg6xnOGSjEeyapL2kJbcgjWoc4VtlzrYggdbKnqKiZRJfKB+8B/zQAP1uA0kdxX0Chi
	 Bn6Ti/k3/jVOWTOEmgzULuBwJJ3DLfBGjgYAvmr8Rs9uz9elDh/acp3h0ZVxr2w7U3er+
	 cEyp4YsWYNdr93t8vESYF5G0cxHTt6Ycc9TUAVH3ooqxGMjOTfEL22MXW8ZvBB7etPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=;
	b=S3N20T4ERNAGSb/KJUg/SeZ7O/BcehL/pcYazrdmutwYHHVicxn6X11669U95Xg305S6
	 2xqmrW3zRBuHKmuaUc6vTdGloYlCfO2hj7PQfYkqrPus2BbZTj3uua50uq6lBUFEytVbo
	 cP/2yXoIELeiYoZDzOtAceXaEfXPj1M1eUsGtYIDBHeBxmQKOE2Rj36aJLT4pnfw5Zl8G
	 N15srv99U7O6031Ap+1J4M5BqX+nsfhgVC3jEaF/zRHdkrmgca9bNPnyFHccyWA1/2SXj
	 jxOZkciDbtLR7G7gy75e26jkclrhoDpGwKtxZ0XNmHGeWXqOW77IEbrTh7yVFIrCAvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSM99qZu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNZVVLb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B623606E529
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 22:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B623606E529
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bSM99qZu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BXNZVVLb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKJmH1454845
	for <linux-media@vger.kernel.org>; Sun, 1 Nov 2026 22:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=; b=bSM99qZuUHuFNTgu
	4g4tuMKZFpWbKK5JryBqytjT8ssav/wg78lDxaqd8/cpoRL9N1w8D+i09//XlN0X
	2zX8FN0XtTqlxgIaIoeUqwcayW+WxvQiKlUqptDepoVypXytapqIudWlOHN4jIOr
	udPj5X9MLNVtXBCImAPNk50eib1fDssOvb2eIAtgbCbgrtDFi0A78fByhlPWSLHv
	8IEh0QUAuMyx37zoml9+EUBmV9AQWBGrMUftfELF7FtLlxE5Yq3aSI42f5zokaSC
	5quUW0lZaLOECi8oWdnwqo6KdyT4oWkqCGPlJBadpifowBPuXe10zIeK+eTIGUH9
	cZv8hw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfvdmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 22:22:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4790057eec.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571723; x=1794176523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=;
        b=BXNZVVLb/39IHGd8LQ9bPjLmkThExHwk+ZZVDsa2IquYH+mWNOH/DGsoFpxwA7FKfr
         dXsyzbpHhKJ93O0zV5w6nNPCDxYBksgEZnnFmvGGf1zSO2I93YE50S/lHpWHhBigaAbK
         UtgvAyjnKvDUIffoKotbW/V2WFsL8AeEHbNyeXrqgiii68VwqXr9vVLVzPq1KFGusL80
         Ckx82kdUw83AAzJY7o+U/1URRE+/8qbMB9kLNrVn4zOdHerWtjdOvJsoovbowGmbZFJi
         AJbrVPheh7DjU0i9iRVIRjY9eoX2dk7NnIZn4a9ATG5Q7ohDbf+gz5430gXioBTMJEbJ
         RkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571723; x=1794176523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/TC7D20pry+/Aonp7VR6KKpRG6Wv8FkejFoFRuGgRU=;
        b=JnedvZPJ3unm1hd2gM/jAs5LeMCyOfp5NGvclD2l1nrGuK6iw6Edj6hvqDoPmjol47
         DoNRRLQ80zMWTRernpJSmdCkZ1S1zF58RFuI0WialcZFXWO34JClU5St34xYUca9jr4H
         dqXen2csfjV9MzFxsIuHeuwDzGK+86z2ELQMjJn8SJqOJL5WL0TyuZ+myoeD1+VCYOC/
         ++vsHxc2iWiGoCXs1GBWZpPGW6Qzajr8K8pF9yy6UfcbBWpiBaH343cxl2RGDFPH+Fmz
         zW9qTJNebHpG/1atK5KoQ5SxtybNspwSwnxier4lgmE5fcRbU5hiVifQgrAQ7CO950tH
         24bQ==
X-Forwarded-Encrypted: i=1; AKwUvByup5QIBWKCuqcgMnN1sp5cx6XZVgZ4IGujN1JL9dqqygN5IXeHbtsmMKPtLIj0eM7nZ7KRrDZxIrorDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwiaRVHxwH7cjWw2CoNTDtH053+m1F8UGm5X4LxZZVgJBBnQLH
	38MulynagPZ+nYqj+gd0oXmHmm3TQSTgHQmJFMCS0xdEBnjgk/22WvegICkrEWuX6/Zt7nLjEoR
	TiGlExRAypJi/3ZbC/imcKxUk2yl8ELqowyPsG91L6ryJ8Qprk7CQrVwR6Gk5M6TGaQ==
X-Gm-Gg: AYBFou260vyeSGi3US/2EPLghgHMcY3SIcfbmAanRHbFhrgkDPRWYUBXeoJt+knWl32
	/jtZ+M0ka5BRH4Itxd1Vfl3CfypDBy4joU9SVa2uHVoDE3o4coNyK42++ZY55xOZkEbTowda1RR
	3bfT16BocbIy42NgVFcInLwL9FEASNMVxb2UH4JCeSbb1kQ7RUK4xXUKB/77JnaOPJ6PrjdLp8u
	FtZCkhvG+Vbn3qImGeeqB0Yo1rRlE5PRnfYmUVV9Facp4qN3qdOkY0ocz4HCxzIg75qxhkcKSJm
	3Vk0rzSD/K2QKWP8Xo/pMx+oBwo5ebnAcRaK3yH2VUZkleCeRQX2gT8w78D8rPJ2v9hm2eIdKF5
	yj53UfL4WnFedPtPOphBKhodWjGBzdHSSTHrEXt3Ek4ABsaixNHyyv3nAA8c0rsa1Wb6lxsaBfo
	ijfrQ5kQ==
X-Received: by 2002:a05:7022:eb53:20b0:168:6ad8:e8c6 with SMTP id a92af1059eb24-1ac5d88c9c9mr12972974c88.15.1793571722993;
        Sun, 01 Nov 2026 14:22:02 -0800 (PST)
X-Received: by 2002:a05:7022:eb53:20b0:168:6ad8:e8c6 with SMTP id a92af1059eb24-1ac5d88c9c9mr12972929c88.15.1793571722307;
        Sun, 01 Nov 2026 14:22:02 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:22:01 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:16 +0530
Subject: [PATCH v4 03/25] accel/qda: Add compute context bank devices
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
Message-Id: <20261102-v4-v4-3-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=10953;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=AEvsn32ivhk3XVOKxDEqRU0Wbh3W3SdNAogbEYlrP+8=;
 b=a17HJ4E2zswJsHHcHADxbkmtxg9zb2IWt74VQjsu4HwzDA7w3N8iN10DMvNHK7UWjV5DNSQb2
 bFc+I5ii5NiAemXxBEsAlIg5MDHLmreWs+MMfGi/MfzJtsJBO3NF+Kd
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX2UDZw+j7+XV/
 FkxFKP4IUxgTLE8g/GkaVj1+cAuTMeoVhKR08fFWVCPImFOO+QobyNj70d0PgXUmRTc7YNlDEAr
 WyNX6OpbwjLvT9TJgOL9IibuDoy6B/E=
X-Proofpoint-GUID: kQDugdfsm6N-yt72rZlHtNQ7uk7DWS93
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae7bb8c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=myGEx3QdhjGBzXGUh0MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: kQDugdfsm6N-yt72rZlHtNQ7uk7DWS93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX+zIIJWY7iCqs
 6n9cJCaJK7zWVrLY2thuA1dYD4RUDiiRQu+3/pa1yW54MRWUx0yRqExUdkpQ8rPplPIyvhg5gzt
 yviL+fVhmVFrc6uXb23K1jkccHhFBtdli4KNVvia4EFe+FYYy11ip1JYjogfysdh6pJsqscD3eZ
 Z5JBCe3XTMagF7/IqmpHV3oRZz9wfUgr7dQPBroz6CgRTtISznIsCIP77VbEKI0tfWNdGOsn+u/
 8AvicvvBOdeYFchnJ7Rgbuo5PxPwx+/BpkwtZpUQXb9OhDJJ7ZtjReG4/MxQQorET3cG41ezcdG
 cVA5RfjepW+CD4rrILL4lRaJlPqUA7D9LjG2AuOx6cc28bbgynBO+mEXpzP8hYQZCjXlAmhcgo3
 P7PQXOSwyHPdbRD7kcg3GcBj3YTN/Ck1nTLzOfM/oWsIbma8ELiuxT0QQ/4vJmHu2aNdOa5W2HS
 VviOBrh9RT3L8PTrBTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

The DSP does not access memory through a single IOMMU domain. Its
device tree node describes a set of context banks, one
"qcom,fastrpc-compute-cb" child node each, and every context bank has
its own SMMU address space. Later patches give each session a context
bank of its own so that sessions cannot reach each other's buffers, but
that needs a struct device per context bank to allocate from.

Create a platform device for each context bank node when the rpmsg
channel probes, and destroy them again when the channel goes away or
probe fails. Registering the device is what gives it an IOMMU group
and domain: the IOMMU core probes it from the platform bus notifier
when it is added, so no driver needs to bind to it. The devices are
created before the DRM device is registered, so user space can never
reach a context bank that does not exist yet. They are destroyed after
drm_dev_unplug(), which makes sure no ioctl is still running against
them.

The width of the address space the DSP can reach differs between SoCs
and DSPs: the CDSP on Kaanapali and the platforms that use it as their
fallback compatible can address 34 bits, everything else 32. Carry this
in struct qda_soc_data, selected through the OF match data of the two
compatibles the binding defines, and apply it to each context bank with
dma_set_mask(). All CDSP instances (cdsp, cdsp1, ...) share the CDSP
width, which is why the DSP name is matched by prefix. The remaining
per-SoC parameters are added together with the code that uses them.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile    |  4 ++-
 drivers/accel/qda/qda_cb.c    | 76 +++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_cb.h    | 29 +++++++++++++++++
 drivers/accel/qda/qda_drv.c   |  2 ++
 drivers/accel/qda/qda_drv.h   |  6 ++++
 drivers/accel/qda/qda_rpmsg.c | 25 ++++++++++----
 drivers/accel/qda/qda_soc.c   | 31 ++++++++++++++++++
 drivers/accel/qda/qda_soc.h   | 30 +++++++++++++++++
 8 files changed, 196 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index dbe809067a8b..4f2f236086a4 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -6,5 +6,7 @@
 obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 
 qda-y := \
+	qda_cb.o \
 	qda_drv.o \
-	qda_rpmsg.o
+	qda_rpmsg.o \
+	qda_soc.o
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
new file mode 100644
index 000000000000..afb0bb71a1f4
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <drm/drm_print.h>
+#include "qda_cb.h"
+#include "qda_drv.h"
+#include "qda_soc.h"
+
+static int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
+{
+	struct qda_cb_dev *entry;
+	struct platform_device *pdev;
+	u32 dma_bits;
+	int ret;
+
+	pdev = of_platform_device_create(cb_node, NULL, qdev->dev);
+	if (!pdev) {
+		drm_err(&qdev->drm_dev, "Failed to create CB device for %pOFn\n", cb_node);
+		return -ENODEV;
+	}
+
+	dma_bits = qda_soc_dma_addr_bits(qdev);
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(dma_bits));
+	if (ret) {
+		drm_err(&qdev->drm_dev, "%u-bit DMA enable failed for %pOFn: %d\n",
+			dma_bits, cb_node, ret);
+		goto err_destroy;
+	}
+
+	entry = kzalloc_obj(*entry);
+	if (!entry) {
+		ret = -ENOMEM;
+		goto err_destroy;
+	}
+
+	entry->pdev = pdev;
+	list_add_tail(&entry->node, &qdev->cb_devs);
+
+	return 0;
+
+err_destroy:
+	of_platform_device_destroy(&pdev->dev, NULL);
+	return ret;
+}
+
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
+{
+	int ret;
+
+	for_each_available_child_of_node_scoped(parent_node, child) {
+		if (!of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
+			continue;
+
+		ret = qda_create_cb_device(qdev, child);
+		if (ret) {
+			qda_cb_unpopulate(qdev);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void qda_cb_unpopulate(struct qda_dev *qdev)
+{
+	struct qda_cb_dev *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
+		list_del(&entry->node);
+		of_platform_device_destroy(&entry->pdev->dev, NULL);
+		kfree(entry);
+	}
+}
diff --git a/drivers/accel/qda/qda_cb.h b/drivers/accel/qda/qda_cb.h
new file mode 100644
index 000000000000..070dc1de67a0
--- /dev/null
+++ b/drivers/accel/qda/qda_cb.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_CB_H__
+#define __QDA_CB_H__
+
+#include <linux/list.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include "qda_drv.h"
+
+/**
+ * struct qda_cb_dev - Bookkeeping for one compute context bank device
+ */
+struct qda_cb_dev {
+	/** @node: Entry in &qda_dev.cb_devs */
+	struct list_head node;
+	/** @pdev: Platform device created for the context bank node */
+	struct platform_device *pdev;
+};
+
+/* Create a device for each context bank child node of @parent_node */
+int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node);
+/* Destroy every context bank device created by qda_cb_populate() */
+void qda_cb_unpopulate(struct qda_dev *qdev);
+
+#endif /* __QDA_CB_H__ */
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index f4430332ff6e..6ecb6a966f68 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -65,6 +65,8 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	if (IS_ERR(qdev))
 		return ERR_CAST(qdev);
 
+	INIT_LIST_HEAD(&qdev->cb_devs);
+
 	return qdev;
 }
 
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index dd3345b6a5ad..737232f7027f 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -7,11 +7,13 @@
 #define __QDA_DRV_H__
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include "qda_soc.h"
 
 /* Driver identification */
 #define QDA_DRIVER_NAME "qda"
@@ -41,6 +43,10 @@ struct qda_dev {
 	struct rpmsg_device *rpdev;
 	/** @dev: Underlying Linux device */
 	struct device *dev;
+	/** @cb_devs: Compute context-bank (CB) child devices */
+	struct list_head cb_devs;
+	/** @soc_data: Per-SoC DSP integration parameters */
+	const struct qda_soc_data *soc_data;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
 };
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 6bd977e8d68a..78b5f31974c1 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -5,18 +5,18 @@
 #include <linux/rpmsg.h>
 #include <drm/drm_print.h>
 
+#include "qda_cb.h"
 #include "qda_drv.h"
+#include "qda_soc.h"
 
 /*
  * Both compatibles the binding defines are matched here. The glymur, hawi,
  * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
- * compatible and so are matched by that entry. Per-SoC DSP parameters are
- * attached as match data by a later patch, once there is something that
- * consumes them.
+ * compatible and so are matched by that entry.
  */
 static const struct of_device_id qda_rpmsg_of_match[] = {
-	{ .compatible = "qcom,kaanapali-fastrpc" },
-	{ .compatible = "qcom,fastrpc" },
+	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
+	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qda_rpmsg_of_match);
@@ -58,6 +58,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	 */
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
+	qda_cb_unpopulate(qdev);
 }
 
 static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
@@ -69,13 +70,25 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (IS_ERR(qdev))
 		return PTR_ERR(qdev);
 
+	qdev->soc_data = of_device_get_match_data(&rpdev->dev);
+	if (!qdev->soc_data)
+		return -ENODEV;
+
 	ret = of_property_read_string(rpdev->dev.of_node, "label", &qdev->dsp_name);
 	if (ret) {
 		dev_err(&rpdev->dev, "Missing 'label' property in DT node: %d\n", ret);
 		return ret;
 	}
 
-	return qda_register_device(qdev);
+	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	if (ret)
+		return ret;
+
+	ret = qda_register_device(qdev);
+	if (ret)
+		qda_cb_unpopulate(qdev);
+
+	return ret;
 }
 
 static struct rpmsg_driver qda_rpmsg_driver = {
diff --git a/drivers/accel/qda/qda_soc.c b/drivers/accel/qda/qda_soc.c
new file mode 100644
index 000000000000..323b620b8adb
--- /dev/null
+++ b/drivers/accel/qda/qda_soc.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/string.h>
+#include "qda_drv.h"
+#include "qda_soc.h"
+
+const struct qda_soc_data kaanapali_soc_data = {
+	.dma_addr_bits_cdsp = 34,
+	.dma_addr_bits_default = 32,
+};
+
+const struct qda_soc_data default_soc_data = {
+	.dma_addr_bits_cdsp = 32,
+	.dma_addr_bits_default = 32,
+};
+
+/**
+ * qda_soc_dma_addr_bits() - DMA address width of a device's context banks
+ * @qdev: QDA device
+ *
+ * All CDSP instances (cdsp, cdsp1, ...) share the CDSP width.
+ *
+ * Return: Number of DMA address bits the DSP can address on @qdev
+ */
+u32 qda_soc_dma_addr_bits(const struct qda_dev *qdev)
+{
+	if (!strncmp(qdev->dsp_name, "cdsp", 4))
+		return qdev->soc_data->dma_addr_bits_cdsp;
+
+	return qdev->soc_data->dma_addr_bits_default;
+}
diff --git a/drivers/accel/qda/qda_soc.h b/drivers/accel/qda/qda_soc.h
new file mode 100644
index 000000000000..b052964f11ae
--- /dev/null
+++ b/drivers/accel/qda/qda_soc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_SOC_H__
+#define __QDA_SOC_H__
+
+#include <linux/types.h>
+
+struct qda_dev;
+
+/**
+ * struct qda_soc_data - Per-SoC DSP integration parameters
+ *
+ * Selected by OF match on the fastrpc node; see qda_rpmsg.c.
+ */
+struct qda_soc_data {
+	/** @dma_addr_bits_cdsp: DMA address width of CDSP context banks */
+	u32 dma_addr_bits_cdsp;
+	/** @dma_addr_bits_default: DMA address width of all other context banks */
+	u32 dma_addr_bits_default;
+};
+
+extern const struct qda_soc_data kaanapali_soc_data;
+extern const struct qda_soc_data default_soc_data;
+
+u32 qda_soc_dma_addr_bits(const struct qda_dev *qdev);
+
+#endif /* __QDA_SOC_H__ */

-- 
2.34.1

