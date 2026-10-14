Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586CF5226AE
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994682; cv=none; b=skUa1d4FeG4Sh5oTgN7n9b8MQVA5u3CEIWAkI9CccSyQfGl+CDQYZ+kM4euXg/Qm5f6mqPHH3qYSpGQncA/wDTg/Op1jz+9B7y3ChpTGyXXp0acnw5xXdSSgoL+vazcEARfAAmeuFhvjEpmcjlGxN8aurmE4ny+Xr3Vb5qKlyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994682; c=relaxed/simple;
	bh=J2MF0CGvDZI2j5xp2f4Y/WWR7jUQb6b1+xx9/N78hek=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SwSqG/kkPEHpVKN3OFYiexE1AQtYGFgS7WctdP/v9L2GdtUYaexg7mvDFHnhOOwGZzsACyj5mAlc54rxho5fzzD7t39A3WMxazH4rrhuiKG7ESTsC0m0x6iUbuTuc0/Z6QwOH86J4SfiSnFuWngQhARNBwxmsEVnssYRDrXWzcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shVCgafj; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shVCgafj"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so1464013eec.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 09:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791994676; x=1792599476; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNYbIRDhdg/bji4iVF4z4GKSYuqq0SGaMYsIsVzbu+Y=;
        b=shVCgafj6S7XxdeceaVQhwMGAdCYXxntKgyPwAzI+goiDOwO+xHN+i3yPCmFLoF/+b
         0j3m4dWQPpJdUToFha/OJUg0wuNYaR0XReNsqaYBiZM412xsImvrfLhYPFIOhHOrbgJk
         918Cgw5aBQbLwCzAoDYFmHVnLGiXOtyT0s/cPl9RohPNc8wh1HfcICC7MkCe60TDWZHI
         SBpwvtWrHmF438drp/gn9qFJ98VyRkSS0rI73eKKMGWm9EnFQzuBnbH/LeKTaZec5HgQ
         E4l+30cQQXwEB0RWNJP1D+nsTwKI5ovLQ8iZUESA1Q/IhuaBVktxst4s6LwWypfYkb3m
         OxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994676; x=1792599476;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNYbIRDhdg/bji4iVF4z4GKSYuqq0SGaMYsIsVzbu+Y=;
        b=KPVbiQ+U8Av7FH34RreNjkoWGVGzHBQRywCfcQqYrQPHG8tj6LpK8x4EDMnLcvJOJZ
         YgEJLylyuy4Th33ZHb+iuuZ5DgiDI4Mn/fTNKPFWWsMPmrNjbsM5sUzrwtr3HsIVJga8
         Pp2YRBHwDdXieEfmTENqcSTMJQW4W2VNw1MvbdHfkBLzZ4MSzCUUKga5lO7j00E/sBDd
         vBRsiy72nyE2Z9gF2Xpp/NETg9m2LUjcZuimnKiR9UXP7W0wELlAGBEmN3uLWBjIA9pH
         UoSj1hqaq4j4XgoA4PAYuI06p4gG5Wh5CB2ZdmzKyXpjlsxXxbqoyCKUxg2gHcMIjrzp
         aPKg==
X-Forwarded-Encrypted: i=1; AKwUvByVy4o9QDVgtGwzhITwl0EKCCASRSmk1LibskD0QgosL7nRA2dNX2e8YKffDb+AiJY3lMn5/JFK2B2E0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLq5LN//fxm7g7wlY7q9yT0ETfIvVM1rZXWCAKY0ErmZUmGh3iO
	lXYFzLFbAk8eKZR+Me/uGpY1iR9ggJxpzrREQ4AMFs+T9vrXELKs31HJOH2jXEFWS/6YHC34q8+
	wr4JvZcpPkxZVpL/Avw+PCDT9tQ==
X-Received: from dli6-n1.prod.google.com ([2002:a05:7022:286:10b0:15e:bc16:429a])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:c84:b0:146:5f73:d45b with SMTP id a92af1059eb24-16a54fab691mr20502668c88.3.1791994675581;
 Wed, 14 Oct 2026 09:17:55 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:17:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261014161754.3782346-1-almasrymina@google.com>
Subject: [PATCH net v3 0/4] net: devmem: fix RX and TX binding teardown on
 device unregistration
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>, Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Fix two device-unregistration lifecycle bugs in devmem TCP bindings and
add netdevsim support plus selftests covering both RX and TX device
unregistration:

1. net: devmem: unmap dma_buf synchronously on queue uninstall
   Synchronously unmap and detach binding->attachment under binding->lock
   when the last RX queue is uninstalled in mp_dmabuf_devmem_uninstall(),
   and unmap RX bindings that were already unbound on NETDEV_UNREGISTER,
   preventing slab-use-after-free in dma_unmap_sg_attrs() when the binding
   is freed after dma_dev.

2. net: devmem: detach TX bindings on NETDEV_UNREGISTER
   Extend net_devmem_dev_unregister() to fully detach and unmap TX
   bindings when binding->dev unregisters, or clear binding->vdev alone
   when only a virtual device unregisters while binding->dev lives.

3. netdevsim: support devmem RX and TX bindings
   Enable PP_FLAG_DMA_MAP | PP_FLAG_ALLOW_UNREADABLE_NETMEM, 64-bit DMA mask
   on nsim_bus_dev, and NETMEM_TX_DMA on netdevsim so devmem RX/TX bindings
   can be exercised in software selftests.

4. selftests: net: add devmem RX and TX netdev unregister tests
   Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
   to tools/testing/selftests/net/nl_netdev.py.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Cc: Dragos Tatulea <dtatulea@nvidia.com>

---
v3:
- 1/4: Run the NETDEV_UNREGISTER walk under the netdev instance lock,
  and skip it when the device only moves to another netns. (Sashiko)
- 2/4: Detach all matching TX bindings, then synchronize_net() once
  before unmapping them. (Sashiko)
- 3/4: Only request page pool DMA mapping with CONFIG_HAS_DMA, refuse
  pp_hold on memory provider pools, and drop unreadable skbs in the
  software PSP checksum path. (Sashiko)
- 4/4: Check only the test's dma-buf in debugfs, skip instead of passing
  silently, clean up on errors, compute UDMABUF_CREATE per arch, and
  add the needed config options. (Sashiko, Dragos)
- Link to v2: https://lore.kernel.org/netdev/20261012174300.2338784-1-almasrymina@google.com/

v2:
- 1/4: Don't unmap when a leased queue is unleased. Keep bindings in
  net_devmem_dmabuf_bindings until freed, hidden from TX lookups by an
  xarray mark, and unmap unbound RX bindings on NETDEV_UNREGISTER. Update
  the binding->lock and binding->ref comments. (Sashiko)
- 2/4: Detach TX bindings from the same net_devmem_lock-protected walk,
  which now also covers unbound TX bindings, and clear the LIVE mark
  instead of erasing the ID. The walk no longer uses RCU or takes
  binding references (Stanislav).
- Link to v1: https://lore.kernel.org/netdev/20261010025532.839559-1-almasrymina@google.com/

Mina Almasry (4):
  net: devmem: unmap dma_buf synchronously on queue uninstall
  net: devmem: detach TX bindings on NETDEV_UNREGISTER
  netdevsim: support devmem RX and TX bindings
  selftests: net: add devmem RX and TX netdev unregister tests

 drivers/net/netdevsim/bus.c              |   1 +
 drivers/net/netdevsim/netdev.c           |  27 ++++-
 drivers/net/netdevsim/psp.c              |   5 +
 net/core/devmem.c                        | 143 ++++++++++++++++++++---
 net/core/devmem.h                        |  10 +-
 net/core/netdev-genl.c                   |   1 +
 tools/testing/selftests/net/config       |   4 +
 tools/testing/selftests/net/nl_netdev.py | 125 +++++++++++++++++++-
 8 files changed, 290 insertions(+), 26 deletions(-)


base-commit: 513444cc62e231a11c9b15ea88de0890da9b2b4f
-- 
2.56.0.176.g3575e65682-goog

