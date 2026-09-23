Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0D45562E
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149405; cv=none; b=lPJC/ErJJQ+zVhdZoxZ42A5NyKeO+fGt3Ezf6xq9C/A98CBfFA9Nq53qjFT/ZddwMBUjt+wvCyIlkreiu4dRJvHKrLU8U7gk2kpNxxuHWQ4xY8V+EZLnoFidDmqG/xPLfWvcnXtmkyXTWNTAP9N0rMRNDWlkdKQElRuchA3RIro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149405; c=relaxed/simple;
	bh=tAwt1UHEbyP42ASJ1X5HiAjvk5UC20sOlxN5oqFNYf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrFAu3A8FSxWqLz+V6qEXbY2Joz4Gv8oNby79CGPM925wpzsci2Ltda6SIUI6kW2hs0YPP6hYdlB1MPf32driSstWyLj//GJU6wkhEMqGPLexM/6ajkoieEo6RLr4JMTZ4MSWJiOia4mLzBCupj+jVyqK7CpPiIa1360BGi5mwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCK9By0J; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCK9By0J"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so66681a91.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149403; x=1790754203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3yqINp8iie30Eysp9fZFTFNFw0R4zJwE8ZATQluE4I=;
        b=nCK9By0JtLKgw4QsJWKPmgPl+S4zxxVdvvEn7PWf3uXLROQt+Bpp+oMLqLGOWXCZnW
         VIP/Tdm7ZzlgH8bzDFzf0ELcVKBGfBMAUjlZInoucOykHmMQrookApa30BnNk3M8xlBW
         5k0SzMffUebJKNW7v9AkiBDCm74xcpZmreNubZ9pTZHgLTL5BQiGNskBhaVBtlMfHBBK
         3bGM9Qf1QXP4+lQ/nr4IPvu53A4XQel/iFv4dDmKdkEDWgttvXlMGgYew3Rj5HGBhG0f
         uDFitHO3X/Iu5tDCQV8T9P4HyDUaxphPfyOEQ8nz/K2BAWRflr1+ugQZDmpY2qRHy+rp
         i/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149403; x=1790754203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3yqINp8iie30Eysp9fZFTFNFw0R4zJwE8ZATQluE4I=;
        b=vy0mHM40uUsKcbaDUnn8AjZmGt+m4D80GpFw0nwf8xdEbaCQoBAjMLyNz5E4gjJCQe
         bkL0OtJH0yVN9ZqNlUOWgJAie28FqNRV79zvHqhlrIa/uZRrmBOblczAF/4BMA94EExT
         QOxeliE/MGCOPh5j0YVgreX7yiHaQ2D08zrXyYJqhcKkLrQNroExaR8WABKYDmFd8dhk
         ivaM+vqz0PW2MiIJEYnQtjdgDNxN9L1hhbeU96oAs19SjuaqrH1SRNk/I24qc3NmmUq8
         0FOTB9VUoyo7sFHQWYuL/B0uzCAwbAAwN5KUMBnU3Y+TuANp9SPGbvxB/NrCp0yincmu
         ZjOA==
X-Forwarded-Encrypted: i=1; AKwUvBzqcIuIVjzBKomzqmQR4ETlLUXnaCK7s9jIkZgWDs5Efyc3/QIE6KrFYvbn/pM/Kvfzsak3XdiN4TdnWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m+GxEsIYu1P1asCXkTwFs2R8ype/AhqmuaG7EyAF8mWSQAX6sH
	FXG/EbOGmOD6ILy7T0eNw45dTZUsgjxrDY1xJCe2gL567rohDs0kPB3p
X-Gm-Gg: AYBFou1puuGug2Z407gi5FTawQEYtNMw4BEXzdcErRE//DmdZRTQcS8SrNbyGE8vMzu
	IpU/xiUfFTGBvQCZ8ZvYtyw+1CLgm4s2c2mQ8LR4LPdxFLEcbCuK9lM03lP8YjaYUGTuJGwx4ZJ
	fn7scqg/CluD9LkshyudWGk1tZI/BeYt6kRqZRPXKN6ITYmr0TVZkOHNdsPONKk+FwVhDFb/M+g
	XXtiAkDmvMwASqxFUAyhhAbLvF/J6/cEPCGyvu3fe1fc6+BmNf8lk5l3wGOrWwLoyOKLIk3gQJi
	YeunQb4JwpluJ4miOrh4jukB4d+LJMhKNa88atJl7YxmtU9E0VCzQhPlE856WtLqno/AGcHgail
	6pwXPhEU1zYDkAOw10dAUMAzaVC9HoECgIMoGuXpdZRht8zx0t9DZpm1S9oPySyJz2Cq00i0K/A
	MClOyuSV0d6na0Eeyo4UeOSITz5qSDYm0j+xPG152tSNaR1TaeTg5wI9b/qHIf56BQ/gdbw4sgb
	6EBldHJOb3dbA==
X-Received: by 2002:a17:902:d2cb:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2df69e1769bmr25554635ad.4.1790149402890;
        Wed, 23 Sep 2026 00:43:22 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d9273sm6406785ad.50.2026.09.23.00.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:43:22 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
Date: Wed, 23 Sep 2026 15:42:22 +0800
Message-ID: <20260923074256.9357-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923074256.9357-1-liujianfeng1994@gmail.com>
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels") fixed a dangling reference in the DMABUF_DEBUG
default, which had the side effect of enabling the option (and with it
the page-stripping sg_table wrapper handed to importers) on every
kernel with DEBUG_KERNEL=y - i.e. virtually every distro kernel.

drm/msm is broken by this: it maps imported dma-bufs into the GPU's
own pagetables with iommu_map_sgtable(), which needs the struct page
of the attachment sg_table, and it fills the GEM object's page array
through drm_prime_sg_to_page_array().  With the debug wrapper in
place both silently produce garbage (the wrapper zeroes sg->length,
so the page iterator yields nothing and an uninitialized array is
kept).  The VM_BIND map job then fails asynchronously after userspace
has already enqueued GPU work referencing the mapping, which shows up
as an arm-smmu translation fault from UCHE, e.g.:

  gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
  type=TRANSLATION source=UCHE

This breaks hardware video decode (clapper, chromium) on Adreno
systems; bisected on a Snapdragon laptop as v7.3-rc3 good,
v7.3-rc4 bad, culprit 143755bdabaa9.

Revert the default until importers that legitimately need to build
phys-based mappings have been converted.

Fixes: 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels")
Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/dma-buf/Kconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4f078a326a41..b3c581ef4c987 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,7 +43,14 @@ config UDMABUF
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG_KERNEL
+	# NOTE: keep this default n.  The page-stripping sg_table wrapper that
+	# this option installs for importers breaks drivers that build a
+	# second-stage IOMMU mapping (phys -> iova) from the attachment sg_table
+	# and therefore still need the struct page, e.g. drm/msm with its
+	# per-process GPU pagetables.  Until those importers are fixed, making
+	# this default y breaks hardware video decode and GPU workloads out of
+	# the box on affected systems.
+	default n
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.47.3

