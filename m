Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9073C38F624
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117253; cv=none; b=SRub9exVrDyOG66shlyHOwEBo4F22SgvtgUClnSWFxhPQjJHArFP6WBmqWRXg1siZ6bBbApaDcd0r/KmG/vJtP3B/Uy+x30fI4Tca7+Reb1vktvO4xBPPQanx72M+exxcMjojzQDxIyyOiGiaYuJYfeOv470UVF0Gh7od95MmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117253; c=relaxed/simple;
	bh=WtgTMrKjdZBbdzNtpiDFCkuSxBzEPTFwDMMBQRdGCeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrNwnG6vyD0t4T6NXNckisOZPOX7sceCPBHKUnKunOO8i3SO3ajBSKfW9/jk/58fOPLVnucOQUHjWhAEqklfGTz7G/qfPcyvL5VpAquPfNRUj7OCEVxhzAFbj9ueO6DOXU8dH0orTQ+gBwsRHahU18g+tl6F2QXzn9/Vb6RPtUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MJ6Dgkwd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MJ6Dgkwd"
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B76D874;
	Mon, 22 Jun 2026 10:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782117213;
	bh=WtgTMrKjdZBbdzNtpiDFCkuSxBzEPTFwDMMBQRdGCeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJ6DgkwdXodKa+fE9FS3RCPAtldaCcrHGvM9agswjNwe4atRqglIethohqlg4WTWC
	 8YtEhqk3ynVW6Ag+uy91J/LIWqlS+KkVZtMk9M9xb7zbhvrjdkLI4hHQmPnIdHpxWK
	 G3Rjv9BJ6YYWC4DNrkL088ydjWELTdorj06ueOFs=
Date: Mon, 22 Jun 2026 10:34:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 3/5] media: i2c: msp3400-driver: Add missing
 media_entity_cleanup()
Message-ID: <ajjy32bp9BEjs_pq@zed>
References: <20260619100126.22197-7-birenpandya@gmail.com>
 <20260619100126.22197-10-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619100126.22197-10-birenpandya@gmail.com>

Hi Biren

On Fri, Jun 19, 2026 at 03:31:30PM +0530, Biren Pandya wrote:
> The probe error paths and remove function are missing calls to
> media_entity_cleanup(). Add them to prevent memory leaks if pads
> are dynamically allocated.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/msp3400-driver.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
> index 4c0b0ad68c08..d977a6039e6c 100644
> --- a/drivers/media/i2c/msp3400-driver.c
> +++ b/drivers/media/i2c/msp3400-driver.c
> @@ -812,6 +812,7 @@ static int msp_probe(struct i2c_client *client)
>  		int err = hdl->error;
>
>  		v4l2_ctrl_handler_free(hdl);
> +		media_entity_cleanup(&sd->entity);

This driver really seems a relic from the past, but if you want to add
media_entity_cleanup() to it, there is one previous error path after
media_entity_pads_init() where you might want to do that.


>  		return err;
>  	}
>
> @@ -865,6 +866,7 @@ static void msp_remove(struct i2c_client *client)
>  	msp_reset(client);
>
>  	v4l2_ctrl_handler_free(&state->hdl);
> +	media_entity_cleanup(&state->sd.entity);
>  }
>
>  /* ----------------------------------------------------------------------- */
> --
> 2.50.1 (Apple Git-155)
>
>
