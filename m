Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4177B3E2AB7;
	Mon, 27 Jul 2026 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147274; cv=none; b=loztCaRQXSiyhX1G/tDGirp6/q+LILpeFsNEUM1i+4VWnnRDpkEs0d7E8IknoY5XlxdJtnguz4bWGJ8M7x+pBD+keuSy9qDGw/xlVbJWJpZplKIg8/q7w6DtyfBkpLiNvy19ucdEqpSDBrz6bNO2bbB8AzIaRidZNz0tStfK55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147274; c=relaxed/simple;
	bh=Ntd5Jqh08/pKgg9Y+6n0eBJkuEeRrXD3ocBTfgJ1xq8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J/9ZkxMELxVK1iQ++zOz5jpyxjHsvcOtIHC87gREoPym6VY0Ks/HqMe6gwe+TYnZTOkkIeUS7rqavWnbXO9jau/RNn2JJVix77CKRsAszAPmfICpO9YyzqjIw3PR42wEMndkTVPbkmMTNyr7hlFKq6LQ17/C9+dwYzLGdkupw8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiDbVMeX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiDbVMeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB5C1F000E9;
	Mon, 27 Jul 2026 10:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147272;
	bh=7JNzZ4r8edu0aCfB6UFQwslfNxmssFRuUoUJ4uLDrI8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=DiDbVMeXWEW1uQvKTOXFd1/W0svBE8jefN2dZSVsRBpYKys5C8Ry5iTgCeFJV21a0
	 /wK1EWVQWGAOAmLGmP4SoE3D0bwuhDa1Zh7pYM5fV82XXnVF6MSBocXVPsrGFRv+dT
	 1euSroISRUa7nnIP7vOKX7/ZKNBmfDOrBOk5DpTY+UqDJX1NC5TZ1sqXDCzn8t/hP5
	 L2eyT+KwDsJoMsl7Wm+FZ8HHHLaquYjdtRNNCQzcH7WXvg56aUsyQ4oTSyoBcXtXln
	 2GhYxMpBQw1hHfF4U4Jq7D0SZksb9CTzGSzfhn32zbqUydPbRz1EgItWRwgeMFT50G
	 ys+t0chg7AxAA==
Message-ID: <b50bb723-b421-410b-b514-badc8fbaafeb@kernel.org>
Date: Mon, 27 Jul 2026 12:14:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 02/17] media: ti: vpe: #include
 <linux/platform_device.h> explicitly
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
 <9f2e0e001eec087f00ac2c5af2de2e8f6d0978c1.1782808461.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, nl
In-Reply-To: <9f2e0e001eec087f00ac2c5af2de2e8f6d0978c1.1782808461.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2026 11:24, Uwe Kleine-König (The Capable Hub) wrote:
> The driver uses several symbols and structs defined in that header. The
> header is currently included transitively via
> 
> 	"vip.h" ->
> 	<media/v4l2-ctrls.h> ->
> 	<media/media-request.h> ->
> 	<media/media-device.h> ->
> 	<linux/platform_device.h>
> 
> which seems to be on the lower end of the scale between random and
> reliable.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Link: https://patch.msgid.link/453257c9fa32acc4ab5b3e4c3b010244966a7b9d.1782682124.git.ukleinek@kernel.org
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/platform/ti/vpe/vip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
> index cb0a5a07a3d4..e56a95f53ea9 100644
> --- a/drivers/media/platform/ti/vpe/vip.c
> +++ b/drivers/media/platform/ti/vpe/vip.c
> @@ -16,6 +16,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/workqueue.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/sched.h>
>  #include <linux/mfd/syscon.h>

