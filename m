Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488318;
	b=BvpJFsOiYqwJG4krgAA+0OJ2RUDnFUPon7RnBaLDTjEmMKV71aV/AnyCV4N69Nuq55NQ
	 87+VPbijEIMuGCBiuO282KjZb3KHXEkQOpLOp4TTi+1JpEC9dAIRIC6Tvg/7w6kVEo4bf
	 YqHr7Fd4vmENC0KD07ybDpsqWZkmZQ3Mbk3FNo1acRL05e1iykCDplz+TdwF1UdmSlFpx
	 zZ/xxNAUB+NgIBPFdWNQBU8DzB9aDBO2ZcNOAPA02ImuWZcGuTZ3s4+e9hbpqFSQNgxZF
	 yyG38DL2LOfZ97T1jL8zFiTERMcpj1qVF2nVYMVJrb1/Mq8omjMvYaRyHE1QEejCkWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488318;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=q5EFTCLEHdRIRVIc1WLoQhbVHhzNw1gURxAgzmPnF6A=;
	b=Ba7M6XBZPRspH+5xm4HCY0oRqVM6qjozmgnfLWtn8Zj2e7IGjacOK3ziZychYG3fT40D
	 y/OqrhFDn+JXkgLAJYSHWCuEWPXw/kEZczBoaXL7/ES2opk2LNlSansTcNmw0H5SnlBHi
	 8CTimgj/Hyqqdoefbz4XLQWmOEqkS63oqoXyxKccbwgOBy7TdltuSeBf5oj0JA2MJWTNB
	 9JtE6teo8R6QFT5336Aczimg6fOcEG7ieUixestAvDDofUQMlrbaNQ7Rmto+Pll8tvMdx
	 KIa8bPKVa1tm1qQSu+hS0iVaw/N2aTXGhdqvbET8xOsr8+FvIb3/DhuVGSwGxEP7+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EXbkdwU7;
	arc=none smtp.remote-ip=91.218.175.114
Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC220606A322
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 02:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC220606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EXbkdwU7
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ir4B76zlkpWj23djjJNSYj9nLGcKKUpZKOTxUa3rwUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795488314; v=1; x=1796093114;
 b=EXbkdwU7acpx0ZFw2wzqbbCGO9XSCQexoH8bHNRCZ9fGkvfEW+CFB4ZGzA2LDU035s9k5n/z
 VgEI6cgE/Xlc2sxojb6qhl3H+D9K3l+eMdWFh8pGUr04nAW9wwrFyX6VAfG+K4TzDLmmUbMNeFc
 e9uPYZPdPKaqCHtWhR+nkf5o=
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9e699e5a7949427e;
	Tue, 24 Nov 2026 02:45:14 +0000
X-Mizu-Trace-ID: 9e699e5a7949427e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v2 0/3] udmabuf: speed up mmap() of huge page backed
 buffers
Date: Mon, 23 Nov 2026 21:44:59 -0500
Message-Id: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACv6BGsC/3WNzQ7CIBCEX6XZsxhYf4qefA/TAy2L3URpA4XUN
 H13sYlHj99k5psFIgWmCNdqgUCZIw++AO4q6HrjHyTYFgaUeFYKlXBkJpHsy7TJiT6Vwuj8y4z
 igCeNNVpZ1wRlPgZyPG/qe1O45zgN4b09ZfVNf1L8L81KSGG71mitL0fZ4e3JPs17SxmadV0/6
 Sq7dMAAAAA=
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Philip Yang <Philip.Yang@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>, 
 Natalie Vock <nat@pixelcluster.dev>
X-Mailer: b4 0.13.0

QEMU and crosvm export virtio-gpu blob resources from guest memory as
udmabufs, which the host renderer and display mmap(). The guest memory is
often backed by 2 MiB huge pages, yet udmabuf maps it 4 KiB at a time:
mapping and touching a 4 GiB buffer inserts a million PTEs and takes over
200 ms.

Patch 1 has mmap() of a dma-buf align large mappings to PMD boundaries,
which any exporter mapping contiguous memory with PMDs needs, such as the
proposed VFIO dma-buf mmap() [1]. Patch 2 maps the huge page backed
ranges of a udmabuf with PMDs, which cuts the time to map and touch it
by 87-90% for hugetlb and shmem THP backed buffers and leaves 4 KiB
backed ones as they are. Patch 3 adds selftests.

[1] https://lore.kernel.org/r/20260527102319.100128-1-mattev@meta.com

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V1 -> V2:
- 1/3: Add Reviewed-by (Christian König).
- 2/3: Pre-fault only the faulting PMD range when the VMA can't have
  PMDs, so that disabling THP after a PMD was mapped no longer has
  vmf_insert_pfn() walk into that PMD (Sashiko review).
- 3/3: Give each huge page its own data pattern, skip the alignment
  check for 32-bit tasks and read the inherited mapping in the forked
  child (Sashiko review).

A fault racing with prctl(PR_SET_THP_DISABLE) can still see a PMD
installed by a concurrent fault. Lorenzo's series in mm/core fixes this
in the core mm for all PFN maps with ->huge_fault() [2].

[2] https://lore.kernel.org/r/20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org

v1: https://lore.kernel.org/r/20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev

---
Qiliang Yuan (3):
      dma-buf: align large mappings to PMD boundaries
      udmabuf: map huge page backed ranges with PMDs
      selftests/udmabuf: test mapping a huge page backed udmabuf

 drivers/dma-buf/dma-buf.c                         |  1 +
 drivers/dma-buf/udmabuf.c                         | 85 +++++++++++++++++++-
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 97 ++++++++++++++++++++++-
 3 files changed, 178 insertions(+), 5 deletions(-)
---
base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
change-id: 20261121-feat-udmabuf-huge-pfnmap-3258272d077e

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

