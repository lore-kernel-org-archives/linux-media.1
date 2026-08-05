Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06CB3D1A81
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 20:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962601; cv=none; b=NJzF7OutMzVngaijUmNqKOp9qtpTfki5gJ8xLuzCrSoGt9CWGgNtFiBiME1jd32Vt4gKkm+FXILunAp1WGVrle4m7wi3qPDQaar7JutN2RRjR3HRzv8DC75L5bjlpcwrRSEjjSWIt+zp5lAAlS1kCKYix3nA0JLpYxZCQ+8+yqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962601; c=relaxed/simple;
	bh=Lc7UR0VbaI1TOYS/6NT5lRIz3T9BzpWO1iFpRhtI6Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1pQ1IS/E6eRw4jaxmD6D5gaRF7QgoUe/w5f0nWHzDwbTWJN6T9rLj0+fkBy5nrDb0SpOuPXln1jyaQkePApy8tBGRSNRVUUeGeP0rvW37PgixX7fvJr05kJBArta9OT7K32mas0QfRI2dpBchNjwqfOgmf1A6WTQSsK04Dzycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiYGPNYR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiYGPNYR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e27035206so1134777b3a.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785962591; x=1786567391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSorQdxLA2cwFX+rUnYn0LqweS5daHGY10an0vI1+II=;
        b=XiYGPNYRe+B9bzqMHzG5YJJ+QFDJg0oMizOJUFhdA4MbXl876rMID7IVaE58wcNvZd
         inTI19HBHZVweom0+ds5Vtm2+o1StKZbHFYZiYlOBnmkUTVJ/zQG5Xo14jT1Za8+7cm/
         LUklWSiMgBCnSJZA5BLe1OJsVGYGB7J/JVIOMfJ9wLUz9qnE+2r2t0xl/xGg4NV/6ipZ
         A2WA28TBoM3gSK9ImDKVOcUzaOZ/f4B9qcPIgcr+vpccPQQ21JFF/lFDXb1oz/yWVe9Y
         Xm2UEBY3yRJLkSN8hSlvZbGCVbP1EP9VYqlNZ6+12qT/JcbriGyIIRLrXEW9xXpiMyBu
         nxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785962591; x=1786567391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSorQdxLA2cwFX+rUnYn0LqweS5daHGY10an0vI1+II=;
        b=mxplYI22tng/f5ENk/gbhw4kR8MyjqIcc2mugHpWyBpqyURxyaxIO8UyLRcLn2BFzG
         ptoxj/cD88wV1WWOrDRO6FkLLatJAgTE4IJZI3MvHFdZkJoUbh7heAKG8iaVDb7zFKut
         Je3biTSDxN0jHP4pHOzeHPICBAGzzdUcb7q6XNmShMU2gGDz04YvuOExFRMIAW/GdKOM
         BYw/r0Vv65BrTeDxiEl3IvSDUtoHLCGX9zd2l1uZypriZcNeqaXyx0yz1Ypta85U71Sc
         E6GEl9t8Alq/seXWCTb5eYjbo1C0b0zczxm/GKhsgrp8HmgjuGN6oJjr8UIFaFws8GwG
         Gd4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpYeQl4hoFykmV3uqtfGbbIEdYU52Uf4flEco1r9zrK9KDno3XIajzD1/2WKXnqJKnNHo8j3G5jslQe6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxebs6QKgU2CSSdR/weil3sn5Pj3bGTzgnKQrTfSrN2iUYHiZ1L
	/+Zv5HcEoy1Bu+W58T5634+2sNWcQ48VicBCJXGta6kaPIMvDkeqoGms
X-Gm-Gg: AR+sD10vVbg9nfTLaX7GeAhTfByJp++INi4LSBwfITBslPqs9Mvve3tO4pNS5GrVyUg
	tmVIj4xTAWtub2H+IApIBDoQNtnn63OYoM3g9T/evEtrqxpg1f6mImHgd9BWwwDp/f8hhvqnDYe
	qsFxjn3GgD3Ge2i4t6D78QS8zBjST5HBGbzVd65Wdm0GMaqtZJAyBEC1f+ykRqnOfZGQXNsXHfc
	ZEGfDON08TNk3mmjVLccSWYpAdVlf/2OsosNQrFwZxG3Y0x/3U9V0letB2944Sr8G3rZQ8X31KQ
	a5gXqE6yBZOYBQQa2PTYpi1+26z2qH0bMQdp84rYYvaRTgiWNZ4KX84L4Mj8keQo1Hqwxmdx3MZ
	RxeY0aQR+Yup+8Bf6cBOaHj9//T4qKw5/9vglSWGHGJGGn/2GmuwBwOfylFls4McwzeDNqi3zSp
	Nv0Kfk2Xy5z7850FXvS4yEdYy3LF4H+WamRS83GgDY4gyttUZOA1FpqcKEFaHeu+PWj3s=
X-Received: by 2002:a05:6a00:1388:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84f2e017478mr10698688b3a.22.1785962590863;
        Wed, 05 Aug 2026 13:43:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4d::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459b9ed1sm15387b3a.44.2026.08.05.13.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:43:09 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 05 Aug 2026 13:42:45 -0700
Subject: [PATCH net-next v8 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-tcpdm-large-niovs-v8-3-3e0225e2808c@meta.com>
References: <20260805-tcpdm-large-niovs-v8-0-3e0225e2808c@meta.com>
In-Reply-To: <20260805-tcpdm-large-niovs-v8-0-3e0225e2808c@meta.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a new devmem test case for binding the dmabuf with rx-page-size=16K.
The test sweeps RX payload sizes straddling the niov boundary to cover
the sub-niov, exact-niov, and multi-niov RX paths.

Silence pylint invalid-name (`with open() as f`) and too-many-arguments
(ncdevmem_rx grew to 6 args) at file scope.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/devmem.py   |  11 ++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 109 +++++++++++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  |  10 +-
 3 files changed, 119 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 031cf9905f65..82c11ffc4add 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -2,7 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 from os import path
-from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from devmem_lib import (setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds,
+                        run_rx_large_niov)
 from lib.py import ksft_run, ksft_exit, ksft_disruptive
 from lib.py import NetDrvEpEnv
 
@@ -30,11 +31,17 @@ def check_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+def check_rx_large_niov(cfg) -> None:
+    """Run the devmem RX test with rx-page-size = 16 KiB."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the devmem test cases."""
     with NetDrvEpEnv(__file__) as cfg:
         setup_test(cfg, path.abspath(path.dirname(__file__) + "/ncdevmem"))
-        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds],
+        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds,
+                  check_rx_large_niov],
                  args=(cfg,))
     ksft_exit()
 
diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 0921ff03eb81..209ce3b041e5 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+# pylint: disable=invalid-name,too-many-arguments
 """Shared helpers for devmem TCP selftests."""
 
+import os
 import re
 
 from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
@@ -8,19 +10,82 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
                     NetdevFamily)
 
 
-def require_devmem(cfg):
+RX_PAGE_SIZE_DEFAULT = 0
+RX_PAGE_SIZE_16K = 16384
+
+PROBE_RX_PAGE_SIZES = (RX_PAGE_SIZE_DEFAULT, RX_PAGE_SIZE_16K)
+
+NR_HUGEPAGES_FILE = "/proc/sys/vm/nr_hugepages"
+
+
+def _is_aligned(value, alignment):
+    """Equivalent of the kernel IS_ALIGNED(value, alignment).
+
+    alignment must be a power of two.
+    """
+    return (value & (alignment - 1)) == 0
+
+
+def _restore_nr_hugepages(nr_hugepages):
+    with open(NR_HUGEPAGES_FILE, 'w', encoding='utf-8') as f:
+        f.write(str(nr_hugepages))
+
+
+def _reserve_hugepages(want=64):
+    """Raise nr_hugepages to @want and arrange for it to be restored."""
+    with open(NR_HUGEPAGES_FILE, 'r+', encoding='utf-8') as f:
+        nr_hugepages = int(f.read().strip())
+        if nr_hugepages >= want:
+            return
+        f.seek(0)
+        f.write(str(want))
+    defer(_restore_nr_hugepages, nr_hugepages)
+
+
+def _probe_devmem(cfg, rx_page_size):
+    """Return True if ncdevmem can bind cfg.ifname at @rx_page_size."""
+    probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
+    if rx_page_size != RX_PAGE_SIZE_DEFAULT:
+        probe_command += f" -b {rx_page_size}"
+    return cmd(probe_command, fail=False, shell=True).ret == 0
+
+
+def require_devmem(cfg, rx_page_size=RX_PAGE_SIZE_DEFAULT):
     """Probe ncdevmem on cfg.ifname and SKIP the test if devmem isn't supported."""
-    if not hasattr(cfg, "devmem_probed"):
-        probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
-        cfg.devmem_supported = cmd(probe_command, fail=False, shell=True).ret == 0
-        cfg.devmem_probed = True
+    if rx_page_size not in PROBE_RX_PAGE_SIZES:
+        raise RuntimeError(
+            f"rx-page-size={rx_page_size} is missing from "
+            f"PROBE_RX_PAGE_SIZES, so it was never probed.")
 
-    if not cfg.devmem_supported:
+    if not hasattr(cfg, "devmem_supported"):
+        _reserve_hugepages()
+        # Probe every size upfront: in nk tests a leased queue may land in
+        # ncdevmem's queue range and cause the probe to fail.
+        cfg.devmem_supported = {size: _probe_devmem(cfg, size)
+                                for size in PROBE_RX_PAGE_SIZES}
+
+    if not cfg.devmem_supported[RX_PAGE_SIZE_DEFAULT]:
         raise KsftSkipEx("Test requires devmem support")
 
+    if rx_page_size != RX_PAGE_SIZE_DEFAULT:
+        page_size = os.sysconf("SC_PAGE_SIZE")
+        if not _is_aligned(rx_page_size, page_size):
+            raise KsftSkipEx(
+                f"rx-page-size={rx_page_size} is invalid for this platform "
+                f"(must be a multiple of PAGE_SIZE={page_size})")
+
+        if not cfg.devmem_supported[rx_page_size]:
+            raise KsftSkipEx(
+                f"Test requires devmem rx-page-size={rx_page_size} support")
+
 
 def configure_nic(cfg):
     """Channels, rings, RSS, queue lease for netkit devmem."""
+    if not hasattr(cfg, "devmem_supported"):
+        raise RuntimeError(
+            "require_devmem() must be called before configure_nic(), which "
+            "may lease a queue away and make later probes fail.")
+
     if not hasattr(cfg, 'netns'):
         return
 
@@ -76,7 +141,8 @@ def set_flow_rule(cfg, port):
     return int(re.search(r'ID (\d+)', output).group(1))
 
 
-def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
+def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
+                rx_page_size=RX_PAGE_SIZE_DEFAULT):
     """Build the ncdevmem RX listener command."""
     if hasattr(cfg, 'netns'):
         flow_rule_id = set_flow_rule(cfg, port)
@@ -96,6 +162,8 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
         extras.append("-v 7")
     if fail_on_linear:
         extras.append("-L")
+    if rx_page_size != RX_PAGE_SIZE_DEFAULT:
+        extras.append(f"-b {rx_page_size}")
 
     parts = [cfg.bin_local, "-l", f"-f {ifname}", f"-s {addr}",
              f"-p {port}", *extras]
@@ -202,6 +270,33 @@ def run_tx_chunks(cfg):
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def run_rx_large_niov(cfg):
+    """Run the devmem RX test with a large niov (rx-page-size > PAGE_SIZE).
+
+    Sweep payload sizes that straddle the niov boundary: below, equal to,
+    and above rx_page_size, to exercise sub-niov, exact-niov, and multi-niov
+    RX paths.
+    """
+    require_devmem(cfg, rx_page_size=RX_PAGE_SIZE_16K)
+    _reserve_hugepages()
+    configure_nic(cfg)
+    netns = getattr(cfg, "netns", None)
+
+    for size in [1024, 4096, 8192, 16384, 32768, 65536]:
+        port = rand_port()
+        socat = socat_send(cfg, port)
+        listen_cmd = ncdevmem_rx(cfg, port,
+                                 flow_steer=not netns,
+                                 rx_page_size=RX_PAGE_SIZE_16K)
+        data_pipe = (f"yes $(echo -e \x01\x02\x03\x04\x05\x06) | "
+                     f"head -c {size} | {socat}")
+        with bkg(listen_cmd, exit_wait=True, ns=netns) as ncdevmem:
+            wait_port_listen(port, proto="tcp", ns=netns)
+            cmd(data_pipe, host=cfg.remote, shell=True)
+        ksft_eq(ncdevmem.ret, 0,
+                f"large-niov failed for payload size {size}")
+
+
 def run_rx_hds(cfg):
     """Run the HDS test by running devmem RX across a segment size sweep."""
     require_devmem(cfg)
diff --git a/tools/testing/selftests/drivers/net/hw/nk_devmem.py b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
index 300ed2a70ab4..61c6f31f01e5 100755
--- a/tools/testing/selftests/drivers/net/hw/nk_devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -3,7 +3,8 @@
 """Test devmem TCP with netkit."""
 
 import os
-from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from devmem_lib import (setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds,
+                        run_rx_large_niov)
 from lib.py import ksft_run, ksft_exit, ksft_disruptive
 from lib.py import NetDrvContEnv
 
@@ -31,6 +32,11 @@ def check_nk_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+def check_nk_rx_large_niov(cfg) -> None:
+    """Run the devmem RX large-niov test through netkit."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the netkit devmem test cases."""
     with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
@@ -38,7 +44,7 @@ def main() -> None:
                    os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                 "ncdevmem"))
         ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks,
-                  check_nk_rx_hds], args=(cfg,))
+                  check_nk_rx_hds, check_nk_rx_large_niov], args=(cfg,))
     ksft_exit()
 
 

-- 
2.53.0-Meta

