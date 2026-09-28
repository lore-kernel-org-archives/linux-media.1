Received: from bumble.birch.relay.mailchannels.net (bumble.birch.relay.mailchannels.net [23.83.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAAB4BFE83
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626043; cv=none; b=up4fHUvX3fzGaMSnySzviWmsuv7/lUii/+HB3cGICnjVaVZCz5GtaIhg7kq97DRzGiNN7OoO1cZT8oENrB9yHY+PN0CDL/OO3/Z2+IeFAamEIkILAKDit/bHK+BNgaQM2hI53V7xNdVOjJxCBqPw3zsnF3cGCqiu1aRvnr2Ii1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626043; c=relaxed/simple;
	bh=cTPk9OMekeoA+3WYTiIag6bBsFZ+wZ1/wIem3VnGYcg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DDQAcPpvfnC+cBYI+mmMsEc9xG5MiONRXi6hWvaqMtW3sEgXI65bzhemB64yn3tR/xBp9inm8LdunbOJsj+Q+tE1WzMnFFdjRBr8VzSVgoi5f1kwoaDQwdgusv4o8xUhZsf0V3I7U7uF6/kZsuysFn9fbKOXgCWkYAH3ZMJpMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=UIENJAif; arc=none smtp.client-ip=23.83.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="UIENJAif"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 029DD4C2D80;
	Mon, 28 Sep 2026 19:58:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a209.dreamhost.com (100-96-12-141.trex-nlb.outbound.svc.cluster.local [100.96.12.141])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 913854C268E;
	Mon, 28 Sep 2026 19:58:53 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Attack-Glossy: 0c3d92993a29863b_1790625537930_1945156205
X-MC-Loop-Signature: 1790625537930:2260185816
X-MC-Ingress-Time: 1790625537930
Received: from pdx1-sub0-mail-a209.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.12.141 (trex/8.0.2);
	Mon, 28 Sep 2026 19:58:57 +0000
Received: from offworld.lan (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a209.dreamhost.com (Postfix) with ESMTPSA id 4htsZN69L4z1n;
	Mon, 28 Sep 2026 12:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790625533;
	bh=x9T+yAga0rhh9bF6w0OWPq030pBH2A9/uuDioy1N7Rk=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=UIENJAif5TuYhJC8JBusnF74U8OqfA/61bXMhN2oL9FrQNVy4KmoUcbEtYC0630fW
	 lsx7bE/T4gohxqGCdKXCUa5goIU69b33Rg7dAT6h6BvOschkv+V4fm1pvDaBdnVdCu
	 lya3vq8NDyW9PTRfogwIkRK56M2iyQ58TZHSZh7BaWNn0grwUkhg/vEdK5FoGTRu0a
	 mE98z4nQEQv6+dRsz+sUUMy/j0aS4OCxpr3gJvSiN/xSq7IWLDskc9wdgjyW//m5N5
	 o2qilYJZI/G1hBUXgImAfae1nZsGL5fEz+DKgvP9iPLhpmYc191xh302AAYZ7hs/xd
	 FIyg0AK2oQ7Uw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: benjamin.gaignard@collabora.com,
	jstultz@google.com,
	tjmercier@google.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dave@stgolabs.net
Subject: [PATCH v2 0/2] dma-buf: system_heap: 2MB chunks on x86
Date: Mon, 28 Sep 2026 12:58:48 -0700
Message-Id: <20260928195850.1982569-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Changes from v1 (https://lore.kernel.org/all/20260914212258.2657788-1-dave@stgolabs.net/)

- The bug fix is now patch 1, unchanged from v1, picked up tags.
- Removed patch that adjusts per base page size (arm).
- The 2MB order is x86 only, so Arm keeps what it has. Left other platforms
  as is as well to reduce the change impact. (Christian)
- The orders and the fragmentation trade-off are documented, both in the
  code and in the userspace heap documentation. (Christian)

Thanks!

Davidlohr Bueso (2):
  dma-buf: validate the attachment before asserting its reservation lock
  dma-buf: system_heap: allocate 2MB chunks on x86

 Documentation/userspace-api/dma-buf-heaps.rst |  4 ++++
 drivers/dma-buf/dma-buf-mapping.c             |  4 ++--
 drivers/dma-buf/heaps/system_heap.c           | 24 ++++++++++++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.39.5

