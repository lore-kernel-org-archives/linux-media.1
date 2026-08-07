Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CD441DDEB
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097484; cv=none; b=h4nDHMU97kTnfkH6em70j1rt69AeY0bE/5lpQnyAADlPVZbeBrS1IixoqO41Bk+QTZ+ZvHWubqwIltuvpEsSSsQLp0U23MlnZRN4ZB1Yr2STdy/AbCGmVVWUm2+hJL0oeVM7zxNmxFTdJBHZl8LgAevqIyQak9UrChHYtVu2jFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097484; c=relaxed/simple;
	bh=Lh9CRmCJRCXUfNdf9uNGdR9iSpJFMr7nm3Cly0+0f/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MKMAjPAi8VguJr/DWl+KQ84IPpL8kfKCdDZII3s/lI+Gyjd3EmT82bW1E3oEBJ9G3V3R8BRraUU4WtkB5SLN5FGB4ST2riNB00Wn6TgTRq4Oj1+lxTUzBa6M61uCh70fHVW+EGkqW3y3K8m7NtcNGwba6bUEuMppMllw7+7FmSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWSzpG0D; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWSzpG0D"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3246459a91.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097477; x=1786702277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQciLaflxhQrAIWokNvSZ9sUyM0S9LcjwfcEZLUvgpA=;
        b=AWSzpG0DMAhDsGUtavAmQ6Fu/fEdTz4FYk/miy2J7IQy5SOdYJxUrwi8lUy2vEQK9w
         PE48cpC03WluYAZihYrYcF/4S5yvaxw5r+YVRCKZoqu7L3m/OJ91vSUrDmckObS5IeBt
         qwImmH3g9z38q0iy7sehGVs28+iJOui0LDe0Cq4+F3kwrJwg+H/QzYIs9V4x4ocApXcP
         32+7YPUF8NwUr1txp8Hq0EylFCiIAYDgmkvkdA3yRjVFELzIr8cH2BLBCs+mYbiT1hFj
         inpWlhpgoWLkf2jN2809HUs679Eogx1gEBeGDtM5NRkIAnOs7s705ONiAi10UhNCwGXI
         mg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097477; x=1786702277;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQciLaflxhQrAIWokNvSZ9sUyM0S9LcjwfcEZLUvgpA=;
        b=MJNeK4sjmSOdAC5UXULbeQw3fTQb47PpKAQeEnmscxVu+beRXfJHRpLrY04qo+ae61
         RmcojXBbQt+EeKBMSB/Q59RXrvh2hiO6crhv/EFZxkLRy480caT/fc2kF76AGKVX7674
         n5wDDAyQJH33t3qTFQeBhNZt4Ipa94bdpQFb/uIYqkhfBp3c5Qsq6sMia7jVkshhCZcl
         /vZXdb7hMq9Chc52MnuYm17CYJWFf+dBN6KxdpJQJg3Pv0jgrMAT02vSqTXdhz4sswVI
         4blpZP88Yk1mLyPGeyz3IbpSsjLgTjkTlL5d3UbeMKPoAMu6JuwCjipBuumRpVexMMjN
         DAAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJvfCV0858SHmJuLCwUyYdx/R2bGGwqnJZbMMOV/5TgJmOQ+cW2PZnqOC3KrK1uurJveal+wRgORKN5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8E541C6aC01jdo14BXWo2xWiiiRh6/p/CGf38pr0Y9qAq9haU
	n797x1sgK9jEhALXxYB2F9ApCOD3s8Xz5mJeMYRKrGcpmHkiQTDSd8h4
X-Gm-Gg: AR+sD12YX/VFAaHazDhaqvEVzq437OFLik47EKpOl29V4fn7YnKCnRGNX7K/YpaJnKG
	xjNkxK50N09WGdvqRY/r9UXNYCOoiSEi7STtugXZFcAy9cchlI2B2aqh3NTm2hKoqwOaXof9Z/R
	SCiR3UHDEOk+3hpRX5KKJixv1bgNiOnUU3XzFXQTdS2E8J9OeSKV6YYUC8knQ6SB2sSYrn+Aql7
	ZvKzXzePHdU08xJxxTU02vFTLTu6AYJg0gbyTvh+nWgUPyNnzwMO9pCwUPtcuWPKS3fmKsk/GbP
	f99BTQ3Iiq3KWUuNYoLwV9FV4Fnep8UFlthGvsDpX37eqCh/jAdqtU7KyGfnuNI2luP1c7N8Rx8
	4v+zbszNHZ6OVH41Al7aCPmw7+IMoIERhPnpOGA5Q97uwPtP7GceWvX0S0N3xPu1y1XMZlRPq7u
	gq9IdyWEBSr6fPyhf9xDtwYdW9I0RUJLtOVss7Frg7p0XTdmRAe7KfUalu61YreXSA63Q+Bz3oE
	Ic=
X-Received: by 2002:a17:90b:4d8c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3903c544f17mr18302876a91.6.1786097476902;
        Fri, 07 Aug 2026 03:11:16 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm1928581a91.2.2026.08.07.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:11:16 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F . Davis" <afd@ti.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v6 0/4] dma-buf: fix fd leak when copy_to_user() fails after fd_install()
Date: Fri,  7 Aug 2026 18:11:00 +0800
Message-Id: <20260807101104.1355464-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several drivers call dma_buf_fd() — which internally calls fd_install()
— before copy_to_user() returns the fd number to userspace.  If
copy_to_user() fails, the fd is already published in the caller's fd
table but the ioctl returns an error, so userspace never learns the fd
number.  Worse, the window between fd_install() and copy_to_user()
allows other threads to observe and manipulate the fd (dup, close,
SCM_RIGHTS), making any "close it on the failure path" fix unsafe.

The fix is to split the allocation into three steps: reserve an fd with
get_unused_fd_flags() (not yet visible to other threads), do
copy_to_user(), and only then publish the fd with fd_install() via the
new dma_buf_fd_install() helper.  On copy_to_user() failure,
put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
side effects.

Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
fd_install() together with the DMA_BUF_TRACE call to preserve export
tracing) and applies the fix to dma-heap.

Patch 2 applies the same fix to fastrpc, which even had a comment
acknowledging the problem could not be fixed before.

Patch 3 replaces the bare fd_install() in drm_gem_prime_handle_to_fd()
with dma_buf_fd_install() to restore tracepoint coverage for DRM PRIME
exports (suggested by Christian König).

Patch 4 adds a selftest to tools/testing/selftests/dmabuf-heaps/ that
reproduces the fd-leak scenario (mprotect flip before the ioctl) and
verifies the fd count is unchanged after a failed ioctl (suggested by
Sumit Semwal).

v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/
v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/

Changes in v6:
 - Rework the selftest (patch 4) per review: extract a count_open_fds()
   helper, fix the copy_from_user() comment, fail (not skip) when the
   ioctl does not return -1, drop the bogus mprotect-race mention, and
   reword the result message.

Changes in v5:
 - Add selftest (patch 4) reproducing the fd-leak scenario (Sumit Semwal)

Changes in v4:
 - Add patch 3: drm/prime: use dma_buf_fd_install() (Christian König)
 - Add Acked-by: Christian König to patches 1 and 2

Changes in v3:
 - Split into two patches (dma-heap + fastrpc separately)
 - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
 - Add fastrpc fix using the new helper (T.J. Mercier)

Baineng Shou (4):
  dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
  misc: fastrpc: don't publish fd before copy_to_user() succeeds
  drm/prime: use dma_buf_fd_install() to preserve export tracing
  selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test

 drivers/dma-buf/dma-buf.c                     |  20 ++++
 drivers/dma-buf/dma-heap.c                    |  80 ++++++-------
 drivers/gpu/drm/drm_prime.c                   |   2 +-
 drivers/misc/fastrpc.c                        |  16 +--
 include/linux/dma-buf.h                       |   1 +
 .../selftests/dmabuf-heaps/dmabuf-heap.c      | 113 +++++++++++++++++-
 6 files changed, 180 insertions(+), 52 deletions(-)

-- 
2.34.1

