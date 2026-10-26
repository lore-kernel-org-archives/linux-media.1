Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001808;
	b=BLUpVVCkUey+tLAWFlRjezFEByTtORCyY4P+jB9XjG+2fE+MIiHmAma7ZnIa+axMI5Mf
	 LboIdud05+7tQCrKzIRPBRAwuKNLMLZZpgMSw2eEDCnBWR36Y0lGeDysNkoS8vUUeYP1U
	 3KONWln2uD1yRy2OlUHgjHX8NovFCrBgZGDDC9GDvs6HFdO7359oGVBnaQE5LFJa1ztiz
	 ZkDVIh/7fVBLoL1LoqQijjXE/Zu8KJ9/sbYjD2F6rZIY/l4dsLIXaaNfPxoQWxYEFW7Qk
	 egntNzcOsDDtSkff6PbnkaGWj9Rok+pvyRJHYUSZCdxDMKk5Tc5juE8N3557Fomk+/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oue2gY3N148Z5QjebnGzECChsQECIfu8P/sF36ovlgA=;
	b=iQGRAKzszgrA118lRyCfsefv07pSK5ui8j5FBvW7tYAUyjkua9EAyZsK/SoE+TTGu3a0
	 NVMnZZ/DtLNDB8PoUsSH1XHZfqV7J8+2rt/K9b/g8xZnw6PQXzM8wufIFtoJlYlTA8u9V
	 hwDUlSadlH78sA3Qj484ILkZVhHek/2iCEG/NR4zvz2qN694Ity2JizmKCJVvEu5gVntR
	 2geo4K9wRjhbvfDrx4bcwQGB9f0GUuHDLBL7HGccKA5zLgvnZR8sHnqTd0hd96K/SwmfX
	 tiK1oCWDhk0khoSyoSHLJlDu5Wydmf6GyEErAdAaYVCBqlz+uOqEi3WN5EnBTbptO9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF1606A31E
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 08:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFCF1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14137485e9.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 01:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793001806; x=1793606606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oue2gY3N148Z5QjebnGzECChsQECIfu8P/sF36ovlgA=;
        b=bC638255INWrPGEz0y4VxyECSaE1+RFwT0AYvc57JZMnX/SDkH2oYoQlp72ynZKxQA
         09imCDi3xA5Wxyz96Q5/B+fO67UzULiZJuMTb9xIJe4Qac/NjbBvoWY1D5+Qmq6ERYQ1
         ZFS7ptfkGN6W6kgUD76g35ultPKI3Mn/+cgreu7FkFJ2k0W16L7i8kfiTy8CwbVazJfc
         2p5DDHzw6V0BVn6v0rpVZCSd6WDMjFyze/50hKPWV5GT2NJ70rtCbkeUXzJU3Tt90+To
         JlBd6INSJAx0qJMl9u7FX/1KF6i6I84SmGVSG1eu523g0VcXNZ48mfUbTefcone1dpDU
         0JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793001806; x=1793606606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oue2gY3N148Z5QjebnGzECChsQECIfu8P/sF36ovlgA=;
        b=04cCOvpH6HoCFUo//R+sC5V0NrjyQI3PCHpd8Nwd9wRkqBNBqXPB41LTq9XHPzH1hG
         VFr+XqJp8pZMZEsxqzbVb77v/WcYFBsp6F3p0mGlFX1FTH/HMRCl2kD4lNa71uBpv0kz
         J4CXai2FhcWZNvqd3y4lOzy3wMcKGKqAIKZV0DE8kC9W1eOap31syeTcjM/sZ55uwd/P
         2FQnpU5gr5Zgwmu+oJw7UFtphb98716yyIv/uqFvxqkH4J1ws1i4ybpr6gQqma9htOoF
         KUT//N96VMU609PjOt2UnSNA5p+ctg7+OVD5t0/Hig6HUJbmEi02EoNJ2vkAGLbPWeEW
         ODfA==
X-Forwarded-Encrypted: i=1; AKwUvBw6G8WosaISUL23zw06vyl5DDXB8Lkt9AQHATxhdoMkBLs8HKz63FmdUzPf4sGs4gwZIYcitkZKrf4vuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLS4lwx/PrvCMAwDmY17wgMyPu71mGAc7DWQUz+BBGnG0/y1Ehf
	nDZ9Z+fsyYEsMIlVRVoov9Tl8srWNV73AGxmg1zaydxCh8R1a3luLWTk
X-Gm-Gg: AYBFou2Z9E57qsXd6FT4c8i0hgBvwyqNIfsXVSkqjiwHAiZTsMgMShArKElqpfGeQLP
	d1ML4HWjhdeIKN8Gt1tGXR2BK6xw8jPTzkbAyZ0Th2HMF5TzjqLFmy92H0dMqphnRRvfJe7fMH3
	POuls8EiW4KJSAw/V/772ffY4277VW1HCZPvpREkNyDT3omG6cNABSPF/x1t7YEo15miqAmJeXR
	tMRHZWd1Nv4C0BuV4fBbstETLKT4su8rZOLk+ubcFrrdWnCpMXfKA6XA8JQUMYbuwvzS2jiUarC
	HPvWNxX5OgUHMcB2au0GHyTA6/oR/hk9YI5UhVpJGHJy6mtbFt/C2/x3HNQz0ugivcr00mdIsEa
	Ww18KJ0Rqdxi2TzBK1Oy0PrScxnyAVFt1QmqOKCTIhYOgxdclqkJCm+IeVHgVJepOqd7LuOrQbx
	oLbSB4d7PtpdhLyb6zQjGPkOOcNWSKeGfCrjmRN+gyRPtQ0rKyZH6jK3xRTtFflz5IOS+RVgA2a
	KCy0giPwJICX+7rpSA+bdMKlWrjqvKmOgiBFGy5+klp58XNS6PsGZ4VITWKlPPy/Bh/EYZ4K0K3
	xZz3MYPhdMire05T6+qB4Wo5YvVMTDre1abBzTvBBcjk5yFNTKGfzmJJMdhEnV7rMHjQ7Ynuig+
	wAbpJG5eZjALQAZV+k381VYbTT71YG6qqLAwffsIKBellyO/in9chwhYid80f9A==
X-Received: by 2002:a05:600c:3f12:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a47a8dc6e6mr85645335e9.11.1793001805868;
        Mon, 26 Oct 2026 01:03:25 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b1a4-1201-5c78-89f4-99d8-70d7.310.pool.telefonica.de. [2a02:3100:b1a4:1201:5c78:89f4:99d8:70d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm473163315e9.1.2026.10.26.01.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:03:25 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:03:22 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com, 
	sumit.semwal@linaro.org, jgg@nvidia.com, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Dongwon Kim <dongwon.kim@intel.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Felix Kuehling <felix.kuehling@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-rdma@vger.kernel.org, 
	iommu@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com, 
	treding@nvidia.com, jhubbard@nvidia.com
Subject: Re: [PATCH 05/26] dma-buf: Let the exporter select mapping type at
 pin/map
Message-ID: <at8IQZ34wkHQ_5PL@gmail.com>
References: <20261026053623.202642-1-apopple@nvidia.com>
 <20261026053623.202642-6-apopple@nvidia.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026053623.202642-6-apopple@nvidia.com>

On Mon, Oct 26, 2026 at 04:35:56PM +0100, Alistair Popple wrote:
> +struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> +					enum dma_data_direction direction)
> +{
> +	struct sg_table *sg_table;
> +	int ret;
> +
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ret = dma_buf_mapping_select(attach);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	sg_table = __dma_buf_sgt_map_attachment(attach, direction);
> +	if (IS_ERR(sg_table))
> +		/* Nothing was established, so the choice may be made afresh */
> +		attach->selected = false;
> +
> +	return sg_table;
> +}

The map-failure report from Sashiko [1] reproduces with a KUnit test
against the full series:

  pin selects B -> map returns -EIO -> selected is cleared
                -> retry selects A, with the original pin still held

The exporter pin count stays at 1. Preserving selected when it was true
on entry makes the test pass. Patch 7 needs the same fix.

Could dma_buf_mapping_select() report whether it made a new selection?
Then the error path could undo only that choice, without dropping one
established by an earlier pin or map.

On the Sashiko failed-pin report:
("Because the attachment is not pinned, the exporter may migrate the
buffer elsewhere without invalidating it")

I don't think this follows from the documented contract.
select_mapping() requires the exporter to keep the recorded type
servable and invalidate before an incompatible move. That obligation
still applies if ops->pin() fails.

Is retaining the selection after a failed pin intentional? If so, this
can be added as a test documenting that alongside the map-failure
regression test.

Thanks,
Karl
