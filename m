Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC8A2417DE;
	Thu, 20 Aug 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238057; cv=none; b=i3EMTBdV5LUUH9wTuksCaJ/5y39U5qTIe1SB5cj5ngGbT79T5fOYzt3m14L+jIl8J9CumAUQdsMqYCmXDCb5ocGebejbiRagESrGAHvagehU50fdgrd/NqDp05rg+Scl9MYj2pv0KSQJaWmEge5m28yhYybJGLmQZLrmQcfyeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238057; c=relaxed/simple;
	bh=O2lTX9I3YPIZ+bo0YXEpysRU2CMztWSeM004+MCAceE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbv81xSUnuF8Gi9Y4hBCnzabdZ2GyQNbDWPzvWRkNu7b2pFsc/A/sfy6BdiVUODQ7GL4J3TXS5YVYhDwoJcD5Biii7hPOmrvJMgcFh7vFZlBp3BGyG18i7SVISKVebDaMvGXWKTNLITYTRAFJPUGXxtoR+uKY9+V/6eBn5ZD+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AJ9VAcMw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AJ9VAcMw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0A3153B;
	Thu, 20 Aug 2026 08:00:46 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C2973F85F;
	Thu, 20 Aug 2026 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238050; bh=O2lTX9I3YPIZ+bo0YXEpysRU2CMztWSeM004+MCAceE=;
	h=From:To:Cc:Subject:Date:From;
	b=AJ9VAcMwdCmOOsbBcXQZufYWWNusiIl7BpU3vmD6YO3IigW5quK+sWWKSRw6WizW+
	 2iHoint2tEOBaY/FtrZULKYZFMh6cSYapIOjbko+WSq2JakMtMPRdyuCxIt5JrP25V
	 G89vzy1Y+G0OyH3LpA9w1LneqtGXWnPsnUMn2ObQ=
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 0/4] Clear shared pages after private-to-shared conversion
Date: Thu, 20 Aug 2026 16:00:29 +0100
Message-ID: <20260820150034.88729-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_memory_decrypted() doesn't (currently) guarantee to preserve or zero
memory, but both the GICv3 ITS driver and the system_cc_shared dma-buf
heap currently allocate memory with __GFP_ZERO followed by calling
set_memory_decrypted(). On an Arm CCA system with MEC this can cause
ciphertext to be visible to the guest rather than the expected zeros.

Patches 1 and 3 fix this by zeroing after the set_memory_decrypted()
call.

Patches 2 and 4 fix other related bugs that Sashiko found. Patch 2 fixes
the issue that set_memory_decrypted() can be a sleeping call, so moves
the allocation out of an atomic context.

Patch 4 deals with the situation where set_memory_decrypted() fails and
the rollback path could attempt to re-encrypt memory which was never
decrypted.

I've sorted the patches by area, but there's no (semantic) dependency
between them.

Changes in v2:
 * Switched to use BIT(n) rather than 1 << n in the GICv3 change.
 * Added Jason's R-b.
 * Patches 2 and 4 are new.

v1: https://lore.kernel.org/r/20260820105026.53208-1-steven.price@arm.com

Steven Price (4):
  irqchip/gic-v3-its: Zero shared pages after conversion
  irqchip/gic-v3-its: Allocate VPE tables from sleepable context
  dma-buf: heaps: Zero system shared heap pages after conversion
  dma-buf: heaps: Fix shared system heap allocation rollback

 drivers/dma-buf/heaps/system_heap.c | 24 +++++++++++++-----
 drivers/irqchip/irq-gic-v3-its.c    | 39 ++++++++++++++++-------------
 2 files changed, 40 insertions(+), 23 deletions(-)

-- 
2.43.0

