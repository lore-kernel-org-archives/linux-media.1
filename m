Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853953;
	b=1zVCNv8AM0IptwMND8HVj6c0GmX3JDcc32xz9mutr3HZCcUIpr6mZWaYCr1AInRcyPgG
	 BQfBexJJX2xdVUjrSlrEdms9/bYpPPZAAxIAAIVT7jXNN3ldcrdC8Z68+YU5cv9aVKXE0
	 dBL8oxQ9ymhlstHRwaUeUg+vnjjsV1qTEr4S/oVk217jzlUWWxbZSOAoYth9novmXjjnE
	 QthaOoEcpSzD9a2DlASf6LP2AvBSNG2nVI7YfxV52zQI5u3OyP/DSuOT+GoBsmceogJLT
	 D9wbMoOlMUStq1iTyECRHtq5vbdyPtO4f48HrV9EjnZVH4w6Qb+aofnFSgGzsxBB8+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6Mzo85W8swCv3RAdLaxrajaoqyjLMw0IEsk0L6cWkMQ=;
	b=LmH22uGsPc1PovXZ8xPDrWqN3SQSYGQp8p6XiHz25CfNlI7W2t/FaYMrz8kiLoOzoXpI
	 28lNCmBPteCOADV+cRY0/+Sd0kd2QTWE9mLj+Egi+uJcM4OkkSXVXEteH5pDB2xufAn8h
	 Hknx0f/jfqQKLHs/UARZMpRulaloDDv69uwwPXFO+0onamrz26WI+ukeQh5J68yfTuakP
	 3DeHafRlwEeUe8m9SPlQ+oVIcJsYuwwzAAkz6bXFoy+fV5m4cKRcPdhSlWN2njNCgy0I3
	 GEYRoMIy0+FQ+1y5v/LOV3SE1p7Hj9XQJoamT1kFo3Temzo9lTglV/a/JaF7wLQxCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ntWJhQYB;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E97B606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 18:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E97B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ntWJhQYB
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a73a82a1so359158a91.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853952; x=1795458752; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Mzo85W8swCv3RAdLaxrajaoqyjLMw0IEsk0L6cWkMQ=;
        b=ntWJhQYB1yJzSH8aUxbWKvb1niSnSub2ECTHxW+LY8GnZM2AncVortGGieoM8zPtGM
         YPMXdWxPy0wf3a3kEYpSW4gy1V5BtZKQBFG9Een2W2LNqaEXxSyN+f+zdTDt07p5o+0S
         FT9UtIduOQXUWHO3XapZ/yCZMXUy0fTFZJYNvvd+lIil1ZJxkGsxHS2yN6Ibeuo7Fg4H
         P+2hKJV/ZBaE+K00apr9SisD55/YebHKMuU8VYCvSEOHaE9X6dt5BaKsnKItPWu2TEzG
         5Hm0K4CzEHkg0x2BEa8eQcTcn2RmQh1cHcmFBf+V/klCIm3VMLo3AJEwTChgi/HnglA/
         N4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853952; x=1795458752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mzo85W8swCv3RAdLaxrajaoqyjLMw0IEsk0L6cWkMQ=;
        b=jyWZTHHCoLv4CiV9zfp8KVZNAZZisho84V1pguFkxul3FpSx4ARzDUXUavZbLNZe4l
         2+x4JcHcbYVQ4BKKPXvkN8Xe84uhPKB3FYO6IXgAleAh2Iwu/bdjgTS+PYtL5rUCqq8x
         285M6P+6ICIpzkiAi/SPkdG28nOzLzbzwlZWUxXvOGHYxjnjuPg25num6mjgPJvIJGjY
         gz9KuOkpj2VCcN4mK0Dvot3OmCnP7II/QtFIRCMMKIkzfSNGsLo9xuUlppA5euIVq7B2
         EH8voW68zbzkd3thKkwRUOUc5PPrTG1H4aY0XGgcLo0q0liXXHRt3iESHrTkKHxYSmEE
         xqWw==
X-Forwarded-Encrypted: i=1; AL+hErHHGeL+x6uir84aT8WeWvVi6WiNJ5PAF0jdylS5vv55U74rFNaga0/Ul+qpv6ZQAtT7tbksdztrgPTgzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+hHeYKCSdVdeq3mgYinjT5AVhFZiw36406sw35oPzkhsQr3itJ
	6lW268gArYsNEVJWUZU6wcZVQwnyFS1gHTdHvDphjNDJJ3kfDT3TSP+lzMZtGt0FPi6i51k8iFr
	Swa5wdRMhvg==
X-Received: from plai1.prod.google.com ([2002:a17:902:c941:b0:2eb:16af:1567])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da86:b0:3ab:36c4:b500
 with SMTP id 98e67ed59e1d1-3b1b089e0ffmr12560971a91.5.1794853951522; Mon, 16
 Nov 2026 10:32:31 -0800 (PST)
Date: Mon, 16 Nov 2026 18:32:22 +0000
In-Reply-To: <20261029125143.1744481-2-phasta@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029125143.1744481-2-phasta@kernel.org>
X-Mailer: b4 0.17-dev
Message-ID: <179485394213.2938203.5775705349664994300.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
From: Neill Kapron <nkapron@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, "=?utf-8?q?Nuno_S=C3=A1?=" <nuno.sa@analog.com>, Sam Day <me@samcday.com>, 
	Michael Bommarito <michael.bommarito@gmail.com>, 
	Gabriel Prostitis <prostitisgabriel@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

> The dma_fence_ops function ops->release() has been deprecated because it
> prevents drivers from unloading. f_fs's implementation merely frees the
> fence. The dma_fence backend performs this deallocation automatically in
> the correct manner if ops->release() is not implemented.
> 
> The backend simultaneously correctly frees struct ffs_dma_fence since
> struct dma_fence is its base class.
> 
> Remove ops->release().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/usb/gadget/function/f_fs.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index c64a268e98a4..e8672b37e890 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1479,18 +1479,9 @@ static const char *ffs_dmabuf_get_timeline_name(struct dma_fence *fence)
>  	return "";
>  }
>  
> -static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> -{
> -	struct ffs_dma_fence *dma_fence =
> -		container_of(fence, struct ffs_dma_fence, base);
> -
> -	kfree(dma_fence);
> -}
> -
>  static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
>  	.get_driver_name	= ffs_dmabuf_get_driver_name,
>  	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
> -	.release		= ffs_dmabuf_fence_release,
>  };
>  
>  static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)

This makes sense to me. 

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
