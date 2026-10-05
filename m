Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E13370D7B
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 06:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182810; cv=none; b=JJmmmsCVrLcR8khm4aZt30M2J+QuT68wgo2TRlHA3VUOgwT+2hhwIYsB1qvERcJzhbHiTYNDDrUmsYqJ/r4F5/cTNbE8HenrLk7jb5rQ0COSFuoZ4xJSKaSENVPv+RW5beXcOlRaMhMTBEtNxensVL5ENEcoYfu0r/gaEP1XKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182810; c=relaxed/simple;
	bh=5YTMgbdtfas9/Wgp0DfTQJZ86ha0EZMTqQX5JKE1wjs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XbId6Jt7EpxYHVEMPkRghhabu6l92rIaLbgEGAoj91XcXN5NVIGR23ZdRMRoxF7vgcZvdcXey8fFR/DDi8q/bHZxCYvRQGXChMiVDHPUGmkk4fm5vj39n1l7OcPNpSxKDAlpNE/ADbCc3/glHg2QJh3yLZo9uTm60OFPqoOIvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kw7zT7CK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kw7zT7CK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso7860515e9.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 23:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182807; x=1791787607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDPEzA003wpyS4AK6a7pECjHcKEnmKef8YGoalZCMc8=;
        b=kw7zT7CKbKYytUUSLAfAUecE90cucLyPRbnpJtErosiX3D+BZ3zkZW70yTbll7sRiZ
         ULuVH8YCcURqqCqUw5WyQa3DHhUDhFu/86dLrWHd7a5pKfv/4CSApLd2oVNHYaXncvJP
         U4GsKvm74RFbq2TseyZ5bY1SdRo+/PvpEso72k0l8lrxN+PTE/86GOpsk3q/qWeaNGJa
         hRWTgyeCTLnu7UbQgLkOWQadedP1e4iltW4BhQhoXzq/RnOkL4sBX1gdBsDELyRMrmBO
         4BFjdMxM+9FW4mCAbuMOPL5UpIWUXaIWtTpX6vPvi+v4VglgkJNREtENTVn4cE0UnkQX
         7Rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182807; x=1791787607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDPEzA003wpyS4AK6a7pECjHcKEnmKef8YGoalZCMc8=;
        b=B8R7IwGMv9TwYj2Uo6bLZgDbABB09oJ8hGffM60GPfyC2/24KYPrhXMEY650lMYwYu
         WCtBmpis9yOJf4Zvi+oH16lCIclNC5N2sYybbUwFj8zk86X0km6UZgptQ1NiaZvOBbV9
         0RmFI5E8NQCNJxJKj9LkeltL/rIoekcQlCKadjFetHLvpEC4KWvDBpt4fqR6NRvQ9tk+
         iSlPhJeHqj6f7YEXoNp5kC3b8vER6fQSr7i6RSZqlAbsfaZyz858L4qWrNYvnMikQEFH
         fd5HevWBKHo1sGdXKAj+h2L852QTpMlDW44YArpfj5IfxlOOdeqechYV/dLCQJmptpUK
         IJqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf+WCVBvDa2Lr0QAmZ8hZyykAxmXt8acLWqfxGZQU6d34zMx8HS7ALO1+UWE87+lQH3hw5IqnNrmto7A==@vger.kernel.org
X-Gm-Message-State: AFuF++kpRulhFza4L+KMGAdFuI9TBa4xqrPoHzXqJPQFRJh1vDyINV2Q
	TUrhRVycbh9aRPNTUTBIm9imo8963cIWOCiyUcWoVF9ELtKRhnGM0BZF
X-Gm-Gg: AYBFou0MbX2W6S1+Z76OLdddFQSErM91sUtsL1F8SYs8ZtJHrZxhoxgr5EVecMgnPE7
	D7TMscLS7rhXhnmgIstxAjQTUCdFkitS4KgbbD/6oFD6Z2vp9+1yBkKyxLwkyJTtQ2OCoFzFWRH
	XIL4QyPtLZJkTYQXagMIwjIdSE8ZdbAi0WubXDs+AjJoWQRmtoUWCV+HnBCIbvKZJeEjCB5a13x
	oIZYmHzHcDAl6UzdIRVwXdBMOWj7paNVEDBQzbEKe0jd1brcqgvgHjwIJUnJr+DzNyRcBC6lcNH
	RHx4/qDYlHtBFpl+ZPslSNTFPpBB52iZmtwKjbjmjBTcnFr5Ntpw2rQFlpsbxiC47WCyH2psPbH
	TZA2wx7wNyHWXe0ayXcl5Wmyq6WCLKi8FncsMGxJWdjuylffHWqX/0J9FD1E0jh2AEjFJgLuqGi
	g8Mob7/vTH1bYkEsFGwB/mzvR/mvKqK8k+o85q1VaQfp6vg/mmoPGJ/Tcn4yiE93yf+tUL6Hq9w
	7bZ6MQarSI6NW3fHcBM6c4GLQJgMn34tMoIbiY8ODntTonauXYt2LXoRjbXpQcHyqCTvHNFv3JN
	cFCJ4fXMUnlcSPb/14Nify9VLEOX8h6QD+a4Mw/BbgLjDj5R41fi/kA7V1UmOquDB3FRJTol6Gi
	Q4LdGmpspIwyU
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a1680e9466mr94460155e9.10.1791182806529;
        Sun, 04 Oct 2026 23:46:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm315273615e9.14.2026.10.04.23.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:46:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dma-buf: heaps: cma: respect the importer's maximum segment size
Date: Mon,  5 Oct 2026 08:46:37 +0200
Message-Id: <20261005064640.7776-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CMA heap builds attachment scatterlists without considering the
importing device's maximum DMA segment size. When an entry exceeds
that limit, DMA_API_DEBUG reports "mapping sg segment longer than
device claims to support". Patch 3 uses the importer's limit. A
corresponding udmabuf fix was posted in [1].

With patch 3, an importer that keeps the 64 KiB default gets a larger
buffer in several entries. Two in-tree importers require a single
entry and never set a limit: tegra-vde without an IOMMU domain, and
armada. Patches 1 and 2 set an unlimited segment size there. I found
them by searching the importers for checks on the number of entries
and on the length of the first entry. etnaviv has a fast path for
single-entry buffers but already declares a 2 GiB limit.

Patches 1 and 2 are valid on their own and can go through their own
trees. Patch 3 should only be applied after them, and is marked
stable+noautosel for that reason.

Tested in QEMU only, not on real hardware: patch 3 on a custom model
of the SAM9X75 Curiosity, and all three patches on xilinx-zynq-a9
with tegra-vde and armada probing from stub device tree nodes. The
notes of each patch have the details.

[1] https://lore.kernel.org/r/20260929054835.94118-1-kmehltretter@gmail.com/

Karl Mehltretter (3):
  media: tegra-vde: set an unlimited DMA segment size
  drm/armada: set an unlimited DMA segment size
  dma-buf: heaps: cma: respect the device's maximum segment size

 drivers/dma-buf/heaps/cma_heap.c              | 14 ++++++++++----
 drivers/gpu/drm/armada/armada_drv.c           |  3 +++
 drivers/media/platform/nvidia/tegra-vde/vde.c |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.53.0

