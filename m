Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02B23D7F0;
	Wed,  3 Jun 2026 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520680; cv=none; b=CDt9v0Farjaf1BOfAnXKbzTbda09zXNRWgqyqS+HzB+oMsqAuaKF3Q3duhuZi3yquvTrnrZcFXvFPcHFbWiojUnpwoITQibIwvo8MO8J+WBA4RYZ7+pTySs2b985wBNteZKmoBliHRO5R11AhzIX3vXQII46njV5pVxa0jWQwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520680; c=relaxed/simple;
	bh=OnNyCBgT+yDrGAYf51n7QOQdt0xmFxcCPDHToaSqYQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4+A+V55espNHi8QyZu6n6533Gc8A35q+8XNYPtQOhkilambj3tYSR2sTcaXlEuNRehI3VhZuF5DUH4FFMakCZHIgotB825FVf53/SAq7YeBSc3ZyVjn/qAZFuNyJwdCtD0FuQ3yKiweJ+M5YiwI6hdsWkCjbn0GcXtTs7IJSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oWOK80f5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oWOK80f5"
Received: from killaraus.ideasonboard.com (85-76-49-85-nat.elisa-mobile.fi [85.76.49.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 532D4929;
	Wed,  3 Jun 2026 23:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780520653;
	bh=OnNyCBgT+yDrGAYf51n7QOQdt0xmFxcCPDHToaSqYQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWOK80f5NVk42AyHYBdVv6HxnThMV9nDTFe4Lz8x9TJIgcQx39gEwPG4Wba21/ZIq
	 OpZfxOfNncbFlxxA0m/NY4DVHvFtlhsLyyoVYSoKOU2tvFlORXXLAiZC4q4z/AFRPr
	 2KO9cDdTjYtgi60kAjVTT4fZ0jAz1fSZ2fv31CDs=
Date: Thu, 4 Jun 2026 00:04:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
	Frank.Li@nxp.com, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rockchip: dw-mipi-csi2rx: Add myself to the
 reviewers list
Message-ID: <20260603210435.GG684535@killaraus.ideasonboard.com>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>

Hi Bryan,

On Wed, Jun 03, 2026 at 12:15:41AM +0100, Bryan O'Donoghue wrote:
> As a cross pollination activity between Qcom and others add myself to the
> Rockchip list. We discussed @ Nice making reviews more formal because
> frankly we can get gummed up in not reviewing. Add myself +R here in that
> light.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8436428865aac..25e3f2cfcbf2b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25934,6 +25934,7 @@ F:	include/linux/soc/amd/isp4_misc.h
>  
>  SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
>  M:	Michael Riesch <michael.riesch@collabora.com>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml

-- 
Regards,

Laurent Pinchart
