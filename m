Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC131F9A5
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943120; cv=none; b=FDmiN7G+qQPloDez+o/52Uastmn3FlZQsYXpYz1ER+PfvPBfdvf/NoNAQA4PLK+GRnDHs1IjbMZdxpi1InVGpwn7HqiqcXSPqGWdgj/2i+fwoS0Q0gSkesGKIpAg4cL/oVjlTIjNIExTOf75JI/eishh/89owVueew66ZIJ849A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943120; c=relaxed/simple;
	bh=ErYC+NBUB1uSMVe7dsSUwt3ETggiJBFdGT3p09rSUlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L1iqM+XubinXmhJvcRT7fE06luZCdX0UC+RxGa1aj83MJRVcey62KB4laPZToxOX7y0EHD9cejofGMRwNszV0mzJ1QYQz/coMTanPVJD/pZrgfhM9vfwXCNkP5iK9MdZdPCPKpu22G9RpWm2NvjDYjgoCDRIl7JyGbKVE7PRjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2iYdAev; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2iYdAev"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2934843b3a.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 22:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786943118; x=1787547918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA2XmPl+hovwGxL3ai/U+yA7AWOU/owR4IcUEcMXDYY=;
        b=O2iYdAevYt5f4khFQNgP5bu5iMekzcpaFVoh/eGfulEMTn9UNF+KYNGAj56vk/Xe5J
         uOOqtzH0EO6K7p8vNfUw9vJWjI/iHDdhutTGn/6TjBk1+WPzXKvgDVijfWZZBruDW4tR
         nkMWI+ZGTIV3paoQSx9VO+ExdUsk3Qrq9vn3DnRlS9mrNyNM7ynhOx1ClzwwlaNY90w9
         RB5dg73VoVq7hJs4DkKG2nQMvrHPNYxqdxCe0l6aIcFQNVNgkirANDhegr6HaKDjeaPw
         PGrcJ85cMgQamjtj6dErJWJoJ/339Q8MGelQnQYEvPbEl8D0pDsCaqEpJHsXVXv50CwL
         dB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786943118; x=1787547918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA2XmPl+hovwGxL3ai/U+yA7AWOU/owR4IcUEcMXDYY=;
        b=ZaxmBvQh+57CTT2JiGXZhKJHP4pTfcvppUg2RehFVC293veFksQzu5to1XSjqmdsDk
         tUMlK97rdHqZVZQUvCOMr3l+8+nwSiZgUZyCmSTx63JAMaIPa85BO6Rg2nrWxFgxEL15
         WGK61/TVrwA7sveOiE3NXMAOFBkfDArU/VZhuXoYycA21qoWegAm7kqli+TT9yjRQtfJ
         UPF6lqY6n/ooLTS6rYGq6/qo2/BjpMM5x+gG6NWEpJ0v3SMynnxu/Wlmg5hm3+afu0Ve
         INCdsLeeVfYrPf3e4IA7wdWGIC4H3nVBaRHkA0vlqFXWF75uh+2byC0cWpOy58a/1kGr
         H7+g==
X-Forwarded-Encrypted: i=1; AHgh+RogcVOGM78s+Ro94mLCvlDidk8GQo85J+0gqa5y2R6W/+0v+4FHJ+PH8rzdZeCk3zFRvZbxWA/Z3hxOIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2TBpgy+3YmT+PtP0lkfbJX4sCP+81gKTvYjCkI4NT88nY8us
	5tjIknkzJGj8ZpgZZPwnTb6w7We67TBzZ92Qgp4uUGctZF9EU9VUEDzX
X-Gm-Gg: AR+sD10WcG0R/ztnnNdbcwnSP5ZhkCBafjvsSn+NmFA6nXPyl9NVwQlxV9vs9aPROk7
	fGftEbGspHg5dYjaf6ds/t8tQelrwyi45NlRD4gc4s71UA3wFJdUPa7s1S82sNW6jKJmhWeGV70
	k/Wq0jp7dswNprF8AjrSkLLXgBrTbIuDHf0Owvz2oUUIcsp1YTBiWdTotXA+3hjnaiymw6MIONg
	WdcE0+eZFPYiRxXgRvMw964aBgEvD1mjB5e0ao+zBLosOtl8f0p1v9Fs6eFngbJGulHrKsy8gSO
	UTu8sOzUbySFqoIQ2m/WVmSUUFNzGv/pmrjVn50n3juIzEU1xVcuUxDJ7S6VyH6fz4DHraaJePX
	GnSGjGlyxVEkm7xg4vUwSEIEM7bO9FQAYCDSq5tjPuc1N4DbJa/vTsDXtzVl+llEhf7uWmkeFYq
	sJeLKSXXYKpQt58o+lqgs2SGc8NLrk1VZetxSkO/KMvFeNKrytlxI7UN8aGUuYtm56
X-Received: by 2002:a05:6a00:94fb:b0:842:5da3:9b89 with SMTP id d2e1a72fcca58-84fde3e397cmr21923062b3a.38.1786943118310;
        Sun, 16 Aug 2026 22:05:18 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d267310sm2131036b3a.53.2026.08.16.22.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 22:05:18 -0700 (PDT)
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
Subject: [PATCH v7 2/4] misc: fastrpc: don't publish fd before copy_to_user() succeeds
Date: Mon, 17 Aug 2026 13:04:55 +0800
Message-Id: <20260817050457.1005285-3-shoubaineng@gmail.com>
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

fastrpc_ioctl_alloc_dmabuf() calls dma_buf_fd() which installs the fd
into the caller's fd table before copy_to_user() copies the fd number
back to userspace.  If copy_to_user() fails, the fd is already visible
to other threads in the same process but the ioctl returns -EFAULT.
The existing comment in the code even acknowledges the problem:

  "The usercopy failed, but we can't do much about it, as dma_buf_fd()
   already called fd_install()..."

Now that dma_buf_fd_install() is available (introduced to fix the same
issue in dma-heap), apply the same pattern here: reserve the fd with
get_unused_fd_flags(), attempt copy_to_user(), and only on success call
dma_buf_fd_install() to publish it atomically with the tracepoint.  On
copy_to_user() failure, put_unused_fd() and dma_buf_put() cleanly
unwind without any user-visible side effects.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Cc: stable@vger.kernel.org
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/misc/fastrpc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a49384586d..c5143cd25767 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1709,24 +1709,20 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	bp.fd = dma_buf_fd(buf->dmabuf, O_ACCMODE);
+	bp.fd = get_unused_fd_flags(O_ACCMODE);
 	if (bp.fd < 0) {
 		dma_buf_put(buf->dmabuf);
-		return -EINVAL;
+		return bp.fd;
 	}
 
 	if (copy_to_user(argp, &bp, sizeof(bp))) {
-		/*
-		 * The usercopy failed, but we can't do much about it, as
-		 * dma_buf_fd() already called fd_install() and made the
-		 * file descriptor accessible for the current process. It
-		 * might already be closed and dmabuf no longer valid when
-		 * we reach this point. Therefore "leak" the fd and rely on
-		 * the process exit path to do any required cleanup.
-		 */
+		put_unused_fd(bp.fd);
+		dma_buf_put(buf->dmabuf);
 		return -EFAULT;
 	}
 
+	dma_buf_fd_install(buf->dmabuf, bp.fd);
+
 	return 0;
 }
 
-- 
2.34.1

