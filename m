Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08409488762
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206466; cv=none; b=BPTN2trTM0nx58CaOpTXzJ/om4pE/Ew64nO3th+oWc6W5seWvQfnKsOvv4GzAMgNnXjNKRq1sfHQy213Q8geIv+nfIQ/lUUCZ6mkIzOVYI8N+Z2iYaH597/05q8+6OGM+6p80FL+4vWTQKzQ3PPwVd6nWLEAZv7Xn92fZkm3rEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206466; c=relaxed/simple;
	bh=SippWX+xoSkF20XXjc5MLFhzuRKSu+Feuro+st5YeiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7UfJZLf395JnrwqnYhbUnia71j2FdyX/MGw9DvWsvZb7gbAZ0VMeIYpma5gSGBoqYffO5rmmCWPgdom4UWKkbKl2oRQz2598qLrOXdUKQtvbKWQfixRKPFr8X690gx7MhBYYc3DRkOgLkcZ3bRF01VaKbeobkyU81gVEc94PKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyvePpA+; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyvePpA+"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e417a5a81so300059066b.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206449; x=1791811249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=;
        b=CyvePpA+5myhEw/neft3Qi0/VUFTYG5o456QppG2/5G9A7H9FId3WTbBHx92BbDih3
         4LHwzEeHMw4bsVoy4ghXYLnVyzQmc3Pt0m3C+oZcTb6uwWl7nasYTcIjezFXsWeu9zER
         thV0rkZZZxmmS8fy2eaY0H5qWPUpLiRUvK55PN6+JGLkJRFj1bbf2KPTnHhId2DS9ugV
         7Wo5kWmTBYhH07RDCvxKlHV1nwfMQkiQc5yYc7bHd0t9oNlr5C9+UadIxvLO240oDVQd
         HkiESF/uf7xSIHadAe3DnCy04kNQTyE/I9pVuX/PyyqPVdDsTIGcq+XqQ3i07SASQUp+
         byWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206449; x=1791811249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5zNn+04D/ADxwDdeMfBIdi2B0cMu31zTvDOOv1nE7U=;
        b=lTEy+Kew9197+NFXOoyjTWBT/ilhxi7ObX4KLddNZANHvM9BWiHeRssflKyDHieUbO
         5k8vhdee759t/RzbGgRJiIJS4Au0dXn28/qVW0EzwfQ0Rvj3NuAr+kJUUN0yTU/olFr+
         PL9szc7yVzzAv7cm+d6gX8DymkRPoF9nL+MTN6PoxkmaKa8Rn4CYq0qmPgesQBvpow5V
         cqwpMfL3fyUuCOB7vlHqpdpyhRmUVk/0O/2Rjqfw2/z7qF/G9VRersJ3yqhXZGgrYa2q
         LOLJzzettj14SaLcfhtYAZOM/3schvPn9GFhNeJ6JS4/cn+QQp9knJ9U4x8etKub1Zu2
         6sew==
X-Forwarded-Encrypted: i=1; AKwUvBx/M62z/3Q3m/YOah1YItZEuWqYIRAeiLjGbvYsbbYxyrs99cV/thYQJfhuDUsc4goXm1jKmXVKIsudQw==@vger.kernel.org
X-Gm-Message-State: AFuF++mnix9emXcuGXwvAGjoL3iIwjzmS3DAqHyHlaeGDiXudceFoBl4
	RO8u5m9qtM9bjDY9SNpeNnyqDQIDwqwbZnnMQoWqOEKHbNLiVfMC7inh
X-Gm-Gg: AYBFou2/U4wqRDEGT9ByHPRxKRVgGNb5SfC2i9fwJDRN/KnwKFV1GyYzLnA6rk6OdkC
	voyWl/EnVI4PPN+P4QWy+1Q3PLeJmMHuIO0QXr64VVJBz3um/Xm2QNaKJJ1hByZV5hsfBj++Z/X
	/4X5wgj4Y9pZm9wc2qeNTreVVonFxSo5SPs84ObDxMxHNmiF0xhxIIVrvW9tcYXY9iE2ibLOc9M
	iBLZ/y558m5ioSxFVxDwk48Mqb9HBvXMtMYhYPKcNW6QzRYpjoh4HcHFubtnaTpgZTC9xFaXbuc
	xkj6VkXXwvuonQmKlhT3e9wFd0O0Wuq/Xfu88gRPHGPPLVCq7Nj1XRFTNOMAhmiwfkjuNLWVg2d
	5SYFV7uTgjKgMtRWotVfYyg81i8d4S4R/8oKtHDRBB8+6cLsdcAnlKhVlImbMg3C+ePXBDBHaR8
	N+kzGzMPBRx0/8q0LCtwQ41lA/xtekOK3BvIBm+7pXOW6gZuuPEyK+waEX4buTgUsCXiEVm4oBO
	DQMUf8XVbPmY7sHbkuWkuoZ7t23g0iWrp7cKBdOlOXQ7KAxYJBQ+lCQEHcISRMVSagvWJ9aDazK
	0v/juetOj1kI1bjVBEKRPeARpTKtjnqgv0k=
X-Received: by 2002:a17:907:9614:b0:c25:8eb7:f388 with SMTP id a640c23a62f3a-c2e4ad13957mr911322366b.17.1791206448599;
        Mon, 05 Oct 2026 06:20:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3156333a04sm79392466b.60.2026.10.05.06.20.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:20:48 -0700 (PDT)
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
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical run
Date: Mon,  5 Oct 2026 13:20:46 +0000
Message-ID: <20261005132046.30025-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/5/26 Christian König wrote:
> Well filling page tables by the importer is an absolutely clear NO-GO
> for the DMA-buf design, we have gotten down that path already and it
> took us years to remove this functionality again.

Understood, thanks for the quick and clear answers on this patch and on
patch 3.

> The problem you are facing here is that dma_buf_mmap() doesn't work
> because you don't have a VMA.

Right: the memory has no struct page and is deliberately not mapped in
the host, so there is no VMA to hand to KVM.

I'll post a new version of this series. It drops get_phys(), the ranged
invalidation and the guest_memfd dma-buf import (patches 2-5), and it
does not touch drivers/dma-buf, as you suggested in the PAL discussion:

  https://lore.kernel.org/all/c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com/

KVM gets its frames through the KVM-private guest_memfd provider
interface from David's series. iommufd gets them through a private
interface with the exporter, as it already does for vfio-pci. The new
version adds a small registry in iommufd for that, which replaces the
symbol_get() of the sample in David's series. The dma-buf is then only
the handle and the existing revoke.

Thanks,
Fred
