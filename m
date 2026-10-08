Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419334A3F26
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465981; cv=none; b=gSVQlCi0RkXmWGvxt/9JWKAmUTXjd5CJaKfU0OYcvLYKkknu8wE9MhecHnPYzWKfj++F572c83oiWxGH0pOBfjTubFLuoU+YfPt15Jfl9q/u9Hatc8wIvQh7OiLy30etNnQz8Iy4Q8uRs9DxNp6wFjpdF7WNzf8lEPmPr2aeHp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465981; c=relaxed/simple;
	bh=+m9rnwpw7xg1jsbD5aOWtNPCYElh+Du/JGxeqetiXi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rpL3x2ux5b2Ql8ee7obHoQaahcWISSQljgZM5dl8Y0VeQhNmrctm2bw99kml2LWsZn+QAIcHlDYz4cs5Rg4eQp+hx8br+zmDoDVlO4JQB4lmfGbPpYPns9F17u+Gg34XEPS9Km97llZxxSAitxuNIidn2PuTyq1y2FN2fMW6ma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPSSCmIr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPSSCmIr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4511516f8f.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465977; x=1792070777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fh/Nj6C+FKLMVijEkg1F+ko3enZi3ph5WXj82YARnOg=;
        b=GPSSCmIrGgFnkcDAMmBUUvO+AOhBrdHtwXSKy2ebQ52J6YUhaDMZf5ZmD64v/G7mao
         vFr7BLRD3PifhaQUjG0Ub5+bk5lMZ3BndF8jhYcC9VFUFYL6IFs6vOsNLanSezpX7ixq
         dfpj89xgQwjWb9td+gbgDZ2VjuD4WOoJ8EBOrZOghiu9ApMPqH0aoI1OV7/OnSbGQWYV
         2yVUFO6RALalMF8cTyEyzCe9RgCkkkt1L02S4/kW+NN0BWqWceP8/pvsrJ72cGc3mydQ
         JStZMjRP04bx010oVDLEq0hxUCmpvpBu0gDONWcoHmhih68BynkDeCVO8TEVxBZ6d/gJ
         X/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465977; x=1792070777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh/Nj6C+FKLMVijEkg1F+ko3enZi3ph5WXj82YARnOg=;
        b=pW3+Aplb14ophAnzHz8Y8BAyD5BB/RlK2lzYPE84RbWmYy4rHDU+wY3chQLEAfcK+Y
         CSwiyVLHyjNxJ0K+RliAvUaOfSkP3wg/E2egTb60/cIiqKm1mbTKpDQf/LcXRXCarfjQ
         qKxKl3AEwTxpHLfM+uiQdtixQA+GWKR41uAUn2tODfJZFovYprczffvvvC73ImL2bNUH
         1ONP1W0v0+DOVFu/t9jMNNhptUXnhwKTHROuK9XMsdLO7ZVUO7w7ip/k7zWPLlsPAIRc
         xUmQ7uaU8CMV42TnXETgxIw9jQHjcc14BjLk5YAfQQ9mHP1L7KVACVNfSukSvd+ZJC5n
         WVmw==
X-Forwarded-Encrypted: i=1; AKwUvBzaMi27D72N1xwZ5NIjyjrpWO4LAQ/nPg7oq4YXBHvL/XD7nTC7GIWNaCgmyZ9SS1kC7WV5x5x98OwjCA==@vger.kernel.org
X-Gm-Message-State: AFuF++mCa6dBJkHoFcogJsqmOmAvKqmkrNCRyCVqheEB0+7CJ/zNhnET
	Zdh3RelhmgRXh9R7+kBFRKlMQNzGJdSCBc4GjtN3cg/OkeaW8x/700cITGBHXWa7XA==
X-Gm-Gg: AYBFou1K9ApmNd06x4K60SkJAsyOZ9hBBm9EN49YNdXHXNvY9mlL5258zwKsWWytoAp
	vzkNiTxHqovB0i+XvBWhWhOCkVFXHNOIlcFx9tixLNledUW8crmqfemCM9akbN2r+H2zfYDXoIQ
	TE0YiVVASaN0hh9gwcbPvKHbuXY+7N5KnDOX80W89puLDtOLFD5DORy11/dimJa6tzPhIV6Sw62
	gAzXDLo+trRncX+JPRRNPhqhVqrV/F49ouSTfycBiACkccd5E1P+xNNHMviC6uVTjXSQVS5osE7
	q8Bc3FF5wpNZ9JJVpNdemRjTXuk70tajNpgQFFv6YSSPFeBBk47UcAUGkHhe3x6jIIkyyQBVMIt
	lP3P9FUyYfA/8mLAw5uBcnIt+wOaz3ITdIi4qKv+dXhbTOakj3AkoT6a7+D5tCs/Zkj7qNKkoXs
	3aCbOEBFoHZ5nFGcA6tMEFxIYg400GPnGNt0SMibFh0yqvIV+kVF7H16W6af142mzHv+ahAqIw7
	H0ksatH2Jms/C2ukrH295ta2mZxQhUWYER9O3dNPRhq1ny9Y7tGS74=
X-Received: by 2002:a05:600c:4f10:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18043b5aamr106524465e9.13.1791465976910;
        Thu, 08 Oct 2026 06:26:16 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a349bsm71479105e9.2.2026.10.08.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:26:16 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Thu,  8 Oct 2026 15:26:12 +0200
Message-ID: <20261008132614.2456716-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v3 is a rebase of the v2 series onto media/next; no functional change.

1/2 no longer applied there: the endpoint properties are now written
through the IPU_BRIDGE_NEXT_PROPERTY() indices and a local names
pointer, so the link-frequencies hunk had to be rewritten against that
shape. 2/2 applied unchanged.

While rebasing I noticed that commit a20c843c9bc4 ("media: ipu-bridge:
Keep the clock-noncontinuous property name out of rodata") already
fixed the third reference of this kind, the one I had reported
separately. The two remaining ones this patch moves - the
link-frequencies *values* and the "lens-focus" property *name* - are
disjoint from it, and 1/2 now says so.

Testing: the v1/v2 testing stands, on a Surface Pro 7+ (IPU6, OV5693 +
OV8865 + OV7251) running the equivalent change on 6.19: the PCI remove
-> module unload -> rescan -> modprobe sequence, fatal today (-EEXIST),
completes cleanly with the series, twice in a row, with all three
cameras streaming after each rebind. The rebased files here are
compile-tested only (gcc-13, no new warnings): that machine is not
running a media/next kernel, and it is about to leave my hands, so I
cannot promise a fresh run on it. Other Surface Pro 7+, Pro 8 and Go 4
owners are testing this hardware in
https://github.com/linux-surface/linux-surface/pull/2252 if a retest on
next is wanted before applying.

Changes since v2:
- rebased onto media/next (1/2 rewritten for the new property
  indexing); no functional change;
- 1/2 commit message notes a20c843c9bc4 and what is left after it.

v2: https://lore.kernel.org/linux-media/20260831140304.45940-1-dmanresa@gmail.com/

Changes since v1:
- shortened the 2/2 commit message;
- dev_info() -> dev_dbg() on the reuse path;
- Assisted-by: tag per Documentation/process/coding-assistants.rst.

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 38 +++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.43.0

