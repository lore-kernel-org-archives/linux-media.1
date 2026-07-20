Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80E306768
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537916; cv=none; b=MMDnJYWDouKM9Y9r4fyrPMBkLuKVGqb7VeijH8iRBjQxE0Tmgg1UNhA4KQeN9H1Srep0zfIUCcCkjMfIEFUkbO9Dq2M9M375iAIEKvYIYYuacyWC6KOcVUw2X7j3IN1JIALhkmpQsEMor3qnnYxn0pqK3rnuxs/c46jpQen38fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537916; c=relaxed/simple;
	bh=fvlAbSacer15HDU3morDcCk441WF9liOY8rynCb+b9E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTh2SsJfaJ5EArRUsqGykCzqMwMkd9YncAEGIwiHWvOsqs26eMgof3yfEKiltR0rxfmKu1JUwJNLN3FXh6AR66tAo9ncL+OHO7yVSGU1dd0WnNskfh+5ozPOK6sudYTwW+Xlhhqb+lue1NajyKwi/+rYRXhGeST+edWa1srZ4/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMrlo1fa; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMrlo1fa"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8487214ad2bso8674179b3a.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537914; x=1785142714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/5WnsBAYG56YcYpIFG68fmgIsTfeIiu5tlkG2mA3FEU=;
        b=SMrlo1faJi394gju1xAxEy/q65unszTYqJE25dK3ZOwUtk08v+NuTTFb46Icbk97uh
         n6MdPYv+LOAa/cYdBLqTFYaTezRPCbhhxmtzB1qg77i3MuJXbgfHOv3N4AkuaaWKN41k
         54pjWFMlMMSWiKIjiYlZIYY8fagMrOgMSeiQKN+hFdJnMPibV8OpWdHTmGVxJ9WlmziK
         b5EDXa2aprZBFj0miNT43aL7yV3ANSS10Bu9K9LhVOmpmvnBlGrqaU+4kLKMO6paq/gV
         0Py+kNXdUkM4jjnXBqlpwq2yDFgjlr4m5iAi/ql4CJ0cyoKIFnn0eua7VnhkaGK9VMsA
         62gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537914; x=1785142714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/5WnsBAYG56YcYpIFG68fmgIsTfeIiu5tlkG2mA3FEU=;
        b=WwRwQWvAjsvpSFNT94kIkR/1gthf/lu/vBQCQGKqq4ZmBn++C7byYQer3lui1f8kCq
         0cD82Qx/2irYswe8mpziVPcESxhMOvWdBdBYY4CXbLtSVgrjfYp15LUB99i2rFUy2f3h
         1/DS5SzkNellHoz4OsFgi1sT6v1mTQRPvQwdogP0W/94kI6aqqIfWdIpuexEYwz9zJb1
         l8/uEGxO+Vs5soQGjxWU8fQoh3/93qlnboioCLt/uLNwDPb6KgD3F8ZmEYaIYonycpi+
         zhw5Un5Kfvx4zAcq1cgNysChDFsBeWAccWafL1iUapk8kTyYQuMf5B6RMr1HZ3TN9iUL
         QxaA==
X-Forwarded-Encrypted: i=1; AHgh+RoLTvOXw8hvVYak1h+L4Ajm/ZoG4s4If6o/D2KxvPCsb9GF4/qCmFkwtVAAzdrdOVtCvsyxHEL20vqZQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrV1tIoKLuROA89tpHosExfqmeJ+dNWcu0Kq2Iz2RTQktH0Cyu
	qbUKp+T/C0sHk0ToUXreyqkhxFbbs4K2YrAwrIG+VmD0byyYc54ZrYkc
X-Gm-Gg: AfdE7clN3IziQB2pXxbYGb+55P7Pe6LAW0LXz9BISGJuVL0PhtZnUHDcYRVOeLQIzu2
	KthUd/0SwzW4ZO1CziaZ/EgNUdrsf6avbRsTfrMxqb1PPHK63UVRYtuT2fK+QVy+bU1wRYQP+24
	HiBoDAZEOq1GqKpdEqB7iw5Ls8DVrm/IYaZylDcQ1lN5j24NXwc9kARqiK50yq7XPpsh6lIWgof
	mgqfcBvsUhM6a3pUTeYqjRSJvG0We1B8LD9m43zG4QAbAiQV348sQza1OJr3mpjZxgDkSQc59FC
	KOUpMhRNS4UzYQgAdGmpva4+C2HK6WE7xQSppbdcrSf6bI6gdfCCEQ+Qggl3W+K6Cc64Nmy2mWG
	CN3H1Y9BzqllvpOjjIT2xOQbGIqNWLIl7Wk4B+TMnHS2kw+fB8fa2BkUfns/kALAfjUp7H2ziQh
	Cgfw==
X-Received: by 2002:a05:6a00:288d:b0:845:d650:b75f with SMTP id d2e1a72fcca58-84c29270e93mr13637631b3a.8.1784537914434;
        Mon, 20 Jul 2026 01:58:34 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] media: mediatek: vcodec: unregister VPU watchdog handler
Date: Mon, 20 Jul 2026 16:57:55 +0800
Message-ID: <20260720085756.465667-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720085756.465667-1-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_vcodec_fw_vpu_init() registers a VPU watchdog reset handler and
passes the vcodec device as the private data.

The handler is stored in the VPU device and can outlive the vcodec
device. If firmware initialization fails after the handler has been
registered, or if the firmware object is later released, the watchdog
table can retain a pointer to a vcodec device that is about to be
released. A later watchdog reset can then call the reset handler with a
stale pointer and dereference freed memory while walking the vcodec
context list.

Unregister the watchdog handler in the firmware initialization failure
path and in the firmware release path before dropping the VPU device
reference.

Fixes: 01abf5fbb081 ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f78f5..ee50a794077f 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -40,6 +40,11 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 
 static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
 {
+	enum rst_id rst_id;
+
+	rst_id = fw->fw_use == ENCODER ? VPU_RST_ENC : VPU_RST_DEC;
+	vpu_wdt_unreg_handler(fw->pdev, rst_id);
+
 	put_device(&fw->pdev->dev);
 }
 
@@ -120,6 +125,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw) {
+		vpu_wdt_unreg_handler(fw_pdev, rst_id);
 		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.43.0

