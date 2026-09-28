Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E84DA9C3
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 19:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623740; cv=none; b=nZMerqPTv6joAA8bU+ho6nQ/qJVV8pwr4DJdHqvVW63YtUB2vwN3mIOkQw1xqSEeZsyCCUO50HiGbtc4phWnEOrNG1X8VeYaQc7GbXMIp6DEYiTJ5atw8gVCKppZnf5kdoh/QJuIowE1XxIO9xZg40wdfhG70xuOB2zGrjcIt78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623740; c=relaxed/simple;
	bh=6GdeS5J1nAEzAADIZpXQl1fwy/uaoTDl+7jyHikSKZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=cbi7LHmeXg+fOYqwXkf6OTLckGvd2iE86ivg1pOgcN9gbfLRc4VwI5o6ztl+N0bwxdM8Tcn/b1iKS9aHJCQXIU2lyVDbRS7DdY4fFQ8gscTb5DxCeBwZJazzWCkswzLmv60jIFRtAqCRyA5Ngl/qiJLRmuLvUzhjL3qRMO8Ty44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=YcUpAmOf; arc=none smtp.client-ip=95.215.58.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="YcUpAmOf"
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6GdeS5J1nAEzAADIZpXQl1fwy/uaoTDl+7jyHikSKZc=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790623731; v=1; x=1791228531;
 b=YcUpAmOfqJTgUK4bL0o44Iu2boLVx6GhQYzm07LXlkz2rycFcrmJ22DcFH84h/YoWVOl+sDP
 kriEwplZF7XaDfIH9/VV5f+LxhtCUwIoOUWmtSVhCfRerSXsfH7DBfjEK56FLCICOndgGx0shE0
 +AEx7x5L5NjgeAeYR2/3c7qqTpajrl83ow6UqyFfln+DwhIdLr2zS8ZDsZ8btojS/sJGaE3F/4A
 WsPcoTptlXR2F/CDYGhcQ+Fwvp9AT0vVi4sJQEa/yc9X3NKtN2GyNhyZ9z/XId/v9/WVUQof25g
 lR1GAA+cNlqpzkiSgqKi8U85tTkFN/34zzYPB9FVCfVMg==
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a3187ec75891e86d;
	Mon, 28 Sep 2026 19:28:51 +0000
X-Mizu-Trace-ID: a3187ec75891e86d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 21:28:47 +0200
Message-Id: <DLR74W1U9YPC.375IK0HOYHDIG@cknow-tech.com>
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, <linux-rockchip@lists.infradead.org>, "Detlev
 Casanova" <detlev.casanova@collabora.com>, "Jonas Karlman"
 <jonas@kwiboo.se>
Subject: Re: [PATCH] dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL
 kernels
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <20260907020015.24719-1-kmehltretter@gmail.com>
In-Reply-To: <20260907020015.24719-1-kmehltretter@gmail.com>

On Mon Sep 7, 2026 at 4:00 AM CEST, Karl Mehltretter wrote:
> Commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG
> kernels") changed the default of DMABUF_DEBUG to "y if DEBUG", but no
> Kconfig symbol DEBUG exists, so the option has had no default since.
>
> Use DEBUG_KERNEL, the Kconfig symbol for a debug kernel.

I wondered why since 7.3-rc4 when playing videos I got a WHOLE lot of the
following error messages, which weren't there with 7.3-rc3:

  [drm:rockchip_gem_iommu_map [rockchipdrm]] *ERROR* failed to map buffer: =
size=3D0 request_size=3D3956736
  [drm:rockchip_gem_prime_import_sg_table [rockchipdrm]] *ERROR* failed to =
import sg table: -12

Both come from ``drivers/gpu/drm/rockchip/rockchip_drm_gem.c``.

The value of request_size varies sometimes; I see ``request_size=3D8294400`=
`
the most. When playing a video (with mpv with v4l2request functionality, bu=
t
I think that doesn't matter), I see a whole bunch of these errors and then
it stays 'silent', but I get another stream of them when I resize the windo=
w
(ie I'm toggling between windowed and full-screen).
It doesn't take long before dmesg only consists of these errors.

The 'playing video' is likely important; when I just start sway I don't see
those errors. It's only when I start a video that those pop up.

My kernel (config) is based on Debian's and that has ``DEBUG_KERNEL=3Dy`` a=
t
least since 2008 and due to this patch/commit, ``DMABUF_DEBUG`` got turned =
on.
When I explicitly disable ``DMABUF_DEBUG``, I no longer see those errors.

Whether that fixes or just hides a problem, I'll leave that for others to
decide.

> Fixes: 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG ke=
rnels")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> This enables the dma-buf debug checks on every CONFIG_DEBUG_KERNEL
> configuration, which is what 646013f513f3 set out to do. If that is too
> broad today, the alternative is to restore the previous
> "default y if DMA_API_DEBUG".

My 0.02:
That change landed in 7.0-rc1 albeit it didn't have the effect it intended
to achieve. An -rc1 version seems like the right version to land such a cha=
nge.

I'm not in favor of this just popping up in 7.3-rc4 while -rc3 did NOT have
that affect. With an -rc1 you'd expect major changes, but in this case I
accidentally stumbled upon it while trying out something else.

Cheers,
  Diederik

>  drivers/dma-buf/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 7efc0f0d0712..e4f078a326a4 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -43,7 +43,7 @@ config UDMABUF
>  config DMABUF_DEBUG
>  	bool "DMA-BUF debug checks"
>  	depends on DMA_SHARED_BUFFER
> -	default y if DEBUG
> +	default y if DEBUG_KERNEL
>  	help
>  	  This option enables additional checks for DMA-BUF importers and
>  	  exporters. Specifically it validates that importers do not peek at th=
e
>
> base-commit: 986c24e0fe44f844b44d365b71ce831947f50298


