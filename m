Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033C46AEF2
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194158; cv=none; b=V4f0cg6NLYw+M8vwg7O6/ft8T013pzro9o4jU9NxWFFes5kciIyqvhOnJHdR5nrQmUH6TrI6V6x3DuX1bX1NShKFDdk17p+CKItGg3obadHBi4rYZWT6JQVJoH/k96TqOZCvILAWlGXnY5b4g6X7FTaMiS1UZxwFd4e4WERMQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194158; c=relaxed/simple;
	bh=zIgQPFMqRQism6lMFZ7Hr5G+GkKpMxBGzTbpENtH8zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hg1UekcIJ1z5LzS+tYNh5LYEwAl91Ioc2++hXbZ0YtkBKLkoG2skEhXT+8Fq/jzdNATIUhjTu/x8ijk4A0OsSan0MTkXLvlT277BSWdCXAG/wwvjXeKrU/XPPfc0Ec02F8cpAxpi7x35vp1afrPqsTJvEt7Tk4Y7yqXVkXaKp94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYBg5O1M; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYBg5O1M"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so2087432a12.0
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791194154; x=1791798954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5KZiX26aqwUyZIYbya9tfV4Mvg5MCMOLcvC9aKPc0E=;
        b=OYBg5O1M7WF+0xsmp5t3QOAR5Lr3XmuYyehdwHXeQ2i/Vso/vcctYzFfi+lFG6rYld
         oL91G4OL5lP8QVGDlf18Ma9EuR92jdk1m0hFrTaQy6wJSyXvxIV9HzQn7+sv/KVeWzAv
         /5EPdUPGfWD33k8VP5P+ipkCgS6kBSn0tWqhSMz6xfQjQ46t5ICSI2JEyoOsPEJs62i0
         HAnNaQ39gy4sNEzYGpSm1n3qgEl+BKW1GxGA1IXTVIXBFGkIEZ6PuOA9LZvpS9jlW8ll
         AWPxhEn+zKNesFekacBDvJ/mCju/b0HF7auRMBcn2XCRcHUdtTvzLOtXaMdh/n+yrxsN
         ub6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194154; x=1791798954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5KZiX26aqwUyZIYbya9tfV4Mvg5MCMOLcvC9aKPc0E=;
        b=hI19gy2ef9HKl9SdDJ1jSWDwNPjGtkZSiR8AxUCGCZFVVn0XucZknq+1YkAsCB2x8F
         Is+nsx1klN26zDDommaDg9J607krswS07AdvUyKckihESi7/hLRZa2I2RG49KKHGlK3t
         BqrSIawOedS0uYcq+pMhdOXenpfUZ2hprrrj79OqL3TQsoPDEy91a9p5N6R713yy8oSa
         0uC4nbdIPw+vK+cgb02pVVjCSdqmRXENJVOtHxi+ZYZiJ+l23na4sD/TGqXNi5eBLzdN
         bTe0us9eknMqr/B7bE5EY5nWkTIoOfYi04wRmBtN/s7LsYJlV8AwLDHB9sEygtRH/Fsy
         mg/g==
X-Forwarded-Encrypted: i=1; AKwUvBw5pFaAsM+P0oer6lWJKQYxggoDiTQHSsn+3mokbEWpYGXQ1lSdGVQAyI4SMP6KrGPOc6kG3JkVV8YnPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kXG3pp2vZ285yh2BDNy7w5FqDF4kK/nKQzgA1rUchsCyaYuivF
	jLJ9l1fuxs2dA5Kl9yzEhZlF7IbF5r6oR1hDpEjtDFv0yD0oMrOyAnI1
X-Gm-Gg: AYBFou24Q4/o8k8HMFbyt31IpN5TYW/iDVzfYa6GxhSNhdHYMVlZotdNlyxMRQEAS0c
	yr3N5kj2/giwCi+z1vCqGLedYU7m8a8BFYaRzNNuA5jYxNQlnD0w8hPoTV6/CEb/lTtRSb6BZRd
	kGWmvT0LPfDgqAXE/uR32MbU/jDWm1PZZiGOPZaqzh7GDdoTjIF5B7OJRpyF9GO5YpRh757wroa
	XBeD6tXhIZxqxI+r8MakkU8aqSrusVpUvOemeXfLRHKxGp2jJyM2A67/tsIWcdzMasq1NyZx0gP
	wg7alrRLuYy88SGndZIJLiu4aDFye9LkmUeV9sJQ+WortRAQCtldxBytiQkccXiLKfM5bC+eq+X
	nrHgGRhzBsJe5FgpzC0KnplQbv64RLa9jrdFF8MbIuHQtyNHbSXyKg9aJDUms8T+Ua7076gpems
	tvl3ppCkedtyM0RZBc7yhnC90N3EFFjGlyOEaHpixYSRelF4u1P/s4iIltGk0QcFbz7H0qM3EUt
	pyJURzmDGwr53WhZa2DsZRZ9UlBT83fwOApdRpVrVSBxd4Yi4uTiVIwRF7QjMGhyUog7xYiJYbj
	VsDex+EkbG4KDC3FFrEOEbyZe4cCCT9B+gc=
X-Received: by 2002:a17:907:7b8c:b0:c2d:fc0b:551a with SMTP id a640c23a62f3a-c2e6e7ce8femr537001966b.0.1791194153808;
        Mon, 05 Oct 2026 02:55:53 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31562aba16sm50753266b.23.2026.10.05.02.55.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:55:53 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 0/6] KVM: guest_memfd: back guest_memfd with an imported dma-buf
Date: Mon,  5 Oct 2026 09:55:46 +0000
Message-ID: <20261005095552.52748-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720111259.122911-1-dwmw2@infradead.org>
References: <20260720111259.122911-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

This extends David Woodhouse's "KVM: Allow alternative providers of
guest_memfd backed by PFNMAP memory" RFC (v2) to let guest_memfd import
a dma-buf as its page source:

  https://lore.kernel.org/kvm/20260720111259.122911-1-dwmw2@infradead.org/

The memory owner is a plain dma-buf exporter, linking against neither
KVM nor iommufd. guest_memfd imports it for the guest (stage-2) plane
and iommufd imports the same buffer for the device (DMA) plane, so one
object and one invalidation protocol serve both. This is a concrete
answer to the "how do we plug into iommufd without masquerading as a
dma-buf" question from David's cover: the provider does not pretend to
be anything; the dma-buf is the shared object.

Applies on top of David's v2 series.

Patches:

 1 KVM: guest_memfd: Add a writable result to get_pfn()
   Give get_pfn() a writable out-param so a backing can map a page
   present but read-only (KVM_MEM_READONLY is rejected on guest_memfd
   slots). A guest write then exits as a memory fault. Stage-2 only;
   KVM's own host-mapped accesses are unaffected.

 2 dma-buf: Add get_phys() to describe a physical run
   New exporter op: for an offset+len, return one physically contiguous
   backed run and an attribute word (RAM/MMIO, plus READONLY). -ENOENT
   for an unbacked byte, -ENODEV when revoked. Lets a page-table-building
   importer ask where the memory is instead of taking a scatterlist.
   Converts vfio-pci, the iommufd selftest exporter and the sample;
   iommufd behaviour is unchanged.

 3 dma-buf: Add ranged mapping invalidation
   Invalidate a byte range rather than the whole buffer. The callback
   means "re-query this range" and covers loss, replacement and
   read-only flips. Importers without the callback still get a
   whole-buffer invalidation.

 4 dma-buf: Allow dynamic attach without a device
   Allow a dynamic importer with no struct device, for a consumer (KVM)
   that only needs the physical layout and builds its own tables. Such
   an importer must not map the attachment for DMA.

 5 KVM: guest_memfd: Add dma-buf backing
   Add GUEST_MEMFD_FLAG_USE_DMABUF and a dmabuf_fd to
   KVM_CREATE_GUEST_MEMFD. guest_memfd attaches as a revocable importer
   without a device, serves faults from get_phys() (largest aligned RAM
   run, read-only honoured), and zaps the range on the invalidation
   callback.

 6 samples/kvm, selftests/kvm: Exercise dma-buf backing
   Turn the sample into a dma-buf exporter (a toy memory owner: one root
   region, a child per VM, move/donate/reclaim, absent and read-only
   pages, a scratch page, per-child ioctl allowlists) and move the
   selftests to feed one dma-buf fd to both guest_memfd and iommufd.

Scope: non-confidential VMs, RAM backings only; iommufd keeps its
single-range import for now. As with David's series, this is largely
AI-assisted and is posted to get the interface shape reviewed.

Fred Griffoul (6):
  KVM: guest_memfd: Add a writable result to get_pfn()
  dma-buf: Add get_phys() to describe a physical run
  dma-buf: Add ranged mapping invalidation
  dma-buf: Allow dynamic attach without a device
  KVM: guest_memfd: Add dma-buf backing
  samples/kvm, selftests/kvm: Exercise dma-buf backing

 arch/arm64/kvm/mmu.c                          |   13 +-
 arch/arm64/kvm/nested.c                       |   10 +-
 arch/x86/kvm/mmu/mmu.c                        |   18 +-
 arch/x86/kvm/svm/sev.c                        |    4 +-
 drivers/dma-buf/dma-buf.c                     |   92 +-
 drivers/iommu/iommufd/iommufd_private.h       |    8 -
 drivers/iommu/iommufd/iommufd_test.h          |   16 +
 drivers/iommu/iommufd/pages.c                 |   74 +-
 drivers/iommu/iommufd/selftest.c              |  106 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c            |   58 +-
 include/linux/dma-buf.h                       |   70 +
 include/linux/kvm_host.h                      |   12 +-
 include/linux/vfio_pci_core.h                 |    3 -
 include/trace/events/dma_buf.h                |    2 +-
 include/uapi/linux/kvm.h                      |    6 +-
 samples/kvm/gmem_provider.c                   | 1311 ++++++++++-------
 samples/kvm/gmem_provider.h                   |  144 +-
 tools/include/uapi/linux/kvm.h                |    6 +-
 tools/testing/selftests/kvm/Makefile.kvm      |    3 +-
 .../kvm/gmem_provider_nvme_dma_test.c         |   28 +-
 .../testing/selftests/kvm/include/kvm_util.h  |   25 +-
 .../testing/selftests/kvm/x86/gmem_poc_test.c |  824 +++++++++++
 .../kvm/x86/gmem_provider_hugepage_test.c     |   30 +-
 .../kvm/x86/gmem_provider_iommufd_test.c      |   42 +-
 .../kvm/x86/gmem_provider_readonly_test.c     |  172 +++
 .../kvm/x86/gmem_provider_revoke_test.c       |   34 +-
 .../selftests/kvm/x86/gmem_provider_test.c    |  190 +--
 .../kvm/x86/gmem_provider_vfio_test.c         |   45 +-
 virt/kvm/Kconfig                              |    1 +
 virt/kvm/guest_memfd.c                        |  252 +++-
 30 files changed, 2703 insertions(+), 896 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/gmem_poc_test.c
 create mode 100644 tools/testing/selftests/kvm/x86/gmem_provider_readonly_test.c

--
2.47.3

