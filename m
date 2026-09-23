Received: from mail-dy2-f19.google.com (mail-dy2-f19.google.com [74.125.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB8283FDC
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206966; cv=none; b=O9tscl1HSzhW7JYlqBY2VgX/HlSwY1R/s6cC6Dpb8JrjXs1YYnh72ignYpWe6YFEp3yX/Xd3KRQLtPKiNjuzLN78YwKbfEdvTdO/jaVgLq7xzYDkgprVxAqvbDsiOAWD0FS/UXdE8ca5KAMDY0qelhNXL9+U/xok3hYe/OliVKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206966; c=relaxed/simple;
	bh=lzQSvJQXyJUSHZj0VmY6KW4purjQ6O7lMQKui0U2+bA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hapmjKmdMNDLlnp/FL3yk3vkOzl6KDqjQg31lEEYaH25myvF13VOdx1ZwSNP/00Ag8AMMSQR2PUoo75NQz6625//liT2gFv2QMpvJsIg0faOEaq2lntJPwPvpVHCQQFks1pCyQw5GSFaUX8Uj1QjFXW3sro1xRQnzulka9qBBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLTwbLbC; arc=none smtp.client-ip=74.125.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLTwbLbC"
Received: by mail-dy2-f19.google.com with SMTP id 5a478bee46e88-3286624d194so1037411eec.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206964; x=1790811764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvIt9N1agAOmkmensATC3Jkr52Z4pbhXqZihbGknxDM=;
        b=qLTwbLbCEayDO8kbGvHOdLRlQalsKcmCg3n8aqq31EdpQVuHBcNOzkUqw3lOWuXqRm
         XxfVSPge2Fu8xqBqHl6nWjHXxoqN6jCPVKgfblwMilQyVmNfs6s+cGw6PPkuAFJLuNXF
         hKZAGSOyc7oGKcK9OvBoSppbB1+c4KXu+5Mgv/i5QFxk0Nehs4/TPDiYs9apbCIN0HQM
         nifDrhfvhwuG41SFaT1upp7I/e019Uy0dy3ZsgUSMefauAxkmEJOiTzgFcV8TSdC6nMd
         z57+AYVb9nhqZ/Fa9oc2zxQG1UUT1JLbP4Iy1TaPM3Vpfigc5G6DRv4i9vaXa2SRdrS/
         2PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206964; x=1790811764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvIt9N1agAOmkmensATC3Jkr52Z4pbhXqZihbGknxDM=;
        b=ZbXb8gFbB6AGbgYz3D9BJzHHbTlJjR/qk8a9StBW+nUydmW/74hJTz6BmzayWS7GNr
         XAc/nGkgOUzS6haYlwW02Wo4kyIFtEBug2n360CR8qT+wRVW52n+KVv/DMRaobnOaVwh
         9xEd4cLQQDJV6yD+Af+VsX4phlEO7oDrz4uoFDc69xkCMxpNdLN/ek+vPLiMc64ngUp1
         PGNABmTG19wRF2seiaIgWU6UXj6sIMI9O5DQJfa21e+PxoTa7N0T7t3pLS2F+IsVdU61
         ISph1I5MkkhINiOkKxxJkF0IK/yomH/LowH3B38DDa/6hefcax6RKI5lM6KsTwRbN4Kd
         rN0Q==
X-Gm-Message-State: AFuF++kedIkVDpMvysyUDMx+s+H0MFeBDCP09a488DvNKYncpx5XnriF
	2kO2T111nOy62fC1RleMQ6laIEheIVjCfO/BQuwICnIziQUE8JtCOe1chRn12iS+
X-Gm-Gg: AYBFou2ozzMRnIlTIjRUE4RBK6tVyLy/g4ZRB5wZZIXYk0WLWk4sb45snaJPDGM/9ab
	rAcnAwRD9F92AVZOkHup3n3VVh8gyI+RZ02C6jOoJ5+l1OWcgK7DLd82kdvNgL2q4NXoaeiMRbE
	3C6N0jVzqsM5QuU2Ar3Lj3jxiCai1ehVV6uOiw5v4jDkoL4sjd61hS0k2FVENOHrA1xfixzyqML
	PSRQo3PVOcBN7iDpFlIvqChuz3ijBF14nUIu4oq6CoGs1o0zyeITyOAi415N7DbwjLnaLVs8WW2
	2B+UcUwR9iZQAK33rvhgGmQLccbAuONGWvFv57pGhXSDZrlPxrSyTImz2WR70V2iKwBwIAKo/BC
	aGwtBOqQu0id32q87pdtkTFb/ra+DwlN3vqqBZFSzOPcVUyyoeQAoqNNlklx6fN88a8aK3JrFTG
	mkHtA8K41J260UpunDUSNSlsygiDINXudb+21SmhgcFtMuTecOz7oZF9vWRaTFd6yL9n6ZtYkIk
	TYZwbZv7af3tebHfIvE882VqgYaNfZ46/5j
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr458187eec.7.1790206963865;
        Wed, 23 Sep 2026 16:42:43 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm9088502eec.0.2026.09.23.16.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:42 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH 0/2] media: ipu6: Stop calling ISR hooks of unloaded drivers
Date: Wed, 23 Sep 2026 20:42:22 -0300
Message-ID: <20260923234224.325504-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buttress interrupt handler calls the isys and psys ISRs through
adev->auxdrv_data. The isys and psys drivers set it at probe, and
nothing clears it when they go away. Two paths lead from that to calls
into an unloaded module:

 - Patch 1: after "rmmod intel_ipu6_isys", "rmmod intel_ipu6" can oops
   in ipu6_buttress_isr() when free_irq() runs the handler (shared IRQ,
   CONFIG_DEBUG_SHIRQ) with an interrupt status bit pending. It clears
   the isys hooks on remove and on the probe error path.

 - Patch 2: the buttress ISR calls both ISRs before checking whose
   interrupt it is. After the out-of-tree psys driver is unloaded, every
   isys interrupt goes through the stale psys hooks. A user reported a
   hard lockup with no trace on the first stream after
   "rmmod intel-ipu6-psys" [1]. It checks the status bit first.

To test both, backported to v7.2.6 on a Samsung Galaxy Book3 Ultra
(Raptor Lake, IPU6EP), I added a module notifier that records a hook
left pointing into a module going away, plus an ISR check that skips
such a hook and logs it instead of calling it:

 - rmmod intel_ipu6_psys, then 60 frames: at least ten calls through the
   stale psys hook without patch 2, none with it, all frames captured.
 - rmmod intel_ipu6_isys: the isys hook still pointed into the module
   without patch 1, and was NULL with it.

The psys driver in intel/ipu6-drivers has the same missing cleanup in
its remove path. Patch 2 keeps isys interrupts away from it, but that
driver should clear its own hooks too.

[1] https://lore.kernel.org/linux-media/20260922063507.690-1-tmorolias@gmail.com/

Felipe Calliari (2):
  media: ipu6: Clear the isys ISR hooks when the isys driver goes away
  media: ipu6: Only call the isys and psys ISRs for their own interrupts

 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 19 +++++++++++-----
 drivers/media/pci/intel/ipu6/ipu6-isys.c     | 23 +++++++++++++++++---
 2 files changed, 33 insertions(+), 9 deletions(-)


base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
-- 
2.55.0

