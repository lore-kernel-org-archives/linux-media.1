Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633923B584A;
	Mon, 18 May 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096319; cv=none; b=YqmYiwCyP/N9VdVilh2bNAlDGRxYhzutE+aqfyOizO0ZDI6wgJGjO1N5CLrj8b2CViKMRk55rO2t3Wanien9wbLGNOXvZCDh5fRl+y0c36+vy8qz1swR0M60ZbHRfAxQqDBMNnpVHC52ZvTCv3PyO68M6E5gqdsWDeWf+09yGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096319; c=relaxed/simple;
	bh=wynAuqrakYL+/x14eZJMcrGSf/NygpxlDix0/zRbqPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zo4E0r0BPvrepszafnFlXqxkTlYyJMd5YwVuVwlkcRJCLVFbJNzaItfx1HJNlJ1jhO5nNSO0Cwm2rYzgHLujZkOj8bTecryTrbgLiBKeMDZjwEQ1bUTPPj1MtPIryb8kgVoAmYiVkMf2rRIvwm25ny8lqvvcfr/6Cs6t89V+ogg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=sk20GFlc; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="sk20GFlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1779095792; bh=wynAuqrakYL+/x14eZJMcrGSf/NygpxlDix0/zRbqPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sk20GFlcJjHaYzyZ5ZzSJnvCE4g3kwUeyo47/um/pFFjFtQeaxpyuXobq4ocneVE6
	 xEi7RbjocGxkX34kzFhFQyzfj1R9XnwSGKfYF4DyD4qgtVbAKd6PexFD6LOpfZDg4E
	 DvvqfiV0ETNoH8+zmLbjy2tkRB6AHud3rGXZBi8uPmHK1gdLw+mRmkaSk7RdCEZKkS
	 NEYBga29jI/ap1hEbd9P+OC2sPrCFkKwdPTNsav0OpSqx2F0IMg+V+bEa6W8k2co7o
	 U84eTkuFdiwP6grC17ueI2DgJVb0wbau9yvHDPHBPik7nrXPWi1DWm6kMkfnstV7nQ
	 jXjVYBofcI2hA==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 51AC840ADA; Mon, 18 May 2026 10:16:32 +0100 (BST)
Date: Mon, 18 May 2026 10:16:32 +0100
From: Sean Young <sean@mess.org>
To: Alessandro Baldi <baldovic@virgilio.it>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imon: Add iMON VFD HID OEM v1.2 key mappings
Message-ID: <agrY8P7oYjUg7dZu@extorris.mess.org>
References: <20260517091415.3080-1-baldovic@virgilio.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517091415.3080-1-baldovic@virgilio.it>

On Sun, May 17, 2026 at 11:14:15AM +0200, Alessandro Baldi wrote:
> Add Vol+/Vol-/Mute panel button mappings for iMON VFD HID OEM v1.2.
> This version differs in the codes that generate the
> KEY_VOLUMEUP, KEY_VOLUMEDOWN and KEY_MUTE events.
> 
> Signed-off-by: Alessandro Baldi <baldovic@virgilio.it>

Thank you, patch applied.

Sean

> ---
> 
> Note: this is my first kernel contribution.
> Keycodes discovered by parsing USB packets with usbmon:
> - modprobe usbmon
> - cat /sys/kernel/debug/usb/usbmon/1u | grep Ii
> Tested on Thermaltake Mozart Sx case with LibreELEC media center.
> 
>  drivers/media/rc/imon.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 9bb27ba82..049a73b5f 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -290,6 +290,10 @@ static const struct imon_usb_dev_descr imon_OEM_VFD = {
>  		{ 0x000100000000ffeell, KEY_VOLUMEUP },
>  		{ 0x010000000000ffeell, KEY_VOLUMEDOWN },
>  		{ 0x000000000100ffeell, KEY_MUTE },
> +		/* iMON VFD HID OEM v1.2 */
> +		{ 0x000000000a00ffeell, KEY_VOLUMEUP },
> +		{ 0x000000000b00ffeell, KEY_VOLUMEDOWN },
> +		{ 0x000000000c00ffeell, KEY_MUTE },
>  		/* 0xffdc iMON MCE VFD */
>  		{ 0x00010000ffffffeell, KEY_VOLUMEUP },
>  		{ 0x01000000ffffffeell, KEY_VOLUMEDOWN },
> -- 
> 2.34.1
