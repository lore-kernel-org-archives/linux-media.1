Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C70306768
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537899; cv=none; b=iUXihkGcSsK0zPIzsLKP143horqfJhYBMLmnIvEWBA4qM0GW+2uKRVorQlgiMK30uujbXD0rIr+qy94l2gyP85kTUtSlinRRJBjmte7Mr4veozFV0904Vrc4OXnyPVW2q7BYfGROLi6sAJNz5CV3rJq64CHbypiF1lCQ2CpOITY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537899; c=relaxed/simple;
	bh=1V40n5G7B6GKH+0Mur5egdMJTjHkmhTfStILr52M9Ic=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SasBKnWayMB3TL65a/bdQF8EqDLPP7TDx+gMrsf/J6AEpU3uwhVMXRhXs9ACU9ZbY/J89Qj5qvBcYaw6IYxqiaZ5LZqCRO0dG54k9EeLTDM6pzsUxOSajgjztBzVYWhiGEKa9M2RAXnDLBgB33Edwjjk9YtT/TqpSa5CZGX9KBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXrDCoAT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXrDCoAT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8485b358552so10596090b3a.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537897; x=1785142697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=;
        b=VXrDCoAT/0/mXYxCC6uCsBTQwnKQP+z98nc2R9z/PE/WsYbu99bOSA1sUEstICPef+
         aPg6rU7QQd4WePimFI7pZSfsrPTYI8dQgSw5bfFkXt0M1Is3cW7SDrDRS7JCW9SvMGfh
         5nrEX+0kEvZjjGrd3XPEBcshoet40qTxFzIBIeOIV7DOMMWlD5AaBzvz+TPcms6XgiQU
         CEkEgW1Fm0Mb4Sp7IJ7p7++Ox8BwYuOOdZJ295ZlcVWGWTtUSjaaOf3a7Locz6Ss7awR
         ptbWTjCv+msihg6vM4Ycsf+FeHRwVc3dy8hx/piGzDcvtBc+rTHNEGuRtYdjSmWos+Y0
         crgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537897; x=1785142697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VFpLun3aTRlN5AWiLiGZ73OhLT8cMhNwsTldXssx/wk=;
        b=nuQUiG/lfIHJ0H0HWKLPfEPpK80LDtXUCwgSniFgzvb6/rHI5kQ1KNmG1jBjU2vqoi
         Zz7TefDkGYhS/zrBFB1Nw0V1DGOpJHX9+wld3zhuDtgpbjVataCzSMY+OtN0FFjqth81
         VYz0B1AM2SXhnkq6P4eSnW7kxu5J1O9Or1b8Me93MQFIu4DX9MoZCmxYxMv2OrSLhv+3
         FFm755VdmZRbQKCPIilMBmjYrDckuHAVixgsM28cN1CsS5hgEjMbZ9N1QGX4erq+z8X+
         GV2Lb3/ROuRjlIaeZeicianyLK0X4xJajEdgB5w1NfjgMSWxNQg9Ho1eXaSPNkd80NM6
         wWDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpj4QtiZcvWiMfixlNZwyugLBBaPebk5bFIu64bILBPq9rK7KqIA//CmrCHwXhmUKDvMwmf5oZJ7acrYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFsFGSyiV1wv5gklkxbaxt7Ls72fQ/5cV6BNMO6xRilIO8kY0E
	awgJpEEnCvn0FtyJegeUarE7heO4OLya4uNrJN87IH1AyuhYr3616xiU
X-Gm-Gg: AfdE7clH81PX4SBFOlPsJa20BQlfAL1z+gZdF55I+ztuqMpyyIXwEh9zXf7D7zUc8LN
	IaSvDU2LiIPndrUOyBLlIlIaV24Gzb+aPCOK621DyjQNPQQs+LafweloVrQFEmdFHSzarl7na9x
	p41kQJfEI/ZIT5L/wO7j5ZQNC2Rp7lPj3jKgoKLivoehydRXfG1wTLzSu0yyZYXyinCc0tJKRpN
	OwJx/JsCP5SABNAVhKSBAtSf+Yte8G/R68LAq5k22bv5OljPL2uZEAuAi5zsDn6d58/b60jHTvz
	GiWi2yGPgqMgiR8EfirNMucJPU2wsBF1eGPNzD6SpEtARUuEtg1JJpNsHojUp1XrqTFejoJrXN4
	nYs0V6KdB2+RKn7WniprnBX2bD3z+YPVVa4Z/cs2+QYhtmXxtL8DclSuOOQQfRpoyHNs=
X-Received: by 2002:a05:6a00:a96:b0:848:64fc:510d with SMTP id d2e1a72fcca58-84c294892d9mr12402258b3a.45.1784537897395;
        Mon, 20 Jul 2026 01:58:17 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:16 -0700 (PDT)
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
Subject: [PATCH v2 0/3] media: mediatek: unregister VPU watchdog handlers
Date: Mon, 20 Jul 2026 16:57:53 +0800
Message-ID: <20260720085756.465667-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mediatek vcodec and MDP drivers register watchdog reset handlers
with the VPU driver and pass driver-owned objects as private data.

These handlers can remain registered after an initialization failure or
device removal. A later VPU watchdog reset can therefore invoke a
handler with stale private data and potentially dereference freed
memory.

This series adds a common helper for unregistering VPU watchdog
handlers, then uses it in the vcodec and MDP cleanup paths before their
VPU device references are released.

The series is organized as follows:

1. Add vpu_wdt_unreg_handler() to the VPU driver.
2. Unregister the vcodec watchdog handler during initialization
   failure and firmware release.
3. Unregister the MDP watchdog handler during probe failure and
   device removal.

v2:

  - Split the changes into three patches as requested by Nicolas.
  - Fix the extra blank line reported by checkpatch.
  - Carry Nicolas' Reviewed-by tag on the MDP patch.

Guangshuo Li (3):
media: mediatek: vpu: add watchdog handler unregister helper
media: mediatek: vcodec: unregister VPU watchdog handler
media: mtk-mdp: unregister VPU watchdog handler

drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |  2 ++
.../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c     |  6 ++++++
drivers/media/platform/mediatek/vpu/mtk_vpu.c      | 14 ++++++++++++++
drivers/media/platform/mediatek/vpu/mtk_vpu.h      |  2 ++
4 files changed, 24 insertions(+)

--
2.43.0
