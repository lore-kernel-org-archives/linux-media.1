Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6548C40B;
	Wed,  3 Jun 2026 21:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520627; cv=none; b=X1DYPrMg50JwwiuHxh9Rl1oXGffMrcs40HctLIydiN3zA1OX2raj1PHGaTAcGFzvbFSUZK1dfnskyzlehlvknmDYbnJLguAI1OWkhjJXcjGQ/NHphALQ56WysyGKcm8+E8q3+oGGn48aMp2/2KpDY1G4q5QSFOUbmN386jKUHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520627; c=relaxed/simple;
	bh=Qh8JVJEqqOrKs/oC/ar18xvMh/aqtyyQ2AL7JAgDG3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZDEV6aiIEA+01AX8wgtr5z3R/UfR3kt56J0FObKgq6SYjAGi7Hz6pVVrq7BcDULPaPR3AlwJuCu8Osfy08/O/i9wWn0Elw3UroCE5YaP4zTtEoofhCSyM6PNzCT18ufaOAfmSOTsemRUOKfh/h4ZPGrYzM2kAPUF4Dqa4TYppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d5S0ATk4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d5S0ATk4"
Received: from killaraus.ideasonboard.com (85-76-49-85-nat.elisa-mobile.fi [85.76.49.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5338929;
	Wed,  3 Jun 2026 23:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780520598;
	bh=Qh8JVJEqqOrKs/oC/ar18xvMh/aqtyyQ2AL7JAgDG3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5S0ATk4/AW12c/IG1wth1dAqMpoCs7HywhCu4s6MBvPjsyUlSJi4xtc3ptod6CDd
	 YMh8ni+VdV/VZIHNvcSlTJ0bVypU+mpmMDH7NtGe6hFYwpuw+VZHWc6pZtyonQn3wB
	 43iPT6mCF8uNAfsbiM74ODjPiQO3bVxyhVW2hb8I=
Date: Thu, 4 Jun 2026 00:03:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
	Frank.Li@nxp.com, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Message-ID: <20260603210339.GB684535@killaraus.ideasonboard.com>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>

Hi Bryan,

On Wed, Jun 03, 2026 at 12:15:40AM +0100, Bryan O'Donoghue wrote:
> At the media summit in Nice this year we discussed that cross reviewing
> from different people on LKML was lacking and desirable. Laurent suggested
> NXP/Qcom do some cross pollination.
> 
> Happy to read and review NXP stuff in that spirit.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Thank you for volunteering.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e50..8436428865aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
>  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
>  R:	Rui Miguel Silva <rmfrfs@gmail.com>
>  R:	Purism Kernel Team <kernel@puri.sm>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	imx@lists.linux.dev
>  L:	linux-media@vger.kernel.org
>  S:	Maintained

-- 
Regards,

Laurent Pinchart
