Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF441DED3
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097515; cv=none; b=oxxnIdYRA3XjJJgDfdGltnbhLN+6OrrpA0Lax1Xpwo5ZmH2JJvD+doi1KpTs6qmPOG493u7m/HtSEps7K67Wmt+qGjgw10loohBPFZKoKjJGHGen+qqZDnE15gzm4lcAfCJu23pu28f0U3VGk6iZfTdlxPfh8bqzyYyu63Jxamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097515; c=relaxed/simple;
	bh=Lh9CRmCJRCXUfNdf9uNGdR9iSpJFMr7nm3Cly0+0f/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANiqEm8jomH9VnXHmHwga97ALLbv58tndU1SxCO59tqlNCguPdDg7yAVK/Vy7doQ6rRoZXrXHVu2X6+ZJJVN/oTSIhO3F2D95JjAv4edepyjElIzQWAcLKHp+41t7aRBXPw2u30kbNQ2JdxOVjvv/sqKbcE8NQ2qcRT49eGSgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoXy8lH3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoXy8lH3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848761b5897so2267662b3a.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 03:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097512; x=1786702312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQciLaflxhQrAIWokNvSZ9sUyM0S9LcjwfcEZLUvgpA=;
        b=VoXy8lH359lnFjeT0As/fNGG0GqQLH0x2AVeKHLFPZTPPa6LVbBuu4RhbtqYTM4oUn
         Qb+RnaIplme2GT/JmftDDCqsBKmFRPvB+yvkLjjgD0+vcRHq4t+j522IHgBvgdxPibC8
         kLtYLrHhsAlxslOaCZTiuJRZX7yzmm51ElUjaSRGxMszhJ0i7o3deppY/arwWSfL62fJ
         xC2EYbnpGwC2uoRaLjTjrqeOoJo9nfgEEbvumjN9I1OGWA/OT8z592cmu1zdi/Be5VMf
         fwRgBEybTLsImT6kq5yU1mImNm9stv+omIJMrzlTMt+xBp+iH8VQiCW4Q6b4ym8GqltR
         //Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097512; x=1786702312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQciLaflxhQrAIWokNvSZ9sUyM0S9LcjwfcEZLUvgpA=;
        b=VjLSdYtInBembf1SMl0tsL7riSGX9VBHGF/UViCUNm5KkLMqPwz6ohj0LrQkshh4sK
         AbyqUFgA1YERpQ63HCEJiBFjANmeiv5VuoA0+4B9f3wqEvfM63ShQtQYf9cm2GBGmRjU
         w4kfEvglIsQG0o7IC8y+gMOGlbrC3vDIDanVhooSUvzhVbMsps7WPaQlp7EqsgBmk2ar
         t7ZZEH0XoogIdI0uSjgR7T36gUyID+QX4fSZtY/eghF6fvbih4aTQrTVxKlgY87LNPRI
         sXocT+EfWMYAarl2mqdNVgsVFecSq9UsLNM2/y5Plu+NfFPMNIyVdktrJitzxmGWJTwj
         2NgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrS7lmmx2OjEDIz4/0q4+ahFI5She9UNvT9kVuHCSBvHa4MKqi4tPfrdyjC+Xm8MSnmcFxW0pEBKiLhhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1K99mOpka1PC5USbUzR18QxgRFq5Wa6FOkDlq7Y6uaqPAuq0O
	gxjqdxVYIsrGDe8jOoI1yBCj2VgCfYWSMSwvjuU74xJdpAM05g5l7Eby
X-Gm-Gg: AR+sD11B+yNfTm+MWaN5SgBKHyHPr4HgEmkyQ4Rod/oEL7iJ7dvzDOGlP45WtOgrUeJ
	KiwUP8zmEmmk0j/U2Z8mpYwSn+Q6Y9Ab+DDtlvyRGXEjHGlr/wzVX9qi4cLmWixI0VsZh8/DNsk
	I/Id/ycbeozra7CkR1kSYgCbw401PhgiOhohY1IC/GnXMOLNnGFvnRFo1heykVZfKn+qfsJIaKP
	3KteC7Brd08OuPkmnK/Os4CaAd/5vxgyySPM3GLMr85S0HNWrMkKbz3wfw252SRY0Z5IJpsEFap
	EbLlkuZE31uEMtozEcGFLFzdaFNOC5tlJnYkLCl+tgcHb8qfFBtJWHuhcYmp6qlsREuh4uvI6v5
	cyQuyhARWaipOJl3tYmwXJMHfSLS3TxL2Dy/RaOB9W31h7FB9XAM/kKR9iTbwD7bm5jmpB7MkoW
	nTYLV9Nhr/bE8yVMwwOft6Mt8Gh9ow/BPx/57h1fitsvikwN/UJd9jnhQJKwllhsP0
X-Received: by 2002:a05:6a00:2999:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84f2dff1913mr26379534b3a.16.1786097512040;
        Fri, 07 Aug 2026 03:11:52 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5528adsm797510b3a.45.2026.08.07.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:11:50 -0700 (PDT)
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
Date: Fri,  7 Aug 2026 18:11:36 +0800
Message-Id: <20260807101140.1357218-1-shoubaineng@gmail.com>
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

