Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C763D890C
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182432; cv=none; b=XtimNey2KxjhlHatlO/lfeJOUwR4R0abwR0rovtDxTxwGUJmE8dMen5GSSb9PdMewQbAIzNGUU4krBJmmtzyHGyXzTEASQMKRXC6WzLANAtuz7iso0GvCuHX4F5T4svJwV/9WFEZEA3hCLAMRWFxDgGLRoR3sUNp8lz9hk8wBt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182432; c=relaxed/simple;
	bh=y56vd30Wr7TcmwqX+oaJan1jX2dTu657n7x+TmtkUhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YoH8MswMxPK0Z8uewjwkP/7CfqcKuCOQzkHHJYgxaRVYV6GTSAhadU9gK8ENHUo0wWIZLtyWWP9TEiBFByae7V+Rhzk2Vth/+Mx8f7Krr3HR4DqN8MTqykEihF2ExPaLzX0Kz6krIrHITh9FyuoJVnaGzlAhLRboSEqsDJDjMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzV39hIl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzV39hIl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso3778625e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 13:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792182429; x=1792787229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jqtp5LPxF0IFxOJfCVzAQN6SnoPJKqsXWwttpYr3O58=;
        b=ZzV39hIl2wZ5t4+xNme0Bdr4ZRSqcxYYp7uYS/7jVGDaPVG56tesxN+MpnElQJ83Ji
         Bo32FnMX6PPJFG4KUd2yqMIoL2jQdqPoVLY5ex4O5V+oVQjqXvd6tncc8p+Hvs1ynp1U
         b/OO5hhlfFGHM2FKoIRP8JRte64tpEzf6QdUa3H/MmuPXyZMUmV/tQAtaVclWRln/AOJ
         tmOgWd2FisXi892ym76ZuCdI/Ywb2Q6OOyLKu5oxfMw1Ck3qlNdi3BS6QIA4RkslXXTf
         uzD1O9DIwWCjpSpw/VHcHqCK2sU/ULbd1035+Npq0oLMVfyrI7Nk8KrpPg8It45X6Gzp
         ibhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182429; x=1792787229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jqtp5LPxF0IFxOJfCVzAQN6SnoPJKqsXWwttpYr3O58=;
        b=BDWnBsq336MN5yCCUGsj0TKTurxcjqQtIFO58sSKFdsGLsoc0iD8JNCH0jqZgjB8LZ
         GVw/03TwUFhwT271ZcbHG62fUiGn1/KryDKeVr2wrCuFLlsTzerjXArI8/LpIx31f684
         jEIiZvQGdVBzYQ2H+UDUjRgd9AZfNqgl3C5FqPEndtgPXL3roXOl2XSk0YN1LXHGsaIV
         c4keHIXYWx2H9UoXBjnhvBLi9y5S8KYFH7QdeeCuo2rv6WOs0TyZuJgEv5IVxLx9CMQ7
         lPm29SHNMGvRXVTSQG6wSFHLrOkKps9dQfIxKPiozOt0zPE8eKPViYJAJssDqRRHnGiU
         TZ0w==
X-Forwarded-Encrypted: i=1; AKwUvBxgoVr4snfKN45kpavsgACQ9kUJPatYmOtuVbsi+F7EUOobURr8awR5uJUC7fgluQFyy/QOkY1Fwn8MiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJkkXzu2v7dTc2YfK4BGZso0CTiFEbhJKjZwXQhsZzjoKzE4qfD
	qP7LU4nFsLtSBlfwE6feaVNHWF2hFHp7lhyEBvZYG/82sh1KYWkEKUIQ
X-Gm-Gg: AYBFou0vmhcULsA2Ru7HWyYzjowwD7F0gBMo5sjB9DiGJzjFq1UsWNZh4n9Y0kb1XoU
	xk6M40CL3g7QqQZb/2ggGNSyXsCPhN0+XxLTz9FDcvfwJBJoJujofHbYT1DlZKuyvnA35I/D9Gv
	gCbMWD/WhMUr4WYzS517EOolFqSD/GLs7wc/6WqBx7UlyN4p2KyU1wh9lUfv7f03CchRKDpFBPz
	wyj2Mh9qr4No9GmqbGj5M9vjTNN4oBJkh5zfu95zxUYG83sNt0AB9x7ggfFM7Q4uE1i7i4o0238
	246qgVKEokwWwiBV0tfmaqbehDvnhCx3NutKMOijtdA8dX87pq9KNeF/PUG4NY5wcMUeD1IGeSU
	TUu4Kbv8k1jGrFtNFoS/6v7sZqwBEvvkiiNL9ZH5krnMW3Ty26QZ893NzSQFqGrSQVILYDa7KGc
	6ybYBaYgaM/GypTHbtfEI6RMdBLNsJvlvPYaf86AdOxTKT8BzuT4b/CwnLqY6jnHY9xARNd3aCw
	QCMtczEoLdPx9X0INQa02EW8dlBec31yz9Ct2OBe/TqFbEbso1M6CBrUHuQ3QvAgzQwwFkMp+E0
	PAAD1fg0sDp7PBg/D2/45XOhByimzP2oGRHZAtkhF1cnuuFD4ssmcgZIOh16PC8onibgSl8ZpMq
	n0Q==
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr19553895e9.24.1792182428699;
        Fri, 16 Oct 2026 13:27:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d7659805sm22421075e9.7.2026.10.16.13.27.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 13:27:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alistair Popple <apopple@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 03/26] dma-buf: Add dma_buf_mapping_attach()
Date: Fri, 16 Oct 2026 22:26:53 +0200
Message-Id: <20261016202653.97339-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <3-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com> <3-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 17, 2026 at 08:11:34PM -0400, Jason Gunthorpe wrote:
> +	match_args.attach = attach;
> +	if (dmabuf->ops->match_mapping) {
> +		ret = dmabuf->ops->match_mapping(&match_args);
> +	}
> +
>  	attach->dmabuf = dmabuf;
>  	attach->importer_ops = importer_ops;
>  	attach->importer_priv = importer_priv;

I may misunderstand the intended contract. match_mapping() runs while the
attachment is still zeroed and without dmabuf->resv held.

Patch 11's amdgpu callback needs importer_ops and importer_priv, so its XGMI
match cannot work here. Patch 12's VFIO callback asserts dmabuf->resv and
reads priv->vdev, which cleanup changes under that lock.

Should the core initialize the attachment and hold dmabuf->resv for
match_mapping(), or should callbacks avoid attachment and lock-protected
state?

Thanks,
Karl
