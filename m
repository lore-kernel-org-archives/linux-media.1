Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFAE3AFD06
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537906; cv=none; b=SoOnqwISLkB7SUy2pOXrtPsr/vLWP4vZDE+ParDv2US57Eb2XCU+i/URDBa+V8CLHivvA0Wm34+7AKw/y3LJnjp9/OSoeivczUIZYaW/xJ5M+jKaXlKIsZgKp0853xhW2X3nh8Q7E/923fsZyo2B63pQJlC9B+YGJ/5XFISnO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537906; c=relaxed/simple;
	bh=wZvAUft1XsQt11zE5PHfmNpfM2ivDTKtZI7A5DfH1jI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOX7uFw+pmkn1ia37Q04tAzUVsFd5vvgzw4I9FJqTxm54dqSemohbWF+BRK76hNXKMYxu8bm2twIJaWgWiK1FES6zKDcfjMxeK1tRruUFpnsvHSTCZPxazvVYsTHS3Xu5TFUd/iqllSofnXz9SyLhoPu8tbuZv+xKsI0YmWfmKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IB4U2fSz; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IB4U2fSz"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so11445053b3a.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537904; x=1785142704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=;
        b=IB4U2fSzXKC/Qq/EpUcPNCZTswB4pbFIq+9JXzcEF5wyhQ2RSSMJPWM+jYYl0cM7kH
         ohgYm8JcT3dEDjW2mkpLMzijyTjtpmscQBYpcI7tx/s2EIqJ6fr0UW2agsHDF1y29Pqk
         Dk7MMyEB4not78Hdi7UL0TVgSDmnLi2xHgoI0svhtSU0TaItqzZqmHVKEPjIRkdpAULq
         HQFFnTkIJ1qaSFy5Bc/iii9NqolbLS7KbgORD/qPQOJZgKGpYzcC7Zr85tuXl48fnzL0
         IFn6bm7esHMv2l5kIWLPtFi/TSXSwHXNgGxEMx36Zyu/XubjNjE4xTpKgUKj5kH1YrY2
         kxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537904; x=1785142704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cOfUy+CQo+u3Sm5zMP7PbJnZMmWfXxmWUpfU0u6aASk=;
        b=oXcbOjQC7JRLy7sTDhjzbregJWYPHAwFZ8hsY/fj+6jcs7kyY22DjDRIyrA5t6/OA+
         bxa47eDh7WgASZZUaNVbZ3QwloGYiU1cY6dGrEe0dUPqlvtSpTQbrB7PWc1phngCN1Eb
         UlbcdJhW5t3iIbswrkoARwnt8X8/Ml10SsrLzsVsoqusO+k4MytbAbn1y14MU4XNP6DU
         qYT2h7Vi+9XZia7WGIa+xbVVrEYphL4LPZIkRO9mjplj3VzF6FjFAUSRWtb63tybz4Ba
         M4lCIIHFzbEP81x54ZTTXk4JpnBcRYDIyZQIS310L8z6gtEx8wH3JOgWrBIFhUax4koT
         3flg==
X-Forwarded-Encrypted: i=1; AHgh+RrFhawIme3yxEPBcH/MJruygpBcnhmYCbUtjfcp4Xe/SJzFe98DG/zKuCkyGGQUWZR/f71QRoYpQg795Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yywr5BTQ7wvr7sfrE+ATNziD3x1tcpbTKuGsDGtcUm4VJPKnLuG
	AAjBOGyd0/w2Dl9tsLPWY3gHOvt/I1UmaWJ1vtfd6fw8sowOmKDhGh/U
X-Gm-Gg: AfdE7ckfWHacDebzO/jYPzpW2RhgEDsNhFBBoIEU2hLpAKG+8EJRlFwsPaWSVjIkrCH
	yv32SGeSS4fHPRipSj7RwKhibZ8Cn9aoIalgOlEfeNN/ep3dqZOiL/nZIN1xft2N1hnJ93OqzjR
	j2SlTaD4+34seQISevJ0KcTEANLfsZ1xMDcpTzj9kmY6XX67Q8NRXcsio6w63Dcs4DWPXIYCm1T
	1xVM6mHtHsOJEVKMNWPxpZPbmcgvfv+iZPRBJPNhtuMdmuuytdCbLtGwOHA9tZiDmIZ/hluP3eH
	edt1W+cLPwUezifyVs6CXXuMPCtKuNJeUg4ZdrtBxSUgGyesLZJyS4xME5lvsCukbbK0H9S5O9w
	8JdYSniyDpOxbhkNik9G1vD3RNRrECG5VYrky7yWzcmqgjAmIhAAGKnOIlFBF5QvuWCI=
X-Received: by 2002:a05:6a00:1888:b0:845:e740:8ba6 with SMTP id d2e1a72fcca58-84c294d43e9mr13050873b3a.43.1784537904420;
        Mon, 20 Jul 2026 01:58:24 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:23 -0700 (PDT)
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
Subject: [PATCH v2 1/3] media: mediatek: vpu: add watchdog handler unregister helper
Date: Mon, 20 Jul 2026 16:57:54 +0800
Message-ID: <20260720085756.465667-2-lgs201920130244@gmail.com>
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

VPU clients register watchdog reset handlers with private data owned by
the client device. The VPU driver currently provides no way to clear a
handler when client initialization fails or when the client device is
removed.

Add vpu_wdt_unreg_handler() to clear the reset callback and its private
data while holding the VPU mutex. This allows clients to remove stale
watchdog entries before releasing their device references.

Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 14 ++++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..a2b937095248 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -437,6 +437,20 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
+{
+	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
+
+	if (!vpu || id >= VPU_RST_MAX)
+		return;
+
+	mutex_lock(&vpu->vpu_mutex);
+	vpu->wdt.handler[id].reset_func = NULL;
+	vpu->wdt.handler[id].priv = NULL;
+	mutex_unlock(&vpu->vpu_mutex);
+}
+EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
+
 unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..2ccb481a04cf 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
 			void vpu_wdt_reset_func(void *priv),
 			void *priv, enum rst_id id);
 
+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id);
+
 /**
  * vpu_get_vdec_hw_capa - get video decoder hardware capability
  *
-- 
2.43.0

