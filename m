Received: from sg-2-5.ptr.blmpb.com (sg-2-5.ptr.blmpb.com [71.18.227.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD42F7F17
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 03:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629179; cv=none; b=cZV/f7NATXsBGTrUxD+0idoWWVsIGpoy5U1qGyTAFgrPfhx6FqnNoNl4i0B/Xaj5RwTT1r5OmqEqAX7wrSXogN/Lz97v7GNKrt8jCGH3uY6x7GWVL99H+bxvrIOyNjKHVvk0MCVVoX6raK5dSmQ9mELXNFadGo9SZgyDJ18De+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629179; c=relaxed/simple;
	bh=KyeS0SDcE3Bs5HQCPRYmOSKliuLOrUpXolia3R9lWoA=;
	h=In-Reply-To:To:Cc:From:Mime-Version:Content-Disposition:
	 References:Date:Message-Id:Subject:Content-Type; b=qgKcMxfat7qshct9xelzCbJwSzR7RuI5zUbvtcLfBQiKw4PUwgS6XmH5RSB5ewZhVXWkurTpGfLIWtMn/0pYUwUnnmjqj6ynsrmyMXNjoWZgoAPqDCdp6pRL03mV8iDJepIzu6wZaiRzBNCh2Y0Id0334TIqfhIyNu09MbSiaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=GsW53+CE; arc=none smtp.client-ip=71.18.227.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="GsW53+CE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787629170; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9hGIWtKmuPfKNxU1ZrkJYDJd8jXk6hvJToJtt6nustk=;
 b=GsW53+CEXQ/zc7IosBW0GUpnji4YbbMqON41Cw6p0EG/Az0bJm7aUeGbnD/pp9Vd4qhD8U
 TvG+tnnJDHJm65aREJZX4g4c5XnGqqdC0QUEZpoTVQxfxb2Qs6EMyH77WI+K33m0IIkVcn
 +/5FEFV+0Yfrpud3YieAOtU4alb1hO6CrV8+lHDDc4RfFdcFaaJUaQYK6kYGlHB/3Ll6tm
 wABxEb+AFcl6CWDHDSuUEOV2COHUUGtb8kqblvKWV+Bjs/1A0PXun/yQu+qQWX7QJyz99H
 dr6zJaPxn3srEHM1vG+zaaLvPQj98bBP6sh5RFbCHaaSKRBzMOXWJ19SGPSkSw==
In-Reply-To: <aoz1dUszJJv80bkj@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Content-Transfer-Encoding: 7bit
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: "Shengzhuo Wei" <me@cherr.cc>, "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>, 
	<imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>
From: "Shengzhuo Wei" <me@cherr.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc> <20260825-media-timeout-work-v1-1-ebfebbeb6c31@cherr.cc> <aoz1dUszJJv80bkj@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
Date: Tue, 25 Aug 2026 11:39:14 +0800
Message-Id: <ao0OYhW1YOtnWMdG@pve>
Received: from pve ([111.42.148.52]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 11:39:17 +0800
X-Lms-Return-Path: <lba+26a8d0e66+0440b1+vger.kernel.org+me@cherr.cc>
Subject: Re: [PATCH 1/3] media: nxp: imx-jpeg: cancel task_timer before freeing ctx
Content-Type: text/plain; charset=UTF-8

On 2026-08-25 10:56, Ming Qian(OSS) wrote:
> Hi Shengzhuo,
> 
> Thanks for the patch.
> 
> This use-after-free has already been fixed by Fan Wu:
>     https://lore.kernel.org/lkml/20260623103031.3051-1-fanwu01@zju.edu.cn/
>     [PATCH] media: imx-jpeg: cancel timeout worker when streaming stops
> 
> Regards,
> Ming
> 

Hi Ming,

Thanks for pointing me at Fan Wu's patch -- I had missed it (it is not
in the 7.2-rc6 base I worked from, and I failed to check for in-flight
patches on the list before sending). His version is also the better
one: placing the cancel in mxc_jpeg_stop_streaming() closes the
re-arm window that a cancel in mxc_jpeg_release() leaves open, which
Sashiko also flagged on my 1/3. I'll drop that patch.

The other two patches in the series (hantro watchdog, mtk-jpeg
job_timeout_work) fix the same class of bug in different drivers and,
as far as I can tell, have no equivalent fix in flight. Sashiko raised
one real point on the mtk patch: jpeg->job_timeout_work is only
initialized on the single-core path, so the unconditional
cancel_delayed_work_sync() in mtk_jpeg_remove() would hit a zeroed
work struct (WARN_ON(!work->func)) on multi-core variants. I plan to
send a v2 that drops the imx-jpeg patch and guards the mtk cancel
accordingly.

Do you see anything else in the remaining two patches you'd like
changed before I send the v2?

Regards,
Shengzhuo
