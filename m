Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B94E36DF
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 20:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836474; cv=none; b=r+J1zGyw2SnpHTikJ/efYQFFVPpJMb6r8ATYlRo6ZsxqA0ylEkAUYyNqkAwfsk71/rgWiiXGABgz2BuYdZWLaPx2FKmWkGsnzoQBdLnOb8aojv7anVqlOT+WQpaBmtjCIGwfUkToGa1ztQy16pgyaZkngoarUkEkNspFTM/5gWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836474; c=relaxed/simple;
	bh=7UIEB3A73ofI1JEPEVW7u76mIWqiduCC1j8GOZ2rTrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lisT8AjLhPXhPxSDc1m0qIRbb2EfWT78pZtp6Eb/2mc/4DoeqKk/hDnkI0c0TLpU6awiYt67c+xJ0+WDYB6r8XN0jeaIkaLUW39+v+vOw5SfGd/fFlkueZBms+adHrpnTIUES5AMFKM3lzZ+grSwBBd2nfv6MbkNuA84/fbcMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Ge1m9jFg; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Ge1m9jFg"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6d7e06dbcccso1385816eaf.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791836472; x=1792441272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YdOwQKvIOtKNWjhAuzTAXTxb0yaTLWKFCpvhJolByA=;
        b=Ge1m9jFgPccwqtKXKUzf/OW9C4i080feo3eBI5G1piO4dIiQlPKXOBBUT755ax1gLG
         2rAk/BfSyoVo8xWiUu1wnjV6MQB4ykAhBn9bQu+X2AqAxrLemYRv+FoPbfSviQRNR7ip
         qEbWoBIb15TveaqSvYBMtNhG+ngUuE8RebMGyN5SE4ZzoIC09vjhs5ESts7cHlzW6zLN
         aXKlvHBCMTFdZZJSBxHXSMlP4FEGJuLdjixGHuF7r3QNTh5nsWJ4r8VuWvV5tBYG6CPp
         +t11drObYH8uC27P+QB2iYe9A6kVC7Sd+gCo45J1Edt6SozQ+oTDEOSyDzDxZZK/Gm/7
         ohTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836472; x=1792441272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YdOwQKvIOtKNWjhAuzTAXTxb0yaTLWKFCpvhJolByA=;
        b=DwDCJPOKlnv2YO4fCEgqbKNImf8RK7sNbNle37ZLIXO1sz7mgF7oNblkkQHzYuzDX0
         XmecLKyk7tGyDzM+Tu/l99GEqVnEl76rI5KVbb5x7JBjaI439ZWYYyDsM6JNVxOvrSx0
         cxmR6tj2jPbA1+gBhbkl0BL+0Xd0XP55mrHkHOTyjJUbTgLC3JIVdftE936+t3fekHon
         TlCS4QMEO1Mpg7Y580C0JNoj4dpv6hPrZAJ9sDMJi7X7Q41gqP8MAXx5QblbjPBgoJ8L
         cXMOHi0fjYN1piS2J3ivoV9cbdzE5M5De3RUCGFz4A3uYi2QvJHKcS0BFmeU8LXqgjGD
         CAfg==
X-Forwarded-Encrypted: i=1; AKwUvBx1V2hG/oaYHJYL5LCVINYywTn3aV4mlRqS77P0tAOJ3eS7NMvwgLoMHTDwve4xGKl+UinxFU89JcujwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKMdf5dw6TCzIbwkbyiVkcX2gd5Ge/Fc9iDxlhmVPu9lNN8yfxQ
	FJ3UJf4kHCGMdzGDVkSA2b2beQVZ+DIJvkG0Qa+BXxWKzwWk/tb10owoBJEm7W73yKk=
X-Gm-Gg: AYBFou3TtrX28YbEN7Av46ZH5RBkvESmtcU634O7YuwXg6IvbS20xGBPDS7TAvNozuS
	fCltcqUOslkPFtnnTBR+JyW6XBwGmAprK59Kps9QUwm8eW9e/V4of2/LdEPN4FqVPUX6NHnY2Vw
	RPj464nm2d9FE+6OLBZHIVq1l4hq/hjR7K0Q+xvP/dViCH5kPBAQU96SyV/loTC9W7Hn401HoZg
	rmy+AZM3T1w4PElh++g69CrtO2GBH6/aO/bn5Gof0kCrBfS0iwz6oYcbtiuXmY76AAVkqdSvCex
	7WsHeVAbGqL5v9fPyF0n4QTuad8+WwnmyvaFlmrkVcVdDmmBW6DTorN5gp1UDhLrqfEyJqvOsId
	N8Nb7DOXg1h8jjyY0EoyR9g4cBmmFLT+NOjcM+GR4h2gstnRzOwTml5ujXMROBfxzeFcPlr0BsU
	cxPjqUMwoKkYolC3t+o46jm08Scf+yM2JwuCQvuYnMg/0J+3J9DbHHjRZ4crYEysIxuvIEfsNrj
	LHUzbM+jiytE8s+5QQtcFbeRi2avHnvPASJKXKttynr9T3QE+zpddPtXA==
X-Received: by 2002:a05:6820:162a:b0:6f7:75ab:f969 with SMTP id 006d021491bc7-6f775bb41f5mr1943854eaf.66.1791836471882;
        Mon, 12 Oct 2026 13:21:11 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ef02d91a5asm10237414eaf.14.2026.10.12.13.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 13:21:10 -0700 (PDT)
Message-ID: <07d36bc7-637f-4554-9d6f-039e88852dc6@kernel.dk>
Date: Mon, 12 Oct 2026 14:21:03 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/13] block: add dma-buf support for raw bdev
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org
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
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <CGME20261007014324epcas5p2a7f3b03f118c9a1d1c633fe839ed1e46@epcas5p2.samsung.com>
 <af2b48a490186edf38f1d4a5dfd9513574f7a350.1791336930.git.asml.silence@gmail.com>
 <bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 6:27 AM, Anuj Gupta/Anuj Gupta wrote:
> On 10/7/2026 7:12 AM, Pavel Begunkov wrote:
>> +static int blkdev_init_dma_buf_io_ctx(struct file *file,
>> +				      struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct block_device *bdev = file_bdev(file);
>> +	struct gendisk *disk = bdev->bd_disk;
>> +
>> +	if (!(file->f_flags & O_DIRECT))
>> +		return -EINVAL;
>> +	if (!disk->fops->init_dma_buf_io_ctx)
>> +		return -EOPNOTSUPP;
> 
> dma-buf doesn't work with PI: bi_dmabuf_map aliases bi_io_vec, and 
> blk_integrity_iterate() walks it as bvecs to generate/verify the 
> checksum. rw-dmabuf liburing test hangs on a PI enabled NVMe. Something 
> like below is needed:
> 
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index e929f94b25c7..1b7f8cbbda8b 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -3150,6 +3150,12 @@ void blk_mq_submit_bio(struct bio *bio)
>                  goto queue_exit;
>          }
> 
> +       if (unlikely(op_is_dmabuf(bio->bi_opf) &&
> +               bdev_has_integrity_csum(bio->bi_bdev))) {
> +               bio_endio_status(bio, BLK_STS_NOTSUPP);
> +               goto queue_exit;
> +       }
> +
>          if ((bio->bi_opf & REQ_POLLED) && !blk_mq_can_poll(q)) {
>                  bio_endio_status(bio, BLK_STS_NOTSUPP);
>                  goto queue_exit;
> diff --git a/block/fops.c b/block/fops.c
> index e9da48ab73be..6c6700df943c 100644
> --- a/block/fops.c
> +++ b/block/fops.c
> @@ -976,6 +976,8 @@ static int blkdev_init_dma_buf_io_ctx(struct file *file,
>                  return -EINVAL;
>          if (!disk->fops->init_dma_buf_io_ctx)
>                  return -EOPNOTSUPP;
> +       if (bdev_has_integrity_csum(bdev))
> +               return -EOPNOTSUPP;
>          return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
>   }

Can you send a separate patch? I've queued this series up for some
testing.

-- 
Jens Axboe
