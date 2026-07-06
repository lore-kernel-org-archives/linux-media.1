Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E73D6CD5;
	Mon,  6 Jul 2026 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320627; cv=none; b=YbIY2TtCb1VjqLjIoJtcKKfjpsDqqGQWZg7rRvL+oPFYdAlFjcXjodOEbQAfl+YQBu/sXN5sgOwjQCA8edsujCc/fmH17uHHBzP2qBBo35pue3ZW3Iwgz+pDw3bXS3tHXshOQMwYHZTkjs++yRey7jRh2JWL6ddz/Q1IBqDdVKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320627; c=relaxed/simple;
	bh=gv72N4jyO7adOmDcrW+eaCs/1XXqvAAR2PEfDvP7t3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttM2WerKKIH7u7P/rQhnOHC+6v8P0S2qfaTGNnYVY+r7tcfy2IGjd+dwQ8gxJj1YtEFWm6uhsCmg3BzcEXS739nASZI9fR1WXe8ynbdqB0D3x7rJ6dQBFGgAgLQiJYHqf44poHSUGhUZeDcSQe4V2XiapecO/lw+GR5YymlOVko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INOnzt4t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INOnzt4t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E051F000E9;
	Mon,  6 Jul 2026 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320620;
	bh=MBcKvaitl6TGKL/fg12umkfFHChEJFVRuFuHd7Ccm5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INOnzt4tSmE/dVljgT+XcA6lbhwyBP1xun90kstroUCflGF5BhkiCaHIWf90V0ERE
	 SpgABeN5sE8ZVwDCvMJm3gjPYN3MPdRIoIgqJb+ilBy0sF2JSEuA4rbU37vte0NAJN
	 XwzSKQ45QdF3c76tUCyK1IHxE0zv68FmmlGNsLUgztP4/hB5DQ/XYXKrRcVL9IrAr6
	 alUNpCJLlLmaUIgteZZqUuglxVMFgTPtGU5Cj4G8ZvBRWIfSKwGkfet3o1YGpdEi/E
	 HBnhLEhHiBok2FaYXLeI5PIQgKsF4UhsBGA44elzdUIpLH130SRvoJlaMsaacmtvL4
	 /k6oj4VzzBeFg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgd9l-00000001d97-3Qv5;
	Mon, 06 Jul 2026 08:50:17 +0200
Date: Mon, 6 Jul 2026 08:50:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix SCP device refcounting
Message-ID: <aktQKf4QrsnUADdf@hovoldconsulting.com>
References: <20260704173119.254975-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704173119.254975-1-lgs201920130244@gmail.com>

On Sun, Jul 05, 2026 at 01:31:19AM +0800, Guangshuo Li wrote:
> mdp_probe() first tries to get the SCP handle with scp_get(). When that
> fails, it falls back to looking up the SCP platform device with
> __get_pdev_by_id() and then reads its driver data.
> 
> The fallback lookup returns the platform device with a reference, just
> like scp_get() does. However, the fallback path currently drops that
> reference immediately after platform_get_drvdata(). The driver later
> still calls scp_put(mdp->scp) unconditionally from the probe error path
> and from mdp_video_device_release(), which drops the SCP device
> reference again.
> 
> Keep the fallback reference until the existing scp_put() call, so that
> the fallback path follows the same ownership rules as the scp_get()
> path.

Thanks for catching that.
 
> Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")

This one should also go to stable:

Cc: stable@vger.kernel.org

> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
