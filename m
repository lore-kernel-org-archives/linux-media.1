Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38F32D7FF;
	Tue,  5 May 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985399; cv=none; b=ggpDvMadyCtthmBrqKc8jHgYazy8K9cOutyvNOXWWE3PTu45siFvHhUXUo/4d822HLYj70mfE9iA2GhOG/5wi6fHGhv7XfXFnA5q3LZ85WoOZ2hepYhFUdGbtTshu3XWkaV68jVxQ1Y9vXNlbjt2bVHeNR3poVwO4YozPYsuVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985399; c=relaxed/simple;
	bh=L/4GGOOFt4rtjaCNpGcKVSPms8rNL5zZIUfkl8iSijM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fq1zx39Rr/Ru5ERnxaYEIFA9IpK6i/Ulhpl91X4m2PcgKpTFEayjIaNeKDXnqSukGirqAOhGf+Qi6yoOkgKvFfdt2dLyBJLTuQEkdghDmr+ulCNIfW9TwiVd9VsjgyyP5PPp+VINOajTbl7qdI9NhDG0ikbwiXmEWlqOqShOEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=IzlUt7Tf; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="IzlUt7Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1777985396; bh=L/4GGOOFt4rtjaCNpGcKVSPms8rNL5zZIUfkl8iSijM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzlUt7TfMUUbPpIkH/VQDPKNx5GAIyOx25hyT3quLDFQM2akkXiDO4YLCyff6yXXA
	 Uy3nUfRgq0f69eBF1r0T7/GskWx3fTMra00/fuZxqHb2i74uBcyj3BJ/4EdMtEgl0V
	 yq7UYp/u+5j63wCU7TkkqCNXGzPwoD82AFhvhBJr2qhIN+5VSPMo8ZLOq35gCUNtRO
	 bglscsY0IzTROFENN1oBPf+paGAuByS4/qGsqk/XurRa2FeVKsrxuuy7D36+defPDx
	 Vgk1RuoxKh4nBLLOd2hSnVa2vb9seD0P1cQkuOCEuVD6zsvuKHz6ZV/5w3ghjbKM0O
	 ZTv+7NLKtjKhg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 32F0241CDC; Tue, 05 May 2026 13:49:56 +0100 (BST)
Date: Tue, 5 May 2026 13:49:56 +0100
From: Sean Young <sean@mess.org>
To: Wenyuan Li <2063309626@qq.com>
Cc: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>, gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn, 23120469@bjtu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] media: ivtv: ir-i2c: check I2C transfer errors in
 get_key_adaptec()
Message-ID: <afnndDiYeNmHEjTE@extorris.mess.org>
References: <tencent_820AAE865CAC3FB7596055F016FD7503210A@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_820AAE865CAC3FB7596055F016FD7503210A@qq.com>

On Sun, Mar 29, 2026 at 08:41:28PM +0800, Wenyuan Li wrote:
> In get_key_adaptec(), a command byte (0x00) is sent via
> i2c_master_send() to initiate a key read, but the return value is not
> checked.
> 
> If the transfer fails, the IR chip may not receive the command and the
> subsequent i2c_master_recv() may return stale or invalid data. In this
> case, the driver silently reports "no key", making such failures hard
> to diagnose.
> 
> Check the return values of both i2c_master_send() and
> i2c_master_recv(), and log errors using dev_err_ratelimited().
> Short transfers are converted to -EIO while preserving existing
> kernel error codes.
> 
> On error, still return 0 to keep the current behavior (no key
> reported), but emit a diagnostic message to aid debugging.
> 
> Fixes: e1e2c5756563 ("[media] ivtv: Add Adaptec Remote Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenyuan Li <2063309626@qq.com>
> 
> ---
> v4:
> - Reword commit message to improve clarity and rationale
> - No functional changes
> 
> v3:
> - Add correct Fixes tag
> - No functional changes
> 
> v2:
> - Add error handling for i2c_master_send()
> - Extend checking to i2c_master_recv()
> - Use dev_err_ratelimited()
> - Clarify error handling behavior
> ---
>  drivers/media/pci/ivtv/ivtv-i2c.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
> index 28cb22d6a892..c011f2246add 100644
> --- a/drivers/media/pci/ivtv/ivtv-i2c.c
> +++ b/drivers/media/pci/ivtv/ivtv-i2c.c
> @@ -138,11 +138,28 @@ static int get_key_adaptec(struct IR_i2c *ir, enum rc_proto *protocol,
>  			   u32 *scancode, u8 *toggle)
>  {
>  	unsigned char keybuf[4];
> +	int ret;
>  
>  	keybuf[0] = 0x00;
> -	i2c_master_send(ir->c, keybuf, 1);
> +
> +	ret = i2c_master_send(ir->c, keybuf, 1);
> +	if (ret != 1) {
> +		int err = ret < 0 ? ret : -EIO;
> +
> +		dev_err_ratelimited(&ir->c->dev, "i2c_master_send failed: %pe\n", ERR_PTR(err));


get_key_adaptec() is called from ir_key_poll(), which already logs errors
with dev_warn(). Other i2c key handlers simply return an error and let
ir_key_poll() log the error code. That's better than duplicating a dev_err()
or dev_warn() here.

> +
> +		/* Preserve existing behavior: treat error as no key */
> +		return 0;
> +	}

Simply return the error.
> +
>  	/* poll IR chip */
> -	if (i2c_master_recv(ir->c, keybuf, sizeof(keybuf)) != sizeof(keybuf)) {
> +	ret = i2c_master_recv(ir->c, keybuf, sizeof(keybuf));
> +	if (ret != sizeof(keybuf)) {
> +		int err = ret < 0 ? ret : -EIO;
> +
> +		dev_err_ratelimited(&ir->c->dev, "i2c_master_recv failed: %pe\n", ERR_PTR(err));
> +
> +		/* Preserve existing behavior */
>  		return 0;

Same here - simply return the error (or -EIO if rc >= 0).

Thanks,

Sean
