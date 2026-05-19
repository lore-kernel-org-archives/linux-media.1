Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A428C009;
	Tue, 19 May 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218679; cv=none; b=LObEpoM1bnDJMuFiUnppHbWMKKi71S/iRdvvW6taM8KEUV3XkJIH3qr9faasJH8KQDmCcqcKU74g01YwRvXYhCFoCb7nFdULUangjaGqeSYGmVfGAePVHXCGLAi980knEx/cmrDyRcvd0FD2U8zIc+2xUDnXeEEnSdjDROyIk4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218679; c=relaxed/simple;
	bh=4W9H5TirYcNMdoWuptAbNQYW5W4l+R182+H0sH2uJl0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qr+Myt2QtgL1QIryYKiu72acIr46VLSrIDx0raD2Xtei8n1fWURTe8fqJDTk2eJA8YRhy6uwsOgA98qL6NtsKhSKuZeQGqSd9mWrG1RRHEEgDvbiTddHl7FsN7sFgB1tZ79wty7n/gKmQ9JigLvvqYDwaOCwiE2KRcSYlNKZmVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7DqJ7/i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7DqJ7/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376FE1F000E9;
	Tue, 19 May 2026 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779218678;
	bh=yv7JbQZguButNzpYtCWbO9Ae1KllyxN9b7DdTwhG6BM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=W7DqJ7/iVjuPba8QROwlH488uUn23PpZzzeDOub7yO2KfsiQdEsOq8vqRFSA+S7ay
	 wGRIm7NgwSQG1ueqq7psFr0hZ1TPiWsPscDWgS6e+4W6ztwkfJZxUX/haHIjgg5Wv+
	 HvMB0XWf66SLr3xYHY+2AoYffpkSsCBdx4kO7GNMPYYnBV/eTKgUuBPvOjx7yP6/9y
	 sgTqNQ2uKOKo/wlyi9lDoA1wexLJ0eIX8ZCNYRS2VSoFImwaRUcP/OJIVwZGnJMsoH
	 Os1ENyreADDDJwfcTQM5ZN7TcR8U3eJknTtMPFHbwoCvyPLljBB9NjkOnavFhCD5ty
	 OG0Yc1E0jgGzw==
Message-ID: <ffb33b7a-f3a7-42d7-a3bc-45b48d9120e4@kernel.org>
Date: Tue, 19 May 2026 21:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v8] media: pci: add AVMatrix HWS capture driver
To: hoff.benjamin.k@gmail.com, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 kernel test robot <lkp@intel.com>
References: <20260519161218.79385-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260519161218.79385-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2026 18:12, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> Add an in-tree AVMatrix HWS PCIe capture driver. The driver supports
> up to four HDMI inputs and exposes the video capture path through
> V4L2 with vb2-dma-contig streaming, DV timings, and per-input
> controls. Audio support is intentionally omitted from this
> submission.
> 
> This patch also adds the MAINTAINERS entry for the new driver.
> 
> This driver is derived from a GPL out-of-tree driver.
> 
> Changes since v7:
> - remove unused g_ctrl, s_ctrl and queryctrl ioctl declarations

Ah, no. I don't need a v8 since v7 has already been merged in our tree.
I just need a follow-up patch on top that removes those unused declarations.

The next branch in our media-committers tree:

https://gitlab.freedesktop.org/linux-media/media-committers/

contains the patches that will flow into the next kernel version (v7.2).

Regards,

	Hans
