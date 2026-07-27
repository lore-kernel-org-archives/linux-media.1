Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097402BEC23;
	Mon, 27 Jul 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160396; cv=none; b=WjOamdSmTRI1Rk6XPETwmgEq+vJRe5qRl9tmH3hHgoJ4ppXevQND4JOxq36oF3fgQ4aYCmwmQeYFKKemBGdwu+0uRMW/dASqO9TTuAqVfSrhX8P5LOQLMsBkijDWBNGjt8E5eQHRiTCG268lB94w7lfAGub8gjx9ZKcdOBJvXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160396; c=relaxed/simple;
	bh=/TCh8x2TYxA2455/IRZVdOopfzo+R5t6P0XZ4dojGps=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U/zDmdOrQztpdosY6JtV+KRUNRmFd2KcTwI37Vbu0kO8+6RDh9qIsjezaggoAbxqXpTK/cPeXeqhDut/B1eCQkmarjzONhjh97QnQqm3UAtC6bUJq4lsPV0HGk4cBvcZscq5ZhEcr/yuTlfqX+oGBBqWQ/Wcdp7wqXdCAfNgoUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw7IFxE4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw7IFxE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F38B1F000E9;
	Mon, 27 Jul 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785160394;
	bh=/BR47sFY02rjyaFgQpLpWrbsp2d8UGcBlVd/bchzIrY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Iw7IFxE45Bj5UdZJOadM+BgQ3cYFvi2unUDh382kUCJhdJ/mZoJbxcz2wqlI2x+Ix
	 BiKpgy8hOzFv1595WZMfmm8djURcdaNgr2j1nqrwpwl4GRaPNbPkRgIL0Nipcu3Yii
	 sCfVVrdEJGvnX+ZKeOmmK32kIlE0Xsm9Y21z6XqssviqARhfO95f4+VlhzhYpC1tU5
	 O+MEy+ApQX0c3q+yusMquxtMNFU5JMJS+26vUwbFrlaTZfXHJ5o3gJv+F+MiFnx0Pr
	 f6IQTGwThBvA9jOJH1hL/f1SIBB3TmJ76ExoaO4j1HVh3gt/qyec3zS6Gr6o+0j1k2
	 KY2rWTriVjVSw==
Message-ID: <6decf51d-137c-4230-b823-64e61d76d0b8@kernel.org>
Date: Mon, 27 Jul 2026 15:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3 00/13] media: stm32: dcmipp: add support for MP2x pixel
 pipes
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
Content-Language: en-US, nl
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alain,

On 24/07/2026 18:13, Alain Volmat wrote:
> This series add support for the main & aux pixel pipes
> available on the MP2x. In addition to the byte pipe
> already available, the DCMIPP is able to process two
> other streams in parallel, including ISP operations
> such as demosaicing, exposure etc, post-processing operations
> such as cropping, downscaling and various pixel formats
> output.
> 
> This series introduces the whole DCMIPP pipelines including
> static configuration of the ISP part (such as demosaicing).
> Dynamic control of the ISP as well as statistic extraction
> part will be added on top of this serie via usage of 2 other
> video devices (input & output) for statistics extraction and
> dynamic ISP parameter injection.

Since this adds a new subdev, can you post the output of
'v4l2-compliance -s' for the MP2x?

Just to be certain all corner cases have been handled.

Regards,

	Hans

> 
> Changes in v3:
> - Rebased on top of kernel v7.2-rc4
> - Fixed most of Sashiko review points
> - Link to v2: https://lore.kernel.org/r/20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com
> 
> Changes in v2:
> - Rebased on top of kernel v7.1-rc6
> - check-patch minor fixes
> - replaced kzalloc(.., sizeof(..),) with kzalloc_obj
> - Link to v1: https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com
> 
> ---
> Alain Volmat (13):
>       media: stm32: dcmipp: share struct dcmipp_device among subdevs
>       media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
>       media: stm32: dcmipp: bytecap: protect CMIER register access
>       media: stm32: dcmipp: move common structures in dcmipp-common.h
>       media: stm32: dcmipp: correct swap in YUYV data with parallel input
>       media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
>       media: stm32: dcmipp: introduce a dcmipp global media_pipeline
>       media: stm32: dcmipp: add pixel pipes helper functions
>       media: stm32: dcmipp: addition of a dcmipp-isp subdev
>       media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
>       media: stm32: dcmipp: add pixel-pipe support in bytecap
>       media: stm32: dcmipp: rename bytecap into capture
>       media: stm32: dcmipp: instantiate & link stm32mp25 subdevs
> 
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
>  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
>  .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 600 +++++++++----
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
>  10 files changed, 2344 insertions(+), 285 deletions(-)
> ---
> base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
> change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
> 
> Best regards,
> --  
> Alain Volmat <alain.volmat@foss.st.com>
> 
> 

