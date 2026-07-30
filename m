Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165843AE6FA
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392862; cv=none; b=aHbx/sJvEaQyfU3mzCcnEl4EcZSAW3IdSs7swLtf7iLFx1tfkTyb92rIaMHURi4KxSDT1+XmumKso5vf4XMwwt9Vmo604ZjkrysiKrfrwyjFIj631N0XZbORiTv7DRA3B83C4wmb2EY9UsN3eriIjfGCp2k9QgnWCOWjITBCgmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392862; c=relaxed/simple;
	bh=kYA5RbCeLTsX+J20uD1xRq8xVWSem8VdkEpw2oXKluk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQu0u+Cp1WCdtYNa7XMS+X9IMfuWtWb5/d4cgE3Jw1YXeWeWlIG01JIQMWARtlz11TEKe7ZNEysVRUS8a5bmTS40+Jir9koO17pRmXxR/+HxnY68nhpwUmJ+yczSbER8aZH9j8tuFQseJ8eEaWK1qATgGwD1pZbwLskHJDqsBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reNNwZYe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reNNwZYe"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1415286b3a.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392857; x=1785997657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8LdAoJKwXyAPy2Oxe1p5of7f27uz/x1w5QiaYqvn624=;
        b=reNNwZYesjpvC76UCfU2zuL8yfRblMERL6AuVqksGFpoxqKKu+KMedwE7eyEJ8UGVn
         Ipr3fA4Tm8vcmkl0kvgHjErufyZoxYs/kkM2D043fEjcrAa9wnpJ0xPqUCB49bS8SnFT
         Q7s+xr5VLLoZgy8pQhEXrGgf2/TPqTGpKJqMwGxR+mEN1xtysfvuca0WBDfKjSeL8xnM
         M6epSfnif3J/mtLKBR6SOPjMpqvHFkQMUKQhJui3QeJykR7smz4tMJ0A/cjDH7k0QCPV
         FnB2itZui4LNaOHoO6D/6B5dWjc0odCUauPfYrmzPcqKM6p28VfNUJMoAGPe7l5C2qqI
         D0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392857; x=1785997657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LdAoJKwXyAPy2Oxe1p5of7f27uz/x1w5QiaYqvn624=;
        b=VO1CU4h9W9+Fm8PPjmKIGgvVHOIC4w3785QhfO/Hewy2uVjoJ9T5MK2tNBuHeHQ0+z
         nQI/LajSf8xgTZT1P357YI1ezpa0y+Ay7Jl0dKM2L7Ybtlq12oHwig0u4YGKTzykx91/
         X1She4VYj+Qi5af3AjfcFUu2xe/8Lk6EEkwPpia1Dmptw1Bzcv6PSaXCiIMKPeH12gV7
         oHIeyy7mzsjGNJL4/tl67jIs4lxGBOwgAQrHz9R9KvDYj4hXjCaExB0mv7DnXqLSPHKp
         +F22TFqzf9IakqkpR8j/uGq/9pXp+gxYsMyqJjE0fJe4oVcZaKbz8IkUIDry2qF1xL51
         nFxQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4PyVCEzRU8+PL0lZi8ScwxIhQTL7IryQwtr6s4NdXTfX6iZbsOeneUcDvC8Ler2LJeKRaAYAmG0ovTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjz9h78fWkmqtpCr4PqenzrSlLG8pWpHMz/oPB2K+ErkCvqs/X
	jAceSWT8aooz48SHPt08MoEEqLURM9QIZkHMEy37Ce/NjuK36uZG+Cjz
X-Gm-Gg: AR+sD138i7gAVtxcdOvi2jqyJrZ22gx5izhq1XgaBUpbtiR4HKoD9YgMkXiy7DwZHUS
	k359FXBk5uvGgzCownINCKdo9+oooXjypCQN1PvHPG0cJ8YkeBvEz4+TSkydTgGDwwC6yESULTR
	yHY/4raPV9qsI3q80ojeMNCdejxhJRySU5SFYCiMBi0OGqoWHRSCfxmpVXt6TKrwuUACq42BEv/
	dCVvl9UQLecCj+eeZ/fRwm9nG85UoqXFHmjCCLY7GxhXf7RLNfG8Hg0gj7nE6csiuK3xPTZEt06
	iWy78T/5s7M8IQuc537Maws5igtPn7hxofgYbB2BSZmq5F1+YhjKcFSHxYlWxcYiuer00qhr1GR
	9yrkocPmxxnGNdBXT5UdxY3dkKkY4rOTGIjyFHRGeznKNAes5fL0gEFhREkqrZYOLsvG+klCzLJ
	poXU7MSdFdA+v3uqQXSbMcf9Z8yjCkc4EJ/GUktkI+c9heT4jj8Wf6ts9Fr9U4uY9DV2gjSLDhF
	J8=
X-Received: by 2002:a05:6a00:2e87:b0:842:5da3:9b89 with SMTP id d2e1a72fcca58-84ebc3e1d64mr1491102b3a.38.1785392856941;
        Wed, 29 Jul 2026 23:27:36 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea00507b0sm2503229b3a.14.2026.07.29.23.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:27:36 -0700 (PDT)
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
Subject: [PATCH v5 3/4] drm/prime: use dma_buf_fd_install() to preserve export tracing
Date: Thu, 30 Jul 2026 14:26:44 +0800
Message-Id: <20260730062645.233148-4-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730062645.233148-1-shoubaineng@gmail.com>
References: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
 <20260730062645.233148-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drm_gem_prime_handle_to_fd() open-codes fd reservation and install
using get_unused_fd_flags() + fd_install() directly.  This bypasses
the DMA_BUF_TRACE() call that dma_buf_fd() emits, so observability
tools relying on the trace_dma_buf_fd tracepoint silently miss all
DRM PRIME exports.

Replace the bare fd_install() with dma_buf_fd_install(), which wraps
fd_install() together with DMA_BUF_TRACE(), restoring full tracepoint
coverage.  No functional change; the fd lifecycle (get_unused_fd_flags
→ work → install) is already correct.

Note: this patch depends on dma_buf_fd_install() introduced in
"dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"
[1].

[1] https://lore.kernel.org/dri-devel/20260714114654.3885457-2-shoubaineng@gmail.com/

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 9b44c78cd77f..fe3436d1235d 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -524,7 +524,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
 		return PTR_ERR(dmabuf);
 	}
 
-	fd_install(fd, dmabuf->file);
+	dma_buf_fd_install(dmabuf, fd);
 	*prime_fd = fd;
 	return 0;
 }
-- 
2.34.1

