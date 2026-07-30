Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2933AB294
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392828; cv=none; b=ZJxQFqouwrpR5EO8tcCmkQ855Nkf4AuMj1H4MyBJpVh+rjLIDqarjniYa++Dbi4S8IZdBymtj9wZXF10DSBKxxFTRPyK/S5kNibj8nT4vPt3SxmRBNH7aVTpju3lOxxO+5bg98+qVZwZ/giwd3d2rONXbcW4uBVaQAxvYosAVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392828; c=relaxed/simple;
	bh=F9WeV/nxAP6fHlwe0aqZ4cby4GCtvCwnHIr/wOKq+vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0UaCP2IHx1gtSmdPv+A87jd/IqShmMpV3hxwBwYFdDVUyEs2deqQ1chmzoKR0lWz1uF7+mcyGM+RerCgefcYFDU2PuaxdkOpKJGcJ842TgmW/Aa96WGZmUHQD7on5sKxpyA/kQ+bhaYVjJvPuRnR9/Dn7O+dNrbzXTD3CYu/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCEWZezN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCEWZezN"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2005828b3a.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 23:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392827; x=1785997627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lC5eDEn/dzL9Eec299VWkBRGUg0dXbB9NQvY7s3O+kI=;
        b=ZCEWZezNOsGiTnqT16ZjJSjsoRCfm2abFKStamwvpT2x7NCV80HVGzpZoL8HsejmH6
         AjboKTKgPjnI6+u0OOEHuuS61AUuYqJ4FDJQgRjlJfCJ2Q/7sc+ycI2VvrODSo4uayk+
         Lkbn0aDowouxXG0QJI5qt4UowOvjMc5pADhMZokH4bUBWvkKOCPPJ0fhXVPHua0ZZfZ5
         43f1QUKgiL6IJf+24lAJ3r/yOjUCOOkjWXd+enF7hPfsk52aGYukqgclhFGx4JXvmqnf
         AJIjKSJZuiilyg3DcRrxJkqkBTVPezNbh7dnzupbxzpDVJ/yN/cU3Gyz9X5HdWEz7tpd
         k3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392827; x=1785997627;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lC5eDEn/dzL9Eec299VWkBRGUg0dXbB9NQvY7s3O+kI=;
        b=YaBWvv2lIwwV8fUvRyZY9mwKaWtYEAbdfbU5pFtq5fk34v4fOiOlgv8onzFl0aaOJY
         yuyLyBojA9QyqN7Q26YJNBB8MoKIzaP7nHPbTYtA9CqR3LRa8n2llOWUgH0YF7pySZCD
         KSS78ERL7+ef1RB+dcai3BfmGyucjjj59PT6UfUQfBTSP2QfpWDat8hVW/vN1geG8Qc+
         DlNgoi7wmyzmCt6ucZl7DW97DHtrcoXlNC3I1OP6e9wXK1FZyAATqiwoj0ZFW+apc9LD
         ECwp9hKlUQJMG2liCP0nbg9HPM9Jj2Y4PAvkK6fHEpqNM+voxL2Aj/EQreaxRDyfJqrP
         UKvg==
X-Forwarded-Encrypted: i=1; AHgh+RrkhK68ORVEj6EPDho9PLUKrN6sd+yMfeYzwg81+ybvYYuzkX1127J0NiBBFI44ANWdRlQ/7SOImnZKig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbhu4aqoMfTdIQ8rGVlOsB7cjt6ScCErCy5S5N6Q5iC5Xki2Jw
	ejAmPCid586c7JKc9r3XfHUUpEYsHEID71210Wm5WLfn6YJhsY8fmh+s
X-Gm-Gg: AR+sD131Vcp50ZS0vEGkoU0o0tz2IdklTJo203YZJ6NUR1pkgJfTp0/Aw9eHgeUse2m
	l7vpbGAlM7C7wue1UZxZdE49C5ZNOEhP59UzeBEBNKS0BnG0UJXogNTF33iItum8lA270H/PwHV
	s/MWKAOQKG1vIyDFGmRGi/SZ3qNSaSPT0dTeUvdPUEx9/a9ki+ohgxlgHLswwaHQB1EBka1V6Nx
	I9h0IcFgrW+HU8r1OMeLgMkXBXZ0wQDnZ8saPeytEg5LwT19rmHoXnt3TaZ3WYskArWA1v2cxNl
	Q5eXqnLyTVtOEPB+/eJ4FafZ8q1daSGUYt4k05n7LIV8umMKZnArBdSILIs+AjkFd8MrDAev7U/
	yj3yw0gkOeIJaX/t0rUV7RGn8Dna2mfBUdx5oH/HtfAZ0Dh5owjraWxhtb/qrLUq/nGa7fuxIGN
	qKTxfb3vUoBqGYOx6gDSEli7cUM98XpYOV9cKdVGUieOD9WoXU0Ucy7Ualyy0o9bvvBRZYV7Ss5
	48=
X-Received: by 2002:a05:6a00:b44:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84ebc2623b1mr1371121b3a.33.1785392821527;
        Wed, 29 Jul 2026 23:27:01 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea00507b0sm2503229b3a.14.2026.07.29.23.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:27:01 -0700 (PDT)
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
Subject: [PATCH v5 0/4] dma-buf: fix fd leak when copy_to_user() fails after fd_install()
Date: Thu, 30 Jul 2026 14:26:41 +0800
Message-Id: <20260730062645.233148-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
References: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
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
reproduces the fd-leak scenario (mprotect flip between copy_from_user
and copy_to_user) and verifies the fd count is unchanged after a failed
ioctl (suggested by Sumit Semwal).

v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
v2: https://lore.kernel.org/dri-devel/20260710105430.3059661-1-shoubaineng@gmail.com/
v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/
v4: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/

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

 drivers/dma-buf/dma-buf.c                     |  20 +++
 drivers/dma-buf/dma-heap.c                    |  80 ++++++------
 drivers/gpu/drm/drm_prime.c                   |   2 +-
 drivers/misc/fastrpc.c                        |  16 +--
 include/linux/dma-buf.h                       |   1 +
 .../selftests/dmabuf-heaps/dmabuf-heap.c      | 115 +++++++++++++++++-
 6 files changed, 182 insertions(+), 52 deletions(-)

-- 
2.34.1

