Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571780;
	b=qa6hj2FCj95x82XT09gRinyGasWJWqoKIiXL9ZgjFXjO8EbpKefyNiGCD7VO3I4/fym8
	 V4IeBkcahAIsdTtIBHzOH7gqc1QW0Nuu8Mij6xLy8pIMpfM4/zil1bsb+LBnf+P0xaIi4
	 Xlnuv7TCxPw5U6FdVOwYzEuTqHJrn2aJfRpI6kMFh8ivLvORPdBvyMdP9fnDKf4tNMD77
	 NBbpvxLUzyIeE6IZaG02YWG8D3vkUqdWcUUmvNMzNa+Dp0tiMZu8opf5q5hBmC3EdODMt
	 aux5ND5/C9nn9AQiHNNwtp/cZHyzn0s2r56W9ifzP8IN/RWIwserKrXGo+cag4gbFYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QzJZ2BcidzT4ISYjzhL7JV9DbvORXIU2G7T+Ba5JI9Y=;
	b=Rl6THQaS3/9AhcfvLRNBjZzqJAzOOdCwmPRG+ZaQ6ocibPFGXsspOc3PlJUe7s9MZMq2
	 Gk4er+BI5A1R8QoY5DFmfKBC3g+GoZsc0gq146sTwMrhkvH4TXDCkoiQaTcFt3AdehGiJ
	 vnOthN+kvR0h/SoLJPU/StN/eu76oE4VJc46RuxkDT4svLiwbv541KmExpd4De0pDOk+n
	 IfAdMR3byT15uHtM5PlfL+fxFycTGPAqCKfU1B8I8ItEQZ2mVGLgzTpI/r83wJ1AGQ8zM
	 1EUoGfhFn4CnpocnmkltPvX6d6+/oEfqLBq5OQAh6l2Why/BDWMo6TX1fpSnJ5itsrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChOArK5W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INcBNekt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7D6070E90
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 22:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B7D6070E90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChOArK5W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INcBNekt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKLt01454856
	for <linux-media@vger.kernel.org>; Sun, 1 Nov 2026 22:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzJZ2BcidzT4ISYjzhL7JV9DbvORXIU2G7T+Ba5JI9Y=; b=ChOArK5WAaHq7hGi
	YakHkYVMPJOC02eg1CDoYz/Ff7HQSI0XKqkSdQtxfPHfThcpLpn+gciEWFyrfl+z
	8S8bMjztTvj4HMNlAXnWrunHOYwnMmgXwebSsc7lNmY+wVDO6DNI9pe+nWW524Oa
	InhIrzpefGJRyi0wP303EwJFhvsLTuW3HD7r8lGdeOC6Sa0snhr5ZmtJLdLlvP9d
	IdjhT8NniM1qH2wGjpSRDaqseZ/ltmmuaeJFO9sSwwuhkXRl7XeJgeUJ6JDJqMWK
	cv2+8FW6NtUtL5z88WHlY4gpUE7Okvm5doyY0YsB+YX/JTPNmBwWHZTk3rpmdM9z
	xH3RTw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfvdq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 22:22:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so2441019c88.1
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 14:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571777; x=1794176577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzJZ2BcidzT4ISYjzhL7JV9DbvORXIU2G7T+Ba5JI9Y=;
        b=INcBNekt8rRXIFI4d/m9AK0I+thd2pM+N4qYSicN4VdLpWacJqqEAQ47IsaxKOkYMY
         J8w8fdkcFpTJOMkGEHvfH2RFfEzWS/kAdYcKbhU9JGtzpFXqZKoeGnG9Qpbb1F7ES9nu
         q77bfVTxhIxpDkFDv1W+bhneavkEboncxnkwu2npdMfiqPYI0hOF65UECfJCljYDcf7N
         h1fLfH3COCwc2C0FOe2XjrRRwyjLvOs2PLu+zMAzOQfQuwBmVCRjd+zVB4piBgaQihVe
         spFeDmRifQDN19NsYJDjSixeb+mdby1f6E3Z4jKTON5F8qy4851MJfDTbhFE9YzYHZSz
         Qz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571777; x=1794176577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzJZ2BcidzT4ISYjzhL7JV9DbvORXIU2G7T+Ba5JI9Y=;
        b=tgTypd/xzU4MN0z/7CVP2zKLTOHkeXBJyCOdQWkcWGeWYDn/dWVveqk4QkHT0u+Yjy
         kJQp25fknmK1OnQr7zjyVubxmnd8kt0hUFemqHfEAApWnIkZAVl1V9DkC13dLKjI1JsC
         4qTC6Inx6mUMoj9vwLj9qJgHhCdOmV+vBJPeE5VUrrOiF4rQ5oVzTmYdH79xPm0Tyv39
         iJ9bWvC8g2sb2CZzkfO2pIS9s/APRMAEJZ2qV0ogsGNr9TKquFyAVfH8Jzgc3ZvqRfer
         Ro1ouc1loFvhuNiOfbxVHqsgpTzf3+KAb9xRfXYgqkN61u2xCHJv+8tVJ7u++JIUe2Zo
         H7Sw==
X-Forwarded-Encrypted: i=1; AKwUvByFKDQNmILUvFgIzykBcuMrYZM5lSp7Wql/tPsEErMPCK8caCXZ+s8B33WFW0CI2xsg+gajLYoZu4cuxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDHPwgKJLZlDsjFdGgs5F9t/TyLknFSci1A4nBAz4bnPfGLTT7
	b6PvS/ZaJ3i6Ejtl62G6Vbrn99ZX5x8kmYJBnc0lpjwC9pOVDqVcxgy8LSnZqiYxYjp8pKFhI0D
	sC9hXjwLSCw3RPTZkYRZMr9dgRzSLve5uE62UrbQZTs5KCIKu1qTFv1vaPLvqmCoXuA==
X-Gm-Gg: AYBFou3b7NmrSO7PXdWE7LISWISu22U4U8MBrQ9nUPScLDOI4nwLlVYukJDhtdVgpwq
	tZWR9lVrCvqosroPvr4y9+gIho1dYYZBfiMxx6483boS1TCB3jbtdbX4gUgFph28/xPAbOyMcWC
	b5lHLFbK+6B3HFDIyCyVY/lJHkTsYylUxXSC/LBZhGHeyweZ9PZAYudb/Wb/l0nlU9jsKwPSv9Q
	FFpP6XIWEg5a+i8vDELiqnJtpvyL63j8PzFFlmf8FtqiRFZn4n1PPysioycZJuwTxQydF4ugtCw
	hlcLTYai1pjtAi3/FSe3peiNCpgWUlnF9QiRm/tUhyBR4UotG4T6JfD5Y+yeRI6ahhVkZedGShP
	vzjSVFfwjKlkIqMW6badpNRg1mJE4mcNSvsn4pWM+aX1X8K0KQ0kLIz880DPMvipOVYIGL17X5q
	VmJBCaFg==
X-Received: by 2002:a05:7022:1509:b0:195:9228:50a0 with SMTP id a92af1059eb24-1ac5d3ba9f2mr14632971c88.42.1793571776913;
        Sun, 01 Nov 2026 14:22:56 -0800 (PST)
X-Received: by 2002:a05:7022:1509:b0:195:9228:50a0 with SMTP id a92af1059eb24-1ac5d3ba9f2mr14632885c88.42.1793571776189;
        Sun, 01 Nov 2026 14:22:56 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:22:55 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:21 +0530
Subject: [PATCH v4 08/25] accel/qda: Add legacy ops base and auxiliary
 device
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
Message-Id: <20261102-v4-v4-8-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=16111;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=tJ56OicBjzqOAJbg765udfwE3azsMq9/1F/R/iYRhwQ=;
 b=H/cH8IjyD5JbjN1TocakKmA92lGHrxzWQvX6gaOYO0DXn6o6Lh/PT+au5DvBgOPuDx+oVhDse
 yOr0fIfwk+MADtVcENCazqd2VR8J78ZHiVx4vxy2ssI4jAnfPeN+JT1
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXyEK51IWz/4M0
 3HWb1QfBYDrAXNJp4ImjaCMd87SjNcb0fDA1Zfc4Y/9dqq7nM6DyYXF/+Ds93Z/5vqWULFRuOHH
 P0C/paPJiFmbWfO0JftIxP8ZbS7RaAY=
X-Proofpoint-GUID: NU1o3j0KYhjG-YUhI34GdSr-FOUS4urZ
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae7bbc2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BD9PkF2Qa3Gb5rzLt0MA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: NU1o3j0KYhjG-YUhI34GdSr-FOUS4urZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX3ItCvll3QJcM
 sKm2PBneTLNQ+sW1danI+KQj8+4zBynziM7EvZZw0qr9zo/mqh5PIgobveYOK7rbJW2DIFbAT3g
 xamQJMfoQxiNxpkm0B9SbG1ML/JZ7LYjLOUqGV31XVZ5zIszYtTCAaPmscfKwSlmnLLsZ/sPvQV
 zfgJJJYH5b9oSOAoMmQdKbaL+TR5sChYnDhcVX96Gq8Y4TsMifUBxvCeNzeXwyOQCBeKFQolEeX
 F5YMqadNzE1A9GyY8EFVhSOihC3Dq46KG4QxwjMWS/XOznVDENt6zROpurSaw+1ysgPTfNe7Sbj
 KhfFHW3Ro9PnoJANxnkAmzVufTnvYcSEDZQv2xmwxqQmojrDJ8ENBXMN1VsMC2GL8WIdL9Pb6Zh
 VA4xQOnZMcVRDd4e+pDrefzCaVKSDfaS+59ynvqv8T2CiCYm+CIcgdpbhvhqO8iboeM14q20i4Z
 kPX+EDP41TmK/7wg55w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

The /dev/fastrpc-* interface of the driver this one replaces is to be
served by a separate compatibility module, so existing user space keeps
working. That module needs two things from here: a device per DSP domain
to bind to, and a way to use the same session and buffer handling as the
accel UAPI rather than reimplementing it.

Create an auxiliary device per domain for it to bind, rather than
keeping a private registry and a notifier callback. Domains appear as
each one's rpmsg channel probes and the module may load at any point in
that, which is exactly what the driver core already handles: it matches
devices to the driver whichever order the two arrive in, and autoloads
the module from the device's modalias. The module is optional, so
failing to create the device is not fatal to the accel interface.

The device is destroyed explicitly on rpmsg remove rather than through
devres, so that the legacy nodes are taken away before the DRM device is
unplugged and nothing can open one during teardown.

Collect the entry points the module needs into one table exported only
to it, so this driver does not depend on the module. Start with session
create/destroy and DMA-BUF allocation/import; further ops arrive with
the code that uses them.

A session the module creates has no DRM file behind it, so nothing else
holds the DRM device. Take a reference when it is created, or the device
could be freed on rpmsg remove while a legacy file is still open. For
the same reason, buffers are exported and imported as DMA-BUFs without
a GEM handle, and struct qda_session gains a ->file that is NULL for
such sessions. Code that resolves handles can only be reached from the
accel UAPI.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Kconfig          |  1 +
 drivers/accel/qda/Makefile         |  1 +
 drivers/accel/qda/qda_drv.c        | 48 +++++++++++++++++++++--
 drivers/accel/qda/qda_drv.h        | 31 +++++++++++++--
 drivers/accel/qda/qda_legacy_ops.c | 80 ++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_legacy_ops.h | 41 +++++++++++++++++++
 drivers/accel/qda/qda_prime.c      | 33 ++++++++++++++++
 drivers/accel/qda/qda_prime.h      |  4 ++
 drivers/accel/qda/qda_rpmsg.c      |  3 ++
 9 files changed, 235 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index e2f3f01016c6..c174f9edf2d5 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QDA
 	depends on DRM_ACCEL
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	select AUXILIARY_BUS
 	help
 	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
 	  This driver provides a standardized interface for offloading computational
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 01c0319da900..a867a888c5f5 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -10,6 +10,7 @@ qda-y := \
 	qda_drv.o \
 	qda_gem.o \
 	qda_ioctl.o \
+	qda_legacy_ops.o \
 	qda_memory_dma.o \
 	qda_memory_manager.o \
 	qda_prime.o \
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 5e953d1f98bf..21113deceaad 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <drm/drm_accel.h>
@@ -14,7 +15,13 @@
 #include "qda_ioctl.h"
 #include "qda_prime.h"
 
-static struct qda_session *qda_session_alloc(struct qda_dev *qdev)
+/**
+ * qda_session_alloc() - Create a session on a device
+ * @qdev: Device to create the session on
+ *
+ * Return: The new session, or ERR_PTR on failure
+ */
+struct qda_session *qda_session_alloc(struct qda_dev *qdev)
 {
 	struct qda_session *session;
 
@@ -26,6 +33,7 @@ static struct qda_session *qda_session_alloc(struct qda_dev *qdev)
 
 	return session;
 }
+EXPORT_SYMBOL_FOR_MODULES(qda_session_alloc, "qda_fastrpc_shim");
 
 static int qda_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -42,13 +50,18 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static void qda_session_free(struct qda_session *session)
+/**
+ * qda_session_free() - Release a session and whatever it still holds
+ * @session: Session to release
+ */
+void qda_session_free(struct qda_session *session)
 {
 	if (session->assigned_iommu_dev)
 		qda_memory_manager_release_device(session->assigned_iommu_dev);
 
 	kfree(session);
 }
+EXPORT_SYMBOL_FOR_MODULES(qda_session_free, "qda_fastrpc_shim");
 
 static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 {
@@ -117,10 +130,37 @@ int qda_register_device(struct qda_dev *qdev)
 	int ret;
 
 	ret = drm_dev_register(&qdev->drm_dev, 0);
-	if (ret)
+	if (ret) {
 		drm_err(&qdev->drm_dev, "Failed to register DRM device: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The legacy FastRPC interface is served by a separate module, which
+	 * needs a device per DSP domain to bind to. Put one on the auxiliary
+	 * bus and let the driver core handle discovery, ordering and module
+	 * loading; the module is optional, so failing to create it is not
+	 * fatal to the accel interface.
+	 *
+	 * The auxiliary bus names devices <modname>.<name>.<id> and requires
+	 * the name to be unique across the bus, so every DSP domain needs its
+	 * own id. The accel minor index is unique per registered device.
+	 */
+	qdev->legacy_auxdev = auxiliary_device_create(qdev->dev, KBUILD_MODNAME,
+						      QDA_LEGACY_AUXDEV_NAME, qdev,
+						      qdev->drm_dev.accel->index);
+	if (!qdev->legacy_auxdev)
+		drm_warn(&qdev->drm_dev, "Failed to create legacy FastRPC device\n");
 
-	return ret;
+	return 0;
+}
+
+void qda_unregister_device(struct qda_dev *qdev)
+{
+	if (qdev->legacy_auxdev) {
+		auxiliary_device_destroy(qdev->legacy_auxdev);
+		qdev->legacy_auxdev = NULL;
+	}
 }
 
 MODULE_AUTHOR("Qualcomm AI Infra Team");
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 31aad9057e28..c04f19e5a91b 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -6,6 +6,7 @@
 #ifndef __QDA_DRV_H__
 #define __QDA_DRV_H__
 
+#include <linux/auxiliary_bus.h>
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -20,15 +21,29 @@
 /* Driver identification */
 #define QDA_DRIVER_NAME "qda"
 
+/*
+ * Name of the auxiliary device the legacy FastRPC module binds to, one per
+ * DSP domain. Combined with this module's name it forms the match name
+ * "qda.fastrpc", which that module lists in its id_table.
+ */
+#define QDA_LEGACY_AUXDEV_NAME "fastrpc"
+
 /**
- * struct qda_session - Per-open-file private data
+ * struct qda_session - One user of a DSP
  *
- * Allocated in qda_open() and stored in drm_file::driver_priv.
+ * Created either by the accel UAPI, one per open DRM file, or by the legacy
+ * FastRPC compatibility shim, one per open /dev/fastrpc-* file with no DRM
+ * file behind it at all. The core is keyed on this rather than on struct
+ * drm_file so that it can serve both.
  */
 struct qda_session {
 	/** @qda_dev: Back-pointer to device structure */
 	struct qda_dev *qda_dev;
-	/** @file: The drm_file this session belongs to */
+	/**
+	 * @file: The DRM file this session belongs to, or NULL for a session
+	 * the legacy shim created. Anything that resolves a buffer handle
+	 * needs this, so those paths are only reachable from the accel UAPI.
+	 */
 	struct drm_file *file;
 	/** @assigned_iommu_dev: Context bank owned by this session, or NULL */
 	struct qda_iommu_device *assigned_iommu_dev;
@@ -64,6 +79,11 @@ struct qda_dev {
 	const struct qda_soc_data *soc_data;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
 	const char *dsp_name;
+	/**
+	 * @legacy_auxdev: Auxiliary device the legacy FastRPC module binds
+	 * to, or NULL if it could not be created
+	 */
+	struct auxiliary_device *legacy_auxdev;
 };
 
 /**
@@ -84,5 +104,10 @@ struct qda_dev *qda_alloc_device(struct device *dev);
 int qda_init_device(struct qda_dev *qdev, int num_cbs);
 void qda_deinit_device(struct qda_dev *qdev);
 int qda_register_device(struct qda_dev *qdev);
+void qda_unregister_device(struct qda_dev *qdev);
+
+/* Sessions, shared with the legacy shim */
+struct qda_session *qda_session_alloc(struct qda_dev *qdev);
+void qda_session_free(struct qda_session *session);
 
 #endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
new file mode 100644
index 000000000000..3566a10c6488
--- /dev/null
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-buf.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/fcntl.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_legacy_ops.h"
+#include "qda_prime.h"
+
+/*
+ * A session the shim creates has no DRM file behind it, and so nothing
+ * holding the DRM device. Take a reference here: the device is allocated
+ * against the rpmsg device and would otherwise be freed on remove while a
+ * /dev/fastrpc-* file is still open on it.
+ */
+static struct qda_session *legacy_session_create(struct qda_dev *qdev)
+{
+	struct qda_session *session;
+
+	session = qda_session_alloc(qdev);
+	if (!IS_ERR(session))
+		drm_dev_get(&qdev->drm_dev);
+
+	return session;
+}
+
+static void legacy_session_destroy(struct qda_session *session)
+{
+	struct drm_device *drm_dev = &session->qda_dev->drm_dev;
+
+	qda_session_free(session);
+	drm_dev_put(drm_dev);
+}
+
+/*
+ * As the GEM_CREATE ioctl, but exporting a DMA-BUF rather than installing a
+ * handle: a session the shim created has no DRM file to hold handles, and the
+ * legacy interface hands buffers to user space as file descriptors anyway.
+ */
+static struct dma_buf *legacy_alloc_dmabuf(struct qda_session *session, u64 size)
+{
+	struct qda_dev *qdev = session->qda_dev;
+	struct drm_gem_object *gem_obj;
+	struct dma_buf *dmabuf;
+
+	gem_obj = qda_gem_create_object(&qdev->drm_dev, qdev->iommu_mgr, size, session);
+	if (IS_ERR(gem_obj))
+		return ERR_CAST(gem_obj);
+
+	/* O_RDWR so the fd can be mapped writable */
+	dmabuf = drm_gem_prime_export(gem_obj, O_RDWR);
+
+	/* The DMA-BUF took its own reference if the export succeeded */
+	drm_gem_object_put(gem_obj);
+
+	return dmabuf;
+}
+
+/*
+ * As the PRIME import path, without the handle: same reason as above. The
+ * caller owns the returned reference.
+ */
+static struct drm_gem_object *legacy_import_dmabuf(struct qda_session *session,
+						   struct dma_buf *dmabuf)
+{
+	return qda_prime_import_dmabuf(&session->qda_dev->drm_dev, session, dmabuf);
+}
+
+const struct qda_legacy_ops qda_legacy_ops_table = {
+	.session_create = legacy_session_create,
+	.session_destroy = legacy_session_destroy,
+	.alloc_dmabuf = legacy_alloc_dmabuf,
+	.import_dmabuf = legacy_import_dmabuf,
+};
+EXPORT_SYMBOL_FOR_MODULES(qda_legacy_ops_table, "qda_fastrpc_shim");
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
new file mode 100644
index 000000000000..76b80dc87a4b
--- /dev/null
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_LEGACY_OPS_H__
+#define __QDA_LEGACY_OPS_H__
+
+#include <linux/types.h>
+
+struct dma_buf;
+struct drm_gem_object;
+struct qda_dev;
+struct qda_session;
+
+/**
+ * struct qda_legacy_ops - What the legacy FastRPC shim may call
+ *
+ * The shim serves the /dev/fastrpc-* interface of the driver this one
+ * replaces, on top of the same session and buffer handling the accel UAPI
+ * uses. It is a separate module, so the entry points it needs are collected
+ * here and exported as one table: that way the driver does not depend on the
+ * shim, and neither module has to reimplement what the other does.
+ *
+ * Ops are added as the shim grows to need them.
+ */
+struct qda_legacy_ops {
+	/** @session_create: Open a session on @qdev */
+	struct qda_session *(*session_create)(struct qda_dev *qdev);
+	/** @session_destroy: Close a session */
+	void (*session_destroy)(struct qda_session *session);
+	/** @alloc_dmabuf: Allocate a buffer and export it as a DMA-BUF */
+	struct dma_buf *(*alloc_dmabuf)(struct qda_session *session, u64 size);
+	/** @import_dmabuf: Map a DMA-BUF into a session's context bank */
+	struct drm_gem_object *(*import_dmabuf)(struct qda_session *session,
+						struct dma_buf *dmabuf);
+};
+
+extern const struct qda_legacy_ops qda_legacy_ops_table;
+
+#endif /* __QDA_LEGACY_OPS_H__ */
diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
index 7a709e3000d8..128d4ab2cf64 100644
--- a/drivers/accel/qda/qda_prime.c
+++ b/drivers/accel/qda/qda_prime.c
@@ -181,4 +181,37 @@ int qda_prime_fd_to_handle(struct drm_device *drm_dev, struct drm_file *file_pri
 	return ret;
 }
 
+/**
+ * qda_prime_import_dmabuf() - Import a DMA-BUF without installing a handle
+ * @drm_dev: DRM device
+ * @session: Session to import into
+ * @dma_buf: Buffer to import
+ *
+ * As qda_prime_fd_to_handle(), but stopping at the GEM object: a session the
+ * legacy shim created has no DRM file to install a handle in. The caller owns
+ * the returned reference.
+ *
+ * Return: The new GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_prime_import_dmabuf(struct drm_device *drm_dev,
+					       struct qda_session *session,
+					       struct dma_buf *dma_buf)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(drm_dev);
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	ret = qda_memory_manager_assign_device(qdev->iommu_mgr, session);
+	if (ret)
+		return ERR_PTR(ret);
+
+	guard(mutex)(&qdev->import_lock);
+
+	qdev->importing_session = session;
+	gem_obj = qda_gem_prime_import(drm_dev, dma_buf);
+	qdev->importing_session = NULL;
+
+	return gem_obj;
+}
+
 MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
index eb2d8cbc8cd3..c5e2f7ffa882 100644
--- a/drivers/accel/qda/qda_prime.h
+++ b/drivers/accel/qda/qda_prime.h
@@ -12,6 +12,7 @@
 
 struct dma_buf;
 struct dma_buf_attachment;
+struct qda_session;
 struct sg_table;
 
 struct drm_gem_object *qda_gem_prime_import_sg_table(struct drm_device *drm_dev,
@@ -21,5 +22,8 @@ struct drm_gem_object *qda_gem_prime_import(struct drm_device *drm_dev,
 					    struct dma_buf *dma_buf);
 int qda_prime_fd_to_handle(struct drm_device *drm_dev, struct drm_file *file_priv,
 			   int prime_fd, u32 *handle);
+struct drm_gem_object *qda_prime_import_dmabuf(struct drm_device *drm_dev,
+					       struct qda_session *session,
+					       struct dma_buf *dma_buf);
 
 #endif /* __QDA_PRIME_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 2c9d79937b10..14034e250555 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -50,6 +50,9 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
 
+	/* Take the legacy nodes away first, so nothing new opens during teardown */
+	qda_unregister_device(qdev);
+
 	/*
 	 * Unplug before clearing @rpdev: once there are ioctls that reach the
 	 * DSP, this is what stops a new one from starting and waits for the

-- 
2.34.1

