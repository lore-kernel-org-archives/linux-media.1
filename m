Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA04C9568
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933759; cv=none; b=hg2+98Ip6mRGvOOToF6eP7GHHvfcWHS8iSkeCDkIAN/vA7LSp0qd/MHBnxmoKq2Z5y/qVDf/vUNrGbO66vrdXOuiX6lpE2JJ/StiYvqMny60Zu7Q9R0sqAr9Ed/zd5RKcGPb3mg0gVhfjI2HJt1b/V0iatLD2PQ9E17srDpokzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933759; c=relaxed/simple;
	bh=XY+qS9vrYeTxo8ApRqbHeXJZiJmsb7VPqz+e7ynGp6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtkDVGxMKou7NeCJ/7YF5O/Ts1psV232/SZ4zrU+4+CFhD654T5i2W4VoeKVncK5l+VpjAOJZmP5nNQ/k/WHDMYBwsFURBdDC4h1T22ugh3gxuPVo/4MNCiWrqJD+c/imQCI/Fo/rNl+KCE7CnX+pK96RE0NyhCxNWeJgBdIuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtSmjGHZ; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtSmjGHZ"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a3110f349bso102871eaf.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782933757; x=1783538557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lebv/FMkf8vjSW8Zb2jP0WYanX61Om+cPKrISlBBrOw=;
        b=ZtSmjGHZ+ogoAQGAkkmHt66yZZKlgNYFrdARyoNOp/qItQiSU1u7PXLefLI9f2ui8v
         piVhSPqbE8N3U5gWWj2cGy0yvKghzo1SdoRcYFQaqNUvuqyp5xfo1NmOfF5iz0Sb8Pik
         L8c5yZOsKgQGIrP7PN3OJPR4rAhnCwofWI4UvPlQJh2UcmUsEH2rUdInNmeMDx1U3mvj
         abGpNXvLU450Jpg3QUyB060KDSPIaOd8ySGRpe6VsIz0p+yKh4qyIwyEI+gfjR1dUyoS
         if5WkCBDL88NyxqNQWvUh1qAipVppMb6GkdxKcTFjxFxH41qr707B1FKTPufAbS6tIu+
         E60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933757; x=1783538557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lebv/FMkf8vjSW8Zb2jP0WYanX61Om+cPKrISlBBrOw=;
        b=m4NGz5WBlvkvw7nJ8f9a16EvGn+XkiuXL4T2uIZMNj0ZY3Auw9bkYC/cb7Sk9FAxZi
         vgualIyydOb2bIjX+8T/S59SvXQDpiaF0S+BeRSDsC4A5Z+slBXhDv3C8xQz97Y++oqd
         r/STA8nM+Y3pD91Dgm+ykEtLoMPIDrxRVU5IHZneymMgkmQ0XMQjQYDLVg54jn8/7xRo
         cjtyL6Ubq18OO/QVF2s6y8kgu2rXqrYRxIlqUjaiLuKMnubMs/33aOnXU4W7WQX3ASUK
         TqZBuVCbJaY7SxZfCk0Ok+WMd22Rp7LHvPv8vFQsn/fF435YssxuT0FxvTqRlMPRDMj9
         kqww==
X-Forwarded-Encrypted: i=1; AFNElJ/H2egbpCUoRqhqkxOQsi9DdKNiVXrdZkRByCnHv7TwG/LJ2rkfZaDYX0fwtbDJclhf3+YXPjZVF79/uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM8CX9D0FkF22RDahC3SDKW5T8DxPbmk/FZ3E1yVGew4W9UIwp
	3Gj17qHRTcvWmnvhWvtZDepHAIXzK0fBDTmWK9rzaEhFN+UKs4pm+BC7
X-Gm-Gg: AfdE7cksoxprZLdIcxYtqhf/J9sgJdoj3CtRHD1AalXgpVVp9Qqi2xirIEwkVVBZW/d
	U+lRbcvYUFfbDW+IgZW3r+jixfab633aL31alyHQxT13TkihByKOnFG2ne4p4JDuDzY8uktkJzY
	vCu7ABFEZtuajPj0q77jnH46w4Y3zB9A0oYjgaiic06VivG6lEYAvXX5/jS+AEuj2FjLeEmZCQV
	7Er9r1507PTF+lWTxz++CH35D5Eel/Q33/31lNV2DOPt5mfamsJbLCQhi3yF5sUoRryHc7z8eHz
	QHEgBLlBZThfYgn53L9l9LFMlQKPANyhtmkKoAxFWfWgjBfhYILYaVAxkEb5cqIVeAcMZEF/YJ1
	cPyCtZmbGoNKySh063dwsd5WEJUnTC6D/GWLmrGiq9z0+fsEh7v+SU1fmEux/kW5AvQdP00HduY
	f1OsR6UWQX
X-Received: by 2002:a05:6820:4d06:b0:6a1:50f0:cccd with SMTP id 006d021491bc7-6a309cda3dcmr1508412eaf.66.1782933757266;
        Wed, 01 Jul 2026 12:22:37 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:54::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a30ff8e08asm681765eaf.2.2026.07.01.12.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:22:36 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 01 Jul 2026 12:22:25 -0700
Subject: [PATCH net-next v4 2/3] selftests/net: ncdevmem: add -b option to
 set rx-buf-size on bind
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tcpdm-large-niovs-v4-2-ca4654f37570@meta.com>
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
In-Reply-To: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
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

Add -b <bytes> to request a non-default niov size via
NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
hugepage produces one naturally-aligned sg entry.

Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
reachable in the CI kernels built for these tests.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index d96e8a3b5a65..a16e55af51ee 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -40,6 +40,7 @@
 
 #include <linux/uio.h>
 #include <stdarg.h>
+#include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -61,6 +62,7 @@
 #include <sys/time.h>
 
 #include <linux/memfd.h>
+#include <sys/param.h>
 #include <linux/dma-buf.h>
 #include <linux/errqueue.h>
 #include <linux/udmabuf.h>
@@ -79,6 +81,7 @@
 #define PAGE_SHIFT 12
 #define TEST_PREFIX "ncdevmem"
 #define NUM_PAGES 16000
+#define MB(x) ((x) << 20)
 
 #ifndef MSG_SOCK_DEVMEM
 #define MSG_SOCK_DEVMEM 0x2000000
@@ -100,6 +103,7 @@ static unsigned int dmabuf_id;
 static uint32_t tx_dmabuf_id;
 static int waittime_ms = 500;
 static bool fail_on_linear;
+static uint32_t rx_buf_size;
 
 /* System state loaded by current_config_load() */
 #define MAX_FLOWS	8
@@ -142,6 +146,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 {
 	struct udmabuf_create create;
 	struct memory_buffer *ctx;
+	unsigned int memfd_flags;
 	int ret;
 
 	ctx = malloc(sizeof(*ctx));
@@ -156,9 +161,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_free_ctx;
 	}
 
-	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
+	memfd_flags = MFD_ALLOW_SEALING;
+	if (rx_buf_size > getpagesize())
+		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
+
+	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
 	if (ctx->memfd < 0) {
-		pr_err("[skip,no-memfd]");
+		pr_err("[skip,no-memfd%s]",
+		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
 		goto err_close_dev;
 	}
 
@@ -168,6 +178,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
 		goto err_close_memfd;
 	}
 
+	if (memfd_flags & MFD_HUGETLB) {
+		size = roundup(size, MB(2));
+		ctx->size = size;
+	}
+
 	ret = ftruncate(ctx->memfd, size);
 	if (ret == -1) {
 		pr_err("[FAIL,memfd-truncate]");
@@ -699,6 +714,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
 	netdev_bind_rx_req_set_ifindex(req, ifindex);
 	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
 	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
+	if (rx_buf_size)
+		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
 
 	rsp = netdev_bind_rx(*ys, req);
 	if (!rsp) {
@@ -1411,7 +1428,7 @@ int main(int argc, char *argv[])
 	int is_server = 0, opt;
 	int ret, err = 1;
 
-	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
+	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
 		switch (opt) {
 		case 'L':
 			fail_on_linear = true;
@@ -1446,6 +1463,19 @@ int main(int argc, char *argv[])
 		case 'n':
 			skip_config = 1;
 			break;
+		case 'b': {
+			unsigned long val;
+
+			errno = 0;
+			val = strtoul(optarg, NULL, 0);
+			if ((val == ULONG_MAX && errno == ERANGE) ||
+			    val > UINT32_MAX) {
+				pr_err("invalid rx_buf_size: %s", optarg);
+				return 1;
+			}
+			rx_buf_size = val;
+			break;
+		}
 		case '?':
 			fprintf(stderr, "unknown option: %c\n", optopt);
 			break;

-- 
2.53.0-Meta

