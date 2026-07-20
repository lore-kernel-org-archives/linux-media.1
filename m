Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D93D170C
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537924; cv=none; b=GcnX9DbC7VVzbOHrBTzre2px1L5zXUW5tCO3D+XOyNYYcxynLE6GYJxEJq8XGTL0uxNih2HFzEQaw4WNTHW+lO0hr3YUJ7pdF+4z1xLj1HWRDhi7nqIHtH1VZtpzDLCEM8eDdwdiFf/Tlcpluy10UsP+sX2SgvP+lJBM5UPwOW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537924; c=relaxed/simple;
	bh=C8AEiXCDpVJ4T6CZGEvCJ5xIZmzvMLOejU2iVUFF5Q8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRN4Kgl5nmL85nVqMmXRHGgUJz1v3NXSfpUBah068EFpeTZW3H+Cxls3955Zx+EeNL0imoCPDisjI3PjAjBA53YrNogDhB7tNTXyF5f0F+EPnfBB2QNGRhUv/b0H6Bnqsr2O9NIxQtKTh2jKo5MryYhkj496StFsEZT7MYG4QvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAnXrMwv; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAnXrMwv"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso6309209b3a.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537922; x=1785142722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUKJxr+1tIy/FI363caVVmoJTRInNyqm1ZI8xlDvLAU=;
        b=pAnXrMwvYNZnVS/gYwMEkN4JN4U6GCMvdq++9saFFB7EEHlTHaS1lZJQJIJed4MAgp
         fNKH7SZpIWOIl8pm5i9KiOqVZRpqXwd1VO+OfNryGgW8El1SX2yZ0Lwkf9mRQVbYrEWf
         tAHYguZOTDlDyhPXWHGyibqmegZfq+GzN/Pr1mdWimij2byGwurkL3CtEebZWciShloW
         XohFTj3m9mc4xawdajamnr9tf92u2ggKGWdRxiCtXDvplu/M8pKLqGqTKjwcyThOh6/v
         z18Vmh2rr/7fiq3IQ+Anld+hatwNL1bVBKUMjmMVpdsuNUsGaOXNmltIo9V74/nDOekq
         Uf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537922; x=1785142722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUKJxr+1tIy/FI363caVVmoJTRInNyqm1ZI8xlDvLAU=;
        b=MY4TUPHuvZQiydPUqb+TCR6o5++ZM9qi+37bNSeFtyzigEkNXFjzf/2301c5VF1/tH
         PoTY2VPL+RabYQmb9szX5ezdyUI+rGExmdeXvrZhUOUQtJ0wXuhNv363nZ79xA7zJuxZ
         HU6XufWI/JtcpgtHCaGquntc8rcsZB6NlVSm5cP0FkDU7MR2m9RpSzN6Qx48CAFXO37j
         Pfr9H7pKoepkUnUfWh/Uw6fOM5cBrWYNPe8JhW+INwlsNAiESRQ7xZDhYgJCKFIGsMAR
         sOKJO6RlE6JHPI4L5WaVTitLp3lfVJG7PBHJsikhbcm6cIKxfJZoR+0zdUokfKAsEvRR
         J8vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqesKx0o2rxYFib2ruv6yv4gQvN5SR3w1GGC1uhEq37+cR2tuQnvbbggmV4y9eGEX0A7Un+GRXGYTrxRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhO2H/A/0Cf8UJWKE4TYctrBHQ2FtezD15zoOmu4G3K5n2+kX
	BujIt/ITshe9jZMM9KEGzjicGiD7Ep1/zXRLA3Mf7fG3tkb8NeLRcerx
X-Gm-Gg: AfdE7ck5FABlWIT2NXDcKvkRt0b9LQNHvp3LFjoo8SA3Cz0oK/PAED0lpKhbRrLXLrV
	aLHtZOI3cu3AUqz/hhJGf3Vryxhc71CwOUsZIn9cozsIQ6nsigDUypbswJsV+Njt6ga05BgHS3C
	5Chj+HWgAJw8INBxYtwl24zgjVpfbGYYVEarGc9Ucqn82EKluTwhlQijE1EnuWcJOth9UBV19sa
	cVOsUfVaDWAzCB8084yKbFDXQh49afMMu+M70Tog8xdLNXJdztQ7apBrgIXOEWwDPUder/xR5nN
	TJjegZUWU0O9v6tMQf29iZnIyGplAmhb4Z6GtXZU31eN07/SIxn7ydE1NVQiWDEQBmuaLhhclnK
	aB89hkv46d3pFj52qULxJGbGhTx7LdlqRnYqV14zTa4rQA7coPWZFRU3CXw4yzwDnzD0=
X-Received: by 2002:a05:6a00:14d1:b0:848:6c37:cd74 with SMTP id d2e1a72fcca58-84c29288282mr13097826b3a.22.1784537922386;
        Mon, 20 Jul 2026 01:58:42 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:41 -0700 (PDT)
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
Subject: [PATCH v2 3/3] media: mtk-mdp: unregister VPU watchdog handler
Date: Mon, 20 Jul 2026 16:57:56 +0800
Message-ID: <20260720085756.465667-4-lgs201920130244@gmail.com>
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

mtk_mdp_probe() registers the MDP reset handler with the VPU watchdog
code and passes the MDP device as the private data.

The handler is stored in the VPU device and can outlive the MDP probe or
remove path. If probe fails after the handler has been registered, or if
the MDP device is removed, the watchdog table can retain a pointer to an
MDP object that is about to be released. A later VPU watchdog reset can
then call mtk_mdp_reset_handler() with a stale pointer and dereference
freed memory while queuing the MDP watchdog work.

Unregister the watchdog handler in the probe error path and in the
remove path before dropping the VPU device reference.

Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 8432833814f3..5ccb7aa925d9 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -221,6 +221,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	return 0;
 
 err_reg_handler:
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 
 err_vpu_get_dev:
@@ -254,6 +255,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
 	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
-- 
2.43.0

