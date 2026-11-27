Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773339;
	b=dytjm3lxSF+JgaWsjIYm+EHUZJ/S8RDQTMmJyRWaMY2w6Ovl4+uLvx3SbBegvAGWFqpi
	 Vw1hs9ODsBlE2kBQTRdM6GgpZOa78Zi8j/1ArODgAPfFaPKxYcARrN8WKvYbY5mnis5Xv
	 EKzvpUaTauS9AGjZCmZ2UgOI4rO5d/6epBiS/Kvf5+Y4JSAYnDlJMSG28N8D1tZkmMPMX
	 d2mXgg9wdHdD059+ZsgBhgNWmFUwyfD/ByZygzU4mg+pMkFu+Hua94gUmBlKovAuUvzhT
	 v51mEhemA1E7EYrU9GDx2Ij5CPEZzE3mUjEAid3K2KpKaU8rNimZe7gPUbbde3Ei4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773339;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=A2En8s7gc8e1QOJN7yIgdC3ZHh4VMZbn4LZ/89SawUI=;
	b=I8ZfTjOqtrWK4yhB7L9XhbYi26MMZdmz5Bz7YPhII9R2qsecE9Fvar2mKt36Nps3pw9O
	 jWPgEycJQnlaVAsRF4GkNnb1iDZ+8LWkq67pbzaBiDGB8B+5ieX6CHOtf+BrGcDWdv1GV
	 yNqdMDd5rY79gmQluBtc5o1r40FSAX2r/DzxTmLXQxuvugVIXO+3HMA9l/56v8vHM/k4d
	 lT7qqFIcOG1ro+JpvCfaLT6/lShmgtdPZTjhhBGay38oIJmQpzsREOzN0W5w8wiojnvax
	 bJmc6X3NimMFE/FsvxNLk/gxovTK1Q7rTJ9hHJJmXexbfs1cs7j6JcbwWWjpEliAwXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXFzBaBk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6698606A334;
	Fri, 27 Nov 2026 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXFzBaBk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29EE1F00933;
	Fri, 27 Nov 2026 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773339;
	bh=A2En8s7gc8e1QOJN7yIgdC3ZHh4VMZbn4LZ/89SawUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bXFzBaBkeIRUYbu8+mXSz10ZllCcdt4P4XlnsrtU1HXd6d/Pnu1Jxa3qNoQhwD4bw
	 cXZp1DSA6S3KPaKg9PbC31Di1Tu33jO48BdvMubRnrJYWF66Sh5+2B0cPBxm7d7aYt
	 P/Nb3nB1JvisGQkTgNi1aiisYlhcbCiYdy/lk16mYAGXh2EUZnYBd6pRm82dYkIfrt
	 fBBVEvq3FaQw+79AkHj8sj2pR9wEZno9iW3yMHf3xoQQMoylW8ctn7KaTqDGaPiM6g
	 1KnZCL6oNj7jHXsaxmK5AcMv6TSeG8/fB7vSA07kkEttKXHtiGRE34V5+37lytadwV
	 wDNSfv3R6RjwA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Ling Xu <quic_lxu5@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
References: <20260805060940.41414-1-jianping.li@oss.qualcomm.com>
Subject: Re: [PATCH v3] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
Message-Id: <179577333662.9695.16850584437035345885.b4-ty@kernel.org>
Date: Fri, 27 Nov 2026 09:55:36 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 05 Aug 2026 14:09:40 +0800, Jianping Li wrote:
> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
> to the same dma_buf fd as an input/output buffer argument. Taking an
> extra reference for such DMA handle maps leads to duplicate mappings and
> an unbalanced reference count, since DMA handle maps are released
> separately when the DSP returns the fd through the fdlist.
> 
> Fix this by not taking an extra reference for DMA handle arguments
> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
> these maps are borrowed references, fastrpc_get_args() re-validates the
> map via fastrpc_map_lookup() before dereferencing it, so it is not used
> after being freed. fastrpc_put_args() only releases maps flagged as
> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
> exactly once.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()
      commit: d943eec5a618cef0e2ba77b799c6ee27fae873dc

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

