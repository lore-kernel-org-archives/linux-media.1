Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC946EF69
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474239; cv=none; b=Zx4XLH/oFXSO88/HxbhPEKlxaApETw8vPgE7yy5CuMW/5+xQgzRasXXVOV6YGOnLFITSiFVQqq+xi4hGV+0lVG1EihZoJ/Ups3uxSSHtjK0yyR3alFiG4N6d6XrhFA0gXrevFmcilo1EGSVZZYBbdSbsE5PG3YDoB5Z++mPI9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474239; c=relaxed/simple;
	bh=dhlrGVJ7D9Hj9A6FiXBLOrjstCSBxDQs1GtUiWJMBS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5xvPkgZlU1+47nMOjBxapea9hr/MjdYxxeQxqWdPaKFY0sCjmkf71jMUwFfdOS7cxK8nLTZaxWETXGlBxrMsUTEeXNuIVUxP+80gcbJs075LLzUvc08fPRaeCy4fPKZ6FdXAsSSs7FgZDhX+6Y/HW56BS47Wk8jtO6lW10Sbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOWoBGT3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOWoBGT3"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so35981975ad.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789474238; x=1790079038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARc4u49b6G5t0LuKLqwXD8cu3X9ELbFHgcHDb7cDF2U=;
        b=DOWoBGT3Xdze7NRdlHBOGu+/jqOc0krPoz7fA3s2cpv9rBCgaNuROGRD00SLUzFMgJ
         fMhnKXKYjPXyX7eCPB8sdkyy9AWlm0/Dekr3mpPAFgbWx69ga8eOFYyA9h0f2Rn7VmKo
         QR98P8gbKftzva//gbx7hOG1Tk/ffrk9tVYGq25R6vwxG6yjeTr4ebtv3TeezQBIp/EO
         RG2563XeLWA5ub7wzupEMaCE2eDVBWy2ri/hWALVvMOjwqqZTe6vMFYbHDdGftH7vAPl
         mNpRppvAGEl9AENaYJ7uvG9Zs3jRRHMIvuK+QgUbb06RDtTbdmgBxQwqfyF7I3pWrBFX
         gdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474238; x=1790079038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARc4u49b6G5t0LuKLqwXD8cu3X9ELbFHgcHDb7cDF2U=;
        b=zDvFrcM81V9biDFzyDJpuSsAugKEhno0ZB/OulLlXRlBAXiNJEd3iLs7kdMxCjTml2
         kF0b3SUEaIVjKizBm3WWUlUa+3X72Tp+7i0DMAUt+E+wmFJcgjdG9odTPkUGdPO47oJW
         thoYXSQJsgNvn89QXQ0ZyoaZPPDXHExWMxsqCQuzGE+9TfjiY2rUX38lw+pyx5Fld4Qn
         YMqb35phD0cp8IDOubLgqmoZmjvS5Q6GTxIoLULTekWwBOufYe1IMpFoBRnmMtpFtTRw
         jIQCfgAnYkLLINWv3ltVMCmNxEAbFn/ydwsYmtx6YF4A1t+BZznrmKKjzpfppb36zZnz
         yhaA==
X-Forwarded-Encrypted: i=1; AKwUvBzp52JxK1m27sQg4pNIhvzT5nJb6u4a7kC3FihfdSUb056C6/5BxDkiM9uKpdBA59NfisbfbT11qqn7cg==@vger.kernel.org
X-Gm-Message-State: AFuF++lZHHXc/0mj8P5Uh110NwQSk4elN57Jsx5laU78yv+ljxfEjjLX
	TGeC1QQIFuqJr6mvePQTl13Ug32ExH7itJnV23bIvgmwuzaHpGqSZbRa
X-Gm-Gg: AYBFou2I0QJ3ak5FgIDk17/iK5N5s5Pd793xW5fvp9HJOLljwXpFE+bfE/A2TO5lo+X
	9/H2FVOcIqmul+y7SqtadgKC9y5qy/qeaGLxX6fzireWHvr+LNq3e+fc5HxpdMF4ATkoxrWiJ9Q
	4ZJAh/FZhA6G0IHkdALMsz+coNsXlcUDbkXVaa2fLihejcSqVUmPBVU/rA8cFGMMkg4kWxMMUtV
	OEgu1KofDEvQmO1s8omu9A3ILhm/Yqy+Uw6JS7myaMvJ2p1mu/8KkXRxG6KtUsCRnY/r74hkbvM
	PAzmfF7J0MAcdxU7owfA2Fk3Fk13XwTH9WJMyUkNnbXXNLriDX0lYVD2waQ1VqBrs4zdii5/+gA
	inVK2U8VE9ktXBQxxkEO+r6JybC2qyUxmP8rNV35ta/sDi5gwyi7wqT04fXQx5DL7yX630cYsPk
	xUB5FzbMiDB1FlSAAjE47nWFvoJPhFMXxGiYtMZ0pGuyxrRz2MIZ8nPA==
X-Received: by 2002:a17:903:2c07:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2dd6c6e9b11mr142531885ad.11.1789474237753;
        Tue, 15 Sep 2026 05:10:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm66466685ad.55.2026.09.15.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:10:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vpu: release reserved memory on remove
Date: Tue, 15 Sep 2026 20:10:25 +0800
Message-ID: <20260915121025.2412446-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_vpu_probe() may assign a reserved memory region to the VPU device
with of_reserved_mem_device_init(). The probe failure path releases the
assignment with of_reserved_mem_device_release(), but the normal remove
path does not perform the corresponding cleanup.

As a result, removing the VPU driver after a successful probe can leave
the reserved memory assignment associated with the device after its
lifetime has ended.

Release the reserved memory assignment after freeing the VPU external
firmware memory, matching the cleanup performed by the probe failure
path.

This issue was found by manual code inspection.

Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..16b5bdc2f2c0 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -966,6 +966,7 @@ static void mtk_vpu_remove(struct platform_device *pdev)
 		destroy_workqueue(vpu->wdt.wq);
 	vpu_free_ext_mem(vpu, P_FW);
 	vpu_free_ext_mem(vpu, D_FW);
+	of_reserved_mem_device_release(&pdev->dev);
 	mutex_destroy(&vpu->vpu_mutex);
 	clk_unprepare(vpu->clk);
 }
-- 
2.43.0

