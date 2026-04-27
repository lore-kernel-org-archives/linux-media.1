Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B733B4E83;
	Mon, 27 Apr 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284315; cv=none; b=W8A+dR32qRypCL/7BHl/ZGVkIlLm0v9klBqWIM0AuzHhNDbaHcwwGYkeQkZ2eFhcKaDRYWuNPcbT3EGh0rk/T6kjc6pTET+0OjTQsPGJL3MwiWkcWbpklaKsDQ6QRDBFEux5CRXCaE3wmUn0gdcq99JJ21Z3JZuhUrNHU2awQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284315; c=relaxed/simple;
	bh=DVp9SIjZvLo7LHKT0aFcqmpT0ICBVAk6Lir7Cpdt3so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JahdIUgiDrFHiGZqfdzsExyUcH3NVG0YhK2L6TdFIU9XwVUK/xtGJSiCUoLkCOoBXne3WDjAcxaRqM8FqcOfBgjL4qg+7Tg7kP/W8+g9CSuGisIjueZ/HtSFUU5tbUXP6o63VmOj1cPblsqaUlNnwrV6kcXjLLvnGFDzzl1MPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFEf02hj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFEf02hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AABDC2BCB6;
	Mon, 27 Apr 2026 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777284314;
	bh=DVp9SIjZvLo7LHKT0aFcqmpT0ICBVAk6Lir7Cpdt3so=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EFEf02hjKJBrla5RxATE172pEWa4DwdUWoWua5gh3m2gOPQoJLW+WbrcmdAD3D3/1
	 v99gfpc4meaM+99m+qRj4h34CwSX5RVI5zESaihlunB+cjRqQ4ZY6CjIso9DrEiu5k
	 p4k/kcAxJjWOn4T3CVbTJ6U/a6sjPaeWykhDUU4NOSjDUDpnyOBC+KXnKoXA8YD5OD
	 WHetiPxgajNyAhjj0KEHbGBd638DwjLjOCr9NKwwTyusWQ6v5uH+9G11HwdJ67pmIm
	 WmVhOTB0btzdyI0xPowk3MtRXzGyWOrrCUMdDACeaFWP3xiG9SQviJx2tbBLzb9Asi
	 3zqiJ/wcrR8ug==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 Apr 2026 12:04:57 +0200
Subject: [PATCH v5 1/4] dma-buf: heaps: Export mem_accounting parameter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-dma-buf-heaps-as-modules-v5-1-b6f5678feefc@kernel.org>
References: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
In-Reply-To: <20260427-dma-buf-heaps-as-modules-v5-0-b6f5678feefc@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DVp9SIjZvLo7LHKT0aFcqmpT0ICBVAk6Lir7Cpdt3so=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnvTS6tafvtvWv6mh+bl6Z8bN7Ru6CH7exr7qgFe/Z7H
 a2R+nKyuGMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMRN6WsT44uNxO4ATnvH+P
 vR0PGTDPVPP73xCyY9dW05dJv75PdZf9uMKjwPN4qpt7ys8zTwz2bWOszwvg/KmqaTpHLirus8l
 jZ6VL4n9ypinF5hj4vZJMWpPHuzHs4J6SlX0yOyc4lefe+lkAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The mem_accounting kernel parameter is used by heaps to know if they
should account allocations in their respective cgroup controllers.

Since we're going to allow heaps to compile as modules, we need to
export that variable.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/dma-heap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index ac5f8685a649..a76bf3f8b071 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -51,10 +51,11 @@ static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
 bool __read_mostly mem_accounting;
 module_param(mem_accounting, bool, 0444);
 MODULE_PARM_DESC(mem_accounting,
 		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
+EXPORT_SYMBOL_NS_GPL(mem_accounting, "DMA_BUF_HEAP");
 
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)
 {

-- 
2.53.0

