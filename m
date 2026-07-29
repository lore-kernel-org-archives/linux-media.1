Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160954A2E38
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332628; cv=none; b=arjYPr+CJit3AGqzrxTimutSUzTKIX4ipyqL80FSVhKNI+6GaeOyIieUJAZ/bxghJspU1d6Pd7UVsRFhBdT3OlDTdwzI5CFTiouXtV7+QJmuA4pl1A9RrJSqe1UPdnWPKKLxWwJMk0H8xSJAEFzx66wzW2PIEWu+yWD9tjDU2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332628; c=relaxed/simple;
	bh=eaGzEIkYl8mhH9FJsA+z0QYzoh5FgifdmAGDyRbtefg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/6yhgEp6lhO++AA2brU0Z5cSzUvW5+q+XP3WJdLKanuItvlLo+4oree+LEz0VemN9GDx++RSN70JLmfBVtLdce/Xnx0272qypooV5rJtYLbNsx/pCQq1kSfpf2R+2c/3ZiW+x4LGmBVjd78dowCTJWboXRo8kqdLXY5J2mSa1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkB6Ju3s; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkB6Ju3s"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fe3cd5ee6so1589643a12.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785332624; x=1785937424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoC91kED98vuJAvVTLdEFxjWPhyWXTYJuu42/1RW6zQ=;
        b=NkB6Ju3sR6t/04LfYOcf1isKoRwj6gashzuQqgP16ZraPJFZ3CxthU7KB7CaDi06Uc
         OV+KK3R27aibqPqauHrjVAclLEu3h2W3M44GUXpElW0GFsm5UFqCvsfPDqjBxpg63uYZ
         DdC1vsuHvRFktDtlx5Sf6xPt4LJGvH2d7JI+99RmcX293mY8nN15zRfHQqPW5HCj5xe6
         TRTuhPfI7+U7ybhMZvkcH543PUnWZXFT+26Zq1ln1U5nH7Qu6C2M8bLp6sUsjkHprbXN
         ddgRUBujvrsDPmIv7uI7IdmFAg1DBQzp7jOr+ymhaWRkv2OB1OeAiGWdRf93WHwGf6te
         Qsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332624; x=1785937424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoC91kED98vuJAvVTLdEFxjWPhyWXTYJuu42/1RW6zQ=;
        b=nfYJsojzKKlWK/zdx/eONaRM6855NCjKn95mnPsGKHE/lrZLvx39FFe/ZNxoKXg99k
         zGirB1sfLJIylfnyXT61BGFnygvB7bYbCyaHsX3R2llAqJZEXBmmKnkNjsT/rrJ0m0TV
         L5KsGK12V6zH5P92e24Ml4Tzeka6pMumpWPpusxxrIKkrZbOPjUuUWZRPxFu1ZpfBSrj
         sL773PSWl9JMNQcjfxvfeOXOC/9UGoWiNprF4ss6nwgQfpQhOZsrsG4pLBKOsqMhK0e0
         1U+5iq4lnfMvGaE3FRNz7rj6M0EcQ1hgMA2dYCD3E8vpP+m6QxPvdqH4RvllHRwnIeE8
         S0Uw==
X-Forwarded-Encrypted: i=1; AHgh+RoLe880MJO/rX/cfx1xhQsficMVmCom0Pfz8FNaC9io3aDJCeeV66ptJ2HX/HHVkCb4J2AomIKKm6n6jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKPwQ2nDLzMOGydjXp9kvBPxbzOjGhf8Wz3jygL642KrMDjAy
	Kurh5vLXZtj3OryiG7tQxu4yPHpVTvOap7JWaZfZnX8UyO4i1E6SPVNK
X-Gm-Gg: AR+sD10kSFtgUgdZrNej8lEU9eaIXX8yj6LoTLCspYWrt7djLRNeOFSVPPYSqu3QEB7
	a3y2RYApfxRfDzDa/A9L7pxYceu70q7xQul+07M4E+fAuYk9fr7L9BwG/WRGax3PLOT2Z10Rq4n
	XRBRbCrkPq9/S/sJrRWkltyOnNlDD0zojlvlApDdF7gXtgrucwTWVFfAxH6ybEi83cTwj41701S
	qG/yy+7IB3FEqHnn5+Tl2ORphti9NkbWnAuFPvkmd+4O0wZlusVPiU1pYBvpSwxA9R10Se81V5B
	yv4kPZxh8uC5pSjBCiSgKckaDsOzmtTF0TvS1HovheSEPJfxmaeJS032onRP95KObJyq9hgcS0D
	Wfvi3/ZJlXrxes0pwOXxS/Cc+OOWBDpy3xttXM+462SiQeDo88wra4BgJ59ptuPTekiZQ8/Bpth
	UExL8ewv/luRIQf6NeF1/OoVsfEd6HfMIMKgLc40lxZ/hWeGKopUTX6JdjjsBkRBwhZet8nLO01
	X22pgHc8f+8SZHZ339oXw790VR/k7iTmrZ9bu6L1p5zo6hRoiU45ypZdnzUXsY5vSLizlEeeqPl
	htnGN9n0PQDZeMcB0cQ=
X-Received: by 2002:a05:6402:24c8:b0:697:ecb4:b86c with SMTP id 4fb4d7f45d1cf-6a034a0b240mr2761963a12.2.1785332624180;
        Wed, 29 Jul 2026 06:43:44 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:640])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c49fb5sm868560a12.14.2026.07.29.06.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:43:43 -0700 (PDT)
Message-ID: <0df2f832-e8a8-4fdd-a5b6-e08657c2891f@gmail.com>
Date: Wed, 29 Jul 2026 14:43:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] io_uring/rsrc: add dmabuf backed registered
 buffers
To: Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>, Jens Axboe
 <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>,
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev,
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <cover.1785274111.git.asml.silence@gmail.com>
 <CGME20260728213020epcas5p1721e72ba5544abf0b61482da005120d9@epcas5p1.samsung.com>
 <26dcd0ae5c87a3ada5710b14b6894ef343cec6fe.1785274111.git.asml.silence@gmail.com>
 <583fdfb2-5368-467f-a388-6d388859c995@samsung.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <583fdfb2-5368-467f-a388-6d388859c995@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 14:30, Anuj Gupta/Anuj Gupta wrote:
> On 7/29/2026 2:59 AM, Pavel Begunkov wrote:
>> +static struct io_rsrc_node *io_register_dmabuf(struct io_ring_ctx *ctx,
>> +						struct io_uring_regbuf_desc *desc)
>> +{
>> +	struct io_rsrc_node *node = NULL;
>> +	struct io_mapped_ubuf *imu = NULL;
>> +	struct io_regbuf_dma *regbuf = NULL;
>> +	struct file *target_file = NULL;
>> +	struct dma_buf *dmabuf = NULL;
>> +	int ret;
>> +
>> +	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +	if (ctx->flags & IORING_SETUP_IOPOLL)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +	if (desc->uaddr || desc->size)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	ret = -ENOMEM;
>> +	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
>> +	if (!node)
>> +		return ERR_PTR(-ENOMEM);
>> +	imu = io_alloc_imu(ctx, 0);
>> +	if (!imu)
>> +		goto err;
>> +	regbuf = kzalloc(sizeof(*regbuf), GFP_KERNEL);
>> +	if (!regbuf)
>> +		goto err;
>> +
>> +	ret = -EBADF;
>> +	target_file = fget(desc->target_fd);
>> +	if (!target_file)
>> +		goto err;
>> +
>> +	dmabuf = dma_buf_get(desc->dmabuf_fd);
>> +	if (IS_ERR(dmabuf)) {
>> +		ret = PTR_ERR(dmabuf);
>> +		dmabuf = NULL;
>> +		goto err;
>> +	}
>> +	if (dmabuf->size > SZ_1G) {
>> +		ret = -EINVAL;
>> +		goto err;
>> +	}
>> +
>> +	ret = dma_buf_io_ctx_create(target_file, &regbuf->ctx, dmabuf,
>> +				    DMA_BIDIRECTIONAL);
>> +	if (ret)
>> +		goto err;
>> +
>> +	regbuf->target_file = target_file;
>> +	imu->nr_bvecs = 1;
> 
> There is no bvec backing a dmabuf imu - should this be 0?

Doesn't really matter as it's not used. It's 1 to say that
it's just 1 contig segment, but I can just zero it to avoid
confusion.

> 
>> +	imu->ubuf = 0;
>> +	imu->len = dmabuf->size;
>> +	imu->folio_shift = 0;
>> +	imu->release = io_release_reg_dmabuf;
>> +	imu->priv = regbuf;
>> +	imu->flags = IO_REGBUF_F_DMABUF;
>> +	imu->dir = IO_IMU_DEST | IO_IMU_SOURCE;
>> +	refcount_set(&imu->refs, 1);
>> +	node->buf = imu;
>> +	dma_buf_put(dmabuf);
>> +	return node;
>> +err:
>> +	kfree(regbuf);
>> +	if (imu)
>> +		io_free_imu(ctx, imu);
>> +	if (node)
>> +		io_cache_free(&ctx->node_cache, node);
>> +	if (target_file)
>> +		fput(target_file);
>> +	if (dmabuf)
>> +		dma_buf_put(dmabuf);
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +
> 
> nit: extra newline here
> 
>> +static int io_import_dmabuf(struct io_kiocb *req,
>> +			   int ddir, struct iov_iter *iter,
>> +			   struct io_mapped_ubuf *imu,
>> +			   size_t len, size_t offset,
>> +			   unsigned issue_flags)
>> +{
>> +	struct io_regbuf_dma *db = imu->priv;
>> +	struct dma_buf_io_map *map;
>> +
>> +	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
>> +		return -EOPNOTSUPP;
>> +	if (!len)
>> +		return -EFAULT;
>> +	if (req->file != db->target_file)
>> +		return -EBADF;
>> +
>> +	if (req->flags & REQ_F_DROP_DMABUF) {
>> +		map = req->dmabuf_map;
>> +		goto init_iter;
>> +	}
> 
> O_DIRECT is checked only during registration; we should recheck
> (file->f_flags & O_DIRECT) per request.

Nobody should be able to clear O_DIRECT, unless I missed something?
And fwiw, io_uring wouldn't be the right place to do it.

-- 
Pavel Begunkov

