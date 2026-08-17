Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E6D322B8F
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943125; cv=none; b=SsDwQOW8z5gk0twcKtBOy9Bf8cMZe9VrcBbNIuMOLugKgg2P0jGLasm3wE4SL8x0sEM11nvbLjv9fAnoXSALyELMHDQCik3np5xKQ8/odB9o21/n+koSgK/8TKIzNZrOBrCJmEWF9yTBXK1Sc36pX0xoSk61KCkwThVh942L0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943125; c=relaxed/simple;
	bh=XyfkbQZ7xpA0fIVTmvCcxzb8iQyPGQl8C+uZaIEtryE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6Z52lGTEXnxyJbQFHH7Okg34OaA69dY0EyHcbCxFiY15EkZE0BiZFa6kCPeKLQKQyY9+SjVKhIY62Vw0ZwQPGrda0Bie+JsGmv/p72GrngIJdNE+X7YC019EicmaqNVJeoXSkCkOCnwqJfJlsvUNfwp5Jk9744CdWuXJ67ihjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqrjZPQn; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqrjZPQn"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so3092382a12.3
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 22:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786943123; x=1787547923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TnRbd61Koh8fAk6B/yQ0KzLTDaUh5Tr2u2+ZL0OT4NI=;
        b=nqrjZPQn4gWg1T2uIQD03HRwSp6nNMs9LOYTJbOnJvcvLViv1OR6BPI2tFwbj4G6wq
         3KXdtiSKS7VC0OZtN7ZlbIxt4kx4xven1VX3AXJVx3RYzhpdMiKuN2v+2ujlgwJATzpg
         3LG7UPZCkWQAFWHemuZRJ/Bte3pc3pGYwL6596KHckUGuRqUZdXgmVB1Tuhgmi2vCyFJ
         d7blS8iHjAAPC4SjmwWGllS2QA1d/OKynrSD8SIBmvnp2Wmr4mwcALiwEjQ4HI0dhrYF
         n0tUhcEW4HiEDsNk+aqq4W87BmlTBMlnO9xSk8g6hmC5+rfeax+RUce+15rn2f22Gbg7
         W7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786943123; x=1787547923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnRbd61Koh8fAk6B/yQ0KzLTDaUh5Tr2u2+ZL0OT4NI=;
        b=r92satH+FX/GkPB13sKjJmID9i/wIgIy1hKDreyXhzhZ6rLVznIyparskmzLGJ+diY
         O7L1whawE37EAAnRJaaTRVyX5tMqKXR0etoCea1GK70nDIWa4qULaL/7z3WWq247zDey
         7XJB2CVDh2velRFYZ2cfmWSlq1Ri80vufrVClDaN8WeDsfEMlRP8NxqxvjANJ0qkJuOZ
         c/oEg+BF7SHyGHDWvh2sIRsivbvle26GsY62w5RcM1kJa8nDZQrF3+HbyMF7ZADPQ6Q6
         99mya3PrVskGVu6siXTNe4dXXSvVEzukfjNB/+AMIX9B+UrJXPpT8UcS/0xS/HQZxnO1
         4Udg==
X-Forwarded-Encrypted: i=1; AHgh+RrURmCivvKahnZ2Clc0oDOcLaymUYOQ0YfTIfVFTaPq7LASY0ELlfm2x0sYdmFo/SE4QlTFPbUnlCSHjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLaLhTry/Y8DviyZtGbsdzv4K1q99LtI0iJ5g7rYIh9UDHWXoc
	Mz3+rmDZoG/rzazdRH0i7YXv8E5aQNa4nrgvZJxFV9QW7ahPj5gFFU9E
X-Gm-Gg: AR+sD11ZcfZVZb/7hiIzZc4B2EHBoVQmhL3O92Kkl0xQTnV2dX/diTX5QFS0EW2wA7W
	hbEGRJJcd0Y3UMm/bqtl8JQZP9zf2yXz2pEckgAC30EdzGR2tCYv8vdz7lqTQrwrJOemS2uqgqG
	30RfVwDn8/ZKsBK4HmFJrWZqiFhluYhLx6FgXJh6QNSL87N5K4vzoIKiY0aTKqfYr0bD38Ohyyy
	6MT51kZvbN9heRQThIzZR8QA+ZaGU5iDtwyevYZV/uu2NUe03hHUSEtcVkIZIJfEOcJojTWXcjU
	KgfJGSZjIYkDoXnlbKr/MoW5iIlx94CE8qqk5GOrdOSFGNpb6EwE5CRJUHHhIG/14l3TVJatIaO
	GaJ50ydY61bon0H1YwRIOzpjOjImT65bptBfD77vTZVFqSTe9IDVadutP9NLTcB2eohk+9WKPHp
	Ds+2qWmFL51XnmlvLt5kmJkvJ1MIJc+B6Vh887BhEMQR20EoXPPRyBI1+O9VB9FtM6JhaPcsAwU
	kQ=
X-Received: by 2002:a05:6a00:3907:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84fde2ded84mr22165983b3a.35.1786943123096;
        Sun, 16 Aug 2026 22:05:23 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d267310sm2131036b3a.53.2026.08.16.22.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:05:22 -0700 (PDT)
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
Subject: [PATCH v7 3/4] drm/prime: use dma_buf_fd_install() to preserve export tracing
Date: Mon, 17 Aug 2026 13:04:56 +0800
Message-Id: <20260817050457.1005285-4-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817050457.1005285-1-shoubaineng@gmail.com>
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260817050457.1005285-1-shoubaineng@gmail.com>
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
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
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

