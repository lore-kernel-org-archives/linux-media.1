Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C648822C
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053402; cv=none; b=Zi3hVmzUBnpBE1m2LbPyIS+ToDUTnLmvTD21t8YX/+zIzlxf3RHOVmU6gXhkom/7VAa9Hfqv5mOrvZfxMoqJVKR7NoDSWh91ZeRVnOIWjiDyvP3gPd/4dFhPwS+2ftALmk2Bk8OhlpiqCMpGDU2zg5PAXhhPKTv7BcFA8yZ4Ysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053402; c=relaxed/simple;
	bh=rQRacz5lb3GSBMv12F+Cy9fZi1P8KakT2Zgv0K0Uumo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C8ECBGcEiNzmvyoUSxuP3Fuvzq8BjsAQdWgjIfXbJRhFKKcxKhI2HawwY4KrcKipi7NL77mFLyPsv4+a+KEWMY3kH9gV3xz8AJ8+OL3RzaI9jgoQ1LQRTo8vUAdqryzS4hlTJPhN+riB4yyjEIOmXx/UML/jqp38D8BoivX6Y4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMontasP; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMontasP"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9178510f3bdso65058456d6.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053399; x=1792658199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csLZTWFJZwVmJjPK2j5B/Fm6zSWB8VBpn8JFPtRRzfA=;
        b=BMontasPnj/q/KCbkTQAjA2cXNDjjA7rQa0powvrrsXZY1JWW2eN3l9VZXRuyWTqXo
         Wpdv1Q/3LWvn2Cz6QuimQBg4y6G7CQ5PFLgH0to0zNbZttyvBTIQ+wYWxWv4DM7ZfL7z
         gp43A4A6nRW7PSBEWZEq4s2yys5A3OJmI6gtAb8CnD0jQ6xx8lVgolGALi8CWVrqbIcn
         AQ12///6JpZcyrhPkph7ef1dnjT8Din3plLarXFI1iMdnU+IV2edkyLMD/xKF2897qe+
         cRL1saPxmHAvfIF3/u6EL/XsvogfpEFKmnF1dZl82ziEaKP12F3XBeNWIdb/0FQq60kO
         jgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053399; x=1792658199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csLZTWFJZwVmJjPK2j5B/Fm6zSWB8VBpn8JFPtRRzfA=;
        b=LC91vh6mUywiCbQDadEyfaU6pvu9ObKjWVig5C7YV0HD9pf9c3fGWgT0Yz5LkCORt3
         cjvPopj5lHMBiSYcAIoXIBmBmXExB8qfKDbCOqU6IqKAmRNBPRhpnD25rZ8FpOf6qNyB
         v6cL+5GFQDQlGiEkhwJkAU7dXxbDN6X3OozFbhIo87GkujkI3DEcHAmU2lZvMAG97Qe+
         WA4gJreAU4yQz3cxHSNACXkdNCuHMIsH+AQ1F5T145jmzey2sGGSTtJLTCl6KvhQH02Q
         kl3wqVKK+rs49ezjjWiAr8r1ln0OVYY4xmujAaHO0FSG524lpOcGSfVI43tRkv9sB3t/
         nYQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7C8UsJHfMnbtfT50cIoSrI7prs+1qPOzHl2cdRrhmZ95vVuSsmciTUZ5ibMoq63Do4ZIkiRIDNDWQXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnnxC9dlFDg12/1F4c++JdP46/tlR9mQMoyoxc9YvkM2knZEDw
	pJDWCVZqX22AcUeTDKf1EMGmfrlnvtAiszvF/mw8K/wCzWtYUhDrzwsE
X-Gm-Gg: AYBFou1LrsxQL4YAvlR4xpnT2qhcsIKUU0AvKxqoOXiCzTmW28PWF0xvz63P7Gt95bn
	xECeLxPyZW3Pfp5hcnow1lJt7y5LE8JdlFbaeeFZSMv1PmPlI9dazTX3CJjMffzm+2pKYeSHHkF
	PpRv5bt45uxHUGEYy5D901JJKRxOQpZDn9Ii0PE2J4HynbQ69GZC09RCb/eRky89xqDn0A1ELs2
	Yivdqfi2LF8FZO2pPctQTEhFWeyUnyvNzV2ePYm2YmliBuVpK0E9NQoofvxzG/dvnPqjIua9Wri
	KuBYzJ8vsijnhg5Tg4LVkiuTlZuVUT8771bLaigNm79sL9bkuVjk7M4yK9XgMQOqr5eRJ4ONhW5
	I/qa7QN4U9U/UdHP6U7Eug5lqnUuXh8Yq7Ftlu5W0CmkiwJ7pdZQ/FIUlk+NV0ClvaSCAXyyaw/
	t7Cai0seOoH3d1I9RMjnRrqT3p3A2RON17TsFJmUT/jI/9p+a7tC6IfLAdW4vF2Cygm9TYq/kLj
	8aieVNCXs0217EBhBnxxrVGIds+Msd6VnrvlN2xGqNlavDMrHoX161lcqOKr/FdT5cCNZZmIcTr
	wxsYMQnXk0GPTX4XfleltVuOJdR6TLb/BA==
X-Received: by 2002:a05:620a:4552:b0:93e:5821:2c57 with SMTP id af79cd13be357-93ebd2244d7mr3256091585a.22.1792053399383;
        Thu, 15 Oct 2026 01:36:39 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-44-200-54-59.compute-1.amazonaws.com. [44.200.54.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm711843985a.40.2026.10.15.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:36:38 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	Yishai Hadas <yishaih@nvidia.com>,
	Edward Srouji <edwards@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH rdma-rc 0/2] RDMA/uverbs: Fix DMABUF lifetime bugs
Date: Thu, 15 Oct 2026 08:36:35 +0000
Message-ID: <20261015083637.200958-1-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two lifetime bugs in the uverbs DMABUF export path. Patch 1 fixes
leaked uobject and ufile references when the uverbs FD is closed first.
Patch 2 fixes a use-after-free when dma-buf release races with ufile
cleanup.

Tested on mainline 4056b3c9d3c9 in x86_64 QEMU with KASAN and lockdep,
using test-only siw export hooks. The unpatched kernel reproduces both
bugs. Patch 1 fixes the leak, confirmed by tracing ufile release. With
both patches, the same tests complete without KASAN or lockdep reports.

The tests cover core export and teardown, not real mlx5 hardware,
importer DMA mappings, device removal, or allocation abort. The abort
issue in patch 1 is based on source review. Testing on mlx5 would be
helpful.

Deep Shah (2):
  RDMA/uverbs: Fix uobject leak in DMABUF release
  RDMA/uverbs: Fix DMABUF use-after-free during ufile cleanup

 drivers/infiniband/core/ib_core_uverbs.c      | 10 +---
 drivers/infiniband/core/uverbs.h              | 37 +++++++++++++++
 .../infiniband/core/uverbs_std_types_dmabuf.c | 46 +++++++++++--------
 3 files changed, 66 insertions(+), 27 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
