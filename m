Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A82ED846
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200645; cv=none; b=LH+1RsdJrkhSF/g1SHfS+lRGuIOFxvLgnF0mWrfKPoGz/PtIdwTZ4/FvPXGjmDVBKwog9qLd0Ytgo9kbbYl9wx7urcj5BmeMtIuPw72ZOIYk4JteQsr9Udjc1y2X3ze3urSuBFCSDTS9lUECgqrD6FZGjk4+I76oQIZ+hKh9umQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200645; c=relaxed/simple;
	bh=taqXgGjc3EHBKDogDJs054tZE44eM0IevFOvtuusVUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV1xKxXIsCW4QK7btmEBbAfvvLqs3g1m8RBlsZVywNqdgGlAVg8zUhHOkuXs8tXELWOaYociSNxBs3+griOBJQCsnyY++CkWNckXPHDoelezLa1Y0F/+6OIGXaPWFDuL+wls3bw+uXBS4jVYd0ZE8P1r92CkPsBR8+Cz143bIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wPLMT-00045f-0g; Tue, 19 May 2026 16:23:57 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wPLMR-000mGr-3D;
	Tue, 19 May 2026 16:23:56 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wPLMS-0000000HKRP-1wfC;
	Tue, 19 May 2026 16:23:56 +0200
Date: Tue, 19 May 2026 16:23:56 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] media: i2c: isl7998x: inline
 i2c_check_functionality check
Message-ID: <agxyfLuFArQ464Ea@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260517172034.3033-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260517172034.3033-2-thorsten.blum@linux.dev>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sun, 17 May 2026 19:20:35 +0200, Thorsten Blum wrote:
> Inline the i2c_check_functionality() check, since the function returns a
> boolean status rather than an error code.

Actually, i2c_check_functionality() returns the boolean result of the
comparison as an int. It's better to treat it like a boolean, though.

> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/i2c/isl7998x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index 5ffd53e005ee..96702c5eaa35 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -1460,8 +1460,7 @@ static int isl7998x_probe(struct i2c_client *client)
>  	int nr_inputs;
>  	int ret;
>  
> -	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
> -	if (!ret) {
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
>  		dev_warn(&adapter->dev,
>  			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
>  		return -EIO;
> 
