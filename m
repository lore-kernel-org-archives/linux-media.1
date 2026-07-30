Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A679DA
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392851; cv=none; b=BaYLbOGkjYhOeaMVxFwFEqiY57Lqz/1ky18ZQBS6pE/psUFg7df7y/bKx1bwMETusKI9T4OrErKj62RHSvRY06IiQ3RZld/i4yBKpfKgDf6YioR3gL0SIeGpzi9Wnkm1lHHM57WZNB9WLgbryzmtpgvdhlmbLMv7Fw8MrngAQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392851; c=relaxed/simple;
	bh=2Wi3i4Vjg7+AxOlXMBs+6tkx40vpBZwTeE7t+8e81gs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGMtOPob00BOL+j/ws2Xuh0zETi1Ht2PIXkMpDwWQ351Q13sZlJrQk5/G/IjDu40PdQ3TdCo+5SrylXxMVJVrdoVqHnWVV/kth9J9mcA0sZQ+g734+HB4L7ii01Okgf++C7atC6dbr7ypD98Sl5LB2jfSBJeglM1a2stTJC7aa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+md/OeI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+md/OeI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84830c774a0so1996367b3a.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 23:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392844; x=1785997644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EaYXPThWNdkG4MwcQhWQJEAKHoDeZpU3BU1Rq69yw8=;
        b=B+md/OeIDFb8CbdHxYmcVZIAnIqqX/0PxEAPc0sODudMj5hJa4Wni0n0HSIkeB95Bp
         OoNyPiD5XHVMyvUkildU7tARTKa6Im3S5MiE4Je0AVl+o1NA3M9VabwS3zaIbyJf7eJk
         EjjDGwdWVWiLheMBQ0xx1OzybZHMbMjosGvY5W2LgssP/jbbyTTXTxJE+SMJ0ev3vB7/
         XvA9FWeAV+rEegYiiOuRHdArakbWWqeZ5/ZRx+GQhJ6Q6WbjymGwnKo12VntUBXk69p4
         sLr4UN20Z2RN3ab7+7YoDUDInmhkRT7aTDIsVPHWniJRtYBZ5TY67v5YnFn3blz+TP5D
         xdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392844; x=1785997644;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EaYXPThWNdkG4MwcQhWQJEAKHoDeZpU3BU1Rq69yw8=;
        b=rH8+fa9XQ16qvNsiZ7nWuUiqwux2lEbBMPW0RNeC4u9UE4IgxkbcWj/aZFy/ON45J4
         SYdQmznWBTEH2+p4oWMgZIHn4t/1MIjVfWV9q3CSBWVUyYokRwgiio6TD8G9u/4LqA1+
         bDqyHtL4Mn3N5naj6jgZ0DUPH8WsvIqjqmVxOw+cFipzYSeINRESdODGpK85cnLye8u0
         DPEkYaS6iH5Zl8BgxteY/bxKTNqYaJ1O1atCYP3wE4d86ixGegTIbzY3MU5MgtS0EvFq
         7wz2cH5iom0j58A9WSur5yMbSkYAYKUcWOEZEkRashXrF+Vf7KoAuAuFZCTPsbaCQQAO
         bYZg==
X-Forwarded-Encrypted: i=1; AHgh+Rql03w8ViO/DrZvooLt1EJosT3FgXLqQTojUnqMP5ROhPXG4Ygm1J6fCHY1M3BJWFMnG9TE3xzAtxtbCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQggif2DwCJiHcpWXPXTlFvI6icPX8tXHrq/X76DtS/PhnLHDL
	yHk8DJ1s8ffVdLS3WpyLX8rEoM6Coo6Pcq+BLm65lOcVnvcmVNdBIWAOKF5JmtS9
X-Gm-Gg: AR+sD136hSovC6bWjBTkEWMLZ2BAyAt6vZfkrhoJm6xZZUdEbpjzeE69cfJjIctDnvN
	VwnUkfrre5tTe09p8eWIk4MVfrVlEr3H/JdClilQDwiutcIsH3JWNw5zfWSq7tghNzTeTUVMyS9
	yzo8Veysk4yA1ESSNkvmJipnxU9HrNwmJsaHw6iYFs7mQbv2CQIdQ1T78B3Hh+AtrlJS4ImnxwM
	u6ZWnz9liquZiXZ3GmLGWw5siN1diaLuIFJ83eTDArYLgX6ai6itLTCa1e+u3yLJU9bwnLYCXo/
	4X2TdYyo6e3x4r8KDbnUJQ3G9zIZkUm4wdy8A9L79oFR2+D7cu/gYYuTQNRYacyM1Y6ySuW67pe
	RFGBBeWMc+IK3IR1FO7UWCWtRQ9TjH+rmaiwvi1JhOWpI3Y6Zu0i4bRN9OAhcfq8jr9+f/4IjHf
	dCgBb0BJK+YVj4VO+QlT65M5x96ycDDAy0xyRb1Qjp75n61nck5xTDB/t7xYY0P5ZT
X-Received: by 2002:a05:6a00:1150:b0:84a:2fff:cef9 with SMTP id d2e1a72fcca58-84ebc1ed97fmr1520110b3a.13.1785392843988;
        Wed, 29 Jul 2026 23:27:23 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea00507b0sm2503229b3a.14.2026.07.29.23.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:27:23 -0700 (PDT)
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
Subject: [PATCH v5 2/4] misc: fastrpc: don't publish fd before copy_to_user() succeeds
Date: Thu, 30 Jul 2026 14:26:43 +0800
Message-Id: <20260730062645.233148-3-shoubaineng@gmail.com>
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

