Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1734404E
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 04:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771822772; cv=none; b=qgmNHIY00DQcFNLMFVre6UwCmxdE5P8sgGo2TBuF7hK85YWB43tCeVsTePEPtDmc/TYMXgH9zhhLRZu7Ytj7u9UZ0X6Tn9VhAweApdDUoFVKgsRQx1HNbowvQlXEWcQ0N7MkwHgHUVN27MnF8yKEMcZ6bEykAs6Dzq5ESwbuww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771822772; c=relaxed/simple;
	bh=LEFPyOaZEpHZmLXlHJrYQGoiUUQMfjxNFS9DsEDVwfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFfPwTNXlOXEgxQO3s52i55TrtjadWl6HlIkqHQt24kg+ItmgJRZTOFiQ7qO20WN5/ZcKPWJQAUPJnAY9rXtJJBa9U05P+dpiuFDfHdaa7mwvFCG55aujBZ2dfCbngsN6lowWM6VWo78/8Uu1MluxowAJ+2O63DvM15S+m609xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsRko61U; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsRko61U"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba64b5a53aso3554910eec.0
        for <linux-media@vger.kernel.org>; Sun, 22 Feb 2026 20:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771822770; x=1772427570; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ar5KC76tgxYX5PKL9eOkCAkUY5PVkOEvBMJNrWwerKw=;
        b=CsRko61UrOS/LBnAhxuT+TWf8AuTTluYnyJBxljgNtgtNuGG9boFKJoaOwN4c3nkpx
         O1FhxiGi7tpK9YS062HKjOmg71nrE4ULTFC0rWU8gkgL5ovwFceONVcnsbbVyCZEbtMO
         /ACAjgFK/pzoRzC9YU5WQCND9Jr1qDUCfSQUHBnVKOPtyvfWmbDMSVcH1eSf0LH/GBTw
         d8NHME19BnqWxpQKf3Fj+ue6cKIw/IDhGdqlE75mHMBNJZm4KOkHl1Yptx6Dw1sa59H0
         R+uNyoHztlcytswgQPvkUhBR+lpL7T11kJ921W5ptoS+Ww6vmbNH+bNNkprR49e78kny
         f9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822770; x=1772427570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ar5KC76tgxYX5PKL9eOkCAkUY5PVkOEvBMJNrWwerKw=;
        b=GzP5UxUh27cBO6xxYcZ83EPLOTFcJlTNbWDmj/tFZBsJdk6iGO8KXRvAnsWvNogSFi
         LpmAZSdEwvQz9RlKJS7pyqjj3O5IbayBsTJZXZXAJBvklAzggJWi+Ha5KwdotPTCJSZq
         /hoH3C0oRVjaGkMc3ifVaBMg60s5KA28/kyflHWlK969gjptwgNiLUJJJDfeaSU6JIHZ
         J44Ev/LVbN/1o+T38+Ft3qPYmVJH6TyJHgVY9tJEMtNye5kKN0K/5DhDfkwgsxuP/mgo
         65YO6ydYYJltX7sexJFu17W5TzmUAKRozY9lR78HuFr4de7zLn5+yFQyheFhOLkhetuc
         0r4A==
X-Forwarded-Encrypted: i=1; AJvYcCWFBaww6qVZ+lVe1n8ilOCuLTJjgVxfKHxKDI8l6FoPfnZUw7O4zlNLmSyTXVI0iWB8TH3hDAj4t4NsaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuap51/prxvYlHrq4eHnZ1UEIvlvlLmdQR7PWOXRYIY6JV3Ypc
	TLZOM8lTS+rFEVAwdobjDbHBIMW5PlnYowFYF0DuCIvayWP2KRe/hS7q
X-Gm-Gg: ATEYQzyvdXoIO/z511CP3kxIkUIw58wq8qRFCuvgFwiDAFGiAf7UXm4HAojBlyth7A4
	I0xp+e7EhxAIoZtCkniECteoXDDvgeTpl8/dQTNM0GKZfkfXnKMnlCwHsDGjccDmb38ynFBHsEl
	JUi0G4NPQilzSx2AeraKC4v4PSD7kgDtJKUd2aFu64fnTLR7qTilNogw9xoc1WSAwEFFYJWR+9Z
	n7325Wnn1ZMHmAzMWOSgre1MMIYgXtsaXEFC9VKRxgWgjro8YTR9pNw8g/GhXxlk9yx1tEYLAkV
	LtCEXEecY5QgkMajQumof24Hd9emD1qqR6Q9dOMCzwP1JWlt1wbRBy8FDYS/aADlKaOTv5/S7Qb
	mZrqlmP2coD0tkxEzyMJ/zClvS6FE31HG73TA4L7WAHwOqTPY2Pj+KQOPXKbNvUaQgOKjZ+es7Y
	bso2sjg6tiQA1RoY3+mPNoxCGK5p1kSjcbuiHf
X-Received: by 2002:a05:7301:6783:b0:2ba:6b03:90af with SMTP id 5a478bee46e88-2bd7bb4b383mr3387725eec.6.1771822769743;
        Sun, 22 Feb 2026 20:59:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da4775dsm4300363eec.2.2026.02.22.20.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 20:59:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Feb 2026 20:59:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Edward Srouji <edwards@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next v3 2/3] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <716e8a8e-e4e0-468d-9314-10082c2bbb8d@roeck-us.net>
References: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
 <20260201-dmabuf-export-v3-2-da238b614fe3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260201-dmabuf-export-v3-2-da238b614fe3@nvidia.com>

On Sun, Feb 01, 2026 at 04:34:05PM +0200, Edward Srouji wrote:
> From: Yishai Hadas <yishaih@nvidia.com>
> 
> Expose DMABUF functionality to userspace through the uverbs interface,
> enabling InfiniBand/RDMA devices to export PCI based memory regions
> (e.g. device memory) as DMABUF file descriptors. This allows
> zero-copy sharing of RDMA memory with other subsystems that support the
> dma-buf framework.
> 
> A new UVERBS_OBJECT_DMABUF object type and allocation method were
> introduced.
> 
> During allocation, uverbs invokes the driver to supply the
> rdma_user_mmap_entry associated with the given page offset (pgoff).
> 
> Based on the returned rdma_user_mmap_entry, uverbs requests the driver
> to provide the corresponding physical-memory details as well as the
> driver’s PCI provider information.
> 
> Using this information, dma_buf_export() is called; if it succeeds,
> uobj->object is set to the underlying file pointer returned by the
> dma-buf framework.
> 
> The file descriptor number follows the standard uverbs allocation flow,
> but the file pointer comes from the dma-buf subsystem, including its own
> fops and private data.
> 
> When an mmap entry is removed, uverbs iterates over its associated
> DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
> their importers are notified.
> 
> The same procedure applies during the disassociate flow; final cleanup
> occurs when the application closes the file.
> 
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Edward Srouji <edwards@nvidia.com>

When trying to build powerpc:ppc64e_defconfig:

ERROR: modpost: "dma_resv_wait_timeout" [drivers/infiniband/core/ib_core.ko] undefined!
ERROR: modpost: "dma_buf_move_notify" [drivers/infiniband/core/ib_core.ko] undefined!
ERROR: modpost: "dma_resv_reset_max_fences" [drivers/infiniband/core/ib_core.ko] undefined!

The code now requires CONFIG_DMA_SHARED_BUFFER which is not enabled for
this platform.

Guenter
