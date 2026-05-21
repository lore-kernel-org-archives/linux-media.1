Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EDB37DAAD;
	Thu, 21 May 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364486; cv=none; b=emN+YWvaBikEOQN0UZCHtfmkkrWGxSDDHBV6GOuvgNS/Fvc8V7NdNPdDlBNqwC0PkaLmgMllFkTBZxISxS8c3/rhvDD9w+M4XvVVt+1T9jslwraUJY0fFApoFbGb4A51zP7PMOqwCW6/R851cdXsp7nB2Tv8ZaGIBpUb2axcjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364486; c=relaxed/simple;
	bh=8njcoAK5ZcmielngQCv946Rx9JvOi4kNsn6SKuC7QLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7SPZWDjZeyadzLYQKMUrWaZkrBMCWMrf2ozMmzslXm9THp6HMPU5f0M68bm4tjT3nHLxmn5D80nZj32GQImR/D9cm88ryBCRUP356CDNFoloG6ytmoVd4Lb5jXo1wDxK9MxBxTVP8i6MlJuOdqM0XBUtIBi86ANHKlS4sYxRz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzvzRj1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzvzRj1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724561F000E9;
	Thu, 21 May 2026 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779364484;
	bh=vdgcnrs1cNHhDQfHkBD3F2KXqzLos0onnjN5eObbKJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MzvzRj1/Ap+XqH85Rq3LmLGdPPDoXrwKoypYeXF1yAVGwiEWIvVTD3mV8G3oQDutf
	 bZjmKFbv6q74nL9jB4a7IGQxmhrhyAXMSfiMDOTnmpjCnkqeK3YIfC4k6Y+YnFbMvR
	 4r4LDxAcpqCVsYUT0W1eaNQw58DDCJmNewLLElQAUR6bqxb7WtQTxL/ORc/Xo7GIKV
	 8xllVdwyjF8T4z0oXoW3F6VZsTAa60BahrtKkyGQ5ABPTIJ3XylwRgVNfFSNrLXTyp
	 lvL4wXH06yp/qc+Mh8M4BzpcZXyJTHsM1cPW0WTt1bFy2vLJgt2v1KqtNqpMi28Juo
	 08WqfqD+uWPEQ==
Date: Thu, 21 May 2026 13:54:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jens Axboe <axboe@kernel.dk>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC on the pseudo filesystem
Message-ID: <20260521-dilettanten-klarzukommen-9351cba40c06@brauner>
References: <20260520214350.168689-1-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520214350.168689-1-jhubbard@nvidia.com>

On Wed, May 20, 2026 at 02:43:50PM -0700, John Hubbard wrote:
> The dma-buf pseudo filesystem dispenses S_ANON_INODE inodes via
> alloc_anon_inode() but never sets SB_I_NOEXEC on its superblock.
> Since commit 1e7ab6f67824 ("anon_inode: rework assertions") in 6.17,
> path_noexec() warns on exactly that combination, so an mmap() on any
> dma-buf fd trips the warning:
> 
>   WARNING: CPU: 11 PID: 121813 at fs/exec.c:118 path_noexec+0x47/0x50
>    do_mmap+0x2b5/0x680
>    vm_mmap_pgoff+0x129/0x210
>    ksys_mmap_pgoff+0x177/0x240
>    __x64_sys_mmap+0x33/0x70
> 
> dma-bufs have no business being executable, which is the invariant
> that the new assertion is enforcing. Set SB_I_NOEXEC on the dmabuf
> superblock.
> 
> Reproducer on a CONFIG_DEBUG_VFS=y kernel:
> 
>   make -C tools/testing/selftests/dmabuf-heaps
>   sudo ./tools/testing/selftests/dmabuf-heaps/dmabuf-heap -t system
> 
> The selftest allocates from /dev/dma_heap/system and mmaps the
> returned fd, which trips the warning without this patch.
> 
> Fixes: 1e7ab6f67824 ("anon_inode: rework assertions")
> Cc: stable@vger.kernel.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Perfect, the asserts are paying off. Thanks!
Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>

>  drivers/dma-buf/dma-buf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 71f37544a5c6..d86a99d7b8dc 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -216,6 +216,7 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
>  	if (!ctx)
>  		return -ENOMEM;
>  	ctx->dops = &dma_buf_dentry_ops;
> +	fc->s_iflags |= SB_I_NOEXEC;

While you're at it, also raise SB_I_NODEV. You're not creating any
device nodes and this is additional hardening.
