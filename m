Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB325785C
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 02:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600951; cv=none; b=LGnMTCBf2PUgiLEGWjdTmO3Yg22xAOu8rI7BXI/egVKnhor0UFpMNq2eqWypEgLd+e7x///Q9nc7rPLY5gIHdqgFzU0EPR5zHWpc9RXC9fMmkhXWhQcpV206WGGxohx/bg5dF8qUlllE2xtVBiJmMjhPGNe+pE5/O2Jkg6VxZrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600951; c=relaxed/simple;
	bh=6gGUo5bfHG056Upj0Wv3RVCBcYSHTIx2FpNy0nwC6/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i8CksU5pG4VrEjJT5sY6Sli5KYguXMZteGL2s5wuTIorPxOTG+v3N9e6+PJOqfGYL/UdiT3eCif22SkU6mvoHNUBsSDkMCMzOGMzEYZ5YiiUhISbcDqzXqD3BVJf4TXkAxPfvYkLVjM+tp3eQ4UPe/feH5syl7aWL0cFmVGUMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fN+DxHhx; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fN+DxHhx"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1542129c88.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791600938; x=1792205738; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0d9kx5oWqQ1CybegjOdsNGS+P/geGKBslG4tLGyxeVI=;
        b=fN+DxHhxImxuPdY0qJfuRumNvnkLcVwJruiyjK86iWKDOhmcw7zzOrtMfuwb2ahvor
         lSlpftunEv+Tn+68w/orjJo5giKkjhQlRDZ/9YZa1u9KKRRo0k/hsoVLGnam4nl4mTGU
         ndwnhCUKNEiPxJhMYHQjER4xqdCaIGP4XPOE66DuPdbOG4eyt/OuaxkonloC7/Ptq6LQ
         4o7aqleGxL4TWWaeeAXIw9PDUY6Hcj4ACVWVB6kAvBa0RgrXbA9FGZKAtvwIdUmfCNyF
         8h+bYE1pxUIb75eXeP0YiGk8NbFyHA+De5Xf4yx/W19+u5wMC5E8hJ2LpvPIMVMuxqyN
         vlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600938; x=1792205738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0d9kx5oWqQ1CybegjOdsNGS+P/geGKBslG4tLGyxeVI=;
        b=X0I5GcHz7Z7syhm43QlgoEMfCvQUHe3lMceS9Oib4Js2sjOqh4Dgj3AvcC/Pja0c8k
         D2psUH+r6NtlV32JOBy91+oGpoZlVlt/fo1a1EG4JJZJB0f5mik2Hi35ah42AK7eABjn
         P63EdWTuc8bfgWnrTechn023+cXhjblHeElGp7vbqT5nq7NNFXt78UCK69jvwfL5pZnj
         9Fmh20Sg6sAK1QMbJV7iBUl2tDPFU0q1YeLZWOPzB0Pj0S5ggguR6RGeMiCkPWtZjnbX
         Bd0e8DPtu843gdYk2LXCuiapGQe5oghRRrPmFqoI6cb++OfIOlEEkbSeV6BqEbP8RV7T
         /tIg==
X-Forwarded-Encrypted: i=1; AKwUvBxmKDi+TVo07SnYKmX70Ex4MySxO1kTMb0riQaaCVsjCmgLUYSQkfXQO/CoJj7PfROgCHCLzYMYSHCNZw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIb6Qr99z/Yp3l6SkMHVEGTvxO8DbcHbPi0C1BNZoHVRUYccOuD
	+FMHQJ/p3o/SiMF4Zn0ZZRBNLQpghLXP322mIX3KFogMWLYMane2oQJbBnzg4iF/ScOQFR2+YXM
	Z4fHAjwXMAbHwzm8ECvEPBCVl1w==
X-Received: from dyvj1-n2.prod.google.com ([2002:a05:693c:87c1:20b0:355:5354:7d27])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:895a:20b0:351:f762:a10c with SMTP id 5a478bee46e88-3537dc3ca81mr5067199eec.0.1791600937866;
 Fri, 09 Oct 2026 19:55:37 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:55:16 +0000
In-Reply-To: <20261010025532.839559-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261010025532.839559-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261010025532.839559-5-almasrymina@google.com>
Subject: [PATCH net v1 4/4] selftests: net: add devmem RX and TX netdev
 unregister tests
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Add devmem_bind_rx_unregister_check and devmem_bind_tx_unregister_check
to nl_netdev.py to verify that unregistering a netdevsim device while a
netlink socket holds an active RX or TX devmem binding synchronously
detaches the dma_buf attachment and cleanly closes the netlink socket
without use-after-free or page faults.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 tools/testing/selftests/net/nl_netdev.py | 108 ++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
index ceb44c8e1fec5..bad230ee9dcd2 100755
--- a/tools/testing/selftests/net/nl_netdev.py
+++ b/tools/testing/selftests/net/nl_netdev.py
@@ -6,10 +6,14 @@ Tests for the netdev netlink family.
 """
 
 import errno
+import fcntl
+import mmap
+import os
+import struct
 from os import system
-from lib.py import ksft_run, ksft_exit
+from lib.py import ksft_run, ksft_exit, KsftSkipEx
 from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
-from lib.py import NetdevFamily, NetdevSimDev, NlError, defer, ip
+from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
 
 
 def empty_check(nf) -> None:
@@ -366,6 +370,102 @@ def page_pool_stats_ifindex_check(nf) -> None:
     ksft_eq(cm.exception.nl_msg.extack['bad-attr'], '.info.id')
 
 
+def _create_udmabuf(num_pages=64) -> int:
+    """Create a sealed memfd-backed udmabuf fd for devmem tests."""
+    if not os.path.exists("/dev/udmabuf"):
+        raise KsftSkipEx("/dev/udmabuf is not available")
+
+    size = num_pages * mmap.PAGESIZE
+    memfd = os.memfd_create("devmem-ksft", os.MFD_ALLOW_SEALING)
+    os.ftruncate(memfd, size)
+    fcntl.fcntl(memfd, 1033, 0x0002)  # F_ADD_SEALS, F_SEAL_SHRINK
+    devfd = os.open("/dev/udmabuf", os.O_RDWR)
+    req = bytearray(struct.pack("IIQQ", memfd, 0, 0, size))
+    dmabuf_fd = fcntl.ioctl(devfd, 0x40187542, req)  # UDMABUF_CREATE
+    os.close(devfd)
+    os.close(memfd)
+    return dmabuf_fd
+
+
+def _dmabuf_attached_devs():
+    """Return attached device names from debugfs dma_buf/bufinfo if available."""
+    path = "/sys/kernel/debug/dma_buf/bufinfo"
+    if not os.path.exists(path):
+        return None
+    with open(path, "r", encoding="utf-8") as f:
+        text = f.read()
+    attached = []
+    in_attached = False
+    for line in text.splitlines():
+        if line.strip() == "Attached Devices:":
+            in_attached = True
+            continue
+        if in_attached:
+            if line.startswith("\t") and line.strip():
+                attached.append(line.strip())
+            else:
+                in_attached = False
+    return attached
+
+
+def devmem_bind_rx_unregister_check(_nf) -> None:
+    """Verify RX devmem bindings detach dma_buf synchronously on netdev unregister."""
+    dmabuf_fd = _create_udmabuf()
+    nf_priv = NetdevFamily()
+    ef = EthtoolFamily()
+    nsimdev = NetdevSimDev(queue_count=2)
+    nsim = nsimdev.nsims[0]
+
+    ip(f"link set dev {nsim.ifname} up")
+    ef.rings_set({"header": {"dev-index": nsim.ifindex},
+                  "tcp-data-split": "enabled"})
+    nf_priv.bind_rx({
+        "ifindex": nsim.ifindex,
+        "fd": dmabuf_fd,
+        "queues": [{"id": 1, "type": "rx"}],
+    })
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_ge(len(attached), 1)
+
+    nsimdev.remove()
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_eq(len(attached), 0)
+
+    del nf_priv
+    os.close(dmabuf_fd)
+
+
+def devmem_bind_tx_unregister_check(_nf) -> None:
+    """Verify TX devmem bindings detach cleanly on netdev unregister without UAF."""
+    dmabuf_fd = _create_udmabuf()
+    nf_priv = NetdevFamily()
+    nsimdev = NetdevSimDev(queue_count=2)
+    nsim = nsimdev.nsims[0]
+
+    ip(f"link set dev {nsim.ifname} up")
+    nf_priv.bind_tx({
+        "ifindex": nsim.ifindex,
+        "fd": dmabuf_fd,
+    })
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_ge(len(attached), 1)
+
+    nsimdev.remove()
+
+    attached = _dmabuf_attached_devs()
+    if attached is not None:
+        ksft_eq(len(attached), 0)
+
+    del nf_priv
+    os.close(dmabuf_fd)
+
+
 def main() -> None:
     """ Ksft boiler plate main """
     nf = NetdevFamily()
@@ -379,7 +479,9 @@ def main() -> None:
               page_pool_check,
               page_pool_dump_ifindex,
               page_pool_ifindex_leak_check,
-              page_pool_stats_ifindex_check
+              page_pool_stats_ifindex_check,
+              devmem_bind_rx_unregister_check,
+              devmem_bind_tx_unregister_check
               ],
              args=(nf, ))
     ksft_exit()
-- 
2.56.0.385.gd3acb90ef8-goog

