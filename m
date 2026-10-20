Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478289;
	b=2+/14vL0DG41x9fK5C/hlQ9/7DBm61nJlqb/t8pKVQlz+bcgM9xaz3acorI52iGKd4QF
	 RRNdNMJdItfhjhinJTqHqhgeCdufZRrNwoldKVXU5yHTV/8i2dgkumIm+XHnVx4K7BSSB
	 GQCg29VNSt7FEBw44T1yxFd+T882j2IgahnlbhbZqH0JVLRhtL7IyQ9DBWCjIqlqIQUxW
	 X/BqrFv3LJSXhSlXIFnWljjww/TVaqxrUpDfU0b35E8xWRU3FjRfI1c/+Vvgm11n1pLaY
	 v+mSvyIC+vmgytRSYO9bQXHQOU605d8XrWpwsESFsK4ttv+oG3UFwId18WEemlfBGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UzAZEenc0KxEq0x6RyPzYufxdEkxW9SFi1K+hoFFagM=;
	b=ARWhHyUJ613fCKlBL1Jm8GHRG8qs5C0dEzDKtX1q8hi14fEhd/CJo6UF0li1QdCgw3ys
	 exu9+XSJqr3qw/DQgF0RpxGcDMCAb9c9tngk1YwC3sIg5vg8LmlhRnEowQe9WOR0N+KsJ
	 RzEPbDHgz+jr2s3YxQOfawJgkJqDNmHLANQUYGOoaVMSxrXJTfvAPbn8JYU65ASuVE7ZD
	 D0txzrWdkjl512qg7CADCqybE33UL4DiUf8IOKcPtIoJX/A6QGll59SBYva5gZnIGLHvQ
	 8/y0SrhqviznEvKIw6Z3Wssd0bmSgY+sO5QLjg+U98pCTOMlcyWUItuR/Bz2oYHOcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="KdI/M7KN";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E3606A323
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8E3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KdI/M7KN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso1846105e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478287; x=1793083087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UzAZEenc0KxEq0x6RyPzYufxdEkxW9SFi1K+hoFFagM=;
        b=KdI/M7KNAmf+mbjijy9pL7ul3XOVYz1JSfuxwrGvg7QCBlvopedyQkPagbYjz51YCe
         N15kUbT93hEG+kS/QHuwQeHHTOJ7E2HCCehDRXEfDqyIbV7UVklz4dhhcmwFcgBwM+Vh
         KP6rfCjZG85ST4pwA1EhOL3soCxjpgg2GWhhk/5lDqW/zwGF6bSjUqblS0Lv0p0dRtAI
         L7s4sdZfzrIWA9G4PNKwEsTPFm5xfEfkvKvGdfmAw9ctvrbMVsWzGpzikCxtBB0dCaFM
         LzzLtgeCEtMv+3+dxohh/le6MTut5S4AVyrRy2JAVz69h7ewmKTm8GhLc5l2CAnjD93B
         t55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478287; x=1793083087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzAZEenc0KxEq0x6RyPzYufxdEkxW9SFi1K+hoFFagM=;
        b=XARaUuz4ZNQI37mFoI8tvs/v+1LWzLTvprjG08fF7LH79dOKuDXse/Ix9eK288lsut
         K35MMq1yCdXjP5dao7LDF8wNNDgOlfNFjQSUJ+R0wurdILRXJYFB22CGT2R5Q9q7wWY6
         +Fz4G9lHJAc59X/gWtzXrW4grOVBcjGuwGumD4i0PE3q2ZcraPGmfQAo2LOSJKf0trCY
         miUPv6kI6+cM85wWqoIY8jRC27/Ct4uxwnv/38hXRv9aoWRISJAmSIVyEr/VbzxVdNfs
         iOCg59xl5ObabjQKD53nYD5P2Pg3AYpxAdIB0u1h1PZIOKwA0KuglnjLWk4q2HjayyAo
         8izA==
X-Forwarded-Encrypted: i=1; AKwUvBzQqrnZO3WfvWfJghckGYFt7YfzU/5c7sFfLJjqKysIgWGZKdk0nr27UVMYjyL2a3+haZFiUxNKN9RuSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJrxUdsYyigpZKUc3t7S20NRMRwj21AqMaYA6jVkqgpIB9lOAHH
	f3IRkrH4ENqaSLA1/azF4Ll65zos02mTo7HiVGSzqvKXpORqIgufWa5z
X-Gm-Gg: AYBFou2TLGLKl7S+7ZCFfak15ifixZrJnLQSMLw+BbbFLck1QiAG9FHt6/AoKRjjFzd
	r3+2goYEAO6P+ZU98FSdlt8sDBjAWVZaueGqTJ8+J1PIUC4IsTWTwL1fMJVNfblppuBIdXm5XJA
	DvhmBUcwRk3i5OtanFHR4AMpS/nczmVjl0GYrkyC+cZks2FF1ORYh6tJyX06/cbeAwghsH9IlMa
	kJzzIAoinr5jfdY2yH5cDhfpAZpTOSU9S3cGAMRnfs/gxxRdr2F+VPAB7iRSDXFQpK5OtkfAA9W
	/JolbCh3JINqT381T2APfyEITCd6Ix8bpVoE2WAfuS+uzQDYtF/dbYgGKHlzmj28hSccYdSPJ5/
	tMTmu7zGS956TPmeH+IA5zWBgJDyb+Hl/HPfefdr9dcRbYH+mMPONiLoaG+bRx3eIWA8lCNVfJU
	z3z+xMyJaQNS9g7d+WuwMIhy8TT9aMJmTDwPlPmsYAXpiOR1xK9G29p2JBULJZcyhIV2LyVqy6h
	y0Y4rFe5rS5xyatnQ+q5l52Uf77vgWjHH9pDfcQOIh+qIjVx2z/RC5nd8qmBWlza2+PZhtd8wD2
	SSf+3fEtep0nImfHnBPE8MHfqVMD0zmcIA0mJNt6auXTSzBY4WSwAxqwG2mUSch7E++rZGK0RYs
	cWlYfFeCj1SWO
X-Received: by 2002:a05:600c:3114:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1f4c70117mr24583145e9.1.1792478286893;
        Mon, 19 Oct 2026 23:38:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 0/6] iommufd: harden DMA-BUF PAL setup and release
Date: Tue, 20 Oct 2026 08:37:39 +0200
Message-Id: <cover.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a narrow companion to Jason's unmerged DMA-BUF mapping-type RFC. It
fixes setup and release problems in the IOMMUFD PAL consumer and adds fault-
injection selftests. It is not standalone and requires this exact base:

  c37cf2824740d ("cover-letter: Add DMA-buf mapping types and convert
                  vfio/iommufd to use them")

I used LLM assistance while inspecting, testing and drafting this series.

I also tested DMA-BUF paths on a Raspberry Pi 400 and Pi 500+, using their
stock Raspberry Pi kernels (6.18.39+rpt-rpi-v8 and 6.18.34+rpt-rpi-2712).
Both passed offscreen CPU/V3D byte checks. The Pi 400 also passed five raw-MJPG
payload-prefix comparisons through V3D; this was not direct or zero-copy camera
DMA. Neither board ran this RFC or IOMMUFD PAL. The Pi 500+ connector state and
mode remained unchanged; the tested buffers were not scanned out.

RFC:
https://lore.kernel.org/r/0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/

Jason's branch:
https://github.com/jgunthorpe/linux/commits/dmabuf_map_type

This series:
https://github.com/kmehltretter82/linux/commits/dmabuf-pal-lifecycle-rfc-v1

Diederik's RK3588 testing produced a useful trace through
rockchip_gem_iommu_map() and iommu_map_sg():

https://lore.kernel.org/r/DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com/

Jason noted that this showed the same private-IOMMU-domain mapping need as
IOMMUFD:

https://lore.kernel.org/r/20261009125338.GB13920@nvidia.com/

That trace is motivation only. This series neither revives my warn-only
mechanism nor converts Rockchip. Jason's feedback on that mechanism is here:

https://lore.kernel.org/r/20261009124259.GA13920@nvidia.com/

Compared with Jason's branch, this series:

  - preserves dma_buf_pin() errors;
  - publishes the attachment and successful PAL list together under resv;
  - unmaps and clears the published PAL pointer under resv before unlocking;
  - keeps callback state alive until dma_buf_detach() returns;
  - calls dma_buf_unpin() while holding resv; and
  - tests pin/map failures, cleanup counters and retry on the same DMA-BUF.

Patch 3 follows an earlier forced-window arm64 QEMU/KASAN double-free report:

https://lore.kernel.org/r/20261016194022.62065-1-kmehltretter@gmail.com/

The proposed release order is:

  resv lock -> unmap and clear PAL -> unpin -> unlock -> detach -> put ->
  destroy the pages mutex

Questions:

1. Is that publication and lifetime rule correct?

2. Is c37cf2824740d still the right base for this companion series? If not,
   which tree should I use?

3. Can these lifecycle fixes stand independently of moving final mapping
   selection closer to map time?

   https://lore.kernel.org/r/20261016202653.97339-1-kmehltretter@gmail.com/
   https://lore.kernel.org/r/20261019184123.GR13920@nvidia.com/

4. Is the per-buffer selftest control acceptable, or would deterministic
   setup/release race hooks be more useful?

Testing:

  - arm64 QEMU virt: two boots, 24 selected cases per boot, zero skips;
  - x86-64 KVM q35: two 24-case candidate boots plus one focused four-case
    pin-failure boot;
  - a one-defect x86 control failed all four pin-failure variants on the
    expected erroneous successful ioctl return;
  - x86-64 GCC 13.3 built the exact head, headers and IOMMUFD selftests; this
    build was not booted; and
  - KASAN and lockdep initialized with no diagnostics in candidate runs.

The QEMU/KVM campaigns use mock IOMMU domains and the selftest exporter. They
do not cover a non-selftest PAL exporter, physical DMA/IOMMU, forced
invalidation races, or the complete IOMMUFD selftest suite. The x86 negative
control validates patch 1 only; the earlier patch-3 report is separate.

Testing with a non-selftest PAL exporter would be welcome, especially failure
followed by retry, invalidation during setup/release, repeated revoke, and
multi-range buffers. Please include the base, config, architecture,
exporter/device and full dmesg. A full IOMMUFD selftest run on another
configuration would also help.

Thanks,
Karl

Karl Mehltretter (6):
  iommufd: Preserve DMA-buf pin errors
  iommufd: Publish successful PAL mappings under resv
  iommufd: Clear the PAL list before dropping resv
  iommufd: Keep the pages mutex alive until DMA-buf detach
  iommufd: Unpin the DMA-buf while holding resv
  iommufd/selftest: Check DMA-buf pin and map failure cleanup

 drivers/iommu/iommufd/iommufd_test.h          |  24 ++++
 drivers/iommu/iommufd/pages.c                 |  24 ++--
 drivers/iommu/iommufd/selftest.c              | 111 ++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 121 ++++++++++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h |  30 +++++
 5 files changed, 298 insertions(+), 12 deletions(-)


base-commit: c37cf2824740d833b21eb816e21f94836100291f
-- 
2.39.5 (Apple Git-154)

