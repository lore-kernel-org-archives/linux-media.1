Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01F407CF6;
	Mon,  3 Aug 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762916; cv=pass; b=s0l2d574xt+j//D4fBvod6YwC/lT9QVRgNzwB/nI7G5241+wfjPbYtku+ibBAJyRd0zlRJIpKsxqLyh5P2WHbmGQluBawBlnVyTb/Bkpth+uduSqWInY7Yjb093MC7hPnwmkqAxoCcfuaO84zqjBvnzOJLw8lvPxLNs5ye3RNjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762916; c=relaxed/simple;
	bh=E5i/OCLxCnnaM4FE9SIzvEwv2OAkZ42s7cSHFJEfbFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcXSGGcg+3CYuGG4EgQyMN4C/Nt+ZyaHl7Lm/ITN2O5WqTs7b+n4yEJmnF6C2+wM0pQ6v+K33xIxKQDccMYvD07VQs8NkEUxI4qLy/uuXmjSxH9bAk9lwwaNO6QmgnLHvOPQgla4wxIqaVXS8q02bK5FSbGD79LLEV8djHQ7ujI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=AmgTJA6O; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="AmgTJA6O"
ARC-Seal: i=1; a=rsa-sha256; t=1785762902; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DkZgs3k/rQrblkWL7CgXOPkplJBH7VooOyJV638Y81bSnEJLlpeyjl/fZhSoAQvSSAn77NzCetqec6qgpYvx6l2MgQDeJ9XptMHpc05q24kiv8GoYVkTHvhmWkEiGjUWcGF+L92v5j+P+0tIVinNqzX0p1d2B149U96cp0wEVP4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785762902; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w8p7l9KDyqpQM0h8N7+U6sGCOQfMifyQ98119lXli7Q=; 
	b=A2bepPLdYzWdsUTwsF4hOdNR5dFGXwWMwdqMspywP1EUC4JTpny9A3I/6pob55UDC4hk1HEupxHnpoxTyRsaM9+dISWAr8s2k/6iP6PqYAaUna6Sqmj0gcyUWPUDT3g2G8J7wq+oY2Qy1+fo4IRVqBasdqL/g7A5wILXWYeivaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785762902;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w8p7l9KDyqpQM0h8N7+U6sGCOQfMifyQ98119lXli7Q=;
	b=AmgTJA6OQ8qRlG/Kq+1Vxr5UrIKs6zmE9lytT5HG0B5/QTzDQTpyjj9qvJtAau3G
	JLhB0zVAVKZY39rACXp0AB1wQWpEGvE+rDBryD1MVG8Ck9Eq4ZnEC6ZVSEFHEvWR7TI
	mH2vJo0WNQb7blKdnmzCxT7KnmT2W8Zk4Kzgd0QY=
Received: by mx.zohomail.com with SMTPS id 1785762900286286.4522001800068;
	Mon, 3 Aug 2026 06:15:00 -0700 (PDT)
Message-ID: <3c62ce01-e052-490b-a61d-b134a3b3b8fe@collabora.com>
Date: Mon, 3 Aug 2026 15:14:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx415: Fix control error handling
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731125542.293895-1-ahmisaranrao@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260731125542.293895-1-ahmisaranrao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Narasimharao Vadlamudi,

Thanks for the patch!

On 7/31/26 14:55, Narasimharao Vadlamudi wrote:
> imx415_set_testpattern() accumulates failures from cci_write(), but drops
> the value and always returns success. Return the accumulated error so V4L2
> reports failures to userspace.
> 
> The VBLANK path also returned immediately when programming VMAX failed
> after pm_runtime_get_if_in_use() had taken a runtime PM reference. Break
> out of the switch instead so the common pm_runtime_put() path is used.
> 
> Fixes: d5df1c7f3f83 ("media: i2c: imx415: Convert to new CCI register access helpers")
> Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/i2c/imx415.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 0b424c17e880..c3b22b238ea0 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -686,7 +686,7 @@ static int imx415_set_testpattern(struct imx415 *sensor, int val)
>  		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x01, &ret);
>  		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x01, &ret);
>  	}
> -	return 0;
> +	return ret;
>  }
>  
>  static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -720,7 +720,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_write(sensor->regmap, IMX415_VMAX,
>  				format->height + ctrl->val, NULL);
>  		if (ret)
> -			return ret;
> +			break;
>  		/*
>  		 * Exposure is set based on VMAX which has just changed, so
>  		 * program exposure register as well

