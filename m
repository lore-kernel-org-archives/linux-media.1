Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACEB527592
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985261; cv=none; b=etsAYcjM8JlmCI9/cT3AVxBJfECVcU1J/bJ7TqJDeKb7/j0u9osf/eXeWBODuWEgFs/ieP+8yjYLRpUP/w1FGhbxcr47BRWHUys42i/xcGUNbA2VL6H7kTITDo0/VAFkCYWxcPWUm7wGxLLr7HlF5HQeGD9NTBl7jTJ+m8qvD30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985261; c=relaxed/simple;
	bh=CWLcIVm0rcAVB8dmp3rQdpqenCY0+xLEuROFe1QppjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8auZbdneTXW+oordqfWg0887CyGzo3nsnfSPty1KD4nP/vsqsFk66mOL6f1RbFs7Gy9NJequz+VQclcp5nTHmQH+Qgu09RyF2l8Cx76UGgZxWPgB+HXcCRmMWMUWhG1pPBu2/LiizgskL5m1oJMfRXyvQ5BRlQWn8aS6rcUjs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=gPI9alNm; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="gPI9alNm"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-81ae6aefdceso822224a34.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 06:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791985257; x=1792590057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TI1InYuhv2BOMB8UNQLzhmzx2APX9vyjkfAbRr4ddfE=;
        b=gPI9alNmPHQzLVLHa9pr2LsEq59R3xmYYi3aYPUB4nJpK/TlShKZN3qRu7UuBzZ5GN
         rLp5k7SQj3N+BcoPU4ap/kbLyulaqvsdxSrDQ4J3Y4INe5RJtvCbJV67MdbUhyZ5gGuZ
         gXN/96s4JTU4NX8tbZ9rmVfbI6LmG7CQJMP5OVgEH2czMNVONaVKQxiCUVya5bTdIRWQ
         bY8RUn2QsLWoIIdH3MfpRpn0CeWb+xb3XX2dYy4ZvGwKOP7YKQW/H3b9hcNE6yLr3SA8
         mh+tT73rjgL4HvWbZioWZNQx3+4RtcmgplYAfZIJ/Wri4sjMpRgXFErsuyDyXUFFs80A
         0dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985257; x=1792590057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TI1InYuhv2BOMB8UNQLzhmzx2APX9vyjkfAbRr4ddfE=;
        b=pL9+0G1wxHQXrNeuPzYDTDNbv7UyM/4wAv4yHoIHVmd5OdIzF1PYx6RZ6uLXYkyy1V
         D+ixza3lRO3OKZftJHB6JrEwVvZ+GM7mN5Jpvfv2Ub3lm4WrxMqS956PxnSnY0xR9M59
         cy4FNYnglzwcqZl/jh5Hp4wR0R+il0eHT61GIPIS35yLTp2oEfJ+JYsxRZKck6jxssFI
         izJSQlMm14j+XX8KRAXVvuKXROHMg0XRXwDqmKlNcm9hegXD1CFZkSj21B+64Wn1kToO
         Iku24UeA5ZAIhRXPopViYUCnQ6QvBIZIUbFuuSZ+9GqptSwC1buWv9t0YYxKK6ROYtBs
         zWvA==
X-Forwarded-Encrypted: i=1; AKwUvBze6DPimUl03RdoBxX5XxDz+4PtMpqkmP+WmL9/1LUQWxbhUPYR/KPTtqHyuNltO9XEsMFO4/+oypkktg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5XfYJyxdfsldWI9JWmLqC07AM5O3gwsRJelnAkAlMbXsGOC7e
	qtDRefK9r6gRio5hBcnYWnbdqpY5WfvTWtbJx1kqsF0iKZhVDCKvrwJ6cbWRUBSSV1s=
X-Gm-Gg: AYBFou3MnwyTRybpF9hg6CKKIFpNjNmOcd3kpO5UET6V+7M2cW97amrivBBz47tq+68
	DrxRwX/gi3ENgsuKYlbA/tyTyEJqQThqE0buyCkwavkcS9sfwc4slvSmY7bgcSrqaNGtop+2v/b
	GPLCHI95V5aAouk2D3c5qCqIarj+DuRjNYBBGT7Fm7P/V96DzJ25yI/70BzTofN7PbaR6w0QlNO
	4i/oQoPuC0xmUDu0unwyCUsyvRN8TT5ObpaWWRDW0XMuwocSSaul7p67SYz8JULkZs9n92NMfQE
	sXtYPRgjdD5hkBLblu/V9SSodkTP+hSGrhvfh9Lt8NKFaaOtthlCmZZbg8fshpuPY/pMsviPA/j
	xMSvN57SOluIgWV7vout8NFhCS2pQLYI4mRo2+BdTokCJUOVvAXvYi+SPV49UfC17576/Fkx4Ht
	QjWxA4PgGQQxgJTXmKFtPlKPYp14NGDgGr1MWU89UJGvW9fVgDK9wmVCWl/EgxtrOcWxhP7WIbD
	9H1nlTN9rC2eFsH48YK0yLRqDZhGd3VUDA9ud7lA2O8AoI44VgQg9urLA==
X-Received: by 2002:a05:6830:67e4:b0:812:4cc7:4afe with SMTP id 46e09a7af769-830969d183fmr14838309a34.17.1791985256814;
        Wed, 14 Oct 2026 06:40:56 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f822dcsm14657364a34.10.2026.10.14.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:40:56 -0700 (PDT)
Message-ID: <81e6538c-977c-4b45-bd44-242ce5e00dd7@kernel.dk>
Date: Wed, 14 Oct 2026 07:40:54 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 13/13] io_uring/rsrc: add dmabuf backed registered
 buffers
To: Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791975048.git.asml.silence@gmail.com>
 <4aa230df871ee275536f367087b44ebfebb88cc1.1791975048.git.asml.silence@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <4aa230df871ee275536f367087b44ebfebb88cc1.1791975048.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A few nits:

> diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
> new file mode 100644
> index 000000000000..1a1a88640823
> --- /dev/null
> +++ b/io_uring/dma-buf.c
> @@ -0,0 +1,66 @@
> +#include "dma-buf.h"

Needs SPDX license header.

> diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
> new file mode 100644
> index 000000000000..a876a9e5e272
> --- /dev/null
> +++ b/io_uring/dma-buf.h
> +static inline int io_attach_dmabuf_map(struct io_kiocb *req,
> +					struct iov_iter *iter,
> +					unsigned issue_flags)
> +{
> +	bool nowait = issue_flags & IO_URING_F_NONBLOCK;
> +	struct dma_buf_io_map *map;
> +	struct io_buf_dma *bd;
> +
> +	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
> +		return -EOPNOTSUPP;
> +	if (!(req->flags & REQ_F_DMABUF))
> +		return 0;
> +
> +	bd = req->buf_node->buf->priv;
> +	map = dma_buf_io_get_map(bd->ctx, nowait);
> +	if (unlikely(IS_ERR(map)))
> +		return PTR_ERR(map);

No need for unlikely() with IS_ERR(), it already includes that.

-- 
Jens Axboe
